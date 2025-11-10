Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EFC46F1E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C51110E3BC;
	Mon, 10 Nov 2025 13:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlbzZ28Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D654F10E3B0;
 Mon, 10 Nov 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762781873; x=1794317873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MpvpQ+zwFGgElKQFGsR3rvUlYTM2YXz7/yo8/if9x7A=;
 b=hlbzZ28ZZxPZpkl2r0TEOz+D3a1F+9KxqUVUjjT+UJoa0f8e7VASajQF
 e7dEu2Kj5uMnpezywXNA4u1D1knvm8e/6Z8GbdSPNyBVSPEveonikUIbB
 /82PEGZKzKl5QxpZDXdd19HQGjsDuSYTm0rUynIsbmL3KPBNRYIGPC8fb
 px2wQDbaYlhuE2nJ9nP6dRc9asSFCMLc8t/kkVggE0DjnNBAVPzW84Ov6
 5iN2l0gMfrzZB637tRd/qhqAEJ455tVksxgPrRuBGr25efU8oYtk5MlRR
 jpdOosEHS2Q8wJmjPFDkrYIpQFPJ9JL+aiGvCGcKi7BRk5xzJKN0usuZP Q==;
X-CSE-ConnectionGUID: /eyBxIwmRIKZu6UvJHeqmw==
X-CSE-MsgGUID: 5uVRI9qOT/O4e5y3khJHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64740072"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64740072"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:37:52 -0800
X-CSE-ConnectionGUID: PdttmHQiQuysIPlPSwzWBg==
X-CSE-MsgGUID: fQoCJl5PR6CSp6RTav1i+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="212068745"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 10 Nov 2025 05:37:48 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vIS5Z-0000Td-2t;
 Mon, 10 Nov 2025 13:37:45 +0000
Date: Mon, 10 Nov 2025 21:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>
Subject: Re: [PATCH v5 2/5] drm/nouveau/uvmm: Allow larger pages
Message-ID: <202511102116.qWX79pIo-lkp@intel.com>
References: <20251108194919.68754-3-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251108194919.68754-3-mohamedahmedegypt2001@gmail.com>
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

Hi Mohamed,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.18-rc5 next-20251110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohamed-Ahmed/drm-nouveau-uvmm-Prepare-for-larger-pages/20251109-035142
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251108194919.68754-3-mohamedahmedegypt2001%40gmail.com
patch subject: [PATCH v5 2/5] drm/nouveau/uvmm: Allow larger pages
config: i386-randconfig-141-20251110 (https://download.01.org/0day-ci/archive/20251110/202511102116.qWX79pIo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511102116.qWX79pIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511102116.qWX79pIo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_uvmm.c:508:16: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
     508 |         dev_warn_once(op->gem.obj->dev, "Could not find an appropriate page size.\n");
         |                       ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:201:27: note: expanded from macro 'dev_warn_once'
     201 |         dev_level_once(dev_warn, dev, fmt, ##__VA_ARGS__)
         |                                  ^~~
   include/linux/dev_printk.h:181:13: note: expanded from macro 'dev_level_once'
     181 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                           ^~~
   include/linux/dev_printk.h:156:49: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:52:37: note: passing argument to parameter 'dev' here
      52 | void _dev_warn(const struct device *dev, const char *fmt, ...);
         |                                     ^
   1 error generated.


vim +508 drivers/gpu/drm/nouveau/nouveau_uvmm.c

   466	
   467	static u8
   468	select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op)
   469	{
   470		struct nouveau_bo *nvbo = nouveau_gem_object(op->gem.obj);
   471	
   472		/* nouveau_bo_fixup_align() guarantees that the page size will be aligned
   473		 * for most cases, but it can't handle cases where userspace allocates with
   474		 * a size and then binds with a smaller granularity. So in order to avoid
   475		 * breaking old userspace, we need to ensure that the VA is actually
   476		 * aligned before using it, and if it isn't, then we downgrade to the first
   477		 * granularity that will fit, which is optimal from a correctness and
   478		 * performance perspective.
   479		 */
   480		if (op_map_aligned_to_page_shift(op, nvbo->page))
   481			return nvbo->page;
   482	
   483		struct nouveau_mem *mem = nouveau_mem(nvbo->bo.resource);
   484		struct nvif_vmm *vmm = &uvmm->vmm.vmm;
   485		int i;
   486	
   487		/* If the given granularity doesn't fit, let's find one that will fit. */
   488		for (i = 0; i < vmm->page_nr; i++) {
   489			/* Ignore anything that is bigger or identical to the BO preference. */
   490			if (vmm->page[i].shift >= nvbo->page)
   491				continue;
   492	
   493			/* Skip incompatible domains. */
   494			if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram)
   495				continue;
   496			if ((mem->mem.type & NVIF_MEM_HOST) &&
   497			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
   498				continue;
   499	
   500			/* If it fits, return the proposed shift. */
   501			if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
   502				return vmm->page[i].shift;
   503		}
   504	
   505		/* If we get here then nothing can reconcile the requirements. This should never
   506		 * happen.
   507		 */
 > 508		dev_warn_once(op->gem.obj->dev, "Could not find an appropriate page size.\n");
   509	
   510		return PAGE_SHIFT;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
