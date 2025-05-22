Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2FDAC1900
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 02:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D808110E099;
	Thu, 22 May 2025 23:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfNiNGiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA0610E099;
 Thu, 22 May 2025 23:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747956642; x=1779492642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Igf8BKZZTold8W1pixRMrs33UDaM09T6eayYwPHDSqs=;
 b=JfNiNGiQkaND0P5P8lvCYuhPo7I48IG4/ZWPYM41S5uyGqNKdmGdkOKy
 UhshEyNNUPdTPq5/ovbFShziszL0WCexpgg8YM5bFpCjEwQtzZGVFDBX8
 1DSKSCi7V+DpvzADlC8qCHDRrgwm7NCBjH9N+3vkEvV1e/0OcxObw2DMe
 nInpK0Fm0mRN3S4hNfS4QA3r4Fh61H4bMZ2AAoWMxOWhyOWIG+2Ju0wqV
 /VfEsjKRVyyWICezFPStaGfscrQsrR/78ljb8q9Nj21F3OuHUnKNB5g3p
 FhwRrrGLya1QPEkXBjLMiq79fBHjZN5pbzdkZlNRMDtLcTjIXQ4d1tjs4 w==;
X-CSE-ConnectionGUID: DlRve5OYR2OiA4ORPAqk6g==
X-CSE-MsgGUID: LkJnFf0qQgWltGQ15PPVtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60641488"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="60641488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 16:30:40 -0700
X-CSE-ConnectionGUID: XgL0cTQcS+OB864KM7lyEA==
X-CSE-MsgGUID: Gd+PXJo3SZmXpmoYIIUCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="171722205"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 22 May 2025 16:30:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIFMy-000PmA-14;
 Thu, 22 May 2025 23:30:36 +0000
Date: Fri, 23 May 2025 07:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 8/9] iosys: hide internal details of implementation.
Message-ID: <202505230735.HJoyQtMT-lkp@intel.com>
References: <20250522065519.318013-9-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522065519.318013-9-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20250522]
[cannot apply to drm-xe/drm-xe-next drm-exynos/exynos-drm-next linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/udmabuf-use-new-iosys_map-accessors/20250522-155237
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250522065519.318013-9-airlied%40gmail.com
patch subject: [PATCH 8/9] iosys: hide internal details of implementation.
config: x86_64-buildonly-randconfig-001-20250523 (https://download.01.org/0day-ci/archive/20250523/202505230735.HJoyQtMT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230735.HJoyQtMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230735.HJoyQtMT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_dma_helper.c: In function 'drm_gem_dma_prime_import_sg_table_vmap':
>> drivers/gpu/drm/drm_gem_dma_helper.c:596:30: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     596 |         dma_obj->vaddr = map.vaddr;
         |                              ^~~~~
         |                              _vaddr
--
   drivers/gpu/drm/drm_fbdev_dma.c: In function 'drm_fbdev_dma_driver_fbdev_probe_tail':
>> drivers/gpu/drm/drm_fbdev_dma.c:218:35: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     218 |         info->screen_buffer = map.vaddr;
         |                                   ^~~~~
         |                                   _vaddr
>> drivers/gpu/drm/drm_fbdev_dma.c:209:26: warning: variable 'map' set but not used [-Wunused-but-set-variable]
     209 |         struct iosys_map map = buffer->map;
         |                          ^~~
   In file included from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:5,
                    from drivers/gpu/drm/drm_fbdev_dma.c:3:
   drivers/gpu/drm/drm_fbdev_dma.c: In function 'drm_fbdev_dma_driver_fbdev_probe':
>> drivers/gpu/drm/drm_fbdev_dma.c:297:41: error: 'struct iosys_map' has no member named 'is_iomem'; did you mean '_is_iomem'?
     297 |         } else if (drm_WARN_ON(dev, map.is_iomem)) {
         |                                         ^~~~~~~~
   include/asm-generic/bug.h:132:32: note: in definition of macro 'WARN'
     132 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/drm/drm_print.h:789:9: note: in expansion of macro 'drm_WARN'
     789 |         drm_WARN((drm), (x), "%s",                                      \
         |         ^~~~~~~~
   drivers/gpu/drm/drm_fbdev_dma.c:297:20: note: in expansion of macro 'drm_WARN_ON'
     297 |         } else if (drm_WARN_ON(dev, map.is_iomem)) {
         |                    ^~~~~~~~~~~
--
   drivers/gpu/drm/drm_mipi_dbi.c: In function 'mipi_dbi_fb_dirty':
>> drivers/gpu/drm/drm_mipi_dbi.c:293:27: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     293 |                 tr = src->vaddr; /* TODO: Use mapping abstraction properly */
         |                           ^~~~~
         |                           _vaddr
--
   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c: In function 'etnaviv_gem_prime_vmap_impl':
>> drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:88:20: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
      88 |         return map.vaddr;
         |                    ^~~~~
         |                    _vaddr
>> drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:89:1: warning: control reaches end of non-void function [-Wreturn-type]
      89 | }
         | ^
--
   drivers/gpu/drm/tiny/ili9225.c: In function 'ili9225_fb_dirty':
>> drivers/gpu/drm/tiny/ili9225.c:106:27: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     106 |                 tr = src->vaddr; /* TODO: Use mapping abstraction properly */
         |                           ^~~~~
         |                           _vaddr
--
   drivers/gpu/drm/tiny/gm12u320.c: In function 'gm12u320_copy_fb_to_blocks':
>> drivers/gpu/drm/tiny/gm12u320.c:270:45: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     270 |         vaddr = gm12u320->fb_update.src_map.vaddr; /* TODO: Use mapping abstraction properly */
         |                                             ^~~~~
         |                                             _vaddr
--
   drivers/gpu/drm/gud/gud_pipe.c: In function 'gud_prep_flush':
>> drivers/gpu/drm/gud/gud_pipe.c:169:24: error: 'const struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     169 |         vaddr = src[0].vaddr;
         |                        ^~~~~
         |                        _vaddr
--
   drivers/gpu/drm/vkms/vkms_formats.c: In function 'packed_pixels_addr':
>> drivers/gpu/drm/vkms/vkms_formats.c:79:42: error: 'const struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
      79 |         *addr = (u8 *)frame_info->map[0].vaddr + offset;
         |                                          ^~~~~
         |                                          _vaddr
   drivers/gpu/drm/vkms/vkms_formats.c: In function 'packed_pixels_addr_1x1':
   drivers/gpu/drm/vkms/vkms_formats.c:140:42: error: 'const struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     140 |         *addr = (u8 *)frame_info->map[0].vaddr + offset;
         |                                          ^~~~~
         |                                          _vaddr
--
   In file included from drivers/gpu/drm/panthor/panthor_heap.c:10:
   drivers/gpu/drm/panthor/panthor_gem.h: In function 'panthor_kernel_bo_vmap':
>> drivers/gpu/drm/panthor/panthor_gem.h:190:24: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     190 |         bo->kmap = map.vaddr;
         |                        ^~~~~
         |                        _vaddr
--
   In file included from drivers/gpu/drm/panthor/panthor_sched.c:29:
   drivers/gpu/drm/panthor/panthor_gem.h: In function 'panthor_kernel_bo_vmap':
>> drivers/gpu/drm/panthor/panthor_gem.h:190:24: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     190 |         bo->kmap = map.vaddr;
         |                        ^~~~~
         |                        _vaddr
   drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_queue_get_syncwait_obj':
>> drivers/gpu/drm/panthor/panthor_sched.c:873:36: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     873 |         queue->syncwait.kmap = map.vaddr;
         |                                    ^~~~~
         |                                    _vaddr
--
   drivers/gpu/drm/panfrost/panfrost_dump.c: In function 'panfrost_core_dump':
>> drivers/gpu/drm/panfrost/panfrost_dump.c:228:29: error: 'struct iosys_map' has no member named 'vaddr'; did you mean '_vaddr'?
     228 |                 vaddr = map.vaddr;
         |                             ^~~~~
         |                             _vaddr
..


vim +596 drivers/gpu/drm/drm_gem_dma_helper.c

f5ca8eb6f9bd5e drivers/gpu/drm/drm_gem_cma_helper.c Thomas Zimmermann 2020-11-23  552  
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  553  /**
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  554   * drm_gem_dma_prime_import_sg_table_vmap - PRIME import another driver's
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  555   *	scatter/gather table and get the virtual address of the buffer
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  556   * @dev: DRM device
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  557   * @attach: DMA-BUF attachment
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  558   * @sgt: Scatter/gather table of pinned pages
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  559   *
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  560   * This function imports a scatter/gather table using
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  561   * drm_gem_dma_prime_import_sg_table() and uses dma_buf_vmap() to get the kernel
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  562   * virtual address. This ensures that a DMA GEM object always has its virtual
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  563   * address set. This address is released when the object is freed.
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  564   *
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  565   * This function can be used as the &drm_driver.gem_prime_import_sg_table
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  566   * callback. The &DRM_GEM_DMA_DRIVER_OPS_VMAP macro provides a shortcut to set
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  567   * the necessary DRM driver operations.
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  568   *
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  569   * Returns:
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  570   * A pointer to a newly created GEM object or an ERR_PTR-encoded negative
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  571   * error code on failure.
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  572   */
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  573  struct drm_gem_object *
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  574  drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  575  				       struct dma_buf_attachment *attach,
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  576  				       struct sg_table *sgt)
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  577  {
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  578  	struct drm_gem_dma_object *dma_obj;
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  579  	struct drm_gem_object *obj;
7938f4218168ae drivers/gpu/drm/drm_gem_cma_helper.c Lucas De Marchi   2022-02-04  580  	struct iosys_map map;
6619ccf1bb1d0e drivers/gpu/drm/drm_gem_cma_helper.c Thomas Zimmermann 2020-09-25  581  	int ret;
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  582  
79e2cf2e7a1934 drivers/gpu/drm/drm_gem_dma_helper.c Dmitry Osipenko   2022-10-17  583  	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
6619ccf1bb1d0e drivers/gpu/drm/drm_gem_cma_helper.c Thomas Zimmermann 2020-09-25  584  	if (ret) {
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  585  		DRM_ERROR("Failed to vmap PRIME buffer\n");
6619ccf1bb1d0e drivers/gpu/drm/drm_gem_cma_helper.c Thomas Zimmermann 2020-09-25  586  		return ERR_PTR(ret);
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  587  	}
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  588  
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  589  	obj = drm_gem_dma_prime_import_sg_table(dev, attach, sgt);
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  590  	if (IS_ERR(obj)) {
79e2cf2e7a1934 drivers/gpu/drm/drm_gem_dma_helper.c Dmitry Osipenko   2022-10-17  591  		dma_buf_vunmap_unlocked(attach->dmabuf, &map);
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  592  		return obj;
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  593  	}
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  594  
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  595  	dma_obj = to_drm_gem_dma_obj(obj);
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02 @596  	dma_obj->vaddr = map.vaddr;
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  597  
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  598  	return obj;
b9068cde51eea1 drivers/gpu/drm/drm_gem_cma_helper.c Noralf Trønnes    2018-11-10  599  }
4a83c26a1d8702 drivers/gpu/drm/drm_gem_dma_helper.c Danilo Krummrich  2022-08-02  600  EXPORT_SYMBOL(drm_gem_dma_prime_import_sg_table_vmap);
4b2b5e142ff499 drivers/gpu/drm/drm_gem_cma_helper.c Thomas Zimmermann 2021-10-20  601  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
