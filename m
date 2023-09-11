Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E30E79A57B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C841110E194;
	Mon, 11 Sep 2023 08:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA18F10E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694419612; x=1725955612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EKc2l8u/kKBul3gNAYJEk/Ck38NKo2uvJewBdyW546M=;
 b=Oj6HvgWHMdY7ZmoVkRVeOHetxHI4PktPVuuklslZZa+iW8E5NhEV2Tyx
 UVtSM4IbNUY+BUa+TTKQU+TcVr50R5Z1hKFupZxxA6bV4FfDn5swG3sZk
 gVOY39AtWblRL4RJBAWzMmiHkhnBc5Ev/NqpG7JViEpxk5jwgAYIRGLL0
 +6urFXMlfYZlAi5cPpynzq9NarjjxPY4zX9zTBibcuos5dcVHeTOSjEUe
 zpY/fjStzIO/WR8RMC1Yp0sO3uEFjTQfGn+8hAutEtMjJikgcnUKXaVX0
 Fk3e+3o7Qv4g0m84yizr/XjlnLkTpBIiSUZ0e73mtxXkUtT1dBDbq1KAr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="444438891"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="444438891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 01:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="693005175"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="693005175"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 11 Sep 2023 01:06:47 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qfbwS-0005yc-30;
 Mon, 11 Sep 2023 08:06:44 +0000
Date: Mon, 11 Sep 2023 16:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Message-ID: <202309111534.u4wfJ4vk-lkp@intel.com>
References: <20230911023038.30649-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-5-yong.wu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, tjmercier@google.com,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next linus/master v6.6-rc1 next-20230911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Deduplicate-docs-and-adopt-common-format/20230911-103308
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230911023038.30649-5-yong.wu%40mediatek.com
patch subject: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20230911/202309111534.u4wfJ4vk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111534.u4wfJ4vk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111534.u4wfJ4vk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/mtk_secure_heap.c:68:27: error: initialization of 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  long unsigned int,  long unsigned int)' from incompatible pointer type 'struct dma_buf * (*)(struct dma_heap *, size_t,  long unsigned int,  long unsigned int)' {aka 'struct dma_buf * (*)(struct dma_heap *, unsigned int,  long unsigned int,  long unsigned int)'} [-Werror=incompatible-pointer-types]
      68 |         .allocate       = mtk_sec_heap_allocate,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/mtk_secure_heap.c:68:27: note: (near initialization for 'mtk_sec_heap_ops.allocate')
   cc1: some warnings being treated as errors


vim +68 drivers/dma-buf/heaps/mtk_secure_heap.c

    66	
    67	static const struct dma_heap_ops mtk_sec_heap_ops = {
  > 68		.allocate	= mtk_sec_heap_allocate,
    69	};
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
