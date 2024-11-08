Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DEC9C1DA1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 14:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADCA10E98E;
	Fri,  8 Nov 2024 13:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+tf6WVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2600510E98E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731071349; x=1762607349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=61vvWGL0UpYowW9YO69YIiDWIsi7Qdruyw3F3U/nxTo=;
 b=I+tf6WVH7FI3PjL1l3puFUb+c7sMCgOpD1vC4MogmQOky/FD2pwZJ1e+
 IGpfmnUrT1YFcMnwkdvbOyobO/m7osG2VvHU5ONZyNd+HIRh7kt8MjULm
 CNh+rqO1HA50Ct+BYvNB18QDMHVTayqHz0Kg9yo8K0OKonrgUA6BXTL/p
 dzcYsQE0a17fvlSsDxpOrFeiNaTxCPBFVhGo+x0g5HSGLKIGAX3biDSFp
 PhbZYDm5masqu5fCeyMReOwbHe9HyCBiLh/NsPzEHz7vaItMmaA1+JKw5
 OGCu23X/or8f27knns8v6vUnaDeSapXRqHNgCizMHrF0yFio1QFn/EF+s g==;
X-CSE-ConnectionGUID: NGUA7APGQwiRlHz9Y6fG6w==
X-CSE-MsgGUID: wrHC8xUdRR+K0Kyg86hXUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53514383"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53514383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 05:09:09 -0800
X-CSE-ConnectionGUID: hcTWoXcFRGmvNlip2Riz+Q==
X-CSE-MsgGUID: K4ZycnqFTMKtahPn8K5cyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85652998"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 08 Nov 2024 05:09:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t9OjW-000rRa-2c;
 Fri, 08 Nov 2024 13:09:02 +0000
Date: Fri, 8 Nov 2024 21:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 3/7] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202411082034.Lnxy55Wm-lkp@intel.com>
References: <20241108082025.1004653-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108082025.1004653-4-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on baf4afc5831438b35de4b0e951b9cd58435a6d99]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Move-drawing-functions-to-drm_draw/20241108-162222
base:   baf4afc5831438b35de4b0e951b9cd58435a6d99
patch link:    https://lore.kernel.org/r/20241108082025.1004653-4-jfalempe%40redhat.com
patch subject: [PATCH v7 3/7] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241108/202411082034.Lnxy55Wm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082034.Lnxy55Wm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082034.Lnxy55Wm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_client_setup.c:11:38: error: 'CONFIG_DRM_CLIENT_DEFAULT' undeclared here (not in a function); did you mean 'CONFIG_DRM_CLIENT_LIB'?
      11 | static char drm_client_default[16] = CONFIG_DRM_CLIENT_DEFAULT;
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      CONFIG_DRM_CLIENT_LIB
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/drm_client_setup.c:7:
>> drivers/gpu/drm/drm_client_setup.c:15:18: error: expected ',' or ';' before 'CONFIG_DRM_CLIENT_DEFAULT'
      15 |                  CONFIG_DRM_CLIENT_DEFAULT "]");
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   drivers/gpu/drm/drm_client_setup.c:13:1: note: in expansion of macro 'MODULE_PARM_DESC'
      13 | MODULE_PARM_DESC(client,
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_client_setup.c:33:6: error: redefinition of 'drm_client_setup'
      33 | void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_client_setup.c:3:
   include/drm/drm_client_setup.h:16:20: note: previous definition of 'drm_client_setup' with type 'void(struct drm_device *, const struct drm_format_info *)'
      16 | static inline void drm_client_setup(struct drm_device *dev,
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_client_setup.c:55:6: error: redefinition of 'drm_client_setup_with_fourcc'
      55 | void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_client_setup.c:3:
   include/drm/drm_client_setup.h:19:20: note: previous definition of 'drm_client_setup_with_fourcc' with type 'void(struct drm_device *, u32)' {aka 'void(struct drm_device *, unsigned int)'}
      19 | static inline void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_client_setup.c:72:6: error: redefinition of 'drm_client_setup_with_color_mode'
      72 | void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_client_setup.c:3:
   include/drm/drm_client_setup.h:21:20: note: previous definition of 'drm_client_setup_with_color_mode' with type 'void(struct drm_device *, unsigned int)'
      21 | static inline void drm_client_setup_with_color_mode(struct drm_device *dev,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +11 drivers/gpu/drm/drm_client_setup.c

    10	
  > 11	static char drm_client_default[16] = CONFIG_DRM_CLIENT_DEFAULT;
    12	module_param_string(client, drm_client_default, sizeof(drm_client_default), 0444);
    13	MODULE_PARM_DESC(client,
    14			 "Choose which drm client to start, default is"
  > 15			 CONFIG_DRM_CLIENT_DEFAULT "]");
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
