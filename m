Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3FB8B198
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 21:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE0910EA81;
	Fri, 19 Sep 2025 19:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/1XrRAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21B10EA79
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758310771; x=1789846771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pfrlJV7xT9mCTFBKlTyzmehnciaaG4sFS0+gOJkLiU8=;
 b=K/1XrRAeUj4h01+D0mmxvPSUrPdhV6GDSSyCUxqzipVoYyZTjajnMStw
 zfnIU9kbWTWNrhJIMtisdR10ISDzHBXn6UEUrMONSaiFCi/oG6WafQaKU
 Nz83AW/Xd+J9naaL09dUc9NMyR2FLYw4ovDlN0bU8eptz+u1r+wtzX6uK
 kunYyXQsvMec/MmIXrQWr7uWBQpvy37JWS3i9bg05Z8yEu54Q02qtf2Zw
 E0W1bP7LjdkyzBe7VYEOft+zjGPumhuIKoUK6tOUXMakeg55qOpB/4g7/
 HEJks/oOO94HMeRqXdxzjva0CZgJ0HmL7c1l4UBCAsO1A1zPHLyXFqp8r Q==;
X-CSE-ConnectionGUID: ExjvMD7kQ3++2ZCI9bXULA==
X-CSE-MsgGUID: jWPdQhTkS228YpmOqZ6rfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64465238"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64465238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 12:39:31 -0700
X-CSE-ConnectionGUID: NGydXMcGToenjZurbbPepw==
X-CSE-MsgGUID: SonlgQ+oRPexgrdvb3MD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175717300"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 19 Sep 2025 12:39:21 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uzgww-0004kd-1C;
 Fri, 19 Sep 2025 19:39:18 +0000
Date: Sat, 20 Sep 2025 03:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sjakhade@cadence.com, yamonkar@cadence.com,
 lumag@kernel.org, dianders@chromium.org, jani.nikula@intel.com,
 luca.ceresoli@bootlin.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, tomi.valkeinen@ideasonboard.com
Cc: oe-kbuild-all@lists.linux.dev, h-shenoy@ti.com
Subject: Re: [PATCH v5 2/2] drm: bridge: cdns-mhdp8546: Add support for DSC
 and FEC
Message-ID: <202509200323.OEAahLBT-lkp@intel.com>
References: <20250915103041.3891448-3-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915103041.3891448-3-h-shenoy@ti.com>
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

Hi Harikrishna,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on drm-misc/drm-misc-next linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harikrishna-Shenoy/dt-bindings-drm-bridge-MHDP8546-bridge-binding-changes-for-DSC/20250915-183321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250915103041.3891448-3-h-shenoy%40ti.com
patch subject: [PATCH v5 2/2] drm: bridge: cdns-mhdp8546: Add support for DSC and FEC
config: arm64-randconfig-002-20250919 (https://download.01.org/0day-ci/archive/20250920/202509200323.OEAahLBT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200323.OEAahLBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200323.OEAahLBT-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.o: in function `cdns_mhdp_dsc_write_enc_config':
>> cdns-mhdp8546-dsc.c:(.text+0x2f0): undefined reference to `drm_dsc_flatness_det_thresh'
   aarch64-linux-ld: drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.o: in function `cdns_mhdp_compute_dsc_params':
>> cdns-mhdp8546-dsc.c:(.text+0x91c): undefined reference to `drm_dsc_set_const_params'
>> aarch64-linux-ld: cdns-mhdp8546-dsc.c:(.text+0x924): undefined reference to `drm_dsc_set_rc_buf_thresh'
>> aarch64-linux-ld: cdns-mhdp8546-dsc.c:(.text+0x930): undefined reference to `drm_dsc_setup_rc_params'
>> aarch64-linux-ld: cdns-mhdp8546-dsc.c:(.text+0x940): undefined reference to `drm_dsc_initial_scale_value'
>> aarch64-linux-ld: cdns-mhdp8546-dsc.c:(.text+0x954): undefined reference to `drm_dsc_compute_rc_parameters'
   aarch64-linux-ld: drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.o: in function `cdns_mhdp_dsc_send_pps_sdp':
>> cdns-mhdp8546-dsc.c:(.text+0xa44): undefined reference to `drm_dsc_dp_pps_header_init'
>> aarch64-linux-ld: cdns-mhdp8546-dsc.c:(.text+0xa54): undefined reference to `drm_dsc_pps_payload_pack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
