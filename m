Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F924585C97
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 01:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AD2B2108;
	Sat, 30 Jul 2022 23:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A7BB2105
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659222112; x=1690758112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T8Gwb5eXQuxPfUXYvnUcxftAQQomSRR24x3wrRDUKSU=;
 b=cnGISFl0chG2tbF7KwMkpHt7ymoC6+uWwKs5rmrtfToZbel50VH0xigY
 7ZhcfbS/3D+WpB+48z3R87eVngGmixqHb5xbYyWfsML0VnqMeQ+OGPMTZ
 ZEFnILPa/UYvbK6RZpMpLhCA8rcDs8PryFtPcb8xmyoOFlSWR0HJscg2P
 NcRw7CFk8Z5Bfv7yqE1OgQXux2PUoTXDOlaYFJ/IygeRS9bDC3obijGcd
 eR2DUb9tFZsBCZfy6u1YPHP5RfXZFhjmqE+JpkYJxUswFtI1t986ZhrXi
 yF4YDtpy7sdKVpjSgPuq5YKlrqXrQeVt3+IVFOBe/32oAea+LjkonihkA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="271993917"
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; d="scan'208";a="271993917"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 16:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; d="scan'208";a="601641594"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 30 Jul 2022 16:01:50 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHvSv-000DPr-2J;
 Sat, 30 Jul 2022 23:01:49 +0000
Date: Sun, 31 Jul 2022 07:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Message-ID: <202207310607.RX5r6WRK-lkp@intel.com>
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

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc8]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/dma-buf-map-info-support/20220730-010844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6e2c0490769ef8a95b61304389116ccc85c53e12
config: hexagon-randconfig-r032-20220729 (https://download.01.org/0day-ci/archive/20220731/202207310607.RX5r6WRK-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/dma-buf-map-info-support/20220730-010844
        git checkout 203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:346:19: error: passing 'const void  btf_type_tag(user)*' (aka 'const void *') to parameter of type 'void  btf_type_tag(user)*' (aka 'void *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           if (copy_to_user(uarg, &arg, sizeof(arg)))
                            ^~~~
   include/linux/uaccess.h:157:27: note: passing argument to parameter 'to' here
   copy_to_user(void __user *to, const void *from, unsigned long n)
                             ^
   1 error generated.


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
