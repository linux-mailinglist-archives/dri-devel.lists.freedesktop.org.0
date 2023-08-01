Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FE76C0D1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E0E10E446;
	Tue,  1 Aug 2023 23:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA5E10E01F;
 Tue,  1 Aug 2023 23:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690932167; x=1722468167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+vE+AAIO6NG6Ng7vxXC+NsijxE4eR3H3ZGvuVIMw7zU=;
 b=dxxuhf423mbMqZddc3+mmWQiwCAXeLZaeMSoJA1mBLQd1O9qkQ7pyuik
 nHBYhQvbdwmIGv79zfu6od2qtGn6CeIy6m6DkztbADsvNETFeQ18ydYG8
 DD1mj2UYb75SoRnEuy++P1IfZws2u0vDKLyDaspb38gRZXXo8v3Zpsbpm
 w7cLIo4mHcjo4CqM4WhGcdWbG++4+D/Iw0ovCgaTtFKEyI1znn6ilngKH
 kVJ6g6RnMyTmDgsLPSIeXtj0611XSxT9MdgV/5gjjt7+lgJhFFcxDAvg3
 Jk0KkL0i1pE4CrM2IHvJ8PWZn2OOrVCgjOZM+fmh7Qlc2isos5soo3mkR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="366900822"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="366900822"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 16:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="705962185"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="705962185"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 16:22:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qQyhQ-0000eR-1Q;
 Tue, 01 Aug 2023 23:22:44 +0000
Date: Wed, 2 Aug 2023 07:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: fixup the uapi header file.
Message-ID: <202308020752.d9JOnIHz-lkp@intel.com>
References: <20230731191557.4179175-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731191557.4179175-1-airlied@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev, skeggsb@gmail.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-nouveau-fixup-the-uapi-header-file/20230801-031705
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230731191557.4179175-1-airlied%40gmail.com
patch subject: [PATCH] drm/nouveau: fixup the uapi header file.
config: i386-randconfig-i012-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020752.d9JOnIHz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020752.d9JOnIHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020752.d9JOnIHz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/drm/nouveau_drm.h:48:2: error: unknown type name 'uint64_t'
           uint64_t param;
           ^
   ./usr/include/drm/nouveau_drm.h:49:2: error: unknown type name 'uint64_t'
           uint64_t value;
           ^
>> ./usr/include/drm/nouveau_drm.h:53:2: error: unknown type name 'uint32_t'
           uint32_t     fb_ctxdma_handle;
           ^
   ./usr/include/drm/nouveau_drm.h:54:2: error: unknown type name 'uint32_t'
           uint32_t     tt_ctxdma_handle;
           ^
   ./usr/include/drm/nouveau_drm.h:57:2: error: unknown type name 'uint32_t'
           uint32_t     pushbuf_domains;
           ^
   ./usr/include/drm/nouveau_drm.h:60:2: error: unknown type name 'uint32_t'
           uint32_t     notifier_handle;
           ^
   ./usr/include/drm/nouveau_drm.h:64:3: error: unknown type name 'uint32_t'
                   uint32_t handle;
                   ^
   ./usr/include/drm/nouveau_drm.h:65:3: error: unknown type name 'uint32_t'
                   uint32_t grclass;
                   ^
   ./usr/include/drm/nouveau_drm.h:67:2: error: unknown type name 'uint32_t'
           uint32_t nr_subchan;
           ^
   9 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
