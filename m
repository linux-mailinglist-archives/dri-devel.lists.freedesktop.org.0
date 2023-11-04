Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FEE7E0DBA
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 04:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBBC10E1ED;
	Sat,  4 Nov 2023 03:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EF010E1ED
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Nov 2023 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699070252; x=1730606252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sImoohTti9bqWZR9pDcgmaHIuPqQ30e+PDTsfXTV8gs=;
 b=RzCJ0l8ANGIXryGGEcA9SeglZlzJu9wQPtIdEJcP7jhrq76xma0rCS3p
 7P6XNXiGleNobT2jmqRS3roKy3LSM4+BQnZS6BFcnDHslzsGNDNrz/Pnt
 i3wfYR9K7NhqzmVzYMU9ZY6+qJjeaE/W9ywXxXUPCHX5guUMwlFzbNIoA
 7Jd6JExkrf2w4UibCcm8yiDwAUYU5bVA+oGg4Y0ApOTV5kBvy8tZxeL3+
 /J7w/armq3nCw5bnJVLIm3zUE4EmQi3J8hPGw9+6RQkNPveZ59LDz026a
 b/i8hSWlrzgm8AMWfPb+36Sme6xt4T2NLX3ce0+nrmdId6N1xMxUazIJP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420174468"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="420174468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 20:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="9573726"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 03 Nov 2023 20:57:27 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qz7mn-0003Nx-20;
 Sat, 04 Nov 2023 03:57:25 +0000
Date: Sat, 4 Nov 2023 11:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Subject: Re: [PATCH v5 5/6] drm/ast: Add drm_panic support
Message-ID: <202311041116.Madu45VI-lkp@intel.com>
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
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20231103-225824
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/20231103145526.628138-6-jfalempe%40redhat.com
patch subject: [PATCH v5 5/6] drm/ast: Add drm_panic support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311041116.Madu45VI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041116.Madu45VI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041116.Madu45VI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ast/ast_i2c.c:27:
>> drivers/gpu/drm/ast/ast_drv.h:508:14: warning: declaration of 'struct drm_scanout_buffer' will not be visible outside of this function [-Wvisibility]
                              struct drm_scanout_buffer *sb);
                                     ^
   1 warning generated.


vim +508 drivers/gpu/drm/ast/ast_drv.h

   506	
   507	int ast_get_scanout_buffer(struct drm_device *dev,
 > 508				   struct drm_scanout_buffer *sb);
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
