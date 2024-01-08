Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE307826A85
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B3910E1D1;
	Mon,  8 Jan 2024 09:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D176A10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704705598; x=1736241598;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=0GCPuY/Wp+lTIL30Wj2Uuo+to46Y+MRchxWxMArtASQ=;
 b=BmzRHIWcqkYnvwrQMZtTr6mXvgzRRXeb4g5EKGzFI0/iNPUXY2in/P+8
 DzrrcCJL9UxqOXgMhK55DktstAcyv/u+iFm3JxQNY6VzX5T0jPaejlRFj
 SqAr1F5zCP+Ejur0sSB7IVvcuNljTzPiWkP7A8Tp0Md+L23UxbyqsFbEg
 dPIgRInscVlGKUicc6sRJPwl7ioE+QLXWXaauL9oqjxdttmAVS9gi5nUZ
 +rvj9Ci6TlbTi97FD0K9IhhjVOSWj+QycmaZ6i4KgPbu0ALUFe4GdhvHX
 DZdXXHqp2BF9Dt2OJvgEoNv+fnSIIZv0Lr9C1yw+Fhdl397QqW7ZWg9Zt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="396714901"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="396714901"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 01:19:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="847156068"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="847156068"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2024 01:19:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rMlnV-0004Zm-2q;
 Mon, 08 Jan 2024 09:19:53 +0000
Date: Mon, 8 Jan 2024 17:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: [drm-misc:drm-misc-next 6/21]
 drivers/gpu/drm/rockchip/inno_hdmi.c:499:15: error: call to undeclared
 function 'drm_atomic_get_new_connector_state'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202401081720.UtgAZgba-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: llvm@lists.linux.dev, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   26a4591b31916e1c53a7c64fa3ba3fc7cc5d549f
commit: d3e040f450ec8e46ff42fa495a433b976ab47686 [6/21] drm/rockchip: inno_hdmi: Get rid of mode_set
config: s390-randconfig-001-20240106 (https://download.01.org/0day-ci/archive/20240108/202401081720.UtgAZgba-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081720.UtgAZgba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081720.UtgAZgba-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/rockchip/inno_hdmi.c:8:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/rockchip/inno_hdmi.c:8:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/rockchip/inno_hdmi.c:8:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/rockchip/inno_hdmi.c:499:15: error: call to undeclared function 'drm_atomic_get_new_connector_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     499 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
         |                      ^
   drivers/gpu/drm/rockchip/inno_hdmi.c:499:15: note: did you mean 'drm_atomic_helper_connector_reset'?
   include/drm/drm_atomic_state_helper.h:73:6: note: 'drm_atomic_helper_connector_reset' declared here
      73 | void drm_atomic_helper_connector_reset(struct drm_connector *connector);
         |      ^
>> drivers/gpu/drm/rockchip/inno_hdmi.c:499:13: error: incompatible integer to pointer conversion assigning to 'struct drm_connector_state *' from 'int' [-Wint-conversion]
     499 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/rockchip/inno_hdmi.c:503:15: error: call to undeclared function 'drm_atomic_get_new_crtc_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     503 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
         |                      ^
>> drivers/gpu/drm/rockchip/inno_hdmi.c:503:13: error: incompatible integer to pointer conversion assigning to 'struct drm_crtc_state *' from 'int' [-Wint-conversion]
     503 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 4 errors generated.


vim +/drm_atomic_get_new_connector_state +499 drivers/gpu/drm/rockchip/inno_hdmi.c

   491	
   492	static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
   493					     struct drm_atomic_state *state)
   494	{
   495		struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
   496		struct drm_connector_state *conn_state;
   497		struct drm_crtc_state *crtc_state;
   498	
 > 499		conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
   500		if (WARN_ON(!conn_state))
   501			return;
   502	
 > 503		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
   504		if (WARN_ON(!crtc_state))
   505			return;
   506	
   507		inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
   508		inno_hdmi_set_pwr_mode(hdmi, NORMAL);
   509	}
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
