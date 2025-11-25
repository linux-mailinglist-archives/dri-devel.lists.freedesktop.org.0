Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2482C85F70
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 17:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48D10E446;
	Tue, 25 Nov 2025 16:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDvL7Y2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8FD10E41B;
 Tue, 25 Nov 2025 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764087922; x=1795623922;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mwMReEFfjgYT5suXeYsf7XYdkUSkEwVQEG86tVjRXIk=;
 b=TDvL7Y2HnDo2JHcNgpvQOfB6UZDLfuTF+WBF1y3nPpGgS8EY7++u7Sce
 kqpMB/4S+SpAoairX2YlZCfdCJ/Dht31bmql9XVqT/exadPZUetVHmW42
 Wd8Kubq6GEDv/rBMCf9IgKrBB1UX3b6WbpjgNTJYZfKeALJewH/+xhSJ6
 B7HooR9TE9Ai6OCTh5MtazsKwyGqizoBjZ5ctCYKZDpTH26ATuGiPk+w6
 WFMIxEEbVAds+Az0ZugVA0KTUyInxKJAyhjpwe4vdgZXc1HfGEJCA7aiU
 D5KKDFSyDCc1WC3Aei76sIQdv5YxwYJhAebwFbXH+S+NZnc5jm3H2ZSc0 w==;
X-CSE-ConnectionGUID: B8dFFxE+TmCJcLcnFfYAvw==
X-CSE-MsgGUID: jmu+F+kwSAC/uytwsjfYog==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66058988"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66058988"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:25:21 -0800
X-CSE-ConnectionGUID: sZ58Iv88QgKEvL0F3kBQ5A==
X-CSE-MsgGUID: rS5XkubTRMyJj/5QVcZMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="223652821"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.34])
 ([10.245.245.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:25:17 -0800
Message-ID: <82ed9798-9237-4404-9b32-9430bfb82b26@linux.intel.com>
Date: Tue, 25 Nov 2025 17:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 lyude@redhat.com, dakr@kernel.org, deller@gmx.de, mripard@kernel.org,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251125130634.1080966-1-tzimmermann@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

I'm glad to see the old kdb handler gone.

Could we perhaps extend the drm panic handler somehow for this to work?
Restore could potentially be simply duplicating and committing the current state.

Kind regards,
~Maarten Lankhorst

Den 2025-11-25 kl. 13:52, skrev Thomas Zimmermann:
> Remove the rest of the kbd support from DRM. Driver support has been
> broken for years without anyone complaining.
> 
> Kdb cannot use regular DRM mode setting, so DRM drivers have to
> implement an additional hook to make it work (in theory). As outlined
> by Sima in commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for
> atomic drivers") from 2017, kdb is not compatible with DRM atomic mode
> setting. Non-atomic mode setting meanwhile has become rare.
> 
> Only 3 DRM drivers implement the hooks for kdb support. Amdgpu and
> nouveau use non-atomic mode setting on older devices. But both drivers
> have switched to generic fbdev emulation, which isn't compatible with
> kdb. Radeon still runs kdb, but it doesn't work in practice. See the
> commits in this series for details
> 
> Therefore remove the remaining support for kdb from the DRM drivers
> and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> there are no fbdev drivers with kdb support.
> 
> If we ever want to address kdb support within DRM drivers, a place to
> start would be the scanout buffers used by DRM's panic screen. These
> use the current display mode. They can be written and flushed without
> mode setting involved.
> 
> Note: kdb over serial lines is not affected by this series and continues
> to work as before.
> 
> Thomas Zimmermann (5):
>   drm/amdgpu: Do not implement mode_set_base_atomic callback
>   drm/nouveau: Do not implement mode_set_base_atomic callback
>   drm/radeon: Do not implement mode_set_base_atomic callback
>   drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
>   fbcon: Remove fb_debug_enter/_leave from struct fb_ops
> 
>  Documentation/process/debugging/kgdb.rst    |  28 -----
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c      |  35 ++-----
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c       |  35 ++-----
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c       |  35 ++-----
>  drivers/gpu/drm/drm_fb_helper.c             | 108 --------------------
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  24 +----
>  drivers/gpu/drm/radeon/atombios_crtc.c      |  74 ++++----------
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  23 ++---
>  drivers/gpu/drm/radeon/radeon_mode.h        |  10 +-
>  drivers/video/fbdev/core/fbcon.c            |  24 -----
>  drivers/video/fbdev/core/fbcon.h            |   1 -
>  include/drm/drm_fb_helper.h                 |  21 ----
>  include/drm/drm_modeset_helper_vtables.h    |  23 -----
>  include/linux/fb.h                          |   4 -
>  14 files changed, 63 insertions(+), 382 deletions(-)
> 
> 
> base-commit: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362

