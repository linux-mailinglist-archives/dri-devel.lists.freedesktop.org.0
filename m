Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F580954EE3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 18:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F7A10E805;
	Fri, 16 Aug 2024 16:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjRM6Soc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21D510E5A4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723825988; x=1755361988;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a+GazqQj0H0hND+mdHAKbt7nto5jHAAJxyknn+frBv0=;
 b=PjRM6SocwSDleO8LZUCB3UzPZ0EaC8C8InOT6CYLBAuc13HQ5g9M/kZ2
 i0zTlcFutewkPJH4tkOLFmMPhutbNZUPlAvXSZun0cpnucdE7aR9qqp1C
 lFqJaynNz1MbhOwqzdx6nyKQoao4c7z2WwKLU+ezLdaDPmBqHURKLh5ZK
 AQKlcvZSRO592VxTtFBbTZJvHpxIZYcvMrxyTP6c7ESdyU0PymbopP9EK
 IgIh4kWbt/KyE37C+kzFvrV++63qccJhk2TzgQdCMNacRbSmX92hiS5tg
 Npmg2oCFq+E+XmZp8Ry5nNNUcH8LJ3vjgBjLC75U8oPd9t4zJhJ21SOUP g==;
X-CSE-ConnectionGUID: VSghSmm0Rg2QF2peA4eXvg==
X-CSE-MsgGUID: Qt8PD9rAT52+aIFe+ml0Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39582283"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="39582283"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 09:33:07 -0700
X-CSE-ConnectionGUID: Qn9qCAtGSS6R5q93QrfwOw==
X-CSE-MsgGUID: htCLX/cfSZeb4sx/845cDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="60001770"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 16 Aug 2024 09:33:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sezss-0006e6-0Q;
 Fri, 16 Aug 2024 16:33:02 +0000
Date: Sat, 17 Aug 2024 00:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/vmwgfx: Fix prime with external buffers
Message-ID: <202408170033.rkCwgtSp-lkp@intel.com>
References: <20240815153404.630214-2-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815153404.630214-2-zack.rusin@broadcom.com>
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

Hi Zack,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc3 next-20240816]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-vmwgfx-Fix-prime-with-external-buffers/20240815-234842
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240815153404.630214-2-zack.rusin%40broadcom.com
patch subject: [PATCH v3 2/2] drm/vmwgfx: Fix prime with external buffers
config: i386-randconfig-013-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170033.rkCwgtSp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170033.rkCwgtSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170033.rkCwgtSp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:503:18: error: call to undeclared function 'floor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     503 |         diff->rect.y1 = floor(dst_offset / dst_stride);
         |                         ^
   1 error generated.


vim +/floor +503 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c

   455	
   456	static int vmw_external_bo_copy(struct vmw_bo *dst, u32 dst_offset,
   457					u32 dst_stride, struct vmw_bo *src,
   458					u32 src_offset, u32 src_stride,
   459					u32 width_in_bytes, u32 height,
   460					struct vmw_diff_cpy *diff)
   461	{
   462		struct vmw_private *vmw =
   463			container_of(dst->tbo.bdev, struct vmw_private, bdev);
   464		size_t dst_size = dst->tbo.resource->size;
   465		size_t src_size = src->tbo.resource->size;
   466		struct iosys_map dst_map = {0};
   467		struct iosys_map src_map = {0};
   468		int ret, i;
   469		u8 *vsrc;
   470		u8 *vdst;
   471	
   472		vsrc = map_external(src, &src_map);
   473		if (!vsrc) {
   474			drm_dbg_driver(&vmw->drm, "Wasn't able to map src\n");
   475			ret = -ENOMEM;
   476			goto out;
   477		}
   478	
   479		vdst = map_external(dst, &dst_map);
   480		if (!vdst) {
   481			drm_dbg_driver(&vmw->drm, "Wasn't able to map dst\n");
   482			ret = -ENOMEM;
   483			goto out;
   484		}
   485	
   486		vsrc += src_offset;
   487		vdst += dst_offset;
   488		if (src_stride == dst_stride) {
   489			dst_size -= dst_offset;
   490			src_size -= src_offset;
   491			memcpy(vdst, vsrc,
   492			       min(dst_stride * height, min(dst_size, src_size)));
   493		} else {
   494			WARN_ON(dst_stride < width_in_bytes);
   495			for (i = 0; i < height; ++i) {
   496				memcpy(vdst, vsrc, width_in_bytes);
   497				vsrc += src_stride;
   498				vdst += dst_stride;
   499			}
   500		}
   501	
   502		diff->rect.x1 = (dst_offset % dst_stride) / diff->cpp;
 > 503		diff->rect.y1 = floor(dst_offset / dst_stride);
   504		diff->rect.x2 = diff->rect.x1 + width_in_bytes / diff->cpp;
   505		diff->rect.y2 = diff->rect.y1 + height;
   506	
   507		ret = 0;
   508	out:
   509		unmap_external(src, &src_map);
   510		unmap_external(dst, &dst_map);
   511	
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
