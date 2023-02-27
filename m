Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861436A4191
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31AA10E1C0;
	Mon, 27 Feb 2023 12:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D341310E1C0;
 Mon, 27 Feb 2023 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677500325; x=1709036325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KuX2ifj23XIiHvM0u+wPf0HERefBeu0ux+Zf9Ufg1CE=;
 b=S2aFb+YgzwdRcYUGq4ugONwLMxVEP6Esk6CUsgVkXt5nIWPW5JEkr+Ec
 TCXmT7DxBtfAdY83YyqqFkj13Q/KJKcV2orM/i1dgcpHuHxTOXWiBFtje
 YfPy0rU8G1x6Y8OM/3V/QccPo2MeXUWdtoBoxA4M72MhCvwU3hUKDpBCa
 v21pDaSl46iLbAFo/I37HKM4fz77zTKXKO1pGsdaWIgnPbBbQn8/2YiT4
 /uKwE4ZXLR1h6sRGV7Dw7SjVxiOC95Bf1tcOMBXvlZWduCZ+8e6Eu7gLz
 fXSrEcOkRmXDLtADFqP6DjIH99Qymi1QcrszePGX4ica76sfjiYXrIXIg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="331319317"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="331319317"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 04:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="623560454"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="623560454"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 27 Feb 2023 04:18:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pWcSm-0004OY-1T;
 Mon, 27 Feb 2023 12:18:40 +0000
Date: Mon, 27 Feb 2023 20:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanzhi Wang <wangyuanzhi@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, mario.limonciello@amd.com, Bokun.Zhang@amd.com,
 tzimmermann@suse.de, hdegoede@redhat.com, jingyuwang_vip@163.com,
 rafael.j.wysocki@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] amdgpu: add a filter condition when set brightness
Message-ID: <202302272051.KDJqRyl5-lkp@intel.com>
References: <20230227073953.326-1-wangyuanzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227073953.326-1-wangyuanzhi@uniontech.com>
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
Cc: Yuanzhi Wang <wangyuanzhi@uniontech.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuanzhi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.2 next-20230227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanzhi-Wang/amdgpu-add-a-filter-condition-when-set-brightness/20230227-154108
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230227073953.326-1-wangyuanzhi%40uniontech.com
patch subject: [PATCH] amdgpu: add a filter condition when set brightness
config: arm64-randconfig-r012-20230226 (https://download.01.org/0day-ci/archive/20230227/202302272051.KDJqRyl5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/95d9579e31d0b601aa1422cf767ca5138d3efcee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yuanzhi-Wang/amdgpu-add-a-filter-condition-when-set-brightness/20230227-154108
        git checkout 95d9579e31d0b601aa1422cf767ca5138d3efcee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272051.KDJqRyl5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:15: warning: missing terminating '"' character [-Winvalid-pp-token]
                                           DRM_WARN("old brightness %d is greater than ACPI brightness
                                                    ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:450:11: warning: missing terminating '"' character [-Winvalid-pp-token]
                                                   %d\n", old_brightness, req.backlight_level);
                                                       ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:6: error: unterminated function-like macro invocation
                                           DRM_WARN("old brightness %d is greater than ACPI brightness
                                           ^
   include/drm/drm_print.h:543:9: note: macro 'DRM_WARN' defined here
   #define DRM_WARN(fmt, ...)                                              \
           ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1105:28: error: expected expression
   #endif /* CONFIG_SUSPEND */
                              ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1105:28: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:448:5: note: previous statement is here
                                   if (old_brightness > req.backlight_level)
                                   ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1105:28: error: expected '}'
   #endif /* CONFIG_SUSPEND */
                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:439:18: note: to match this '{'
                           if (atif->bd) {
                                         ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1105:28: error: expected '}'
   #endif /* CONFIG_SUSPEND */
                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:438:59: note: to match this '{'
                   if (req.pending & ATIF_PANEL_BRIGHTNESS_CHANGE_REQUEST) {
                                                                           ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1105:28: error: expected '}'
   #endif /* CONFIG_SUSPEND */
                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:427:38: note: to match this '{'
           if (atif->functions.sbios_requests) {
                                               ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1105:28: error: expected '}'
   #endif /* CONFIG_SUSPEND */
                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:406:1: note: to match this '{'
   {
   ^
   3 warnings and 6 errors generated.


vim +449 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c

   391	
   392	/**
   393	 * amdgpu_atif_handler - handle ATIF notify requests
   394	 *
   395	 * @adev: amdgpu_device pointer
   396	 * @event: atif sbios request struct
   397	 *
   398	 * Checks the acpi event and if it matches an atif event,
   399	 * handles it.
   400	 *
   401	 * Returns:
   402	 * NOTIFY_BAD or NOTIFY_DONE, depending on the event.
   403	 */
   404	static int amdgpu_atif_handler(struct amdgpu_device *adev,
   405				       struct acpi_bus_event *event)
   406	{
   407		struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
   408		int count;
   409		int old_brightness;
   410	
   411		DRM_DEBUG_DRIVER("event, device_class = %s, type = %#x\n",
   412				event->device_class, event->type);
   413	
   414		if (strcmp(event->device_class, ACPI_VIDEO_CLASS) != 0)
   415			return NOTIFY_DONE;
   416	
   417		/* Is this actually our event? */
   418		if (!atif->notification_cfg.enabled ||
   419		    event->type != atif->notification_cfg.command_code) {
   420			/* These events will generate keypresses otherwise */
   421			if (event->type == ACPI_VIDEO_NOTIFY_PROBE)
   422				return NOTIFY_BAD;
   423			else
   424				return NOTIFY_DONE;
   425		}
   426	
   427		if (atif->functions.sbios_requests) {
   428			struct atif_sbios_requests req;
   429	
   430			/* Check pending SBIOS requests */
   431			count = amdgpu_atif_get_sbios_requests(atif, &req);
   432	
   433			if (count <= 0)
   434				return NOTIFY_BAD;
   435	
   436			DRM_DEBUG_DRIVER("ATIF: %d pending SBIOS requests\n", count);
   437	
   438			if (req.pending & ATIF_PANEL_BRIGHTNESS_CHANGE_REQUEST) {
   439				if (atif->bd) {
   440					DRM_DEBUG_DRIVER("Changing brightness to %d\n",
   441							 req.backlight_level);
   442					/*
   443					 * XXX backlight_device_set_brightness() is
   444					 * hardwired to post BACKLIGHT_UPDATE_SYSFS.
   445					 * It probably should accept 'reason' parameter.
   446					 */
   447					old_brightness = backlight_get_brightness(atif->bd);
   448					if (old_brightness > req.backlight_level)
 > 449						DRM_WARN("old brightness %d is greater than ACPI brightness
   450							%d\n", old_brightness, req.backlight_level);
   451					else
   452						backlight_device_set_brightness(atif->bd,
   453							req.backlight_level);
   454				}
   455			}
   456	
   457			if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
   458				if (adev->flags & AMD_IS_PX) {
   459					pm_runtime_get_sync(adev_to_drm(adev)->dev);
   460					/* Just fire off a uevent and let userspace tell us what to do */
   461					drm_helper_hpd_irq_event(adev_to_drm(adev));
   462					pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
   463					pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
   464				}
   465			}
   466			/* TODO: check other events */
   467		}
   468	
   469		/* We've handled the event, stop the notifier chain. The ACPI interface
   470		 * overloads ACPI_VIDEO_NOTIFY_PROBE, we don't want to send that to
   471		 * userspace if the event was generated only to signal a SBIOS
   472		 * request.
   473		 */
   474		return NOTIFY_BAD;
   475	}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
