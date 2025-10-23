Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E577C00481
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1810E109;
	Thu, 23 Oct 2025 09:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ge0qGqIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915C10E109
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761212225; x=1792748225;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Y2zd0++u4ourIn7hd78sKOaDEKqum2WybP9qDluYuJQ=;
 b=ge0qGqIrFuu1iU/VgikNaf5RYrzaQw+awhHJ9TZs4wz2+OAN21CuT7Zr
 ek4wWGyygffpRbCNCqqJuLsoTOiIbvXq3xeRBtpGNiDQHyzNm/0LhH7Ld
 ODM6XZ/040bjOTo8z5DnkQC9GnJMbCP0UuK/CfVNrB9CuhRs4h5mDSUu5
 Z+maNwArQZAOhzDBmMLLmNPYZsA89LqVrbfa/LS6f+zHrnKl7GhRNTf3C
 dWYtE0qS+669V2AbQ0FIJGpeK58dVRI9KIUt/RDH85BeB01JpOFla/bJx
 tRwL5Xl4Zvc4DE/Mfb4WKnMp3rf4zu7FMvrhkBWBGeS6Ao7nWwIptXgE5 A==;
X-CSE-ConnectionGUID: M9pcXMpQTb+AHQ4M0rKOqw==
X-CSE-MsgGUID: Yuf5kMstS42lSlF6JaOH9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88843576"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="88843576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:37:05 -0700
X-CSE-ConnectionGUID: Aqyw46ikSHaGP4Gbg9EmUQ==
X-CSE-MsgGUID: kCqc7+VmReux+yBhxYs4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="189377866"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:37:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Subject: Re: [BUILD SUCCESS] LAST PATCH: [PATCH v2 3/3] drm/ttm: replace
 drm_print.h include with a forward declaration
In-Reply-To: <202510231303.QVLtphRV-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ceff40759aa88a019e72eb7dd6efdaa3206a984e.1761126446.git.jani.nikula@intel.com>
 <202510231303.QVLtphRV-lkp@intel.com>
Date: Thu, 23 Oct 2025 12:37:00 +0300
Message-ID: <1e706df8fdbd36b5997a7b7e854cdf3b17cb5e8a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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


FYI, got build success from the build robot.

Ack to merge the lot?

BR,
Jani.


On Thu, 23 Oct 2025, kernel test robot <lkp@intel.com> wrote:
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-mm-replace-drm_print-h-include-with-a-forward-declaration/20251022-175031
> base:   next-20251022
> patch link:    https://lore.kernel.org/r/ceff40759aa88a019e72eb7dd6efdaa3206a984e.1761126446.git.jani.nikula%40intel.com
> patch subject: [PATCH v2 3/3] drm/ttm: replace drm_print.h include with a forward declaration
>
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> elapsed time: 1181m
>
> configs tested: 120
> configs skipped: 3
>
> The following configs have been built successfully.
> More configs may be tested in the coming days.
>
> tested configs:
> alpha                             allnoconfig    gcc-15.1.0
> alpha                            allyesconfig    gcc-15.1.0
> arc                              allmodconfig    gcc-15.1.0
> arc                               allnoconfig    gcc-15.1.0
> arc                              allyesconfig    gcc-15.1.0
> arc                   randconfig-001-20251022    gcc-13.4.0
> arc                   randconfig-002-20251022    gcc-8.5.0
> arm                              allmodconfig    gcc-15.1.0
> arm                               allnoconfig    clang-22
> arm                              allyesconfig    gcc-15.1.0
> arm                           h3600_defconfig    gcc-15.1.0
> arm                   randconfig-001-20251022    gcc-11.5.0
> arm                   randconfig-002-20251022    gcc-10.5.0
> arm                   randconfig-003-20251022    gcc-10.5.0
> arm                   randconfig-004-20251022    clang-22
> arm64                            allmodconfig    clang-19
> arm64                             allnoconfig    gcc-15.1.0
> arm64                 randconfig-001-20251022    gcc-9.5.0
> arm64                 randconfig-002-20251022    clang-18
> arm64                 randconfig-003-20251022    gcc-10.5.0
> arm64                 randconfig-004-20251022    gcc-12.5.0
> csky                              allnoconfig    gcc-15.1.0
> csky                  randconfig-001-20251022    gcc-15.1.0
> csky                  randconfig-002-20251022    gcc-11.5.0
> hexagon                          allmodconfig    clang-17
> hexagon                           allnoconfig    clang-22
> hexagon                          allyesconfig    clang-22
> hexagon               randconfig-001-20251022    clang-22
> hexagon               randconfig-002-20251022    clang-22
> i386                             allmodconfig    gcc-14
> i386                              allnoconfig    gcc-14
> i386                             allyesconfig    gcc-14
> i386        buildonly-randconfig-001-20251022    clang-20
> i386        buildonly-randconfig-002-20251022    clang-20
> i386        buildonly-randconfig-003-20251022    gcc-14
> i386        buildonly-randconfig-004-20251022    clang-20
> i386        buildonly-randconfig-005-20251022    gcc-12
> i386        buildonly-randconfig-006-20251022    gcc-14
> i386                                defconfig    clang-20
> loongarch                        allmodconfig    clang-19
> loongarch                         allnoconfig    clang-22
> loongarch             randconfig-001-20251022    gcc-12.5.0
> loongarch             randconfig-002-20251022    gcc-15.1.0
> m68k                             allmodconfig    gcc-15.1.0
> m68k                              allnoconfig    gcc-15.1.0
> m68k                             allyesconfig    gcc-15.1.0
> m68k                         amcore_defconfig    gcc-15.1.0
> microblaze                       allmodconfig    gcc-15.1.0
> microblaze                        allnoconfig    gcc-15.1.0
> microblaze                       allyesconfig    gcc-15.1.0
> microblaze                          defconfig    gcc-15.1.0
> mips                              allnoconfig    gcc-15.1.0
> nios2                             allnoconfig    gcc-11.5.0
> nios2                               defconfig    gcc-11.5.0
> nios2                 randconfig-001-20251022    gcc-8.5.0
> nios2                 randconfig-002-20251022    gcc-10.5.0
> openrisc                          allnoconfig    gcc-15.1.0
> openrisc                         allyesconfig    gcc-15.1.0
> parisc                           allmodconfig    gcc-15.1.0
> parisc                            allnoconfig    gcc-15.1.0
> parisc                           allyesconfig    gcc-15.1.0
> parisc                              defconfig    gcc-15.1.0
> parisc                randconfig-001-20251022    gcc-13.4.0
> parisc                randconfig-002-20251022    gcc-10.5.0
> parisc64                            defconfig    gcc-15.1.0
> powerpc                          allmodconfig    gcc-15.1.0
> powerpc                           allnoconfig    gcc-15.1.0
> powerpc                          allyesconfig    clang-22
> powerpc                     asp8347_defconfig    clang-22
> powerpc                     ep8248e_defconfig    gcc-15.1.0
> powerpc               randconfig-001-20251022    gcc-8.5.0
> powerpc               randconfig-002-20251022    gcc-8.5.0
> powerpc               randconfig-003-20251022    gcc-8.5.0
> powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
> powerpc64             randconfig-001-20251022    gcc-8.5.0
> powerpc64             randconfig-002-20251022    gcc-8.5.0
> powerpc64             randconfig-003-20251022    clang-22
> riscv                            allmodconfig    clang-22
> riscv                             allnoconfig    gcc-15.1.0
> riscv                            allyesconfig    clang-16
> riscv                 randconfig-001-20251023    gcc-8.5.0
> riscv                 randconfig-002-20251023    gcc-14.3.0
> s390                             allmodconfig    clang-18
> s390                              allnoconfig    clang-22
> s390                             allyesconfig    gcc-15.1.0
> s390                  randconfig-001-20251023    clang-19
> s390                  randconfig-002-20251023    gcc-8.5.0
> sh                               allmodconfig    gcc-15.1.0
> sh                                allnoconfig    gcc-15.1.0
> sh                               allyesconfig    gcc-15.1.0
> sh                     magicpanelr2_defconfig    gcc-15.1.0
> sh                            migor_defconfig    gcc-15.1.0
> sh                    randconfig-001-20251023    gcc-15.1.0
> sh                    randconfig-002-20251023    gcc-15.1.0
> sparc                            allmodconfig    gcc-15.1.0
> sparc                             allnoconfig    gcc-15.1.0
> sparc                               defconfig    gcc-15.1.0
> sparc                 randconfig-001-20251023    gcc-12.5.0
> sparc                 randconfig-002-20251023    gcc-8.5.0
> sparc64               randconfig-001-20251023    clang-22
> sparc64               randconfig-002-20251023    gcc-8.5.0
> um                               allmodconfig    clang-19
> um                                allnoconfig    clang-22
> um                               allyesconfig    gcc-14
> um                    randconfig-001-20251023    gcc-13
> um                    randconfig-002-20251023    gcc-14
> x86_64                            allnoconfig    clang-20
> x86_64                           allyesconfig    clang-20
> x86_64      buildonly-randconfig-001-20251022    clang-20
> x86_64      buildonly-randconfig-002-20251022    gcc-14
> x86_64      buildonly-randconfig-003-20251022    gcc-14
> x86_64      buildonly-randconfig-004-20251022    clang-20
> x86_64      buildonly-randconfig-005-20251022    gcc-14
> x86_64      buildonly-randconfig-006-20251022    gcc-14
> x86_64                              defconfig    gcc-14
> x86_64                          rhel-9.4-rust    clang-20
> xtensa                            allnoconfig    gcc-15.1.0
> xtensa                  audio_kc705_defconfig    gcc-15.1.0
> xtensa                randconfig-001-20251023    gcc-8.5.0
> xtensa                randconfig-002-20251023    gcc-13.4.0
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Jani Nikula, Intel
