Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF62854682A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 16:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196D810FFD6;
	Fri, 10 Jun 2022 14:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3E910FFD6;
 Fri, 10 Jun 2022 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654870725; x=1686406725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JFfsauw7AlZpGmFT/Qx+HEff2BTPbX68cztReTL3zXw=;
 b=Vqg5SObfofTCdxaDhFA3SalBleuwAE9rOq4SD7/ogIkgVvx7m+TmM5jA
 DIeqySG2/1MXlOdG5R8V/te2KYG2YRXd5Krk/NTDGWjCkgK79V5vVphj1
 7t10RvqZfFRho260CrqY74u27hPHltEdLaR2QoHiUzCdrKvBpescvaP33
 97rR4m3NlCneMj8/cdYh0UYBdLLJ/ljADQtuwI2aB6V6GAUyenF0t4PT7
 GZlnsEuZ3Gb/Auo6akFY+I+TdKND0bA7JibeKFVdsKq2L+8ym6MsLqbix
 bJAtKQhx4tLFFvJOuZ5nT7HJF+7AFRUhPFGOJkOGgTGgK3hDqrYxY36QM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278777580"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278777580"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 07:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="638158790"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2022 07:18:41 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nzfTF-000I0b-4y;
 Fri, 10 Jun 2022 14:18:41 +0000
Date: Fri, 10 Jun 2022 22:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] iosys-map: Add word-sized reads
Message-ID: <202206102230.Ji70o9lR-lkp@intel.com>
References: <20220609232020.2292649-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609232020.2292649-1-lucas.demarchi@intel.com>
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
Cc: kbuild-all@lists.01.org, daniel.vetter@ffwll.ch,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, tzimmermann@suse.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on linus/master v5.19-rc1 next-20220610]
[cannot apply to tegra-drm/drm/tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-De-Marchi/iosys-map-Add-word-sized-reads/20220610-072113
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220610/202206102230.Ji70o9lR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/7b9b2d6b8d738fe2857fa1a96f7f3c9d8c11e9cd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/iosys-map-Add-word-sized-reads/20220610-072113
        git checkout 7b9b2d6b8d738fe2857fa1a96f7f3c9d8c11e9cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:10,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9,
                    from drivers/gpu/drm/i915/gt/intel_gt_types.h:18,
                    from drivers/gpu/drm/i915/gt/intel_gt.h:10,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:9:
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c: In function 'intel_guc_ads_print_policy_info':
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:165:20: note: in expansion of macro 'ads_blob_read'
     165 |                    ads_blob_read(guc, policies.dpc_promote_time));
         |                    ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/iosys-map.h:347:36: note: in definition of macro '__iosys_map_rd_io'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |                                    ^~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:165:20: note: in expansion of macro 'ads_blob_read'
     165 |                    ads_blob_read(guc, policies.dpc_promote_time));
         |                    ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:167:20: note: in expansion of macro 'ads_blob_read'
     167 |                    ads_blob_read(guc, policies.max_num_work_items));
         |                    ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/iosys-map.h:347:36: note: in definition of macro '__iosys_map_rd_io'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |                                    ^~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:167:20: note: in expansion of macro 'ads_blob_read'
     167 |                    ads_blob_read(guc, policies.max_num_work_items));
         |                    ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:169:20: note: in expansion of macro 'ads_blob_read'
     169 |                    ads_blob_read(guc, policies.global_flags));
         |                    ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/iosys-map.h:347:36: note: in definition of macro '__iosys_map_rd_io'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |                                    ^~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:169:20: note: in expansion of macro 'ads_blob_read'
     169 |                    ads_blob_read(guc, policies.global_flags));
         |                    ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c: In function 'intel_guc_global_policies_update':
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:192:30: note: in expansion of macro 'ads_blob_read'
     192 |         scheduler_policies = ads_blob_read(guc, ads.scheduler_policies);
         |                              ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/iosys-map.h:347:36: note: in definition of macro '__iosys_map_rd_io'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |                                    ^~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:192:30: note: in expansion of macro 'ads_blob_read'
     192 |         scheduler_policies = ads_blob_read(guc, ads.scheduler_policies);
         |                              ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c: In function 'guc_prep_golden_context':
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:75:9: note: in expansion of macro 'iosys_map_rd_field'
      75 |         iosys_map_rd_field(map_, 0, struct guc_gt_system_info, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:505:22: note: in expansion of macro 'info_map_read'
     505 |                 if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
         |                      ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/iosys-map.h:347:36: note: in definition of macro '__iosys_map_rd_io'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |                                    ^~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:75:9: note: in expansion of macro 'iosys_map_rd_field'
      75 |         iosys_map_rd_field(map_, 0, struct guc_gt_system_info, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:505:22: note: in expansion of macro 'info_map_read'
     505 |                 if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
         |                      ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c: In function 'guc_init_golden_context':
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:584:22: note: in expansion of macro 'ads_blob_read'
     584 |                 if (!ads_blob_read(guc, system_info.engine_enabled_masks[guc_class]))
         |                      ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/iosys-map.h:347:36: note: in definition of macro '__iosys_map_rd_io'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |                                    ^~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:584:22: note: in expansion of macro 'ads_blob_read'
     584 |                 if (!ads_blob_read(guc, system_info.engine_enabled_masks[guc_class]))
         |                      ^~~~~~~~~~~~~
   In file included from include/linux/bitfield.h:10,
                    from drivers/gpu/drm/i915/i915_reg_defs.h:9,
                    from drivers/gpu/drm/i915/gt/intel_engine_regs.h:9,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:8:
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:600:17: note: in expansion of macro 'GEM_BUG_ON'
     600 |                 GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
         |                 ^~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:600:28: note: in expansion of macro 'ads_blob_read'
     600 |                 GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
         |                            ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:600:17: note: in expansion of macro 'GEM_BUG_ON'
     600 |                 GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
         |                 ^~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:600:28: note: in expansion of macro 'ads_blob_read'
     600 |                 GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
         |                            ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:602:17: note: in expansion of macro 'GEM_BUG_ON'
     602 |                 GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
         |                 ^~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:602:28: note: in expansion of macro 'ads_blob_read'
     602 |                 GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
         |                            ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:602:17: note: in expansion of macro 'GEM_BUG_ON'
     602 |                 GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
         |                 ^~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:9: note: in expansion of macro 'iosys_map_rd_field'
      65 |         iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:602:28: note: in expansion of macro 'ads_blob_read'
     602 |                 GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
         |                            ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:10,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9,
                    from drivers/gpu/drm/i915/gt/intel_gt_types.h:18,
                    from drivers/gpu/drm/i915/gt/intel_gt.h:10,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:9:
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c: In function 'guc_capture_prep_lists':
>> include/linux/iosys-map.h:347:9: error: unknown type name '__iosys_map_rd_io_u64_case'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:366:17: note: in expansion of macro '__iosys_map_rd_io'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:75:9: note: in expansion of macro 'iosys_map_rd_field'
      75 |         iosys_map_rd_field(map_, 0, struct guc_gt_system_info, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:652:30: note: in expansion of macro 'info_map_read'
     652 |                         if (!info_map_read(&info_map, engine_enabled_masks[j])) {
         |                              ^~~~~~~~~~~~~
>> include/linux/iosys-map.h:366:35: error: expected ')' before 'val'
     366 |                 __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
         |                                   ^~~
   include/linux/iosys-map.h:347:36: note: in definition of macro '__iosys_map_rd_io'
     347 |         __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
         |                                    ^~~~~
   include/linux/iosys-map.h:452:9: note: in expansion of macro 'iosys_map_rd'
     452 |         iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:75:9: note: in expansion of macro 'iosys_map_rd_field'
      75 |         iosys_map_rd_field(map_, 0, struct guc_gt_system_info, field_)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:652:30: note: in expansion of macro 'info_map_read'
     652 |                         if (!info_map_read(&info_map, engine_enabled_masks[j])) {
         |                              ^~~~~~~~~~~~~
..


vim +/__iosys_map_rd_io_u64_case +347 include/linux/iosys-map.h

   342	
   343	#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,	\
   344		u8: val__ = readb(vaddr_iomem__),				\
   345		u16: val__ = readw(vaddr_iomem__),				\
   346		u32: val__ = readl(vaddr_iomem__),				\
 > 347		__iosys_map_rd_io_u64_case(val__, vaddr_iomem__)		\
   348		default: memcpy_fromio(&(val__), vaddr_iomem__, sizeof(val__)))
   349	
   350	/**
   351	 * iosys_map_rd - Read a C-type value from the iosys_map
   352	 *
   353	 * @map__:	The iosys_map structure
   354	 * @offset__:	The offset from which to read
   355	 * @type__:	Type of the value being read
   356	 *
   357	 * Read a C type value from iosys_map, handling possible un-aligned accesses to
   358	 * the mapping.
   359	 *
   360	 * Returns:
   361	 * The value read from the mapping.
   362	 */
   363	#define iosys_map_rd(map__, offset__, type__) ({				\
   364		type__ val;								\
   365		if ((map__)->is_iomem) {						\
 > 366			__iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
   367		} else {								\
   368			memcpy(&val, (map__)->vaddr + offset__, sizeof(val));		\
   369		}									\
   370		val;									\
   371	})
   372	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
