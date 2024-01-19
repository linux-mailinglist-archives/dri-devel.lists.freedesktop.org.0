Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1B832A17
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 14:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A469C10EA2A;
	Fri, 19 Jan 2024 13:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AF210EA12
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705669867; x=1737205867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J/z83Xg047XGvf3ennA+Sk+uHgqEASMgOJ1cSPBD8MU=;
 b=H//34y5PgWC1Vla0/wUmWRlQtBE7+jNgXIgoda0QbONjMUK8PixK5MbQ
 juWwMtjL4g+Fn177LQclu66PAyoWDSskd6LWy3ehUJAv3EO9bFgbdK5km
 FdYmfpuv/RC026xYl7NfOfby/2Upk0VUJGLlTFjZiqtXb57p7xAykvgjF
 o31XXVJLnuzV8XcNN6zThQT3cvTPYZrxx6KGFid2No4LZ1dkFdIt04eNE
 DiXx25jMcRVWG1+HbcN0qJwdShSlK4eHTHeUcMpMrMgFq7KQgRyB+m0AI
 Qn1X5uV7v/5wPZda3hLhmjqzIwTfU1aKajRW52f558mwZN/LBIgAMp0Tv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7443372"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7443372"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 05:11:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="785069304"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="785069304"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 19 Jan 2024 05:11:01 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rQoeA-00044W-37;
 Fri, 19 Jan 2024 13:10:58 +0000
Date: Fri, 19 Jan 2024 21:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Message-ID: <202401192043.6DTnLlKn-lkp@intel.com>
References: <20240117122646.41616-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117122646.41616-4-paul@crapouillou.net>
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
Cc: linaro-mm-sig@lists.linaro.org,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus lwn/docs-next linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20240117-203111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240117122646.41616-4-paul%40crapouillou.net
patch subject: [PATCH v4 3/4] usb: gadget: functionfs: Add DMABUF import interface
config: arm-randconfig-r112-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192043.6DTnLlKn-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20240119/202401192043.6DTnLlKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192043.6DTnLlKn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_buf_get
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_detach
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: dma_fence_init
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_resv_add_fence
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_fence_signal
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_dmabuf_io_complete) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_dmabuf_signal_done) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_fence_release
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(dma_fence_put) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_dmabuf_unmap_work) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_put
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: dma_buf_attach
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_fence_context_alloc
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_resv_test_signaled
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_map_attachment
   >>> referenced by f_fs.c
   >>>               drivers/usb/gadget/function/f_fs.o:(ffs_epfile_ioctl) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
