Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0F4C0386
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4BD10E6CD;
	Tue, 22 Feb 2022 21:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFCF10E69B;
 Tue, 22 Feb 2022 21:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645564086; x=1677100086;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HudAJSnASomyFTW3O8YCdCDMFySpKwzLS52NWQNyAIY=;
 b=fT5szqbm+aIT+bZDG9BbfXvOB0TgMtIk8bqZBwRsbaYLPBwJCBOGd974
 EOxEHDnEKw/52Q/FUw9RXdCAxdhSyvX+dCKoBa6e1InoOq3hgRpgfVnVj
 r4sgoP7TYiVodZoPf8JC8fGhX8+tdunJkq/HTR0k1MhPkG6GNFo/maAuF
 9aAc/XNQhV1oqNP6DLNQt7dsI5/Xxud+xkuzKBdPglFNwDAk8qADCgp3x
 YW1ZcM//u3aPghpitpN68xJAGfuiSOhfR3AayGcHsa0W4SrWlv11fFtEI
 UNRgVnytty/vBtT4pm7+R/DBf0gaf3lMJrQQpWacMcnAcCvsC7InM6whD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338251417"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="338251417"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 13:08:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="637163817"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2022 13:08:03 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMcOA-0000cW-J0; Tue, 22 Feb 2022 21:08:02 +0000
Date: Wed, 23 Feb 2022 05:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 1/3] drm_cache: Add logic for wbvind_on_all_cpus
Message-ID: <202202230507.uLh3qqTV-lkp@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, kbuild-all@lists.01.org,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, michael.cheng@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm/drm-next drm-tip/drm-tip v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Move-define-wbvind_on_all_cpus/20220223-012853
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: nios2-randconfig-r003-20220221 (https://download.01.org/0day-ci/archive/20220223/202202230507.uLh3qqTV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3aaa40c95b16a78c9059a77536de70bb08ce05e9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Move-define-wbvind_on_all_cpus/20220223-012853
        git checkout 3aaa40c95b16a78c9059a77536de70bb08ce05e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_cache.c:37:
>> include/drm/drm_cache.h:37:10: fatal error: asm/smp.h: No such file or directory
      37 | #include <asm/smp.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +37 include/drm/drm_cache.h

    35	
    36	#include <linux/scatterlist.h>
  > 37	#include <asm/smp.h>
    38	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
