Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E58BBAE5
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 13:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA54F10FD4F;
	Sat,  4 May 2024 11:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwFTIK/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811AF10FD4F
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714823192; x=1746359192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qQXVDmyCOh7VCNUbBBWBaLbWHRimpTQLcNFH0D/M+ts=;
 b=jwFTIK/Q8JsDVy6kkVuGtgbMPOZ4ea1BUwd2SyIAnaFU/f5RG+QZ0puu
 0L3SKgt590mJFihgxhlrs+oARx+uUl6CD6pkubNIv0gnWCQju96TJjGVA
 LZCIiLadje7QoBWsaSwSQ83kyKSaKE+/tLtmZc+XvIXC05HZbv4mZ1DrA
 A1InqydvaQSjeEmkTC8Js6AUzs3i5/TEMa8js8CsIJd9peBV1JjMs6UXd
 EyfuYxvJkuD5hgngsxs2ze1Wrmy9PBwUSULYX1Y8uYVXRSeFgGFnRVuK+
 U+uJqx6F29H1UqUpstdaAcImp5CMBELslq3FxxOp1F8FhnCuOVv226h93 A==;
X-CSE-ConnectionGUID: qv7yWP9cTtC0Dk9kTkC69w==
X-CSE-MsgGUID: SvoOnze4SeqBnGj+pAczyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="36012713"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="36012713"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 04:46:31 -0700
X-CSE-ConnectionGUID: UwtQGMebQa+3N6cKVb31yQ==
X-CSE-MsgGUID: S5sYHNEeRVSJl+dF0XdkXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32506763"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 04 May 2024 04:46:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s3DqT-000CjU-1h;
 Sat, 04 May 2024 11:46:25 +0000
Date: Sat, 4 May 2024 19:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
Message-ID: <202405041939.MNsieCv5-lkp@intel.com>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503192858.103640-1-florian.fainelli@broadcom.com>
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

Hi Florian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.9-rc6 next-20240503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Fainelli/fbdev-Have-CONFIG_FB_NOTIFY-be-tristate/20240504-033139
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240503192858.103640-1-florian.fainelli%40broadcom.com
patch subject: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
config: powerpc-randconfig-001-20240504 (https://download.01.org/0day-ci/archive/20240504/202405041939.MNsieCv5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041939.MNsieCv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041939.MNsieCv5-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/leds/trigger/ledtrig-backlight.o: in function `bl_trig_deactivate':
>> ledtrig-backlight.c:(.text+0x360): undefined reference to `fb_unregister_client'
   powerpc-linux-ld: drivers/leds/trigger/ledtrig-backlight.o: in function `bl_trig_activate':
>> ledtrig-backlight.c:(.text+0x3e8): undefined reference to `fb_register_client'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
