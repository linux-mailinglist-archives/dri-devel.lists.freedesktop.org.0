Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D742EC106BA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 20:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA7310E54F;
	Mon, 27 Oct 2025 19:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPEjbRDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224E10E54F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 19:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761591813; x=1793127813;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QGCu0V3w0s4HySzwBgsSxoWTxrzLr5KD4kIlTtEAspU=;
 b=FPEjbRDIgQOkE5x1AMeQCfO584NNbT0njwykbuCpVGePhHRKbWZDjNF8
 FCK3hIurSW2hwi/QRSwVQ6k1e2MEwsM0gpgjXqJ1nkE4IkQkNR+Ir8I5i
 UhnZMz2hD6SryWEo2C9eXWKCZX5Mm0XpWon8WyZD5Jfk9mvCLFPFlZGBN
 I7luXEWEaC6nxkziF++zXaxQSzTztQFLlx1ErhruYmgWxRJJnqGstI/RB
 LJvO9olpNkn+5QKn0+zCtuErGMpCRFnO773R/2VU2z4/H9RKdWyxAQfe5
 WYqDdiZw8JGERpg3H9GvgMzeDiXhTIbBixkvPIekjO+Cnd+UW3LB/JQUM A==;
X-CSE-ConnectionGUID: hM+WPBrfQ9a227Kwo+QhZg==
X-CSE-MsgGUID: euYaAt+vQYWjsrr8rqhPyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67325772"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67325772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:03:32 -0700
X-CSE-ConnectionGUID: 4BOOzhGIRR+lgDMlxxjyQQ==
X-CSE-MsgGUID: ig4GyY7LSYqacFU0E1Ymew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184751958"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 27 Oct 2025 12:03:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vDSUk-000HRp-0C;
 Mon, 27 Oct 2025 19:03:20 +0000
Date: Tue, 28 Oct 2025 02:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Junjie Cao <caojunjie650@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Junjie Cao <caojunjie650@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Message-ID: <202510280208.NhQyE0y1-lkp@intel.com>
References: <20251026123923.1531727-3-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026123923.1531727-3-caojunjie650@gmail.com>
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

Hi Junjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-backlight/for-backlight-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junjie-Cao/backlight-aw99706-Add-support-for-Awinic-AW99706-backlight/20251026-214135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20251026123923.1531727-3-caojunjie650%40gmail.com
patch subject: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251028/202510280208.NhQyE0y1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280208.NhQyE0y1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280208.NhQyE0y1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/fortify-string.h:5,
                    from include/linux/string.h:382,
                    from arch/powerpc/include/asm/paca.h:16,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/backlight.h:12,
                    from drivers/video/backlight/aw99706.c:12:
   drivers/video/backlight/aw99706.c: In function 'aw99706_bl_enable':
>> include/linux/bitfield.h:172:27: warning: 'val' is used uninitialized [-Wuninitialized]
     172 |                 *(_reg_p) &= ~(_mask);                                                  \
         |                           ^~
   drivers/video/backlight/aw99706.c:325:9: note: in expansion of macro 'FIELD_MODIFY'
     325 |         FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);
         |         ^~~~~~~~~~~~
   drivers/video/backlight/aw99706.c:323:12: note: 'val' was declared here
     323 |         u8 val;
         |            ^~~


vim +/val +172 include/linux/bitfield.h

e2192de59e457a Johannes Berg   2023-01-18  120  
e2192de59e457a Johannes Berg   2023-01-18  121  /**
e2192de59e457a Johannes Berg   2023-01-18  122   * FIELD_PREP_CONST() - prepare a constant bitfield element
e2192de59e457a Johannes Berg   2023-01-18  123   * @_mask: shifted mask defining the field's length and position
e2192de59e457a Johannes Berg   2023-01-18  124   * @_val:  value to put in the field
e2192de59e457a Johannes Berg   2023-01-18  125   *
e2192de59e457a Johannes Berg   2023-01-18  126   * FIELD_PREP_CONST() masks and shifts up the value.  The result should
e2192de59e457a Johannes Berg   2023-01-18  127   * be combined with other fields of the bitfield using logical OR.
e2192de59e457a Johannes Berg   2023-01-18  128   *
e2192de59e457a Johannes Berg   2023-01-18  129   * Unlike FIELD_PREP() this is a constant expression and can therefore
e2192de59e457a Johannes Berg   2023-01-18  130   * be used in initializers. Error checking is less comfortable for this
e2192de59e457a Johannes Berg   2023-01-18  131   * version, and non-constant masks cannot be used.
e2192de59e457a Johannes Berg   2023-01-18  132   */
e2192de59e457a Johannes Berg   2023-01-18  133  #define FIELD_PREP_CONST(_mask, _val)					\
e2192de59e457a Johannes Berg   2023-01-18  134  	(								\
e2192de59e457a Johannes Berg   2023-01-18  135  		/* mask must be non-zero */				\
e2192de59e457a Johannes Berg   2023-01-18  136  		BUILD_BUG_ON_ZERO((_mask) == 0) +			\
e2192de59e457a Johannes Berg   2023-01-18  137  		/* check if value fits */				\
e2192de59e457a Johannes Berg   2023-01-18  138  		BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
e2192de59e457a Johannes Berg   2023-01-18  139  		/* check if mask is contiguous */			\
e2192de59e457a Johannes Berg   2023-01-18  140  		__BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +	\
e2192de59e457a Johannes Berg   2023-01-18  141  		/* and create the value */				\
e2192de59e457a Johannes Berg   2023-01-18  142  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
e2192de59e457a Johannes Berg   2023-01-18  143  	)
e2192de59e457a Johannes Berg   2023-01-18  144  
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  145  /**
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  146   * FIELD_GET() - extract a bitfield element
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  147   * @_mask: shifted mask defining the field's length and position
7240767450d6d8 Masahiro Yamada 2017-10-03  148   * @_reg:  value of entire bitfield
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  149   *
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  150   * FIELD_GET() extracts the field specified by @_mask from the
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  151   * bitfield passed in as @_reg by masking and shifting it down.
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  152   */
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  153  #define FIELD_GET(_mask, _reg)						\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  154  	({								\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  155  		__BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");	\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  156  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  157  	})
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  158  
a256ae22570ee4 Luo Jie         2025-04-17  159  /**
a256ae22570ee4 Luo Jie         2025-04-17  160   * FIELD_MODIFY() - modify a bitfield element
a256ae22570ee4 Luo Jie         2025-04-17  161   * @_mask: shifted mask defining the field's length and position
a256ae22570ee4 Luo Jie         2025-04-17  162   * @_reg_p: pointer to the memory that should be updated
a256ae22570ee4 Luo Jie         2025-04-17  163   * @_val: value to store in the bitfield
a256ae22570ee4 Luo Jie         2025-04-17  164   *
a256ae22570ee4 Luo Jie         2025-04-17  165   * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
a256ae22570ee4 Luo Jie         2025-04-17  166   * by replacing them with the bitfield value passed in as @_val.
a256ae22570ee4 Luo Jie         2025-04-17  167   */
a256ae22570ee4 Luo Jie         2025-04-17  168  #define FIELD_MODIFY(_mask, _reg_p, _val)						\
a256ae22570ee4 Luo Jie         2025-04-17  169  	({										\
a256ae22570ee4 Luo Jie         2025-04-17  170  		typecheck_pointer(_reg_p);						\
a256ae22570ee4 Luo Jie         2025-04-17  171  		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");		\
a256ae22570ee4 Luo Jie         2025-04-17 @172  		*(_reg_p) &= ~(_mask);							\
a256ae22570ee4 Luo Jie         2025-04-17  173  		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
a256ae22570ee4 Luo Jie         2025-04-17  174  	})
a256ae22570ee4 Luo Jie         2025-04-17  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
