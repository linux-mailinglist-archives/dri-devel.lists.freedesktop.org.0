Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E693E7BAF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 17:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287889D5C;
	Tue, 10 Aug 2021 15:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A8789D5C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 15:06:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n11so13289498wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiaRP5nKVN3eYhGn+fGCZKXIcj8hysSd3L7v5vRl4NM=;
 b=McV0nm7rlkmws34VEbAkYmdc0ljQChSYCGXBf5xP7DgaveFc8WblDfZeWY3JrY0r4I
 fpQ4lCXB5J/JwxiXKrsY2b0sWZAM7/Vo5PkHGO9kJ1f9tl1BvSvy8chNYfI9x/SXlWQn
 DF0tmcMjtqr48q3QOtvhgQgYc+sIjHMWXbB80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiaRP5nKVN3eYhGn+fGCZKXIcj8hysSd3L7v5vRl4NM=;
 b=DgcG5IIZP2ogGOweT03mvg8tKEN3v8WoMt/40HD8KsJzTAgmW7rMz+ZNbyQtNvrYZo
 llHSkMZfZHb1e/oZGlsVDXRnxoDSZuGSvjt98VTPuUKBLdwl6HigDfKAylMIMT7+FZC8
 PYCYQDXnkXrVJHos7W3WM6VpSNTZ+pjvX4lUoGkroVbZkPE1QxSbCCC1STYYQWztDP7A
 0mv5UEPuCTpLrwVLSBLALv2LbPJXRAhOfi/gzI41/69PRXIu8+j+rxJGd/i8LtWTCQ8a
 0HrqTemQdyxnJbfKs7n4kqbEI/TFT2+r0J9QCheAV91E+7xvCMOCATMjWOfyDIBBIXXb
 +Tkg==
X-Gm-Message-State: AOAM530fY31uhs5JapFb2xrp1GiFuZjIKFxGFvFZwYFg9RAuwS/fV4L5
 4KW98XBCxMxd8VgBZPtWHEVgHOZiNQr50g==
X-Google-Smtp-Source: ABdhPJyTwGjPbtuXRguvfdwvzwz/D+PmlGeoH29UHfxaa2otQRo2eZzPfOE2pZmaRRLT76TZIntxzA==
X-Received: by 2002:a1c:20c5:: with SMTP id g188mr3574666wmg.142.1628607958627; 
 Tue, 10 Aug 2021 08:05:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y13sm4590403wmj.27.2021.08.10.08.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 08:05:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] drm/doc/rfc: drop lmem uapi section
Date: Tue, 10 Aug 2021 16:27:48 +0200
Message-Id: <20210810142748.1983271-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810123408.1870870-1-daniel.vetter@ffwll.ch>
References: <20210810123408.1870870-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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

We still have quite a bit more work to do with overall reworking of
the ttm-based dg1 code, but the uapi stuff is now finalized with the
latest pull. So remove that.

This also fixes kerneldoc build warnings because we've included the
same headers in two places, resulting in sphinx complaining about
duplicated symbols. This regression has been created when we moved the
uapi definitions to the real include/uapi/ folder in 727ecd99a4c9
("drm/doc/rfc: drop the i915_gem_lmem.h header")

v2: Fix a few references that I missed, the htmldocs build took
forever.

Acked-by: Jason Ekstrand <jason@jlekstrand.net>
Tested-by Stephen Rothwell <sfr@canb.auug.org.au> (v1)
References: https://lore.kernel.org/dri-devel/20210603193242.1ce99344@canb.auug.org.au/
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 727ecd99a4c9 ("drm/doc/rfc: drop the i915_gem_lmem.h header")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/rfc/i915_gem_lmem.rst | 109 ------------------------
 1 file changed, 109 deletions(-)

diff --git a/Documentation/gpu/rfc/i915_gem_lmem.rst b/Documentation/gpu/rfc/i915_gem_lmem.rst
index 675ba8620d66..b421a3c1806e 100644
--- a/Documentation/gpu/rfc/i915_gem_lmem.rst
+++ b/Documentation/gpu/rfc/i915_gem_lmem.rst
@@ -18,114 +18,5 @@ real, with all the uAPI bits is:
         * Route shmem backend over to TTM SYSTEM for discrete
         * TTM purgeable object support
         * Move i915 buddy allocator over to TTM
-        * MMAP ioctl mode(see `I915 MMAP`_)
-        * SET/GET ioctl caching(see `I915 SET/GET CACHING`_)
 * Send RFC(with mesa-dev on cc) for final sign off on the uAPI
 * Add pciid for DG1 and turn on uAPI for real
-
-New object placement and region query uAPI
-==========================================
-Starting from DG1 we need to give userspace the ability to allocate buffers from
-device local-memory. Currently the driver supports gem_create, which can place
-buffers in system memory via shmem, and the usual assortment of other
-interfaces, like dumb buffers and userptr.
-
-To support this new capability, while also providing a uAPI which will work
-beyond just DG1, we propose to offer three new bits of uAPI:
-
-DRM_I915_QUERY_MEMORY_REGIONS
------------------------------
-New query ID which allows userspace to discover the list of supported memory
-regions(like system-memory and local-memory) for a given device. We identify
-each region with a class and instance pair, which should be unique. The class
-here would be DEVICE or SYSTEM, and the instance would be zero, on platforms
-like DG1.
-
-Side note: The class/instance design is borrowed from our existing engine uAPI,
-where we describe every physical engine in terms of its class, and the
-particular instance, since we can have more than one per class.
-
-In the future we also want to expose more information which can further
-describe the capabilities of a region.
-
-.. kernel-doc:: include/uapi/drm/i915_drm.h
-        :functions: drm_i915_gem_memory_class drm_i915_gem_memory_class_instance drm_i915_memory_region_info drm_i915_query_memory_regions
-
-GEM_CREATE_EXT
---------------
-New ioctl which is basically just gem_create but now allows userspace to provide
-a chain of possible extensions. Note that if we don't provide any extensions and
-set flags=0 then we get the exact same behaviour as gem_create.
-
-Side note: We also need to support PXP[1] in the near future, which is also
-applicable to integrated platforms, and adds its own gem_create_ext extension,
-which basically lets userspace mark a buffer as "protected".
-
-.. kernel-doc:: include/uapi/drm/i915_drm.h
-        :functions: drm_i915_gem_create_ext
-
-I915_GEM_CREATE_EXT_MEMORY_REGIONS
-----------------------------------
-Implemented as an extension for gem_create_ext, we would now allow userspace to
-optionally provide an immutable list of preferred placements at creation time,
-in priority order, for a given buffer object.  For the placements we expect
-them each to use the class/instance encoding, as per the output of the regions
-query. Having the list in priority order will be useful in the future when
-placing an object, say during eviction.
-
-.. kernel-doc:: include/uapi/drm/i915_drm.h
-        :functions: drm_i915_gem_create_ext_memory_regions
-
-One fair criticism here is that this seems a little over-engineered[2]. If we
-just consider DG1 then yes, a simple gem_create.flags or something is totally
-all that's needed to tell the kernel to allocate the buffer in local-memory or
-whatever. However looking to the future we need uAPI which can also support
-upcoming Xe HP multi-tile architecture in a sane way, where there can be
-multiple local-memory instances for a given device, and so using both class and
-instance in our uAPI to describe regions is desirable, although specifically
-for DG1 it's uninteresting, since we only have a single local-memory instance.
-
-Existing uAPI issues
-====================
-Some potential issues we still need to resolve.
-
-I915 MMAP
----------
-In i915 there are multiple ways to MMAP GEM object, including mapping the same
-object using different mapping types(WC vs WB), i.e multiple active mmaps per
-object. TTM expects one MMAP at most for the lifetime of the object. If it
-turns out that we have to backpedal here, there might be some potential
-userspace fallout.
-
-I915 SET/GET CACHING
---------------------
-In i915 we have set/get_caching ioctl. TTM doesn't let us to change this, but
-DG1 doesn't support non-snooped pcie transactions, so we can just always
-allocate as WB for smem-only buffers.  If/when our hw gains support for
-non-snooped pcie transactions then we must fix this mode at allocation time as
-a new GEM extension.
-
-This is related to the mmap problem, because in general (meaning, when we're
-not running on intel cpus) the cpu mmap must not, ever, be inconsistent with
-allocation mode.
-
-Possible idea is to let the kernel picks the mmap mode for userspace from the
-following table:
-
-smem-only: WB. Userspace does not need to call clflush.
-
-smem+lmem: We only ever allow a single mode, so simply allocate this as uncached
-memory, and always give userspace a WC mapping. GPU still does snooped access
-here(assuming we can't turn it off like on DG1), which is a bit inefficient.
-
-lmem only: always WC
-
-This means on discrete you only get a single mmap mode, all others must be
-rejected. That's probably going to be a new default mode or something like
-that.
-
-Links
-=====
-[1] https://patchwork.freedesktop.org/series/86798/
-
-[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#note_553791
-- 
2.32.0

