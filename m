Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D247E087D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 19:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31AA10E194;
	Fri,  3 Nov 2023 18:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17CE10E194
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699037577; x=1730573577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FUKrPrknzJBUx7Qf7VVVxE/xOcUXFn0VKOBucLzHjIQ=;
 b=aAeUiCxFzjHZqik0XLLcLHbc1UKevX8OkiGoATZgYgZtUuxnF9r51+Rs
 UoTdlMQ1LURX7/FISktSt1lvIsHHAbz3LZb7JiJxJGSCDCCk+B4WpzT54
 6OhRIexIyQuRFwaCWB7gF9TT/600qbs1/1RyEgIBOrRqQ1UxNuQjyhVWX
 sn+TI7f30gGnEH7aopoc8Hs4PAlssS2w90MgEyMtv7qJmyErK5tgu+PTN
 koh9fgFArRXv/Uq5Vo2APHVFEIfkADpzP2uBxm5QH3rfKnrfr4ODNn3N5
 41sljDnPjwrLhpkPlz6ZBS2/Cne/oPml42DE+elCImADOXVXD2m4UMwWV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="455491774"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="455491774"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 11:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="9474184"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 03 Nov 2023 11:52:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qyzHm-0002qc-2c;
 Fri, 03 Nov 2023 18:52:50 +0000
Date: Sat, 4 Nov 2023 02:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Subject: Re: [PATCH v5 5/6] drm/ast: Add drm_panic support
Message-ID: <202311040239.qKjutDxj-lkp@intel.com>
References: <20231103145526.628138-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103145526.628138-6-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20231103-225824
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/20231103145526.628138-6-jfalempe%40redhat.com
patch subject: [PATCH v5 5/6] drm/ast: Add drm_panic support
config: csky-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040239.qKjutDxj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040239.qKjutDxj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040239.qKjutDxj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ast/ast_i2c.c:27:
>> drivers/gpu/drm/ast/ast_drv.h:508:35: warning: 'struct drm_scanout_buffer' declared inside parameter list will not be visible outside of this definition or declaration
     508 |                            struct drm_scanout_buffer *sb);
         |                                   ^~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/ast/ast_mode.c: In function 'ast_get_scanout_buffer':
>> drivers/gpu/drm/ast/ast_mode.c:1940:26: warning: unused variable 'map' [-Wunused-variable]
    1940 |         struct iosys_map map;
         |                          ^~~


vim +508 drivers/gpu/drm/ast/ast_drv.h

   506	
   507	int ast_get_scanout_buffer(struct drm_device *dev,
 > 508				   struct drm_scanout_buffer *sb);
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
