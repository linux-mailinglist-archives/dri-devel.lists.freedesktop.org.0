Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5150C874788
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 06:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A934810EE73;
	Thu,  7 Mar 2024 05:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN0Ye787";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553410EE09;
 Thu,  7 Mar 2024 05:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709788069; x=1741324069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cggzLAZej7awXNRmFV5vavIo22uqi6JqcJGbrKIh6B4=;
 b=XN0Ye787XIc4j9c5JUU1e3hGPGBIac4brePvWbYBfj4xl2JASNBPdnj0
 jdsP5WG2WDf5SDDjvGsLHLRusyYXGqmGpbHxWIFzc/Wl+JdTk0hH4Rg4l
 Tu3Gdhbt9s0jDlBY+tiBiiNMuFaBWAoIoC/nNM7GeXfu7QIiUI+hvm2aW
 ZBW1Kn+xd9mEUZEd7mr4U4gwQvocaUBmG7/EPoriUeHvsslwHUBUzcVG0
 BZe2V3gzBqMgXOS8k9VIw21YfG2bBc55XNThVqb/xy/azUSi9UH8DbmIX
 g8Qy+JfPQ+pUVMM8INjoCyZAaB8dvuu3Ln5noVhtZZ5YeVTrlu1mAmOzX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8264786"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8264786"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 21:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="40878686"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 06 Mar 2024 21:07:44 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ri5yn-0004pB-38;
 Thu, 07 Mar 2024 05:07:41 +0000
Date: Thu, 7 Mar 2024 13:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 22/22] drm: ensure drm headers are self-contained and
 pass kernel-doc
Message-ID: <202403071204.gJtMneoq-lkp@intel.com>
References: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc7 next-20240306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-crtc-make-drm_crtc_internal-h-self-contained/20240307-023603
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula%40intel.com
patch subject: [PATCH 22/22] drm: ensure drm headers are self-contained and pass kernel-doc
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403071204.gJtMneoq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071204.gJtMneoq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071204.gJtMneoq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/./drm_crtc_internal.h: In function 'drm_edid_load_firmware':
>> drivers/gpu/drm/./drm_crtc_internal.h:304:16: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
     304 |         return ERR_PTR(-ENOENT);
         |                ^~~~~~~
>> drivers/gpu/drm/./drm_crtc_internal.h:304:25: error: 'ENOENT' undeclared (first use in this function)
     304 |         return ERR_PTR(-ENOENT);
         |                         ^~~~~~
   drivers/gpu/drm/./drm_crtc_internal.h:304:25: note: each undeclared identifier is reported only once for each function it appears in
   In file included from <command-line>:
   drivers/gpu/drm/./drm_crtc_internal.h: At top level:
>> drivers/gpu/drm/./drm_crtc_internal.h:302:1: error: redefinition of 'drm_edid_load_firmware'
     302 | drm_edid_load_firmware(struct drm_connector *connector)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/./drm_crtc_internal.h:302:1: note: previous definition of 'drm_edid_load_firmware' with type 'const struct drm_edid *(struct drm_connector *)'
     302 | drm_edid_load_firmware(struct drm_connector *connector)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/./drm_crtc_internal.h: In function 'drm_edid_load_firmware':
>> drivers/gpu/drm/./drm_crtc_internal.h:304:25: error: 'ENOENT' undeclared (first use in this function)
     304 |         return ERR_PTR(-ENOENT);
         |                         ^~~~~~
   cc1: all warnings being treated as errors


vim +/ERR_PTR +304 drivers/gpu/drm/./drm_crtc_internal.h

5f2d0ed49036a0 Jani Nikula 2022-10-24  296  
5f2d0ed49036a0 Jani Nikula 2022-10-24  297  /* drm_edid_load.c */
5f2d0ed49036a0 Jani Nikula 2022-10-24  298  #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
5f2d0ed49036a0 Jani Nikula 2022-10-24  299  const struct drm_edid *drm_edid_load_firmware(struct drm_connector *connector);
5f2d0ed49036a0 Jani Nikula 2022-10-24  300  #else
5f2d0ed49036a0 Jani Nikula 2022-10-24  301  static inline const struct drm_edid *
5f2d0ed49036a0 Jani Nikula 2022-10-24 @302  drm_edid_load_firmware(struct drm_connector *connector)
5f2d0ed49036a0 Jani Nikula 2022-10-24  303  {
5f2d0ed49036a0 Jani Nikula 2022-10-24 @304  	return ERR_PTR(-ENOENT);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
