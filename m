Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47341CD2FC8
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 14:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D8810E14A;
	Sat, 20 Dec 2025 13:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nebk8W2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24FA10E14A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 13:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766237756; x=1797773756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ezskSz0sv7K80z23n0Tip2Rc9GWmtbbYwI9uNkg5LOQ=;
 b=nebk8W2ZVyyeOsujCdiEfafF+e00cQMdKaJlM2JZNDDqbizKG26TlNgx
 Cb9vlD9Kvv56Y1k8mVPWk6ioFKGHCCEd63dk7arlV9MOHKL6f0cnRaYCC
 ejD3QBqt6zmZR4UANlIp25RtGgYxVA/cL3BOsDs2HSbjmNu0WQe8GbKkx
 sbZ/Gr57lW7o2nl2XZ2+scnqXbyXLclfl/Z+yQQvVGjDrSWD6q+p6EMmK
 fxVFXkLtcs548MCQplX71JEo5nCBKGFZBxd85rDWkR8P6ZBaXQ1QEj6Qc
 rFPPJvDELmkJfcEla5XwoXJoq7rZVuoRNrCfAAfjYMFBVWsVuk3FRBLOI g==;
X-CSE-ConnectionGUID: VrlIfWpGQferousJM3H0UQ==
X-CSE-MsgGUID: PSevk0pOQ7a3ZQCG0tmPRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67371184"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="67371184"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2025 05:35:56 -0800
X-CSE-ConnectionGUID: 03wkJFNkR/mGIr9S7WRaUQ==
X-CSE-MsgGUID: ijjdsMViRjGA1kk4akL3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="204039160"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 05:35:53 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vWx7f-000000004Yv-39vv;
 Sat, 20 Dec 2025 13:35:51 +0000
Date: Sat, 20 Dec 2025 21:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arjun Changla <arjunchangla7@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arjun Changla <arjunchangla7@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix spacing before close parenthesis
Message-ID: <202512202155.mVhDoKTO-lkp@intel.com>
References: <20251218061406.8043-1-arjunchangla7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218061406.8043-1-arjunchangla7@gmail.com>
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

Hi Arjun,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Arjun-Changla/staging-fbtft-fix-spacing-before-close-parenthesis/20251218-141736
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251218061406.8043-1-arjunchangla7%40gmail.com
patch subject: [PATCH] staging: fbtft: fix spacing before close parenthesis
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202155.mVhDoKTO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202155.mVhDoKTO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202155.mVhDoKTO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/fbtft/fbtft-bus.c:65:53: error: macro 'define_fbtft_write_reg' requires 4 arguments, but only 3 given
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                                                     ^
   drivers/staging/fbtft/fbtft-bus.c:14:9: note: macro 'define_fbtft_write_reg' defined here
      14 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft-bus.c:65:23: error: expected ';' before 'void'
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                       ^
         |                       ;


vim +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
