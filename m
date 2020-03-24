Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277BA1907A5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0C889D7B;
	Tue, 24 Mar 2020 08:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462D189D52;
 Tue, 24 Mar 2020 08:33:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9E62FACCE;
 Tue, 24 Mar 2020 08:33:28 +0000 (UTC)
Subject: Re: [PATCH v1 0/3] drm: drm_encoder_init() => drm_encoder_init_funcs()
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200313201744.19773-1-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <c93bb45d-7922-56dc-061f-6ef70493a358@suse.de>
Date: Tue, 24 Mar 2020 09:33:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Jose Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mediatek@lists.infradead.org, Gerd Hoffmann <kraxel@redhat.com>,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0486988304=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0486988304==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ufl74Lq2kLxag3rezk70YaJ2XyXJCpUyg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ufl74Lq2kLxag3rezk70YaJ2XyXJCpUyg
Content-Type: multipart/mixed; boundary="De4ctwLgWXvPGwhVVivy7i6RNXKKkyzAV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Jose Roberto de Souza
 <jose.souza@intel.com>, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-renesas-soc@vger.kernel.org
Message-ID: <c93bb45d-7922-56dc-061f-6ef70493a358@suse.de>
Subject: Re: [PATCH v1 0/3] drm: drm_encoder_init() =>
 drm_encoder_init_funcs()
References: <20200313201744.19773-1-sam@ravnborg.org>
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>

--De4ctwLgWXvPGwhVVivy7i6RNXKKkyzAV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 13.03.20 um 21:17 schrieb Sam Ravnborg:
> Thomas Zimmermann had made a nice patch-set that introduced
> drm_simple_encoder_init() which is already present in drm-misc-next.
>=20
> While looking at this it was suddenly obvious to me that
> this was functionalty that really should be included in drm_encoder.c
> The case where the core could handle the callback is pretty
> common and not part of the simple pipe line.

The original patchset put the new function into the core implementation
and was shot down for this. So it ended up in the simple-KMS helpers.

>=20
> So after some dialog on dri-devel the conclusion was to go for
> a change like this:
>=20
>     drm_encoder_init_funcs() for all users that specified a
>     drm_encoder_funcs to extend the functionality.
>=20
>     drm_encoder_init() for all users that did not
>     need to extend the basic functionality with
>     drm_encoder_funcs.

TBH, my take-away was to keep the core as it is ans maybe rename
drm_simple_encoder_init() to some better name.

>=20
> A similar approach with a _funcs() prefix is used elsewhere in drm/

IMHO, there are a few things to consider:

=46rom grepping, I could only find drm_gem_fb_create_with_funcs(). And th=
e
proposed change would make the encoder's function name inconsistent with
drm_connector_init(), drm_crtc_init(), and others. Finally,
drm_connector_init_with_ddc() was criticiced for being mid-layerish and
could lead to many combinations of postfixes (e.g., _with_funcs(),
with_ddc(), _with_ddc_and_funcs(), etc).

If there is consent that the drm_simple_encoder_init() should go away,
I'd propose to change drm_encoder_init(). It could use a default
implementation for funcs, if no funcs argument has been specified. We
already have such behavior for some GEM callbacks. In later patches,
drm_gem_fb_create_with_funcs() and drm_connector_init_with_ddc() could
go away as well.

Best regards
Thomas


>=20
> This required a rename of the existing users, and
> a follow-up patch that moves drm_simple_encoder_init()
> to drm_encoder.c
>=20
> Patches 3 in this set demonstrate the use of drm_encoder_init().
> There are many more drivers that can be converted as Thomas
> has already demonstrated.
>=20
> This is all based on work done by Thomas Zimmermann,
> I just wanted to implement my suggestion so
> we could select the best way forward.
>=20
> Note: Daniel Vetter has hinted the approach implemented
> here smelled like middle-layer.
> IMO this is not so, it is just a way to handle cleanup
> for the simple cases.
>=20
> 	Sam
>=20
>=20
> Sam Ravnborg (3):
>       drm: drm_encoder_init() =3D> drm_encoder_init_funcs()
>       drm: drm_simple_encoder_init() =3D> drm_encoder_init()
>       drm/atmel-hlcdc: Use drm_encoder_init()
>=20
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             | 28 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             | 28 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              | 28 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              | 28 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |  4 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 10 ++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 10 ++---
>  drivers/gpu/drm/arc/arcpgu_hdmi.c                  |  4 +-
>  drivers/gpu/drm/arc/arcpgu_sim.c                   |  4 +-
>  drivers/gpu/drm/ast/ast_mode.c                     |  3 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |  8 +---
>  drivers/gpu/drm/drm_encoder.c                      | 49 ++++++++++++++=
+++++---
>  drivers/gpu/drm/drm_encoder_slave.c                |  2 +-
>  drivers/gpu/drm/drm_simple_kms_helper.c            | 45 +-------------=
------
>  drivers/gpu/drm/drm_writeback.c                    |  6 +--
>  drivers/gpu/drm/exynos/exynos_dp.c                 |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  4 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  4 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  4 +-
>  drivers/gpu/drm/gma500/cdv_intel_crt.c             |  5 ++-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c              |  4 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |  4 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c            |  6 +--
>  drivers/gpu/drm/gma500/mdfld_dsi_dpi.c             |  7 ++--
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c             |  6 +--
>  drivers/gpu/drm/gma500/oaktrail_lvds.c             |  4 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c            |  6 +--
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c            |  4 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |  4 +-
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  4 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                  |  5 ++-
>  drivers/gpu/drm/i915/display/icl_dsi.c             |  4 +-
>  drivers/gpu/drm/i915/display/intel_crt.c           |  5 ++-
>  drivers/gpu/drm/i915/display/intel_ddi.c           |  6 ++-
>  drivers/gpu/drm/i915/display/intel_dp.c            |  6 +--
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |  6 ++-
>  drivers/gpu/drm/i915/display/intel_dvo.c           |  6 +--
>  drivers/gpu/drm/i915/display/intel_hdmi.c          |  6 +--
>  drivers/gpu/drm/i915/display/intel_lvds.c          |  4 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c          |  6 +--
>  drivers/gpu/drm/i915/display/intel_tv.c            |  4 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c             |  5 ++-
>  drivers/gpu/drm/imx/dw_hdmi-imx.c                  |  4 +-
>  drivers/gpu/drm/imx/imx-ldb.c                      |  4 +-
>  drivers/gpu/drm/imx/imx-tve.c                      |  4 +-
>  drivers/gpu/drm/imx/parallel-display.c             |  4 +-
>  drivers/gpu/drm/ingenic/ingenic-drm.c              |  5 ++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |  5 ++-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  4 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c              |  5 ++-
>  drivers/gpu/drm/meson/meson_venc_cvbs.c            |  5 ++-
>  drivers/gpu/drm/mgag200/mgag200_mode.c             |  7 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c   |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |  3 +-
>  drivers/gpu/drm/nouveau/dispnv04/dac.c             |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  3 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |  4 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            | 16 +++----
>  drivers/gpu/drm/omapdrm/omap_encoder.c             |  4 +-
>  drivers/gpu/drm/qxl/qxl_display.c                  |  7 +---
>  drivers/gpu/drm/radeon/atombios_encoders.c         | 40 +++++++++-----=
----
>  drivers/gpu/drm/radeon/radeon_dp_mst.c             |  4 +-
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c    | 20 ++++-----
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  4 +-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  5 ++-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c             |  4 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  5 ++-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  4 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |  4 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  4 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c           |  5 ++-
>  drivers/gpu/drm/rockchip/rockchip_rgb.c            |  5 ++-
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |  4 +-
>  drivers/gpu/drm/sti/sti_tvout.c                    | 16 +++----
>  drivers/gpu/drm/stm/ltdc.c                         |  4 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             | 10 ++---
>  drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 10 ++---
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 10 ++---
>  drivers/gpu/drm/sun4i/sun4i_tv.c                   | 10 ++---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             | 10 ++---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |  4 +-
>  drivers/gpu/drm/tegra/dsi.c                        |  6 +--
>  drivers/gpu/drm/tegra/hdmi.c                       |  5 ++-
>  drivers/gpu/drm/tegra/rgb.c                        |  4 +-
>  drivers/gpu/drm/tegra/sor.c                        |  4 +-
>  drivers/gpu/drm/tidss/tidss_encoder.c              |  4 +-
>  drivers/gpu/drm/tilcdc/tilcdc_external.c           |  8 ++--
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c              |  4 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c              |  4 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                      |  4 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  4 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  4 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                      |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c           |  4 +-
>  drivers/gpu/drm/vkms/vkms_output.c                 |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  5 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  4 +-
>  drivers/gpu/drm/zte/zx_hdmi.c                      |  4 +-
>  drivers/gpu/drm/zte/zx_tvenc.c                     |  4 +-
>  drivers/gpu/drm/zte/zx_vga.c                       |  4 +-
>  include/drm/drm_encoder.h                          |  9 ++--
>  include/drm/drm_simple_kms_helper.h                |  4 --
>  109 files changed, 394 insertions(+), 395 deletions(-)
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--De4ctwLgWXvPGwhVVivy7i6RNXKKkyzAV--

--Ufl74Lq2kLxag3rezk70YaJ2XyXJCpUyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl55xdYACgkQaA3BHVML
eiNJUgf+LxlsmFqczF3bmdnqDSQXVB5DSYpT/HzisNKZmH17VGhSjbA3cP6Y+MqX
r8dHz/QG6y6SoIMm1lhQ4I8uGA3Swmf+Iaod60POAoD4mzFwTfXiI29WEYQ3Qhd2
sH8DzeBhnTyCt5aUBHxlPkhY4tuF7rfNHwyc1lTAweYfWoy+yMDgWTOQG8ZON7vT
LScFm4Y78iS3XrmPMMjgZnckvzUrexf7AILZ5zJovktYC1HQVbimK2UY/HxwXmc5
oiKOttFDWLE9zM4jv7xTzDJ+17ERSiLuHiPcnMU3O3MQmwfWLVY5j5uPF7vhsLw/
WxudAVCiFE1ukZUitIL3GVyYKuoKNw==
=3HjZ
-----END PGP SIGNATURE-----

--Ufl74Lq2kLxag3rezk70YaJ2XyXJCpUyg--

--===============0486988304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0486988304==--
