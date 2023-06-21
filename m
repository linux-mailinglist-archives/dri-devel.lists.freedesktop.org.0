Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DA737863
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 02:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3837C10E1A3;
	Wed, 21 Jun 2023 00:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441B810E1A1;
 Wed, 21 Jun 2023 00:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687308112; x=1718844112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=277/2wA/6c86YPNajc/h4u/CD/qf7C0620q+NVqnQ4s=;
 b=ktGHf2M29WCrG3s2lmvDK1EthmcHqnBzR3hDc2ioKDFM90oyPK8DbFIo
 nDzpX9shhR1yT4ePIdphXjNNCtJkNXFtZFu8dmCB2h70z3PgBRe60UZkt
 Z/g+1ofN3EeZZrKq0odOtNAn1h87r1GO10OqbzmerybwRogTqKdOtKiuh
 V/LvVg4VwDnOCNCCYos1SjONcePs3vJ4N0ct/PKEHm+ZrieiXIuPLp7EO
 x1CTin9cyGD5mHTMYjkFiBD044xAlW/ROtETstMnpHQ/pqxcPqgdbA+IX
 6aqNskk2lp1nL8XX2fnFT88sOOIrtyXOuqfQg/3fmgsn5tb17yP6yMXji w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349754549"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="349754549"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 17:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="827222461"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="827222461"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2023 17:41:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qBlus-0006NY-0f;
 Wed, 21 Jun 2023 00:41:46 +0000
Date: Wed, 21 Jun 2023 08:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Su Hui <suhui@nfschina.com>, alexander.deucher@amd.com,
 airlied@gmail.com, Xinhui.Pan@amd.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Message-ID: <202306210814.EJjpL8Qs-lkp@intel.com>
References: <20230620045919.492128-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620045919.492128-1-suhui@nfschina.com>
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
Cc: Su Hui <suhui@nfschina.com>, Jane.Jian@amd.com, Bokun.Zhang@amd.com,
 David.Francis@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Su,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-amd-amdgpu-Properly-tune-the-size-of-struct/20230620-130013
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230620045919.492128-1-suhui%40nfschina.com
patch subject: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
config: csky-randconfig-s041-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210814.EJjpL8Qs-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210814.EJjpL8Qs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210814.EJjpL8Qs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse:     expected void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse:     expected void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse:     expected void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:579:42: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse:     expected void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     expected void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     expected void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     expected void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse:     expected void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata_v2 * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse:     got struct amdgpu_debugfs_regs2_iocdata_v2 *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse:     got struct amdgpu_debugfs_regs2_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse:     expected void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_gprwave_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse:     got struct amdgpu_debugfs_gprwave_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse:     expected void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     expected void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse:     expected void [noderef] __user *__p
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:33: sparse:     expected void const volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:33: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:33: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:33: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:41: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:41: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:25: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse:     got restricted __le32 [usertype]
--
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:25: sparse:     expected void const volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:25: sparse:     got void *ptr
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:25: sparse:     got void *ptr
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:1081:27: sparse: sparse: symbol 'vce_v4_0_ip_funcs' was not declared. Should it be static?
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[addressable] cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:17: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:17: sparse:     got void *[addressable] cpu_addr
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:25: sparse:     expected void const volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:25: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:33: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:33: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:41: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:41: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:25: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:594:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:594:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:594:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:595:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:595:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:595:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:596:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:596:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:596:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:598:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:598:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:598:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:618:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:618:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:618:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:619:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:619:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:619:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:620:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:620:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:620:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:621:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:621:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:621:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:622:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:622:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:622:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:623:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:623:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:623:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:625:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:625:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:625:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:728:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:728:34: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:728:34: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:733:39: sparse: sparse: invalid assignment: |=
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:733:39: sparse:    left side has type unsigned int
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:733:39: sparse:    right side has type restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:734:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] msg_buffer_address_hi @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:734:46: sparse:     expected unsigned int [usertype] msg_buffer_address_hi
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:734:46: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:735:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] msg_buffer_address_lo @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:735:46: sparse:     expected unsigned int [usertype] msg_buffer_address_lo
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:735:46: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1047:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1047:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1047:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1151:15: sparse: sparse: invalid assignment: |=
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1151:15: sparse:    left side has type unsigned int
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1151:15: sparse:    right side has type restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1153:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] addr_lo @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1153:25: sparse:     expected unsigned int volatile [usertype] addr_lo
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1153:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1154:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] addr_hi @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1154:25: sparse:     expected unsigned int volatile [usertype] addr_hi
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1154:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1155:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] size @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:1155:22: sparse:     expected unsigned int volatile [usertype] size
--
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *kaddr @@
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:9: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:9: sparse:     got void *kaddr

vim +485 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c

d38ceaf99ed015 Alex Deucher    2015-04-20  460  
4f4824b55650fa Tom St Denis    2016-04-27  461  /* Layout of file is 12 bytes consisting of
4f4824b55650fa Tom St Denis    2016-04-27  462   * - rptr
4f4824b55650fa Tom St Denis    2016-04-27  463   * - wptr
4f4824b55650fa Tom St Denis    2016-04-27  464   * - driver's copy of wptr
4f4824b55650fa Tom St Denis    2016-04-27  465   *
4f4824b55650fa Tom St Denis    2016-04-27  466   * followed by n-words of ring data
4f4824b55650fa Tom St Denis    2016-04-27  467   */
4f4824b55650fa Tom St Denis    2016-04-27  468  static ssize_t amdgpu_debugfs_ring_read(struct file *f, char __user *buf,
4f4824b55650fa Tom St Denis    2016-04-27  469  					size_t size, loff_t *pos)
d38ceaf99ed015 Alex Deucher    2015-04-20  470  {
450630975da9e7 Al Viro         2016-12-04  471  	struct amdgpu_ring *ring = file_inode(f)->i_private;
4f4824b55650fa Tom St Denis    2016-04-27  472  	int r, i;
4f4824b55650fa Tom St Denis    2016-04-27  473  	uint32_t value, result, early[3];
d38ceaf99ed015 Alex Deucher    2015-04-20  474  
c71dbd93eb0039 Tom St Denis    2016-05-02  475  	if (*pos & 3 || size & 3)
4f4824b55650fa Tom St Denis    2016-04-27  476  		return -EINVAL;
d38ceaf99ed015 Alex Deucher    2015-04-20  477  
4f4824b55650fa Tom St Denis    2016-04-27  478  	result = 0;
c7e6be2303d0b6 Christian König 2016-01-21  479  
4f4824b55650fa Tom St Denis    2016-04-27  480  	if (*pos < 12) {
9c5c71bbed4132 Tom St Denis    2018-03-01  481  		early[0] = amdgpu_ring_get_rptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  482  		early[1] = amdgpu_ring_get_wptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  483  		early[2] = ring->wptr & ring->buf_mask;
4f4824b55650fa Tom St Denis    2016-04-27  484  		for (i = *pos / 4; i < 3 && size; i++) {
4f4824b55650fa Tom St Denis    2016-04-27 @485  			r = put_user(early[i], (uint32_t *)buf);
4f4824b55650fa Tom St Denis    2016-04-27  486  			if (r)
4f4824b55650fa Tom St Denis    2016-04-27  487  				return r;
4f4824b55650fa Tom St Denis    2016-04-27  488  			buf += 4;
4f4824b55650fa Tom St Denis    2016-04-27  489  			result += 4;
4f4824b55650fa Tom St Denis    2016-04-27  490  			size -= 4;
4f4824b55650fa Tom St Denis    2016-04-27  491  			*pos += 4;
4f4824b55650fa Tom St Denis    2016-04-27  492  		}
4f4824b55650fa Tom St Denis    2016-04-27  493  	}
d38ceaf99ed015 Alex Deucher    2015-04-20  494  
4f4824b55650fa Tom St Denis    2016-04-27  495  	while (size) {
4f4824b55650fa Tom St Denis    2016-04-27  496  		if (*pos >= (ring->ring_size + 12))
4f4824b55650fa Tom St Denis    2016-04-27  497  			return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  498  
4f4824b55650fa Tom St Denis    2016-04-27  499  		value = ring->ring[(*pos - 12)/4];
4f4824b55650fa Tom St Denis    2016-04-27  500  		r = put_user(value, (uint32_t *)buf);
4f4824b55650fa Tom St Denis    2016-04-27  501  		if (r)
4f4824b55650fa Tom St Denis    2016-04-27  502  			return r;
4f4824b55650fa Tom St Denis    2016-04-27  503  		buf += 4;
4f4824b55650fa Tom St Denis    2016-04-27  504  		result += 4;
4f4824b55650fa Tom St Denis    2016-04-27  505  		size -= 4;
4f4824b55650fa Tom St Denis    2016-04-27  506  		*pos += 4;
d38ceaf99ed015 Alex Deucher    2015-04-20  507  	}
4f4824b55650fa Tom St Denis    2016-04-27  508  
4f4824b55650fa Tom St Denis    2016-04-27  509  	return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  510  }
d38ceaf99ed015 Alex Deucher    2015-04-20  511  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
