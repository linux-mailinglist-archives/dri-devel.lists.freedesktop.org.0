Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227841EFEE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB636EDA3;
	Fri,  1 Oct 2021 14:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9106EDA3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:46:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a18so3809319wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DeKM/glQH1OST7hI85kU7s7231VCn/y2isG1tUK7Ir0=;
 b=M4ag6i3gm93WRjWENtKbZH051fks8wpKb0SfvhEA7HQGdGA1FSUPRdgu8F+hbEG5zB
 u6VTglWErZt4Xalf4kMdC/MvuGZP8QAQIeO5Oyfv9aidFRTNfNeovHL+fHpDeKKAAyEv
 zqA0fh0xPp3om/oLi36TZ3lYKr/nToqDOdbFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DeKM/glQH1OST7hI85kU7s7231VCn/y2isG1tUK7Ir0=;
 b=kmqnCELjRqkmIP5MFdArZexAR0OE9MIKtX8gk5pGsHSUfGBcEoN902ZCokgoXMK7x5
 1bCH+SggB8cEgDyyVmmIk5KSDWYGNeTQvGSJ6UoVFI/IitZmdnbZ0/Mkb42q/TCjzHQv
 FeoHoBOyGT3m4qCzpdln+E3PE9Zk6+shD9oexbMhxRASIh1z+VF12adSQt3EfsMBmXAp
 QNFrrc29vUAqh69zIpEvlR9rxoetMYrf4dKQ88ZEoriARncF9rUWEcHCMLAsO8sAfsxw
 1UnHTypzgk1yf47d66pAMiluevpkTSG2xz3+J2sD1JUAEE0VTbKLU7qwMvOG//vkNpKs
 nSng==
X-Gm-Message-State: AOAM533HowdVBwWwU45YUVvQHAbjh2ob5/apKqzN0JvnD3YugToAoqLa
 /u7ORFBBdirb9UztQAaajR5xwJYORDcyxg==
X-Google-Smtp-Source: ABdhPJzykEQbyUPRkXyhqkDipVTH6/M/0MxCt1oDUgo/ZvB6C2gtIYyWX7znf6uM+569qUKP5nL3mg==
X-Received: by 2002:adf:e94d:: with SMTP id m13mr13277806wrn.28.1633099577457; 
 Fri, 01 Oct 2021 07:46:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y197sm9135278wmc.18.2021.10.01.07.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 07:46:16 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:46:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <YVcfN701HE9tuIsx@phenom.ffwll.local>
References: <f079a5d2-3095-1065-85c2-9d510260215b@linux.intel.com>
 <YVbZ/P3FA4KuL2/w@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVbZ/P3FA4KuL2/w@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Oct 01, 2021 at 11:50:52AM +0200, Daniel Vetter wrote:
> On Thu, Sep 30, 2021 at 12:06:21PM +0200, Maarten Lankhorst wrote:
> > drm-misc-fixes-2021-09-30:
> > drm-misc-fixes for v5.15:
> > - Not sure if drm-misc-fixes-2021-09-08 tag was pulled, assuming it is.
> > - Power management fixes for vc4.
> > - Compiler fix for vc4.
> > - Cursor fix for nouveau.
> > - Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
> > - Small rockchip fixes.
> > - Fix DT bindings indent for ili9341.
> > - Fix y030xx067a init sequence to not get a yellow tint.
> > - Kconfig fix for fb_simple vs simpledrm.
> > The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> > 
> >   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-09-30
> > 
> > for you to fetch changes up to fd09961dbb9ca6558d8ad318a3967c1048bdb090:
> > 
> >   fbdev: simplefb: fix Kconfig dependencies (2021-09-29 09:26:58 +0200)
> > 
> > ----------------------------------------------------------------
> > drm-misc-fixes for v5.15:
> > - Not sure if drm-misc-fixes-2021-09-08 tag was pulled, assuming it is.

Dave said he won't pull it and just cherry-picked the ttm fix, and asked
for a rebase of the remaining bits.

> > - Power management fixes for vc4.
> > - Compiler fix for vc4.
> > - Cursor fix for nouveau.
> > - Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
> > - Small rockchip fixes.
> > - Fix DT bindings indent for ili9341.
> > - Fix y030xx067a init sequence to not get a yellow tint.
> > - Kconfig fix for fb_simple vs simpledrm.
> 
> I can't pull this, because it conflicts with vc4 reverts in -rc2. There's
> a completely busted merge resolution in drm-tip, which doesn't even
> compile.
> 
> Please
> - drop all vc4 patches
> - rebase onto -rc3 or -rc4 if it's too late
> 
> I'll do the pull to Linus this afternoon, would be good to get the other
> fixes in.

I didn't see anything, so I guess it's going to be rebase onto -rc4 next
week. Please don't fumble this for another week, the kmb fix is almost a
month old by now because it keeps falling through cracks. drm-misc is
supposed to be worry-free, not "where is my drm-misc-fixes" pull request
land ...
-Daniel

> -Daniel
> 
> > 
> > ----------------------------------------------------------------
> > Arnd Bergmann (1):
> >       fbdev: simplefb: fix Kconfig dependencies
> > 
> > Ben Skeggs (3):
> >       drm/nouveau/kms/tu102-: delay enabling cursor until after assign_windows
> >       drm/nouveau/ga102-: support ttm buffer moves via copy engine
> >       drm/nouveau/fifo/ga102: initialise chid on return from channel creation
> > 
> > Chris Morgan (1):
> >       drm/rockchip: Update crtc fixup to account for fractional clk change
> > 
> > Christophe Branchereau (1):
> >       drm/panel: abt-y030xx067a: yellow tint fix
> > 
> > Edmund Dea (1):
> >       drm/kmb: Enable alpha blended second plane
> > 
> > Jernej Skrabec (1):
> >       drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup
> > 
> > Krzysztof Kozlowski (1):
> >       dt-bindings: panel: ili9341: correct indentation
> > 
> > Maarten Lankhorst (1):
> >       Merge drm/drm-fixes into drm-misc-fixes
> > 
> > Maxime Ripard (7):
> >       drm/vc4: select PM
> >       drm/vc4: hdmi: Make sure the controller is powered up during bind
> >       drm/vc4: hdmi: Rework the pre_crtc_configure error handling
> >       drm/vc4: hdmi: Split the CEC disable / enable functions in two
> >       drm/vc4: hdmi: Make sure the device is powered with CEC
> >       drm/vc4: hdmi: Warn if we access the controller while disabled
> >       drm/vc4: hdmi: Remove unused struct
> > 
> > Palmer Dabbelt (1):
> >       drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning
> > 
> > xinhui pan (1):
> >       drm/ttm: Fix a deadlock if the target BO is not idle during swap
> > 
> >  .../bindings/display/panel/ilitek,ili9341.yaml     |   2 +-
> >  drivers/gpu/drm/kmb/kmb_drv.c                      |   8 +-
> >  drivers/gpu/drm/kmb/kmb_drv.h                      |   5 +
> >  drivers/gpu/drm/kmb/kmb_plane.c                    |  81 +++++-
> >  drivers/gpu/drm/kmb/kmb_plane.h                    |   5 +-
> >  drivers/gpu/drm/kmb/kmb_regs.h                     |   3 +
> >  drivers/gpu/drm/nouveau/dispnv50/head.c            |   2 +-
> >  drivers/gpu/drm/nouveau/include/nvif/class.h       |   2 +
> >  drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   1 +
> >  drivers/gpu/drm/nouveau/nouveau_bo.c               |   1 +
> >  drivers/gpu/drm/nouveau/nouveau_chan.c             |   6 +-
> >  drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +
> >  drivers/gpu/drm/nouveau/nv84_fence.c               |   2 +-
> >  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   3 +
> >  drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |   1 +
> >  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   | 311 +++++++++++++++++++++
> >  drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    |   7 +-
> >  drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   4 +-
> >  drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  26 +-
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |   7 +-
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |   4 +-
> >  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |  97 ++++---
> >  drivers/gpu/drm/vc4/Kconfig                        |   1 +
> >  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 133 +++++----
> >  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   6 +
> >  drivers/of/base.c                                  |   1 +
> >  drivers/video/fbdev/Kconfig                        |   5 +-
> >  28 files changed, 591 insertions(+), 139 deletions(-)
> >  create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
