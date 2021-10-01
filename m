Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDD41EA16
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 11:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB346EDAB;
	Fri,  1 Oct 2021 09:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618E66EDA4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 09:50:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so10722212wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OWCST7o7gp2ijWP3KwPkqvrJ36cG+6uOZUPy/JlzbFA=;
 b=Ada5j1HFg1hKfCJaLsi+XFmOsERS4pWzW4lK1D0qjEbPKYSiOBXi9DrmGYTB3IER4e
 ZON34eX4cIyCg5Nl9jRJptyDMwT3uiBXA7GpbhQvxNKuWPxDgVf6Tl4AwkX439ci7Y0Y
 /Hf8PJW3ZXzQpvgzCtP2FDNPVx1cn7+Q63Xj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OWCST7o7gp2ijWP3KwPkqvrJ36cG+6uOZUPy/JlzbFA=;
 b=qihLknF3GVWj072LNPHxIH3g7Iq2F6UKlF5QQBvt4TFlLRpv3npY9EDM/oLZQozo1y
 6GYxyjIrZfDTlN+2NLMzizcJbOglU3rViWX52tIeM6gZJbcm7nKb98GMrQ/pVDls44z8
 u5uS5mSbO2SrVc7CX88Fs1Rfpb/0cU5qEuq1l1+mzqx/n7o21UXOpSrm5ZB6S1hIW6fs
 1T0RBas02OKXBI4t/PPIb/v2RG78M3JrxnHOzOrcnX9KHqy1pW+Vc7Zx6p8tzME6qyUr
 XrK9utfRDQ5TKxdo+Cxq5Kz6rM5HyluN3sNJL7nUtrOD8/STRqMRWYP8hKvWYvHUCl0+
 4GnA==
X-Gm-Message-State: AOAM531rtVcfVdMAnBgEqhRYwI+cq55F0Z6MVipnkLoGvrFTqoy8C6J7
 uvczPZpt1LBHmNzuAgW3Gpxkfw==
X-Google-Smtp-Source: ABdhPJwSo8KN9zErRJ1PUT2m8oCFNF+krOPMHkiXEtTJZHhNeMR2jqCs5cCa2PpBNL0gHVlkirp3bw==
X-Received: by 2002:a1c:1d10:: with SMTP id d16mr3413526wmd.23.1633081854816; 
 Fri, 01 Oct 2021 02:50:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o3sm5319250wra.52.2021.10.01.02.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:50:54 -0700 (PDT)
Date: Fri, 1 Oct 2021 11:50:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <YVbZ/P3FA4KuL2/w@phenom.ffwll.local>
References: <f079a5d2-3095-1065-85c2-9d510260215b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f079a5d2-3095-1065-85c2-9d510260215b@linux.intel.com>
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

On Thu, Sep 30, 2021 at 12:06:21PM +0200, Maarten Lankhorst wrote:
> drm-misc-fixes-2021-09-30:
> drm-misc-fixes for v5.15:
> - Not sure if drm-misc-fixes-2021-09-08 tag was pulled, assuming it is.
> - Power management fixes for vc4.
> - Compiler fix for vc4.
> - Cursor fix for nouveau.
> - Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
> - Small rockchip fixes.
> - Fix DT bindings indent for ili9341.
> - Fix y030xx067a init sequence to not get a yellow tint.
> - Kconfig fix for fb_simple vs simpledrm.
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-09-30
> 
> for you to fetch changes up to fd09961dbb9ca6558d8ad318a3967c1048bdb090:
> 
>   fbdev: simplefb: fix Kconfig dependencies (2021-09-29 09:26:58 +0200)
> 
> ----------------------------------------------------------------
> drm-misc-fixes for v5.15:
> - Not sure if drm-misc-fixes-2021-09-08 tag was pulled, assuming it is.
> - Power management fixes for vc4.
> - Compiler fix for vc4.
> - Cursor fix for nouveau.
> - Fix ttm buffer moves for ampere gpu's by adding minimal acceleration support.
> - Small rockchip fixes.
> - Fix DT bindings indent for ili9341.
> - Fix y030xx067a init sequence to not get a yellow tint.
> - Kconfig fix for fb_simple vs simpledrm.

I can't pull this, because it conflicts with vc4 reverts in -rc2. There's
a completely busted merge resolution in drm-tip, which doesn't even
compile.

Please
- drop all vc4 patches
- rebase onto -rc3 or -rc4 if it's too late

I'll do the pull to Linus this afternoon, would be good to get the other
fixes in.
-Daniel

> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       fbdev: simplefb: fix Kconfig dependencies
> 
> Ben Skeggs (3):
>       drm/nouveau/kms/tu102-: delay enabling cursor until after assign_windows
>       drm/nouveau/ga102-: support ttm buffer moves via copy engine
>       drm/nouveau/fifo/ga102: initialise chid on return from channel creation
> 
> Chris Morgan (1):
>       drm/rockchip: Update crtc fixup to account for fractional clk change
> 
> Christophe Branchereau (1):
>       drm/panel: abt-y030xx067a: yellow tint fix
> 
> Edmund Dea (1):
>       drm/kmb: Enable alpha blended second plane
> 
> Jernej Skrabec (1):
>       drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup
> 
> Krzysztof Kozlowski (1):
>       dt-bindings: panel: ili9341: correct indentation
> 
> Maarten Lankhorst (1):
>       Merge drm/drm-fixes into drm-misc-fixes
> 
> Maxime Ripard (7):
>       drm/vc4: select PM
>       drm/vc4: hdmi: Make sure the controller is powered up during bind
>       drm/vc4: hdmi: Rework the pre_crtc_configure error handling
>       drm/vc4: hdmi: Split the CEC disable / enable functions in two
>       drm/vc4: hdmi: Make sure the device is powered with CEC
>       drm/vc4: hdmi: Warn if we access the controller while disabled
>       drm/vc4: hdmi: Remove unused struct
> 
> Palmer Dabbelt (1):
>       drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning
> 
> xinhui pan (1):
>       drm/ttm: Fix a deadlock if the target BO is not idle during swap
> 
>  .../bindings/display/panel/ilitek,ili9341.yaml     |   2 +-
>  drivers/gpu/drm/kmb/kmb_drv.c                      |   8 +-
>  drivers/gpu/drm/kmb/kmb_drv.h                      |   5 +
>  drivers/gpu/drm/kmb/kmb_plane.c                    |  81 +++++-
>  drivers/gpu/drm/kmb/kmb_plane.h                    |   5 +-
>  drivers/gpu/drm/kmb/kmb_regs.h                     |   3 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c            |   2 +-
>  drivers/gpu/drm/nouveau/include/nvif/class.h       |   2 +
>  drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c               |   1 +
>  drivers/gpu/drm/nouveau/nouveau_chan.c             |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +
>  drivers/gpu/drm/nouveau/nv84_fence.c               |   2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   3 +
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |   1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   | 311 +++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    |   7 +-
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   4 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  26 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |   7 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |   4 +-
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |  97 ++++---
>  drivers/gpu/drm/vc4/Kconfig                        |   1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 133 +++++----
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   6 +
>  drivers/of/base.c                                  |   1 +
>  drivers/video/fbdev/Kconfig                        |   5 +-
>  28 files changed, 591 insertions(+), 139 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
