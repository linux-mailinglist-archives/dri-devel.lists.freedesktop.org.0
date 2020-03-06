Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC017BF80
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 14:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF30A6E200;
	Fri,  6 Mar 2020 13:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6909D89E08
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 13:46:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id i9so2474317wml.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 05:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iRlM6dnhXp1brh/nMnOKfpVP17NYPUXTMq4bCyTg//Q=;
 b=F9fni/3G+xdQRmzBadxqLYZK4oD9rSko0UIf7J8JBT6GlLjEg3p9lRDFiplUhiKOYd
 UyBY5aAVvN/n4eNPwryQ/K+iFIRkcko1uUAqkmjL8eKy5ndLU87r4tqvDTdw1yaENyHT
 yGHXKCDJbkpEnzaMIyQMq7/q5oww4vtHV0YN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iRlM6dnhXp1brh/nMnOKfpVP17NYPUXTMq4bCyTg//Q=;
 b=FjSMnW4h8GKCbyXwsHMd/cnr8hVdAyMx+FEJ38iJuPQ/VM5Si3t7/kJ2iGyUssUKT4
 BdjzPcqQ8aKZSY6Cg9lb/8cGPOoeGcQxkO/Km6JHun+cp7CcN41e0qvGtebmuNpxWr1y
 FrKke+yYQSlV6me0hc64Og9aHv8P8nZe21KkKkD3qIJpnGaTyqlATY7Uy4O08YgGK6c4
 cogtfI4VdA9HYztMVUWtr30/g+7XuUx3OoXYXXgsycHKr3SufgQtqE5gHrObQE2tX6Ii
 9zyHIdAB3xnlQ48NF4c6HyyFUdzfIuv7yZgccy1x9BTVYGujjut3wTfw557/IuCa+fQO
 53ZA==
X-Gm-Message-State: ANhLgQ2A2KURN6RMoyj5OwM82fIRjEV53lughFcwv7GH4P/CjkBXsXxs
 Nuj7a37mAenN3tKaQAftgTCPKg==
X-Google-Smtp-Source: ADFU+vvzKBKNc/0vf/kvZjy+1MWA5DGcsIBQ8VIYJT9pTdngR2JPOSzpat0feP8Lo1EEss67ilDpcQ==
X-Received: by 2002:a05:600c:2102:: with SMTP id
 u2mr3864153wml.99.1583502416969; 
 Fri, 06 Mar 2020 05:46:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w22sm14353458wmk.34.2020.03.06.05.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:46:55 -0800 (PST)
Date: Fri, 6 Mar 2020 14:46:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [RESEND PATCH v2 0/7] drm: drm_fb_helper cleanup.
Message-ID: <20200306134653.GA2363188@phenom.ffwll.local>
References: <20200305120434.111091-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305120434.111091-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 05:34:27PM +0530, Pankaj Bharadiya wrote:
> This series addresses below drm_fb_helper tasks from
> Documentation/gpu/todo.rst.
> 
> - The max connector argument for drm_fb_helper_init() isn't used
>   anymore and can be removed.
> 
> - The helper doesn't keep an array of connectors anymore so these can
>   be removed: drm_fb_helper_single_add_all_connectors(),
>   drm_fb_helper_add_one_connector() and
>   drm_fb_helper_remove_one_connector().

Entire series applied, thanks for doing this cleanup.
-Daniel

> 
> Changes since v1:
>    - Accumulated all review tags into individual commits (Emil, Daniel) 
>    - Squashed warning fixes into the patch that introduced the
>      warnings (into 5/7) (Laurent, Emil, Lyude)
>    - Remove entire drm_fb_helper tasks from todo list. Daniel's
>      "64914da24ea9 drm/fbdev-helper: don't force restores" fixes first
>      one (Daniel)
> 
> Pankaj Bharadiya (7):
>   drm: Remove unused arg from drm_fb_helper_init
>   drm/radeon: remove radeon_fb_{add,remove}_connector functions
>   drm/amdgpu: Remove drm_fb_helper_{add,remove}_one_connector calls
>   drm/i915/display: Remove drm_fb_helper_{add,remove}_one_connector calls
>   drm: Remove drm_fb_helper add, add all and remove connector calls
>   drm/fb-helper: Remove drm_fb_helper add, add_all and remove connector functions
>   drm/todo: Update drm_fb_helper tasks
> 
>  Documentation/gpu/todo.rst                    | 17 ------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  5 +---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 13 ---------
>  drivers/gpu/drm/armada/armada_fbdev.c         |  8 +-----
>  drivers/gpu/drm/bridge/tc358764.c             |  3 ---
>  drivers/gpu/drm/drm_fb_helper.c               |  6 ++---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     | 10 +------
>  drivers/gpu/drm/gma500/framebuffer.c          |  6 +----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 12 ---------
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |  4 +--
>  drivers/gpu/drm/msm/msm_fbdev.c               |  6 +----
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  7 -----
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c       |  6 +----
>  drivers/gpu/drm/omapdrm/omap_fbdev.c          |  6 +----
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        | 10 -------
>  drivers/gpu/drm/radeon/radeon_fb.c            | 19 +------------
>  drivers/gpu/drm/radeon/radeon_mode.h          |  3 ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  9 +------
>  drivers/gpu/drm/tegra/fb.c                    |  8 +-----
>  include/drm/drm_fb_helper.h                   | 27 ++-----------------
>  21 files changed, 15 insertions(+), 171 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
