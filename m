Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A69394068
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 11:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D7D6E926;
	Fri, 28 May 2021 09:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B356E43C;
 Fri, 28 May 2021 09:56:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14S9pZf1002775; Fri, 28 May 2021 11:56:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ryj+Ax7WwMKxcQ1JRTpGZXJnRfrmaR+CjvT7E4X0sk8=;
 b=oB1FOjVFZB2u3R/BEMEsyKRBxHPx5oD22sCDLN9V6g26EmE6lNOBB5d4GAX38RB8uou0
 qtZXZZfL3PDhxjUmnBc+hf1pr11PrNCQqRnXetVTC+zb+6wmnpQqQ7wjJ/dksJUxpQ0t
 0IovE1ApIhTBUt8tQkFF2Bi9RpQj/uetGMHEdxdItAjJmIsvPJITnLX5dBOQPFa7MXCl
 84TbUDBghj/LdD/uOgzVhwR2/7F64APHJuxb/UhxcvO6Fjx2m1fvsFWStMsZjWfKk3E2
 38vDQ7+9sxPVhRBipTYsPcVxoulMX73F3I3ya/uAyDQBEd7/fw2FVRwhJYRhMjFnziuA BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tj2rkmk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 11:56:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA40D10002A;
 Fri, 28 May 2021 11:55:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E5492194CB;
 Fri, 28 May 2021 11:55:58 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 11:55:56 +0200
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <9df9b20e-4d15-b195-2d9b-d51dfb33a286@foss.st.com>
Date: Fri, 28 May 2021 11:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
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
 Paul Cercueil <paul@crapouillou.net>,
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
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-sunxi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/21/21 11:09 AM, Daniel Vetter wrote:
> No need to set it explicitly.
> 
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
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>

For stm
Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>

Many thanks
Philippe :-)

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
>   drivers/gpu/drm/imx/dcss/dcss-plane.c       | 1 -
>   drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c   | 1 -
>   drivers/gpu/drm/ingenic/ingenic-ipu.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 1 -
>   drivers/gpu/drm/meson/meson_overlay.c       | 1 -
>   drivers/gpu/drm/meson/meson_plane.c         | 1 -
>   drivers/gpu/drm/mxsfb/mxsfb_kms.c           | 2 --
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 -
>   drivers/gpu/drm/stm/ltdc.c                  | 1 -
>   drivers/gpu/drm/sun4i/sun4i_layer.c         | 1 -
>   drivers/gpu/drm/sun4i/sun8i_ui_layer.c      | 1 -
>   drivers/gpu/drm/sun4i/sun8i_vi_layer.c      | 1 -
>   drivers/gpu/drm/tidss/tidss_plane.c         | 1 -
>   14 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> index 044d3bdf313c..ac45d54acd4e 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> @@ -361,7 +361,6 @@ static void dcss_plane_atomic_disable(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs dcss_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = dcss_plane_atomic_check,
>   	.atomic_update = dcss_plane_atomic_update,
>   	.atomic_disable = dcss_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 8710f55d2579..ef114b6aa691 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -772,7 +772,6 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = ipu_plane_atomic_check,
>   	.atomic_disable = ipu_plane_atomic_disable,
>   	.atomic_update = ipu_plane_atomic_update,
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 389cad59e090..62db7349bf6a 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -786,7 +786,6 @@ static const struct drm_plane_helper_funcs ingenic_drm_plane_helper_funcs = {
>   	.atomic_update		= ingenic_drm_plane_atomic_update,
>   	.atomic_check		= ingenic_drm_plane_atomic_check,
>   	.atomic_disable		= ingenic_drm_plane_atomic_disable,
> -	.prepare_fb		= drm_gem_plane_helper_prepare_fb,
>   };
>   
>   static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 3b1091e7c0cd..caf038f3e231 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -615,7 +615,6 @@ static const struct drm_plane_helper_funcs ingenic_ipu_plane_helper_funcs = {
>   	.atomic_update		= ingenic_ipu_plane_atomic_update,
>   	.atomic_check		= ingenic_ipu_plane_atomic_check,
>   	.atomic_disable		= ingenic_ipu_plane_atomic_disable,
> -	.prepare_fb		= drm_gem_plane_helper_prepare_fb,
>   };
>   
>   static int
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index b5582dcf564c..1667a7e7de38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -227,7 +227,6 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = mtk_plane_atomic_check,
>   	.atomic_update = mtk_plane_atomic_update,
>   	.atomic_disable = mtk_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index ed063152aecd..dfef8afcc245 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -747,7 +747,6 @@ static const struct drm_plane_helper_funcs meson_overlay_helper_funcs = {
>   	.atomic_check	= meson_overlay_atomic_check,
>   	.atomic_disable	= meson_overlay_atomic_disable,
>   	.atomic_update	= meson_overlay_atomic_update,
> -	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
>   };
>   
>   static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index a18510dae4c8..8640a8a8a469 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -422,7 +422,6 @@ static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
>   	.atomic_check	= meson_plane_atomic_check,
>   	.atomic_disable	= meson_plane_atomic_disable,
>   	.atomic_update	= meson_plane_atomic_update,
> -	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
>   };
>   
>   static bool meson_plane_format_mod_supported(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 300e7bab0f43..8797c671d0d5 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -500,13 +500,11 @@ static bool mxsfb_format_mod_supported(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = mxsfb_plane_atomic_check,
>   	.atomic_update = mxsfb_plane_primary_atomic_update,
>   };
>   
>   static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = mxsfb_plane_atomic_check,
>   	.atomic_update = mxsfb_plane_overlay_atomic_update,
>   };
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 64469439ddf2..6406bc0a71c7 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1109,7 +1109,6 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
>   	.atomic_disable = vop_plane_atomic_disable,
>   	.atomic_async_check = vop_plane_atomic_async_check,
>   	.atomic_async_update = vop_plane_atomic_async_update,
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   };
>   
>   static const struct drm_plane_funcs vop_plane_funcs = {
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index e99771b947b6..a5a2956f23f2 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -946,7 +946,6 @@ static const struct drm_plane_funcs ltdc_plane_funcs = {
>   };
>   
>   static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = ltdc_plane_atomic_check,
>   	.atomic_update = ltdc_plane_atomic_update,
>   	.atomic_disable = ltdc_plane_atomic_disable,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
> index 11771bdd6e7c..929e95f86b5b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
> @@ -127,7 +127,6 @@ static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs sun4i_backend_layer_helper_funcs = {
> -	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
>   	.atomic_disable	= sun4i_backend_layer_atomic_disable,
>   	.atomic_update	= sun4i_backend_layer_atomic_update,
>   };
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index 0db164a774a1..ac3d43394589 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -332,7 +332,6 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
> -	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
>   	.atomic_check	= sun8i_ui_layer_atomic_check,
>   	.atomic_disable	= sun8i_ui_layer_atomic_disable,
>   	.atomic_update	= sun8i_ui_layer_atomic_update,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 46420780db59..45b1e37f9cda 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -436,7 +436,6 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
> -	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
>   	.atomic_check	= sun8i_vi_layer_atomic_check,
>   	.atomic_disable	= sun8i_vi_layer_atomic_disable,
>   	.atomic_update	= sun8i_vi_layer_atomic_update,
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 1acd15aa4193..217415ec8eea 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -158,7 +158,6 @@ static void drm_plane_destroy(struct drm_plane *plane)
>   }
>   
>   static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = tidss_plane_atomic_check,
>   	.atomic_update = tidss_plane_atomic_update,
>   	.atomic_disable = tidss_plane_atomic_disable,
> 
