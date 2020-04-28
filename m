Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B301BBB0A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 12:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EFA6E35D;
	Tue, 28 Apr 2020 10:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EDE6E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 10:19:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r26so2243960wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=kG3pAr197zg/lS7mr8VNmBDpYyQu9IqibYfSDpBEn7k=;
 b=kgKO0cBP5Bssi7//kT69CO7mZYdf7AyFI1rR8/f/GDrUOTsB4qJ+hKHVFiJ9XtAS/o
 qP+mV4FkHAYXgBQdP2KVdASCvVYZOtS4NY0qKQYpCQ4aOLNXho1KhTsnQToVN3oudcCY
 PExtKt2Fx6dhe7iJ0BX5OyWPtd3rl8z+CcTqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=kG3pAr197zg/lS7mr8VNmBDpYyQu9IqibYfSDpBEn7k=;
 b=p6TplEI7uNNGNf8mJoHo1DBinmh9ILeRpaGtC+jlN6Yhcpvqib7UQua7TN1oUxLGIq
 cYFKRXHoDz98tB/tt445GfHh/VRNARd8R8jgds42sXjVyhHlBmCmyiS9OH62dc0wZyR6
 wk/S8IIldR8kX7IskybWWQi5ST7qXSGs8hfG0ePCDgAy5QqsdY3Ly75cL7y8KFtmo8La
 BkiqAtnMLT5mLf22AUr+JIKteknOQ/Pj3V+u3Q+f5XNZaZcgmt/UUBmlTUfRlzFvRp86
 rSu3OCMy2veJawr9zu2UbHUvuDz48jjp8u2m87fShAcRQCMusFnNdtRgOlJBQw7TlT+v
 5mhg==
X-Gm-Message-State: AGi0PuZe3Y1wkI4bEEMUUBuacR9Da3vAdNd/X9sfpInRjdVSENMTAROT
 jHRwYb5dl7OeiiH9AnKzXdIwRY4JC30=
X-Google-Smtp-Source: APiQypKo38IfQ2C40mSf8kIDZj3p6vDuj6I8VfusT2k9k8ZJbwXy1/pntxWf3JXgC9wEVd95IwAP8w==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr3498028wme.99.1588069142896; 
 Tue, 28 Apr 2020 03:19:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w18sm24063758wrn.55.2020.04.28.03.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 03:19:02 -0700 (PDT)
Date: Tue, 28 Apr 2020 12:19:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/2] DRM: ARC: add HDMI 2.0 TX encoder support
Message-ID: <20200428101900.GG3456981@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
 <20200414232929.22788-2-Eugeniy.Paltsev@synopsys.com>
 <20200415173320.GG3456981@phenom.ffwll.local>
 <267d49d8-a73a-0317-cb50-0f63f0ced049@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <267d49d8-a73a-0317-cb50-0f63f0ced049@baylibre.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 05:55:38PM +0200, Neil Armstrong wrote:
> On 15/04/2020 19:33, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 02:29:28AM +0300, Eugeniy Paltsev wrote:
> >> The Synopsys ARC SoCs (like HSDK4xD) include on-chip DesignWare HDMI
> >> encoders. Support them with a platform driver to provide platform glue
> >> data to the dw-hdmi driver.
> >>
> >> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> >> ---
> >>  MAINTAINERS                       |   6 ++
> >>  drivers/gpu/drm/Makefile          |   2 +-
> >>  drivers/gpu/drm/arc/Kconfig       |   7 ++
> >>  drivers/gpu/drm/arc/Makefile      |   1 +
> >>  drivers/gpu/drm/arc/arc-dw-hdmi.c | 116 ++++++++++++++++++++++++++++++
> >>  5 files changed, 131 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index a6fbdf354d34..2aaed1190370 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -1258,6 +1258,12 @@ S:	Supported
> >>  F:	drivers/gpu/drm/arc/
> >>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
> >>  
> >> +ARC DW HDMI DRIVER
> >> +M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> >> +S:	Supported
> >> +F:	drivers/gpu/drm/arc/arc-dw-hdmi.c
> >> +F:	Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> >> +
> >>  ARCNET NETWORK LAYER
> >>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
> >>  L:	netdev@vger.kernel.org
> >> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> >> index 6493088a0fdd..5b0bcf7f45cd 100644
> >> --- a/drivers/gpu/drm/Makefile
> >> +++ b/drivers/gpu/drm/Makefile
> >> @@ -109,7 +109,7 @@ obj-y			+= panel/
> >>  obj-y			+= bridge/
> >>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
> >>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
> >> -obj-$(CONFIG_DRM_ARCPGU)+= arc/
> >> +obj-y			+= arc/
> >>  obj-y			+= hisilicon/
> >>  obj-$(CONFIG_DRM_ZTE)	+= zte/
> >>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
> >> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
> >> index e8f3d63e0b91..baec9d2a4fba 100644
> >> --- a/drivers/gpu/drm/arc/Kconfig
> >> +++ b/drivers/gpu/drm/arc/Kconfig
> >> @@ -8,3 +8,10 @@ config DRM_ARCPGU
> >>  	  Choose this option if you have an ARC PGU controller.
> >>  
> >>  	  If M is selected the module will be called arcpgu.
> >> +
> >> +config DRM_ARC_DW_HDMI
> >> +	tristate "ARC DW HDMI"
> >> +	depends on DRM && OF
> >> +	select DRM_DW_HDMI
> >> +	help
> >> +	  Synopsys DW HDMI driver for various ARC development boards
> >> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> >> index c7028b7427b3..7a156d8c2c3c 100644
> >> --- a/drivers/gpu/drm/arc/Makefile
> >> +++ b/drivers/gpu/drm/arc/Makefile
> >> @@ -1,3 +1,4 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >>  arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
> >>  obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> >> +obj-$(CONFIG_DRM_ARC_DW_HDMI) += arc-dw-hdmi.o
> >> diff --git a/drivers/gpu/drm/arc/arc-dw-hdmi.c b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> >> new file mode 100644
> >> index 000000000000..46a6ee09b302
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> >> @@ -0,0 +1,116 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +//
> >> +// Synopsys DW HDMI driver for various ARC development boards
> >> +//
> >> +// Copyright (C) 2020 Synopsys
> >> +// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> >> +
> >> +#include <linux/component.h>
> >> +#include <linux/module.h>
> >> +#include <linux/platform_device.h>
> >> +#include <drm/bridge/dw_hdmi.h>
> >> +#include <drm/drm_crtc_helper.h>
> >> +#include <drm/drm_edid.h>
> >> +#include <drm/drm_encoder_slave.h>
> >> +#include <drm/drm_of.h>
> >> +
> >> +static const struct dw_hdmi_mpll_config snps_hdmi_mpll_cfg[] = {
> >> +	{
> >> +		27000000, {
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 }
> >> +		},
> >> +	}, {
> >> +		74250000, {
> >> +			{ 0x0072, 0x0001},
> >> +			{ 0x0072, 0x0001},
> >> +			{ 0x0072, 0x0001}
> >> +		},
> >> +	}, {
> >> +		148500000, {
> >> +			{ 0x0051, 0x0002},
> >> +			{ 0x0051, 0x0002},
> >> +			{ 0x0051, 0x0002}
> >> +		},
> >> +	}, {
> >> +		~0UL, {
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 },
> >> +		},
> >> +	}
> >> +};
> >> +
> >> +static const struct dw_hdmi_curr_ctrl snps_hdmi_cur_ctr[] = {
> >> +	/* pixelclk    bpp8    bpp10   bpp12 */
> >> +	{ 27000000,  { 0x0000, 0x0000, 0x0000 }, },
> >> +	{ 74250000,  { 0x0008, 0x0008, 0x0008 }, },
> >> +	{ 148500000, { 0x001b, 0x001b, 0x001b }, },
> >> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 }, }
> >> +};
> >> +
> >> +
> >> +static const struct dw_hdmi_phy_config snps_hdmi_phy_config[] = {
> >> +	/* pixelclk   symbol  term    vlev */
> >> +	{ 27000000,   0x8009, 0x0004, 0x0232},
> >> +	{ 74250000,   0x8009, 0x0004, 0x0232},
> >> +	{ 148500000,  0x8009, 0x0004, 0x0232},
> >> +	{ ~0UL,       0x8009, 0x0004, 0x0232}
> >> +};
> >> +
> >> +static struct dw_hdmi_plat_data snps_dw_hdmi_drv_data = {
> >> +	.mpll_cfg   = snps_hdmi_mpll_cfg,
> >> +	.cur_ctr    = snps_hdmi_cur_ctr,
> >> +	.phy_config = snps_hdmi_phy_config,
> >> +};
> >> +
> >> +static const struct of_device_id snps_dw_hdmi_dt_ids[] = {
> >> +	{ .compatible = "snps,arc-dw-hdmi-hsdk", .data = &snps_dw_hdmi_drv_data },
> >> +	{ /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, snps_dw_hdmi_dt_ids);
> >> +
> >> +static int snps_dw_hdmi_probe(struct platform_device *pdev)
> >> +{
> >> +	const struct dw_hdmi_plat_data *plat_data;
> >> +	const struct of_device_id *match;
> >> +	struct dw_hdmi *hdmi;
> >> +
> >> +	if (!pdev->dev.of_node)
> >> +		return -ENODEV;
> >> +
> >> +	match = of_match_node(snps_dw_hdmi_dt_ids, pdev->dev.of_node);
> >> +	plat_data = match->data;
> >> +
> >> +	hdmi = dw_hdmi_probe(pdev, plat_data);
> > 
> > So this is kinda not how bridge drivers are supposed to be done nowadays,
> > direct calling into the driver was the old way, and dw-hdmi still works
> > like that. Modern way is roughly
> > - bridge drivers bind automatically to any bridge they support
> > - bridge drivers publish a bridge with drm_bridge_add()
> > - the driver using the bridge fishes out with dt magic using
> >   of_drm_find_bridge() or another of the related of_ functions
> 
> dw-hdmi is an IP, with some platform specific code and arrays to make it work
> on very different systems, thus we can't use this scheme everywhere....
> 
> Some platforms (like r-car) uses the "right" model because the IP is integrated
> as-is with the default PHY and as an independent IP on the system.
> 
> It's definitely not the case on Rockchip/Amlogic/Allwinner systems,
> and even worse on Amlogic system having a glue on top of the IP, and a
> custom PHY instead of the Synopsys PHY.
> 
> Thus it would be great this would be the case on a Synopsys SoC... but like
> other platforms they have platform specific parameters.
> 
> All this has been discussed and reviewed a few years ago, I would
> personally prefer "fishing out a bridge using dt magic" instead having
> 1k glue code around the IP.

I'm not opposed to the per-instance glue code, that seems required. I'm
kinda questioning where it is.

Current design is that the glue code is in the drm_device driver side of
things, with the drm_bridge somewhat awkward in-between. That doesn't seem
very clean.

I think more suitable for drm_bridge would be to push all the glue behind
the drm_bridge (maybe into separate files in a drm/bridge/dw-hdmi/
directory), and the drm_device driver side simply grabs a drm_bridge and
that's it. Then the drm_bridge abstraction lines up with the code
organization again. Atm it's a bit a confusing state of things.

Plan B would be to give up dw-hdmi being a drm_bridge, and rework dw-hdmi
to be some kind of helper library to build a driver for a specific dw-hdmi
instance. I think that would also be a clean design.

But right now we kinda have a bit of both, so not really abstracted, but
also not really a clean helper without midlayer either, and that doesn't
look great.
-Daniel

> 
> Neil
> 
> > 
> > I know a bit late, just spotted this because you brought your series here
> > up in my arc cleanup series, but can you pls look into adjusting
> > accordingly?
> > 
> > I shouldn't take more than moving this binding here into the dw-hdmi
> > driver, and switching arc itself over to the of_drm_find_bridge() call.
> > That way we could slowly work to transform old bridge drivers like dw-hdmi
> > to the new way, instead of adding more cases that will never get
> > converted.
> > 
> > Other upside is that arc stays a neat&tiny driver :-)
> > 
> > Thanks, Daniel
> > 
> >> +	if (IS_ERR(hdmi))
> >> +		return PTR_ERR(hdmi);
> >> +
> >> +	platform_set_drvdata(pdev, hdmi);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int snps_dw_hdmi_remove(struct platform_device *pdev)
> >> +{
> >> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> >> +
> >> +	dw_hdmi_remove(hdmi);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static struct platform_driver snps_dw_hdmi_platform_driver = {
> >> +	.probe  = snps_dw_hdmi_probe,
> >> +	.remove = snps_dw_hdmi_remove,
> >> +	.driver = {
> >> +		.name = KBUILD_MODNAME,
> >> +		.of_match_table = snps_dw_hdmi_dt_ids,
> >> +	},
> >> +};
> >> +module_platform_driver(snps_dw_hdmi_platform_driver);
> >> +
> >> +MODULE_LICENSE("GPL v2");
> >> +MODULE_DESCRIPTION("ARC specific DW-HDMI driver extension");
> >> +MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
> >> -- 
> >> 2.21.1
> >>
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
