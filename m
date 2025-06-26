Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410EEAEA8A4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 23:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25810E911;
	Thu, 26 Jun 2025 21:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4Y/Z4Hl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0C910E911
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750972670; x=1782508670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DPGbdcd9vclbsYIiVx5hqUl+jmswuth2sO6XH6ET4wM=;
 b=R4Y/Z4HloCX3CG2JRq5fJJRhRzDVVrO2QzzRtlM9zUMByx2N0bl/gJAP
 +fiJabVBi6pOvplHs4Gk/Lm2t5FU23UZXbWMjF2V7wYda75rUPWrlIk7V
 iS0W3InuBKoA00tOTjqtITh+13s/2zyqRxQataIbiqhknQzcEoyNKjv14
 V9e/0DeaXMGvcbpxRrlCYURiO9qxNp3c9e0p9HE7u8mqoVk86hD1RLKBZ
 /FSmkX94luLALRGQetAWfoSFj3ttzGwxZIE8CeTgbVOSHj18drqmZUpQ+
 xqpkdcOiuugCcCTsMxp7sB3042wWG6GmvprhSnowKxGmTtqS24/1D32fX g==;
X-CSE-ConnectionGUID: 1TL5LgGIRACh4+uTYgY0Cw==
X-CSE-MsgGUID: Tih3NpnnTQ+3yNeM+sNi/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53155809"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53155809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:17:49 -0700
X-CSE-ConnectionGUID: 1Y6XCKs3TFm8z2bMPAl13w==
X-CSE-MsgGUID: NMU24re8RCaaocz74piHvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152799196"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 26 Jun 2025 14:17:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uUtyb-000VXu-0M;
 Thu, 26 Jun 2025 21:17:45 +0000
Date: Fri, 27 Jun 2025 05:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed
 but not fixuped
Message-ID: <202506270544.iEP67RCm-lkp@intel.com>
References: <20250626094937.515552-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626094937.515552-1-oushixiong1025@163.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/fbdev-efifb-do-not-load-efifb-if-PCI-BAR-has-changed-but-not-fixuped/20250626-175111
base:   linus/master
patch link:    https://lore.kernel.org/r/20250626094937.515552-1-oushixiong1025%40163.com
patch subject: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed but not fixuped
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250627/202506270544.iEP67RCm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270544.iEP67RCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270544.iEP67RCm-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/video/console/dummycon.o: in function `screen_info_is_useful':
>> dummycon.c:(.text+0x90): multiple definition of `screen_info_is_useful'; arch/arm64/kernel/setup.o:setup.c:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
