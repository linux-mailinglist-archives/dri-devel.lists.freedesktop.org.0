Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CCC0A539
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 10:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF62710E065;
	Sun, 26 Oct 2025 09:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ge8Sxg61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A66110E065
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 09:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761469967; x=1793005967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n1TeExa8NOnhCmViVq+F9NZ2i/30IWtCb22ydotZZ1I=;
 b=ge8Sxg61zjM3Ukj8KmGAdPLDG1ERwUuC9kkHMU5jMmcvvfLjl/BJ3Amp
 tn3+Hcd3Sl2W5tly5CT2Mcs7s9b62e3/rlFUs7NV68apzzXTofxXqcIe2
 4rT9vhglahwm5SH0jqjpBzBltCaXgX5WofDvWGVDtqYzb2y8diSGuCDj2
 2xqtdzzi9ffgiopLRxqP2LRuMxi5oM6yQOFLzqCI124/DVfFLC0plxbCC
 /xdsaRNmJ1EeGtIIHtuKFS1ufz1vPy1Kog17vrdn76L03YCEgCfnkPxag
 62JOI6F67DMG6r+WcsbelXfbd44nswbRa1yXOY+/B0A61mGfOGaFC4b4M Q==;
X-CSE-ConnectionGUID: ZWhdgTsfQVipnSdPxQDwqQ==
X-CSE-MsgGUID: 8ePsvsjiSnOekxMXve8q/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62609024"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; d="scan'208";a="62609024"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 02:12:46 -0700
X-CSE-ConnectionGUID: Fy8PqvZWRbCW8UQWXm4avg==
X-CSE-MsgGUID: xzQqaG2MRAS5/08T25Oe2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; d="scan'208";a="184406233"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 26 Oct 2025 02:12:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vCwnp-000G0n-1N;
 Sun, 26 Oct 2025 09:12:41 +0000
Date: Sun, 26 Oct 2025 17:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/7] drm/client: Deprecate struct drm_client_buffer.gem
Message-ID: <202510261717.a4f1joxt-lkp@intel.com>
References: <20251020151402.53013-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020151402.53013-5-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-client-Remove-pitch-from-struct-drm_client_buffer/20251020-231709
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251020151402.53013-5-tzimmermann%40suse.de
patch subject: [PATCH 4/7] drm/client: Deprecate struct drm_client_buffer.gem
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20251026/202510261717.a4f1joxt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261717.a4f1joxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261717.a4f1joxt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_client.o: in function `drm_client_buffer_vmap_local':
>> drivers/gpu/drm/drm_client.c:278:(.text+0x214): undefined reference to `drm_gem_fb_get_obj'
   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_client.o: in function `drm_client_buffer_vunmap_local':
   drivers/gpu/drm/drm_client.c:307:(.text+0x280): undefined reference to `drm_gem_fb_get_obj'
   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_client.o: in function `drm_client_buffer_vmap':
   drivers/gpu/drm/drm_client.c:338:(.text+0x2b4): undefined reference to `drm_gem_fb_get_obj'
   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_client.o: in function `drm_client_buffer_vunmap':
   drivers/gpu/drm/drm_client.c:360:(.text+0x2ec): undefined reference to `drm_gem_fb_get_obj'
   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_client.o: in function `drm_client_buffer_delete':
   drivers/gpu/drm/drm_client.c:178:(.text+0x6ec): undefined reference to `drm_gem_fb_get_obj'


vim +278 drivers/gpu/drm/drm_client.c

   254	
   255	/**
   256	 * drm_client_buffer_vmap_local - Map DRM client buffer into address space
   257	 * @buffer: DRM client buffer
   258	 * @map_copy: Returns the mapped memory's address
   259	 *
   260	 * This function maps a client buffer into kernel address space. If the
   261	 * buffer is already mapped, it returns the existing mapping's address.
   262	 *
   263	 * Client buffer mappings are not ref'counted. Each call to
   264	 * drm_client_buffer_vmap_local() should be closely followed by a call to
   265	 * drm_client_buffer_vunmap_local(). See drm_client_buffer_vmap() for
   266	 * long-term mappings.
   267	 *
   268	 * The returned address is a copy of the internal value. In contrast to
   269	 * other vmap interfaces, you don't need it for the client's vunmap
   270	 * function. So you can modify it at will during blit and draw operations.
   271	 *
   272	 * Returns:
   273	 *	0 on success, or a negative errno code otherwise.
   274	 */
   275	int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
   276					 struct iosys_map *map_copy)
   277	{
 > 278		struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
   279		struct iosys_map *map = &buffer->map;
   280		int ret;
   281	
   282		drm_gem_lock(gem);
   283	
   284		ret = drm_gem_vmap_locked(gem, map);
   285		if (ret)
   286			goto err_drm_gem_vmap_unlocked;
   287		*map_copy = *map;
   288	
   289		return 0;
   290	
   291	err_drm_gem_vmap_unlocked:
   292		drm_gem_unlock(gem);
   293		return ret;
   294	}
   295	EXPORT_SYMBOL(drm_client_buffer_vmap_local);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
