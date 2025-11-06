Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C91C3DBC6
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F11710E9E7;
	Thu,  6 Nov 2025 23:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaLGa4Xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C3210E9E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762470628; x=1794006628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qn1cLNw/ZdYkoUu0PFZUu6fhlZmfcJ9+jGdH/jwjq9Q=;
 b=YaLGa4XbHQWQBCcICHxjq3YG3vjIe/jNcJ0iv6UK2gmlt1FNwulAI1Bm
 2JpzU6ZydkjA5bHv++HjM9c5u8IMJbJnGPMhjqb3xcWryCotQR3LO9xF+
 xYyFzCJiDujoKwHiTvlg8VBhD7b1HOX1TdyWtepryC/+HpCsm37xLKIDV
 2sH9Jzsn7F76jLryJduL3414WcmZVaSLVO+KOtQQdrO01M9wdm/zet2vT
 ovjWRUg2nS8dZBT1zIgCn59TnYgYRSBnBrIp6GQyNqb9xjS1fJNhol048
 uVcEan2oLzl0o4EKiSMtxqonIZiOkNBkcvgpnoK3dMjo8trA/w+/1MUDn A==;
X-CSE-ConnectionGUID: lYDKF8CBTz+Oy+GdJOEdIg==
X-CSE-MsgGUID: a4+hBtMxSYKyoqAqVF7Nvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64717020"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="64717020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 15:10:28 -0800
X-CSE-ConnectionGUID: YT3as7ZPR9Sglz5/WbQByA==
X-CSE-MsgGUID: LsWtj38tTaGnpyEZ4i0kXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="193058155"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 15:10:25 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vH97W-000UQi-2I;
 Thu, 06 Nov 2025 23:10:22 +0000
Date: Fri, 7 Nov 2025 07:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <202511070654.mdaukM8U-lkp@intel.com>
References: <20251106050839.3091707-4-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106050839.3091707-4-ekansh.gupta@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ekansh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.18-rc4 next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Move-fdlist-to-invoke-context-structure/20251106-131118
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251106050839.3091707-4-ekansh.gupta%40oss.qualcomm.com
patch subject: [PATCH v2 3/3] misc: fastrpc: Add polling mode support for fastRPC driver
config: parisc-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070654.mdaukM8U-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070654.mdaukM8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070654.mdaukM8U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/fastrpc.c: In function 'fastrpc_set_option':
>> drivers/misc/fastrpc.c:1883:9: warning: unused variable 'err' [-Wunused-variable]
     int i, err = 0;
            ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/err +1883 drivers/misc/fastrpc.c

  1879	
  1880	static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
  1881	{
  1882		struct fastrpc_ioctl_set_option opt = {0};
> 1883		int i, err = 0;
  1884	
  1885		if (copy_from_user(&opt, argp, sizeof(opt)))
  1886			return -EFAULT;
  1887	
  1888		for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
  1889			if (opt.reserved[i] != 0)
  1890				return -EINVAL;
  1891		}
  1892		if (opt.req != FASTRPC_POLL_MODE)
  1893			return -EINVAL;
  1894	
  1895		if (opt.enable)
  1896			fl->poll_mode = true;
  1897		else
  1898			fl->poll_mode = false;
  1899	
  1900		return 0;
  1901	}
  1902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
