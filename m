Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A313893329
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 18:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C3510ED50;
	Sun, 31 Mar 2024 16:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 537 seconds by postgrey-1.36 at gabe;
 Sun, 31 Mar 2024 16:36:37 UTC
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5FF10ED51
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 9E1E4208B5;
 Sun, 31 Mar 2024 18:27:38 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ur-zwHDFpd9; Sun, 31 Mar 2024 18:27:37 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 0D1E4208C5;
 Sun, 31 Mar 2024 18:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 0D1E4208C5
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout2.secunet.com (Postfix) with ESMTP id F34E5800051;
 Sun, 31 Mar 2024 18:27:34 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:27:34 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:23:48 +0000
X-sender: <linux-kernel+bounces-125674-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com>
 ORCPT=rfc822;steffen.klassert@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAPDFCS25BAlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9ye
 TogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAxdLp8x1Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAGIACgBqAAAAmIoAAAUABAAUIAEAAAAcAAAAc3RlZmZlbi5rbGFzc2VydEBzZWN1bmV0LmNvbQUABgACAAEFACkAAgABDwAJAAAAQ0lBdWRpdGVkAgABBQACAAcAAQAAAAUAAwAHAAAAAAAFAAUAAgABBQBkAA8AAwAAAEh1Yg==
X-Source: SMTP:Default MBX-DRESDEN-01
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 34865
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=147.75.80.249; helo=am.mirrors.kernel.org;
 envelope-from=linux-kernel+bounces-125674-steffen.klassert=secunet.com@vger.kernel.org;
 receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com C40402025D
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=5.144.164.170
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1711795520; cv=none;
 b=WcugkkU6tb5csh4PX9OZdgHVsr1P4062beHTLdN5WXB4kD/XBuDzqhxqy0iPmBbIFbPCyI6lcPyITUvT50HGxQDPT1t4m9LzKkIuyIeqyPbVQRVtKvjEJ/H0b/0feN0wwD/W+lvqG0yLI98RVsDtld8hdF0n9V1Z7vVYBVdTfDY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1711795520; c=relaxed/simple;
 bh=c8N08nzajbS7Tgl5ZlzhtT3eqkrPtdhcztfed5kdWJU=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=NK4Nroftp0nAZ1N8etIzlc+Bzwmo2WUAU5ePSJ34UYbs2HxcXa8TBGYkys7N96wg9sPeBxdUseOW2a5YYxTlqHbISoTl1o5AjDVmx+uhWUX93252zAd53PUO7/eiKPka0k8bi/08qkV5GS71Fw8n6i6MUV9KV4l0YGr9kg7UvL0=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=none (p=none dis=none)
 header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org;
 arc=none smtp.client-ip=5.144.164.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none)
 header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=somainline.org
Date: Sat, 30 Mar 2024 11:27:32 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Caleb Connolly
 <caleb.connolly@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, "Caleb
 Connolly" <caleb@connolly.tech>
Subject: Re: [PATCH 3/3] drm: panel: Add LG sw43408 panel driver
Message-ID: <554zkisebym7gbbom3657ws7kqvyidggfmcvetjm6vrnwts3gl@l53hejt72b5q>
References: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
 <20240330-lg-sw43408-panel-v1-3-f5580fc9f2da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240330-lg-sw43408-panel-v1-3-f5580fc9f2da@linaro.org>
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On 2024-03-30 05:59:30, Dmitry Baryshkov wrote:
> From: Sumit Semwal <sumit.semwal@linaro.org>
> 
> LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel, used in some Pixel3
> phones.
> 
> Whatever init sequence we have for this panel isn't capable of
> initialising it completely, toggling the reset gpio ever causes the
> panel to die. Until this is resolved we avoid resetting the panel. The

Are you sure it is avoided?  This patch seems to be toggling reset_gpio in
sw43408_prepare()?

> disable/unprepare functions only put the panel to sleep mode and
> disable the backlight.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> [vinod: Add DSC support]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> [caleb: cleanup and support turning off the panel]
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> [DB: partially rewrote the driver and fixed DSC programming]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  MAINTAINERS                              |   8 +
>  drivers/gpu/drm/panel/Kconfig            |  11 ++
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 322 +++++++++++++++++++++++++++++++
>  4 files changed, 342 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b511a55101c..f4cf7ee97376 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6755,6 +6755,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
>  F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>  
> +DRM DRIVER FOR LG SW43408 PANELS
> +M:	Sumit Semwal <sumit.semwal@linaro.org>
> +M:	Caleb Connolly <caleb.connolly@linaro.org>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
> +F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
> +
>  DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
>  M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>  S:	Supported
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d037b3b8b999..f94c702735cb 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -335,6 +335,17 @@ config DRM_PANEL_LG_LG4573
>  	  Say Y here if you want to enable support for LG4573 RGB panel.
>  	  To compile this driver as a module, choose M here.
>  
> +config DRM_PANEL_LG_SW43408
> +	tristate "LG SW43408 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for LG sw43408 panel.
> +	  The panel has a 1080x2160 resolution and uses
> +	  24 bit RGB per pixel. It provides a MIPI DSI interface to
> +	  the host and has a built-in LED backlight.
> +
>  config DRM_PANEL_MAGNACHIP_D53E6EA8966
>  	tristate "Magnachip D53E6EA8966 DSI panel"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f156d7fa0bcc..a75687d13caf 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
> +obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
>  obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> new file mode 100644
> index 000000000000..365d25e14d54
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019-2024 Linaro Ltd
> + * Author: Sumit Semwal <sumit.semwal@linaro.org>
> + *	 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +#define NUM_SUPPLIES 2
> +
> +struct sw43408_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *link;
> +
> +	const struct drm_display_mode *mode;
> +
> +	struct regulator_bulk_data supplies[NUM_SUPPLIES];
> +
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct sw43408_panel, base);
> +}
> +
> +static int sw43408_unprepare(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_off(ctx->link);
> +	if (ret < 0)
> +		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->link);
> +	if (ret < 0)
> +		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
> +
> +	msleep(100);
> +
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +
> +	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +}
> +
> +static int sw43408_program(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	struct drm_dsc_picture_parameter_set pps;
> +	u8 dsc_en = 0x11;

Yeah, this is completely strange. Bit 0, 0x1, is to enable DSC which is
normal. 0x10 however, which is bit 4, selects PPS table 2.  Do you ever set
pps_identifier in struct drm_dsc_picture_parameter_set to 2?  Or is the table
that you send below bogus and/or not used?  Maybe the Driver IC on the other
end of the DSI link has a default PPS table with identifier 2 that works out of
the box?

> +	mipi_dsi_dcs_write_seq(ctx->link, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
> +
> +	mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	mipi_dsi_dcs_write_seq(ctx->link, 0x53, 0x0c, 0x30);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xf7, 0x01, 0x49, 0x0c);
> +
> +	mipi_dsi_dcs_exit_sleep_mode(ctx->link);
> +
> +	msleep(135);
> +
> +	mipi_dsi_compression_mode_raw(ctx->link, &dsc_en, 1);

Even though I think we should change this function to describe the known
bit layout of command 0x7 per the VESA DSI spec, for now replace 1 with
sizeof(dsc_en)?

> +
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xac);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xe5,
> +			       0x00, 0x3a, 0x00, 0x3a, 0x00, 0x0e, 0x10);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xb5,
> +			       0x75, 0x60, 0x2d, 0x5d, 0x80, 0x00, 0x0a, 0x0b,
> +			       0x00, 0x05, 0x0b, 0x00, 0x80, 0x0d, 0x0e, 0x40,
> +			       0x00, 0x0c, 0x00, 0x16, 0x00, 0xb8, 0x00, 0x80,
> +			       0x0d, 0x0e, 0x40, 0x00, 0x0c, 0x00, 0x16, 0x00,
> +			       0xb8, 0x00, 0x81, 0x00, 0x03, 0x03, 0x03, 0x01,
> +			       0x01);
> +	msleep(85);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xcd,
> +			       0x00, 0x00, 0x00, 0x19, 0x19, 0x19, 0x19, 0x19,
> +			       0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19,
> +			       0x16, 0x16);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xcb, 0x80, 0x5c, 0x07, 0x03, 0x28);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xc0, 0x02, 0x02, 0x0f);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
> +	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xca);
> +
> +	mipi_dsi_dcs_set_display_on(ctx->link);

Any specific reason to not have the (un)blanking sequence in the enable/disable
callbacks and leaving display configuration in (un)prepare?

> +	msleep(50);
> +
> +	ctx->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	drm_dsc_pps_payload_pack(&pps, ctx->link->dsc);
> +	mipi_dsi_picture_parameter_set(ctx->link, &pps);

I'm always surprised why this is sent _after_ turning the display on (unblanking
it).  Wouldn't that cause unnecessary corruption?

> +
> +	ctx->link->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static int sw43408_prepare(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(5000, 6000);
> +
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +
> +	ret = sw43408_program(panel);
> +	if (ret)
> +		goto poweroff;
> +
> +	return 0;
> +
> +poweroff:
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	return ret;
> +}
> +
> +static int sw43408_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct sw43408_panel *ctx = to_panel_info(panel);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, ctx->mode);
> +}
> +
> +static int sw43408_backlight_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	uint16_t brightness = backlight_get_brightness(bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +}
> +
> +const struct backlight_ops sw43408_backlight_ops = {
> +	.update_status = sw43408_backlight_update_status,
> +};
> +
> +static int sw43408_backlight_init(struct sw43408_panel *ctx)
> +{
> +	struct device *dev = &ctx->link->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_PLATFORM,
> +		.brightness = 255,
> +		.max_brightness = 255,
> +	};
> +
> +	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
> +							ctx->link,
> +							&sw43408_backlight_ops,
> +							&props);
> +
> +	if (IS_ERR(ctx->base.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
> +				     "Failed to create backlight\n");
> +
> +	return 0;
> +}
> +
> +static const struct drm_panel_funcs sw43408_funcs = {
> +	.unprepare = sw43408_unprepare,
> +	.prepare = sw43408_prepare,
> +	.get_modes = sw43408_get_modes,
> +};
> +
> +static const struct drm_display_mode sw43408_default_mode = {
> +	.clock = 152340,
> +
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 20,
> +	.hsync_end = 1080 + 20 + 32,
> +	.htotal = 1080 + 20 + 32 + 20,
> +
> +	.vdisplay = 2160,
> +	.vsync_start = 2160 + 20,
> +	.vsync_end = 2160 + 20 + 4,
> +	.vtotal = 2160 + 20 + 4 + 20,
> +
> +	.width_mm = 62,
> +	.height_mm = 124,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct of_device_id sw43408_of_match[] = {
> +	{ .compatible = "lg,sw43408", .data = &sw43408_default_mode },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sw43408_of_match);
> +
> +static int sw43408_add(struct sw43408_panel *ctx)
> +{
> +	struct device *dev = &ctx->link->dev;
> +	int ret;
> +
> +	ctx->supplies[0].supply = "vddi"; /* 1.88 V */
> +	ctx->supplies[0].init_load_uA = 62000;
> +	ctx->supplies[1].supply = "vpnl"; /* 3.0 V */
> +	ctx->supplies[1].init_load_uA = 857000;
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		dev_err(dev, "cannot get reset gpio %ld\n",
> +			      PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	ret = sw43408_backlight_init(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->base.prepare_prev_first = true;
> +
> +	drm_panel_init(&ctx->base, dev, &sw43408_funcs, DRM_MODE_CONNECTOR_DSI);
> +
> +	drm_panel_add(&ctx->base);
> +	return ret;
> +}
> +
> +static int sw43408_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct sw43408_panel *ctx;
> +	struct drm_dsc_config *dsc;
> +	int ret;
> +
> +	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->mode = of_device_get_match_data(&dsi->dev);
> +	dsi->mode_flags = MIPI_DSI_MODE_LPM;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = 4;
> +
> +	ctx->link = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ret = sw43408_add(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The panel is DSC panel only, set the dsc params */
> +	dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);

We've recently decided to store struct drm_dsc_config in struct sw43408_panel
and save on an extra allocation.

> +	if (!dsc)
> +		return -ENOMEM;
> +
> +	dsc->dsc_version_major = 0x1;
> +	dsc->dsc_version_minor = 0x1;
> +
> +	dsc->slice_height = 16;
> +	dsc->slice_width = 540;
> +	dsc->slice_count = 2;

Maybe incorporate with a comment that slice_count * slice_width == the width of
the mode?

- Marijn

> +	dsc->bits_per_component = 8;
> +	dsc->bits_per_pixel = 8 << 4;
> +	dsc->block_pred_enable = true;
> +
> +	dsi->dsc = dsc;
> +
> +	return mipi_dsi_attach(dsi);
> +}
> +
> +static void sw43408_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = sw43408_unprepare(&ctx->base);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to unprepare panel: %d\n",
> +			      ret);
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->base);
> +}
> +
> +static struct mipi_dsi_driver sw43408_driver = {
> +	.driver = {
> +		.name = "panel-lg-sw43408",
> +		.of_match_table = sw43408_of_match,
> +	},
> +	.probe = sw43408_probe,
> +	.remove = sw43408_remove,
> +};
> +module_mipi_dsi_driver(sw43408_driver);
> +
> +MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> +MODULE_DESCRIPTION("LG SW436408 MIPI-DSI LED panel");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.39.2
> 

