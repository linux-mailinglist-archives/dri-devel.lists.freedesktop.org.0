Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BD72D506
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 01:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DAF10E2D1;
	Mon, 12 Jun 2023 23:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76CE10E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 23:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686613047; x=1718149047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2Z52hCVOR7DJUTPlLD7xaPNXC1JoIJf4cVIpOC5zfkY=;
 b=esFWek8zX50g5NNJV+VbZMZeN/+2VAxNs/XL2a2EmE5SUGks/hx3kVs2
 75jXRzUTsqEak01nH4Inbce/Yu6BnmThXOS4/cLF1W3F1sHkg7AbsAGlj
 sBTRB6Xn1yCH/uBy7TYGCODU7FA8Sod4ftnReQoNI9NXd4vDYknb1O5B3
 JAxJmCjnLuR8K0gcxaU5HKuh84g6fG97mL9LVug7vclMoljzQPlG3HEMY
 HaXiAnYoD90YCoVmFSJRBBfgSHJB4s3+QUc/cyb6TT6Gpa7/GW6H1r2iP
 Y01hANP4VDjD1GLACXomu6/wWcXJUjbe/IzhTGsXg2w8vaK59WAwP++a7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361552041"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; d="scan'208";a="361552041"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 16:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="801209462"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; d="scan'208";a="801209462"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2023 16:37:21 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q8r68-0000qK-1B;
 Mon, 12 Jun 2023 23:37:20 +0000
Date: Tue, 13 Jun 2023 07:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev/media: Use GPIO descriptors for VIA GPIO
Message-ID: <202306130745.DRBLkZcT-lkp@intel.com>
References: <20230612134500.249178-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612134500.249178-1-linus.walleij@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.4-rc6 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/fbdev-media-Use-GPIO-descriptors-for-VIA-GPIO/20230612-214746
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230612134500.249178-1-linus.walleij%40linaro.org
patch subject: [PATCH] fbdev/media: Use GPIO descriptors for VIA GPIO
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230613/202306130745.DRBLkZcT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add media-tree git://linuxtv.org/media_tree.git
        git fetch media-tree master
        git checkout media-tree/master
        b4 shazam https://lore.kernel.org/r/20230612134500.249178-1-linus.walleij@linaro.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130745.DRBLkZcT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/via/via-gpio.c:13:10: fatal error: linux/via-gpio.h: No such file or directory
      13 | #include <linux/via-gpio.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/video/fbdev/via/via-gpio.c

ec66841e495b9a drivers/video/via/via-gpio.c Jonathan Corbet 2010-05-05 @13  #include <linux/via-gpio.h>
a8a359318530a7 drivers/video/via/via-gpio.c Paul Gortmaker  2011-07-10  14  #include <linux/export.h>
7e0de022680f78 drivers/video/via/via-gpio.c Jonathan Corbet 2009-12-01  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
