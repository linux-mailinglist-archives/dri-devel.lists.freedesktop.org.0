Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6944585816
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 04:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE58A10E342;
	Sat, 30 Jul 2022 02:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5418310E042
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 02:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659148956; x=1690684956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mcpZdeDc1xfj4+c/v41ilgEl0id0FXrF8qWUD5A4IXE=;
 b=LGFbfbjeqM9yvOFOmiEu5zFLYB91W4bhs0rWR47khOO7wIcSjYjeH5Y0
 7XS3f+eTmtZXCakClzrSGEvjAOK97Rq3zKDc5kWEAuMK3e5WUDnYDgTB+
 X9Ac0uhap3i+QapuC0MQvF7PjmkLsynqdupIZIkJHnWjknpc5kVBFDT2I
 LR0Q0PqfhIljsKLMNYIIxBgn2gDX2v9OzcwqlVSYTwq6mC4OG7ymAkSt+
 OPU105IUuljTZ4WjHjGgv/QBhHUv6MZRmS+riioQRUE/gC2UWcLUdMcUF
 GlN/BjNLVN0YkEKV7mZyCvAz3RfRR+mREzTikj38FTQ7/QFqmyxyMxbT6 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="287640808"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="287640808"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 19:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="928949097"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 29 Jul 2022 19:42:34 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHcQz-000CIs-34;
 Sat, 30 Jul 2022 02:42:33 +0000
Date: Sat, 30 Jul 2022 10:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Message-ID: <202207301057.KVTYTw6h-lkp@intel.com>
References: <20220729170744.1301044-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729170744.1301044-2-robdclark@gmail.com>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19-rc8]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/dma-buf-map-info-support/20220730-010844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6e2c0490769ef8a95b61304389116ccc85c53e12
config: m68k-randconfig-s032-20220729 (https://download.01.org/0day-ci/archive/20220730/202207301057.KVTYTw6h-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/dma-buf-map-info-support/20220730-010844
        git checkout 203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf.c:346:26: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void [noderef] __user *to @@     got void const [noderef] __user *uarg @@
   drivers/dma-buf/dma-buf.c:346:26: sparse:     expected void [noderef] __user *to
   drivers/dma-buf/dma-buf.c:346:26: sparse:     got void const [noderef] __user *uarg

vim +346 drivers/dma-buf/dma-buf.c

   328	
   329	static long dma_buf_info(struct dma_buf *dmabuf, const void __user *uarg)
   330	{
   331		struct dma_buf_info arg;
   332	
   333		if (copy_from_user(&arg, uarg, sizeof(arg)))
   334			return -EFAULT;
   335	
   336		switch (arg.param) {
   337		case DMA_BUF_INFO_VM_PROT:
   338			if (!dmabuf->ops->mmap_info)
   339				return -ENOSYS;
   340			arg.value = dmabuf->ops->mmap_info(dmabuf);
   341			break;
   342		default:
   343			return -EINVAL;
   344		}
   345	
 > 346		if (copy_to_user(uarg, &arg, sizeof(arg)))
   347			return -EFAULT;
   348	
   349		return 0;
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
