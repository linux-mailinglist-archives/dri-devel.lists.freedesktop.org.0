Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1DB87D9CE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 11:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A86110E836;
	Sat, 16 Mar 2024 10:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkpV9Nb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CAF10E836
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710586607; x=1742122607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FenhF9rT3Nu44V/5/acTeX2T3v3JKzcRl7tD2KsHuds=;
 b=bkpV9Nb9uyn7V6CL5wV+xZ9SafR11yZ23majX8oJgTj7l5pCfhYugRVE
 9cBZSHvPL49a4eHdlPdXg4abM3HMCDnpj1JOQ2aGwj+AEDQNTS9f7kTTj
 NQleZw4GDDGHahhj64rOV5FPuioSxMZtaAyJWXhnUcA7uMjaq2blTJRzI
 TFuKcMl9I2owv5jtdNgw9eEaftOW4BOgcZVMrJ8iD3/L78IwrqFRNhJ1R
 mDXeSVTfPz1O+BXWTi/VSZo6NYCTYs3bTc9lIbHensoCxqIkfC+SsF0GQ
 CRZjcQfjAAIRtJs5pNwmaWhK6qu9eceLTQk2IIY6KYTv1bgrlPD4mbbeL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5314065"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="5314065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2024 03:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; d="scan'208";a="13022929"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2024 03:56:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rlRiS-000FKn-3D;
 Sat, 16 Mar 2024 10:56:40 +0000
Date: Sat, 16 Mar 2024 18:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Message-ID: <202403161837.76okceZN-lkp@intel.com>
References: <20240315230916.1759060-7-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315230916.1759060-7-sean.anderson@linux.dev>
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

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.8]
[cannot apply to drm-misc/drm-misc-next linus/master next-20240315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/drm-zynqmp_dp-Downgrade-log-level-for-aux-retries-message/20240316-071208
base:   v6.8
patch link:    https://lore.kernel.org/r/20240315230916.1759060-7-sean.anderson%40linux.dev
patch subject: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance testing
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403161837.76okceZN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161837.76okceZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161837.76okceZN-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp.o: in function `zynqmp_dp_rate_set':
>> zynqmp_dp.c:(.text+0x1a7a): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
