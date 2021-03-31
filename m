Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8335060E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 20:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9226EB3A;
	Wed, 31 Mar 2021 18:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484296EB3A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 18:12:49 +0000 (UTC)
IronPort-SDR: feOtIOU9e4/vuv0prohTa6SBDvXbcOHolfFQnFb7LFfYlvaokkJEepgeHavszoDWDKEMzmN5ZP
 Xez/7kyIxFNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="277247796"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
 d="gz'50?scan'50,208,50";a="277247796"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 11:12:48 -0700
IronPort-SDR: cVj4RAAGSdzXU9hE3OhPUuLnNzq2OkQgCb8v/1jZpWR6Rt63molt+omwnYcEyh81WKJ8uBC+N1
 /enAFGLCceUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
 d="gz'50?scan'50,208,50";a="610608310"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2021 11:12:44 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lRfKd-000623-Rf; Wed, 31 Mar 2021 18:12:43 +0000
Date: Thu, 1 Apr 2021 02:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bernard Zhao <bernard@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jcrouse@codeaurora.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] /msm/adreno: fix different address spaces warning
Message-ID: <202104010206.Xomcp5Ml-lkp@intel.com>
References: <20210331131313.60942-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20210331131313.60942-1-bernard@vivo.com>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bernard,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.12-rc5 next-20210331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bernard-Zhao/msm-adreno-fix-different-address-spaces-warning/20210331-212535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5e46d1b78a03d52306f21f77a4e4a144b6d31486
config: arm64-randconfig-r011-20210330 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 3a6365a439ede4b7c65076bb42b1b7dbf72216b5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/ba5ad7c05994836bcb59fd6d7b5b70c8b553ea56
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bernard-Zhao/msm-adreno-fix-different-address-spaces-warning/20210331-212535
        git checkout ba5ad7c05994836bcb59fd6d7b5b70c8b553ea56
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:2: error: invalid operands to binary expression ('void *' and 'int')
           cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:2: error: invalid operands to binary expression ('void *' and 'int')
           cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:2: error: invalid operands to binary expression ('void *' and 'int')
           cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_C, reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:2: error: invalid operands to binary expression ('void *' and 'int')
           cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_D, reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:12: error: invalid operands to binary expression ('void *' and 'int')
           data[0] = cxdbg_read(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF2);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:180:30: note: expanded from macro 'cxdbg_read'
           msm_readl((ptr) + ((offset) << 2))
                              ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:12: error: invalid operands to binary expression ('void *' and 'int')
           data[1] = cxdbg_read(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF1);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:180:30: note: expanded from macro 'cxdbg_read'
           msm_readl((ptr) + ((offset) << 2))
                              ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:356:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:359:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:362:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:363:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:364:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:365:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:367:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:369:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:372:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:373:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))
                                      ~~~~~~~~ ^  ~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:374:3: error: invalid operands to binary expression ('void *' and 'int')
                   cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:177:38: note: expanded from macro 'cxdbg_write'
           msm_writel((val), (ptr) + ((offset) << 2))


vim +189 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c

   175	
   176	#define cxdbg_write(ptr, offset, val) \
   177		msm_writel((val), (ptr) + ((offset) << 2))
   178	
   179	#define cxdbg_read(ptr, offset) \
   180		msm_readl((ptr) + ((offset) << 2))
   181	
   182	/* read a value from the CX debug bus */
   183	static int cx_debugbus_read(void *__iomem cxdbg, u32 block, u32 offset,
   184			u32 *data)
   185	{
   186		u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
   187			A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
   188	
 > 189		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
   190		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
   191		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_C, reg);
   192		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_D, reg);
   193	
   194		/* Wait 1 us to make sure the data is flowing */
   195		udelay(1);
   196	
   197		data[0] = cxdbg_read(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF2);
   198		data[1] = cxdbg_read(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF1);
   199	
   200		return 2;
   201	}
   202	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--yrj/dFKFPuw6o+aM
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--yrj/dFKFPuw6o+aM--
