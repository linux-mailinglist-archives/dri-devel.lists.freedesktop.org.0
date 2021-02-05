Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B0310C04
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4356B6F424;
	Fri,  5 Feb 2021 13:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5206F3FD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 11:04:34 +0000 (UTC)
IronPort-SDR: Ox1D8RnsavD9xmbKeikHQzEyhCfOBG8j5+v61NiZj5RxlhL76Jl4GVsKTmlRz9yseWeIxIiRtc
 7n+crjLmGIAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="169094457"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="169094457"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 03:04:33 -0800
IronPort-SDR: Cxzp55PpzeUD9i/Kte3fSg4CUmi4X/l8dGo2DHPyppHKFOpkcL7MgkO9TyEqdZswJjsvKaiwOF
 D0Es2fUJ+2sQ==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="373361847"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 03:04:31 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1l7yua-0028bP-Ca; Fri, 05 Feb 2021 13:04:28 +0200
Date: Fri, 5 Feb 2021 13:04:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Subject: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-2
Message-ID: <YB0mPPgpIpQzhNXS@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:42:56 +0000
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
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is first part of Intel MID outdated platforms removal. It's collected into
immutable branch with a given tag, please pull to yours subsystems.

(All changes are tagged by the respective maintainers)

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-platform-drivers-x86.git tags/ib-drm-gpio-pdx86-rtc-wdt-v5.12-2

for you to fetch changes up to ca338fed2a5fce66660904d7ab50bec061d2c8a2:

  platform/x86: intel_scu_wdt: Drop mistakenly added const (2021-02-05 12:54:27 +0200)

----------------------------------------------------------------
ib-drm-gpio-pdx86-rtc-wdt for v5.12-2

First part of Intel MID outdated platforms removal.

The following is an automated git shortlog grouped by driver:

drm/gma500:
 -  Get rid of duplicate NULL checks
 -  Convert to use new SCU IPC API

gpio:
 -  msic: Remove driver for deprecated platform
 -  intel-mid: Remove driver for deprecated platform

intel_mid_powerbtn:
 -  Remove driver for deprecated platform

intel_mid_thermal:
 -  Remove driver for deprecated platform

intel_scu_wdt:
 -  Drop mistakenly added const
 -  Get rid of custom x86 model comparison
 -  Drop SCU notification
 -  Move driver from arch/x86

rtc:
 -  mrst: Remove driver for deprecated platform

watchdog:
 -  intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
 -  intel_scu_watchdog: Remove driver for deprecated platform

----------------------------------------------------------------
Andy Shevchenko (13):
      drm/gma500: Convert to use new SCU IPC API
      drm/gma500: Get rid of duplicate NULL checks
      gpio: intel-mid: Remove driver for deprecated platform
      gpio: msic: Remove driver for deprecated platform
      platform/x86: intel_mid_thermal: Remove driver for deprecated platform
      platform/x86: intel_mid_powerbtn: Remove driver for deprecated platform
      rtc: mrst: Remove driver for deprecated platform
      watchdog: intel_scu_watchdog: Remove driver for deprecated platform
      watchdog: intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
      platform/x86: intel_scu_wdt: Move driver from arch/x86
      platform/x86: intel_scu_wdt: Drop SCU notification
      platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison
      platform/x86: intel_scu_wdt: Drop mistakenly added const

 MAINTAINERS                                        |   2 -
 arch/x86/platform/intel-mid/device_libs/Makefile   |   1 -
 drivers/gpio/Kconfig                               |  14 -
 drivers/gpio/Makefile                              |   1 -
 drivers/gpio/TODO                                  |   2 +-
 drivers/gpio/gpio-intel-mid.c                      | 414 ---------------
 drivers/gpio/gpio-msic.c                           | 314 ------------
 drivers/gpu/drm/gma500/Kconfig                     |   1 +
 drivers/gpu/drm/gma500/mdfld_device.c              |   2 -
 drivers/gpu/drm/gma500/mdfld_dsi_output.c          |   2 -
 drivers/gpu/drm/gma500/mdfld_output.c              |   8 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |   3 -
 drivers/gpu/drm/gma500/psb_drv.h                   |   3 +
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c         |  30 +-
 drivers/platform/x86/Kconfig                       |  23 +-
 drivers/platform/x86/Makefile                      |   3 +-
 drivers/platform/x86/intel_mid_powerbtn.c          | 233 ---------
 drivers/platform/x86/intel_mid_thermal.c           | 560 ---------------------
 .../platform/x86/intel_scu_wdt.c                   |  41 +-
 drivers/rtc/Kconfig                                |  12 -
 drivers/rtc/Makefile                               |   1 -
 drivers/rtc/rtc-mrst.c                             | 521 -------------------
 drivers/watchdog/Kconfig                           |   9 -
 drivers/watchdog/Makefile                          |   1 -
 drivers/watchdog/intel-mid_wdt.c                   |   8 +-
 drivers/watchdog/intel_scu_watchdog.c              | 533 --------------------
 drivers/watchdog/intel_scu_watchdog.h              |  50 --
 27 files changed, 54 insertions(+), 2738 deletions(-)
 delete mode 100644 drivers/gpio/gpio-intel-mid.c
 delete mode 100644 drivers/gpio/gpio-msic.c
 delete mode 100644 drivers/platform/x86/intel_mid_powerbtn.c
 delete mode 100644 drivers/platform/x86/intel_mid_thermal.c
 rename arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c => drivers/platform/x86/intel_scu_wdt.c (69%)
 delete mode 100644 drivers/rtc/rtc-mrst.c
 delete mode 100644 drivers/watchdog/intel_scu_watchdog.c
 delete mode 100644 drivers/watchdog/intel_scu_watchdog.h

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
