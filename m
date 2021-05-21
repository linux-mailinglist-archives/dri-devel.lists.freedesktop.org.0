Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C126B38C666
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA22F6E12E;
	Fri, 21 May 2021 12:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186846E12E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 12:22:33 +0000 (UTC)
Date: Fri, 21 May 2021 13:22:11 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-Id: <ZCIGTQ.7N0RYBI1A3DH1@crapouillou.net>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-sunxi@lists.linux.dev,
 Philippe Cornu <philippe.cornu@foss.st.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Le ven., mai 21 2021 at 11:09:54 +0200, Daniel Vetter=20
<daniel.vetter@ffwll.ch> a =E9crit :
> No need to set it explicitly.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/gpu/drm/imx/dcss/dcss-plane.c       | 1 -
>  drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c   | 1 -
>  drivers/gpu/drm/ingenic/ingenic-ipu.c       | 1 -

For drivers/gpu/drm/ingenic/*:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 1 -
>  drivers/gpu/drm/meson/meson_overlay.c       | 1 -
>  drivers/gpu/drm/meson/meson_plane.c         | 1 -
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c           | 2 --
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 -
>  drivers/gpu/drm/stm/ltdc.c                  | 1 -
>  drivers/gpu/drm/sun4i/sun4i_layer.c         | 1 -
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c      | 1 -
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c      | 1 -
>  drivers/gpu/drm/tidss/tidss_plane.c         | 1 -
>  14 files changed, 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c=20
> b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> index 044d3bdf313c..ac45d54acd4e 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> @@ -361,7 +361,6 @@ static void dcss_plane_atomic_disable(struct=20
> drm_plane *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs dcss_plane_helper_funcs =3D=20
> {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D dcss_plane_atomic_check,
>  	.atomic_update =3D dcss_plane_atomic_update,
>  	.atomic_disable =3D dcss_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c=20
> b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 8710f55d2579..ef114b6aa691 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -772,7 +772,6 @@ static void ipu_plane_atomic_update(struct=20
> drm_plane *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs ipu_plane_helper_funcs =3D {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D ipu_plane_atomic_check,
>  	.atomic_disable =3D ipu_plane_atomic_disable,
>  	.atomic_update =3D ipu_plane_atomic_update,
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 389cad59e090..62db7349bf6a 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -786,7 +786,6 @@ static const struct drm_plane_helper_funcs=20
> ingenic_drm_plane_helper_funcs =3D {
>  	.atomic_update		=3D ingenic_drm_plane_atomic_update,
>  	.atomic_check		=3D ingenic_drm_plane_atomic_check,
>  	.atomic_disable		=3D ingenic_drm_plane_atomic_disable,
> -	.prepare_fb		=3D drm_gem_plane_helper_prepare_fb,
>  };
>=20
>  static const struct drm_crtc_helper_funcs=20
> ingenic_drm_crtc_helper_funcs =3D {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c=20
> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 3b1091e7c0cd..caf038f3e231 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -615,7 +615,6 @@ static const struct drm_plane_helper_funcs=20
> ingenic_ipu_plane_helper_funcs =3D {
>  	.atomic_update		=3D ingenic_ipu_plane_atomic_update,
>  	.atomic_check		=3D ingenic_ipu_plane_atomic_check,
>  	.atomic_disable		=3D ingenic_ipu_plane_atomic_disable,
> -	.prepare_fb		=3D drm_gem_plane_helper_prepare_fb,
>  };
>=20
>  static int
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c=20
> b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index b5582dcf564c..1667a7e7de38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -227,7 +227,6 @@ static void mtk_plane_atomic_update(struct=20
> drm_plane *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs mtk_plane_helper_funcs =3D {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D mtk_plane_atomic_check,
>  	.atomic_update =3D mtk_plane_atomic_update,
>  	.atomic_disable =3D mtk_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c=20
> b/drivers/gpu/drm/meson/meson_overlay.c
> index ed063152aecd..dfef8afcc245 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -747,7 +747,6 @@ static const struct drm_plane_helper_funcs=20
> meson_overlay_helper_funcs =3D {
>  	.atomic_check	=3D meson_overlay_atomic_check,
>  	.atomic_disable	=3D meson_overlay_atomic_disable,
>  	.atomic_update	=3D meson_overlay_atomic_update,
> -	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>  };
>=20
>  static bool meson_overlay_format_mod_supported(struct drm_plane=20
> *plane,
> diff --git a/drivers/gpu/drm/meson/meson_plane.c=20
> b/drivers/gpu/drm/meson/meson_plane.c
> index a18510dae4c8..8640a8a8a469 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -422,7 +422,6 @@ static const struct drm_plane_helper_funcs=20
> meson_plane_helper_funcs =3D {
>  	.atomic_check	=3D meson_plane_atomic_check,
>  	.atomic_disable	=3D meson_plane_atomic_disable,
>  	.atomic_update	=3D meson_plane_atomic_update,
> -	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>  };
>=20
>  static bool meson_plane_format_mod_supported(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c=20
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 300e7bab0f43..8797c671d0d5 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -500,13 +500,11 @@ static bool mxsfb_format_mod_supported(struct=20
> drm_plane *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs=20
> mxsfb_plane_primary_helper_funcs =3D {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D mxsfb_plane_atomic_check,
>  	.atomic_update =3D mxsfb_plane_primary_atomic_update,
>  };
>=20
>  static const struct drm_plane_helper_funcs=20
> mxsfb_plane_overlay_helper_funcs =3D {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D mxsfb_plane_atomic_check,
>  	.atomic_update =3D mxsfb_plane_overlay_atomic_update,
>  };
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c=20
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 64469439ddf2..6406bc0a71c7 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1109,7 +1109,6 @@ static const struct drm_plane_helper_funcs=20
> plane_helper_funcs =3D {
>  	.atomic_disable =3D vop_plane_atomic_disable,
>  	.atomic_async_check =3D vop_plane_atomic_async_check,
>  	.atomic_async_update =3D vop_plane_atomic_async_update,
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  };
>=20
>  static const struct drm_plane_funcs vop_plane_funcs =3D {
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index e99771b947b6..a5a2956f23f2 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -946,7 +946,6 @@ static const struct drm_plane_funcs=20
> ltdc_plane_funcs =3D {
>  };
>=20
>  static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs =3D=20
> {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D ltdc_plane_atomic_check,
>  	.atomic_update =3D ltdc_plane_atomic_update,
>  	.atomic_disable =3D ltdc_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c=20
> b/drivers/gpu/drm/sun4i/sun4i_layer.c
> index 11771bdd6e7c..929e95f86b5b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
> @@ -127,7 +127,6 @@ static bool=20
> sun4i_layer_format_mod_supported(struct drm_plane *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs=20
> sun4i_backend_layer_helper_funcs =3D {
> -	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_disable	=3D sun4i_backend_layer_atomic_disable,
>  	.atomic_update	=3D sun4i_backend_layer_atomic_update,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c=20
> b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index 0db164a774a1..ac3d43394589 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -332,7 +332,6 @@ static void sun8i_ui_layer_atomic_update(struct=20
> drm_plane *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs=20
> sun8i_ui_layer_helper_funcs =3D {
> -	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check	=3D sun8i_ui_layer_atomic_check,
>  	.atomic_disable	=3D sun8i_ui_layer_atomic_disable,
>  	.atomic_update	=3D sun8i_ui_layer_atomic_update,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c=20
> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 46420780db59..45b1e37f9cda 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -436,7 +436,6 @@ static void sun8i_vi_layer_atomic_update(struct=20
> drm_plane *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs=20
> sun8i_vi_layer_helper_funcs =3D {
> -	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check	=3D sun8i_vi_layer_atomic_check,
>  	.atomic_disable	=3D sun8i_vi_layer_atomic_disable,
>  	.atomic_update	=3D sun8i_vi_layer_atomic_update,
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c=20
> b/drivers/gpu/drm/tidss/tidss_plane.c
> index 1acd15aa4193..217415ec8eea 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -158,7 +158,6 @@ static void drm_plane_destroy(struct drm_plane=20
> *plane)
>  }
>=20
>  static const struct drm_plane_helper_funcs tidss_plane_helper_funcs=20
> =3D {
> -	.prepare_fb =3D drm_gem_plane_helper_prepare_fb,
>  	.atomic_check =3D tidss_plane_atomic_check,
>  	.atomic_update =3D tidss_plane_atomic_update,
>  	.atomic_disable =3D tidss_plane_atomic_disable,
> --
> 2.31.0
>=20


