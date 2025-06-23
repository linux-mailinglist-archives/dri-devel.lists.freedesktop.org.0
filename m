Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE278AE3720
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 09:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D127710E1B8;
	Mon, 23 Jun 2025 07:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0k8AfXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3B910E1AD;
 Mon, 23 Jun 2025 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750664401; x=1782200401;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=I4dMQqnR/XdwimnXUocysmuRVLtcaq7qnZw5fv4T3XU=;
 b=C0k8AfXOJrL0kPC9U0OlWMqgJ78IJm5Epu3Ys5vUEsQrCk4huyBGzuFk
 zGY+FMzOrVYy67IIiHdXXstIJ2Zg+nfeTdxyav+xAIddHoVqbQdOukMYT
 aZVMFQqMtK/b/Xz1JPE5hJkvKCKLqDmgsGocwn/4+0bIQ2wdbY/DXgUrS
 8ShSOUfIieKbv9dDt3tRxEB/0gM2ano9s3YKJQ5hX40s6na2Yj+n9zfLi
 J3vnCjXUe8tY6JpWMzRgE+U4bHrST2Vyh+j2g1tclBTFxyW+jgEdDMYd4
 Z2+U659EV7u0a+PMjB3RzR45DsQV0XSsEdWE69bchhzDsaq6ylFvY7VQG w==;
X-CSE-ConnectionGUID: lowVFRiVS0iHIblvYxg/tQ==
X-CSE-MsgGUID: 53ib3rBhRq6i5Tmz4tHcxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="78271115"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="78271115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 00:40:00 -0700
X-CSE-ConnectionGUID: QeE4NUaPRvizFuk/hQhU/Q==
X-CSE-MsgGUID: SWWv5K11TCmPkTk5qnZ/pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182566163"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.244.47])
 ([10.245.244.47])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 00:39:52 -0700
Message-ID: <c28aad52-7977-4763-9690-9aed1910c834@linux.intel.com>
Date: Mon, 23 Jun 2025 09:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] drm/i915: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250618094011.238154-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Thanks for the series. I didn't see you on irc so I wanted to ask if you are planning to send a v11 with
the changes from void * to struct intel_panic_data and adding the VRAM support?


Other than that, I think the series looks good and I'll be able to test it on my battlemage.

Best regards,
~Maarten

On 2025-06-18 11:31, Jocelyn Falempe wrote:
> This adds drm_panic support for i915 and xe driver.
> 
> I've tested it on the 4 intel laptops I have at my disposal.
>  * Haswell with 128MB of eDRAM.
>  * Comet Lake  i7-10850H
>  * Raptor Lake i7-1370P (with DPT, and Y-tiling).
>  * Lunar Lake Ultra 5 228V (with DPT, and 4-tiling, and using the Xe driver.
> 
> I tested panic in both fbdev console and gnome desktop.
> I think it won't work yet on discrete GPU, but that can be added later.
> 
> Best regards,
> 
> v2:
>  * Add the proper abstractions to build also for Xe.
>  * Fix dim checkpatch issues.
> 
> v3:
>  * Add support for Y-tiled framebuffer when DPT is enabled.
> 
> v4:
>  * Add support for Xe driver, which shares most of the code.
>  * Add support for 4-tiled framebuffer found in newest GPU.
> 
> v5:
>  * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
>  * Use struct intel_display instead of drm_i915_private.
>  * Use iosys_map for intel_bo_panic_map().
> 
> v6:
>  * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
>  * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c
> 
> v7:
>  * Fix mismatch {} in intel_panic_flush() (Jani Nikula)
>  * Return int for i915_gem_object_panic_map() (Ville Syrjälä)
>  * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)
> 
> v8:
>  * Use kmap_try_from_panic() instead of vmap, to access the framebuffer.
>  * Add ttm_bo_kmap_try_from_panic() for the xe driver, that uses ttm.
>  * Replace intel_bo_panic_map() with a setup() and finish() function,
>    to allow mapping only one page of teh framebuffer at a time.
>  * Configure psr to send the full framebuffer update.
> 
> v9:
>  * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
>    from the panic handler (Christian König)
>  * Fix missing kfree() for i915_panic_pages in i915_gem_object_panic_finish()
>    Also change i915_panic_pages allocation to kmalloc, as kvmalloc is not
>    safe to call from the panic handler.
>  * Fix dim checkpatch warnings.
> 
> v10:
>  * Add a private field to struct drm_scanout_buffer
>  * Replace static variables with new fields in struct intel_framebuffer
>    (Maarten Lankhorst)
>  * Add error handling if i915_gem_object_panic_pages() returns NULL
>  * Declare struct drm_scanout_buffer instead of including <drm/drm_panic.h>
>    in intel_bo.h
> 
> Jocelyn Falempe (10):
>   drm/panic: Add a private field to struct drm_scanout_buffer
>   drm/i915/fbdev: Add intel_fbdev_get_map()
>   drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
>   drm/i915/display: Add a disable_tiling() for skl planes
>   drm/ttm: Add ttm_bo_kmap_try_from_panic()
>   drm/i915: Add intel_bo_panic_setup and intel_bo_panic_finish
>   drm/i915/display: Add drm_panic support
>   drm/i915/display: Add drm_panic support for Y-tiling with DPT
>   drm/i915/display: Add drm_panic support for 4-tiling with DPT
>   drm/i915/psr: Add intel_psr2_panic_force_full_update
> 
>  drivers/gpu/drm/i915/display/i9xx_plane.c     |  23 +++
>  .../gpu/drm/i915/display/intel_atomic_plane.c | 170 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_bo.c       |  12 ++
>  drivers/gpu/drm/i915/display/intel_bo.h       |   4 +
>  .../drm/i915/display/intel_display_types.h    |  11 ++
>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   5 +
>  drivers/gpu/drm/i915/display/intel_fb_pin.h   |   2 +
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
>  drivers/gpu/drm/i915/display/intel_fbdev.h    |   6 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |  20 +++
>  drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
>  .../drm/i915/display/skl_universal_plane.c    |  27 +++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   5 +
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 112 ++++++++++++
>  drivers/gpu/drm/i915/i915_vma.h               |   5 +
>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  27 +++
>  drivers/gpu/drm/xe/display/intel_bo.c         |  61 +++++++
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +
>  include/drm/drm_panic.h                       |   6 +
>  include/drm/ttm/ttm_bo.h                      |   1 +
>  20 files changed, 507 insertions(+), 2 deletions(-)
> 
> 
> base-commit: b2f7e30d2e4a34fcee8111d713bef4f29dc23c77

