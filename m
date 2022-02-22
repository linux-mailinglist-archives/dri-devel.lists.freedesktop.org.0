Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F04C055D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 00:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A1A10E1EA;
	Tue, 22 Feb 2022 23:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C725010E158;
 Tue, 22 Feb 2022 23:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645572675; x=1677108675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QIgfrZlOCONxvByS59oh2FTC9H9a2J1Z4J1fWPdqKZY=;
 b=QgTmdcPCoY5cXAIwA1JqdtpAVo7xpFCdgWpyUrFp/c4cdsPZ9V2KxxT5
 hM2wMTVL+4xC8rFsAMjMCYfmYnORq205CcXue4S+0bN/KwwycMhFUf1Ej
 5eB7Z8wCxhte2WIPNRgmpaninUY2ArhVfEqPKhS5i1cI+b68lfpWB7boX
 ICcRx+75RFAJ1HSPV+WISWJZJV5Orl0sXmYHM1/wKI9/G3YRdFJbAcP3k
 yuHWqqiApPj47i1M1Dbo/w5cYA3Hc44sg8+wHhwQZMa5Z6zc1aLs0xQY4
 e3Z3eUS05hxVJpwIcp5U8MJAd8SFDNV3WgcrViFKnX9wH8dT1OreY0z0z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231811653"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="231811653"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 15:31:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="591494403"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 22 Feb 2022 15:31:07 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMecc-0000je-Rc; Tue, 22 Feb 2022 23:31:06 +0000
Date: Wed, 23 Feb 2022 07:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 1/3] drm_cache: Add logic for wbvind_on_all_cpus
Message-ID: <202202230702.Ya7PkY7G-lkp@intel.com>
References: <20220222172649.331661-2-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222172649.331661-2-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, casey.g.bowman@intel.com,
 kbuild-all@lists.01.org, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, llvm@lists.linux.dev, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, michael.cheng@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Move-define-wbvind_on_all_cpus/20220223-012853
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: hexagon-randconfig-r041-20220221 (https://download.01.org/0day-ci/archive/20220223/202202230702.Ya7PkY7G-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3aaa40c95b16a78c9059a77536de70bb08ce05e9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Move-define-wbvind_on_all_cpus/20220223-012853
        git checkout 3aaa40c95b16a78c9059a77536de70bb08ce05e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_cache.c:37:
   In file included from include/drm/drm_cache.h:37:
>> arch/hexagon/include/asm/smp.h:13:9: warning: 'raw_smp_processor_id' macro redefined [-Wmacro-redefined]
   #define raw_smp_processor_id() (current_thread_info()->cpu)
           ^
   include/linux/smp.h:191:9: note: previous definition is here
   #define raw_smp_processor_id()                  0
           ^
   1 warning generated.


vim +/raw_smp_processor_id +13 arch/hexagon/include/asm/smp.h

43afdf50838634 Richard Kuo 2011-10-31  12  
43afdf50838634 Richard Kuo 2011-10-31 @13  #define raw_smp_processor_id() (current_thread_info()->cpu)
43afdf50838634 Richard Kuo 2011-10-31  14  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
