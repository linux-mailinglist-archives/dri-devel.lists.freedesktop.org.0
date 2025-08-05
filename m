Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5429CB1AF2B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 09:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBC310E24B;
	Tue,  5 Aug 2025 07:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="I/6pa/0e";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mCGDxB0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F7010E24B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 07:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1754377779; x=1785913779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YpiBidLi55cVrA5Q1+JkbaVW/C/MZq1ureTbmcQrHW8=;
 b=I/6pa/0eFOUXvBm5c2rhqtBAHRP8D5IygqGTJZ95q/cRShi0iwsmflsD
 6kCCPjTjMziqxg/KOSDC5xSxta1q3MlqcR4LjtEClSw0mTspXx5am+xAV
 bHSd1ucWiLwPpRjzHCh34fzn/2bhyCHIRTgopyRaOslY5Gx/Puxff1lW+
 ehCvoPpIpQ99fMvlVrTAiu397/fNAZpYGCmaY5Qe3dzWO9UZk5A5S0m4h
 b5+JXOu/5ZIg1qD7LwQjrZKzl3e/lFnE7CbZ+NG3pTlHKAo1zIiSpi3nN
 4QzYY2hfsFWBw5HzA+Uo7F16PqlLU3akYp6PxRiZz4VucTEVdsgGWRawD w==;
X-CSE-ConnectionGUID: JM5QkLHOSZSxTMCBqVWOfA==
X-CSE-MsgGUID: 6UmsbkpeSIGksvfH4faI2A==
X-IronPort-AV: E=Sophos;i="6.17,265,1747692000"; d="scan'208";a="45583462"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 05 Aug 2025 09:09:34 +0200
X-CheckPoint: {6891AE2E-4D-9E907662-F3B2C93D}
X-MAIL-CPID: 0A8FDC37236988276C4B04A8AE834C4E_4
X-Control-Analysis: str=0001.0A002103.6891AE50.003B, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 081551725AA; Tue,  5 Aug 2025 09:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1754377770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpiBidLi55cVrA5Q1+JkbaVW/C/MZq1ureTbmcQrHW8=;
 b=mCGDxB0jy3BMyYnm9oICZiIMmst1TmTPoWrXK/Oy0Edbgnv84DuhqNdiwfEOxUGGTSXT5u
 ehIFjHL7KoB9kE6T1iQQUA6xSkTpR9VveRawepCf6yubUgNU4tH+nt92/5lP04V9mOCmTE
 esMJHmj+62rSfa5kT9J5XRcnMYJxsXTVNk96d5sugg0MEiYVkyhDPB4ooc6nS/LS4DxRIs
 pI/KghO7QXM0HjsdUwlDZ0dfM1A8D0HgOUutqVorxXMob09b+8VwqUnbI2YYCQplZVEhnn
 uJStobebeJcTEEsaH8SduL6Le3m7fpxX99Pi1JtwBY8J8uicM4B2KENXNZBWgA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
Date: Tue, 05 Aug 2025 09:09:26 +0200
Message-ID: <2380862.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250804104722.601440-6-shengjiu.wang@nxp.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Montag, 4. August 2025, 12:47:21 CEST schrieb Shengjiu Wang:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
>=20
> Data received from the audio subsystem can have an arbitrary component
> ordering. The HTX_PAI block has integrated muxing options to select which
> sections of the 32-bit input data word will be mapped to each IEC60958
> field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> individually select P,C,U,V,Data, and Preamble.
>=20
> Use component helper that imx8mp-hdmi-tx will be aggregate driver,
> imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
> bind() ops to get the plat_data from imx8mp-hdmi-tx device.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 205 +++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  55 +++++
>  include/drm/bridge/dw_hdmi.h                 |   6 +
>  5 files changed, 275 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index 9a480c6abb85..6c1a8bc5d4a0 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -18,12 +18,20 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	depends on OF
>  	depends on COMMON_CLK
>  	select DRM_DW_HDMI
> +	imply DRM_IMX8MP_HDMI_PAI
>  	imply DRM_IMX8MP_HDMI_PVI
>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
>  	help
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.
> =20
> +config DRM_IMX8MP_HDMI_PAI
> +	tristate "Freescale i.MX8MP HDMI PAI bridge support"
> +	depends on OF
> +	help
> +	  Choose this to enable support for the internal HDMI TX Parallel
> +	  Audio Interface found on the Freescale i.MX8MP SoC.
> +
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge=
/imx/Makefile
> index dd5d48584806..8d01fda25451 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) +=3D imx-ldb-helper.o
>  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) +=3D imx-legacy-bridge.o
>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) +=3D imx8mp-hdmi-tx.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) +=3D imx8mp-hdmi-pai.o
>  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) +=3D imx8mp-hdmi-pvi.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) +=3D imx8qm-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/d=
rm/bridge/imx/imx8mp-hdmi-pai.c
> new file mode 100644
> index 000000000000..9002974073ca
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <drm/bridge/dw_hdmi.h>
> +#include <sound/asoundef.h>
> +
> +#define HTX_PAI_CTRL			0x00
> +#define   ENABLE			BIT(0)
> +
> +#define HTX_PAI_CTRL_EXT		0x04
> +#define   WTMK_HIGH_MASK		GENMASK(31, 24)
> +#define   WTMK_LOW_MASK			GENMASK(23, 16)
> +#define   NUM_CH_MASK			GENMASK(10, 8)
> +#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
> +#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
> +
> +#define HTX_PAI_FIELD_CTRL		0x08
> +#define   B_FILT			BIT(31)
> +#define   PARITY_EN			BIT(30)
> +#define   END_SEL			BIT(29)
> +#define   PRE_SEL			GENMASK(28, 24)
> +#define   D_SEL				GENMASK(23, 20)
> +#define   V_SEL				GENMASK(19, 15)
> +#define   U_SEL				GENMASK(14, 10)
> +#define   C_SEL				GENMASK(9, 5)
> +#define   P_SEL				GENMASK(4, 0)
> +
> +#define HTX_PAI_STAT			0x0c
> +#define HTX_PAI_IRQ_NOMASK		0x10
> +#define HTX_PAI_IRQ_MASKED		0x14
> +#define HTX_PAI_IRQ_MASK		0x18
> +
> +struct imx8mp_hdmi_pai {
> +	struct device	*dev;
> +	struct regmap	*regmap;
> +};
> +
> +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
> +				   int width, int rate, int non_pcm,
> +				   int iec958)
> +{
> +	const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pdata->p=
riv_audio;
> +	int val;
> +
> +	/* PAI set control extended */
> +	val =3D  WTMK_HIGH(3) | WTMK_LOW(3);
> +	val |=3D FIELD_PREP(NUM_CH_MASK, channel - 1);
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
> +
> +	/* IEC60958 format */
> +	if (iec958) {
> +		val =3D FIELD_PREP_CONST(P_SEL,
> +				       __bf_shf(IEC958_SUBFRAME_PARITY));
> +		val |=3D FIELD_PREP_CONST(C_SEL,
> +					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
> +		val |=3D FIELD_PREP_CONST(U_SEL,
> +					__bf_shf(IEC958_SUBFRAME_USER_DATA));
> +		val |=3D FIELD_PREP_CONST(V_SEL,
> +					__bf_shf(IEC958_SUBFRAME_VALIDITY));
> +		val |=3D FIELD_PREP_CONST(D_SEL,
> +					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
> +		val |=3D FIELD_PREP_CONST(PRE_SEL,
> +					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
> +	} else {
> +		/* PCM choose 24bit*/
> +		val =3D FIELD_PREP(D_SEL, width - 24);
> +	}
> +
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
> +
> +	/* PAI start running */
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
> +}
> +
> +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
> +{
> +	const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pdata->p=
riv_audio;
> +
> +	/* Stop PAI */
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> +}
> +
> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *maste=
r, void *data)
> +{
> +	struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_data *)dat=
a;
> +	struct imx8mp_hdmi_pai *hdmi_pai;
> +
> +	hdmi_pai =3D dev_get_drvdata(dev);
> +
> +	plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> +	plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> +	plat_data->priv_audio =3D hdmi_pai;
> +
> +	return 0;
> +}
> +
> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *ma=
ster, void *data)
> +{
> +	struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_plat_data *)dat=
a;
> +
> +	plat_data->enable_audio =3D NULL;
> +	plat_data->disable_audio =3D NULL;
> +	plat_data->priv_audio =3D NULL;
> +}
> +
> +static const struct component_ops imx8mp_hdmi_pai_ops =3D {
> +	.bind   =3D imx8mp_hdmi_pai_bind,
> +	.unbind =3D imx8mp_hdmi_pai_unbind,
> +};
> +
> +static bool imx8mp_hdmi_pai_volatile_reg(struct device *dev, unsigned in=
t reg)
> +{
> +	switch (reg) {
> +	case HTX_PAI_IRQ_NOMASK:
> +	case HTX_PAI_IRQ_MASKED:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool imx8mp_hdmi_pai_writeable_reg(struct device *dev, unsigned i=
nt reg)
> +{
> +	switch (reg) {
> +	case HTX_PAI_CTRL:
> +	case HTX_PAI_CTRL_EXT:
> +	case HTX_PAI_FIELD_CTRL:
> +	case HTX_PAI_IRQ_NOMASK:
> +	case HTX_PAI_IRQ_MASKED:
> +	case HTX_PAI_IRQ_MASK:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config imx8mp_hdmi_pai_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.max_register =3D HTX_PAI_IRQ_MASK,
> +	.volatile_reg =3D imx8mp_hdmi_pai_volatile_reg,
> +	.writeable_reg =3D imx8mp_hdmi_pai_writeable_reg,
> +};
> +
> +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct imx8mp_hdmi_pai *hdmi_pai;
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	hdmi_pai =3D devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> +	if (!hdmi_pai)
> +		return -ENOMEM;
> +
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	hdmi_pai->dev =3D dev;
> +
> +	hdmi_pai->regmap =3D devm_regmap_init_mmio(dev, base, &imx8mp_hdmi_pai_=
regmap_config);
> +	if (IS_ERR(hdmi_pai->regmap)) {
> +		dev_err(dev, "regmap init failed\n");
> +		return PTR_ERR(hdmi_pai->regmap);
> +	}
> +
> +	dev_set_drvdata(dev, hdmi_pai);
> +
> +	return component_add(dev, &imx8mp_hdmi_pai_ops);
> +}
> +
> +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
> +}
> +
> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] =3D {
> +	{ .compatible =3D "fsl,imx8mp-hdmi-pai" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> +
> +static struct platform_driver imx8mp_hdmi_pai_platform_driver =3D {
> +	.probe		=3D imx8mp_hdmi_pai_probe,
> +	.remove		=3D imx8mp_hdmi_pai_remove,
> +	.driver		=3D {
> +		.name	=3D "imx8mp-hdmi-pai",
> +		.of_match_table =3D imx8mp_hdmi_pai_of_table,
> +	},
> +};
> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/dr=
m/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec289..ee08084d2394 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -5,11 +5,13 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
> =20
>  struct imx8mp_hdmi {
>  	struct dw_hdmi_plat_data plat_data;
> @@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_o=
ps =3D {
>  	.update_hpd	=3D dw_hdmi_phy_update_hpd,
>  };
> =20
> +static int imx8mp_dw_hdmi_bind(struct device *dev)
> +{
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct imx8mp_hdmi *hdmi;
> +	int ret;
> +
> +	hdmi =3D dev_get_drvdata(dev);
> +	plat_data =3D &hdmi->plat_data;
> +
> +	ret =3D component_bind_all(dev, plat_data);

Do you really need plat_data variable?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
> +
> +	return 0;
> +}
> +
> +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> +{
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct imx8mp_hdmi *hdmi;
> +
> +	hdmi =3D dev_get_drvdata(dev);
> +	plat_data =3D &hdmi->plat_data;
> +
> +	component_unbind_all(dev, plat_data);

Do you really need plat_data variable?

> +}
> +
> +static const struct component_master_ops imx8mp_dw_hdmi_ops =3D {
> +	.bind   =3D imx8mp_dw_hdmi_bind,
> +	.unbind =3D imx8mp_dw_hdmi_unbind,
> +};
> +
>  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct dw_hdmi_plat_data *plat_data;
> +	struct component_match *match;

Set match =3D NULL for drm_of_component_match_add (and subcalls) to allocat=
e memory.

Best regards
Alexander

> +	struct device_node *remote;
>  	struct imx8mp_hdmi *hdmi;
> +	int ret;
> =20
>  	hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
>  	if (!hdmi)
> @@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platform_devi=
ce *pdev)
> =20
>  	platform_set_drvdata(pdev, hdmi);
> =20
> +	/* port@2 is for hdmi_pai device */
> +	remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> +	if (remote && of_device_is_available(remote)) {
> +		drm_of_component_match_add(dev, &match, component_compare_of, remote);
> +
> +		of_node_put(remote);
> +
> +		ret =3D component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, matc=
h);
> +		if (ret)
> +			dev_warn(dev, "Unable to register aggregate driver\n");
> +		/*
> +		 * This audio function is optional for avoid blocking display.
> +		 * So just print warning message and no error is returned.
> +		 */
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platform_dev=
ice *pdev)
>  {
>  	struct imx8mp_hdmi *hdmi =3D platform_get_drvdata(pdev);
> =20
> +	component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> +
>  	dw_hdmi_remove(hdmi->dw_hdmi);
>  }
> =20
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 095cdd9b7424..336f062e1f9d 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
>  					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
> =20
> +	/*
> +	 * priv_audio is specially used for additional audio device to get
> +	 * driver data through this dw_hdmi_plat_data.
> +	 */
> +	void *priv_audio;
> +
>  	/* Platform-specific audio enable/disable (optional) */
>  	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
>  			     int width, int rate, int non_pcm, int iec958);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


