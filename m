Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2EB3FDBE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496ED10E328;
	Tue,  2 Sep 2025 11:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9xYIMU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4A510E673
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756812294; x=1788348294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rnzaOQuxTScDn7ysIBToMNNj9BiNuSVPElmId2+/0Xo=;
 b=H9xYIMU43nMhibphcLxFfhAPIBRp1jqbDyh+TrR/jPkNITZe4YcwhLHG
 ukx15zov4Hnwqu3Q3ifb/UVIeE8u3zTpAsDOueYOyN+WBVhinKg8aKaSP
 kxtYGZgvFaenqM2Y8cccrF5FeJWYt9pxPFkJhDwpvD9d1xOGVjP3fmmet
 RbZDQWJM/TNPqSY2IFY7WeQ742XhloXGFZ4L3yHiy0OSY1eHs9BZHpY4T
 FEHKN2dM4if/UsEjCaaCWVXi0lE8Rn355QZaBiqDm0OLyutOdl14STGLA
 wBfGnWxxn5KFweIJTKRm3C7gKbBz97Eddc31Fdnnukpafhg+7MlrHAmqY w==;
X-CSE-ConnectionGUID: Au0Ey6EhSBKr500aXsXkqQ==
X-CSE-MsgGUID: b9GytrePS+WTYHa6EpuSXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59017757"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59017757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 04:24:54 -0700
X-CSE-ConnectionGUID: OPoOrR7OTGCtVWqxtm+8pg==
X-CSE-MsgGUID: 60cEhCt6QYqf1a2wIiS0kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171411846"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 02 Sep 2025 04:24:51 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1utP83-0001tb-2j;
 Tue, 02 Sep 2025 11:24:47 +0000
Date: Tue, 2 Sep 2025 19:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 3/3] drm/panel: visionox-rm69299: Add backlight support
Message-ID: <202509021907.mZZ38HtR-lkp@intel.com>
References: <20250901-shift6mq-panel-v1-3-444b4abbfaea@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-shift6mq-panel-v1-3-444b4abbfaea@sigxcpu.org>
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

Hi Guido,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b320789d6883cc00ac78ce83bccbfe7ed58afcf0]

url:    https://github.com/intel-lab-lkp/linux/commits/Guido-G-nther/drm-panel-visionox-rm69299-Fix-clock-frequency-for-SHIFT6mq/20250901-222400
base:   b320789d6883cc00ac78ce83bccbfe7ed58afcf0
patch link:    https://lore.kernel.org/r/20250901-shift6mq-panel-v1-3-444b4abbfaea%40sigxcpu.org
patch subject: [PATCH 3/3] drm/panel: visionox-rm69299: Add backlight support
config: x86_64-randconfig-123-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021907.mZZ38HtR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021907.mZZ38HtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021907.mZZ38HtR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-visionox-rm69299.c:341:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/panel/panel-visionox-rm69299.c:411:42: sparse: sparse: symbol 'visionox_rm69299_1080p_display_desc' was not declared. Should it be static?
   drivers/gpu/drm/panel/panel-visionox-rm69299.c:417:42: sparse: sparse: symbol 'visionox_rm69299_shift_desc' was not declared. Should it be static?

vim +341 drivers/gpu/drm/panel/panel-visionox-rm69299.c

   329	
   330	static struct backlight_device *
   331	visionox_rm69299_create_backlight(struct visionox_rm69299 *ctx)
   332	{
   333		struct device *dev = &ctx->dsi->dev;
   334		const struct backlight_properties props = {
   335			.type = BACKLIGHT_RAW,
   336			.brightness = ctx->desc->initial_brightness,
   337			.max_brightness = ctx->desc->max_brightness,
   338		};
   339	
   340		if (!ctx->desc->max_brightness)
 > 341			return 0;
   342	
   343		return devm_backlight_device_register(dev, dev_name(dev), dev, ctx->dsi,
   344						      &visionox_rm69299_bl_ops,
   345						      &props);
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
