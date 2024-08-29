Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B069650CE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2ED10E1A0;
	Thu, 29 Aug 2024 20:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AK0J9m4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF6110E1A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 20:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724963860; x=1756499860;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fxcB938H0LwYyhyqYxB2W8ezRIsDKqhYiX4GXWISLk8=;
 b=AK0J9m4VoUNH9SRF4SXIToa5h6mp2dH6g/pVAM0XUPLlkJ37fUj698Oz
 GagN6p7tjSMNycp2AS1S6HMKDbcSw9hYdjrcUNwcXLy5QqRa70mv1pwwO
 WaPLJdxro1Py+5DbXcl6tgkAaVOAPVWGpRZHsCaImpjZq7PQGsG1MbDoU
 q2aq8O8xmNPaxVe3td9zLu+v0xzfF/W7NUsRKaM8o5YorvZ30S0UEY8kV
 Gf1IkvdSdQO7xtZDIqzcTzg1ErKZemdNl5dv3nnXuYwf4gRZ0ygfOX+LT
 QNTsQlSJ7xO84LtrybyhE7NFjFS6DBNTTnL+FdQMZFD/4tHrXSHdGfstq Q==;
X-CSE-ConnectionGUID: x4nL/7zVSB+8NHemhvhqig==
X-CSE-MsgGUID: xlTp+/KWTs+kiuoJUGj8PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23103023"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23103023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 13:37:40 -0700
X-CSE-ConnectionGUID: qiDW+UmLSGyady4YGGMzhQ==
X-CSE-MsgGUID: f+GjeGLQTM21nR3e8uBXjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68082240"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 29 Aug 2024 13:37:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sjltg-0000iQ-0A;
 Thu, 29 Aug 2024 20:37:36 +0000
Date: Fri, 30 Aug 2024 04:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, kraxel@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/10] drm/bochs: Validate display modes against
 available video memory
Message-ID: <202408300420.qcGOiIM6-lkp@intel.com>
References: <20240823124422.286989-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823124422.286989-10-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc5 next-20240829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-bochs-Remove-manual-format-test-from-fb_create/20240826-131701
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240823124422.286989-10-tzimmermann%40suse.de
patch subject: [PATCH 09/10] drm/bochs: Validate display modes against available video memory
config: i386-randconfig-006-20240829 (https://download.01.org/0day-ci/archive/20240830/202408300420.qcGOiIM6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300420.qcGOiIM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300420.qcGOiIM6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/tiny/bochs.o: in function `bochs_mode_config_mode_valid':
>> drivers/gpu/drm/tiny/bochs.c:574: undefined reference to `__udivdi3'


vim +574 drivers/gpu/drm/tiny/bochs.c

   560	
   561	static enum drm_mode_status bochs_mode_config_mode_valid(struct drm_device *dev,
   562								 const struct drm_display_mode *mode)
   563	{
   564		struct bochs_device *bochs = to_bochs_device(dev);
   565		const struct drm_format_info *format = drm_format_info(DRM_FORMAT_XRGB8888);
   566		uint64_t pitch;
   567	
   568		if (drm_WARN_ON(dev, !format))
   569			return MODE_ERROR;
   570	
   571		pitch = drm_format_info_min_pitch(format, 0, mode->vdisplay);
   572		if (!pitch)
   573			return MODE_BAD_WIDTH;
 > 574		if (bochs->fb_size / pitch < mode->hdisplay)
   575			return MODE_MEM;
   576	
   577		return MODE_OK;
   578	}
   579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
