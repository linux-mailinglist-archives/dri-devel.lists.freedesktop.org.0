Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96C9C1C7B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 12:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C1E10E25B;
	Fri,  8 Nov 2024 11:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l18ylfOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A945A10E25B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731067026; x=1762603026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EveuqbByIvqeTP/6ObYua5o0CjnfvPp/1xNR6BVpaRo=;
 b=l18ylfOQULh5dugGVyRHQcmxcJo1qU6h4V6tvLSTy4eK0EkZ3xHAIUpm
 U7+ap1jsuNrEOiA42bQ1Xj/z+6MKOjoeAmcL9WmOZ+CyIqnLhPa6LPnA9
 cmpcMlDPfrDkJdrppbiFZWHtdU5VA/nhX+qTAxeumBa5hiisnscqRcvHk
 JxTzVOnKSiENVYYTlQrVdTZG0R7oW71fdv7sXWIllkdmc9U3QyQ/01Wx/
 Q7tCYiKR9ovBfn4C19jwHNTG8kxmIXsqQITWne6fGLOgIBFRMdO+fcl+5
 DjXptCdJuwd7B6jWwr++4wgf8FXtQvAwcmm87PvaVFaTcoTPvNAmxkNb5 w==;
X-CSE-ConnectionGUID: VrqXPARGTvCnc1jj1aEomA==
X-CSE-MsgGUID: v8IGYYomRMWZtY1q5/XSTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30802181"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30802181"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 03:57:05 -0800
X-CSE-ConnectionGUID: /EEMz8mmTO++jIhQBgkzKQ==
X-CSE-MsgGUID: 7rX4ZepGT3G09oCq+RqpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="85756919"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 08 Nov 2024 03:57:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t9Nbn-000rNy-0H;
 Fri, 08 Nov 2024 11:56:59 +0000
Date: Fri, 8 Nov 2024 19:56:21 +0800
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
Subject: Re: [PATCH v7 2/7] drm/client: Always select DRM_CLIENT_LIB
Message-ID: <202411081923.vkZSFxL2-lkp@intel.com>
References: <20241108082025.1004653-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108082025.1004653-3-jfalempe@redhat.com>
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
patch link:    https://lore.kernel.org/r/20241108082025.1004653-3-jfalempe%40redhat.com
patch subject: [PATCH v7 2/7] drm/client: Always select DRM_CLIENT_LIB
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241108/202411081923.vkZSFxL2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081923.vkZSFxL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081923.vkZSFxL2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_client_setup.c:25:6: error: redefinition of 'drm_client_setup'
      25 | void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_client_setup.c:3:
   include/drm/drm_client_setup.h:16:20: note: previous definition of 'drm_client_setup' with type 'void(struct drm_device *, const struct drm_format_info *)'
      16 | static inline void drm_client_setup(struct drm_device *dev,
         |                    ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_client_setup.c:43:6: error: redefinition of 'drm_client_setup_with_fourcc'
      43 | void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_client_setup.c:3:
   include/drm/drm_client_setup.h:19:20: note: previous definition of 'drm_client_setup_with_fourcc' with type 'void(struct drm_device *, u32)' {aka 'void(struct drm_device *, unsigned int)'}
      19 | static inline void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_client_setup.c:60:6: error: redefinition of 'drm_client_setup_with_color_mode'
      60 | void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_client_setup.c:3:
   include/drm/drm_client_setup.h:21:20: note: previous definition of 'drm_client_setup_with_color_mode' with type 'void(struct drm_device *, unsigned int)'
      21 | static inline void drm_client_setup_with_color_mode(struct drm_device *dev,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_client_setup +25 drivers/gpu/drm/drm_client_setup.c

d07fdf9225922d Thomas Zimmermann 2024-09-24   8  
d07fdf9225922d Thomas Zimmermann 2024-09-24   9  /**
d07fdf9225922d Thomas Zimmermann 2024-09-24  10   * drm_client_setup() - Setup in-kernel DRM clients
d07fdf9225922d Thomas Zimmermann 2024-09-24  11   * @dev: DRM device
d07fdf9225922d Thomas Zimmermann 2024-09-24  12   * @format: Preferred pixel format for the device. Use NULL, unless
d07fdf9225922d Thomas Zimmermann 2024-09-24  13   *          there is clearly a driver-preferred format.
d07fdf9225922d Thomas Zimmermann 2024-09-24  14   *
d07fdf9225922d Thomas Zimmermann 2024-09-24  15   * This function sets up the in-kernel DRM clients. Restore, hotplug
d07fdf9225922d Thomas Zimmermann 2024-09-24  16   * events and teardown are all taken care of.
d07fdf9225922d Thomas Zimmermann 2024-09-24  17   *
d07fdf9225922d Thomas Zimmermann 2024-09-24  18   * Drivers should call drm_client_setup() after registering the new
d07fdf9225922d Thomas Zimmermann 2024-09-24  19   * DRM device with drm_dev_register(). This function is safe to call
d07fdf9225922d Thomas Zimmermann 2024-09-24  20   * even when there are no connectors present. Setup will be retried
d07fdf9225922d Thomas Zimmermann 2024-09-24  21   * on the next hotplug event.
d07fdf9225922d Thomas Zimmermann 2024-09-24  22   *
d07fdf9225922d Thomas Zimmermann 2024-09-24  23   * The clients are destroyed by drm_dev_unregister().
d07fdf9225922d Thomas Zimmermann 2024-09-24  24   */
d07fdf9225922d Thomas Zimmermann 2024-09-24 @25  void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
d07fdf9225922d Thomas Zimmermann 2024-09-24  26  {
d07fdf9225922d Thomas Zimmermann 2024-09-24  27  	int ret;
d07fdf9225922d Thomas Zimmermann 2024-09-24  28  
d07fdf9225922d Thomas Zimmermann 2024-09-24  29  	ret = drm_fbdev_client_setup(dev, format);
d07fdf9225922d Thomas Zimmermann 2024-09-24  30  	if (ret)
d07fdf9225922d Thomas Zimmermann 2024-09-24  31  		drm_warn(dev, "Failed to set up DRM client; error %d\n", ret);
d07fdf9225922d Thomas Zimmermann 2024-09-24  32  }
d07fdf9225922d Thomas Zimmermann 2024-09-24  33  EXPORT_SYMBOL(drm_client_setup);
d07fdf9225922d Thomas Zimmermann 2024-09-24  34  
d07fdf9225922d Thomas Zimmermann 2024-09-24  35  /**
d07fdf9225922d Thomas Zimmermann 2024-09-24  36   * drm_client_setup_with_fourcc() - Setup in-kernel DRM clients for color mode
d07fdf9225922d Thomas Zimmermann 2024-09-24  37   * @dev: DRM device
d07fdf9225922d Thomas Zimmermann 2024-09-24  38   * @fourcc: Preferred pixel format as 4CC code for the device
d07fdf9225922d Thomas Zimmermann 2024-09-24  39   *
d07fdf9225922d Thomas Zimmermann 2024-09-24  40   * This function sets up the in-kernel DRM clients. It is equivalent
d07fdf9225922d Thomas Zimmermann 2024-09-24  41   * to drm_client_setup(), but expects a 4CC code as second argument.
d07fdf9225922d Thomas Zimmermann 2024-09-24  42   */
d07fdf9225922d Thomas Zimmermann 2024-09-24 @43  void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
d07fdf9225922d Thomas Zimmermann 2024-09-24  44  {
d07fdf9225922d Thomas Zimmermann 2024-09-24  45  	drm_client_setup(dev, drm_format_info(fourcc));
d07fdf9225922d Thomas Zimmermann 2024-09-24  46  }
d07fdf9225922d Thomas Zimmermann 2024-09-24  47  EXPORT_SYMBOL(drm_client_setup_with_fourcc);
d07fdf9225922d Thomas Zimmermann 2024-09-24  48  
d07fdf9225922d Thomas Zimmermann 2024-09-24  49  /**
d07fdf9225922d Thomas Zimmermann 2024-09-24  50   * drm_client_setup_with_color_mode() - Setup in-kernel DRM clients for color mode
d07fdf9225922d Thomas Zimmermann 2024-09-24  51   * @dev: DRM device
d07fdf9225922d Thomas Zimmermann 2024-09-24  52   * @color_mode: Preferred color mode for the device
d07fdf9225922d Thomas Zimmermann 2024-09-24  53   *
d07fdf9225922d Thomas Zimmermann 2024-09-24  54   * This function sets up the in-kernel DRM clients. It is equivalent
d07fdf9225922d Thomas Zimmermann 2024-09-24  55   * to drm_client_setup(), but expects a color mode as second argument.
d07fdf9225922d Thomas Zimmermann 2024-09-24  56   *
d07fdf9225922d Thomas Zimmermann 2024-09-24  57   * Do not use this function in new drivers. Prefer drm_client_setup() with a
d07fdf9225922d Thomas Zimmermann 2024-09-24  58   * format of NULL.
d07fdf9225922d Thomas Zimmermann 2024-09-24  59   */
d07fdf9225922d Thomas Zimmermann 2024-09-24 @60  void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode)
d07fdf9225922d Thomas Zimmermann 2024-09-24  61  {
d07fdf9225922d Thomas Zimmermann 2024-09-24  62  	u32 fourcc = drm_driver_color_mode_format(dev, color_mode);
d07fdf9225922d Thomas Zimmermann 2024-09-24  63  
d07fdf9225922d Thomas Zimmermann 2024-09-24  64  	drm_client_setup_with_fourcc(dev, fourcc);
d07fdf9225922d Thomas Zimmermann 2024-09-24  65  }
d07fdf9225922d Thomas Zimmermann 2024-09-24  66  EXPORT_SYMBOL(drm_client_setup_with_color_mode);
dadd28d4142f9a Thomas Zimmermann 2024-10-14  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
