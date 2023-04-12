Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5196DF855
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D57F10E823;
	Wed, 12 Apr 2023 14:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6E310E82A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:24:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f05f61adbeso2067055e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681309453;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vMEz+vyXmWkb2mfG3EHZCV47jXj0FhidszGd7fTtoWc=;
 b=fEBGZiRyV5TyAwpRZLY3WOk4FFfWb8Z9J1kkNUYf439UtScvY4mHv3lZZPTgU/zAyj
 d8qJm0X6JiRl0Q6O8U/mUh5nOSatKf+H+fQ80BSslKDq0CQ4WhnNOUIWUtSOb7Fb6N7O
 9BpiJNpa/tGboCgkoNkkK8M+50jwzYgDGeOOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681309453;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vMEz+vyXmWkb2mfG3EHZCV47jXj0FhidszGd7fTtoWc=;
 b=aFT+PYJ+Y9w4VZxvOM/dFBvJ2C/yUmj+t51l/NKUQ9+d7tFBQFYxiv0sXfU/hGt+SC
 UE9TM8q9bEzyb8p1rf3M5nbRf51PbliNUCo7eg6BEt1zIR65Na2jgIX4fTpfvy+vovXw
 C5nieZbG9ngU0ryKHdDZYf808/G30BsOmklZTRZtWpMGScfmt/x1AJwAQgjkRaI5nH4Z
 2RI12Wr9lQfy89eAvzd14h/130vsU1cL110SrqOi+5owQpwbKnFrWtY9/algXX8V/XR3
 f8g0qKFVp6u7MO4FltYZXds+nGd/BR1NORvSe0rP+TLjj63s+RZYln/h5YnKPxyhEfB+
 FUxw==
X-Gm-Message-State: AAQBX9eVHe92uLXcONY3yp9Ksn8U9SEGjHuZcki5UMR9wMMhuEeOPteu
 BwPQRb+I1VM/OM5zZTchankecw==
X-Google-Smtp-Source: AKy350a0Kx8S/h/sXssIu8kp88KU0tZTr+bARtQaM76YsW3sjREU/hZd1lhInQew6xRnYm9WPWr/5w==
X-Received: by 2002:a05:600c:46cb:b0:3f0:84b7:22cf with SMTP id
 q11-20020a05600c46cb00b003f084b722cfmr2137954wmo.2.1681309453585; 
 Wed, 12 Apr 2023 07:24:13 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b003ee1e07a14asm2563862wmq.45.2023.04.12.07.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 07:24:13 -0700 (PDT)
Date: Wed, 12 Apr 2023 16:24:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <ZDa/C/uGRhNnJFcV@phenom.ffwll.local>
References: <b7c37d4e-8f16-85dc-0f5f-3bd98f961395@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7c37d4e-8f16-85dc-0f5f-3bd98f961395@linux.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 03:32:30PM +0200, Maarten Lankhorst wrote:
> 
> Good afternoon Daniel, Dave,
> 
> One last pull request for drm-misc-next.
> 
> Small one, so easy to merge. As a result also more likely to eat your
> computer alive. ;)
> 
> Cheers,
> 
> ~Maarten
> 
> drm-misc-next-2023-04-12:
> 
> drm-misc-next for v6.4-rc1:
> 
> Cross-subsystem Changes:
> - Convert MIPI DSIM bridge to yaml.
> 
> Core Changes:
> - Fix UAF race in drm scheduler.
> 
> Driver Changes:
> - Add primary plane positioning support to VKMS.
> - Convert omapdrm fbdev emulation to in-kernel client.
> - Assorted small fixes to vkms, vc4, nouveau, vmwgfx.
> The following changes since commit e44f18c6ff8beef7b2b10592287f0a9766376d9b:
> 
>   drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting
> (2023-04-06 10:01:42 +0200)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-04-12

There's non-breakable space in this line, which broke dim and it took me a
while to figure out wtf is going on. Please copypaste more carefully :-)

> for you to fetch changes up to fd35174e13f98f9232c4aa66689816731d34ca28:
> 
>   drm/vmwgfx: remove unused vmw_overlay function (2023-04-11 13:48:55 -0400)

Pulled, thanks

> 
> ----------------------------------------------------------------
> drm-misc-next for v6.4-rc1:
> 
> Cross-subsystem Changes:
> - Convert MIPI DSIM bridge to yaml.
> 
> Core Changes:
> - Fix UAF race in drm scheduler.
> 
> Driver Changes:
> - Add primary plane positioning support to VKMS.
> - Convert omapdrm fbdev emulation to in-kernel client.
> - Assorted small fixes to vkms, vc4, nouveau, vmwgfx.
> 
> ----------------------------------------------------------------
> Asahi Lina (1):
>       drm/scheduler: Fix UAF race in drm_sched_entity_push_job()
> 
> Ben Dooks (1):
>       drm/nouveau/mc/ga100: make ga100_mc_device static
> 
> Jagan Teki (1):
>       dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to yaml
> 
> Javier Martinez Canillas (2):
>       drm/vkms: Drop vkms_connector_destroy() wrapper
>       drm/vkms: Remove <drm/drm_simple_kms_helper.h> include
> 
> Martin Krastev (2):
>       drm/vmwgfx: Drop mksstat_init_record fn as currently unused
>       drm/vmwgfx: Fix Legacy Display Unit atomic drm support
> 
> Maíra Canal (2):
>       drm/vkms: remove the need for the primary plane to be visible
>       drm/vkms: allow the primary plane to be positioned
> 
> Thomas Zimmermann (5):
>       drm/omapdrm: Include <linux/of.h>
>       drm/omapdrm: Remove fb from struct omap_fbdev
>       drm/omapdrm: Remove bo from struct omap_fbdev
>       drm/omapdrm: Remove fbdev from struct omap_drm_private
>       drm/omapdrm: Implement fbdev emulation as in-kernel client
> 
> Tom Rix (2):
>       drm/vc4: remove unused render_wait variable
>       drm/vmwgfx: remove unused vmw_overlay function
> 
> Zack Rusin (1):
>       drm/vmwgfx: Print errors when running on broken/unsupported configs
> 
> ruanjinjie (1):
>       drm/nouveau/disp: make gv100_disp_core_mthd_base static
> 
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml | 255
> +++++++++++++++++++++
>  .../bindings/display/exynos/exynos_dsim.txt        |  92 --------
>  MAINTAINERS                                        |   1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |   2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c     |   2 +-
>  drivers/gpu/drm/omapdrm/omap_debugfs.c             |   6 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c                 |  13 +-
>  drivers/gpu/drm/omapdrm/omap_drv.h                 |   3 -
>  drivers/gpu/drm/omapdrm/omap_fbdev.c               | 163 ++++++++-----
>  drivers/gpu/drm/omapdrm/omap_fbdev.h               |   9 +-
>  drivers/gpu/drm/scheduler/sched_entity.c           |  11 +-
>  drivers/gpu/drm/vc4/vc4_irq.c                      |   2 -
>  drivers/gpu/drm/vkms/vkms_output.c                 |  15 +-
>  drivers/gpu/drm/vkms/vkms_plane.c                  |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  29 +++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  62 +----
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   5 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  45 +++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |  35 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |   6 -
>  21 files changed, 465 insertions(+), 303 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>  delete mode 100644
> Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
