Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA72CB1471
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 23:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F9A10E042;
	Tue,  9 Dec 2025 22:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ycroy2+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDC210E221
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765318635; x=1796854635;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=GbRs72zhEm3K+LSaqPzXLH+rm+ET2pyrRhwZTTvTQLY=;
 b=Ycroy2+GofslO4FyC6BWRZACDCRT9G6R17E8gQLtDiSUqGvYVpGV3CdI
 BvN4flW8kZOJcum8BY807/uVZpSBUS4Xuae8TJnzh4bfmw9kpS5lWjKh1
 RFOF9XK3ltD2L+SmkPtxR9xx2ZA4/zjsXAJj81umTMZP6nJmV5aO3lvVv
 iXxvWW1Yb+ak0z2Cdgv5PGeOzm5ahF+PeRRfpCY8tqRhBvLqLc8LX4o6W
 CH57l43XkMuBF9xFuwxogXUBoP1L7DGDXKF7tXWwZtpPVkNKRloWDEsoi
 fihHdOeV6TxDHfs65/aYt7TcKot9BCNmB5CiG/A/MUAP3IhMhTxT4gfX8 w==;
X-CSE-ConnectionGUID: MgrcYN2rRJioX6sViKdEhQ==
X-CSE-MsgGUID: p2h4g5lZRuiwBP2eqtUfOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66463532"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="66463532"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:17:15 -0800
X-CSE-ConnectionGUID: J+N2R5YCT2W2C1G9WZ0xKA==
X-CSE-MsgGUID: D6J/RHAeT1iM6ifKFe+cZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196797938"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2025 14:17:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vT619-000000002JX-2X1a;
 Tue, 09 Dec 2025 22:17:11 +0000
Date: Wed, 10 Dec 2025 06:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [drm-misc:drm-misc-next 4/11] drivers/gpu/drm/drm_gem.c:1261:24:
 error: implicit declaration of function 'mm_get_unmapped_area'; did you mean
 'shmem_get_unmapped_area'?
Message-ID: <202512100625.EaqdFiOC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   00ffe45ece80160aef446d74ded906352f21dd72
commit: 99bda20d6d4cac30ed6d357658d8bc328c3b27d9 [4/11] drm/gem: Introduce drm_gem_get_unmapped_area() fop
config: m68k-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251210/202512100625.EaqdFiOC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100625.EaqdFiOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100625.EaqdFiOC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem.c: In function 'drm_gem_get_unmapped_area':
>> drivers/gpu/drm/drm_gem.c:1261:24: error: implicit declaration of function 'mm_get_unmapped_area'; did you mean 'shmem_get_unmapped_area'? [-Wimplicit-function-declaration]
    1261 |                 return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
         |                        ^~~~~~~~~~~~~~~~~~~~
         |                        shmem_get_unmapped_area


vim +1261 drivers/gpu/drm/drm_gem.c

  1229	
  1230	/**
  1231	 * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
  1232	 * @filp: DRM file pointer
  1233	 * @uaddr: User address hint
  1234	 * @len: Mapping length
  1235	 * @pgoff: Offset (in pages)
  1236	 * @flags: Mapping flags
  1237	 *
  1238	 * If a driver supports GEM object mapping, before ending up in drm_gem_mmap(),
  1239	 * mmap calls on the DRM file descriptor will first try to find a free linear
  1240	 * address space large enough for a mapping. Since GEM objects are backed by
  1241	 * shmem buffers, this should preferably be handled by the shmem virtual memory
  1242	 * filesystem which can appropriately align addresses to huge page sizes when
  1243	 * needed.
  1244	 *
  1245	 * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
  1246	 * contain the fake offset we created) and call shmem_get_unmapped_area() with
  1247	 * the right file pointer.
  1248	 *
  1249	 * If a GEM object is not available at the given offset or if the caller is not
  1250	 * granted access to it, fall back to mm_get_unmapped_area().
  1251	 */
  1252	unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
  1253						unsigned long len, unsigned long pgoff,
  1254						unsigned long flags)
  1255	{
  1256		struct drm_gem_object *obj;
  1257		unsigned long ret;
  1258	
  1259		obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
  1260		if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> 1261			return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
  1262						    flags);
  1263	
  1264		ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
  1265							 flags);
  1266	
  1267		drm_gem_object_put(obj);
  1268	
  1269		return ret;
  1270	}
  1271	EXPORT_SYMBOL_GPL(drm_gem_get_unmapped_area);
  1272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
