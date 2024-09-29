Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D198937B
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 09:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2921210E116;
	Sun, 29 Sep 2024 07:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzhI78dg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783BC10E116
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727595621; x=1759131621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wGxWHk+iodS3mlP5Z/WAVJxfkUca1FSivOYcI33k12Q=;
 b=DzhI78dg07fnrOqIMyrvxsojzcdKeG4cFPYRPc5YRqsfif2y7gSrqip7
 gRfvINir80p5QLpA6xXj+rE7MjAZ6M+i4b3Nn4T+0udOeKG+deK2nMDPW
 zZOjvBUOLMnBbE40WmK132YeybXQ2armp/0sYkHVLIgW5Qfo9SY4Zotrp
 IwltwHAxjGJFc3RrFvDSwLUOhZBkLcHQCRQE7yKf8MP+Vaz64gJ+Dd8OY
 9PZzcZPOC5YL0o90dIXlJHe/xYbKiC9pNhCWftNtabMwHW6NTRcAphwBA
 wAbN4XLOZPBWCxpyKqRYybzZrsNPkdsisiiLpAYVoa+y59TTNc82uc3e3 w==;
X-CSE-ConnectionGUID: JwCUIZLFQc26m7bnW3wTJA==
X-CSE-MsgGUID: 5Nw0QreORsScnbyeEakTjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="14316091"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="14316091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 00:40:19 -0700
X-CSE-ConnectionGUID: BRz8Q1I7TBONv/YhKerRsA==
X-CSE-MsgGUID: EYnfQ/ESSlCH4dbbLCZaSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="96297876"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2024 00:40:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1suoXN-000O0D-23;
 Sun, 29 Sep 2024 07:40:13 +0000
Date: Sun, 29 Sep 2024 15:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de,
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <202409291428.gVFlS4L1-lkp@intel.com>
References: <20240927124152.139099-2-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927124152.139099-2-wse@tuxedocomputers.com>
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

Hi Werner,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO/20240927-214157
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240927124152.139099-2-wse%40tuxedocomputers.com
patch subject: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
config: x86_64-buildonly-randconfig-003-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291428.gVFlS4L1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291428.gVFlS4L1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291428.gVFlS4L1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.o: in function `remove':
>> tuxedo_nb04_wmi_ab_init.c:(.text+0x34): undefined reference to `hid_destroy_device'
   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o: in function `ll_parse':
>> tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0xdbd): undefined reference to `hid_parse_report'
   ld: drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.o: in function `tuxedo_nb04_virtual_lamp_array_add_device':
>> tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0xeff): undefined reference to `hid_allocate_device'
>> ld: tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0xfbb): undefined reference to `hid_add_device'
>> ld: tuxedo_nb04_wmi_ab_virtual_lamp_array.c:(.text+0x1004): undefined reference to `hid_destroy_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
