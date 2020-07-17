Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4D223859
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD196ED81;
	Fri, 17 Jul 2020 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36AF6ED81
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:28:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r12so10175963wrj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=IDRMoK9XAqR3KP28NyAj73nC8S++fY+3q8RW1Xp505E=;
 b=aUuIOdSl1Hj52p0XnwvTfGJv9BPtvFdL8zLQrtkTSwIDw2JYb3HK83DDvrMtVnhXDc
 eIf/lbmn+YLu0T7EVirEA+aGzoUXS9v86RVDH8na4723Hec1IskpkZmj9g3JUVx7lmZc
 7rx8Is9uwbAulqVYWR8hCQo/QMUrlBHHYy9Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=IDRMoK9XAqR3KP28NyAj73nC8S++fY+3q8RW1Xp505E=;
 b=ncv5tPndbt347qGfm9MSY/cDbOXia/llesE6gqIwXO1KZFy9AfOeKaLHkFW6Nf+klk
 1X/nNxXCXfK3IR/uRJJjRMX1ZHX4VWCDU9YK8Y1rb7h5sd0FX0669T2QH/tF8NmPGDSR
 HLaRassww+erG0iQW7TjHmxgHWg676HiFssOoGw9tWaGrS1iPYMdy33sCF8nCq4PIc4C
 NEc6NISYe+HWwJLefvRDGbMPOjmNtQMm/fqRU/Mh7usZwBeR5ElHlaGL3Yi3gjKMrOIz
 Pb9t5F2rmhlplC5fjDOFCd9CcsIFxO+x/dHnN6bPIKkyWhZyBimdwnKTS+AlL5amzc4C
 uZwQ==
X-Gm-Message-State: AOAM53344mABZ1acKFxLgeYCFvK7nwSHYwKpwoYhiBwsYRZl2+kJ997B
 z7vU4+/WJ/D+OH50WvNvNlwa6g==
X-Google-Smtp-Source: ABdhPJw6LBUxHmaeROzirZrFEGpc4HNi8ILpqRqn+Y1tz0WruvUTrSUUco/JdB7EQoAG5E3nVF/cpA==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr9226933wra.165.1594978081123; 
 Fri, 17 Jul 2020 02:28:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm13287743wrq.15.2020.07.17.02.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:28:00 -0700 (PDT)
Date: Fri, 17 Jul 2020 11:27:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v5 0/4] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200717092758.GR3278063@phenom.ffwll.local>
Mail-Followup-To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, lukas@mntmn.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
 <3c03afff3256ec36e12b9d9408830fbb4853f982.camel@pengutronix.de>
 <CAKMK7uGsveS+cwxiTq7BGrB1OcE_ff9bAxgSFDMUSmS7gRLJ7g@mail.gmail.com>
 <febb665904a9c3c680363be8ea83f243ccd09cb7.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <febb665904a9c3c680363be8ea83f243ccd09cb7.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, lukas@mntmn.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 11:12:39AM +0200, Lucas Stach wrote:
> Am Freitag, den 17.07.2020, 10:59 +0200 schrieb Daniel Vetter:
> > On Fri, Jul 17, 2020 at 10:18 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > Hi Laurentiu,
> > > 
> > > Am Donnerstag, den 09.07.2020, 19:47 +0300 schrieb Laurentiu Palcu:
> > > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > > 
> > > > Hi,
> > > > 
> > > > This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> > > > includes only graphics plane support (no video planes), no HDR10 capabilities,
> > > > no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> > > > 
> > > > Support for the rest of the features will be added incrementally, in subsequent
> > > > patches.
> > > > 
> > > > The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> > > > MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).
> > > 
> > > I think the series (minus 3/5 and minor correction to the DT binding)
> > > is fine to go in now. So just some formal questions: are you going to
> > > maintain this driver in upstream? If so we should add a MAINTAINERS
> > > entry to that effect. I can offer to act as a reviewer in this case.
> > > 
> > > How do you intend to merge this? IMO pushing this through drm-misc
> > > seems like the right thing to do. If you agree I can help you get this
> > > applied. If you are going to maintain the driver on your own, I think
> > > you should then apply for commit rights to drm-misc.
> > 
> > drm/imx isn't listed yet as under the drm-misc umbrella, maybe we
> > should put the entire collective of imx drivers under drm-misc? Or
> > maybe it's just an oversight that the git repo isn't specified in the
> > MAINTAINERS entry. Also maybe we should add the pengutronix kernel
> > team alias there too?
> 
> drm/imx was exclusively the IPUv3 up until now, which is in fact
> maintained outside of drm-misc in its own git tree. This has worked
> quite well in the past so even though IPUv3 doesn't see a lot of churn
> these days the motivation to change anything to this workflow is quite
> low. And yes, the git tree is missing from the MAINTAINERS entry.
> 
> For the DCSS driver, if it's going to be maintained by NXP, I figured
> it might be easier for Laurentiu to push things into drm-misc than set
> up a separate public git tree. But IMHO that's fully up to him to
> decide.

/me puts on maintainer hat

Much prefer drm-misc over random people playing maintainer and fumbling
it. I think the reasonable options are either in the current imx tree, or
drm-misc. Standalone tree for these small drivers just doesn't make much
sense.
-Daniel

> 
> Regards,
> Lucas
> 
> > -Daniel
> > 
> > 
> > > Regards,
> > > Lucas
> > > 
> > > > Thanks,
> > > > Laurentiu
> > > > 
> > > > Changes in v5:
> > > >  * Rebased to latest;
> > > >  * Took out component framework support and made it a separate patch so
> > > >    that people can still test with HDP driver, which makes use of it.
> > > >    But the idea is to get rid of it once HDP driver's next versions
> > > >    will remove component framework as well;
> > > >  * Slight improvement to modesetting: avoid cutting off the pixel clock
> > > >    if the new mode and the old one are equal. Also, in this case, is
> > > >    not necessary to wait for DTG to shut off. This would allow to switch
> > > >    from 8b RGB to 12b YUV422, for example, with no interruptions (at least
> > > >    from DCSS point of view);
> > > >  * Do not fire off CTXLD when going to suspend, unless it still has
> > > >    entries that need to be committed to DCSS;
> > > >  * Addressed Rob's comments on bindings;
> > > > 
> > > > Changes in v4:
> > > >  * Addressed Lucas and Philipp's comments:
> > > >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> > > >    * Removed usage of devm_ functions since I'm already doing all the
> > > >      clean-up in the submodules_deinit();
> > > >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
> > > >    * Removed en_completion variable from dcss_crtc since this was
> > > >      introduced mainly to avoid vblank timeout warnings which were fixed
> > > >      by arming the vblank event in flush() instead of begin();
> > > >    * Removed clks_on and irq_enabled flags since all the calls to
> > > >      enabling/disabling clocks and interrupts were balanced;
> > > >    * Removed the custom atomic_commit callback and used the DRM core
> > > >      helper and, in the process, got rid of a workqueue that wasn't
> > > >      necessary anymore;
> > > >    * Fixed some minor DT binding issues flagged by Philipp;
> > > >    * Some other minor changes suggested by Lucas;
> > > >  * Removed YUV formats from the supported formats as these cannot work
> > > >    without the HDR10 module CSCs and LUTs. Will add them back when I
> > > >    will add support for video planes;
> > > > 
> > > > Changes in v3:
> > > >  * rebased to latest linux-next and made it compile as drmP.h was
> > > >    removed;
> > > >  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
> > > >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> > > >  * fixed a a spurious hang reported by Lukas Hartmann and encountered
> > > >    by me several times;
> > > >  * mask DPR and DTG interrupts by default, as they may come enabled from
> > > >    U-boot;
> > > > 
> > > > Changes in v2:
> > > >  * Removed '0x' in node's unit-address both in DT and yaml;
> > > >  * Made the address region size lowercase, to be consistent;
> > > >  * Removed some left-over references to P010;
> > > >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
> > > >    issues reported by kbuild for other architectures;
> > > > 
> > > > Laurentiu Palcu (5):
> > > >   drm/imx: compile imx directory by default
> > > >   drm/imx: Add initial support for DCSS on iMX8MQ
> > > >   drm/imx/dcss: add component framework functionality
> > > >   dt-bindings: display: imx: add bindings for DCSS
> > > >   arm64: dts: imx8mq: add DCSS node
> > > > 
> > > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  84 ++
> > > >  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  23 +
> > > >  drivers/gpu/drm/Makefile                      |   2 +-
> > > >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> > > >  drivers/gpu/drm/imx/Makefile                  |   1 +
> > > >  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
> > > >  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
> > > >  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
> > > >  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 314 +++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 183 ++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 185 ++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  43 +
> > > >  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> > > >  20 files changed, 4123 insertions(+), 1 deletion(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> > > > 
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
