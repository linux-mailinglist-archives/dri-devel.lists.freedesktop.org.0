Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E9E3E3A86
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 15:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472C5899F3;
	Sun,  8 Aug 2021 13:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED0E899F3
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 13:45:05 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso1833403pjy.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Aug 2021 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1AMjDifoKXxqiUrVy1mep30aqwlhXoP2ZKCFmO17aHs=;
 b=LYHCnZPX0jNPvDkIxI2SVP3IRfruUg9IWEyPIP/+0LPyzAN4W9Ft0M/RLMc07gGEuV
 EXXCdFRXE9btiOV5H7hJRIzi308yB4Hm7IB4ZzioJ6L8R+PRach5ZEPm7b5d5SrEsMLn
 7W42WX2BYUqSiqpwHMYQwyJMOd5e+rDv+jMn9MJyC3C1lw6R3jH07QJ0lSgnAQx/blym
 eTe74pxe1y/KA8eDJdgggtsrxbHzRE1dbEAM09MvkXD59jn3kfapp05iMGe4/9f46yoZ
 QDkuEgo9pyWvxRcZqv9nMzwbqr2aqQVMiDtEa+SQCTWC+WnaYXshzLbA1AGpJc1cxKwY
 vxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1AMjDifoKXxqiUrVy1mep30aqwlhXoP2ZKCFmO17aHs=;
 b=NI5UcGHSLlGxhaqZ8W+Tp/tU3ygSsje7norv7VQg3rePrv1KtbGvO28QEB8IPNwpGc
 V3WECBck/rOeaPPT8jtPbzcoylLC15JZEEPXIufqztVRBSPcSyCIFNN4LQTRi2f3mgr9
 tYYD5zsESEkbotIUcjtiNJhlTvMq8wpzN9IFErGUIVB9MpXAhS7+mEH4yOaxw/sjWbZG
 3Rqfnv3Tf5jVt3XW3jHSvNIIV6RS9Npq6spMLnF8WvPT5W9lzSuBTQJruw0iqDz245K0
 hNbu8KZkp8j2z3+TxWA9uce5ZlhuXXxim83YAalsIKERcj9OvGFhWzrbS6rtqkW08v3b
 qVEQ==
X-Gm-Message-State: AOAM531GI8VjX+2zO/mUcJWpIkLO6/7mGoB8SJ1Fg6u3+TpdNLkwcvRv
 eSKmFk8J51G59gr8azFQW8SfmA==
X-Google-Smtp-Source: ABdhPJwWb8643lRM+rP6uYFYh86EzJeff44NV2wTx0LUy+Gni3WcNA14BAulNAHgFqu7P3IY8XI2Pg==
X-Received: by 2002:a05:6a00:1744:b029:3c7:b14e:d74e with SMTP id
 j4-20020a056a001744b02903c7b14ed74emr13450835pfc.25.1628430304879; 
 Sun, 08 Aug 2021 06:45:04 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id ds6sm2063107pjb.32.2021.08.08.06.45.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 08 Aug 2021 06:45:04 -0700 (PDT)
Date: Sun, 8 Aug 2021 21:44:57 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephan Gerhold <stephan@gerhold.net>,
 Konrad Dybcio <konradybcio@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Truly NT35521 panel driver
Message-ID: <20210808134456.GB6795@dragon>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-3-shawn.guo@linaro.org>
 <YQqDb5eFqIx8tvAL@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQqDb5eFqIx8tvAL@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

Hi Stephan,

Thanks for looking at the patch!

On Wed, Aug 04, 2021 at 02:09:19PM +0200, Stephan Gerhold wrote:
> Hi Shawn,
> 
> Thanks for the patch!
> 
> On Wed, Aug 04, 2021 at 04:13:52PM +0800, Shawn Guo wrote:
> > It adds a drm driver for Truly NT35521 5.24" 1280x720 DSI panel, which
> > can be found on Sony Xperia M4 Aqua phone.  The panel backlight is
> > managed through DSI link.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/Kconfig               |   9 +
> >  drivers/gpu/drm/panel/Makefile              |   1 +
> >  drivers/gpu/drm/panel/panel-truly-nt35521.c | 491 ++++++++++++++++++++
> >  3 files changed, 501 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-truly-nt35521.c
> > 
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index ef87d92cdf49..cdc4abd5c40c 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -537,6 +537,15 @@ config DRM_PANEL_TPO_TPG110
> >  	  400CH LTPS TFT LCD Single Chip Digital Driver for up to
> >  	  800x400 LCD panels.
> >  
> > +config DRM_PANEL_TRULY_NT35521
> > +	tristate "Truly NT35521 panel"
> 
> I think the name "Truly NT35521" is a bit too generic. AFAIK "Truly" is
> a panel vendor and the NovaTek NT35521 is the panel controller. But
> there are almost certainly other Truly panels that were also combined
> with a NT35521 but need a slightly different configuration.
> 
> If you don't know more than "Truly NT35521" based on the Sony sources,
> maybe do it similar to "asus,z00t-tm5p5-n35596" and use a compatible
> like "sony,<device>-truly-nt35521". Would be good to clarify the Kconfig
> option here too.

Sounds good!

> 
> > +	depends on OF
> > +	depends on DRM_MIPI_DSI
> > +	depends on BACKLIGHT_CLASS_DEVICE
> > +	help
> > +	  Say Y here if you want to enable support for Truly NT35521
> > +	  1280x720 DSI panel.
> > +
> >  config DRM_PANEL_TRULY_NT35597_WQXGA
> >  	tristate "Truly WQXGA"
> >  	depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > index cae4d976c069..3d3c98cb7a7b 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -56,6 +56,7 @@ obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
> > +obj-$(CONFIG_DRM_PANEL_TRULY_NT35521) += panel-truly-nt35521.o
> >  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> >  obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
> >  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> > diff --git a/drivers/gpu/drm/panel/panel-truly-nt35521.c b/drivers/gpu/drm/panel/panel-truly-nt35521.c
> > new file mode 100644
> > index 000000000000..ea3cfb46be7e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-truly-nt35521.c
> > @@ -0,0 +1,491 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021, Linaro Limited
> > + */
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +
> > +struct nt35521_panel {
> > +	struct drm_panel panel;
> > +	struct device *dev;
> > +	struct gpio_desc *rst_gpio;
> > +	struct gpio_desc *pwrp5_gpio;
> > +	struct gpio_desc *pwrn5_gpio;
> > +	struct gpio_desc *en_gpio;
> > +	bool prepared;
> > +	bool enabled;
> > +};
> > +
> > +static inline struct nt35521_panel *panel_to_nt35521(struct drm_panel *panel)
> > +{
> > +	return container_of(panel, struct nt35521_panel, panel);
> > +}
> > +
> > +#define nt_dcs_write(seq...)						\
> > +({									\
> > +	const u8 d[] = { seq };						\
> > +	if (mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)) < 0)	\
> > +		DRM_DEV_ERROR(dev, "dcs write buffer failed\n");	\
> > +})
> > +
> > +#define nt_gen_write(seq...)						\
> > +({									\
> > +	const u8 d[] = { seq };						\
> > +	if (mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d)) < 0)		\
> > +		DRM_DEV_ERROR(dev, "generic write buffer failed\n");	\
> > +})
> > +
> > +static void nt35521_panel_on(struct nt35521_panel *nt)
> > +{
> > +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
> > +	struct device *dev = nt->dev;
> > +
> > +	/* Transmit data in low power mode */
> > +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> > +
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> > +	nt_dcs_write(0xff, 0xaa, 0x55, 0xa5, 0x80);
> > +	nt_dcs_write(0x6f, 0x11, 0x00);
> > +	nt_dcs_write(0xf7, 0x20, 0x00);
> > +	nt_dcs_write(0x6f, 0x01);
> > +	nt_dcs_write(0xb1, 0x21);
> > +	nt_dcs_write(0xbd, 0x01, 0xa0, 0x10, 0x08, 0x01);
> > +	nt_dcs_write(0xb8, 0x01, 0x02, 0x0c, 0x02);
> > +	nt_dcs_write(0xbb, 0x11, 0x11);
> > +	nt_dcs_write(0xbc, 0x00, 0x00);
> > +	nt_dcs_write(0xb6, 0x02);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
> > +	nt_dcs_write(0xb0, 0x09, 0x09);
> > +	nt_dcs_write(0xb1, 0x09, 0x09);
> > +	nt_dcs_write(0xbc, 0x8c, 0x00);
> > +	nt_dcs_write(0xbd, 0x8c, 0x00);
> > +	nt_dcs_write(0xca, 0x00);
> > +	nt_dcs_write(0xc0, 0x04);
> > +	nt_dcs_write(0xbe, 0xb5);
> > +	nt_dcs_write(0xb3, 0x35, 0x35);
> > +	nt_dcs_write(0xb4, 0x25, 0x25);
> > +	nt_dcs_write(0xb9, 0x43, 0x43);
> > +	nt_dcs_write(0xba, 0x24, 0x24);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
> > +	nt_dcs_write(0xee, 0x03);
> > +	nt_dcs_write(0xb0, 0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb6, 0x00,
> > +		     0xc3, 0x00, 0xce, 0x00, 0xe1, 0x00, 0xf3, 0x01,
> > +		     0x11);
> > +	nt_dcs_write(0xb1, 0x01, 0x2e, 0x01, 0x5c, 0x01, 0x82, 0x01,
> > +		     0xc3, 0x01, 0xfe, 0x02, 0x00, 0x02, 0x37, 0x02,
> > +		     0x77);
> > +	nt_dcs_write(0xb2, 0x02, 0xa1, 0x02, 0xd7, 0x02, 0xfe, 0x03,
> > +		     0x2c, 0x03, 0x4b, 0x03, 0x63, 0x03, 0x8f, 0x03,
> > +		     0x90);
> > +	nt_dcs_write(0xb3, 0x03, 0x96, 0x03, 0x98);
> > +	nt_dcs_write(0xb4, 0x00, 0x81, 0x00, 0x8b, 0x00, 0x9c, 0x00,
> > +		     0xa9, 0x00, 0xb5, 0x00, 0xcb, 0x00, 0xdf, 0x01,
> > +		     0x02);
> > +	nt_dcs_write(0xb5, 0x01, 0x1f, 0x01, 0x51, 0x01, 0x7a, 0x01,
> > +		     0xbf, 0x01, 0xfa, 0x01, 0xfc, 0x02, 0x34, 0x02, 0x76);
> > +	nt_dcs_write(0xb6, 0x02, 0x9f, 0x02, 0xd7, 0x02, 0xfc, 0x03, 0x2c,
> > +		     0x03, 0x4a, 0x03, 0x63, 0x03, 0x8f, 0x03, 0xa2);
> > +	nt_dcs_write(0xb7, 0x03, 0xb8, 0x03, 0xba);
> > +	nt_dcs_write(0xb8, 0x00, 0x01, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x2a,
> > +		     0x00, 0x41, 0x00, 0x67, 0x00, 0x87, 0x00, 0xb9);
> > +	nt_dcs_write(0xb9, 0x00, 0xe2, 0x01, 0x22, 0x01, 0x54, 0x01, 0xa3,
> > +		     0x01, 0xe6, 0x01, 0xe7, 0x02, 0x24, 0x02, 0x67);
> > +	nt_dcs_write(0xba, 0x02, 0x93, 0x02, 0xcd, 0x02, 0xf6, 0x03, 0x31,
> > +		     0x03, 0x6c, 0x03, 0xe9, 0x03, 0xef, 0x03, 0xf4);
> > +	nt_dcs_write(0xbb, 0x03, 0xf6, 0x03, 0xf7);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x03);
> > +	nt_dcs_write(0xb0, 0x22, 0x00);
> > +	nt_dcs_write(0xb1, 0x22, 0x00);
> > +	nt_dcs_write(0xb2, 0x05, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xb3, 0x05, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xb4, 0x05, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xb5, 0x05, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xba, 0x53, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xbb, 0x53, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xbc, 0x53, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xbd, 0x53, 0x00, 0x60, 0x00, 0x00);
> > +	nt_dcs_write(0xc0, 0x00, 0x34, 0x00, 0x00);
> > +	nt_dcs_write(0xc1, 0x00, 0x00, 0x34, 0x00);
> > +	nt_dcs_write(0xc2, 0x00, 0x00, 0x34, 0x00);
> > +	nt_dcs_write(0xc3, 0x00, 0x00, 0x34, 0x00);
> > +	nt_dcs_write(0xc4, 0x60);
> > +	nt_dcs_write(0xc5, 0xc0);
> > +	nt_dcs_write(0xc6, 0x00);
> > +	nt_dcs_write(0xc7, 0x00);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x05);
> > +	nt_dcs_write(0xb0, 0x17, 0x06);
> > +	nt_dcs_write(0xb1, 0x17, 0x06);
> > +	nt_dcs_write(0xb2, 0x17, 0x06);
> > +	nt_dcs_write(0xb3, 0x17, 0x06);
> > +	nt_dcs_write(0xb4, 0x17, 0x06);
> > +	nt_dcs_write(0xb5, 0x17, 0x06);
> > +	nt_dcs_write(0xb6, 0x17, 0x06);
> > +	nt_dcs_write(0xb7, 0x17, 0x06);
> > +	nt_dcs_write(0xb8, 0x00);
> > +	nt_dcs_write(0xb9, 0x00, 0x03);
> > +	nt_dcs_write(0xba, 0x00, 0x00);
> > +	nt_dcs_write(0xbb, 0x02, 0x03);
> > +	nt_dcs_write(0xbc, 0x02, 0x03);
> > +	nt_dcs_write(0xbd, 0x03, 0x03, 0x00, 0x03, 0x03);
> > +	nt_dcs_write(0xc0, 0x0b);
> > +	nt_dcs_write(0xc1, 0x09);
> > +	nt_dcs_write(0xc2, 0xa6);
> > +	nt_dcs_write(0xc3, 0x05);
> > +	nt_dcs_write(0xc4, 0x00);
> > +	nt_dcs_write(0xc5, 0x02);
> > +	nt_dcs_write(0xc6, 0x22);
> > +	nt_dcs_write(0xc7, 0x03);
> > +	nt_dcs_write(0xc8, 0x07, 0x20);
> > +	nt_dcs_write(0xc9, 0x03, 0x20);
> > +	nt_dcs_write(0xca, 0x01, 0x60);
> > +	nt_dcs_write(0xcb, 0x01, 0x60);
> > +	nt_dcs_write(0xcc, 0x00, 0x00, 0x02);
> > +	nt_dcs_write(0xcd, 0x00, 0x00, 0x02);
> > +	nt_dcs_write(0xce, 0x00, 0x00, 0x02);
> > +	nt_dcs_write(0xcf, 0x00, 0x00, 0x02);
> > +	nt_dcs_write(0xd1, 0x00, 0x05, 0x01, 0x07, 0x10);
> > +	nt_dcs_write(0xd2, 0x10, 0x05, 0x05, 0x03, 0x10);
> > +	nt_dcs_write(0xd3, 0x20, 0x00, 0x43, 0x07, 0x10);
> > +	nt_dcs_write(0xd4, 0x30, 0x00, 0x43, 0x07, 0x10);
> > +	nt_dcs_write(0xd0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +	nt_dcs_write(0xd5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +		     0x00, 0x00, 0x00, 0x00);
> > +	nt_dcs_write(0xd6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +		     0x00, 0x00, 0x00, 0x00);
> > +	nt_dcs_write(0xd7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +		     0x00, 0x00, 0x00, 0x00);
> > +	nt_dcs_write(0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +	nt_dcs_write(0xe5, 0x06);
> > +	nt_dcs_write(0xe6, 0x06);
> > +	nt_dcs_write(0xe7, 0x00);
> > +	nt_dcs_write(0xe8, 0x06);
> > +	nt_dcs_write(0xe9, 0x06);
> > +	nt_dcs_write(0xea, 0x06);
> > +	nt_dcs_write(0xeb, 0x00);
> > +	nt_dcs_write(0xec, 0x00);
> > +	nt_dcs_write(0xed, 0x30);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x06);
> > +	nt_dcs_write(0xb0, 0x31, 0x31);
> > +	nt_dcs_write(0xb1, 0x31, 0x31);
> > +	nt_dcs_write(0xb2, 0x2d, 0x2e);
> > +	nt_dcs_write(0xb3, 0x31, 0x34);
> > +	nt_dcs_write(0xb4, 0x29, 0x2a);
> > +	nt_dcs_write(0xb5, 0x12, 0x10);
> > +	nt_dcs_write(0xb6, 0x18, 0x16);
> > +	nt_dcs_write(0xb7, 0x00, 0x02);
> > +	nt_dcs_write(0xb8, 0x08, 0x31);
> > +	nt_dcs_write(0xb9, 0x31, 0x31);
> > +	nt_dcs_write(0xba, 0x31, 0x31);
> > +	nt_dcs_write(0xbb, 0x31, 0x08);
> > +	nt_dcs_write(0xbc, 0x03, 0x01);
> > +	nt_dcs_write(0xbd, 0x17, 0x19);
> > +	nt_dcs_write(0xbe, 0x11, 0x13);
> > +	nt_dcs_write(0xbf, 0x2a, 0x29);
> > +	nt_dcs_write(0xc0, 0x34, 0x31);
> > +	nt_dcs_write(0xc1, 0x2e, 0x2d);
> > +	nt_dcs_write(0xc2, 0x31, 0x31);
> > +	nt_dcs_write(0xc3, 0x31, 0x31);
> > +	nt_dcs_write(0xc4, 0x31, 0x31);
> > +	nt_dcs_write(0xc5, 0x31, 0x31);
> > +	nt_dcs_write(0xc6, 0x2e, 0x2d);
> > +	nt_dcs_write(0xc7, 0x31, 0x34);
> > +	nt_dcs_write(0xc8, 0x29, 0x2a);
> > +	nt_dcs_write(0xc9, 0x17, 0x19);
> > +	nt_dcs_write(0xca, 0x11, 0x13);
> > +	nt_dcs_write(0xcb, 0x03, 0x01);
> > +	nt_dcs_write(0xcc, 0x08, 0x31);
> > +	nt_dcs_write(0xcd, 0x31, 0x31);
> > +	nt_dcs_write(0xce, 0x31, 0x31);
> > +	nt_dcs_write(0xcf, 0x31, 0x08);
> > +	nt_dcs_write(0xd0, 0x00, 0x02);
> > +	nt_dcs_write(0xd1, 0x12, 0x10);
> > +	nt_dcs_write(0xd2, 0x18, 0x16);
> > +	nt_dcs_write(0xd3, 0x2a, 0x29);
> > +	nt_dcs_write(0xd4, 0x34, 0x31);
> > +	nt_dcs_write(0xd5, 0x2d, 0x2e);
> > +	nt_dcs_write(0xd6, 0x31, 0x31);
> > +	nt_dcs_write(0xd7, 0x31, 0x31);
> > +	nt_dcs_write(0xe5, 0x31, 0x31);
> > +	nt_dcs_write(0xe6, 0x31, 0x31);
> > +	nt_dcs_write(0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +	nt_dcs_write(0xd9, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +	nt_dcs_write(0xe7, 0x00);
> > +	nt_dcs_write(0x6f, 0x02);
> > +	nt_dcs_write(0xf7, 0x47);
> > +	nt_dcs_write(0x6f, 0x0a);
> > +	nt_dcs_write(0xf7, 0x02);
> > +	nt_dcs_write(0x6f, 0x17);
> > +	nt_dcs_write(0xf4, 0x60);
> > +	nt_dcs_write(0x6f, 0x01);
> > +	nt_dcs_write(0xf9, 0x46);
> > +	nt_dcs_write(0x6f, 0x11);
> > +	nt_dcs_write(0xf3, 0x01);
> > +	nt_dcs_write(0x35, 0x00);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> > +	nt_dcs_write(0xd9, 0x02, 0x03, 0x00);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> > +	nt_dcs_write(0xb1, 0x6c, 0x21);
> > +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
> > +	nt_dcs_write(0x35, 0x00);
> > +	nt_gen_write(0x11, 0x00);
> > +	msleep(120);
> > +	nt_gen_write(0x29, 0x00);
> > +	usleep_range(1000, 1500);
> > +	nt_dcs_write(0x53, 0x24);
> 
> Did you mix up "nt_dcs_write" and "nt_gen_write" here?
> The nt_gen_write(0x11, 0x00); looks like MIPI_DCS_EXIT_SLEEP_MODE
> and the nt_gen_write(0x29, 0x00); looks like MIPI_DCS_SET_DISPLAY_ON.
> 
> For reference you can pull your original reference DTB from Sony through
> my panel driver generator: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator

Wow, very nice!  It really deserves wider spread!

> 
> It produces the following (I compiled "msm8939-kanuti_tulip.dtb"
> from https://github.com/sonyxperiadev/kernel/tree/aosp/LA.BR.1.3.3_rb2.14,
> not sure if that is right):
> 
> 	// ...
> 	dsi_generic_write_seq(dsi, 0x35, 0x00);
> 
> 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> 	if (ret < 0) {
> 		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> 		return ret;
> 	}
> 	msleep(120);
> 
> 	ret = mipi_dsi_dcs_set_display_on(dsi);
> 	if (ret < 0) {
> 		dev_err(dev, "Failed to set display on: %d\n", ret);
> 		return ret;
> 	}
> 	usleep_range(1000, 2000);
> 
> 	dsi_generic_write_seq(dsi, 0x53, 0x24);
> 
> Which also suggests that generic and DCS writes are mixed up here.
> 
> Note however that you could not use the generated driver as-is,
> because Sony seems to use their own display driver instead of Qualcomm's
> and some things seem to be different.

I re-created the driver using your generator.  With modeling the 5v
control GPIOs with regulators and adding backlight-gpios support, the
driver works quite nicely, except the following two problems:

1) I have to drop the MIPI_DSI_MODE_LPM configuration from .update_status
   hook. Otherwise brightness did not get updated to panel.

---8<------
diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
index 31e5f942a039..eba926c6f722 100644
--- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
+++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
@@ -420,33 +420,23 @@ static int truly_nt35521_bl_update_status(struct backlight_device *bl)
        u16 brightness = backlight_get_brightness(bl);
        int ret;
 
-       dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
        ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
        if (ret < 0)
                return ret;
 
-       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-
        return 0;
 }
------>8---

2) The driver works good, if the kernel is launched via "fastboot boot".
   But if the kernel is flashed to eMMC and launched by bootloader with
   splash screen, kernel will fail to bring up the panel.  After kernel
   boots up, a blank & unblank cycle can get panel work though.

The problem 2) is not driver generator related.  @Konrad, did you see
it on asus-z00t-tm5p5-n35596 driver?

Shawn

> 
> > +}
> > +
> > +static void nt35521_panel_off(struct nt35521_panel *nt)
> > +{
> > +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
> > +	struct device *dev = nt->dev;
> > +
> > +	/* Transmit data in high speed mode */
> > +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> > +
> > +	nt_dcs_write(0x28, 0x00);
> > +	msleep(50);
> > +	nt_dcs_write(0x10, 0x00);
> > +	msleep(150);
> 
> A bit more deobfuscated from the panel driver generator:
> 
> 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> 
> 	ret = mipi_dsi_dcs_set_display_off(dsi);
> 	if (ret < 0) {
> 		dev_err(dev, "Failed to set display off: %d\n", ret);
> 		return ret;
> 	}
> 	msleep(50);
> 
> 	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> 	if (ret < 0) {
> 		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> 		return ret;
> 	}
> 	msleep(150);
> 
> (I'm mainly referring to the mipi_dsi_dcs_*() here instead of the
>  magic numbers...)
> 
> > +}
> > +
> > +static int nt35521_prepare(struct drm_panel *panel)
> > +{
> > +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> > +
> > +	if (nt->prepared)
> > +		return 0;
> > +
> > +	gpiod_set_value_cansleep(nt->pwrp5_gpio, 1);
> > +	usleep_range(1000, 1500);
> > +	gpiod_set_value_cansleep(nt->pwrn5_gpio, 1);
> > +	usleep_range(10000, 15000);
> > +	gpiod_set_value_cansleep(nt->rst_gpio, 0);
> > +	msleep(150);
> > +
> > +	nt35521_panel_on(nt);
> > +
> > +	nt->prepared = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static int nt35521_unprepare(struct drm_panel *panel)
> > +{
> > +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> > +
> > +	if (!nt->prepared)
> > +		return 0;
> > +
> > +	nt35521_panel_off(nt);
> > +
> > +	gpiod_set_value_cansleep(nt->rst_gpio, 1);
> > +
> > +	nt->prepared = false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int nt35521_enable(struct drm_panel *panel)
> > +{
> > +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> > +
> > +	if (nt->enabled)
> > +		return 0;
> > +
> > +	gpiod_set_value_cansleep(nt->en_gpio, 1);
> > +
> > +	nt->enabled = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static int nt35521_disable(struct drm_panel *panel)
> > +{
> > +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> > +
> > +	if (!nt->enabled)
> > +		return 0;
> > +
> > +	gpiod_set_value_cansleep(nt->en_gpio, 0);
> > +
> > +	nt->enabled = false;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct drm_display_mode nt35521_modes = {
> > +	.clock = 133306,
> > +	.hdisplay = 720,
> > +	.hsync_start = 720 + 632,
> > +	.hsync_end = 720 + 632 + 40,
> > +	.htotal = 720 + 632 + 40 + 295,
> > +	.vdisplay = 1280,
> > +	.vsync_start = 1280 + 18,
> > +	.vsync_end = 1280 + 18 + 1,
> > +	.vtotal = 1280 + 18 + 1 + 18,
> > +};
> > +
> > +static int nt35521_get_modes(struct drm_panel *panel,
> > +			      struct drm_connector *connector)
> > +{
> > +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> > +	struct drm_display_mode *mode;
> > +
> > +	mode = drm_mode_duplicate(connector->dev, &nt35521_modes);
> > +	if (!mode) {
> > +		DRM_DEV_ERROR(nt->dev, "failed to add display mode\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	drm_mode_set_name(mode);
> > +	drm_mode_probed_add(connector, mode);
> > +
> > +	connector->display_info.width_mm = 65;
> > +	connector->display_info.height_mm = 116;
> > +
> > +	return 1;
> > +}
> > +
> > +static const struct drm_panel_funcs nt35521_drm_funcs = {
> > +	.prepare = nt35521_prepare,
> > +	.unprepare = nt35521_unprepare,
> > +	.enable = nt35521_enable,
> > +	.disable = nt35521_disable,
> > +	.get_modes = nt35521_get_modes,
> > +};
> > +
> > +static int nt35521_backlight_update_status(struct backlight_device *bd)
> > +{
> > +	struct nt35521_panel *nt = bl_get_data(bd);
> > +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
> > +	u8 brightness = bd->props.brightness;
> 
> 	u8 brightness = backlight_get_brightness(bl);
> 
> Is preferred now I think(?).
> 
> > +	int ret;
> > +
> > +	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> > +				 &brightness,
> > +				 sizeof(brightness));
> 
> Does this work too?
> 
> 	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> 
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct backlight_ops nt35521_backlight_ops = {
> > +	.update_status = nt35521_backlight_update_status,
> > +};
> > +
> > +static int nt35521_probe(struct mipi_dsi_device *dsi)
> > +{
> > +	struct backlight_properties props;
> > +	struct device *dev = &dsi->dev;
> > +	struct nt35521_panel *nt;
> > +	int ret;
> > +
> > +	nt = devm_kzalloc(dev, sizeof(*nt), GFP_KERNEL);
> > +	if (!nt)
> > +		return -ENOMEM;
> > +
> > +	nt->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(nt->rst_gpio)) {
> > +		ret = PTR_ERR(nt->rst_gpio);
> > +		DRM_DEV_ERROR(dev, "failed to get reset GPIO: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	nt->pwrp5_gpio = devm_gpiod_get(dev, "pwr-positive5", GPIOD_OUT_LOW);
> > +	if (IS_ERR(nt->pwrp5_gpio)) {
> > +		ret = PTR_ERR(nt->pwrp5_gpio);
> > +		DRM_DEV_ERROR(dev, "failed to get positive5 GPIO: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	nt->pwrn5_gpio = devm_gpiod_get(dev, "pwr-negative5", GPIOD_OUT_LOW);
> > +	if (IS_ERR(nt->pwrn5_gpio)) {
> > +		ret = PTR_ERR(nt->pwrn5_gpio);
> > +		DRM_DEV_ERROR(dev, "failed to get negative5 GPIO: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> 
> These two GPIOs look a lot like typical 5V display regulators that would
> be better described through the regulator subsystem. You can declare
> them as fixed-regulator to toggle the GPIO.
> 
> > +	nt->en_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> > +	if (IS_ERR(nt->en_gpio)) {
> > +		ret = PTR_ERR(nt->en_gpio);
> > +		DRM_DEV_ERROR(dev, "failed to get enable GPIO: %d\n", ret);
> > +		return ret;
> > +	}
> 
> Does this refer to the "platform-bklight-en-gpio" in the Sony sources?
> Perhaps calling it "backlight-gpios" or something like that would be
> more clear to show that it's related to the backlight.
> 
> Thanks!
> Stephan
