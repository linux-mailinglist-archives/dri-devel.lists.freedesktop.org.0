Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61B9DEFFB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 11:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5678810E39E;
	Sat, 30 Nov 2024 10:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fcszgs8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6343F10E2A0;
 Sat, 30 Nov 2024 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732963743; x=1764499743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MVvl0W1+H3sOktW4I+R3Dq6tD3ip0O/yNIfi6Whjllg=;
 b=Fcszgs8uuKLE7uR1OBwmhmjKwQSLtg0GjkCehrMk+z77Fwezkv5Jsajq
 XcB+9Si1eBPxmo/7O1+w0xlYgEZ/Xrv404U4dp4UjpWIvlQGS7q/EkNbn
 kz4uvLFyhRecag+Z5EOuWfFAbICsIi3GozexZxtq5FW5iiI+8g+ICBrsT
 cZ0fdeX2H2zfAJdnOW5UlG6uKAjJn/838G1HyBo+1PASTsh293XwrdmkC
 ThS/lh70eOKjPiCKL43CSvGGKWBy9vMS/+W2AdGdinyLFwQVl3iXW3FEs
 mZ+Qt68flqVkAuHjWFxVX6ZL1loldXI9nzecDb+iEA7RGi/7LKLzbXQcQ g==;
X-CSE-ConnectionGUID: aO9LlOMEQE+BLP10CuJj/g==
X-CSE-MsgGUID: 96CJTL3oSK6fhxXd4M64rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="20764206"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; d="scan'208";a="20764206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2024 02:49:02 -0800
X-CSE-ConnectionGUID: XUN5KfFnRBSDDaxiqNgkuQ==
X-CSE-MsgGUID: YEDs9fPFR3CIqt+bkW4Xag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; d="scan'208";a="97640669"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 30 Nov 2024 02:48:59 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tHL20-0000ad-2e;
 Sat, 30 Nov 2024 10:48:56 +0000
Date: Sat, 30 Nov 2024 18:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 5/5] drm/i915: Add drm_panic support
Message-ID: <202411302022.wlwTKMBh-lkp@intel.com>
References: <20241129162232.7594-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129162232.7594-6-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-i915-fbdev-Add-intel_fbdev_getvaddr/20241130-002536
base:   44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
patch link:    https://lore.kernel.org/r/20241129162232.7594-6-jfalempe%40redhat.com
patch subject: [PATCH 5/5] drm/i915: Add drm_panic support
config: i386-randconfig-061-20241130 (https://download.01.org/0day-ci/archive/20241130/202411302022.wlwTKMBh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411302022.wlwTKMBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411302022.wlwTKMBh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_atomic_plane.c:1273:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *vaddr_iomem @@     got void *[assigned] ptr @@
   drivers/gpu/drm/i915/display/intel_atomic_plane.c:1273:55: sparse:     expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/i915/display/intel_atomic_plane.c:1273:55: sparse:     got void *[assigned] ptr

vim +1273 drivers/gpu/drm/i915/display/intel_atomic_plane.c

  1228	
  1229	static int intel_get_scanout_buffer(struct drm_plane *plane,
  1230					    struct drm_scanout_buffer *sb)
  1231	{
  1232		struct intel_plane_state *plane_state;
  1233		struct drm_gem_object *gem_obj;
  1234		struct drm_i915_gem_object *obj;
  1235		struct drm_framebuffer *fb;
  1236		struct drm_i915_private *dev_priv = to_i915(plane->dev);
  1237		void *ptr;
  1238		enum i915_map_type has_type;
  1239	
  1240		if (!plane->state || !plane->state->fb || !plane->state->visible)
  1241			return -ENODEV;
  1242	
  1243		plane_state = to_intel_plane_state(plane->state);
  1244		fb = plane_state->hw.fb;
  1245		gem_obj = intel_fb_bo(fb);
  1246		if (!gem_obj)
  1247			return -ENODEV;
  1248	
  1249		obj = to_intel_bo(gem_obj);
  1250	
  1251		if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev)) {
  1252			ptr = intel_fbdev_getvaddr(dev_priv->display.fbdev.fbdev);
  1253			if (!ptr)
  1254				return -ENOMEM;
  1255		} else {
  1256			/* can't disable tiling if DPT is in use */
  1257			if (fb->modifier && HAS_DPT(dev_priv))
  1258				return -EOPNOTSUPP;
  1259	
  1260			/* Taken from i915_gem_object_pin_map() */
  1261			ptr = page_unpack_bits(obj->mm.mapping, &has_type);
  1262			if (!ptr) {
  1263				if (i915_gem_object_has_struct_page(obj))
  1264					ptr = i915_gem_object_map_page(obj, I915_MAP_WB);
  1265				else
  1266					ptr = i915_gem_object_map_pfn(obj, I915_MAP_WB);
  1267				if (IS_ERR(ptr))
  1268					return -ENOMEM;
  1269			}
  1270		}
  1271	
  1272		if (i915_gem_object_has_iomem(obj))
> 1273			iosys_map_set_vaddr_iomem(&panic_map, ptr);
  1274		else
  1275			iosys_map_set_vaddr(&panic_map, ptr);
  1276	
  1277		sb->map[0] = panic_map;
  1278		sb->width = fb->width;
  1279		sb->height = fb->height;
  1280		sb->format = fb->format;
  1281		sb->pitch[0] = fb->pitches[0];
  1282	
  1283		return 0;
  1284	}
  1285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
