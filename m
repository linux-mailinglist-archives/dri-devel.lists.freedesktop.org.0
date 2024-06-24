Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597D91465C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A38610E3CF;
	Mon, 24 Jun 2024 09:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O8Mof4R4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF0210E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:25:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33D1160AEB;
 Mon, 24 Jun 2024 09:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF9FC2BBFC;
 Mon, 24 Jun 2024 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719221124;
 bh=zzHhamkx2sqSS2kKDuOMTwalTDF7soRE2npOYSsjdjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O8Mof4R4APWPEuz6DnAmjEIT01LOjZNWjc9x08jZrDeMMb4y77hZ4Pg7R+KoxWL7a
 SKoIFTD7W4LUyM45CJcTQSnTTVKnrHdLqc+IR2O8XxzdrGjeQIQHqyTJrny+HrUi2M
 /TfHjRniFuSLkzNckm/JOG2CBb8EzWPce+aitYzT+psGXZSSQf+A/Wz2UPcDaJTjSy
 IIbOEglXmvxSb8fJRVVhw/bfZvD5jbS5bBYyuKA4PhV08xeN7sFLDRhPQMu3lEzNAv
 FAOzvVd6mw2ZQXTlzIBLjGJKzL0VUehUTZMLF44Rmn0v3ML78GOJnZgk45yrCmxSUV
 Qla5j3oDSNyvA==
Date: Mon, 24 Jun 2024 11:25:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>, 
 "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 Jack Zhu <jack.zhu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 03/10] drm/rockchip:hdmi: migrate to use inno-hdmi
 bridge driver
Message-ID: <20240624-tomato-mosquito-of-tornado-c01c77@houat>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-4-keith.zhao@starfivetech.com>
 <20240522-opalescent-orchid-worm-2996ad@houat>
 <NTZPR01MB1050EA346F8F3284BFC5AD5BEECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7eqgua22whoeilog"
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1050EA346F8F3284BFC5AD5BEECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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


--7eqgua22whoeilog
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 07:17:14AM GMT, Keith Zhao wrote:
> Hi Maxime=EF=BC=9A
>=20
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: 2024=E5=B9=B45=E6=9C=8822=E6=97=A5 15:25
> > To: Keith Zhao <keith.zhao@starfivetech.com>
> > Cc: andrzej.hajda@intel.com; neil.armstrong@linaro.org; rfoss@kernel.or=
g;
> > Laurent.pinchart@ideasonboard.com; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; maarten.lankhorst@linux.intel.com;
> > tzimmermann@suse.de; airlied@gmail.com; daniel@ffwll.ch; robh@kernel.or=
g;
> > krzk+dt@kernel.org; conor+dt@kernel.org; hjc@rock-chips.com;
> > heiko@sntech.de; andy.yan@rock-chips.com; Xingyu Wu
> > <xingyu.wu@starfivetech.com>; p.zabel@pengutronix.de; Jack Zhu
> > <jack.zhu@starfivetech.com>; Shengyang Chen
> > <shengyang.chen@starfivetech.com>; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v4 03/10] drm/rockchip:hdmi: migrate to use inno-hd=
mi
> > bridge driver
> >=20
> > Hi,
> >=20
> > On Tue, May 21, 2024 at 06:58:10PM GMT, keith wrote:
> > > Add the ROCKCHIP inno hdmi driver that uses the Inno DesignWare HDMI
> > > TX bridge and remove the old separate one.
> > >
> > > Signed-off-by: keith <keith.zhao@starfivetech.com>
> > > ---
> > >  drivers/gpu/drm/rockchip/Kconfig              |    1 +
> > >  drivers/gpu/drm/rockchip/Makefile             |    2 +-
> > >  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  517 ++++++++
> > >  .../{inno_hdmi.h =3D> inno_hdmi-rockchip.h}     |   45 -
> > >  drivers/gpu/drm/rockchip/inno_hdmi.c          | 1073 ---------------=
--
> > >  5 files changed, 519 insertions(+), 1119 deletions(-)  create mode
> > > 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> > >  rename drivers/gpu/drm/rockchip/{inno_hdmi.h =3D> inno_hdmi-rockchip=
=2Eh}
> > > (85%)  delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
> > >
> > > diff --git a/drivers/gpu/drm/rockchip/Kconfig
> > > b/drivers/gpu/drm/rockchip/Kconfig
> > > index 1bf3e2829cd0..cc6cfd5a30d6 100644
> > > --- a/drivers/gpu/drm/rockchip/Kconfig
> > > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > > @@ -74,6 +74,7 @@ config ROCKCHIP_DW_MIPI_DSI
> > >
> > >  config ROCKCHIP_INNO_HDMI
> > >  	bool "Rockchip specific extensions for Innosilicon HDMI"
> > > +	select DRM_INNO_HDMI
> > >  	help
> > >  	  This selects support for Rockchip SoC specific extensions
> > >  	  for the Innosilicon HDMI driver. If you want to enable diff --git
> > > a/drivers/gpu/drm/rockchip/Makefile
> > > b/drivers/gpu/drm/rockchip/Makefile
> > > index 3ff7b21c0414..4b2d0cba8db3 100644
> > > --- a/drivers/gpu/drm/rockchip/Makefile
> > > +++ b/drivers/gpu/drm/rockchip/Makefile
> > > @@ -12,7 +12,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) +=3D
> > > analogix_dp-rockchip.o
> > >  rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) +=3D cdn-dp-core.o cdn-dp-reg.o
> > >  rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) +=3D dw_hdmi-rockchip.o
> > >  rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) +=3D
> > dw-mipi-dsi-rockchip.o
> > > -rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) +=3D inno_hdmi.o
> > > +rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) +=3D inno_hdmi-rockchip.o
> > >  rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) +=3D rockchip_lvds.o
> > >  rockchipdrm-$(CONFIG_ROCKCHIP_RGB) +=3D rockchip_rgb.o
> > >  rockchipdrm-$(CONFIG_ROCKCHIP_RK3066_HDMI) +=3D rk3066_hdmi.o diff
> > > --git a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> > > b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> > > new file mode 100644
> > > index 000000000000..69d0e913e13b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> > > @@ -0,0 +1,517 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> > > + *    Zheng Yang <zhengyang@rock-chips.com>
> > > + *    Yakir Yang <ykk@rock-chips.com>
> > > + */
> > > +
> > > +#include <linux/irq.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/err.h>
> > > +#include <linux/hdmi.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include <drm/bridge/inno_hdmi.h>
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_edid.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +#include <drm/drm_simple_kms_helper.h>
> > > +
> > > +#include "rockchip_drm_drv.h"
> > > +
> > > +#include "inno_hdmi-rockchip.h"
> > > +
> > > +#define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
> > > +
> > > +struct rk_inno_hdmi {
> > > +	struct rockchip_encoder encoder;
> > > +	struct inno_hdmi inno_hdmi;
> > > +	struct clk *pclk;
> > > +	struct clk *refclk;
> > > +};
> > > +
> > > +static struct inno_hdmi *rk_encoder_to_inno_hdmi(struct drm_encoder
> > > +*encoder) {
> > > +	struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(encoder);
> > > +	struct rk_inno_hdmi *rk_hdmi =3D container_of(rkencoder, struct
> > > +rk_inno_hdmi, encoder);
> > > +
> > > +	return &rk_hdmi->inno_hdmi;
> > > +}
> > > +
> > > +enum {
> > > +	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
> > > +	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
> > > +	CSC_RGB_0_255_TO_RGB_16_235_8BIT,
> > > +};
> > > +
> > > +static const char coeff_csc[][24] =3D {
> > > +	/*
> > > +	 * RGB2YUV:601 SD mode:
> > > +	 *   Cb =3D -0.291G - 0.148R + 0.439B + 128
> > > +	 *   Y  =3D 0.504G  + 0.257R + 0.098B + 16
> > > +	 *   Cr =3D -0.368G + 0.439R - 0.071B + 128
> > > +	 */
> > > +	{
> > > +		0x11, 0x5f, 0x01, 0x82, 0x10, 0x23, 0x00, 0x80,
> > > +		0x02, 0x1c, 0x00, 0xa1, 0x00, 0x36, 0x00, 0x1e,
> > > +		0x11, 0x29, 0x10, 0x59, 0x01, 0x82, 0x00, 0x80
> > > +	},
> > > +	/*
> > > +	 * RGB2YUV:709 HD mode:
> > > +	 *   Cb =3D - 0.338G - 0.101R + 0.439B + 128
> > > +	 *   Y  =3D 0.614G   + 0.183R + 0.062B + 16
> > > +	 *   Cr =3D - 0.399G + 0.439R - 0.040B + 128
> > > +	 */
> > > +	{
> > > +		0x11, 0x98, 0x01, 0xc1, 0x10, 0x28, 0x00, 0x80,
> > > +		0x02, 0x74, 0x00, 0xbb, 0x00, 0x3f, 0x00, 0x10,
> > > +		0x11, 0x5a, 0x10, 0x67, 0x01, 0xc1, 0x00, 0x80
> > > +	},
> > > +	/*
> > > +	 * RGB[0:255]2RGB[16:235]:
> > > +	 *   R' =3D R x (235-16)/255 + 16;
> > > +	 *   G' =3D G x (235-16)/255 + 16;
> > > +	 *   B' =3D B x (235-16)/255 + 16;
> > > +	 */
> > > +	{
> > > +		0x00, 0x00, 0x03, 0x6F, 0x00, 0x00, 0x00, 0x10,
> > > +		0x03, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,
> > > +		0x00, 0x00, 0x00, 0x00, 0x03, 0x6F, 0x00, 0x10
> > > +	},
> > > +};
> > > +
> > > +static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] =3D {
> > > +	{  74250000, 0x3f, 0xbb },
> > > +	{ 165000000, 0x6f, 0xbb },
> > > +	{      ~0UL, 0x00, 0x00 }
> > > +};
> > > +
> > > +static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] =3D {
> > > +	{  74250000, 0x3f, 0xaa },
> > > +	{ 165000000, 0x5f, 0xaa },
> > > +	{      ~0UL, 0x00, 0x00 }
> > > +};
> > > +
> > > +static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
> > > +				     unsigned long pixelclk)
> > > +{
> > > +	const struct inno_hdmi_phy_config *phy_configs =3D
> > hdmi->plat_data->phy_configs;
> > > +	int i;
> > > +
> > > +	for (i =3D 0; phy_configs[i].pixelclock !=3D ~0UL; i++) {
> > > +		if (pixelclk <=3D phy_configs[i].pixelclock)
> > > +			return i;
> > > +	}
> > > +
> > > +	DRM_DEV_DEBUG(hdmi->dev, "No phy configuration for pixelclock %lu\n=
",
> > > +		      pixelclk);
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static void inno_hdmi_standby(struct inno_hdmi *hdmi) {
> > > +	inno_hdmi_sys_power(hdmi, false);
> > > +
> > > +	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0x00);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x00);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x00);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15); };
> > > +
> > > +static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
> > > +			       unsigned long mpixelclock)
> > > +{
> > > +	struct inno_hdmi_phy_config *phy_config;
> > > +	int ret =3D inno_hdmi_find_phy_config(hdmi, mpixelclock);
> > > +
> > > +	if (ret < 0) {
> > > +		phy_config =3D hdmi->plat_data->default_phy_config;
> > > +		DRM_DEV_ERROR(hdmi->dev,
> > > +			      "Using default phy configuration for TMDS rate %lu",
> > > +			      mpixelclock);
> > > +	} else {
> > > +		phy_config =3D &hdmi->plat_data->phy_configs[ret];
> > > +	}
> > > +
> > > +	inno_hdmi_sys_power(hdmi, false);
> > > +
> > > +	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS,
> > phy_config->pre_emphasis);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_DRIVER,
> > phy_config->voltage_level_control);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x14);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x10);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x0f);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
> > > +	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
> > > +
> > > +	inno_hdmi_sys_power(hdmi, true);
> > > +};
> > > +
> > > +static void inno_hdmi_reset(struct inno_hdmi *hdmi) {
> > > +	u32 val;
> > > +	u32 msk;
> > > +
> > > +	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_DIGITAL,
> > v_NOT_RST_DIGITAL);
> > > +	udelay(100);
> > > +
> > > +	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_ANALOG,
> > v_NOT_RST_ANALOG);
> > > +	udelay(100);
> > > +
> > > +	msk =3D m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
> > > +	val =3D v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON |
> > v_INT_POL_HIGH;
> > > +	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
> > > +
> > > +	inno_hdmi_standby(hdmi);
> > > +}
> > > +
> > > +static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi) {
> > > +	struct drm_connector *connector =3D &hdmi->connector;
> > > +	struct drm_connector_state *conn_state =3D connector->state;
> > > +	struct inno_hdmi_connector_state *inno_conn_state =3D
> > > +					to_inno_hdmi_conn_state(conn_state);
> > > +	int c0_c2_change =3D 0;
> > > +	int csc_enable =3D 0;
> > > +	int csc_mode =3D 0;
> > > +	int auto_csc =3D 0;
> > > +	int value;
> > > +	int i;
> > > +
> > > +	/* Input video mode is SDR RGB24bit, data enable signal from extern=
al */
> > > +	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
> > > +		    v_VIDEO_INPUT_FORMAT(VIDEO_INPUT_SDR_RGB444));
> > > +
> > > +	/* Input color hardcode to RGB, and output color hardcode to RGB888=
 */
> > > +	value =3D v_VIDEO_INPUT_BITS(VIDEO_INPUT_8BITS) |
> > > +		v_VIDEO_OUTPUT_COLOR(0) |
> > > +		v_VIDEO_INPUT_CSP(0);
> > > +	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
> > > +
> > > +	if (inno_conn_state->enc_out_format =3D=3D HDMI_COLORSPACE_RGB) {
> > > +		if (inno_conn_state->rgb_limited_range) {
> > > +			csc_mode =3D CSC_RGB_0_255_TO_RGB_16_235_8BIT;
> > > +			auto_csc =3D AUTO_CSC_DISABLE;
> > > +			c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> > > +			csc_enable =3D v_CSC_ENABLE;
> > > +
> > > +		} else {
> > > +			value =3D v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
> > > +			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
> > > +
> > > +			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
> > > +				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
> > > +				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
> > > +				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
> > > +			return 0;
> > > +		}
> > > +	} else {
> > > +		if (inno_conn_state->colorimetry =3D=3D HDMI_COLORIMETRY_ITU_601)
> > {
> > > +			if (inno_conn_state->enc_out_format =3D=3D
> > HDMI_COLORSPACE_YUV444) {
> > > +				csc_mode =3D CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
> > > +				auto_csc =3D AUTO_CSC_DISABLE;
> > > +				c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> > > +				csc_enable =3D v_CSC_ENABLE;
> > > +			}
> > > +		} else {
> > > +			if (inno_conn_state->enc_out_format =3D=3D
> > HDMI_COLORSPACE_YUV444) {
> > > +				csc_mode =3D CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
> > > +				auto_csc =3D AUTO_CSC_DISABLE;
> > > +				c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> > > +				csc_enable =3D v_CSC_ENABLE;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	for (i =3D 0; i < 24; i++)
> > > +		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
> > > +			    coeff_csc[csc_mode][i]);
> > > +
> > > +	value =3D v_SOF_DISABLE | csc_enable |
> > v_COLOR_DEPTH_NOT_INDICATED(1);
> > > +	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
> > > +	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL, m_VIDEO_AUTO_CSC |
> > > +		  m_VIDEO_C0_C2_SWAP, v_VIDEO_AUTO_CSC(auto_csc) |
> > > +		  v_VIDEO_C0_C2_SWAP(c0_c2_change));
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int inno_hdmi_setup(struct inno_hdmi *hdmi,
> > > +			   struct drm_display_mode *mode)
> > > +{
> > > +	struct drm_display_info *display =3D &hdmi->connector.display_info;
> > > +	unsigned long mpixelclock =3D mode->clock * 1000;
> > > +
> > > +	/* Mute video and audio output */
> > > +	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
> > > +		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
> > > +
> > > +	/* Set HDMI Mode */
> > > +	hdmi_writeb(hdmi, HDMI_HDCP_CTRL,
> > > +		    v_HDMI_DVI(display->is_hdmi));
> > > +
> > > +	inno_hdmi_config_video_timing(hdmi, mode);
> > > +
> > > +	inno_hdmi_config_video_csc(hdmi);
> > > +
> > > +	if (display->is_hdmi)
> > > +		inno_hdmi_config_video_avi(hdmi, mode);
> > > +
> > > +	/*
> > > +	 * When IP controller have configured to an accurate video
> > > +	 * timing, then the TMDS clock source would be switched to
> > > +	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
> > > +	 * clock rate, and reconfigure the DDC clock.
> > > +	 */
> > > +	inno_hdmi_i2c_init(hdmi, mpixelclock);
> > > +
> > > +	/* Unmute video and audio output */
> > > +	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
> > > +		  v_AUDIO_MUTE(0) | v_VIDEO_MUTE(0));
> > > +
> > > +	inno_hdmi_power_up(hdmi, mpixelclock);
> > > +
> > > +	return 0;
> > > +}
> > >
> >=20
> > It's kind of a general comment, but I don't think that's the right abst=
raction. You
> > should create a inno_hdmi bridge that allows to supplement some of the =
atomic
> > hooks, but not reimplement them entirely each time.
> >=20
> > You can have a look at how dw-hdmi does it for example. Also, why do yo=
u still
> > need the encoder and connectors?
> >=20
> Hi Maxime=EF=BC=9A
> This series of patches does not consider referencing bridge ,
> just split the public interface based on the current structure (encoder +=
 connector),=20
> and then make it into a public API.=20
> The next step is to implement the driver code of the public part based on=
 the bridge architecture.

I'm not sure what you have in mind, but I stand by what I was saying
previously. SoC-specific drivers shouldn't have code to handle the
common part of the bridge, it should be the other way around: the common
part should add hooks to handle the SoC-specific parts.

> By the way, does the current situation require the introduction of the ne=
xt_bridge concept?
> dw-hdmi attach:
> static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
> 				 enum drm_bridge_attach_flags flags)
> {
> 	struct dw_hdmi *hdmi =3D bridge->driver_private;
>=20
> 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> 		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> 					 bridge, flags);
>=20
> 	return dw_hdmi_connector_create(hdmi);
> }
>=20
> For inno hdmi , I want to define it like this , will it be ok?
> static int inno_bridge_attach(struct drm_bridge *bridge,
> 				 enum drm_bridge_attach_flags flags)
> {
> 	......
>=20
> 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> 		DRM_ERROR("Fix bridge driver to make connector optional!");
> 		return -EINVAL;
> 	}
>=20
> 	return 0;
> }
> ......
> And then , create the connector outside of bridge:
> 	ret =3D drm_bridge_attach(encoder, &hdmi->bridge, NULL, 0);
> 	if (ret)
> 		return ret;
>=20
> 	hdmi->connector =3D drm_bridge_connector_init(drm, encoder);
> 	if (IS_ERR(hdmi->connector)) {
> 		dev_err(dev, "Unable to create bridge connector\n");
> 		ret =3D PTR_ERR(hdmi->connector);
> 		return ret;
> 	}

Yes, it looks reasonable as long as you don't break old drivers.

Maxime

--7eqgua22whoeilog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnk7gQAKCRDj7w1vZxhR
xeQuAQC/bNSjUtPUn5rw/CkAORZqINfxlg2OcRrWhcpVanD1FgEAlZb6CxKNcTRY
iD7vdCR46AF7/gr2QeRY/g9s722xxAA=
=fM4N
-----END PGP SIGNATURE-----

--7eqgua22whoeilog--
