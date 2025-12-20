Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE9BCD2E81
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 13:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C694F10E1F5;
	Sat, 20 Dec 2025 12:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaYzg1J0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C3110E1F5
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766232223; x=1797768223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zbfvsNSt7anMRgFtaofdTm0XxuwBFY2YuokDa6+7iNQ=;
 b=SaYzg1J08fiewTHKWDdDi0ez62CgIjKYrmmwgydC4aZcYkdd0e0ha158
 qizLN5gUGJJVwn/8uHA+uZie+756IB7pp1Ej7vGPjMsFv/hwPFahF72QR
 KzOz8oIYhNN78RNnbUyrkWhaGVEYLb68FAQL9tWSuev1oSOE/9kZNV6Q4
 IualPEXqLUrHFiPTeG+ntkf2+gP3eLd7jedm/TUtSTrDjaQrus5OBAYCZ
 l330k1zhWdfpIJPxb70UyG+9NwM6z0Bg3J07pjHYCvL3KrtHaSQVJycj8
 ohXhjJ7yDoYuc6f+h8IVYdtyfB/xIHQOkbcHI9jpkNoXrjATHuWjaqdcZ w==;
X-CSE-ConnectionGUID: jnf+6R3JTlCSNKpAoqYRZg==
X-CSE-MsgGUID: u/ptpLK3Ssec63SqhgK+CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="70740953"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="70740953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2025 04:03:42 -0800
X-CSE-ConnectionGUID: +/AHVCSCSYqOE7oKrV3B1A==
X-CSE-MsgGUID: qDxihsbDRv+DHF6zfmzIYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="198238280"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
 by orviesa006.jf.intel.com with ESMTP; 20 Dec 2025 04:03:36 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vWvgM-000000004YW-2JbD;
 Sat, 20 Dec 2025 12:03:34 +0000
Date: Sat, 20 Dec 2025 13:03:31 +0100
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <chris.mason@fusionio.com>,
 David Sterba <dsterba@suse.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-hardening@vger.kernel.org,
 Vincent Mailhol <mailhol@kernel.org>
Subject: Re: [PATCH v2 4/4] minmax: remove useless cast in __is_nonneg()
Message-ID: <202512201303.je0bERQn-lkp@intel.com>
References: <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
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

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3e7f562e20ee87a25e104ef4fce557d39d62fa85]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/kbuild-remove-gcc-s-Wtype-limits/20251220-064204
base:   3e7f562e20ee87a25e104ef4fce557d39d62fa85
patch link:    https://lore.kernel.org/r/20251219-remove_wtype-limits-v2-4-2e92b3f566c5%40kernel.org
patch subject: [PATCH v2 4/4] minmax: remove useless cast in __is_nonneg()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251220/202512201303.je0bERQn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201303.je0bERQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201303.je0bERQn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   lib/lzo/lzo1x_compress.c: In function 'lzo1x_1_do_compress':
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:10: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:10: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:27: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:27: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~
--
   In file included from <command-line>:
   lib/lzo/lzo1x_compress.c: In function 'lzo1x_1_do_compress_safe':
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:10: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:10: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:27: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~
>> include/linux/minmax.h:65:46: warning: ordered comparison of pointer with integer zero [-Wextra]
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                                              ^~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:65:25: note: in expansion of macro 'statically_true'
      65 | #define __is_nonneg(ux) statically_true((ux) >= 0)
         |                         ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:14: note: in expansion of macro '__is_nonneg'
      50 |         (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
         |              ^~~~~~~~~~~
   include/linux/minmax.h:72:27: note: in expansion of macro '__sign_use'
      72 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:90:27: note: in expansion of macro '__types_ok'
      90 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:95:9: note: in expansion of macro '__careful_cmp_once'
      95 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:102:25: note: in expansion of macro '__careful_cmp'
     102 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   lib/lzo/lzo1x_compress.c:65:54: note: in expansion of macro 'min'
      65 |                         const unsigned char *limit = min(ip_end, ip + MAX_ZERO_RUN_LENGTH + 1);
         |                                                      ^~~


vim +65 include/linux/minmax.h

     9	
    10	/*
    11	 * min()/max()/clamp() macros must accomplish several things:
    12	 *
    13	 * - Avoid multiple evaluations of the arguments (so side-effects like
    14	 *   "x++" happen only once) when non-constant.
    15	 * - Perform signed v unsigned type-checking (to generate compile
    16	 *   errors instead of nasty runtime surprises).
    17	 * - Unsigned char/short are always promoted to signed int and can be
    18	 *   compared against signed or unsigned arguments.
    19	 * - Unsigned arguments can be compared against non-negative signed constants.
    20	 * - Comparison of a signed argument against an unsigned constant fails
    21	 *   even if the constant is below __INT_MAX__ and could be cast to int.
    22	 */
    23	#define __typecheck(x, y) \
    24		(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
    25	
    26	/*
    27	 * __sign_use for integer expressions:
    28	 *   bit #0 set if ok for unsigned comparisons
    29	 *   bit #1 set if ok for signed comparisons
    30	 *
    31	 * In particular, statically non-negative signed integer expressions
    32	 * are ok for both.
    33	 *
    34	 * NOTE! Unsigned types smaller than 'int' are implicitly converted to 'int'
    35	 * in expressions, and are accepted for signed conversions for now.
    36	 * This is debatable.
    37	 *
    38	 * Note that 'x' is the original expression, and 'ux' is the unique variable
    39	 * that contains the value.
    40	 *
    41	 * We use 'ux' for pure type checking, and 'x' for when we need to look at the
    42	 * value (but without evaluating it for side effects!
    43	 * Careful to only ever evaluate it with sizeof() or __builtin_constant_p() etc).
    44	 *
    45	 * Pointers end up being checked by the normal C type rules at the actual
    46	 * comparison, and these expressions only need to be careful to not cause
    47	 * warnings for pointer use.
    48	 */
    49	#define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
    50		(2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
    51	
    52	/*
    53	 * Check whether a signed value is always non-negative.
    54	 *
    55	 * On 64-bit any integer or pointer type can safely be cast to 'long long'.
    56	 * But on 32-bit we need to avoid warnings about casting pointers to integers
    57	 * of different sizes without truncating 64-bit values so 'long' or 'long long'
    58	 * must be used depending on the size of the value.
    59	 *
    60	 * This does not work for 128-bit signed integers since the cast would truncate
    61	 * them, but we do not use s128 types in the kernel (we do use 'u128',
    62	 * but they are handled by the !is_signed_type() case).
    63	 */
    64	#if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__
  > 65	#define __is_nonneg(ux) statically_true((ux) >= 0)
    66	#else
    67	#define __is_nonneg(ux) statically_true( \
    68		(typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
    69	#endif
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
