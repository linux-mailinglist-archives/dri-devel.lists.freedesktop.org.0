Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1A832B4E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 15:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138D210E0A4;
	Fri, 19 Jan 2024 14:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2135810E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705674374; x=1737210374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6ZyFttJi9Pj6gtg9DPLGs15qvrUf2pvBuDiSTNdqKfw=;
 b=W0hfSys+Y/al9wmOt00Qkrd7YXInkgUa7FsDNTLKYCs0imKAx6PV1K8h
 K+LG28sPcRY2kjZbwbejJWg+gesaLeQO0GipFecsw52ZWbT0HVBtTlob7
 oWDSajj3iLQQzeQt5bAoxcEXpi4znxmPGjvb8sefqORkqmF2pfWKgRfp3
 2flfbBm7e+23tx/hTqH3+26bgfzYLlKm0h+J9hET2k8xVMd5yMLBWx9p6
 QdDiyNKgU24GCHnWdhrslUaU8FDj7ZpIcAKGZFAKUGQyB9thsx2VSPh7E
 nOqP+//sAlpQC5Yi6Zj+bt39PeYmKg0YmkFxNKRRdjRIp/31+keO3HtEg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7513053"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7513053"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:26:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="778000589"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="778000589"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2024 06:26:04 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rQpon-000492-2J;
 Fri, 19 Jan 2024 14:26:01 +0000
Date: Fri, 19 Jan 2024 22:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Message-ID: <202401192234.0uzq25ka-lkp@intel.com>
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
config: sh-randconfig-r052-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192234.0uzq25ka-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192234.0uzq25ka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192234.0uzq25ka-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/usb/gadget/function/f_fs.o: in function `ffs_dmabuf_signal_done':
>> f_fs.c:(.text+0x254c): undefined reference to `dma_fence_begin_signalling'
>> sh4-linux-ld: f_fs.c:(.text+0x2560): undefined reference to `dma_fence_signal'
>> sh4-linux-ld: f_fs.c:(.text+0x2564): undefined reference to `dma_fence_end_signalling'
   sh4-linux-ld: drivers/usb/gadget/function/f_fs.o: in function `ffs_epfile_release':
>> f_fs.c:(.text+0x28a0): undefined reference to `dma_buf_detach'
>> sh4-linux-ld: f_fs.c:(.text+0x28a4): undefined reference to `dma_buf_put'
   sh4-linux-ld: drivers/usb/gadget/function/f_fs.o: in function `ffs_dmabuf_unmap_work':
>> f_fs.c:(.text+0x2c6c): undefined reference to `dma_buf_unmap_attachment'
>> sh4-linux-ld: f_fs.c:(.text+0x2c70): undefined reference to `dma_resv_reset_max_fences'
>> sh4-linux-ld: f_fs.c:(.text+0x2c84): undefined reference to `dma_buf_detach'
   sh4-linux-ld: f_fs.c:(.text+0x2c88): undefined reference to `dma_buf_put'
>> sh4-linux-ld: f_fs.c:(.text+0x2c94): undefined reference to `dma_fence_release'
   sh4-linux-ld: drivers/usb/gadget/function/f_fs.o: in function `ffs_dmabuf_transfer':
>> f_fs.c:(.text+0x2e30): undefined reference to `dma_buf_get'
   sh4-linux-ld: f_fs.c:(.text+0x2e3c): undefined reference to `dma_buf_put'
>> sh4-linux-ld: f_fs.c:(.text+0x2ef4): undefined reference to `dma_resv_test_signaled'
>> sh4-linux-ld: f_fs.c:(.text+0x2efc): undefined reference to `dma_buf_map_attachment'
>> sh4-linux-ld: f_fs.c:(.text+0x3098): undefined reference to `dma_resv_reserve_fences'
>> sh4-linux-ld: f_fs.c:(.text+0x30bc): undefined reference to `dma_fence_init'
>> sh4-linux-ld: f_fs.c:(.text+0x30c0): undefined reference to `dma_resv_add_fence'
   sh4-linux-ld: f_fs.c:(.text+0x30c4): undefined reference to `dma_resv_reset_max_fences'
>> sh4-linux-ld: f_fs.c:(.text+0x30d4): undefined reference to `dma_fence_begin_signalling'
   sh4-linux-ld: f_fs.c:(.text+0x30e0): undefined reference to `dma_fence_end_signalling'
   sh4-linux-ld: f_fs.c:(.text+0x30f0): undefined reference to `dma_buf_put'
   sh4-linux-ld: f_fs.c:(.text+0x321c): undefined reference to `dma_fence_release'
>> sh4-linux-ld: f_fs.c:(.text+0x3224): undefined reference to `dma_buf_unmap_attachment'
   sh4-linux-ld: f_fs.c:(.text+0x3228): undefined reference to `dma_resv_reset_max_fences'
   sh4-linux-ld: f_fs.c:(.text+0x3230): undefined reference to `dma_buf_detach'
   sh4-linux-ld: f_fs.c:(.text+0x3234): undefined reference to `dma_buf_put'
   sh4-linux-ld: drivers/usb/gadget/function/f_fs.o: in function `ffs_epfile_ioctl':
   f_fs.c:(.text+0x41f0): undefined reference to `dma_buf_get'
>> sh4-linux-ld: f_fs.c:(.text+0x41f4): undefined reference to `dma_buf_attach'
   sh4-linux-ld: f_fs.c:(.text+0x4200): undefined reference to `dma_buf_detach'
>> sh4-linux-ld: f_fs.c:(.text+0x4210): undefined reference to `dma_fence_context_alloc'
   sh4-linux-ld: f_fs.c:(.text+0x4220): undefined reference to `dma_buf_put'
   sh4-linux-ld: f_fs.c:(.text+0x43b0): undefined reference to `dma_buf_detach'
   sh4-linux-ld: f_fs.c:(.text+0x43b4): undefined reference to `dma_buf_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
