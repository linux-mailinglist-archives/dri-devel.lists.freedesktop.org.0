Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77038D6D23
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 02:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F266A10E27E;
	Sat,  1 Jun 2024 00:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpxAf4vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2174910E154
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 00:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717201657; x=1748737657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pzkQzkll9BnxvY6yoADX3c1dvUwawuIjZ6ByCbhdF+o=;
 b=UpxAf4vxRPcg/VEKmNSYgkGyZx9MGhHRCjgsZUCXoQOQIUKIglDpMnYt
 JKhDzAxJIZxYQuU1IcPxEcTzaTXqm4N1R8Xnj9z5pWmqbT5ar3FnLXaQc
 PqpOo1J8yHyNGuxK0pt6njKqo0tuam7hVSpwT9bp8WwejXrC8Y8N2ttu6
 xQsv7q7fNLh+NR90KJB4vdIKJHS31kk5iG4vu6ZZAXOic/vup+Iqjx4dV
 AhPyQ/3TnPGLQReimkZ9+9IP1MovGFUiRr3kSGGvFenKgd8U37LPAMt8J
 Va2eoLcNpn1id5YnX3IZjIhMvrAurUsljzclpweLrC6vhM7vCg53W/U2q A==;
X-CSE-ConnectionGUID: Nfblgv5PSnKHzyONuLfSUA==
X-CSE-MsgGUID: Jjz2Q/qESTmyYfjLkbtkdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="36299252"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36299252"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 17:27:36 -0700
X-CSE-ConnectionGUID: ZHnSF2voQwq5GZgRwjZgUQ==
X-CSE-MsgGUID: IIS8T1viRr6mGLi6evRQjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36237179"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 17:27:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sDCao-000I23-1E;
 Sat, 01 Jun 2024 00:27:30 +0000
Date: Sat, 1 Jun 2024 08:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>
Subject: Re: [PATCH v1 4/4] mfd: lm3533: Remove the driver
Message-ID: <202406010822.oVBEReGC-lkp@intel.com>
References: <20240531170844.1595468-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531170844.1595468-5-andriy.shevchenko@linux.intel.com>
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on lee-backlight/for-backlight-fixes linus/master v6.10-rc1 next-20240531]
[cannot apply to lee-backlight/for-backlight-next pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/backlight-lm3533_bl-Remove-the-driver/20240601-011153
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240531170844.1595468-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 4/4] mfd: lm3533: Remove the driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406010822.oVBEReGC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010822.oVBEReGC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010822.oVBEReGC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/lm3533-ctrlbank.c:13:10: fatal error: linux/mfd/lm3533.h: No such file or directory
      13 | #include <linux/mfd/lm3533.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/mfd/lm3533-ctrlbank.c

16c5c023aac862 Johan Hovold 2012-05-03  12  
16c5c023aac862 Johan Hovold 2012-05-03 @13  #include <linux/mfd/lm3533.h>
16c5c023aac862 Johan Hovold 2012-05-03  14  
16c5c023aac862 Johan Hovold 2012-05-03  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
