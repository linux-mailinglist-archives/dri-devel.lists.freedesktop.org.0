Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB68A7F358
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 05:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633BA10E1FE;
	Tue,  8 Apr 2025 03:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3kP6DIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2B310E1FE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 03:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744084583; x=1775620583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6nM+a9P+AflVQBvgcnpoJN0HDDMjdC2INdvympzIzCk=;
 b=D3kP6DIeD2ceYmiov2aeRiiw/uD2Jbvxexahz5K4njvFNIRkI6pw/O3r
 q/MdQos4AZ4h74h8qrNyTr9UYPyTiaGzP+MUaaB3hSxw8dKGvkF/B8T4M
 F/lGSKGJsVeJhUixvmoiPdPZwxVZdBxBpC4A//+6A8BXiA30wTy5F5o5A
 JqgKQwPHa0EcHF8cqyeP1MuOznfLJpiGE+w5suPh2Jeg4+Ns4XJMQT6B1
 JKQ7X4xjGsHcDPkemb5MvOWLK7Ws8FC2oWQj2hs8TQFmd73IUYCM7NwQ4
 OTrFAOyhYajHcyN7f0hNhAeOSkAVuSoaSmsAx2qv2BcMgWxSWEXVyB9U6 A==;
X-CSE-ConnectionGUID: U0yM/aa3QVicc1NuLf/UCg==
X-CSE-MsgGUID: GrtaVv4FRgCQWXq8w09ZFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55684045"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="55684045"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 20:56:23 -0700
X-CSE-ConnectionGUID: azDhbRetRsqFQc/6skcgwg==
X-CSE-MsgGUID: sbZr6CaxR1mYR5mffhSuFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128476400"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 20:56:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u204P-000463-1E;
 Tue, 08 Apr 2025 03:56:17 +0000
Date: Tue, 8 Apr 2025 11:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
Message-ID: <202504081106.mAYfJsQj-lkp@intel.com>
References: <20250407095119.588920-4-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-4-mitltlatltl@gmail.com>
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

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next lee-backlight/for-backlight-fixes linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-backlight-kinetic-ktz8866-add-ktz8866-slave-compatible/20250407-175635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250407095119.588920-4-mitltlatltl%40gmail.com
patch subject: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
config: sparc64-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081106.mAYfJsQj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081106.mAYfJsQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081106.mAYfJsQj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/ktz8866.c: In function 'ktz8866_read':
>> drivers/video/backlight/ktz8866.c:73:39: error: passing argument 3 of 'regmap_read' from incompatible pointer type [-Wincompatible-pointer-types]
      73 |         regmap_read(ktz->regmap, reg, &val);
         |                                       ^~~~
         |                                       |
         |                                       unsigned int **
   In file included from drivers/video/backlight/ktz8866.c:17:
   include/linux/regmap.h:1297:69: note: expected 'unsigned int *' but argument is of type 'unsigned int **'
    1297 | int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
         |                                                       ~~~~~~~~~~~~~~^~~


vim +/regmap_read +73 drivers/video/backlight/ktz8866.c

    69	
    70	static inline void ktz8866_read(struct ktz8866 *ktz, unsigned int reg,
    71					unsigned int *val)
    72	{
  > 73		regmap_read(ktz->regmap, reg, &val);
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
