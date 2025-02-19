Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E052DA3CDDF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6F810E8B7;
	Wed, 19 Feb 2025 23:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrO2KsAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE7A10E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 23:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740009129; x=1771545129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fC6muqlChDrljBG2bGaCmMbBFb3Lrun3fzk8vu7AYLA=;
 b=nrO2KsAB8MhUlqZMSNHsxPoG+tMkFCfdRdqSPyXo/BmlOXFHutA1QjhM
 75yc6ZOykBcHhq5QfqQ1ib/8hhAKSPdBDAP8TS4c/grAJJqFOSvB/jq+8
 18/nHEOrNf7wEDY34hrH6sUouaGshXtj9WPJY4jTaJ2bONX6tmfl1TO2I
 rwooDDHZswIr1jjaaeo8Zm30jvNgvdwhAYzdybJxqXmTfZMjRwoUAS0Fv
 /RTvl+db7/s5Yj937VFS2yFJjs4mkfUbWR3sNfIswA39kVT40YwdYgU6E
 uWtdQC1X1GoppuBfZhEF4xVAcZfFmapjbOH4PGB0ZP7sqT+8s/UzFL2nE w==;
X-CSE-ConnectionGUID: gT3EzqHnSs6A6CDf09IWaQ==
X-CSE-MsgGUID: yRyF7mzpTG+oeQcYeVD06w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44688527"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="44688527"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 15:52:08 -0800
X-CSE-ConnectionGUID: ooLzz0LaSPGEFPY9ENumrA==
X-CSE-MsgGUID: NYD5DsV1TIOSvYVpYayIhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="115065139"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2025 15:52:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tktrF-0003d5-26;
 Wed, 19 Feb 2025 23:52:01 +0000
Date: Thu, 20 Feb 2025 07:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
Message-ID: <202502200718.H8t6Uv7b-lkp@intel.com>
References: <20250218132702.114669-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132702.114669-3-clamor95@gmail.com>
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

Hi Svyatoslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-leds/for-leds-next robh/for-next linus/master v6.14-rc3 next-20250219]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-mfd-Document-TI-LM3533-MFD/20250218-212857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250218132702.114669-3-clamor95%40gmail.com
patch subject: [PATCH v2 2/2] mfd: lm3533: convert to use OF
config: arm-randconfig-002-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200718.H8t6Uv7b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200718.H8t6Uv7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200718.H8t6Uv7b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/backlight/lm3533_bl.c:417:25: error: use of undeclared identifier 'lm3533_match_table'; did you mean 'lm3533_bl_match_table'?
     417 | MODULE_DEVICE_TABLE(of, lm3533_match_table);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         lm3533_bl_match_table
   include/linux/module.h:250:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_device_table__##type##__##name                \
         |               ^
   drivers/video/backlight/lm3533_bl.c:413:34: note: 'lm3533_bl_match_table' declared here
     413 | static const struct of_device_id lm3533_bl_match_table[] = {
         |                                  ^
   1 error generated.


vim +417 drivers/video/backlight/lm3533_bl.c

   412	
   413	static const struct of_device_id lm3533_bl_match_table[] = {
   414		{ .compatible = "ti,lm3533-backlight" },
   415		{ },
   416	};
 > 417	MODULE_DEVICE_TABLE(of, lm3533_match_table);
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
