Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA988AF033D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 20:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7FA10E5F3;
	Tue,  1 Jul 2025 18:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXc4Od+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D8410E5F3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751396276; x=1782932276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mf2FTyxHIye3PgS3EgdfyB99WmXBck5O/EsZyNxFZmQ=;
 b=OXc4Od+2JVUXIOWQVKoXwjxVBO4K+fTqiht8ydf+QGROMbOYIaPPb8sL
 ZdVNAXaxXvgzlRpH7uJY6vnZ6VlEd/k4I3Zn1N+7TZ7T912C4PO6Z0u+u
 oxRHaYE9IoNy9N4ny6mnSCtuqgi5eZf/n++dKnTi6z2W3PttOCsigqZDS
 j6Eoz83QsJq4bCC5BNsJQokuTwM6UG/+xnn96/l4lf4RbeAT1796pHTYp
 AtlyWbCDtF2NsEyMcJs54OmByK2XBnU2aZIP6+r2WvlhHfIEqJGHQaOuf
 9etFeukvUD28mUoGrJ5F6RghLrJmnrXS8P0j2j71l2i/rF6CChNeumgul A==;
X-CSE-ConnectionGUID: OuY29TnDQAe5+zXysRLVmA==
X-CSE-MsgGUID: AexqadU6TSiYcFohXBdqZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53611110"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53611110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 11:57:56 -0700
X-CSE-ConnectionGUID: jDbBbPEKTuSK924hK41v9A==
X-CSE-MsgGUID: 32AdnrsuS1mYxtf0e9o2AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154343701"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 01 Jul 2025 11:57:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uWgAx-000aZ0-2c;
 Tue, 01 Jul 2025 18:57:51 +0000
Date: Wed, 2 Jul 2025 02:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH 2/2] drm/vmwgfx: Implement DRIVER_SYNCOBJ
Message-ID: <202507020238.3SA3i5sA-lkp@intel.com>
References: <20250626201153.1714590-2-ian.forbes@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626201153.1714590-2-ian.forbes@broadcom.com>
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

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next next-20250701]
[cannot apply to linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Forbes/drm-vmwgfx-Implement-DRIVER_SYNCOBJ/20250627-041356
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250626201153.1714590-2-ian.forbes%40broadcom.com
patch subject: [PATCH 2/2] drm/vmwgfx: Implement DRIVER_SYNCOBJ
config: x86_64-buildonly-randconfig-001-20250702 (https://download.01.org/0day-ci/archive/20250702/202507020238.3SA3i5sA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020238.3SA3i5sA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020238.3SA3i5sA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3866 function parameter 'file_priv' not described in 'vmw_execbuf_copy_fence_user'
>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3866 Excess function parameter 'vmw_fp' description in 'vmw_execbuf_copy_fence_user'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
