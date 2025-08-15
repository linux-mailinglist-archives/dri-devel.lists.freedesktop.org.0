Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AAAB287B4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 23:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3C910E9AE;
	Fri, 15 Aug 2025 21:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAWrFie2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D054410E9AE;
 Fri, 15 Aug 2025 21:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755293233; x=1786829233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W+iJZ8mIwM4LaGWVzRYS4QRICacEzWGFxppv6fyATdw=;
 b=OAWrFie2tgdUHnFT8D7sW18hNG6UtYNkgjgwtt7XLWBNsxMy+RlXq9M3
 enC87vuBVT/RhsDR2p4zJde6eN0ExBoG8r1fvJF43xzbKHLMDhZm4BFnV
 xgT/LXvkAKlZDLh8TFD8KkGT0Wh4LjTzwWvIzZ0S0/150vbSLYHyUl9ey
 mnX7ESGF5KPfC/aX9AeuReDjswIFFM3cFH9VIFvtqaaDEPUW4kFa1b0XF
 Db7+eD/xVzHyhZ85cINlnJ29WZh1i13UfRu2eLcBBgD5pIZ5cP3HYVCgg
 hbGoH56XYh9oG87kq4mygYbFLYhDLVdXLs/MCvzDPj2UmnDRQpdkAA5vc w==;
X-CSE-ConnectionGUID: PlLJMhPTT5unabeGHHm1Tg==
X-CSE-MsgGUID: rOYz/lq0TOCe0nxX3Xwkcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57765667"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57765667"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:27:13 -0700
X-CSE-ConnectionGUID: FtVEo0nuSH+urWSQRMNpIw==
X-CSE-MsgGUID: v/rMKRBpRtyAiiI65uPZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167482332"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2025 14:27:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1un1x2-000CM8-0A;
 Fri, 15 Aug 2025 21:27:04 +0000
Date: Sat, 16 Aug 2025 05:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, alex.hung@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com
Subject: Re: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
Message-ID: <202508160509.6y6RZQYI-lkp@intel.com>
References: <20250815035047.3319284-3-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815035047.3319284-3-alex.hung@amd.com>
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

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250815-120435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250815035047.3319284-3-alex.hung%40amd.com
patch subject: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
config: x86_64-randconfig-074-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160509.6y6RZQYI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160509.6y6RZQYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160509.6y6RZQYI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/tests/vkms-kunit-tests.o: warning: objtool: file already has .orc_unwind section, skipping

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
