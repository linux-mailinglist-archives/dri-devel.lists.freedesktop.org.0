Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF8298761
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 08:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A031E6E3F0;
	Mon, 26 Oct 2020 07:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA166E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 07:26:29 +0000 (UTC)
IronPort-SDR: 8fQgacrn40z+uoxVd9zpYlKuV4Vtv4aYix7VY4WBt2UdpaF1a1c3XGjmRV23HPgjIbYH/6cscu
 ngOuG8TKHOsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="155668498"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; 
 d="gz'50?scan'50,208,50";a="155668498"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 00:26:26 -0700
IronPort-SDR: y3f73gvVikJwhFcUEPD6Hc/9L1OU8SQS250ClhKjCiUxVKGx0BzeioD9vS2P+i7R5LziLOX7Z4
 A5yBU41nDElg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; 
 d="gz'50?scan'50,208,50";a="467817712"
Received: from lkp-server01.sh.intel.com (HELO 394efc4116ff) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 26 Oct 2020 00:26:23 -0700
Received: from kbuild by 394efc4116ff with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kWwta-00002O-Jq; Mon, 26 Oct 2020 07:26:22 +0000
Date: Mon, 26 Oct 2020 15:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm: adi: axi-hdmi-tx: Add support for AXI HDMI
 TX IP core
Message-ID: <202010261544.nQH13dge-lkp@intel.com>
References: <20201026064122.2831-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20201026064122.2831-1-bogdan.togorean@analog.com>
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
Cc: kbuild-all@lists.01.org, Mike Looijmans <mike.looijmans@topic.nl>,
 David Airlie <airlied@linux.ie>, clang-built-linux@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, Bogdan Togorean <bogdan.togorean@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bogdan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next linus/master v5.10-rc1 next-20201026]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bogdan-Togorean/drm-adi-axi-hdmi-tx-Add-support-for-AXI-HDMI-TX-IP-core/20201026-144628
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: powerpc-randconfig-r002-20201026 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f2c25c70791de95d2466e09b5b58fc37f6ccd7a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/3b750d1d27d13d89fd7b53ec7154dd2ae2cd36a5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bogdan-Togorean/drm-adi-axi-hdmi-tx-Add-support-for-AXI-HDMI-TX-IP-core/20201026-144628
        git checkout 3b750d1d27d13d89fd7b53ec7154dd2ae2cd36a5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:231:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:541:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:233:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:235:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:237:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:2:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:4:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c:77:23: warning: unused variable 'adv7511_csc_ycbcr_to_rgb' [-Wunused-const-variable]
   static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
                         ^
   7 warnings generated.
--
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:199:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:541:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:201:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:203:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:205:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:207:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:13:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:209:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:137:6: warning: variable 'slave_node' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (ep_node) {
               ^~~~~~~
   drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:151:7: note: uninitialized use occurs here
           if (!slave_node)
                ^~~~~~~~~~
   drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:137:2: note: remove the 'if' if its condition is always true
           if (ep_node) {
           ^~~~~~~~~~~~~
   drivers/gpu/drm/adi/axi_hdmi_tx_drv.c:116:32: note: initialize the variable 'slave_node' to silence this warning
           struct device_node *slave_node, *ep_node;
                                         ^
                                          = NULL
   7 warnings generated.

vim +/adv7511_csc_ycbcr_to_rgb +77 drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c

    76	
  > 77	static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
    78		0x0734, 0x04ad, 0x0000, 0x1c1b,
    79		0x1ddc, 0x04ad, 0x1f24, 0x0135,
    80		0x0000, 0x04ad, 0x087c, 0x1b77,
    81	};
    82	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--PEIAKu/WMn1b1Hv9
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--PEIAKu/WMn1b1Hv9--
