Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC2678C5B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B43E10E5A1;
	Mon, 23 Jan 2023 23:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C031810E5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 23:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674518374; x=1706054374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QAMUQ1C9nh+0FsG2N/002dB6YDeAObemhBwJPCkLwIw=;
 b=gbxv5ZJtIJsRiSACq5arM8ns1MOtjSTgKMquouDvNRD6JXRehHiJLbf2
 uyhgJfWd4UD4TeGxCyZTmgP1A4CgrcmyCHLHgxXzWhr6/LVSNak2yuqnR
 tKwfBOgOCEw8LfiOAElrSaf6HtRaQ4GVUmA9UkelYijlKyOUPUtJM0mXr
 1zYATmgIXGWzQUK4M6GnXMvyRmciX81YKJ/Cvkst9TalbarX2HPTawIWr
 fON+IQmOBQkR6L//emmjrXMS44ATAnDn1mltatsul6VoaIGyTSq492dIT
 HUMZdzrSt9oaNiduM/+prsDFY52oskDCtLkuSaAd0sFYT8o/6k7ufA7tq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390698557"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="390698557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 15:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694139295"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="694139295"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 23 Jan 2023 15:59:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pK6ik-0005xg-39;
 Mon, 23 Jan 2023 23:59:27 +0000
Date: Tue, 24 Jan 2023 07:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
 lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
 jstultz@google.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
Message-ID: <202301240717.tim1ggHo-lkp@intel.com>
References: <20230123123756.401692-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123123756.401692-3-christian.koenig@amd.com>
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on media-tree/master drm-tip/drm-tip linus/master v6.2-rc5]
[cannot apply to next-20230123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/media-uvcvideo-expose-dma-heap-hint-to-userspace/20230123-213836
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230123123756.401692-3-christian.koenig%40amd.com
patch subject: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
config: hexagon-randconfig-r032-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240717.tim1ggHo-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/adc04dccd892eec7f84c6ec112b48df376172e48
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/media-uvcvideo-expose-dma-heap-hint-to-userspace/20230123-213836
        git checkout adc04dccd892eec7f84c6ec112b48df376172e48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/usb/uvc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/usb/uvc/uvc_driver.c:10:
>> include/linux/dma-heap.h:92:5: warning: no previous prototype for function 'dma_heap_create_device_link' [-Wmissing-prototypes]
   int dma_heap_create_device_link(struct device *dev, const char *heap)
       ^
   include/linux/dma-heap.h:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dma_heap_create_device_link(struct device *dev, const char *heap)
   ^
   static 
>> include/linux/dma-heap.h:97:6: warning: no previous prototype for function 'dma_heap_remove_device_link' [-Wmissing-prototypes]
   void dma_heap_remove_device_link(struct device *dev)
        ^
   include/linux/dma-heap.h:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dma_heap_remove_device_link(struct device *dev)
   ^
   static 
   In file included from drivers/media/usb/uvc/uvc_driver.c:16:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/usb/uvc/uvc_driver.c:16:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/usb/uvc/uvc_driver.c:16:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   8 warnings generated.


vim +/dma_heap_create_device_link +92 include/linux/dma-heap.h

4ce5c5c0cf31f4 Christian König 2023-01-23   91  
4ce5c5c0cf31f4 Christian König 2023-01-23  @92  int dma_heap_create_device_link(struct device *dev, const char *heap)
4ce5c5c0cf31f4 Christian König 2023-01-23   93  {
4ce5c5c0cf31f4 Christian König 2023-01-23   94  	return 0;
4ce5c5c0cf31f4 Christian König 2023-01-23   95  }
4ce5c5c0cf31f4 Christian König 2023-01-23   96  
4ce5c5c0cf31f4 Christian König 2023-01-23  @97  void dma_heap_remove_device_link(struct device *dev)
4ce5c5c0cf31f4 Christian König 2023-01-23   98  {
4ce5c5c0cf31f4 Christian König 2023-01-23   99  }
4ce5c5c0cf31f4 Christian König 2023-01-23  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
