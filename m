Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65AB96A32D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B2D10E5DA;
	Tue,  3 Sep 2024 15:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxepmGAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56E10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725378439; x=1756914439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7EcydActpMSaA+SPWxDp1h3wd9kMVHEG/yenpXVGaz4=;
 b=PxepmGAMXZJvnIjNb15yaqewdk+yohRbI91HWM4vPcttsYbfqwcf5mpo
 wV5cCZtUuTGH+xq2TwEQKFC90qHtGIt6p+TRxzc6Nwx+xsNhPcd80bOfD
 tJLqGA0IpaZCvqqLgGKouiqQMcwfNgqNQk5blbkYIXRPfRENktL1ofQRo
 d+/5mG8dU2z9UUWcxWyDYu+4ZYF0A3I+hy7kWqaYkZonduW41wuineM6j
 M+2I/SOvVmaAJgccI3rgMd8TN1PB8MIbj5MVTP7fIhab2/j3GSeZ4iTOR
 /6Xx3UkOWlFmXkMIdODMGiRP7vXTFt2fDsg+GD8ASFTAe8yGjdkRuxUjA g==;
X-CSE-ConnectionGUID: ZcuODSZ2Q5yC8fbQQh6pkg==
X-CSE-MsgGUID: bUKYnMpTSxysw/izh3Ig3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24176679"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="24176679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:47:18 -0700
X-CSE-ConnectionGUID: ect5Q1kXRmWAmR9WPo/Gdg==
X-CSE-MsgGUID: vSr+q9uKQfKGWn/gw/DOuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="88202642"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2024 08:47:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1slVkO-0006qw-1G;
 Tue, 03 Sep 2024 15:47:12 +0000
Date: Tue, 3 Sep 2024 23:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <202409032359.jHPOaDBF-lkp@intel.com>
References: <20240901201118.3179206-3-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901201118.3179206-3-lanzano.alex@gmail.com>
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

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on drm-misc/drm-misc-next linus/master v6.11-rc6 next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Lanzano/dt-bindings-display-Add-Sharp-Memory-LCD-bindings/20240902-041405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240901201118.3179206-3-lanzano.alex%40gmail.com
patch subject: [PATCH v5 2/2] drm/tiny: Add driver for Sharp Memory LCD
config: x86_64-randconfig-102-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032359.jHPOaDBF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032359.jHPOaDBF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032359.jHPOaDBF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tiny/sharp-memory.c: In function 'sharp_memory_crtc_enable':
>> drivers/gpu/drm/tiny/sharp-memory.c:344:17: error: implicit declaration of function 'pwm_apply_state'; did you mean 'pwm_apply_args'? [-Werror=implicit-function-declaration]
     344 |                 pwm_apply_state(smd->pwm_vcom_signal, &pwm_state);
         |                 ^~~~~~~~~~~~~~~
         |                 pwm_apply_args
   cc1: some warnings being treated as errors


vim +344 drivers/gpu/drm/tiny/sharp-memory.c

   318	
   319	static void sharp_memory_crtc_enable(struct drm_crtc *crtc,
   320					     struct drm_atomic_state *state)
   321	{
   322		struct pwm_state pwm_state;
   323		struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
   324	
   325		sharp_memory_clear_display(smd);
   326	
   327		if (smd->enable_gpio)
   328			gpiod_set_value(smd->enable_gpio, 1);
   329	
   330		switch (smd->vcom_mode) {
   331		case SHARP_MEMORY_SOFTWARE_VCOM:
   332			smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
   333							  smd, "sw_vcom_signal");
   334			break;
   335	
   336		case SHARP_MEMORY_EXTERNAL_VCOM:
   337			break;
   338	
   339		case SHARP_MEMORY_PWM_VCOM:
   340			pwm_get_state(smd->pwm_vcom_signal, &pwm_state);
   341			pwm_state.period =    1000000000;
   342			pwm_state.duty_cycle = 100000000;
   343			pwm_state.enabled = true;
 > 344			pwm_apply_state(smd->pwm_vcom_signal, &pwm_state);
   345			break;
   346		}
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
