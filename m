Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80529C1CEE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 13:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1329A10E2EA;
	Fri,  8 Nov 2024 12:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGDMHdXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1170210E2EA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731068888; x=1762604888;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bOnSnfghil8eztkx0QAVOkK/Z5EvmrYIytE5HE9doqk=;
 b=NGDMHdXQKVrsN4EugnYNWUItpISuvRHJL7qOfaSgHZhAmuJEv7uJuaV/
 b4C7SjpujsQTBAdxX/KSwRGR0u4i95vnrgtiYA6bX1j9xTWvQB7f9rY1i
 H3HtQgYxTBxifvg+L3E/Sl8BEffsbRR7NBTvQYWYoSs6FtoXxEKuCxy5p
 oAAICAyopwtuEHGYOYbfwSJXzbV4w8D9XObs8GCBqNm4ClOwj65rYQxfK
 yxh2bRnt/McNbMv8MM6xHMrpcosPgZeFysH9XJp2eN7oMrfQ0rv8Cw7a+
 HeLBFSSSOcM247Eq6kLAMwwE4xaT93mIFf2+YkiLKa6sEgMkj7H4g8EFI g==;
X-CSE-ConnectionGUID: IcIdXyfLSgqqUKK/ql/eGw==
X-CSE-MsgGUID: oPB9/17wSuSf5zdRPsIziQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42347922"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="42347922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 04:28:08 -0800
X-CSE-ConnectionGUID: qk7/gN9KTX+KVphisCHoRw==
X-CSE-MsgGUID: mrjG7lpOQKmYWiTZko7N9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="85054673"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 08 Nov 2024 04:28:04 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t9O5q-000rPq-0C;
 Fri, 08 Nov 2024 12:28:02 +0000
Date: Fri, 8 Nov 2024 20:27:17 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 3/7] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202411082006.DB7Dlk06-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082006.DB7Dlk06-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082006.DB7Dlk06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082006.DB7Dlk06-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_client_setup.c:11:38: error: use of undeclared identifier 'CONFIG_DRM_CLIENT_DEFAULT'
      11 | static char drm_client_default[16] = CONFIG_DRM_CLIENT_DEFAULT;
         |                                      ^
>> drivers/gpu/drm/drm_client_setup.c:15:4: error: expected ';' after top level declarator
      15 |                  CONFIG_DRM_CLIENT_DEFAULT "]");
         |                  ^
   drivers/gpu/drm/drm_client_setup.c:33:6: error: redefinition of 'drm_client_setup'
      33 | void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
         |      ^
   include/drm/drm_client_setup.h:16:20: note: previous definition is here
      16 | static inline void drm_client_setup(struct drm_device *dev,
         |                    ^
   drivers/gpu/drm/drm_client_setup.c:55:6: error: redefinition of 'drm_client_setup_with_fourcc'
      55 | void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
         |      ^
   include/drm/drm_client_setup.h:19:20: note: previous definition is here
      19 | static inline void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
         |                    ^
   drivers/gpu/drm/drm_client_setup.c:72:6: error: redefinition of 'drm_client_setup_with_color_mode'
      72 | void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode)
         |      ^
   include/drm/drm_client_setup.h:21:20: note: previous definition is here
      21 | static inline void drm_client_setup_with_color_mode(struct drm_device *dev,
         |                    ^
   5 errors generated.


vim +/CONFIG_DRM_CLIENT_DEFAULT +11 drivers/gpu/drm/drm_client_setup.c

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
