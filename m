Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2076BF64
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 23:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB2B10E41A;
	Tue,  1 Aug 2023 21:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D2610E413;
 Tue,  1 Aug 2023 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690925985; x=1722461985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NpKbs896n8PObHfMtiWpVNqOsXd/fNuStxvlzVyxdxE=;
 b=UUZyJj3bwGMiuiwhUmnu+KXFyg792Cvad8t5pUxMqyuc5p824qR9UW80
 0jw8TeLsNrPYua/ZAv7N23Sm7YIjZs1147Az60NlDOLW6JOeWF8/nX6w7
 kxvIXN0g5eaqJuuDA9dcLhW8Jc36uFfZfPrzPOC3SCq2qmYM2PgoBcSB4
 rSw/A0U8+K+zTC6VL+qncqDj0U0dvysovxtTH2rZCq/I4R1kMSsjJUB2H
 dweiJ1/JrFMaiJs5s+aBOJekZJm0RxNT72IovhwFU+ttAcqcSMaIXxBrh
 B0/mjVA3Py6+5bxQpwExL4j8wtu0hY7Cm2tc3CSL4oYg1JBLIRk4/qm84 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="349722346"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="349722346"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 14:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="1059577483"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="1059577483"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2023 14:39:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qQx5i-0000bp-2R;
 Tue, 01 Aug 2023 21:39:42 +0000
Date: Wed, 2 Aug 2023 05:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: fixup the uapi header file.
Message-ID: <202308020519.O6kM2q1k-lkp@intel.com>
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
Cc: nouveau@lists.freedesktop.org, skeggsb@gmail.com,
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
config: i386-randconfig-m021-20230730 (https://download.01.org/0day-ci/archive/20230802/202308020519.O6kM2q1k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020519.O6kM2q1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020519.O6kM2q1k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/drm/nouveau_drm.h:48:9: error: unknown type name 'uint64_t'
      48 |         uint64_t param;
         |         ^~~~~~~~
   ./usr/include/drm/nouveau_drm.h:49:9: error: unknown type name 'uint64_t'
      49 |         uint64_t value;
         |         ^~~~~~~~
>> ./usr/include/drm/nouveau_drm.h:53:9: error: unknown type name 'uint32_t'
      53 |         uint32_t     fb_ctxdma_handle;
         |         ^~~~~~~~
   ./usr/include/drm/nouveau_drm.h:54:9: error: unknown type name 'uint32_t'
      54 |         uint32_t     tt_ctxdma_handle;
         |         ^~~~~~~~
   ./usr/include/drm/nouveau_drm.h:57:9: error: unknown type name 'uint32_t'
      57 |         uint32_t     pushbuf_domains;
         |         ^~~~~~~~
   ./usr/include/drm/nouveau_drm.h:60:9: error: unknown type name 'uint32_t'
      60 |         uint32_t     notifier_handle;
         |         ^~~~~~~~
   ./usr/include/drm/nouveau_drm.h:64:17: error: unknown type name 'uint32_t'
      64 |                 uint32_t handle;
         |                 ^~~~~~~~
   ./usr/include/drm/nouveau_drm.h:65:17: error: unknown type name 'uint32_t'
      65 |                 uint32_t grclass;
         |                 ^~~~~~~~
   ./usr/include/drm/nouveau_drm.h:67:9: error: unknown type name 'uint32_t'
      67 |         uint32_t nr_subchan;
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
