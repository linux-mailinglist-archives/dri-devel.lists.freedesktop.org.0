Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D054C1A09
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 18:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BE310E27B;
	Wed, 23 Feb 2022 17:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1F10E1A4;
 Wed, 23 Feb 2022 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645638225; x=1677174225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uIha5lnBQ66T+YaH0cbufqYHRGsTz5rnB/uxz/JJ4NA=;
 b=JFm+wu2oDZB1WEAHRZ+eLtRFpZMBHsIry78Zwmvth9dLvt3CyqLAJt1+
 rwjxrP84eLIuI5EEq8QnMlaOM8Rm7t1vMjtX/YHtPr/b2TZOJPyfTqgBU
 sXtSYEFYgRX3HaW63UMcc5kzDrrwbaU/OAQ28FGtKw6Sq+a/sTdBvTtFc
 88fLOFjziz3eES6GRpEKkudEhksSjWXSiW7RcqafVyIOVuipI53vEPaQ7
 BLajsJ5chtlSfjyy+1VpGbDRyRYMB8Up7dSh4BQ7nBoYhgRne0tzL1Kkb
 Nvc4ZZeisCQ+MqytkS50atJNmu4OWRAff/nJrH4pfXqGkiNMeXiBw5Mrb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="250864740"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="250864740"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 09:43:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="707129173"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 23 Feb 2022 09:43:40 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMvfw-0001ey-8r; Wed, 23 Feb 2022 17:43:40 +0000
Date: Thu, 24 Feb 2022 01:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v11 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Message-ID: <202202240139.LQIfrVfS-lkp@intel.com>
References: <20220223055900.415627-2-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223055900.415627-2-michael.cheng@intel.com>
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

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on drm/drm-next]
[cannot apply to drm-intel/for-linux-next v5.17-rc5 next-20220222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220223-140110
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20220224/202202240139.LQIfrVfS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f4c92ba1f52db578a26ac9944e2cbe52c548e8e9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220223-140110
        git checkout f4c92ba1f52db578a26ac9944e2cbe52c548e8e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dcache_clean_inval_poc" [drivers/gpu/drm/drm.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
