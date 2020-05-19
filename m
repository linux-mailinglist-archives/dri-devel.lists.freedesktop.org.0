Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF91D9A56
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 16:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F72789622;
	Tue, 19 May 2020 14:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C3489D66
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 14:47:46 +0000 (UTC)
IronPort-SDR: D8bfHkx+3pWV+IvOSeQa6AmmOZeXWBvz+t7u4/WvAYpNcDAwGju0u5Fvdfn6yGrqGF6aKnmovA
 yXEmedkBRUVw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 07:47:46 -0700
IronPort-SDR: pZtILHrbx4liNFZsvI6EUVeAPhj9A+lovrgCX83B3w3TEqBsHY92vqsFBtron1CSqhiGBCS7wM
 +HcbT8rIYfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
 d="gz'50?scan'50,208,50";a="288979954"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 19 May 2020 07:47:44 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jb3Wx-0006id-HB; Tue, 19 May 2020 22:47:43 +0800
Date: Tue, 19 May 2020 22:46:57 +0800
From: kbuild test robot <lkp@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] linux/bits.h: adjust GENMASK_INPUT_CHECK() check
Message-ID: <202005192248.hhYtuqDw%lkp@intel.com>
References: <20200519101320.33495-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <20200519101320.33495-1-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: emil.l.velikov@gmail.com, kbuild-all@lists.01.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Emil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra-drm/drm/tegra/for-next]
[also build test WARNING on linus/master v5.7-rc6 next-20200518]
[cannot apply to linux/master]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Emil-Velikov/linux-bits-h-adjust-GENMASK_INPUT_CHECK-check/20200519-205452
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from drivers/clk/clk-multiplier.c:6:
drivers/clk/clk-multiplier.c: In function 'clk_multiplier_recalc_rate':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-multiplier.c:48:9: note: in expansion of macro 'GENMASK'
48 |  val &= GENMASK(mult->width - 1, 0);
|         ^~~~~~~
drivers/clk/clk-multiplier.c: In function 'clk_multiplier_set_rate':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-multiplier.c:139:10: note: in expansion of macro 'GENMASK'
139 |  val &= ~GENMASK(mult->width + mult->shift - 1, mult->shift);
|          ^~~~~~~
--
In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from include/linux/of.h:15,
from include/linux/clk-provider.h:9,
from drivers/clk/clk-fractional-divider.c:10:
drivers/clk/clk-fractional-divider.c: In function 'clk_fd_general_approximation':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-fractional-divider.c:88:4: note: in expansion of macro 'GENMASK'
88 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|    ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:88:32: note: in expansion of macro 'GENMASK'
88 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|                                ^~~~~~~
drivers/clk/clk-fractional-divider.c: In function 'clk_fd_set_rate':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:122:4: note: in expansion of macro 'GENMASK'
122 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|    ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:122:32: note: in expansion of macro 'GENMASK'
122 |    GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
|                                ^~~~~~~
drivers/clk/clk-fractional-divider.c: In function 'clk_hw_register_fractional_divider':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:178:14: note: in expansion of macro 'GENMASK'
178 |  fd->mmask = GENMASK(mwidth - 1, 0) << mshift;
|              ^~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
drivers/clk/clk-fractional-divider.c:181:14: note: in expansion of macro 'GENMASK'
181 |  fd->nmask = GENMASK(nwidth - 1, 0) << nshift;
|              ^~~~~~~
--
In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/linux/interrupt.h:6,
from drivers/clocksource/arc_timer.c:15:
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:45:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
45 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/linux/clocksource.h:136:32: note: in expansion of macro 'GENMASK_ULL'
136 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
|                                ^~~~~~~~~~~
>> drivers/clocksource/arc_timer.c:99:12: note: in expansion of macro 'CLOCKSOURCE_MASK'
99 |  .mask   = CLOCKSOURCE_MASK(64),
|            ^~~~~~~~~~~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:45:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
45 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/linux/clocksource.h:136:32: note: in expansion of macro 'GENMASK_ULL'
136 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
|                                ^~~~~~~~~~~
drivers/clocksource/arc_timer.c:157:12: note: in expansion of macro 'CLOCKSOURCE_MASK'
157 |  .mask   = CLOCKSOURCE_MASK(64),
|            ^~~~~~~~~~~~~~~~
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:45:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
45 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/linux/clocksource.h:136:32: note: in expansion of macro 'GENMASK_ULL'
136 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
|                                ^~~~~~~~~~~
drivers/clocksource/arc_timer.c:210:12: note: in expansion of macro 'CLOCKSOURCE_MASK'
210 |  .mask   = CLOCKSOURCE_MASK(32),
|            ^~~~~~~~~~~~~~~~
--
In file included from include/linux/kernel.h:11,
from include/linux/list.h:9,
from include/linux/module.h:12,
from net/core/filter.c:20:
net/core/filter.c: In function '____bpf_skb_set_tunnel_opt':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
78 | # define unlikely(x) __builtin_expect(!!(x), 0)
|                                          ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/net/ip_tunnels.h:66:2: note: in expansion of macro 'GENMASK'
66 |  GENMASK((sizeof_field(struct ip_tunnel_info,           |  ^~~~~~~
net/core/filter.c:3945:22: note: in expansion of macro 'IP_TUNNEL_OPTS_MAX'
3945 |  if (unlikely(size > IP_TUNNEL_OPTS_MAX))
|                      ^~~~~~~~~~~~~~~~~~
In file included from include/linux/bits.h:23,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/linux/list.h:9,
from include/linux/module.h:12,
from net/core/filter.c:20:
net/core/filter.c: In function 'bpf_get_skb_set_tunnel_proto':
include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
|                                                   ^
include/linux/bits.h:25:3: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
25 |  (BUILD_BUG_ON_ZERO(!__builtin_choose_expr(          |   ^~~~~~~~~~~~~~~~~
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|   ^~~~~~~~~~~~~~~~~~~
include/net/ip_tunnels.h:66:2: note: in expansion of macro 'GENMASK'
66 |  GENMASK((sizeof_field(struct ip_tunnel_info,           |  ^~~~~~~
net/core/filter.c:3968:35: note: in expansion of macro 'IP_TUNNEL_OPTS_MAX'
3968 |   tmp = metadata_dst_alloc_percpu(IP_TUNNEL_OPTS_MAX,
|                                   ^~~~~~~~~~~~~~~~~~
In file included from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/linux/list.h:9,
from include/linux/module.h:12,
from net/core/filter.c:20:
>> include/linux/bits.h:39:2: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '256' to '0' [-Woverflow]
39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
|  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/net/ip_tunnels.h:66:2: note: in expansion of macro 'GENMASK'
66 |  GENMASK((sizeof_field(struct ip_tunnel_info,           |  ^~~~~~~
net/core/filter.c:3968:35: note: in expansion of macro 'IP_TUNNEL_OPTS_MAX'
3968 |   tmp = metadata_dst_alloc_percpu(IP_TUNNEL_OPTS_MAX,
|                                   ^~~~~~~~~~~~~~~~~~

vim +39 include/linux/bits.h

295bcca84916cb Rikard Falkeborn 2020-04-06  34  
295bcca84916cb Rikard Falkeborn 2020-04-06  35  #define __GENMASK(h, l) \
95b980d62d52c4 Masahiro Yamada  2019-07-16  36  	(((~UL(0)) - (UL(1) << (l)) + 1) & \
95b980d62d52c4 Masahiro Yamada  2019-07-16  37  	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
295bcca84916cb Rikard Falkeborn 2020-04-06  38  #define GENMASK(h, l) \
295bcca84916cb Rikard Falkeborn 2020-04-06 @39  	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
8bd9cb51daac89 Will Deacon      2018-06-19  40  

:::::: The code at line 39 was first introduced by commit
:::::: 295bcca84916cb5079140a89fccb472bb8d1f6e2 linux/bits.h: add compile time sanity check of GENMASK inputs

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--UlVJffcvxoiEqYs2
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--UlVJffcvxoiEqYs2--
