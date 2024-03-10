Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A4877642
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 12:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DCA10E045;
	Sun, 10 Mar 2024 11:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwrETTd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CC410E045
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710070273; x=1741606273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xmHn29ycT3efiyadYaKMHk1CM4Om2IaoHBzYN+wd50k=;
 b=kwrETTd7nR+B8s69VO9RyfW1Lc8IjCS2ItFJEAH5BfPQd310ULDNQjBC
 PD0b/n1ICvta9APVqR7rk5QksFq7QdBFSXfH48SrphR6QZlBkHC+OvnWm
 5AVvel/i+Fi7zLTCAl81KUvb/GZN4f3Nqg80UpDcdLzPBva9nuQop/zuO
 sdipB+dvlEy52iy5s9pwJSBbdjlT83aPjwmzdIDXSkjZGCbWwok2TstKZ
 UpO4AzwXGa7wZmrhyvXCLUpo2iZQTLX/iifgg0EFGBZz4ygcwQ2qPcz2Y
 STFMuAEzVWz9Q2Mhx3b3416H2XksbTLUGWJJMnoDe/8La4ikzZ28RZayX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="15881878"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="15881878"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 04:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="10906600"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 10 Mar 2024 04:31:06 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rjHOS-0008Ct-0N;
 Sun, 10 Mar 2024 11:31:04 +0000
Date: Sun, 10 Mar 2024 19:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <nuno.sa@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 3/6] iio: core: Add new DMABUF interface infrastructure
Message-ID: <202403101928.WWSQwfdG-lkp@intel.com>
References: <20240308170046.92899-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308170046.92899-4-paul@crapouillou.net>
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

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on vkoul-dmaengine/next lwn/docs-next linus/master v6.8-rc7 next-20240308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dmaengine-Add-API-function-dmaengine_prep_peripheral_dma_vec/20240309-010421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240308170046.92899-4-paul%40crapouillou.net
patch subject: [PATCH v8 3/6] iio: core: Add new DMABUF interface infrastructure
config: um-randconfig-002-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101928.WWSQwfdG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101928.WWSQwfdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101928.WWSQwfdG-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/iio/industrialio-buffer.o: in function `iio_buffer_dmabuf_release':
>> industrialio-buffer.c:(.text+0xec6): undefined reference to `dma_buf_unmap_attachment'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xf96): undefined reference to `dma_buf_detach'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xfa5): undefined reference to `dma_buf_put'
   /usr/bin/ld: drivers/iio/industrialio-buffer.o: in function `iio_buffer_signal_dmabuf_done':
>> industrialio-buffer.c:(.text+0x4a56): undefined reference to `dma_fence_signal'
   /usr/bin/ld: drivers/iio/industrialio-buffer.o: in function `iio_buffer_cleanup':
>> industrialio-buffer.c:(.text+0x64f2): undefined reference to `dma_fence_release'
   /usr/bin/ld: drivers/iio/industrialio-buffer.o: in function `iio_buffer_attach_dmabuf.isra.0':
>> industrialio-buffer.c:(.text+0x9dbf): undefined reference to `dma_fence_context_alloc'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0x9df7): undefined reference to `dma_buf_get'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0x9e38): undefined reference to `dma_buf_attach'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0x9efe): undefined reference to `dma_buf_map_attachment'
   /usr/bin/ld: industrialio-buffer.c:(.text+0xa2c1): undefined reference to `dma_buf_detach'
   /usr/bin/ld: industrialio-buffer.c:(.text+0xa2cd): undefined reference to `dma_buf_put'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xa34d): undefined reference to `dma_buf_unmap_attachment'
   /usr/bin/ld: drivers/iio/industrialio-buffer.o: in function `iio_buffer_enqueue_dmabuf':
>> industrialio-buffer.c:(.text+0xa949): undefined reference to `dma_buf_get'
   /usr/bin/ld: industrialio-buffer.c:(.text+0xa997): undefined reference to `dma_buf_put'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xac84): undefined reference to `dma_fence_init'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xad4b): undefined reference to `dma_resv_wait_timeout'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xadec): undefined reference to `dma_resv_reserve_fences'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xae2c): undefined reference to `dma_resv_add_fence'
>> /usr/bin/ld: industrialio-buffer.c:(.text+0xb0da): undefined reference to `dma_fence_release'
   /usr/bin/ld: drivers/iio/industrialio-buffer.o: in function `iio_buffer_chrdev_ioctl':
   industrialio-buffer.c:(.text+0xb833): undefined reference to `dma_buf_get'
   /usr/bin/ld: industrialio-buffer.c:(.text+0xbad0): undefined reference to `dma_buf_put'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
