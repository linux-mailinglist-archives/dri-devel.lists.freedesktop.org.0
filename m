Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C397944B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 04:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F6010E05C;
	Sun, 15 Sep 2024 02:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJE3qAGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A724E10E05C;
 Sun, 15 Sep 2024 02:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726366051; x=1757902051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KpbGciaXOmeOh3W92Etpe7+xu4k9td+wCnPCoZABsd0=;
 b=iJE3qAGbJRtgmYUetCmT9dtsBeoHL2hOKmYPGZ0TGAIx9Akm/6Cj27ba
 PvdmEwjtw4CJ/127eVIL+0HJmDVNbRvQgauNO0MR8NePcBYJxqny0Skcj
 x/CriQbP+gtWAvrnPmztfesMLlIvtB3kz99msPuGuZNv9ZYNVJqunulrw
 HyuKWEOgM3JOmpFoGn1sWkkwHE2aAB3UraqBKzCj2+Fx+M5J55m1U57eV
 azccR5HekOHMwK8ibTLcAkXba6uGyTWgVYFqkKx6gZwzXqxxpB63u3rNv
 Xq2C51BItW7Zk7USP5wG+lw3x/VKAGDwKl19oWvtNBT+WbaHU1tCPZkhB A==;
X-CSE-ConnectionGUID: uUZ6PtpNTkWAYbRdmR+u0w==
X-CSE-MsgGUID: oqTT7ifFQTqmxPe+JDiUJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42748815"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="42748815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 19:07:30 -0700
X-CSE-ConnectionGUID: EX0/+ZlBRsKH6sW4r3Agow==
X-CSE-MsgGUID: cpHkERcyRuWhtwOrmfJ5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="73274066"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 14 Sep 2024 19:07:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1spefc-0008KI-1t;
 Sun, 15 Sep 2024 02:07:24 +0000
Date: Sun, 15 Sep 2024 10:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Julius Werner <jwerner@chromium.org>,
 Hugues Bruant <hugues.bruant@gmail.com>, intel-gfx@lists.freedesktop.org,
 Brian Norris <briannorris@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v3] firmware: coreboot: Don't register a pdev if
 screen_info data is present
Message-ID: <202409150915.n7egvNYa-lkp@intel.com>
References: <20240913213246.1549213-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913213246.1549213-1-javierm@redhat.com>
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

Hi Javier,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on chrome-platform/for-firmware-next linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/firmware-coreboot-Don-t-register-a-pdev-if-screen_info-data-is-present/20240914-053323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20240913213246.1549213-1-javierm%40redhat.com
patch subject: [PATCH v3] firmware: coreboot: Don't register a pdev if screen_info data is present
config: csky-randconfig-002-20240915 (https://download.01.org/0day-ci/archive/20240915/202409150915.n7egvNYa-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150915.n7egvNYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150915.n7egvNYa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
>> ERROR: modpost: "screen_info" [drivers/firmware/google/framebuffer-coreboot.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
