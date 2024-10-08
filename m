Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73099593C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE6A10E24B;
	Tue,  8 Oct 2024 21:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ku1d/sX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA9A10E24B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728422533; x=1759958533;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Bh+xK+qKuAd2TI9AIJjUI6bTu6iXh0GH/7H0qsy207A=;
 b=ku1d/sX+BfyOfRp/j78JFO0TT+MGmirqBTVdkDpO26NNB8tsQ9wewWxv
 57t87hd0utQM9QAz/LE5gKKk/jz6xC+NDECL3PgckWovJhIZXrjObXQan
 nKhatDipdlPjqFsT+zmnzBd6AjORmhifxEbc9dBkm/n92lyMaMa/hzFO2
 lfF9qdRxGLStuBvRYR9kZoC5KOQNr23R/qx7fvP7gmfm9KsaI2LAEPT6v
 5YGzTwPPGocXBr/FqC0I1DZONmyTxiKJSIgMthyUeOHBiS01Sf0DOyZle
 M989Jv4jlba0frR/1TQbKY3nWruIX/LECAc0Ru6BZMzRd80itAXfyOhRf A==;
X-CSE-ConnectionGUID: d1f9Oa7xQp6/DqS6HKtMgg==
X-CSE-MsgGUID: Wbbkcrv/TrOv4BRgQryNsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53073594"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="53073594"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:22:13 -0700
X-CSE-ConnectionGUID: 1KAYVdPASCyWQ1zp5/xwPQ==
X-CSE-MsgGUID: fDmfUm0jQ6C+6O/XAo1cZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="80573533"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2024 14:22:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1syHei-0008OB-0O;
 Tue, 08 Oct 2024 21:22:08 +0000
Date: Wed, 9 Oct 2024 05:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <202410090402.lospEFvZ-lkp@intel.com>
References: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
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
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Add-CRC-support-using-invokeV2-request/20241007-164734
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241007084518.3649876-2-quic_ekangupt%40quicinc.com
patch subject: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2 request
config: alpha-randconfig-r112-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090402.lospEFvZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410090402.lospEFvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090402.lospEFvZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/fastrpc.c:1696:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] args @@     got struct fastrpc_invoke_args *[assigned] args @@
   drivers/misc/fastrpc.c:1696:19: sparse:     expected unsigned long long [usertype] args
   drivers/misc/fastrpc.c:1696:19: sparse:     got struct fastrpc_invoke_args *[assigned] args
>> drivers/misc/fastrpc.c:1716:18: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *objp @@     got unsigned long long [addressable] [usertype] args @@
   drivers/misc/fastrpc.c:1716:18: sparse:     expected void const *objp
   drivers/misc/fastrpc.c:1716:18: sparse:     got unsigned long long [addressable] [usertype] args
   drivers/misc/fastrpc.c:1734:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *objp @@     got unsigned long long [addressable] [usertype] args @@
   drivers/misc/fastrpc.c:1734:23: sparse:     expected void const *objp
   drivers/misc/fastrpc.c:1734:23: sparse:     got unsigned long long [addressable] [usertype] args
   drivers/misc/fastrpc.c: note: in included file (through include/linux/swait.h, include/linux/completion.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1696 drivers/misc/fastrpc.c

  1677	
  1678	static int fastrpc_copy_args(struct fastrpc_invoke *inv)
  1679	{
  1680		struct fastrpc_invoke_args *args = NULL;
  1681		u32 nscalars;
  1682	
  1683		/* nscalars is truncated here to max supported value */
  1684		nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
  1685		if (nscalars) {
  1686			args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
  1687			if (!args)
  1688				return -ENOMEM;
  1689	
  1690			if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,
  1691					   nscalars * sizeof(*args))) {
  1692				kfree(args);
  1693				return -EFAULT;
  1694			}
  1695		}
> 1696		inv->args = args;
  1697	
  1698		return 0;
  1699	}
  1700	
  1701	static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
  1702	{
  1703		struct fastrpc_invoke_v2 ioctl = {0};
  1704		struct fastrpc_invoke inv;
  1705		int err;
  1706	
  1707		if (copy_from_user(&inv, argp, sizeof(inv)))
  1708			return -EFAULT;
  1709	
  1710		err = fastrpc_copy_args(&inv);
  1711		if (err)
  1712			return err;
  1713	
  1714		ioctl.inv = inv;
  1715		err = fastrpc_internal_invoke(fl, false, &ioctl);
> 1716		kfree(inv.args);
  1717	
  1718		return err;
  1719	}
  1720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
