Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5026263D8D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 08:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EA089FAD;
	Thu, 10 Sep 2020 06:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E4F89FAD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 06:47:46 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t76so4935079oif.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 23:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5BRUOzvPRq+ucLWlHMvjOAcK2A18unxu2vLExCmowo=;
 b=VSHIjfqG+wCS1T8UnTrVSqvUCwjGoIkQtc3XzrGMvc7toZdnbMgof0EmbPRAng7k3y
 BST0H4W7NKvDWttpVVF21xvqguaaIlFH6jxUjQ3mPD7YnRURomRx2N+FA/bjEe2/i+z0
 PY4AzNGs9SFYp6gm2JYg0PRsniafJLAcW2P8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5BRUOzvPRq+ucLWlHMvjOAcK2A18unxu2vLExCmowo=;
 b=tHtMG4r/Q3CZdogMpv4Vhmo2XQgxPdYeeQ3fCtNDoWecr2qd1bV/3B0RqVNcdYYhVE
 0WqZw6zebL8qnSo9VPlOpgcHPUPP8An2MabTeYIIaV1P3aVHce1uggmSECaMnHImNkxJ
 GtaPH8DmfRa8UTGAQax66DxrHoq8zhPiKWa4kWw1bcX2VAfBKMy7X35PCEfZvbgIJ6GA
 bplRE8IOkeT7LW4SUnih1XYMndokLYjF/VD+7/p9mEok38W4nBHNFLDke/Wgdtq14xWq
 uh2hzZd4Z2aq8LB8Xvr2ZSM7cB9jfLOZUzI/2hQRUynRdAvmUzDHdN1Q2IxP0lWwG+Zv
 LzKQ==
X-Gm-Message-State: AOAM5339lCZNJu1eBXiHjzRRlb8qq0jSg4BsJOMWMQMZ+2DgVFCF9QvX
 96+MheusLRMiYn2jGlV5ZKDBT+vDaizEZAOMlyUjpg==
X-Google-Smtp-Source: ABdhPJxt0Z/+Z2ELV37yJUgoYvATDTKzdcBUbPzvQCNtPwWNuGCIKgNBVTZD1Eg9V7mK+xR8Me+YiEmMm9lczLiRaZI=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2910610oib.14.1599720465269; 
 Wed, 09 Sep 2020 23:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200828083620.6m5yhcv7rg5tckzh@fsr-ub1864-141>
 <e882838158cb9e81440c8cdeb25d80bf3310e8a8.camel@pengutronix.de>
 <20200831112445.t4xfz33avdyx5w6p@fsr-ub1864-141>
 <f46d44f38008d214951994a340814570c182cc15.camel@pengutronix.de>
In-Reply-To: <f46d44f38008d214951994a340814570c182cc15.camel@pengutronix.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Sep 2020 08:47:34 +0200
Message-ID: <CAKMK7uG7s1j+k0WPq8H4OcTD0jP2_LpTy0SBw0RtP-ij1OS7Mw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
To: Lucas Stach <l.stach@pengutronix.de>
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
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, lukas@mntmn.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 9, 2020 at 5:03 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Laurentiu,
>
> On Mo, 2020-08-31 at 14:24 +0300, Laurentiu Palcu wrote:
> > Hi Lucas, Sam,
> >
> > On Mon, Aug 31, 2020 at 12:37:23PM +0200, Lucas Stach wrote:
> > > Hi Laurentiu,
> > >
> > > On Fr, 2020-08-28 at 11:36 +0300, Laurentiu Palcu wrote:
> > > > Hi Lucas,
> > > >
> > > > I was wondering about the plans to merge this series. Since not many
> > > > people can test it properly due to lack of DCSS support in the upstream
> > > > NWL driver (which I heard it's coming soon) and a completely nonexistent
> > > > HDP driver, are we going to take a leap of faith and merge it as is? Or
> > > > should we wait?
> > >
> > > I think even if the bridges aren't ready yet, the driver is in a good
> > > enough shape to merge it. There's no point in letting it accumulate
> > > bitrot while waiting for the bridges to land. Also I guess it will make
> > > bridge driver development a lot easier when the DCSS driver is in-tree.
> >
> > OK, fair enough.
> >
> > > > As to who is going to do the actual merge, I know we had a brief
> > > > discussion about it some time ago and I was supposed to apply for
> > > > drm-misc rights, however it feels a little awkward to merge my own
> > > > code... :) Though, I might not even qualify for drm-misc rights anyway,
> > > > considering I haven't been very active in this area... :/
> > >
> > > Please consider applying for drm-misc merge rights. Even if you don't
> > > do the initial merge I think it will come in handy in the long run.
> >
> > OK, I'll apply for drm-misc rights. Sam also encouraged me to do this in
> > a previous email. Since this series will be followed by a bunch of other
> > patches, enabling support for video planes, among other things, I guess
> > I'll need the rights anyway.
> >
> > > > On that note, I will probably need help with the merging, provided it's
> > > > still happenning. Will you be able to help me out with this?
> > >
> > > Sure, I'm having some time available this week. I'll give this v9
> > > another spin on my boards and will do the merge after that.
> >
> > Thanks Lucas. As a matter of fact, after Sam's email, I was preparing a
> > v10 after rebasing to latest drm-next. However, no conflicts were encountered
> > and the v9 series applied cleanly. Let me know if you encounter any
> > issues and I can resend it.
>
> I've tested this together with a hacked up eDP bridge driver stack on
> my boards. The testing hasn't been really in-depth, but things seem to
> work fine. I have now pushed the whole series into drm-misc-next.

Something doesn't compile too well

ERROR: modpost: "__aeabi_ldivmod"
[drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
ERROR: modpost: "__aeabi_uldivmod"
[drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!

Cheers, Daniel
>
> Regards,
> Lucas
>
> > Thanks,
> > Laurentiu
> >
> > > Regards,
> > > Lucas
> > >
> > > > Thanks,
> > > > laurentiu
> > > >
> > > > On Fri, Jul 31, 2020 at 11:18:28AM +0300, Laurentiu Palcu wrote:
> > > > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > > >
> > > > > Hi,
> > > > >
> > > > > This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> > > > > includes only graphics plane support (no video planes), no HDR10 capabilities,
> > > > > no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> > > > >
> > > > > Support for the rest of the features will be added incrementally, in subsequent
> > > > > patches.
> > > > >
> > > > > The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> > > > > MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).
> > > > >
> > > > > Thanks,
> > > > > Laurentiu
> > > > >
> > > > > Changes in v9:
> > > > >  * Fixed a compilation issue found by Guido in his setup: 'select
> > > > >    VIDEOMODE_HELPERS' was missing from Kconfig;
> > > > >  * Use imx8mq-clock.h in the bindings file so one can understand what
> > > > >    those clock values mean;
> > > > >  * no other changes done. Couldn't address the hang Guido reported as
> > > > >    it's not happening in my setup. However, in my tree, there are some
> > > > >    extra NWL and ADV patches applied on top of upstream ones... Also,
> > > > >    removing them and testing only with upstream, even if there's no
> > > > >    image out, does not produce a hang... :/
> > > > >
> > > > > Changes in v8:
> > > > >  * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
> > > > >    out. SRC is not used in DCSS driver;
> > > > >  * Nothing else changed;
> > > > >
> > > > > Changes in v7:
> > > > >  * Added a patch to initialize the connector using the drm_bridge_connector
> > > > >    API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
> > > > >    Guido's patch [1] applied and one fix for ADV [2]. Also, some extra
> > > > >    patches for ADV and NWL were needed, from our downstream tree, which
> > > > >    will be upstreamed soon by their author;
> > > > >  * Rest of the patches are untouched;
> > > > >
> > > > > [1] https://lists.freedesktop.org/archives/dri-devel/2020-July/273025.html
> > > > > [2] https://lists.freedesktop.org/archives/dri-devel/2020-July/273132.html
> > > > >
> > > > > Changes in v6:
> > > > >  * Addressed Rob's comment and added "additionalProperties: false" at
> > > > >    the end of the bindings' properties. However, this change surfaced
> > > > >    an issue with the assigned-clock* properties not being documented in
> > > > >    the properties section. Added the descriptions and the bindings patch
> > > > >    will need another review;
> > > > >  * Added an entry for DCSS driver in the MAINTAINERS file;
> > > > >  * Removed the component framework patch altogether;
> > > > >
> > > > > Changes in v5:
> > > > >  * Rebased to latest;
> > > > >  * Took out component framework support and made it a separate patch so
> > > > >    that people can still test with HDP driver, which makes use of it.
> > > > >    But the idea is to get rid of it once HDP driver's next versions
> > > > >    will remove component framework as well;
> > > > >  * Slight improvement to modesetting: avoid cutting off the pixel clock
> > > > >    if the new mode and the old one are equal. Also, in this case, is
> > > > >    not necessary to wait for DTG to shut off. This would allow to switch
> > > > >    from 8b RGB to 12b YUV422, for example, with no interruptions (at least
> > > > >    from DCSS point of view);
> > > > >  * Do not fire off CTXLD when going to suspend, unless it still has
> > > > >    entries that need to be committed to DCSS;
> > > > >  * Addressed Rob's comments on bindings;
> > > > >
> > > > > Changes in v4:
> > > > >  * Addressed Lucas and Philipp's comments:
> > > > >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> > > > >    * Removed usage of devm_ functions since I'm already doing all the
> > > > >      clean-up in the submodules_deinit();
> > > > >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
> > > > >    * Removed en_completion variable from dcss_crtc since this was
> > > > >      introduced mainly to avoid vblank timeout warnings which were fixed
> > > > >      by arming the vblank event in flush() instead of begin();
> > > > >    * Removed clks_on and irq_enabled flags since all the calls to
> > > > >      enabling/disabling clocks and interrupts were balanced;
> > > > >    * Removed the custom atomic_commit callback and used the DRM core
> > > > >      helper and, in the process, got rid of a workqueue that wasn't
> > > > >      necessary anymore;
> > > > >    * Fixed some minor DT binding issues flagged by Philipp;
> > > > >    * Some other minor changes suggested by Lucas;
> > > > >  * Removed YUV formats from the supported formats as these cannot work
> > > > >    without the HDR10 module CSCs and LUTs. Will add them back when I
> > > > >    will add support for video planes;
> > > > >
> > > > > Changes in v3:
> > > > >  * rebased to latest linux-next and made it compile as drmP.h was
> > > > >    removed;
> > > > >  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
> > > > >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> > > > >  * fixed a a spurious hang reported by Lukas Hartmann and encountered
> > > > >    by me several times;
> > > > >  * mask DPR and DTG interrupts by default, as they may come enabled from
> > > > >    U-boot;
> > > > >
> > > > > Changes in v2:
> > > > >  * Removed '0x' in node's unit-address both in DT and yaml;
> > > > >  * Made the address region size lowercase, to be consistent;
> > > > >  * Removed some left-over references to P010;
> > > > >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
> > > > >    issues reported by kbuild for other architectures;
> > > > >
> > > > >
> > > > > Laurentiu Palcu (5):
> > > > >   drm/imx: compile imx directory by default
> > > > >   drm/imx: Add initial support for DCSS on iMX8MQ
> > > > >   drm/imx/dcss: use drm_bridge_connector API
> > > > >   MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
> > > > >   dt-bindings: display: imx: add bindings for DCSS
> > > > >
> > > > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 +++
> > > > >  MAINTAINERS                                   |   8 +
> > > > >  drivers/gpu/drm/Makefile                      |   2 +-
> > > > >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> > > > >  drivers/gpu/drm/imx/Makefile                  |   1 +
> > > > >  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
> > > > >  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
> > > > >  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 325 +++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 198 +++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  44 +
> > > > >  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> > > > >  20 files changed, 4112 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> > > > >
> > > > > --
> > > > > 2.23.0
> > > > >
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
