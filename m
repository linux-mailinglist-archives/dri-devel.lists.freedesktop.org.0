Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58540988E57
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 10:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6B010E1F5;
	Sat, 28 Sep 2024 08:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/J9mgu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E88110E01F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727510648; x=1759046648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iYwiwZZbcYBs1YE9u1895Apadus7z72Bxx4TTaVUpUc=;
 b=g/J9mgu8wxRFWvGsVTqVe5+0mizklaPOFoxVIgG+Gf0tbLOEgB0Vuoob
 oet5ywiLqw4KV6YxUPWMU0Hh/qJGLq6wdpliVKm6zue517ivXMw8+M8Qa
 94UymdnuhGGHkJ+3zxt+2wc9grf8UAt0rGSIZ1p/wXd3WeiTlF2SB1zaX
 bP3ZsnguD2Xp2On08g+PgtuyuiPHHpsIdniif5VHGrZR1nKuRDDKa9PLk
 HpvvcyKXmnhy4M0/DeRFQJeewjJo4QUO/yLMRh403g8ECT/Vhsac9p4Ae
 TT6zcfTniKcKvunSCDDnuQ4d41WJ+ZnBH9+naVqh4Agz6OLFpatCu3RD+ g==;
X-CSE-ConnectionGUID: danyo5h8Qi2U4hK76lAxaw==
X-CSE-MsgGUID: 6dSyK4/JSYu2UItWQqmbPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37331707"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="37331707"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 01:04:08 -0700
X-CSE-ConnectionGUID: 5dMSq6rWRAaEU6u8vUhqEQ==
X-CSE-MsgGUID: ZEojGvVpSUqDqljoa2Fw0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="72831532"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 01:04:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1suSQr-000N1Q-1O;
 Sat, 28 Sep 2024 08:04:01 +0000
Date: Sat, 28 Sep 2024 16:03:20 +0800
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
Subject: Re: [PATCH v3] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
Message-ID: <202409281513.tYxQaGoH-lkp@intel.com>
References: <20240927141745.145176-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927141745.145176-1-wse@tuxedocomputers.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO-NB04-devices/20240927-221932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240927141745.145176-1-wse%40tuxedocomputers.com
patch subject: [PATCH v3] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: x86_64-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281513.tYxQaGoH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281513.tYxQaGoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281513.tYxQaGoH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
ERROR: modpost: "hid_destroy_device" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "wmidev_evaluate_method" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "wmi_driver_unregister" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "__wmi_driver_register" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
ERROR: modpost: "hid_parse_report" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
ERROR: modpost: "hid_add_device" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!
ERROR: modpost: "hid_allocate_device" [drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
