Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC786CC8B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD6210E496;
	Thu, 29 Feb 2024 15:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FuVzOpCX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A4610E495
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709219558; x=1740755558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hS3oRDkgcCI4XD5/ymHvl8mYvsN6LWJ2l6plGFrYmJ4=;
 b=FuVzOpCXrRf6nC8m2T7W8jpl5S093JxYqI7kjiY42M8439n4j1hpoF0P
 4PYL/eq7n5vCQaLpCYJNlujEEb79SjDMsX8VrS90aQz+wbbBy53oiQOQe
 vBS1Ly3BotaEmCX/FQijcq6FJ/Yt0eal2AUoCshScX4KjKzI7xrptwQlA
 Cr1Njo1FJ647oCnQ1XPXXf4JW1J+USXDZHt13E4dR0buFBdjN/GaZj8Ok
 CNz9iLpjY6R+C6lfNieEz7WUserdXc66PUmbFJkU2TjY2D1W+tXyazesa
 dMkU39aByRpD3BHpfbiApUZVX/PUTtlVVZkzg/mm6tQOQFGOiKhstWyFu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3860374"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3860374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 07:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38697370"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 29 Feb 2024 07:12:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rfi4y-000D1f-1a;
 Thu, 29 Feb 2024 15:12:12 +0000
Date: Thu, 29 Feb 2024 23:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v8 4/8] drm/fb_dma: Add generic set_scanout_buffer() for
 drm_panic
Message-ID: <202402292348.4l5K5ZmN-lkp@intel.com>
References: <20240227100459.194478-5-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227100459.194478-5-jfalempe@redhat.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on bfa4437fd3938ae2e186e7664b2db65bb8775670]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20240227-185901
base:   bfa4437fd3938ae2e186e7664b2db65bb8775670
patch link:    https://lore.kernel.org/r/20240227100459.194478-5-jfalempe%40redhat.com
patch subject: [PATCH v8 4/8] drm/fb_dma: Add generic set_scanout_buffer() for drm_panic
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240229/202402292348.4l5K5ZmN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292348.4l5K5ZmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292348.4l5K5ZmN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/pl111/pl111_display.c:18:
>> include/drm/drm_fb_dma_helper.h:23:46: warning: declaration of 'struct drm_plane' will not be visible outside of this function [-Wvisibility]
   void drm_panic_gem_set_scanout_buffer(struct drm_plane *plane,
                                                ^
   1 warning generated.


vim +23 include/drm/drm_fb_dma_helper.h

    11	
    12	struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
    13		unsigned int plane);
    14	
    15	dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
    16					   struct drm_plane_state *state,
    17					   unsigned int plane);
    18	
    19	void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
    20					  struct drm_plane_state *old_state,
    21					  struct drm_plane_state *state);
    22	
  > 23	void drm_panic_gem_set_scanout_buffer(struct drm_plane *plane,
    24					     struct drm_framebuffer *fb);
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
