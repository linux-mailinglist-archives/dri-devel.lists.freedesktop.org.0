Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B78CBBE9
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 09:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A095410EE03;
	Wed, 22 May 2024 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pNjMpomt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA75610EC77
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:24:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7B78627DE;
 Wed, 22 May 2024 07:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7ABC2BD11;
 Wed, 22 May 2024 07:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716362695;
 bh=RpsenxW2up+GVmBDLm6Dft7F/NhXAT1mwDTvcipp7Z4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pNjMpomtvjQBv5Hjcg8V1knk5U1Ck3kyAAQp4cjLRRTanqbSYUMaj02eE4mjlpq3F
 HAznm5C5tJDnvm5TS+VET8UqIDlRhdIqIBWHdTrmINV0s4BY/Pfv/TrTNrBh9hKHTQ
 5g9iAsOpw2ZNmIYrrq2KdlesxXzBsl8XW1yheNRucWLzxUkRTmCAXkkGsw9k0O0zPv
 Jle/fGczN58C6Yk61zkp9nuyyYkgpNFxjdBbBwFtsB7ojnkUft1m+zFSOLKUIKm564
 5//jvMdcCydazkmRoxECUhk6h3VUi/dyJKfi8CjbO+hAhT0k+IDeH4jEDc6RDhf2fj
 3HvC0AOE7IPow==
Date: Wed, 22 May 2024 09:24:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: keith <keith.zhao@starfivetech.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com, 
 heiko@sntech.de, andy.yan@rock-chips.com, xingyu.wu@starfivetech.com, 
 p.zabel@pengutronix.de, jack.zhu@starfivetech.com,
 shengyang.chen@starfivetech.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 03/10] drm/rockchip:hdmi: migrate to use inno-hdmi
 bridge driver
Message-ID: <20240522-opalescent-orchid-worm-2996ad@houat>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-4-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sz2tqw6l7ovh4mjb"
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-4-keith.zhao@starfivetech.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sz2tqw6l7ovh4mjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 21, 2024 at 06:58:10PM GMT, keith wrote:
> Add the ROCKCHIP inno hdmi driver that uses the Inno DesignWare
> HDMI TX bridge and remove the old separate one.
>=20
> Signed-off-by: keith <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/rockchip/Kconfig              |    1 +
>  drivers/gpu/drm/rockchip/Makefile             |    2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  517 ++++++++
>  .../{inno_hdmi.h =3D> inno_hdmi-rockchip.h}     |   45 -
>  drivers/gpu/drm/rockchip/inno_hdmi.c          | 1073 -----------------
>  5 files changed, 519 insertions(+), 1119 deletions(-)
>  create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>  rename drivers/gpu/drm/rockchip/{inno_hdmi.h =3D> inno_hdmi-rockchip.h} =
(85%)
>  delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>=20
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/=
Kconfig
> index 1bf3e2829cd0..cc6cfd5a30d6 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -74,6 +74,7 @@ config ROCKCHIP_DW_MIPI_DSI
> =20
>  config ROCKCHIP_INNO_HDMI
>  	bool "Rockchip specific extensions for Innosilicon HDMI"
> +	select DRM_INNO_HDMI
>  	help
>  	  This selects support for Rockchip SoC specific extensions
>  	  for the Innosilicon HDMI driver. If you want to enable
> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip=
/Makefile
> index 3ff7b21c0414..4b2d0cba8db3 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -12,7 +12,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) +=3D analogi=
x_dp-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) +=3D cdn-dp-core.o cdn-dp-reg.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) +=3D dw_hdmi-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) +=3D dw-mipi-dsi-rockchip.o
> -rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) +=3D inno_hdmi.o
> +rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) +=3D inno_hdmi-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) +=3D rockchip_lvds.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_RGB) +=3D rockchip_rgb.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_RK3066_HDMI) +=3D rk3066_hdmi.o
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c b/drivers/gpu/=
drm/rockchip/inno_hdmi-rockchip.c
> new file mode 100644
> index 000000000000..69d0e913e13b
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> @@ -0,0 +1,517 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + *    Zheng Yang <zhengyang@rock-chips.com>
> + *    Yakir Yang <ykk@rock-chips.com>
> + */
> +
> +#include <linux/irq.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hdmi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/bridge/inno_hdmi.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "rockchip_drm_drv.h"
> +
> +#include "inno_hdmi-rockchip.h"
> +
> +#define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
> +
> +struct rk_inno_hdmi {
> +	struct rockchip_encoder encoder;
> +	struct inno_hdmi inno_hdmi;
> +	struct clk *pclk;
> +	struct clk *refclk;
> +};
> +
> +static struct inno_hdmi *rk_encoder_to_inno_hdmi(struct drm_encoder *enc=
oder)
> +{
> +	struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(encoder);
> +	struct rk_inno_hdmi *rk_hdmi =3D container_of(rkencoder, struct rk_inno=
_hdmi, encoder);
> +
> +	return &rk_hdmi->inno_hdmi;
> +}
> +
> +enum {
> +	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
> +	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
> +	CSC_RGB_0_255_TO_RGB_16_235_8BIT,
> +};
> +
> +static const char coeff_csc[][24] =3D {
> +	/*
> +	 * RGB2YUV:601 SD mode:
> +	 *   Cb =3D -0.291G - 0.148R + 0.439B + 128
> +	 *   Y  =3D 0.504G  + 0.257R + 0.098B + 16
> +	 *   Cr =3D -0.368G + 0.439R - 0.071B + 128
> +	 */
> +	{
> +		0x11, 0x5f, 0x01, 0x82, 0x10, 0x23, 0x00, 0x80,
> +		0x02, 0x1c, 0x00, 0xa1, 0x00, 0x36, 0x00, 0x1e,
> +		0x11, 0x29, 0x10, 0x59, 0x01, 0x82, 0x00, 0x80
> +	},
> +	/*
> +	 * RGB2YUV:709 HD mode:
> +	 *   Cb =3D - 0.338G - 0.101R + 0.439B + 128
> +	 *   Y  =3D 0.614G   + 0.183R + 0.062B + 16
> +	 *   Cr =3D - 0.399G + 0.439R - 0.040B + 128
> +	 */
> +	{
> +		0x11, 0x98, 0x01, 0xc1, 0x10, 0x28, 0x00, 0x80,
> +		0x02, 0x74, 0x00, 0xbb, 0x00, 0x3f, 0x00, 0x10,
> +		0x11, 0x5a, 0x10, 0x67, 0x01, 0xc1, 0x00, 0x80
> +	},
> +	/*
> +	 * RGB[0:255]2RGB[16:235]:
> +	 *   R' =3D R x (235-16)/255 + 16;
> +	 *   G' =3D G x (235-16)/255 + 16;
> +	 *   B' =3D B x (235-16)/255 + 16;
> +	 */
> +	{
> +		0x00, 0x00, 0x03, 0x6F, 0x00, 0x00, 0x00, 0x10,
> +		0x03, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,
> +		0x00, 0x00, 0x00, 0x00, 0x03, 0x6F, 0x00, 0x10
> +	},
> +};
> +
> +static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] =3D {
> +	{  74250000, 0x3f, 0xbb },
> +	{ 165000000, 0x6f, 0xbb },
> +	{      ~0UL, 0x00, 0x00 }
> +};
> +
> +static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] =3D {
> +	{  74250000, 0x3f, 0xaa },
> +	{ 165000000, 0x5f, 0xaa },
> +	{      ~0UL, 0x00, 0x00 }
> +};
> +
> +static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
> +				     unsigned long pixelclk)
> +{
> +	const struct inno_hdmi_phy_config *phy_configs =3D hdmi->plat_data->phy=
_configs;
> +	int i;
> +
> +	for (i =3D 0; phy_configs[i].pixelclock !=3D ~0UL; i++) {
> +		if (pixelclk <=3D phy_configs[i].pixelclock)
> +			return i;
> +	}
> +
> +	DRM_DEV_DEBUG(hdmi->dev, "No phy configuration for pixelclock %lu\n",
> +		      pixelclk);
> +
> +	return -EINVAL;
> +}
> +
> +static void inno_hdmi_standby(struct inno_hdmi *hdmi)
> +{
> +	inno_hdmi_sys_power(hdmi, false);
> +
> +	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0x00);
> +	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x00);
> +	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x00);
> +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
> +};
> +
> +static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
> +			       unsigned long mpixelclock)
> +{
> +	struct inno_hdmi_phy_config *phy_config;
> +	int ret =3D inno_hdmi_find_phy_config(hdmi, mpixelclock);
> +
> +	if (ret < 0) {
> +		phy_config =3D hdmi->plat_data->default_phy_config;
> +		DRM_DEV_ERROR(hdmi->dev,
> +			      "Using default phy configuration for TMDS rate %lu",
> +			      mpixelclock);
> +	} else {
> +		phy_config =3D &hdmi->plat_data->phy_configs[ret];
> +	}
> +
> +	inno_hdmi_sys_power(hdmi, false);
> +
> +	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
> +	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
> +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
> +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x14);
> +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x10);
> +	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x0f);
> +	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
> +	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
> +
> +	inno_hdmi_sys_power(hdmi, true);
> +};
> +
> +static void inno_hdmi_reset(struct inno_hdmi *hdmi)
> +{
> +	u32 val;
> +	u32 msk;
> +
> +	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_DIGITAL, v_NOT_RST_DIGITAL);
> +	udelay(100);
> +
> +	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_ANALOG, v_NOT_RST_ANALOG);
> +	udelay(100);
> +
> +	msk =3D m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
> +	val =3D v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIG=
H;
> +	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
> +
> +	inno_hdmi_standby(hdmi);
> +}
> +
> +static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
> +{
> +	struct drm_connector *connector =3D &hdmi->connector;
> +	struct drm_connector_state *conn_state =3D connector->state;
> +	struct inno_hdmi_connector_state *inno_conn_state =3D
> +					to_inno_hdmi_conn_state(conn_state);
> +	int c0_c2_change =3D 0;
> +	int csc_enable =3D 0;
> +	int csc_mode =3D 0;
> +	int auto_csc =3D 0;
> +	int value;
> +	int i;
> +
> +	/* Input video mode is SDR RGB24bit, data enable signal from external */
> +	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
> +		    v_VIDEO_INPUT_FORMAT(VIDEO_INPUT_SDR_RGB444));
> +
> +	/* Input color hardcode to RGB, and output color hardcode to RGB888 */
> +	value =3D v_VIDEO_INPUT_BITS(VIDEO_INPUT_8BITS) |
> +		v_VIDEO_OUTPUT_COLOR(0) |
> +		v_VIDEO_INPUT_CSP(0);
> +	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
> +
> +	if (inno_conn_state->enc_out_format =3D=3D HDMI_COLORSPACE_RGB) {
> +		if (inno_conn_state->rgb_limited_range) {
> +			csc_mode =3D CSC_RGB_0_255_TO_RGB_16_235_8BIT;
> +			auto_csc =3D AUTO_CSC_DISABLE;
> +			c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> +			csc_enable =3D v_CSC_ENABLE;
> +
> +		} else {
> +			value =3D v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
> +			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
> +
> +			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
> +				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
> +				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
> +				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
> +			return 0;
> +		}
> +	} else {
> +		if (inno_conn_state->colorimetry =3D=3D HDMI_COLORIMETRY_ITU_601) {
> +			if (inno_conn_state->enc_out_format =3D=3D HDMI_COLORSPACE_YUV444) {
> +				csc_mode =3D CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
> +				auto_csc =3D AUTO_CSC_DISABLE;
> +				c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> +				csc_enable =3D v_CSC_ENABLE;
> +			}
> +		} else {
> +			if (inno_conn_state->enc_out_format =3D=3D HDMI_COLORSPACE_YUV444) {
> +				csc_mode =3D CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
> +				auto_csc =3D AUTO_CSC_DISABLE;
> +				c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> +				csc_enable =3D v_CSC_ENABLE;
> +			}
> +		}
> +	}
> +
> +	for (i =3D 0; i < 24; i++)
> +		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
> +			    coeff_csc[csc_mode][i]);
> +
> +	value =3D v_SOF_DISABLE | csc_enable | v_COLOR_DEPTH_NOT_INDICATED(1);
> +	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
> +	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL, m_VIDEO_AUTO_CSC |
> +		  m_VIDEO_C0_C2_SWAP, v_VIDEO_AUTO_CSC(auto_csc) |
> +		  v_VIDEO_C0_C2_SWAP(c0_c2_change));
> +
> +	return 0;
> +}
> +
> +static int inno_hdmi_setup(struct inno_hdmi *hdmi,
> +			   struct drm_display_mode *mode)
> +{
> +	struct drm_display_info *display =3D &hdmi->connector.display_info;
> +	unsigned long mpixelclock =3D mode->clock * 1000;
> +
> +	/* Mute video and audio output */
> +	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
> +		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
> +
> +	/* Set HDMI Mode */
> +	hdmi_writeb(hdmi, HDMI_HDCP_CTRL,
> +		    v_HDMI_DVI(display->is_hdmi));
> +
> +	inno_hdmi_config_video_timing(hdmi, mode);
> +
> +	inno_hdmi_config_video_csc(hdmi);
> +
> +	if (display->is_hdmi)
> +		inno_hdmi_config_video_avi(hdmi, mode);
> +
> +	/*
> +	 * When IP controller have configured to an accurate video
> +	 * timing, then the TMDS clock source would be switched to
> +	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
> +	 * clock rate, and reconfigure the DDC clock.
> +	 */
> +	inno_hdmi_i2c_init(hdmi, mpixelclock);
> +
> +	/* Unmute video and audio output */
> +	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
> +		  v_AUDIO_MUTE(0) | v_VIDEO_MUTE(0));
> +
> +	inno_hdmi_power_up(hdmi, mpixelclock);
> +
> +	return 0;
> +}
>

It's kind of a general comment, but I don't think that's the right
abstraction. You should create a inno_hdmi bridge that allows to
supplement some of the atomic hooks, but not reimplement them entirely
each time.

You can have a look at how dw-hdmi does it for example. Also, why do you
still need the encoder and connectors?

Maxime

--sz2tqw6l7ovh4mjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZk2duwAKCRAnX84Zoj2+
dkF2AX9jQnZV3sONCKFSJhi4lZ/Ymcq3X6xWZyt2lmjwp1iEsJhOqYHPKEqQQ6AM
GoKkbb0BgI+VNaNW48TQaT/S1RTayRRJCu/a3d4teB5nzeFKgubg71rRHSYXQRsI
YSGF1RP4Vw==
=jc7l
-----END PGP SIGNATURE-----

--sz2tqw6l7ovh4mjb--
