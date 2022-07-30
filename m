Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D05858D0
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 08:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49BB10F3B6;
	Sat, 30 Jul 2022 06:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF110F3B6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 06:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659161574; x=1690697574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z3dt3CF/Wfrwij9l6dIICz7tlz6a9YtfxGNodSaZ3wo=;
 b=Igez/TtdKkTs2gm8EAKoTzinOpeGDY17XWraozVNrQO4uq4U1MTJX6Q3
 PSnCjFOaTHl01OtG+IlU8pHpb7YZ28UzMcUX06/ehwOo3/GfM0vxmcD3V
 rkeeJ44DzXl8l+EehES4kMtbtDSr+IiVx5yJrTwjOSFVQ1JgN3CHvGBZe
 BCnutOlrPUJ9hGWrNh7NulD8xFci19EvcFfOZcyHyrqWGE/ciVSGyOGOb
 76vqRp7ab1zhflpaPEVvfLnbsvpI273vgckAuOxewizLpr7Uz1w+vGv+a
 R1QJH5F+RTNj1YEcw/d7/r66Y2zorDpx1Pr4jvw1Fbio3XF3gVfNq6BfW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="268662182"
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; d="scan'208";a="268662182"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 23:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; d="scan'208";a="928980357"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 29 Jul 2022 23:12:43 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHfiN-000CUB-0k;
 Sat, 30 Jul 2022 06:12:43 +0000
Date: Sat, 30 Jul 2022 14:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Message-ID: <202207301450.M4icK2Bg-lkp@intel.com>
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
config: arm-randconfig-r033-20220729 (https://download.01.org/0day-ci/archive/20220730/202207301450.M4icK2Bg-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/dma-buf-map-info-support/20220730-010844
        git checkout 203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:346:19: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
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
