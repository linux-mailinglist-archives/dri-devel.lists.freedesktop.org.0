Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A5299F7D7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 22:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD1D10E602;
	Tue, 15 Oct 2024 20:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvppcI9V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053D210E602
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 20:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729022752; x=1760558752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dX1g8jSzU+VXezh2f98dU2JeKi1rg/GRDajYDlMn9PA=;
 b=AvppcI9VCI+6ZNsxOmhnG2LshdDcx1VapiAdQC5YdiUr1PWGB3gJxJFr
 Xb5AUkP0pRbGJimZICe0svgb4SOJmPq4EqzV1gFJSyZF8rpDMjjzkm8U/
 brgE6DqFcphnZ24CsnJoMmiPcSeYaf1roMyRBEG7JlpB4hFSr4LVV3KJi
 jxk1KdY6L2xpjBm2ACdJD+Nrj19ngepc0B8a6smIxN3ZHfgtzq0kqYQDz
 04AkJwvQGkaETQsQx9sJqmeD2Sd15H26wkUhhkGL8w4S+j9Pr86FyekVP
 XEt9MV/GpHs/a8wT9f0w3ksHmSmGv1WQnjKmzUbewq2YEwB/cz77bmCdP g==;
X-CSE-ConnectionGUID: w2uhAli6RBm1l8swNKDVZA==
X-CSE-MsgGUID: jtzJAmweTt2384orG6JnYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28230126"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28230126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 13:05:52 -0700
X-CSE-ConnectionGUID: 1C/qME2AT76iW7Hx1up+UA==
X-CSE-MsgGUID: bI9P401BTACr5r2atWDXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78834721"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 15 Oct 2024 13:05:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t0nnd-000JsT-2V;
 Tue, 15 Oct 2024 20:05:45 +0000
Date: Wed, 16 Oct 2024 04:05:02 +0800
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 3/7] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202410160342.rkkekxWK-lkp@intel.com>
References: <20241011105526.615812-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011105526.615812-4-jfalempe@redhat.com>
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

[auto build test ERROR on 33c255312660653cf54f8019896b5dca28e3c580]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-client-squash-of-drm-client-pending-series/20241011-225715
base:   33c255312660653cf54f8019896b5dca28e3c580
patch link:    https://lore.kernel.org/r/20241011105526.615812-4-jfalempe%40redhat.com
patch subject: [PATCH v4 3/7] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410160342.rkkekxWK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160342.rkkekxWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160342.rkkekxWK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_log.c:347:6: error: redefinition of 'drm_log_register'
     347 | void drm_log_register(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/drm_log.c:21:
   drivers/gpu/drm/drm_log.h:8:20: note: previous definition of 'drm_log_register' with type 'void(struct drm_device *)'
       8 | static inline void drm_log_register(struct drm_device *dev) {}
         |                    ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/drm_log_register +347 drivers/gpu/drm/drm_log.c

   342	
   343	/**
   344	 * drm_log_register() - Register a drm device to drm_log
   345	 * @dev: the drm device to register.
   346	 */
 > 347	void drm_log_register(struct drm_device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
