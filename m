Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE577E904A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 14:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B4B10E1A2;
	Sun, 12 Nov 2023 13:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972BE10E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699795703; x=1731331703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gonYe3A13CfWlcGYPqibfS02ilOu72+77HDfTQDVhFE=;
 b=UvErntIJidMnxudH5GLqrST1h3n3SwvWpi/3O3SIjo1fq5G/TfEloKys
 Y81lgnncYOV5DEMnC7ehCGZWvq6RyYms+zou8SC53vZ3ljG86SHm8QuKj
 025jwVVzr0jfy69G9IdSx/eW197NDM+dbhyQrlu5Q7CeG4NiyheXWHNze
 dGXEIHuyqiv1D/2LaE8htsmWQizZKj4wq4skvQAmqz39Iw6fJiAd/YsdL
 pJEpg8Ww/nmd4NFQ9xBw+lSEt7QFJzJsXjm6rluDIsSJm3D7OURJt2AHX
 32XM14WUDt9ZIpBEDzjx1g7LB6RF6lB5+OsFeYuO8SlhKZvJaDOzK+kN4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="393199349"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; d="scan'208";a="393199349"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2023 05:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="834507770"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; d="scan'208";a="834507770"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 12 Nov 2023 05:28:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r2AVe-000BBB-1u;
 Sun, 12 Nov 2023 13:28:18 +0000
Date: Sun, 12 Nov 2023 21:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrew Worsley <amworsley@gmail.com>
Subject: Re: [PATCH] of/platform: Disable sysfb if a simple-framebuffer node is
Message-ID: <202311122126.kODv1Vau-lkp@intel.com>
References: <87a5rj9s37.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5rj9s37.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 "open list:DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/of-platform-Disable-sysfb-if-a-simple-framebuffer-node-is/20231112-183751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/87a5rj9s37.fsf%40minerva.mail-host-address-is-not-set
patch subject: [PATCH] of/platform: Disable sysfb if a simple-framebuffer node is
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20231112/202311122126.kODv1Vau-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311122126.kODv1Vau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311122126.kODv1Vau-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/platform.c: In function 'of_platform_default_populate_init':
>> drivers/of/platform.c:635:25: error: implicit declaration of function 'sysfb_disable'; did you mean 'clk_disable'? [-Werror=implicit-function-declaration]
     635 |                         sysfb_disable();
         |                         ^~~~~~~~~~~~~
         |                         clk_disable
   cc1: some warnings being treated as errors


vim +635 drivers/of/platform.c

   545	
   546	static int __init of_platform_default_populate_init(void)
   547	{
   548		struct device_node *node;
   549	
   550		device_links_supplier_sync_state_pause();
   551	
   552		if (!of_have_populated_dt())
   553			return -ENODEV;
   554	
   555		if (IS_ENABLED(CONFIG_PPC)) {
   556			struct device_node *boot_display = NULL;
   557			struct platform_device *dev;
   558			int display_number = 0;
   559			int ret;
   560	
   561			/* Check if we have a MacOS display without a node spec */
   562			if (of_property_present(of_chosen, "linux,bootx-noscreen")) {
   563				/*
   564				 * The old code tried to work out which node was the MacOS
   565				 * display based on the address. I'm dropping that since the
   566				 * lack of a node spec only happens with old BootX versions
   567				 * (users can update) and with this code, they'll still get
   568				 * a display (just not the palette hacks).
   569				 */
   570				dev = platform_device_alloc("bootx-noscreen", 0);
   571				if (WARN_ON(!dev))
   572					return -ENOMEM;
   573				ret = platform_device_add(dev);
   574				if (WARN_ON(ret)) {
   575					platform_device_put(dev);
   576					return ret;
   577				}
   578			}
   579	
   580			/*
   581			 * For OF framebuffers, first create the device for the boot display,
   582			 * then for the other framebuffers. Only fail for the boot display;
   583			 * ignore errors for the rest.
   584			 */
   585			for_each_node_by_type(node, "display") {
   586				if (!of_get_property(node, "linux,opened", NULL) ||
   587				    !of_get_property(node, "linux,boot-display", NULL))
   588					continue;
   589				dev = of_platform_device_create(node, "of-display", NULL);
   590				of_node_put(node);
   591				if (WARN_ON(!dev))
   592					return -ENOMEM;
   593				boot_display = node;
   594				display_number++;
   595				break;
   596			}
   597			for_each_node_by_type(node, "display") {
   598				char buf[14];
   599				const char *of_display_format = "of-display.%d";
   600	
   601				if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
   602					continue;
   603				ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
   604				if (ret < sizeof(buf))
   605					of_platform_device_create(node, buf, NULL);
   606			}
   607	
   608		} else {
   609			/*
   610			 * Handle certain compatibles explicitly, since we don't want to create
   611			 * platform_devices for every node in /reserved-memory with a
   612			 * "compatible",
   613			 */
   614			for_each_matching_node(node, reserved_mem_matches)
   615				of_platform_device_create(node, NULL, NULL);
   616	
   617			node = of_find_node_by_path("/firmware");
   618			if (node) {
   619				of_platform_populate(node, NULL, NULL, NULL);
   620				of_node_put(node);
   621			}
   622	
   623			node = of_get_compatible_child(of_chosen, "simple-framebuffer");
   624			if (node) {
   625				/*
   626				 * Since a "simple-framebuffer" device is already added
   627				 * here, disable the Generic System Framebuffers (sysfb)
   628				 * to prevent it from registering another device for the
   629				 * system framebuffer later (e.g: using the screen_info
   630				 * data that may had been filled as well).
   631				 *
   632				 * This can happen for example on DT systems that do EFI
   633				 * booting and may provide a GOP table to the EFI stub.
   634				 */
 > 635				sysfb_disable();
   636				of_platform_device_create(node, NULL, NULL);
   637				of_node_put(node);
   638			}
   639	
   640			/* Populate everything else. */
   641			of_platform_default_populate(NULL, NULL, NULL);
   642		}
   643	
   644		return 0;
   645	}
   646	arch_initcall_sync(of_platform_default_populate_init);
   647	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
