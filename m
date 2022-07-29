Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2FF585679
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 23:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A9C10E17A;
	Fri, 29 Jul 2022 21:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2910E17A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659130106; x=1690666106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0/y1fR/f4oWwAdcJ5GdMgM4eKAEqgTbVggLZ/wY8Bhs=;
 b=WSyX6Ky2Kw6BBdBc4+9to37svjqTBE1CHu3kgFn3vRgODJwDTvSvOi01
 +A760UEnaScsQry9ID1qP8wze9KBkwJGpwi12vEBm/uSPUJasjRm19G1u
 KtANy2LI8DxOLhtcowxIrB3hkpl6KsOd3BuSndVpdAu5a1PsPhsajF8xw
 LDZspT0ze6KvbQGifbWn4JlPVV1k6j8o1e5iYV2lXvfpz0ULHPJsnwMi8
 LNxdMdKZ+VY+yt2RHwp1UF5n1UW3qhNrDORmF+T99dsHsydjxYtNP7Oha
 RDTOX18UQmZ6OaH+56fpOYZwviPd6uwwMj1W1uHHG6RIxocSV12zopL5v w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="275738357"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="275738357"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 14:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="629522403"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2022 14:28:24 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHXWx-000C6r-2n;
 Fri, 29 Jul 2022 21:28:23 +0000
Date: Sat, 30 Jul 2022 05:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Message-ID: <202207300546.hB4U217w-lkp@intel.com>
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
config: arc-randconfig-r043-20220729 (https://download.01.org/0day-ci/archive/20220730/202207300546.hB4U217w-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/dma-buf-map-info-support/20220730-010844
        git checkout 203f14a73a179d6c5fbfa4813e45fde2a9ae9860
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c: In function 'dma_buf_info':
>> drivers/dma-buf/dma-buf.c:346:26: warning: passing argument 1 of 'copy_to_user' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     346 |         if (copy_to_user(uarg, &arg, sizeof(arg)))
         |                          ^~~~
   In file included from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from drivers/dma-buf/dma-buf.c:14:
   include/linux/uaccess.h:157:27: note: expected 'void *' but argument is of type 'const void *'
     157 | copy_to_user(void __user *to, const void *from, unsigned long n)
         |              ~~~~~~~~~~~~~^~


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
