Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EDEAA5C77
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 11:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E6610E077;
	Thu,  1 May 2025 09:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KN8NxWit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8E10E077
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746090318; x=1777626318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jJ3F4gM4YJZadTUvKQftbhu43Hg+dCEKGKNWFuxIVJU=;
 b=KN8NxWitIrTw6gnIfTBX779dJ3LEBDzMH1C65cLpcMCrzzn+MbX9VhNA
 DW8ANz9pFb479OqmzHlscb2cY2yUMvVlxCzS6SWHSpGN5XKgSY2lVTKmS
 6Lwik4ME4kybUR3VcFnHCoJaoPZXSBvDLMR9KO9YkFfMZikcMTvhqQOIi
 Cs4B3NnXig+aCZZ2mU+oIqDp6TudenT+9Jm1jzFrFnHNZHlIKrSxGm27T
 KM1E27K4neNCh/NnVX0c10ycb2HQh5teq03Ym9aoZZ2YPwKpM/utaJj6j
 XiISU6bvcIAqzPA9kHW+25YCmaShsR+U6LoZoLBNjBsg+aGGqzd1dZQvn A==;
X-CSE-ConnectionGUID: kSDOc7zPREmdcGUorHFDUg==
X-CSE-MsgGUID: t6+Adv8hT2yJxkAhMug8Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58423477"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; d="scan'208";a="58423477"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 02:05:15 -0700
X-CSE-ConnectionGUID: TG3uqsBdTgCIgGcs/DsKGg==
X-CSE-MsgGUID: 4Vk331fnQHG4Glg4EM+ahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; d="scan'208";a="139527386"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 01 May 2025 02:05:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uAPqt-00044L-19;
 Thu, 01 May 2025 09:05:07 +0000
Date: Thu, 1 May 2025 17:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
Message-ID: <202505011655.qTmh4UA7-lkp@intel.com>
References: <20250430085658.540746-2-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430085658.540746-2-oushixiong1025@163.com>
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus usb/usb-testing usb/usb-next usb/usb-linus xen-tip/linux-next linus/master v6.15-rc4]
[cannot apply to tegra/for-next drm-xe/drm-xe-next rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes next-20250430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/drm-prime-Support-importing-DMA-BUF-without-sg_table/20250430-170136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250430085658.540746-2-oushixiong1025%40163.com
patch subject: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
config: arm64-randconfig-003-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011655.qTmh4UA7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011655.qTmh4UA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011655.qTmh4UA7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_prime.c:925:24: warning: no previous prototype for function 'drm_gem_prime_import_dev_skip_map' [-Wmissing-prototypes]
     925 | struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
         |                        ^
   drivers/gpu/drm/drm_prime.c:925:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     925 | struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
         | ^
         | static 
   1 warning generated.


vim +/drm_gem_prime_import_dev_skip_map +925 drivers/gpu/drm/drm_prime.c

   913	
   914	/**
   915	 * drm_gem_prime_import_dev_skip_map - core implementation of the import callback
   916	 * @dev: drm_device to import into
   917	 * @dma_buf: dma-buf object to import
   918	 * @attach_dev: struct device to dma_buf attach
   919	 *
   920	 * This function exports a dma-buf without get it's scatter/gather table.
   921	 *
   922	 * Drivers who need to get an scatter/gather table for objects need to call
   923	 * drm_gem_prime_import_dev() instead.
   924	 */
 > 925	struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
   926								 struct dma_buf *dma_buf,
   927								 struct device *attach_dev)
   928	{
   929		struct dma_buf_attachment *attach;
   930		struct drm_gem_object *obj;
   931		int ret;
   932	
   933		if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
   934			obj = dma_buf->priv;
   935			if (obj->dev == dev) {
   936				/*
   937				 * Importing dmabuf exported from our own gem increases
   938				 * refcount on gem itself instead of f_count of dmabuf.
   939				 */
   940				drm_gem_object_get(obj);
   941				return obj;
   942			}
   943		}
   944	
   945		attach = dma_buf_attach(dma_buf, attach_dev, true);
   946		if (IS_ERR(attach))
   947			return ERR_CAST(attach);
   948	
   949		get_dma_buf(dma_buf);
   950	
   951		obj = dev->driver->gem_prime_import_attachment(dev, attach);
   952		if (IS_ERR(obj)) {
   953			ret = PTR_ERR(obj);
   954			goto fail_detach;
   955		}
   956	
   957		obj->import_attach = attach;
   958		obj->resv = dma_buf->resv;
   959	
   960		return obj;
   961	
   962	fail_detach:
   963		dma_buf_detach(dma_buf, attach);
   964		dma_buf_put(dma_buf);
   965	
   966		return ERR_PTR(ret);
   967	}
   968	EXPORT_SYMBOL(drm_gem_prime_import_dev_skip_map);
   969	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
