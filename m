Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001956FDD94
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 14:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE3A10E484;
	Wed, 10 May 2023 12:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932E410E484;
 Wed, 10 May 2023 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683721175; x=1715257175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qq8fVQ7gjdkMiSHS1W+8BaigREYmj/b60CdMkbnsI0I=;
 b=CBDtV1bzr+83fBwWuIEvQQLV8Kv9TWFh17JqEKyZ1zucp3YoGCO/51YV
 85BTbAnpQJjXEjarPLcVa4X9fAHpUWXjnq6rhW0LeJeq105/Ozm9Gm9FN
 0QuDrhQurj3wcADwDAXnAxmxPIdQrLX7oEYiJY4kysSMQiSDDXFdBmM64
 IAGu35tTsg5xw2uj/GmNK12DNnDqqMK/IcelowWhlEeHptqKGkic7uPsz
 akFvZ7TjKD7E/LExhY8BnZ9ylRWWUrgKH6ce+32lsmuQgOcKVmqWedGzI
 37IAxwEBktUcqRU6GxLO0+Y3hVPaffp2lazYQ31e0twlaoa/x/vtf74Pa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330561061"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="330561061"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="1029195409"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="1029195409"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 10 May 2023 05:19:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pwin3-0003GQ-2R;
 Wed, 10 May 2023 12:19:29 +0000
Date: Wed, 10 May 2023 20:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <202305102048.2O5u4Wia-lkp@intel.com>
References: <20230509051403.2748545-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509051403.2748545-3-lucas.demarchi@intel.com>
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
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc1 next-20230510]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-De-Marchi/drm-amd-Remove-wrapper-macros-over-get_u-32-16-8/20230509-131544
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230509051403.2748545-3-lucas.demarchi%40intel.com
patch subject: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
config: arm64-randconfig-r021-20230509 (https://download.01.org/0day-ci/archive/20230510/202305102048.2O5u4Wia-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/dc308f14f76fa2d6c1698a701dfbe0f1b247e6bd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/drm-amd-Remove-wrapper-macros-over-get_u-32-16-8/20230509-131544
        git checkout dc308f14f76fa2d6c1698a701dfbe0f1b247e6bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102048.2O5u4Wia-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/zstd/compress/zstd_opt.c:785:9: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   typedef U32 (*ZSTD_getAllMatchesFn)(
   ~~~~~~~ ^
   int
   include/vdso/const.h:7:18: note: expanded from macro 'U32'
   #define U32(x)          (_U32(x))
                            ^
   include/uapi/linux/const.h:25:19: note: expanded from macro '_U32'
   #define _U32(x)         (_AC(x, U))
                            ^
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
   #define _AC(X,Y)        __AC(X,Y)
                           ^
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
   #define __AC(X,Y)       (X##Y)
                            ^
   <scratch space>:178:1: note: expanded from here
   ZSTD_getAllMatchesFnU
   ^
>> lib/zstd/compress/zstd_opt.c:851:8: error: unknown type name 'ZSTD_getAllMatchesFn'; did you mean 'ZSTD_getAllMatchesFnU'?
   static ZSTD_getAllMatchesFn
          ^~~~~~~~~~~~~~~~~~~~
          ZSTD_getAllMatchesFnU
   lib/zstd/compress/zstd_opt.c:785:9: note: 'ZSTD_getAllMatchesFnU' declared here
   typedef U32 (*ZSTD_getAllMatchesFn)(
           ^
   include/vdso/const.h:7:18: note: expanded from macro 'U32'
   #define U32(x)          (_U32(x))
                            ^
   include/uapi/linux/const.h:25:19: note: expanded from macro '_U32'
   #define _U32(x)         (_AC(x, U))
                            ^
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
   #define _AC(X,Y)        __AC(X,Y)
                           ^
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
   #define __AC(X,Y)       (X##Y)
                            ^
   <scratch space>:178:1: note: expanded from here
   ZSTD_getAllMatchesFnU
   ^
>> lib/zstd/compress/zstd_opt.c:854:5: error: use of undeclared identifier 'ZSTD_getAllMatchesFn'
       ZSTD_getAllMatchesFn const getAllMatchesFns[3][4] = {
       ^
>> lib/zstd/compress/zstd_opt.c:862:12: error: use of undeclared identifier 'getAllMatchesFns'
       return getAllMatchesFns[(int)dictMode][mls - 3];
              ^
   lib/zstd/compress/zstd_opt.c:1054:5: error: unknown type name 'ZSTD_getAllMatchesFn'; did you mean 'ZSTD_getAllMatchesFnU'?
       ZSTD_getAllMatchesFn getAllMatches = ZSTD_selectBtGetAllMatches(ms, dictMode);
       ^~~~~~~~~~~~~~~~~~~~
       ZSTD_getAllMatchesFnU
   lib/zstd/compress/zstd_opt.c:785:9: note: 'ZSTD_getAllMatchesFnU' declared here
   typedef U32 (*ZSTD_getAllMatchesFn)(
           ^
   include/vdso/const.h:7:18: note: expanded from macro 'U32'
   #define U32(x)          (_U32(x))
                            ^
   include/uapi/linux/const.h:25:19: note: expanded from macro '_U32'
   #define _U32(x)         (_AC(x, U))
                            ^
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
   #define _AC(X,Y)        __AC(X,Y)
                           ^
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
   #define __AC(X,Y)       (X##Y)
                            ^
   <scratch space>:178:1: note: expanded from here
   ZSTD_getAllMatchesFnU
   ^
   5 errors generated.


vim +/int +785 lib/zstd/compress/zstd_opt.c

e0c1b49f5b674c Nick Terrell 2020-09-11  784  
2aa14b1ab2c41a Nick Terrell 2022-10-17 @785  typedef U32 (*ZSTD_getAllMatchesFn)(
2aa14b1ab2c41a Nick Terrell 2022-10-17  786      ZSTD_match_t*,
2aa14b1ab2c41a Nick Terrell 2022-10-17  787      ZSTD_matchState_t*,
2aa14b1ab2c41a Nick Terrell 2022-10-17  788      U32*,
2aa14b1ab2c41a Nick Terrell 2022-10-17  789      const BYTE*,
2aa14b1ab2c41a Nick Terrell 2022-10-17  790      const BYTE*,
2aa14b1ab2c41a Nick Terrell 2022-10-17  791      const U32 rep[ZSTD_REP_NUM],
2aa14b1ab2c41a Nick Terrell 2022-10-17  792      U32 const ll0,
2aa14b1ab2c41a Nick Terrell 2022-10-17  793      U32 const lengthToBeat);
e0c1b49f5b674c Nick Terrell 2020-09-11  794  
2aa14b1ab2c41a Nick Terrell 2022-10-17  795  FORCE_INLINE_TEMPLATE U32 ZSTD_btGetAllMatches_internal(
2aa14b1ab2c41a Nick Terrell 2022-10-17  796          ZSTD_match_t* matches,
e0c1b49f5b674c Nick Terrell 2020-09-11  797          ZSTD_matchState_t* ms,
e0c1b49f5b674c Nick Terrell 2020-09-11  798          U32* nextToUpdate3,
2aa14b1ab2c41a Nick Terrell 2022-10-17  799          const BYTE* ip,
2aa14b1ab2c41a Nick Terrell 2022-10-17  800          const BYTE* const iHighLimit,
e0c1b49f5b674c Nick Terrell 2020-09-11  801          const U32 rep[ZSTD_REP_NUM],
e0c1b49f5b674c Nick Terrell 2020-09-11  802          U32 const ll0,
2aa14b1ab2c41a Nick Terrell 2022-10-17  803          U32 const lengthToBeat,
2aa14b1ab2c41a Nick Terrell 2022-10-17  804          const ZSTD_dictMode_e dictMode,
2aa14b1ab2c41a Nick Terrell 2022-10-17  805          const U32 mls)
e0c1b49f5b674c Nick Terrell 2020-09-11  806  {
2aa14b1ab2c41a Nick Terrell 2022-10-17  807      assert(BOUNDED(3, ms->cParams.minMatch, 6) == mls);
2aa14b1ab2c41a Nick Terrell 2022-10-17  808      DEBUGLOG(8, "ZSTD_BtGetAllMatches(dictMode=%d, mls=%u)", (int)dictMode, mls);
2aa14b1ab2c41a Nick Terrell 2022-10-17  809      if (ip < ms->window.base + ms->nextToUpdate)
2aa14b1ab2c41a Nick Terrell 2022-10-17  810          return 0;   /* skipped area */
2aa14b1ab2c41a Nick Terrell 2022-10-17  811      ZSTD_updateTree_internal(ms, ip, iHighLimit, mls, dictMode);
2aa14b1ab2c41a Nick Terrell 2022-10-17  812      return ZSTD_insertBtAndGetAllMatches(matches, ms, nextToUpdate3, ip, iHighLimit, dictMode, rep, ll0, lengthToBeat, mls);
2aa14b1ab2c41a Nick Terrell 2022-10-17  813  }
2aa14b1ab2c41a Nick Terrell 2022-10-17  814  
2aa14b1ab2c41a Nick Terrell 2022-10-17  815  #define ZSTD_BT_GET_ALL_MATCHES_FN(dictMode, mls) ZSTD_btGetAllMatches_##dictMode##_##mls
2aa14b1ab2c41a Nick Terrell 2022-10-17  816  
2aa14b1ab2c41a Nick Terrell 2022-10-17  817  #define GEN_ZSTD_BT_GET_ALL_MATCHES_(dictMode, mls)            \
2aa14b1ab2c41a Nick Terrell 2022-10-17  818      static U32 ZSTD_BT_GET_ALL_MATCHES_FN(dictMode, mls)(      \
2aa14b1ab2c41a Nick Terrell 2022-10-17  819              ZSTD_match_t* matches,                             \
2aa14b1ab2c41a Nick Terrell 2022-10-17  820              ZSTD_matchState_t* ms,                             \
2aa14b1ab2c41a Nick Terrell 2022-10-17  821              U32* nextToUpdate3,                                \
2aa14b1ab2c41a Nick Terrell 2022-10-17  822              const BYTE* ip,                                    \
2aa14b1ab2c41a Nick Terrell 2022-10-17  823              const BYTE* const iHighLimit,                      \
2aa14b1ab2c41a Nick Terrell 2022-10-17  824              const U32 rep[ZSTD_REP_NUM],                       \
2aa14b1ab2c41a Nick Terrell 2022-10-17  825              U32 const ll0,                                     \
2aa14b1ab2c41a Nick Terrell 2022-10-17  826              U32 const lengthToBeat)                            \
2aa14b1ab2c41a Nick Terrell 2022-10-17  827      {                                                          \
2aa14b1ab2c41a Nick Terrell 2022-10-17  828          return ZSTD_btGetAllMatches_internal(                  \
2aa14b1ab2c41a Nick Terrell 2022-10-17  829                  matches, ms, nextToUpdate3, ip, iHighLimit,    \
2aa14b1ab2c41a Nick Terrell 2022-10-17  830                  rep, ll0, lengthToBeat, ZSTD_##dictMode, mls); \
2aa14b1ab2c41a Nick Terrell 2022-10-17  831      }
2aa14b1ab2c41a Nick Terrell 2022-10-17  832  
2aa14b1ab2c41a Nick Terrell 2022-10-17  833  #define GEN_ZSTD_BT_GET_ALL_MATCHES(dictMode)  \
2aa14b1ab2c41a Nick Terrell 2022-10-17  834      GEN_ZSTD_BT_GET_ALL_MATCHES_(dictMode, 3)  \
2aa14b1ab2c41a Nick Terrell 2022-10-17  835      GEN_ZSTD_BT_GET_ALL_MATCHES_(dictMode, 4)  \
2aa14b1ab2c41a Nick Terrell 2022-10-17  836      GEN_ZSTD_BT_GET_ALL_MATCHES_(dictMode, 5)  \
2aa14b1ab2c41a Nick Terrell 2022-10-17  837      GEN_ZSTD_BT_GET_ALL_MATCHES_(dictMode, 6)
2aa14b1ab2c41a Nick Terrell 2022-10-17  838  
2aa14b1ab2c41a Nick Terrell 2022-10-17  839  GEN_ZSTD_BT_GET_ALL_MATCHES(noDict)
2aa14b1ab2c41a Nick Terrell 2022-10-17  840  GEN_ZSTD_BT_GET_ALL_MATCHES(extDict)
2aa14b1ab2c41a Nick Terrell 2022-10-17  841  GEN_ZSTD_BT_GET_ALL_MATCHES(dictMatchState)
2aa14b1ab2c41a Nick Terrell 2022-10-17  842  
2aa14b1ab2c41a Nick Terrell 2022-10-17  843  #define ZSTD_BT_GET_ALL_MATCHES_ARRAY(dictMode)  \
2aa14b1ab2c41a Nick Terrell 2022-10-17  844      {                                            \
2aa14b1ab2c41a Nick Terrell 2022-10-17  845          ZSTD_BT_GET_ALL_MATCHES_FN(dictMode, 3), \
2aa14b1ab2c41a Nick Terrell 2022-10-17  846          ZSTD_BT_GET_ALL_MATCHES_FN(dictMode, 4), \
2aa14b1ab2c41a Nick Terrell 2022-10-17  847          ZSTD_BT_GET_ALL_MATCHES_FN(dictMode, 5), \
2aa14b1ab2c41a Nick Terrell 2022-10-17  848          ZSTD_BT_GET_ALL_MATCHES_FN(dictMode, 6)  \
2aa14b1ab2c41a Nick Terrell 2022-10-17  849      }
2aa14b1ab2c41a Nick Terrell 2022-10-17  850  
2aa14b1ab2c41a Nick Terrell 2022-10-17 @851  static ZSTD_getAllMatchesFn
2aa14b1ab2c41a Nick Terrell 2022-10-17  852  ZSTD_selectBtGetAllMatches(ZSTD_matchState_t const* ms, ZSTD_dictMode_e const dictMode)
e0c1b49f5b674c Nick Terrell 2020-09-11  853  {
2aa14b1ab2c41a Nick Terrell 2022-10-17 @854      ZSTD_getAllMatchesFn const getAllMatchesFns[3][4] = {
2aa14b1ab2c41a Nick Terrell 2022-10-17  855          ZSTD_BT_GET_ALL_MATCHES_ARRAY(noDict),
2aa14b1ab2c41a Nick Terrell 2022-10-17  856          ZSTD_BT_GET_ALL_MATCHES_ARRAY(extDict),
2aa14b1ab2c41a Nick Terrell 2022-10-17  857          ZSTD_BT_GET_ALL_MATCHES_ARRAY(dictMatchState)
2aa14b1ab2c41a Nick Terrell 2022-10-17  858      };
2aa14b1ab2c41a Nick Terrell 2022-10-17  859      U32 const mls = BOUNDED(3, ms->cParams.minMatch, 6);
2aa14b1ab2c41a Nick Terrell 2022-10-17  860      assert((U32)dictMode < 3);
2aa14b1ab2c41a Nick Terrell 2022-10-17  861      assert(mls - 3 < 4);
2aa14b1ab2c41a Nick Terrell 2022-10-17 @862      return getAllMatchesFns[(int)dictMode][mls - 3];
e0c1b49f5b674c Nick Terrell 2020-09-11  863  }
e0c1b49f5b674c Nick Terrell 2020-09-11  864  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
