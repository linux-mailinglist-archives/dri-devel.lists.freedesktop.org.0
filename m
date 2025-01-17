Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AAAA15954
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 23:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9C310E26E;
	Fri, 17 Jan 2025 22:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3SwKIvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286B10E26E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737151486; x=1768687486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0XZfrcqbblf6skoLJGR4rVZli6Qmk9tbEtvNmO1ngbw=;
 b=I3SwKIvIY/bUstUlc5KCMSVp/n5F/SYWNY+eL4NYyRNxuA26ZorpLkSp
 oKKkFZ1DjQbyuPXezH/z2VIQfG2Aq1bNHhVwm4gmi3BRjCjwL6P0rm1+L
 TtZ/2cItQ0pCLrpDRViY2X7S9nDklu5l0/Xkqo1lfKdq0hkztc6IrUZCq
 tktDQEP69uO/PXXLhwxKGlHpDkHm61HHZh85KhKeMfb8K8H2VKYieT+1k
 1lW3IFiyxRx6ik0pRCrqdg3LNtL7NVdJE+IgS+EhC4kb+fSBD4fUS3Efk
 Fk4qQZMNwe6E1w7BZ51uvggNEqM2jRAF+PtH0oPdQ6uX1r4OUlDy02Alo g==;
X-CSE-ConnectionGUID: 9YtMRHt5TROAKmxrBNhVJg==
X-CSE-MsgGUID: M+BLoYzvSKeko/15UKHj2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49014985"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49014985"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 14:04:45 -0800
X-CSE-ConnectionGUID: UbYDsmjDQEOkdHMv79hGow==
X-CSE-MsgGUID: sMqe5D/qQliPcMUqQsuFKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="105774286"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 14:04:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tYuSD-000Tkx-20;
 Fri, 17 Jan 2025 22:04:37 +0000
Date: Sat, 18 Jan 2025 06:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org,
 lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
 tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <202501180524.qKnNpITh-lkp@intel.com>
References: <20250113145232.227674-33-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113145232.227674-33-angelogioacchino.delregno@collabora.com>
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250113]
[cannot apply to robh/for-next pza/reset/next linus/master pza/imx-drm/next drm-misc/drm-misc-next v6.13-rc7 v6.13-rc6 v6.13-rc5 v6.13-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Add-MT8195-and-MT8188-compat/20250113-225554
base:   next-20250113
patch link:    https://lore.kernel.org/r/20250113145232.227674-33-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250118/202501180524.qKnNpITh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180524.qKnNpITh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180524.qKnNpITh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddc_check_and_rise_low_bus':
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:59:36: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      59 |                                    FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLOCK_SCL));
         |                                    ^~~~~~~~~~
   In file included from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:11:
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddcm_read_hdmi':
>> include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:139:23: note: in expansion of macro 'do_div'
     139 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   In file included from include/linux/err.h:5,
                    from include/linux/clk.h:12:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:139:23: note: in expansion of macro 'do_div'
     139 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u16 * {aka short unsigned int *}
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:139:23: note: in expansion of macro 'do_div'
     139 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u16 *' {aka 'short unsigned int *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:207:47: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     207 |                         puc_value[read_idx] = FIELD_GET(DDC_DATA_OUT, val);
         |                                               ^~~~~~~~~


vim +183 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  176  
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  179   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  187  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02 @195  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  198  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  199  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  200  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  202   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
