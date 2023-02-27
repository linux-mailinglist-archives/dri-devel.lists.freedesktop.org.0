Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41E6A3F43
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5049610E3AF;
	Mon, 27 Feb 2023 10:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5527610E3B9;
 Mon, 27 Feb 2023 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677492823; x=1709028823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=al92Ed2pzqvVFm7tu86/z1M74YF77ovxH7+PeaEGFpc=;
 b=WrgMg4HEBjQkvh1BpIM8zZ5oSXxbspKiHaJYVwhU0u0uckiSpIsJcikr
 SynhtyJLE34CRcJ81+GubqENxh/9xTpWVnggnDwg3SFfOJxvzLz7QHtDJ
 /2W0VcAiZT9JO8QytzPgYMD5+PKjZ5GMSOVaIBUVlszeRIZRARF5YEPvd
 So3KYuW2AQ6ONAJ4CwfRiR90t/FX/FpaP4wxtwX/CtGhVp5Ez740ybcuT
 Yegndf9P5Yb46GhFFPkx09qSEl5Nk0JYZ1yjrWGvf0M1GXV0hkqgvsb/i
 Sew+/WTJCB/WiXNPGhY31ptIJdGL+URqEFA8DXwGLU6EyRndviyWnUX04 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="336104942"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="336104942"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 02:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="666960939"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="666960939"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 27 Feb 2023 02:13:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pWaVk-0004Jx-14;
 Mon, 27 Feb 2023 10:13:36 +0000
Date: Mon, 27 Feb 2023 18:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanzhi Wang <wangyuanzhi@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, mario.limonciello@amd.com, Bokun.Zhang@amd.com,
 tzimmermann@suse.de, hdegoede@redhat.com, jingyuwang_vip@163.com,
 rafael.j.wysocki@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] amdgpu: add a filter condition when set brightness
Message-ID: <202302271822.ZZYRdzTn-lkp@intel.com>
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
Cc: Yuanzhi Wang <wangyuanzhi@uniontech.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuanzhi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.2 next-20230227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanzhi-Wang/amdgpu-add-a-filter-condition-when-set-brightness/20230227-154108
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230227073953.326-1-wangyuanzhi%40uniontech.com
patch subject: [PATCH] amdgpu: add a filter condition when set brightness
config: loongarch-randconfig-r036-20230226 (https://download.01.org/0day-ci/archive/20230227/202302271822.ZZYRdzTn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/95d9579e31d0b601aa1422cf767ca5138d3efcee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yuanzhi-Wang/amdgpu-add-a-filter-condition-when-set-brightness/20230227-154108
        git checkout 95d9579e31d0b601aa1422cf767ca5138d3efcee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271822.ZZYRdzTn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c: In function 'amdgpu_atif_handler':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:50: warning: missing terminating " character
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:450:53: warning: missing terminating " character
     450 |                                                 %d\n", old_brightness, req.backlight_level);
         |                                                     ^
   cc1: error: unterminated argument list invoking macro "DRM_WARN"
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: 'DRM_WARN' undeclared (first use in this function)
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                         ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:49: error: expected ';' at end of input
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                                 ^
         |                                                 ;
   ......
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:448:33: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     448 |                                 if (old_brightness > req.backlight_level)
         |                                 ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:448:33: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                         ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c: At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:404:12: warning: 'amdgpu_atif_handler' defined but not used [-Wunused-function]
     404 | static int amdgpu_atif_handler(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:308:12: warning: 'amdgpu_atif_query_backlight_caps' defined but not used [-Wunused-function]
     308 | static int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:240:12: warning: 'amdgpu_atif_get_notification_params' defined but not used [-Wunused-function]
     240 | static int amdgpu_atif_get_notification_params(struct amdgpu_atif *atif)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:195:12: warning: 'amdgpu_atif_verify_interface' defined but not used [-Wunused-function]
     195 | static int amdgpu_atif_verify_interface(struct amdgpu_atif *atif)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:35:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
