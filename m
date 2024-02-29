Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64F386D2D0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37F610E37F;
	Thu, 29 Feb 2024 19:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhRsKKpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A446110E37F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 19:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709233736; x=1740769736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w6E4MG54xTr/SKuoxjWCy8IgGAwmFc7wmAROgT72Pdc=;
 b=dhRsKKpEsjw1vomCaZMbV4Z1o8Fx8BnIV/YDCJ1OE/R47ANLCN9cG64T
 LV8Hw+huSZAurfTTu+7GBRe40IKhdtiAzkEgTJ9itu9HFjoJ8AKQW5rcL
 obU6IxOgpv4kT7TOAIS9wmHSLfx8lJZdaQWyNLkL98roSxqSm8QpgOGHA
 jeVJFtKnWC/OO2JzoxBUo94hwBnT0fmYWlC5Zw5pVeuoFSWVH65gOOZ09
 X6IB5bKe+KQyKu05IoJDT5N06qlB54o7ZRmEDNd3CIHmKSuAT2LVRt/w8
 nkO3k3tlSCK/aVF3Zieeo5BcRddsOQW7p89b5iH4Ms31EponrLikjqB9z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14304512"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14304512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12587397"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 29 Feb 2024 11:08:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rfllx-000DDj-23;
 Thu, 29 Feb 2024 19:08:49 +0000
Date: Fri, 1 Mar 2024 03:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: oe-kbuild-all@lists.linux.dev, gpiccoli@igalia.com,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v8 3/8] drm/panic: Add debugfs entry to test without
 triggering panic.
Message-ID: <202403010210.gfty1nKq-lkp@intel.com>
References: <20240227100459.194478-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227100459.194478-4-jfalempe@redhat.com>
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

[auto build test ERROR on bfa4437fd3938ae2e186e7664b2db65bb8775670]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20240227-185901
base:   bfa4437fd3938ae2e186e7664b2db65bb8775670
patch link:    https://lore.kernel.org/r/20240227100459.194478-4-jfalempe%40redhat.com
patch subject: [PATCH v8 3/8] drm/panic: Add debugfs entry to test without triggering panic.
config: m68k-randconfig-r052-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010210.gfty1nKq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010210.gfty1nKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010210.gfty1nKq-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/gpu/drm/drm_panic.o: in function `debugfs_start':
>> drm_panic.c:(.init.text+0x0): multiple definition of `init_module'; drivers/gpu/drm/drm_drv.o:drm_drv.c:(.init.text+0x0): first defined here
   m68k-linux-ld: drivers/gpu/drm/drm_panic.o: in function `debugfs_end':
>> drm_panic.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/gpu/drm/drm_drv.o:drm_drv.c:(.text+0x714): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
