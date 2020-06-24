Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36B6207234
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 13:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAF86EAF0;
	Wed, 24 Jun 2020 11:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF34189D5C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:35:16 +0000 (UTC)
IronPort-SDR: IcWkhGov8aL0Wn36hczmvfa+fhSz3rf9o/LYt0icNwi1Vzet/9gTCh3lmHGgfhR9OO3UTsaEsk
 0562xRuuIdtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132861292"
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
 d="gz'50?scan'50,208,50";a="132861292"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 04:35:15 -0700
IronPort-SDR: iAyYyA30/KVbkHJ8MFpKHtiZs6zrnM6jRJ7iwUIOy7RPQZRZ3iNr7+yuZiMvraD6pD3wGaR/8h
 kOgdoUM/akQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
 d="gz'50?scan'50,208,50";a="479230255"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jun 2020 04:35:12 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jo3gN-0000tf-Qj; Wed, 24 Jun 2020 11:35:11 +0000
Date: Wed, 24 Jun 2020 19:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sonny Jiang <sonny.jiang@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 9963/9999]
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:26:9:
 warning: 'CC_DRM_ID_STRAPS__ATI_REV_ID_MASK' macro redefined
Message-ID: <202006241956.lHNoretj%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   2fecc2a42eb2ca00277fe34dafcf9ece398a848e
commit: 788c2ef8c423ccd8c62a471c7e7debe115b3e124 [9963/9999] drm amdgpu: SI UVD add uvd_v3_1 to makefile
config: s390-randconfig-r014-20200624 (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 1d4c87335d5236ea1f35937e1014980ba961ae34)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390-linux-gnu
        git checkout 788c2ef8c423ccd8c62a471c7e7debe115b3e124
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:17:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:69:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:33:
   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:17:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:69:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:33:
   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:17:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:69:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:33:
   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:17:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:69:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:33:
   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:17:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:503:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:513:46: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew(cpu_to_le16(value), PCI_IOBASE + addr);
                                            ~~~~~~~~~~ ^
   include/asm-generic/io.h:523:46: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel(cpu_to_le32(value), PCI_IOBASE + addr);
                                            ~~~~~~~~~~ ^
   include/asm-generic/io.h:585:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:593:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:601:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:610:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:619:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:628:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:26:9: warning: 'CC_DRM_ID_STRAPS__ATI_REV_ID_MASK' macro redefined [-Wmacro-redefined]
   #define CC_DRM_ID_STRAPS__ATI_REV_ID_MASK 0xf0000000L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2471:9: note: previous definition is here
   #define CC_DRM_ID_STRAPS__ATI_REV_ID_MASK               0xf0000000
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:27:9: warning: 'CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT' macro redefined [-Wmacro-redefined]
   #define CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT 0x0000001c
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2472:9: note: previous definition is here
   #define CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT 0x1c
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:744:9: warning: 'IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK' macro redefined [-Wmacro-redefined]
   #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK 0x80000000L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2345:9: note: previous definition is here
   #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK 0x80000000
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:760:9: warning: 'IH_RB_WPTR__RB_OVERFLOW_MASK' macro redefined [-Wmacro-redefined]
   #define IH_RB_WPTR__RB_OVERFLOW_MASK 0x00000001L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2344:9: note: previous definition is here
   #define IH_RB_WPTR__RB_OVERFLOW_MASK    0x1
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:988:9: warning: 'SRBM_SOFT_RESET__SOFT_RESET_IH_MASK' macro redefined [-Wmacro-redefined]
   #define SRBM_SOFT_RESET__SOFT_RESET_IH_MASK 0x00000400L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2347:9: note: previous definition is here
   #define SRBM_SOFT_RESET__SOFT_RESET_IH_MASK     0x400
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1028:9: warning: 'SRBM_STATUS__IH_BUSY_MASK' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__IH_BUSY_MASK 0x00020000L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2346:9: note: previous definition is here
   #define SRBM_STATUS__IH_BUSY_MASK       0x20000
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1032:9: warning: 'SRBM_STATUS__MCB_BUSY_MASK' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCB_BUSY_MASK 0x00000200L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2435:9: note: previous definition is here
   #define SRBM_STATUS__MCB_BUSY_MASK 0x200
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1033:9: warning: 'SRBM_STATUS__MCB_BUSY__SHIFT' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCB_BUSY__SHIFT 0x00000009
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2436:9: note: previous definition is here
   #define SRBM_STATUS__MCB_BUSY__SHIFT 0x9
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1034:9: warning: 'SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK 0x00000400L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2437:9: note: previous definition is here
   #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK 0x400
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1035:9: warning: 'SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT 0x0000000a
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2438:9: note: previous definition is here
   #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT 0xa
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1036:9: warning: 'SRBM_STATUS__MCC_BUSY_MASK' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCC_BUSY_MASK 0x00000800L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2439:9: note: previous definition is here
   #define SRBM_STATUS__MCC_BUSY_MASK 0x800
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1037:9: warning: 'SRBM_STATUS__MCC_BUSY__SHIFT' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCC_BUSY__SHIFT 0x0000000b
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2440:9: note: previous definition is here
   #define SRBM_STATUS__MCC_BUSY__SHIFT 0xb
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1038:9: warning: 'SRBM_STATUS__MCD_BUSY_MASK' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCD_BUSY_MASK 0x00001000L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2441:9: note: previous definition is here
   #define SRBM_STATUS__MCD_BUSY_MASK 0x1000
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1039:9: warning: 'SRBM_STATUS__MCD_BUSY__SHIFT' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__MCD_BUSY__SHIFT 0x0000000c
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2442:9: note: previous definition is here
   #define SRBM_STATUS__MCD_BUSY__SHIFT 0xc
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1048:9: warning: 'SRBM_STATUS__VMC_BUSY_MASK' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__VMC_BUSY_MASK 0x00000100L
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2443:9: note: previous definition is here
   #define SRBM_STATUS__VMC_BUSY_MASK 0x100
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1049:9: warning: 'SRBM_STATUS__VMC_BUSY__SHIFT' macro redefined [-Wmacro-redefined]
   #define SRBM_STATUS__VMC_BUSY__SHIFT 0x00000008
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/sid.h:2444:9: note: previous definition is here
   #define SRBM_STATUS__VMC_BUSY__SHIFT 0x8
           ^
   36 warnings generated.

vim +/CC_DRM_ID_STRAPS__ATI_REV_ID_MASK +26 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h

de2bdb3dcf9228 Tom St Denis 2016-10-26    25  
de2bdb3dcf9228 Tom St Denis 2016-10-26   @26  #define CC_DRM_ID_STRAPS__ATI_REV_ID_MASK 0xf0000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   @27  #define CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26    28  #define CC_DRM_ID_STRAPS__DEVICE_ID_MASK 0x000ffff0L
de2bdb3dcf9228 Tom St Denis 2016-10-26    29  #define CC_DRM_ID_STRAPS__DEVICE_ID__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26    30  #define CC_DRM_ID_STRAPS__MAJOR_REV_ID_MASK 0x00f00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26    31  #define CC_DRM_ID_STRAPS__MAJOR_REV_ID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26    32  #define CC_DRM_ID_STRAPS__MINOR_REV_ID_MASK 0x0f000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26    33  #define CC_DRM_ID_STRAPS__MINOR_REV_ID__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26    34  #define CC_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE_MASK 0x00ff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26    35  #define CC_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26    36  #define CLIENT0_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    37  #define CLIENT0_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    38  #define CLIENT0_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    39  #define CLIENT0_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    40  #define CLIENT0_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    41  #define CLIENT0_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    42  #define CLIENT0_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    43  #define CLIENT0_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    44  #define CLIENT0_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    45  #define CLIENT0_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    46  #define CLIENT0_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    47  #define CLIENT0_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    48  #define CLIENT0_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    49  #define CLIENT0_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    50  #define CLIENT0_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    51  #define CLIENT0_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    52  #define CLIENT0_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    53  #define CLIENT0_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    54  #define CLIENT0_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    55  #define CLIENT0_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    56  #define CLIENT0_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    57  #define CLIENT0_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    58  #define CLIENT0_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    59  #define CLIENT0_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    60  #define CLIENT0_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    61  #define CLIENT0_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    62  #define CLIENT0_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    63  #define CLIENT0_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    64  #define CLIENT0_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    65  #define CLIENT0_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    66  #define CLIENT0_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    67  #define CLIENT0_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    68  #define CLIENT1_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    69  #define CLIENT1_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    70  #define CLIENT1_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    71  #define CLIENT1_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    72  #define CLIENT1_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    73  #define CLIENT1_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    74  #define CLIENT1_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    75  #define CLIENT1_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    76  #define CLIENT1_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    77  #define CLIENT1_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    78  #define CLIENT1_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    79  #define CLIENT1_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    80  #define CLIENT1_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    81  #define CLIENT1_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    82  #define CLIENT1_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    83  #define CLIENT1_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    84  #define CLIENT1_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    85  #define CLIENT1_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    86  #define CLIENT1_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    87  #define CLIENT1_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    88  #define CLIENT1_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    89  #define CLIENT1_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    90  #define CLIENT1_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    91  #define CLIENT1_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    92  #define CLIENT1_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    93  #define CLIENT1_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    94  #define CLIENT1_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    95  #define CLIENT1_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    96  #define CLIENT1_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    97  #define CLIENT1_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    98  #define CLIENT1_PORT_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    99  #define CLIENT1_PORT_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   100  #define CLIENT2_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   101  #define CLIENT2_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   102  #define CLIENT2_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   103  #define CLIENT2_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   104  #define CLIENT2_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   105  #define CLIENT2_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   106  #define CLIENT2_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   107  #define CLIENT2_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   108  #define CLIENT2_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   109  #define CLIENT2_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   110  #define CLIENT2_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   111  #define CLIENT2_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   112  #define CLIENT2_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   113  #define CLIENT2_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   114  #define CLIENT2_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   115  #define CLIENT2_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   116  #define CLIENT2_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   117  #define CLIENT2_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   118  #define CLIENT2_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   119  #define CLIENT2_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   120  #define CLIENT2_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   121  #define CLIENT2_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   122  #define CLIENT2_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   123  #define CLIENT2_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   124  #define CLIENT2_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   125  #define CLIENT2_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   126  #define CLIENT2_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   127  #define CLIENT2_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   128  #define CLIENT2_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   129  #define CLIENT2_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   130  #define CLIENT2_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   131  #define CLIENT2_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   132  #define CLIENT3_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   133  #define CLIENT3_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   134  #define CLIENT3_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   135  #define CLIENT3_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   136  #define CLIENT3_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   137  #define CLIENT3_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   138  #define CLIENT3_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   139  #define CLIENT3_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   140  #define CLIENT3_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   141  #define CLIENT3_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   142  #define CLIENT3_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   143  #define CLIENT3_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   144  #define CLIENT3_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   145  #define CLIENT3_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   146  #define CLIENT3_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   147  #define CLIENT3_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   148  #define CLIENT3_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   149  #define CLIENT3_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   150  #define CLIENT3_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   151  #define CLIENT3_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   152  #define CLIENT3_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   153  #define CLIENT3_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   154  #define CLIENT3_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   155  #define CLIENT3_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   156  #define CLIENT3_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   157  #define CLIENT3_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   158  #define CLIENT3_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   159  #define CLIENT3_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   160  #define CLIENT3_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   161  #define CLIENT3_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   162  #define CLIENT3_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   163  #define CLIENT3_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   164  #define CP_CONFIG__CP_RDREQ_URG_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   165  #define CP_CONFIG__CP_RDREQ_URG__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   166  #define CP_CONFIG__CP_REQ_TRAN_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   167  #define CP_CONFIG__CP_REQ_TRAN__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   168  #define DC_TEST_DEBUG_DATA__DC_TEST_DEBUG_DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   169  #define DC_TEST_DEBUG_DATA__DC_TEST_DEBUG_DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   170  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_INDEX_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   171  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_INDEX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   172  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_WRITE_EN_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   173  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_WRITE_EN__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   174  #define DH_TEST__DH_TEST_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   175  #define DH_TEST__DH_TEST__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   176  #define EXP0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   177  #define EXP0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   178  #define EXP1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   179  #define EXP1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   180  #define EXP2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   181  #define EXP2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   182  #define EXP3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   183  #define EXP3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   184  #define EXP4__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   185  #define EXP4__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   186  #define EXP5__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   187  #define EXP5__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   188  #define EXP6__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   189  #define EXP6__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   190  #define EXP7__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   191  #define EXP7__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   192  #define GC_USER_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE_MASK 0x00ff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   193  #define GC_USER_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   194  #define HDP_ADDR_CONFIG__BANK_INTERLEAVE_SIZE_MASK 0x00000700L
de2bdb3dcf9228 Tom St Denis 2016-10-26   195  #define HDP_ADDR_CONFIG__BANK_INTERLEAVE_SIZE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   196  #define HDP_ADDR_CONFIG__MULTI_GPU_TILE_SIZE_MASK 0x03000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   197  #define HDP_ADDR_CONFIG__MULTI_GPU_TILE_SIZE__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   198  #define HDP_ADDR_CONFIG__NUM_GPUS_MASK 0x00700000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   199  #define HDP_ADDR_CONFIG__NUM_GPUS__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   200  #define HDP_ADDR_CONFIG__NUM_LOWER_PIPES_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   201  #define HDP_ADDR_CONFIG__NUM_LOWER_PIPES__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   202  #define HDP_ADDR_CONFIG__NUM_PIPES_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   203  #define HDP_ADDR_CONFIG__NUM_PIPES__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   204  #define HDP_ADDR_CONFIG__NUM_SHADER_ENGINES_MASK 0x00003000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   205  #define HDP_ADDR_CONFIG__NUM_SHADER_ENGINES__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   206  #define HDP_ADDR_CONFIG__PIPE_INTERLEAVE_SIZE_MASK 0x00000070L
de2bdb3dcf9228 Tom St Denis 2016-10-26   207  #define HDP_ADDR_CONFIG__PIPE_INTERLEAVE_SIZE__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   208  #define HDP_ADDR_CONFIG__ROW_SIZE_MASK 0x30000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   209  #define HDP_ADDR_CONFIG__ROW_SIZE__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   210  #define HDP_ADDR_CONFIG__SHADER_ENGINE_TILE_SIZE_MASK 0x00070000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   211  #define HDP_ADDR_CONFIG__SHADER_ENGINE_TILE_SIZE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   212  #define HDP_DEBUG0__HDP_DEBUG__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   213  #define HDP_DEBUG1__HDP_DEBUG__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   214  #define HDP_HOST_PATH_CNTL__ALL_SURFACES_DIS_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   215  #define HDP_HOST_PATH_CNTL__ALL_SURFACES_DIS__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26   216  #define HDP_HOST_PATH_CNTL__BIF_RDRET_CREDIT_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   217  #define HDP_HOST_PATH_CNTL__BIF_RDRET_CREDIT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   218  #define HDP_HOST_PATH_CNTL__CACHE_INVALIDATE_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   219  #define HDP_HOST_PATH_CNTL__CACHE_INVALIDATE__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   220  #define HDP_HOST_PATH_CNTL__CLOCK_GATING_DIS_MASK 0x00800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   221  #define HDP_HOST_PATH_CNTL__CLOCK_GATING_DIS__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   222  #define HDP_HOST_PATH_CNTL__LIN_RD_CACHE_DIS_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   223  #define HDP_HOST_PATH_CNTL__LIN_RD_CACHE_DIS__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   224  #define HDP_HOST_PATH_CNTL__MC_WRREQ_CREDIT_MASK 0x000001f8L
de2bdb3dcf9228 Tom St Denis 2016-10-26   225  #define HDP_HOST_PATH_CNTL__MC_WRREQ_CREDIT__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   226  #define HDP_HOST_PATH_CNTL__RD_STALL_TIMER_MASK 0x00001800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   227  #define HDP_HOST_PATH_CNTL__RD_STALL_TIMER__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   228  #define HDP_HOST_PATH_CNTL__REG_CLK_ENABLE_COUNT_MASK 0x0f000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   229  #define HDP_HOST_PATH_CNTL__REG_CLK_ENABLE_COUNT__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   230  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_EN_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   231  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_EN__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   232  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER_MASK 0x00180000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   233  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   234  #define HDP_HOST_PATH_CNTL__WRITE_THROUGH_CACHE_DIS_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   235  #define HDP_HOST_PATH_CNTL__WRITE_THROUGH_CACHE_DIS__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   236  #define HDP_HOST_PATH_CNTL__WR_STALL_TIMER_MASK 0x00000600L
de2bdb3dcf9228 Tom St Denis 2016-10-26   237  #define HDP_HOST_PATH_CNTL__WR_STALL_TIMER__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   238  #define HDP_LAST_SURFACE_HIT__LAST_SURFACE_HIT_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   239  #define HDP_LAST_SURFACE_HIT__LAST_SURFACE_HIT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   240  #define HDP_MEMIO_ADDR__MEMIO_ADDR_LOWER_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   241  #define HDP_MEMIO_ADDR__MEMIO_ADDR_LOWER__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   242  #define HDP_MEMIO_CNTL__MEMIO_ADDR_UPPER_MASK 0x00003f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   243  #define HDP_MEMIO_CNTL__MEMIO_ADDR_UPPER__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   244  #define HDP_MEMIO_CNTL__MEMIO_BE_MASK 0x0000003cL
de2bdb3dcf9228 Tom St Denis 2016-10-26   245  #define HDP_MEMIO_CNTL__MEMIO_BE__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   246  #define HDP_MEMIO_CNTL__MEMIO_CLR_RD_ERROR_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   247  #define HDP_MEMIO_CNTL__MEMIO_CLR_RD_ERROR__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   248  #define HDP_MEMIO_CNTL__MEMIO_CLR_WR_ERROR_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   249  #define HDP_MEMIO_CNTL__MEMIO_CLR_WR_ERROR__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   250  #define HDP_MEMIO_CNTL__MEMIO_OP_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   251  #define HDP_MEMIO_CNTL__MEMIO_OP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   252  #define HDP_MEMIO_CNTL__MEMIO_RD_STROBE_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   253  #define HDP_MEMIO_CNTL__MEMIO_RD_STROBE__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   254  #define HDP_MEMIO_CNTL__MEMIO_SEND_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   255  #define HDP_MEMIO_CNTL__MEMIO_SEND__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   256  #define HDP_MEMIO_CNTL__MEMIO_WR_STROBE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   257  #define HDP_MEMIO_CNTL__MEMIO_WR_STROBE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   258  #define HDP_MEMIO_RD_DATA__MEMIO_RD_DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   259  #define HDP_MEMIO_RD_DATA__MEMIO_RD_DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   260  #define HDP_MEMIO_STATUS__MEMIO_RD_ERROR_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   261  #define HDP_MEMIO_STATUS__MEMIO_RD_ERROR__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   262  #define HDP_MEMIO_STATUS__MEMIO_RD_STATUS_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   263  #define HDP_MEMIO_STATUS__MEMIO_RD_STATUS__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   264  #define HDP_MEMIO_STATUS__MEMIO_WR_ERROR_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   265  #define HDP_MEMIO_STATUS__MEMIO_WR_ERROR__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   266  #define HDP_MEMIO_STATUS__MEMIO_WR_STATUS_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   267  #define HDP_MEMIO_STATUS__MEMIO_WR_STATUS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   268  #define HDP_MEMIO_WR_DATA__MEMIO_WR_DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   269  #define HDP_MEMIO_WR_DATA__MEMIO_WR_DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   270  #define HDP_MEM_POWER_LS__LS_ENABLE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   271  #define HDP_MEM_POWER_LS__LS_ENABLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   272  #define HDP_MEM_POWER_LS__LS_HOLD_MASK 0x00001f80L
de2bdb3dcf9228 Tom St Denis 2016-10-26   273  #define HDP_MEM_POWER_LS__LS_HOLD__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   274  #define HDP_MEM_POWER_LS__LS_SETUP_MASK 0x0000007eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   275  #define HDP_MEM_POWER_LS__LS_SETUP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   276  #define HDP_MISC_CNTL__ADDRLIB_LINEAR_BYPASS_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   277  #define HDP_MISC_CNTL__ADDRLIB_LINEAR_BYPASS__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   278  #define HDP_MISC_CNTL__FED_ENABLE_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   279  #define HDP_MISC_CNTL__FED_ENABLE__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   280  #define HDP_MISC_CNTL__FLUSH_INVALIDATE_CACHE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   281  #define HDP_MISC_CNTL__FLUSH_INVALIDATE_CACHE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   282  #define HDP_MISC_CNTL__HDP_BIF_RDRET_CREDIT_MASK 0x00000780L
de2bdb3dcf9228 Tom St Denis 2016-10-26   283  #define HDP_MISC_CNTL__HDP_BIF_RDRET_CREDIT__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   284  #define HDP_MISC_CNTL__MC_RDREQ_CREDIT_MASK 0x0007e000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   285  #define HDP_MISC_CNTL__MC_RDREQ_CREDIT__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   286  #define HDP_MISC_CNTL__MULTIPLE_READS_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   287  #define HDP_MISC_CNTL__MULTIPLE_READS__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   288  #define HDP_MISC_CNTL__NO_SPLIT_ARRAY_LINEAR_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   289  #define HDP_MISC_CNTL__NO_SPLIT_ARRAY_LINEAR__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   290  #define HDP_MISC_CNTL__OUTSTANDING_WRITE_COUNT_1024_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   291  #define HDP_MISC_CNTL__OUTSTANDING_WRITE_COUNT_1024__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   292  #define HDP_MISC_CNTL__READ_CACHE_INVALIDATE_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   293  #define HDP_MISC_CNTL__READ_CACHE_INVALIDATE__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   294  #define HDP_MISC_CNTL__SIMULTANEOUS_READS_WRITES_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   295  #define HDP_MISC_CNTL__SIMULTANEOUS_READS_WRITES__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   296  #define HDP_MISC_CNTL__VM_ID_MASK 0x0000001eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   297  #define HDP_MISC_CNTL__VM_ID__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   298  #define HDP_NONSURFACE_BASE__NONSURF_BASE_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   299  #define HDP_NONSURFACE_BASE__NONSURF_BASE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   300  #define HDP_NONSURFACE_INFO__NONSURF_ADDR_TYPE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   301  #define HDP_NONSURFACE_INFO__NONSURF_ADDR_TYPE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   302  #define HDP_NONSURFACE_INFO__NONSURF_ARRAY_MODE_MASK 0x0000001eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   303  #define HDP_NONSURFACE_INFO__NONSURF_ARRAY_MODE__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   304  #define HDP_NONSURFACE_INFO__NONSURF_BANK_HEIGHT_MASK 0x03000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   305  #define HDP_NONSURFACE_INFO__NONSURF_BANK_HEIGHT__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   306  #define HDP_NONSURFACE_INFO__NONSURF_BANK_WIDTH_MASK 0x00c00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   307  #define HDP_NONSURFACE_INFO__NONSURF_BANK_WIDTH__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   308  #define HDP_NONSURFACE_INFO__NONSURF_ENDIAN_MASK 0x00000060L
de2bdb3dcf9228 Tom St Denis 2016-10-26   309  #define HDP_NONSURFACE_INFO__NONSURF_ENDIAN__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   310  #define HDP_NONSURFACE_INFO__NONSURF_MACRO_TILE_ASPECT_MASK 0x0c000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   311  #define HDP_NONSURFACE_INFO__NONSURF_MACRO_TILE_ASPECT__SHIFT 0x0000001a
de2bdb3dcf9228 Tom St Denis 2016-10-26   312  #define HDP_NONSURFACE_INFO__NONSURF_MICRO_TILE_MODE_MASK 0x30000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   313  #define HDP_NONSURFACE_INFO__NONSURF_MICRO_TILE_MODE__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   314  #define HDP_NONSURFACE_INFO__NONSURF_NUM_BANKS_MASK 0x00300000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   315  #define HDP_NONSURFACE_INFO__NONSURF_NUM_BANKS__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   316  #define HDP_NONSURFACE_INFO__NONSURF_PIXEL_SIZE_MASK 0x00000380L
de2bdb3dcf9228 Tom St Denis 2016-10-26   317  #define HDP_NONSURFACE_INFO__NONSURF_PIXEL_SIZE__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   318  #define HDP_NONSURFACE_INFO__NONSURF_PRIV_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   319  #define HDP_NONSURFACE_INFO__NONSURF_PRIV__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   320  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_NUM_MASK 0x00001c00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   321  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_NUM__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   322  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_SIZE_MASK 0x00006000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   323  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_SIZE__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   324  #define HDP_NONSURFACE_INFO__NONSURF_SLICE_TILE_MAX_MSB_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   325  #define HDP_NONSURFACE_INFO__NONSURF_SLICE_TILE_MAX_MSB__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   326  #define HDP_NONSURFACE_INFO__NONSURF_TILE_COMPACT_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   327  #define HDP_NONSURFACE_INFO__NONSURF_TILE_COMPACT__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   328  #define HDP_NONSURFACE_INFO__NONSURF_TILE_SPLIT_MASK 0x000e0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   329  #define HDP_NONSURFACE_INFO__NONSURF_TILE_SPLIT__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   330  #define HDP_NONSURFACE_PREFETCH__NONSURF_PIPE_CONFIG_MASK 0xf8000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   331  #define HDP_NONSURFACE_PREFETCH__NONSURF_PIPE_CONFIG__SHIFT 0x0000001b
de2bdb3dcf9228 Tom St Denis 2016-10-26   332  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_DIR_MASK 0x00000038L
de2bdb3dcf9228 Tom St Denis 2016-10-26   333  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_DIR__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   334  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_MAX_Z_MASK 0x000ffe00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   335  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_MAX_Z__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   336  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_NUM_MASK 0x000001c0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   337  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_NUM__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   338  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_PRI_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   339  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_PRI__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   340  #define HDP_NONSURFACE_SIZE__NONSURF_PITCH_TILE_MAX_MASK 0x000007ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   341  #define HDP_NONSURFACE_SIZE__NONSURF_PITCH_TILE_MAX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   342  #define HDP_NONSURFACE_SIZE__NONSURF_SLICE_TILE_MAX_MASK 0xfffff800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   343  #define HDP_NONSURFACE_SIZE__NONSURF_SLICE_TILE_MAX__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   344  #define HDP_NONSURF_FLAGS_CLR__NONSURF_READ_FLAG_CLR_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   345  #define HDP_NONSURF_FLAGS_CLR__NONSURF_READ_FLAG_CLR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   346  #define HDP_NONSURF_FLAGS_CLR__NONSURF_WRITE_FLAG_CLR_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   347  #define HDP_NONSURF_FLAGS_CLR__NONSURF_WRITE_FLAG_CLR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   348  #define HDP_NONSURF_FLAGS__NONSURF_READ_FLAG_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   349  #define HDP_NONSURF_FLAGS__NONSURF_READ_FLAG__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   350  #define HDP_NONSURF_FLAGS__NONSURF_WRITE_FLAG_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   351  #define HDP_NONSURF_FLAGS__NONSURF_WRITE_FLAG__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   352  #define HDP_OUTSTANDING_REQ__READ_REQ_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   353  #define HDP_OUTSTANDING_REQ__READ_REQ__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   354  #define HDP_OUTSTANDING_REQ__WRITE_REQ_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   355  #define HDP_OUTSTANDING_REQ__WRITE_REQ__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   356  #define HDP_SC_MULTI_CHIP_CNTL__LOG2_NUM_CHIPS_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   357  #define HDP_SC_MULTI_CHIP_CNTL__LOG2_NUM_CHIPS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   358  #define HDP_SC_MULTI_CHIP_CNTL__MULTI_CHIP_TILE_SIZE_MASK 0x00000018L
de2bdb3dcf9228 Tom St Denis 2016-10-26   359  #define HDP_SC_MULTI_CHIP_CNTL__MULTI_CHIP_TILE_SIZE__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   360  #define HDP_SW_SEMAPHORE__SW_SEMAPHORE_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   361  #define HDP_SW_SEMAPHORE__SW_SEMAPHORE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   362  #define HDP_TILING_CONFIG__BANK_SWAPS_MASK 0x00003800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   363  #define HDP_TILING_CONFIG__BANK_SWAPS__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   364  #define HDP_TILING_CONFIG__BANK_TILING_MASK 0x00000030L
de2bdb3dcf9228 Tom St Denis 2016-10-26   365  #define HDP_TILING_CONFIG__BANK_TILING__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   366  #define HDP_TILING_CONFIG__GROUP_SIZE_MASK 0x000000c0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   367  #define HDP_TILING_CONFIG__GROUP_SIZE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   368  #define HDP_TILING_CONFIG__PIPE_TILING_MASK 0x0000000eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   369  #define HDP_TILING_CONFIG__PIPE_TILING__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   370  #define HDP_TILING_CONFIG__ROW_TILING_MASK 0x00000700L
de2bdb3dcf9228 Tom St Denis 2016-10-26   371  #define HDP_TILING_CONFIG__ROW_TILING__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   372  #define HDP_TILING_CONFIG__SAMPLE_SPLIT_MASK 0x0000c000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   373  #define HDP_TILING_CONFIG__SAMPLE_SPLIT__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   374  #define HDP_XDP_BARS_ADDR_39_36__BAR0_ADDR_39_36_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   375  #define HDP_XDP_BARS_ADDR_39_36__BAR0_ADDR_39_36__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   376  #define HDP_XDP_BARS_ADDR_39_36__BAR1_ADDR_39_36_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   377  #define HDP_XDP_BARS_ADDR_39_36__BAR1_ADDR_39_36__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   378  #define HDP_XDP_BARS_ADDR_39_36__BAR2_ADDR_39_36_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   379  #define HDP_XDP_BARS_ADDR_39_36__BAR2_ADDR_39_36__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   380  #define HDP_XDP_BARS_ADDR_39_36__BAR3_ADDR_39_36_MASK 0x0000f000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   381  #define HDP_XDP_BARS_ADDR_39_36__BAR3_ADDR_39_36__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   382  #define HDP_XDP_BARS_ADDR_39_36__BAR4_ADDR_39_36_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   383  #define HDP_XDP_BARS_ADDR_39_36__BAR4_ADDR_39_36__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   384  #define HDP_XDP_BARS_ADDR_39_36__BAR5_ADDR_39_36_MASK 0x00f00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   385  #define HDP_XDP_BARS_ADDR_39_36__BAR5_ADDR_39_36__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   386  #define HDP_XDP_BARS_ADDR_39_36__BAR6_ADDR_39_36_MASK 0x0f000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   387  #define HDP_XDP_BARS_ADDR_39_36__BAR6_ADDR_39_36__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   388  #define HDP_XDP_BARS_ADDR_39_36__BAR7_ADDR_39_36_MASK 0xf0000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   389  #define HDP_XDP_BARS_ADDR_39_36__BAR7_ADDR_39_36__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   390  #define HDP_XDP_BUSY_STS__BUSY_BITS_MASK 0x0003ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   391  #define HDP_XDP_BUSY_STS__BUSY_BITS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   392  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_0_ON_DELAY_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   393  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_0_ON_DELAY__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   394  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_1_OFF_DELAY_MASK 0x00000ff0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   395  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_1_OFF_DELAY__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   396  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_2_RSVD_MASK 0x3ffff000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   397  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_2_RSVD__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   398  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_3_SOFT_CORE_OVERRIDE_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   399  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_3_SOFT_CORE_OVERRIDE__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   400  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_4_SOFT_REG_OVERRIDE_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   401  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_4_SOFT_REG_OVERRIDE__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   402  #define HDP_XDP_CHKN__CHKN_0_RSVD_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   403  #define HDP_XDP_CHKN__CHKN_0_RSVD__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   404  #define HDP_XDP_CHKN__CHKN_1_RSVD_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   405  #define HDP_XDP_CHKN__CHKN_1_RSVD__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   406  #define HDP_XDP_CHKN__CHKN_2_RSVD_MASK 0x00ff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   407  #define HDP_XDP_CHKN__CHKN_2_RSVD__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   408  #define HDP_XDP_CHKN__CHKN_3_RSVD_MASK 0xff000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   409  #define HDP_XDP_CHKN__CHKN_3_RSVD__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   410  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   411  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   412  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_BAR_NUM_MASK 0x00700000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   413  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_BAR_NUM__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   414  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_FLUSH_NUM_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   415  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_FLUSH_NUM__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   416  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_ALTER_FLUSH_NUM_MASK 0x00040000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   417  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_ALTER_FLUSH_NUM__SHIFT 0x00000012
de2bdb3dcf9228 Tom St Denis 2016-10-26   418  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_FLUSH_NUM_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   419  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_FLUSH_NUM__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   420  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ADDR_SEL_MASK 0x00000700L
de2bdb3dcf9228 Tom St Denis 2016-10-26   421  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ADDR_SEL__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   422  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ENC_DATA_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   423  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ENC_DATA__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   424  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_0_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   425  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_0__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   426  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_1_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   427  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_1__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   428  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_HOST_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   429  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_HOST__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   430  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_SIDE_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   431  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_SIDE__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   432  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_XPB_CLG_MASK 0x0000f800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   433  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_XPB_CLG__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   434  #define HDP_XDP_D2H_RSVD_10__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   435  #define HDP_XDP_D2H_RSVD_10__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   436  #define HDP_XDP_D2H_RSVD_11__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   437  #define HDP_XDP_D2H_RSVD_11__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   438  #define HDP_XDP_D2H_RSVD_12__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   439  #define HDP_XDP_D2H_RSVD_12__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   440  #define HDP_XDP_D2H_RSVD_13__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   441  #define HDP_XDP_D2H_RSVD_13__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   442  #define HDP_XDP_D2H_RSVD_14__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   443  #define HDP_XDP_D2H_RSVD_14__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   444  #define HDP_XDP_D2H_RSVD_15__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   445  #define HDP_XDP_D2H_RSVD_15__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   446  #define HDP_XDP_D2H_RSVD_16__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   447  #define HDP_XDP_D2H_RSVD_16__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   448  #define HDP_XDP_D2H_RSVD_17__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   449  #define HDP_XDP_D2H_RSVD_17__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   450  #define HDP_XDP_D2H_RSVD_18__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   451  #define HDP_XDP_D2H_RSVD_18__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   452  #define HDP_XDP_D2H_RSVD_19__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   453  #define HDP_XDP_D2H_RSVD_19__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   454  #define HDP_XDP_D2H_RSVD_20__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   455  #define HDP_XDP_D2H_RSVD_20__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   456  #define HDP_XDP_D2H_RSVD_21__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   457  #define HDP_XDP_D2H_RSVD_21__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   458  #define HDP_XDP_D2H_RSVD_22__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   459  #define HDP_XDP_D2H_RSVD_22__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   460  #define HDP_XDP_D2H_RSVD_23__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   461  #define HDP_XDP_D2H_RSVD_23__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   462  #define HDP_XDP_D2H_RSVD_24__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   463  #define HDP_XDP_D2H_RSVD_24__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   464  #define HDP_XDP_D2H_RSVD_25__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   465  #define HDP_XDP_D2H_RSVD_25__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   466  #define HDP_XDP_D2H_RSVD_26__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   467  #define HDP_XDP_D2H_RSVD_26__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   468  #define HDP_XDP_D2H_RSVD_27__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   469  #define HDP_XDP_D2H_RSVD_27__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   470  #define HDP_XDP_D2H_RSVD_28__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   471  #define HDP_XDP_D2H_RSVD_28__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   472  #define HDP_XDP_D2H_RSVD_29__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   473  #define HDP_XDP_D2H_RSVD_29__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   474  #define HDP_XDP_D2H_RSVD_30__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   475  #define HDP_XDP_D2H_RSVD_30__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   476  #define HDP_XDP_D2H_RSVD_31__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   477  #define HDP_XDP_D2H_RSVD_31__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   478  #define HDP_XDP_D2H_RSVD_32__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   479  #define HDP_XDP_D2H_RSVD_32__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   480  #define HDP_XDP_D2H_RSVD_33__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   481  #define HDP_XDP_D2H_RSVD_33__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   482  #define HDP_XDP_D2H_RSVD_34__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   483  #define HDP_XDP_D2H_RSVD_34__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   484  #define HDP_XDP_D2H_RSVD_3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   485  #define HDP_XDP_D2H_RSVD_3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   486  #define HDP_XDP_D2H_RSVD_4__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   487  #define HDP_XDP_D2H_RSVD_4__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   488  #define HDP_XDP_D2H_RSVD_5__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   489  #define HDP_XDP_D2H_RSVD_5__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   490  #define HDP_XDP_D2H_RSVD_6__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   491  #define HDP_XDP_D2H_RSVD_6__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   492  #define HDP_XDP_D2H_RSVD_7__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   493  #define HDP_XDP_D2H_RSVD_7__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   494  #define HDP_XDP_D2H_RSVD_8__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   495  #define HDP_XDP_D2H_RSVD_8__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   496  #define HDP_XDP_D2H_RSVD_9__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   497  #define HDP_XDP_D2H_RSVD_9__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   498  #define HDP_XDP_DBG_ADDR__CTRL_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   499  #define HDP_XDP_DBG_ADDR__CTRL__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   500  #define HDP_XDP_DBG_ADDR__STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   501  #define HDP_XDP_DBG_ADDR__STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   502  #define HDP_XDP_DBG_DATA__CTRL_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   503  #define HDP_XDP_DBG_DATA__CTRL__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   504  #define HDP_XDP_DBG_DATA__STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   505  #define HDP_XDP_DBG_DATA__STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   506  #define HDP_XDP_DBG_MASK__CTRL_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   507  #define HDP_XDP_DBG_MASK__CTRL__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   508  #define HDP_XDP_DBG_MASK__STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   509  #define HDP_XDP_DBG_MASK__STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   510  #define HDP_XDP_DIRECT2HDP_FIRST__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   511  #define HDP_XDP_DIRECT2HDP_FIRST__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   512  #define HDP_XDP_DIRECT2HDP_LAST__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   513  #define HDP_XDP_DIRECT2HDP_LAST__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   514  #define HDP_XDP_FLUSH_ARMED_STS__FLUSH_ARMED_STS_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   515  #define HDP_XDP_FLUSH_ARMED_STS__FLUSH_ARMED_STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   516  #define HDP_XDP_FLUSH_CNTR0_STS__FLUSH_CNTR0_STS_MASK 0x03ffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   517  #define HDP_XDP_FLUSH_CNTR0_STS__FLUSH_CNTR0_STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   518  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_INVERSE_PEER_TAG_MATCHING_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   519  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_INVERSE_PEER_TAG_MATCHING__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   520  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_P2P_RD_EN_MASK 0x00002000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   521  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_P2P_RD_EN__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   522  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_SYS_FIFO_DEPTH_OVERRIDE_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   523  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_SYS_FIFO_DEPTH_OVERRIDE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   524  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_XDP_FIFO_DEPTH_OVERRIDE_MASK 0x00000fc0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   525  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_XDP_FIFO_DEPTH_OVERRIDE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   526  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_PRIV_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   527  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_PRIV__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   528  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SWAP_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   529  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SWAP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   530  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_TRAN_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   531  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_TRAN__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   532  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_VMID_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   533  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_VMID__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   534  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_PRIV_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   535  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_PRIV__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   536  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_SWAP_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   537  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_SWAP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   538  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_TRAN_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   539  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_TRAN__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   540  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_VMID_MASK 0x07800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   541  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_VMID__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   542  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_MC_STALL_ON_BUF_FULL_MASK_MASK 0x00700000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   543  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_MC_STALL_ON_BUF_FULL_MASK__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   544  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_PRIV_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   545  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_PRIV__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   546  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_SWAP_MASK 0x00000060L
de2bdb3dcf9228 Tom St Denis 2016-10-26   547  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_SWAP__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   548  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_TRAN_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   549  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_TRAN__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   550  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_VMID_MASK 0x78000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   551  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_VMID__SHIFT 0x0000001b
de2bdb3dcf9228 Tom St Denis 2016-10-26   552  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XDP_HIGHER_PRI_THRESH_MASK 0x000fc000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   553  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XDP_HIGHER_PRI_THRESH__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   554  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XL8R_WRREQ_CRD_OVERRIDE_MASK 0x00003f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   555  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XL8R_WRREQ_CRD_OVERRIDE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   556  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_EN_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   557  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_EN__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   558  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   559  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   560  #define HDP_XDP_P2P_BAR0__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   561  #define HDP_XDP_P2P_BAR0__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   562  #define HDP_XDP_P2P_BAR0__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   563  #define HDP_XDP_P2P_BAR0__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   564  #define HDP_XDP_P2P_BAR0__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   565  #define HDP_XDP_P2P_BAR0__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   566  #define HDP_XDP_P2P_BAR1__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   567  #define HDP_XDP_P2P_BAR1__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   568  #define HDP_XDP_P2P_BAR1__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   569  #define HDP_XDP_P2P_BAR1__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   570  #define HDP_XDP_P2P_BAR1__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   571  #define HDP_XDP_P2P_BAR1__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   572  #define HDP_XDP_P2P_BAR2__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   573  #define HDP_XDP_P2P_BAR2__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   574  #define HDP_XDP_P2P_BAR2__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   575  #define HDP_XDP_P2P_BAR2__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   576  #define HDP_XDP_P2P_BAR2__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   577  #define HDP_XDP_P2P_BAR2__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   578  #define HDP_XDP_P2P_BAR3__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   579  #define HDP_XDP_P2P_BAR3__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   580  #define HDP_XDP_P2P_BAR3__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   581  #define HDP_XDP_P2P_BAR3__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   582  #define HDP_XDP_P2P_BAR3__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   583  #define HDP_XDP_P2P_BAR3__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   584  #define HDP_XDP_P2P_BAR4__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   585  #define HDP_XDP_P2P_BAR4__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   586  #define HDP_XDP_P2P_BAR4__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   587  #define HDP_XDP_P2P_BAR4__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   588  #define HDP_XDP_P2P_BAR4__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   589  #define HDP_XDP_P2P_BAR4__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   590  #define HDP_XDP_P2P_BAR5__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   591  #define HDP_XDP_P2P_BAR5__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   592  #define HDP_XDP_P2P_BAR5__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   593  #define HDP_XDP_P2P_BAR5__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   594  #define HDP_XDP_P2P_BAR5__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   595  #define HDP_XDP_P2P_BAR5__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   596  #define HDP_XDP_P2P_BAR6__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   597  #define HDP_XDP_P2P_BAR6__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   598  #define HDP_XDP_P2P_BAR6__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   599  #define HDP_XDP_P2P_BAR6__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   600  #define HDP_XDP_P2P_BAR6__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   601  #define HDP_XDP_P2P_BAR6__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   602  #define HDP_XDP_P2P_BAR7__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   603  #define HDP_XDP_P2P_BAR7__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   604  #define HDP_XDP_P2P_BAR7__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   605  #define HDP_XDP_P2P_BAR7__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   606  #define HDP_XDP_P2P_BAR7__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   607  #define HDP_XDP_P2P_BAR7__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   608  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_ADDR_SIZE_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   609  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_ADDR_SIZE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   610  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_BAR_FROM_MASK 0x00000030L
de2bdb3dcf9228 Tom St Denis 2016-10-26   611  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_BAR_FROM__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   612  #define HDP_XDP_P2P_MBX_ADDR0__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   613  #define HDP_XDP_P2P_MBX_ADDR0__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   614  #define HDP_XDP_P2P_MBX_ADDR0__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   615  #define HDP_XDP_P2P_MBX_ADDR0__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   616  #define HDP_XDP_P2P_MBX_ADDR0__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   617  #define HDP_XDP_P2P_MBX_ADDR0__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   618  #define HDP_XDP_P2P_MBX_ADDR1__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   619  #define HDP_XDP_P2P_MBX_ADDR1__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   620  #define HDP_XDP_P2P_MBX_ADDR1__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   621  #define HDP_XDP_P2P_MBX_ADDR1__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   622  #define HDP_XDP_P2P_MBX_ADDR1__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   623  #define HDP_XDP_P2P_MBX_ADDR1__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   624  #define HDP_XDP_P2P_MBX_ADDR2__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   625  #define HDP_XDP_P2P_MBX_ADDR2__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   626  #define HDP_XDP_P2P_MBX_ADDR2__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   627  #define HDP_XDP_P2P_MBX_ADDR2__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   628  #define HDP_XDP_P2P_MBX_ADDR2__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   629  #define HDP_XDP_P2P_MBX_ADDR2__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   630  #define HDP_XDP_P2P_MBX_ADDR3__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   631  #define HDP_XDP_P2P_MBX_ADDR3__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   632  #define HDP_XDP_P2P_MBX_ADDR3__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   633  #define HDP_XDP_P2P_MBX_ADDR3__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   634  #define HDP_XDP_P2P_MBX_ADDR3__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   635  #define HDP_XDP_P2P_MBX_ADDR3__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   636  #define HDP_XDP_P2P_MBX_ADDR4__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   637  #define HDP_XDP_P2P_MBX_ADDR4__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   638  #define HDP_XDP_P2P_MBX_ADDR4__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   639  #define HDP_XDP_P2P_MBX_ADDR4__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   640  #define HDP_XDP_P2P_MBX_ADDR4__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   641  #define HDP_XDP_P2P_MBX_ADDR4__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   642  #define HDP_XDP_P2P_MBX_ADDR5__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   643  #define HDP_XDP_P2P_MBX_ADDR5__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   644  #define HDP_XDP_P2P_MBX_ADDR5__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   645  #define HDP_XDP_P2P_MBX_ADDR5__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   646  #define HDP_XDP_P2P_MBX_ADDR5__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   647  #define HDP_XDP_P2P_MBX_ADDR5__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   648  #define HDP_XDP_P2P_MBX_ADDR6__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   649  #define HDP_XDP_P2P_MBX_ADDR6__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   650  #define HDP_XDP_P2P_MBX_ADDR6__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   651  #define HDP_XDP_P2P_MBX_ADDR6__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   652  #define HDP_XDP_P2P_MBX_ADDR6__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   653  #define HDP_XDP_P2P_MBX_ADDR6__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   654  #define HDP_XDP_P2P_MBX_OFFSET__P2P_MBX_OFFSET_MASK 0x00003fffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   655  #define HDP_XDP_P2P_MBX_OFFSET__P2P_MBX_OFFSET__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   656  #define HDP_XDP_SID_CFG__SID_CFG_FLNUM_MSB_SEL_MASK 0x00000018L
de2bdb3dcf9228 Tom St Denis 2016-10-26   657  #define HDP_XDP_SID_CFG__SID_CFG_FLNUM_MSB_SEL__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   658  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_EN_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   659  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_EN__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   660  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_TIMER_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   661  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_TIMER__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   662  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_ENABLE_COUNT_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   663  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_ENABLE_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   664  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_GATING_DIS_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   665  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_GATING_DIS__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   666  #define HDP_XDP_SRBM_CFG__SRBM_CFG_WAKE_DYN_CLK_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   667  #define HDP_XDP_SRBM_CFG__SRBM_CFG_WAKE_DYN_CLK__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   668  #define HDP_XDP_STICKY__STICKY_STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   669  #define HDP_XDP_STICKY__STICKY_STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   670  #define HDP_XDP_STICKY__STICKY_W1C_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   671  #define HDP_XDP_STICKY__STICKY_W1C__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   672  #define HFS_SEED0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   673  #define HFS_SEED0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   674  #define HFS_SEED1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   675  #define HFS_SEED1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   676  #define HFS_SEED2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   677  #define HFS_SEED2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   678  #define HFS_SEED3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   679  #define HFS_SEED3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   680  #define IH_ADVFAULT_CNTL__NUM_FAULTS_DROPPED_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   681  #define IH_ADVFAULT_CNTL__NUM_FAULTS_DROPPED__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   682  #define IH_ADVFAULT_CNTL__WAIT_TIMER_MASK 0x3fff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   683  #define IH_ADVFAULT_CNTL__WAIT_TIMER__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   684  #define IH_ADVFAULT_CNTL__WATERMARK_ENABLE_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   685  #define IH_ADVFAULT_CNTL__WATERMARK_ENABLE__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   686  #define IH_ADVFAULT_CNTL__WATERMARK_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   687  #define IH_ADVFAULT_CNTL__WATERMARK_REACHED_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   688  #define IH_ADVFAULT_CNTL__WATERMARK_REACHED__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   689  #define IH_ADVFAULT_CNTL__WATERMARK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   690  #define IH_CNTL__CLIENT_FIFO_HIGHWATER_MASK 0x00000300L
de2bdb3dcf9228 Tom St Denis 2016-10-26   691  #define IH_CNTL__CLIENT_FIFO_HIGHWATER__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   692  #define IH_CNTL__ENABLE_INTR_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   693  #define IH_CNTL__ENABLE_INTR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   694  #define IH_CNTL__MC_FIFO_HIGHWATER_MASK 0x00007c00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   695  #define IH_CNTL__MC_FIFO_HIGHWATER__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   696  #define IH_CNTL__MC_SWAP_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   697  #define IH_CNTL__MC_SWAP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   698  #define IH_CNTL__MC_TRAN_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   699  #define IH_CNTL__MC_TRAN__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   700  #define IH_CNTL__MC_VMID_MASK 0x1e000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   701  #define IH_CNTL__MC_VMID__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26   702  #define IH_CNTL__MC_WR_CLEAN_CNT_MASK 0x01f00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   703  #define IH_CNTL__MC_WR_CLEAN_CNT__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   704  #define IH_CNTL__MC_WRREQ_CREDIT_MASK 0x000f8000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   705  #define IH_CNTL__MC_WRREQ_CREDIT__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   706  #define IH_CNTL__RPTR_REARM_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   707  #define IH_CNTL__RPTR_REARM__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   708  #define IH_LEVEL_STATUS__BIF_STATUS_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   709  #define IH_LEVEL_STATUS__BIF_STATUS__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   710  #define IH_LEVEL_STATUS__DC_STATUS_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   711  #define IH_LEVEL_STATUS__DC_STATUS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   712  #define IH_LEVEL_STATUS__ROM_STATUS_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   713  #define IH_LEVEL_STATUS__ROM_STATUS__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   714  #define IH_LEVEL_STATUS__SRBM_STATUS_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   715  #define IH_LEVEL_STATUS__SRBM_STATUS__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   716  #define IH_LEVEL_STATUS__XDMA_STATUS_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   717  #define IH_LEVEL_STATUS__XDMA_STATUS__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   718  #define IH_PERFCOUNTER0_RESULT__PERF_COUNT_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   719  #define IH_PERFCOUNTER0_RESULT__PERF_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   720  #define IH_PERFCOUNTER1_RESULT__PERF_COUNT_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   721  #define IH_PERFCOUNTER1_RESULT__PERF_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   722  #define IH_PERFMON_CNTL__CLEAR0_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   723  #define IH_PERFMON_CNTL__CLEAR0__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   724  #define IH_PERFMON_CNTL__CLEAR1_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   725  #define IH_PERFMON_CNTL__CLEAR1__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   726  #define IH_PERFMON_CNTL__ENABLE0_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   727  #define IH_PERFMON_CNTL__ENABLE0__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   728  #define IH_PERFMON_CNTL__ENABLE1_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   729  #define IH_PERFMON_CNTL__ENABLE1__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   730  #define IH_PERFMON_CNTL__PERF_SEL0_MASK 0x000000fcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   731  #define IH_PERFMON_CNTL__PERF_SEL0__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   732  #define IH_PERFMON_CNTL__PERF_SEL1_MASK 0x0000fc00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   733  #define IH_PERFMON_CNTL__PERF_SEL1__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   734  #define IH_RB_BASE__ADDR_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   735  #define IH_RB_BASE__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   736  #define IH_RB_CNTL__RB_ENABLE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   737  #define IH_RB_CNTL__RB_ENABLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   738  #define IH_RB_CNTL__RB_FULL_DRAIN_ENABLE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   739  #define IH_RB_CNTL__RB_FULL_DRAIN_ENABLE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   740  #define IH_RB_CNTL__RB_GPU_TS_ENABLE_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   741  #define IH_RB_CNTL__RB_GPU_TS_ENABLE__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   742  #define IH_RB_CNTL__RB_SIZE_MASK 0x0000003eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   743  #define IH_RB_CNTL__RB_SIZE__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   744  #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   745  #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   746  #define IH_RB_CNTL__WPTR_OVERFLOW_ENABLE_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   747  #define IH_RB_CNTL__WPTR_OVERFLOW_ENABLE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   748  #define IH_RB_CNTL__WPTR_WRITEBACK_ENABLE_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   749  #define IH_RB_CNTL__WPTR_WRITEBACK_ENABLE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   750  #define IH_RB_CNTL__WPTR_WRITEBACK_TIMER_MASK 0x00003e00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   751  #define IH_RB_CNTL__WPTR_WRITEBACK_TIMER__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   752  #define IH_RB_RPTR__OFFSET_MASK 0x0003fffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   753  #define IH_RB_RPTR__OFFSET__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   754  #define IH_RB_WPTR_ADDR_HI__ADDR_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   755  #define IH_RB_WPTR_ADDR_HI__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   756  #define IH_RB_WPTR_ADDR_LO__ADDR_MASK 0xfffffffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   757  #define IH_RB_WPTR_ADDR_LO__ADDR__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   758  #define IH_RB_WPTR__OFFSET_MASK 0x0003fffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   759  #define IH_RB_WPTR__OFFSET__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   760  #define IH_RB_WPTR__RB_OVERFLOW_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   761  #define IH_RB_WPTR__RB_OVERFLOW__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   762  #define IH_STATUS__BIF_INTERRUPT_LINE_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   763  #define IH_STATUS__BIF_INTERRUPT_LINE__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   764  #define IH_STATUS__IDLE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   765  #define IH_STATUS__IDLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   766  #define IH_STATUS__INPUT_IDLE_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   767  #define IH_STATUS__INPUT_IDLE__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   768  #define IH_STATUS__MC_WR_CLEAN_PENDING_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   769  #define IH_STATUS__MC_WR_CLEAN_PENDING__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   770  #define IH_STATUS__MC_WR_CLEAN_STALL_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   771  #define IH_STATUS__MC_WR_CLEAN_STALL__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   772  #define IH_STATUS__MC_WR_IDLE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   773  #define IH_STATUS__MC_WR_IDLE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   774  #define IH_STATUS__MC_WR_STALL_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   775  #define IH_STATUS__MC_WR_STALL__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   776  #define IH_STATUS__RB_FULL_DRAIN_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   777  #define IH_STATUS__RB_FULL_DRAIN__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   778  #define IH_STATUS__RB_FULL_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   779  #define IH_STATUS__RB_FULL__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   780  #define IH_STATUS__RB_IDLE_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   781  #define IH_STATUS__RB_IDLE__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   782  #define IH_STATUS__RB_OVERFLOW_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   783  #define IH_STATUS__RB_OVERFLOW__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   784  #define KEFUSE0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   785  #define KEFUSE0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   786  #define KEFUSE1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   787  #define KEFUSE1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   788  #define KEFUSE2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   789  #define KEFUSE2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   790  #define KEFUSE3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   791  #define KEFUSE3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   792  #define KHFS0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   793  #define KHFS0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   794  #define KHFS1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   795  #define KHFS1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   796  #define KHFS2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   797  #define KHFS2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   798  #define KHFS3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   799  #define KHFS3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   800  #define KSESSION0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   801  #define KSESSION0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   802  #define KSESSION1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   803  #define KSESSION1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   804  #define KSESSION2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   805  #define KSESSION2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   806  #define KSESSION3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   807  #define KSESSION3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   808  #define KSIG0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   809  #define KSIG0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   810  #define KSIG1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   811  #define KSIG1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   812  #define KSIG2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   813  #define KSIG2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   814  #define KSIG3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   815  #define KSIG3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   816  #define LX0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   817  #define LX0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   818  #define LX1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   819  #define LX1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   820  #define LX2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   821  #define LX2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   822  #define LX3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   823  #define LX3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   824  #define RINGOSC_MASK__MASK_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   825  #define RINGOSC_MASK__MASK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   826  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT0_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   827  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT0__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   828  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT1_MASK 0x00000038L
de2bdb3dcf9228 Tom St Denis 2016-10-26   829  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT1__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   830  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT2_MASK 0x000001c0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   831  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT2__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   832  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT3_MASK 0x00000e00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   833  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT3__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   834  #define SEM_MAILBOX_CLIENTCONFIG__UVD_CLIENT0_MASK 0x00038000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   835  #define SEM_MAILBOX_CLIENTCONFIG__UVD_CLIENT0__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   836  #define SEM_MAILBOX_CLIENTCONFIG__VCE_CLIENT0_MASK 0x00e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   837  #define SEM_MAILBOX_CLIENTCONFIG__VCE_CLIENT0__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   838  #define SEM_MAILBOX_CONTROL__HOSTPORT_ENABLE_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   839  #define SEM_MAILBOX_CONTROL__HOSTPORT_ENABLE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   840  #define SEM_MAILBOX_CONTROL__SIDEPORT_ENABLE_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   841  #define SEM_MAILBOX_CONTROL__SIDEPORT_ENABLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   842  #define SEM_MAILBOX__HOSTPORT_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   843  #define SEM_MAILBOX__HOSTPORT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   844  #define SEM_MAILBOX__SIDEPORT_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   845  #define SEM_MAILBOX__SIDEPORT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   846  #define SEM_MCIF_CONFIG__MC_REQ_SWAP_MASK 0x00000003L
de2bdb3dcf9228 Tom St Denis 2016-10-26   847  #define SEM_MCIF_CONFIG__MC_REQ_SWAP__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   848  #define SPU_PORT_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   849  #define SPU_PORT_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   850  #define SRBM_CAM_DATA__CAM_ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   851  #define SRBM_CAM_DATA__CAM_ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   852  #define SRBM_CAM_DATA__CAM_REMAPADDR_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   853  #define SRBM_CAM_DATA__CAM_REMAPADDR__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   854  #define SRBM_CAM_INDEX__CAM_INDEX_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   855  #define SRBM_CAM_INDEX__CAM_INDEX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   856  #define SRBM_CHIP_REVISION__CHIP_REVISION_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   857  #define SRBM_CHIP_REVISION__CHIP_REVISION__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   858  #define SRBM_CNTL__COMBINE_SYSTEM_MC_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   859  #define SRBM_CNTL__COMBINE_SYSTEM_MC__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   860  #define SRBM_CNTL__PWR_REQUEST_HALT_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   861  #define SRBM_CNTL__PWR_REQUEST_HALT__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   862  #define SRBM_CNTL__READ_TIMEOUT_MASK 0x000003ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   863  #define SRBM_CNTL__READ_TIMEOUT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   864  #define SRBM_DEBUG_CNTL__SRBM_DEBUG_INDEX_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   865  #define SRBM_DEBUG_CNTL__SRBM_DEBUG_INDEX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   866  #define SRBM_DEBUG_DATA__DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   867  #define SRBM_DEBUG_DATA__DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   868  #define SRBM_DEBUG__DISABLE_READ_TIMEOUT_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   869  #define SRBM_DEBUG__DISABLE_READ_TIMEOUT__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   870  #define SRBM_DEBUG__IGNORE_RDY_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   871  #define SRBM_DEBUG__IGNORE_RDY__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   872  #define SRBM_DEBUG__MC_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   873  #define SRBM_DEBUG__MC_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   874  #define SRBM_DEBUG_SNAPSHOT__BIF_RDY_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   875  #define SRBM_DEBUG_SNAPSHOT__BIF_RDY__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   876  #define SRBM_DEBUG_SNAPSHOT__DC_RDY_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   877  #define SRBM_DEBUG_SNAPSHOT__DC_RDY__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   878  #define SRBM_DEBUG__SNAPSHOT_FREE_CNTRS_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   879  #define SRBM_DEBUG__SNAPSHOT_FREE_CNTRS__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   880  #define SRBM_DEBUG_SNAPSHOT__GRBM_RDY_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   881  #define SRBM_DEBUG_SNAPSHOT__GRBM_RDY__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   882  #define SRBM_DEBUG_SNAPSHOT__MCB_RDY_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   883  #define SRBM_DEBUG_SNAPSHOT__MCB_RDY__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   884  #define SRBM_DEBUG_SNAPSHOT__MCC0_RDY_MASK 0x10000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   885  #define SRBM_DEBUG_SNAPSHOT__MCC0_RDY__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   886  #define SRBM_DEBUG_SNAPSHOT__MCC1_RDY_MASK 0x08000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   887  #define SRBM_DEBUG_SNAPSHOT__MCC1_RDY__SHIFT 0x0000001b
de2bdb3dcf9228 Tom St Denis 2016-10-26   888  #define SRBM_DEBUG_SNAPSHOT__MCC2_RDY_MASK 0x04000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   889  #define SRBM_DEBUG_SNAPSHOT__MCC2_RDY__SHIFT 0x0000001a
de2bdb3dcf9228 Tom St Denis 2016-10-26   890  #define SRBM_DEBUG_SNAPSHOT__MCC3_RDY_MASK 0x02000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   891  #define SRBM_DEBUG_SNAPSHOT__MCC3_RDY__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26   892  #define SRBM_DEBUG_SNAPSHOT__MCC4_RDY_MASK 0x01000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   893  #define SRBM_DEBUG_SNAPSHOT__MCC4_RDY__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   894  #define SRBM_DEBUG_SNAPSHOT__MCC5_RDY_MASK 0x00800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   895  #define SRBM_DEBUG_SNAPSHOT__MCC5_RDY__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   896  #define SRBM_DEBUG_SNAPSHOT__MCC6_RDY_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   897  #define SRBM_DEBUG_SNAPSHOT__MCC6_RDY__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   898  #define SRBM_DEBUG_SNAPSHOT__MCC7_RDY_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   899  #define SRBM_DEBUG_SNAPSHOT__MCC7_RDY__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   900  #define SRBM_DEBUG_SNAPSHOT__MCD0_RDY_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   901  #define SRBM_DEBUG_SNAPSHOT__MCD0_RDY__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   902  #define SRBM_DEBUG_SNAPSHOT__MCD1_RDY_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   903  #define SRBM_DEBUG_SNAPSHOT__MCD1_RDY__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   904  #define SRBM_DEBUG_SNAPSHOT__MCD2_RDY_MASK 0x00040000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   905  #define SRBM_DEBUG_SNAPSHOT__MCD2_RDY__SHIFT 0x00000012
de2bdb3dcf9228 Tom St Denis 2016-10-26   906  #define SRBM_DEBUG_SNAPSHOT__MCD3_RDY_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   907  #define SRBM_DEBUG_SNAPSHOT__MCD3_RDY__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   908  #define SRBM_DEBUG_SNAPSHOT__MCD4_RDY_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   909  #define SRBM_DEBUG_SNAPSHOT__MCD4_RDY__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   910  #define SRBM_DEBUG_SNAPSHOT__MCD5_RDY_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   911  #define SRBM_DEBUG_SNAPSHOT__MCD5_RDY__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   912  #define SRBM_DEBUG_SNAPSHOT__MCD6_RDY_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   913  #define SRBM_DEBUG_SNAPSHOT__MCD6_RDY__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   914  #define SRBM_DEBUG_SNAPSHOT__MCD7_RDY_MASK 0x00002000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   915  #define SRBM_DEBUG_SNAPSHOT__MCD7_RDY__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   916  #define SRBM_DEBUG_SNAPSHOT__ORB_RDY_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   917  #define SRBM_DEBUG_SNAPSHOT__ORB_RDY__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   918  #define SRBM_DEBUG_SNAPSHOT__REGBB_RDY_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   919  #define SRBM_DEBUG_SNAPSHOT__REGBB_RDY__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   920  #define SRBM_DEBUG_SNAPSHOT__UVD_RDY_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   921  #define SRBM_DEBUG_SNAPSHOT__UVD_RDY__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   922  #define SRBM_DEBUG_SNAPSHOT__VCE_RDY_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   923  #define SRBM_DEBUG_SNAPSHOT__VCE_RDY__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26   924  #define SRBM_DEBUG_SNAPSHOT__XDMA_RDY_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   925  #define SRBM_DEBUG_SNAPSHOT__XDMA_RDY__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   926  #define SRBM_DEBUG_SNAPSHOT__XSP_RDY_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   927  #define SRBM_DEBUG_SNAPSHOT__XSP_RDY__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   928  #define SRBM_DEBUG__SYS_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   929  #define SRBM_DEBUG__SYS_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   930  #define SRBM_DEBUG__UVD_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   931  #define SRBM_DEBUG__UVD_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   932  #define SRBM_DEBUG__VCE_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   933  #define SRBM_DEBUG__VCE_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   934  #define SRBM_GFX_CNTL__VMID_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   935  #define SRBM_GFX_CNTL__VMID__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   936  #define SRBM_INT_ACK__RDERR_INT_ACK_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   937  #define SRBM_INT_ACK__RDERR_INT_ACK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   938  #define SRBM_INT_CNTL__RDERR_INT_MASK_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   939  #define SRBM_INT_CNTL__RDERR_INT_MASK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   940  #define SRBM_INT_STATUS__RDERR_INT_STAT_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   941  #define SRBM_INT_STATUS__RDERR_INT_STAT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   942  #define SRBM_MC_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   943  #define SRBM_MC_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   944  #define SRBM_MC_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   945  #define SRBM_MC_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   946  #define SRBM_PERFCOUNTER0_HI__PERF_COUNT0_HI_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   947  #define SRBM_PERFCOUNTER0_HI__PERF_COUNT0_HI__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   948  #define SRBM_PERFCOUNTER0_LO__PERF_COUNT0_LO_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   949  #define SRBM_PERFCOUNTER0_LO__PERF_COUNT0_LO__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   950  #define SRBM_PERFCOUNTER0_SELECT__PERF_SEL_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   951  #define SRBM_PERFCOUNTER0_SELECT__PERF_SEL__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   952  #define SRBM_PERFCOUNTER1_HI__PERF_COUNT1_HI_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   953  #define SRBM_PERFCOUNTER1_HI__PERF_COUNT1_HI__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   954  #define SRBM_PERFCOUNTER1_LO__PERF_COUNT1_LO_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   955  #define SRBM_PERFCOUNTER1_LO__PERF_COUNT1_LO__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   956  #define SRBM_PERFCOUNTER1_SELECT__PERF_SEL_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   957  #define SRBM_PERFCOUNTER1_SELECT__PERF_SEL__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   958  #define SRBM_PERFMON_CNTL__PERFMON_ENABLE_MODE_MASK 0x00000300L
de2bdb3dcf9228 Tom St Denis 2016-10-26   959  #define SRBM_PERFMON_CNTL__PERFMON_ENABLE_MODE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   960  #define SRBM_PERFMON_CNTL__PERFMON_SAMPLE_ENABLE_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   961  #define SRBM_PERFMON_CNTL__PERFMON_SAMPLE_ENABLE__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   962  #define SRBM_PERFMON_CNTL__PERFMON_STATE_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   963  #define SRBM_PERFMON_CNTL__PERFMON_STATE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   964  #define SRBM_READ_ERROR__READ_ADDRESS_MASK 0x0003fffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   965  #define SRBM_READ_ERROR__READ_ADDRESS__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   966  #define SRBM_READ_ERROR__READ_ERROR_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   967  #define SRBM_READ_ERROR__READ_ERROR__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   968  #define SRBM_READ_ERROR__READ_REQUESTER_GRBM_MASK 0x02000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   969  #define SRBM_READ_ERROR__READ_REQUESTER_GRBM__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26   970  #define SRBM_READ_ERROR__READ_REQUESTER_HI_MASK 0x01000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   971  #define SRBM_READ_ERROR__READ_REQUESTER_HI__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   972  #define SRBM_READ_ERROR__READ_REQUESTER_SMU_MASK 0x04000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   973  #define SRBM_READ_ERROR__READ_REQUESTER_SMU__SHIFT 0x0000001a
de2bdb3dcf9228 Tom St Denis 2016-10-26   974  #define SRBM_READ_ERROR__READ_REQUESTER_TST_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   975  #define SRBM_READ_ERROR__READ_REQUESTER_TST__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   976  #define SRBM_READ_ERROR__READ_REQUESTER_UVD_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   977  #define SRBM_READ_ERROR__READ_REQUESTER_UVD__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26   978  #define SRBM_READ_ERROR__READ_REQUESTER_VCE_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   979  #define SRBM_READ_ERROR__READ_REQUESTER_VCE__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   980  #define SRBM_SOFT_RESET__SOFT_RESET_BIF_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   981  #define SRBM_SOFT_RESET__SOFT_RESET_BIF__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   982  #define SRBM_SOFT_RESET__SOFT_RESET_DC_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   983  #define SRBM_SOFT_RESET__SOFT_RESET_DC__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   984  #define SRBM_SOFT_RESET__SOFT_RESET_GRBM_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   985  #define SRBM_SOFT_RESET__SOFT_RESET_GRBM__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   986  #define SRBM_SOFT_RESET__SOFT_RESET_HDP_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   987  #define SRBM_SOFT_RESET__SOFT_RESET_HDP__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   988  #define SRBM_SOFT_RESET__SOFT_RESET_IH_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   989  #define SRBM_SOFT_RESET__SOFT_RESET_IH__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   990  #define SRBM_SOFT_RESET__SOFT_RESET_MC_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   991  #define SRBM_SOFT_RESET__SOFT_RESET_MC__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   992  #define SRBM_SOFT_RESET__SOFT_RESET_ORB_MASK 0x00800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   993  #define SRBM_SOFT_RESET__SOFT_RESET_ORB__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   994  #define SRBM_SOFT_RESET__SOFT_RESET_REGBB_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   995  #define SRBM_SOFT_RESET__SOFT_RESET_REGBB__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   996  #define SRBM_SOFT_RESET__SOFT_RESET_ROM_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   997  #define SRBM_SOFT_RESET__SOFT_RESET_ROM__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   998  #define SRBM_SOFT_RESET__SOFT_RESET_SEM_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   999  #define SRBM_SOFT_RESET__SOFT_RESET_SEM__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26  1000  #define SRBM_SOFT_RESET__SOFT_RESET_TST_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1001  #define SRBM_SOFT_RESET__SOFT_RESET_TST__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26  1002  #define SRBM_SOFT_RESET__SOFT_RESET_UVD_MASK 0x00040000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1003  #define SRBM_SOFT_RESET__SOFT_RESET_UVD__SHIFT 0x00000012
de2bdb3dcf9228 Tom St Denis 2016-10-26  1004  #define SRBM_SOFT_RESET__SOFT_RESET_VCE_MASK 0x01000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1005  #define SRBM_SOFT_RESET__SOFT_RESET_VCE__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26  1006  #define SRBM_SOFT_RESET__SOFT_RESET_VMC_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1007  #define SRBM_SOFT_RESET__SOFT_RESET_VMC__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26  1008  #define SRBM_SOFT_RESET__SOFT_RESET_XDMA_MASK 0x02000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1009  #define SRBM_SOFT_RESET__SOFT_RESET_XDMA__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26  1010  #define SRBM_SOFT_RESET__SOFT_RESET_XSP_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1011  #define SRBM_SOFT_RESET__SOFT_RESET_XSP__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26  1012  #define SRBM_STATUS2__TST_RQ_PENDING_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1013  #define SRBM_STATUS2__TST_RQ_PENDING__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26  1014  #define SRBM_STATUS2__VCE_BUSY_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1015  #define SRBM_STATUS2__VCE_BUSY__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26  1016  #define SRBM_STATUS2__VCE_RQ_PENDING_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1017  #define SRBM_STATUS2__VCE_RQ_PENDING__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26  1018  #define SRBM_STATUS2__XDMA_BUSY_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1019  #define SRBM_STATUS2__XDMA_BUSY__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1020  #define SRBM_STATUS2__XSP_BUSY_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1021  #define SRBM_STATUS2__XSP_BUSY__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26  1022  #define SRBM_STATUS__BIF_BUSY_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1023  #define SRBM_STATUS__BIF_BUSY__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26  1024  #define SRBM_STATUS__GRBM_RQ_PENDING_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1025  #define SRBM_STATUS__GRBM_RQ_PENDING__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26  1026  #define SRBM_STATUS__HI_RQ_PENDING_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1027  #define SRBM_STATUS__HI_RQ_PENDING__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26  1028  #define SRBM_STATUS__IH_BUSY_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1029  #define SRBM_STATUS__IH_BUSY__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26  1030  #define SRBM_STATUS__IO_EXTERN_SIGNAL_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1031  #define SRBM_STATUS__IO_EXTERN_SIGNAL__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26  1032  #define SRBM_STATUS__MCB_BUSY_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1033  #define SRBM_STATUS__MCB_BUSY__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26  1034  #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1035  #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26  1036  #define SRBM_STATUS__MCC_BUSY_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1037  #define SRBM_STATUS__MCC_BUSY__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26  1038  #define SRBM_STATUS__MCD_BUSY_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1039  #define SRBM_STATUS__MCD_BUSY__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26  1040  #define SRBM_STATUS__SEM_BUSY_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1041  #define SRBM_STATUS__SEM_BUSY__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26  1042  #define SRBM_STATUS__SMU_RQ_PENDING_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1043  #define SRBM_STATUS__SMU_RQ_PENDING__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26  1044  #define SRBM_STATUS__UVD_BUSY_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1045  #define SRBM_STATUS__UVD_BUSY__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26  1046  #define SRBM_STATUS__UVD_RQ_PENDING_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1047  #define SRBM_STATUS__UVD_RQ_PENDING__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26  1048  #define SRBM_STATUS__VMC_BUSY_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1049  #define SRBM_STATUS__VMC_BUSY__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1050  #define SRBM_SYS_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1051  #define SRBM_SYS_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1052  #define SRBM_SYS_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1053  #define SRBM_SYS_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1054  #define SRBM_UVD_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1055  #define SRBM_UVD_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1056  #define SRBM_UVD_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1057  #define SRBM_UVD_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1058  #define SRBM_VCE_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1059  #define SRBM_VCE_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1060  #define SRBM_VCE_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1061  #define SRBM_VCE_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1062  #define UVD_CONFIG__UVD_RDREQ_URG_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1063  #define UVD_CONFIG__UVD_RDREQ_URG__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1064  #define UVD_CONFIG__UVD_REQ_TRAN_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1065  #define UVD_CONFIG__UVD_REQ_TRAN__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26  1066  #define VCE_CONFIG__VCE_RDREQ_URG_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1067  #define VCE_CONFIG__VCE_RDREQ_URG__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1068  #define VCE_CONFIG__VCE_REQ_TRAN_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1069  #define VCE_CONFIG__VCE_REQ_TRAN__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26  1070  #define XDMA_MSTR_CNTL__XDMA_MSTR_LAT_TEST_EN_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1071  #define XDMA_MSTR_CNTL__XDMA_MSTR_LAT_TEST_EN__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26  1072  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT_ENABLE_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1073  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT_ENABLE__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26  1074  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1075  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1076  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_THRESHOLD_MASK 0x3fff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1077  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_THRESHOLD__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26  1078  

:::::: The code at line 26 was first introduced by commit
:::::: de2bdb3dcf9228030b4e0a2d83f3d6b6bedc6c33 drm/amd/amdgpu: Introduction of SI registers (v2)

:::::: TO: Tom St Denis <tom.stdenis@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--u3/rZRmxL6MmkK24
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--u3/rZRmxL6MmkK24--
