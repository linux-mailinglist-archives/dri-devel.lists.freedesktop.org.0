Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397C545A42
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 04:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E0F11B028;
	Fri, 10 Jun 2022 02:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F4711B00B;
 Fri, 10 Jun 2022 02:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654829762; x=1686365762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O0bL4sdftS81wR9WdNRMpX+rYzEHoW1ZVqEv1opZtjY=;
 b=UCuizI27B/O0qV6zeq/oBOFqF4L93hlVGF3eE1yT5hqTcMv3c+wXsU8h
 l7kBgZK0/ObHbJdwW3gI7YQExU/VgWvXadqAEXzi3/AA1/42eRlZWbx3l
 kR6K3zl90bOPU3yHLngR3cXKAzKCrGWThaEyTtIlcQCv+9BnKlCD3b2Et
 zUNZv18x/J0xKR/U0vWMbKfjU8+sw0V8tXIk9pMOBovTgl/rWtgXBSpX/
 zO9O9z3lz+SS/C2y1cJJILrCF22PuFqk+S14/4RGW+MG7JGa4R9GM3reh
 aVkXmUcdlwyV+3BR47qot5/+NpjYP8/Co7pfS8/ghv3dGRk3svPcbJGAb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266261298"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="266261298"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 19:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="616216426"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 09 Jun 2022 19:55:58 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nzUoX-000GdB-Ub;
 Fri, 10 Jun 2022 02:55:57 +0000
Date: Fri, 10 Jun 2022 10:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] iosys-map: Add word-sized reads
Message-ID: <202206101010.IAvFUbqo-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, daniel.vetter@ffwll.ch, llvm@lists.linux.dev,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, tzimmermann@suse.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on linus/master v5.19-rc1 next-20220609]
[cannot apply to tegra-drm/drm/tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-De-Marchi/iosys-map-Add-word-sized-reads/20220610-072113
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220610/202206101010.IAvFUbqo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 70d35fe1257e429266b83025997b400e9f79110e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7b9b2d6b8d738fe2857fa1a96f7f3c9d8c11e9cd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/iosys-map-Add-word-sized-reads/20220610-072113
        git checkout 7b9b2d6b8d738fe2857fa1a96f7f3c9d8c11e9cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1154:14: error: unknown type name '__iosys_map_rd_io_u64_case'
                   *last_in = record_read(&rec_map, last_switch_in_stamp);
                              ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
           ^
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1154:14: error: type-id cannot have a name
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:21: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                                     ^
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1154:14: error: expected ')'
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:34: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1154:14: note: to match this '('
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:28: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                     ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1155:9: error: unknown type name '__iosys_map_rd_io_u64_case'
                   *id = record_read(&rec_map, current_context_index);
                         ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1155:9: error: type-id cannot have a name
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:21: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                                     ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1155:9: error: expected ')'
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:34: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1155:9: note: to match this '('
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:28: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                     ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1156:12: error: unknown type name '__iosys_map_rd_io_u64_case'
                   *total = record_read(&rec_map, total_runtime);
                            ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1156:12: error: type-id cannot have a name
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1134:2: note: expanded from macro 'record_read'
           iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:21: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
--
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:165:6: error: unknown type name '__iosys_map_rd_io_u64_case'
                      ads_blob_read(guc, policies.dpc_promote_time));
                      ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
           ^
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:165:6: error: type-id cannot have a name
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:21: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                                     ^
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:165:6: error: expected ')'
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:34: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:165:6: note: to match this '('
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:28: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                     ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:167:6: error: unknown type name '__iosys_map_rd_io_u64_case'
                      ads_blob_read(guc, policies.max_num_work_items));
                      ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:167:6: error: type-id cannot have a name
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:21: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                                     ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:167:6: error: expected ')'
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:34: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:167:6: note: to match this '('
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:28: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
                                     ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:169:6: error: unknown type name '__iosys_map_rd_io_u64_case'
                      ads_blob_read(guc, policies.global_flags));
                      ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:3: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
                   ^
   include/linux/iosys-map.h:347:2: note: expanded from macro '__iosys_map_rd_io'
           __iosys_map_rd_io_u64_case(val__, vaddr_iomem__)                \
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:169:6: error: type-id cannot have a name
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:65:2: note: expanded from macro 'ads_blob_read'
           iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
           ^
   include/linux/iosys-map.h:452:2: note: expanded from macro 'iosys_map_rd_field'
           iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__), \
           ^
   include/linux/iosys-map.h:366:21: note: expanded from macro 'iosys_map_rd'
                   __iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\


vim +/__iosys_map_rd_io_u64_case +1154 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

77cdd054dd2ced Umesh Nerlige Ramappa 2021-10-26  1132  
4801b99588a2e0 Lucas De Marchi       2022-02-16  1133  #define record_read(map_, field_) \
4801b99588a2e0 Lucas De Marchi       2022-02-16  1134  	iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
4801b99588a2e0 Lucas De Marchi       2022-02-16  1135  
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1136  /*
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1137   * GuC updates shared memory and KMD reads it. Since this is not synchronized,
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1138   * we run into a race where the value read is inconsistent. Sometimes the
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1139   * inconsistency is in reading the upper MSB bytes of the last_in value when
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1140   * this race occurs. 2 types of cases are seen - upper 8 bits are zero and upper
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1141   * 24 bits are zero. Since these are non-zero values, it is non-trivial to
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1142   * determine validity of these values. Instead we read the values multiple times
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1143   * until they are consistent. In test runs, 3 attempts results in consistent
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1144   * values. The upper bound is set to 6 attempts and may need to be tuned as per
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1145   * any new occurences.
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1146   */
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1147  static void __get_engine_usage_record(struct intel_engine_cs *engine,
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1148  				      u32 *last_in, u32 *id, u32 *total)
77cdd054dd2ced Umesh Nerlige Ramappa 2021-10-26  1149  {
4801b99588a2e0 Lucas De Marchi       2022-02-16  1150  	struct iosys_map rec_map = intel_guc_engine_usage_record_map(engine);
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1151  	int i = 0;
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1152  
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1153  	do {
4801b99588a2e0 Lucas De Marchi       2022-02-16 @1154  		*last_in = record_read(&rec_map, last_switch_in_stamp);
4801b99588a2e0 Lucas De Marchi       2022-02-16  1155  		*id = record_read(&rec_map, current_context_index);
4801b99588a2e0 Lucas De Marchi       2022-02-16  1156  		*total = record_read(&rec_map, total_runtime);
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1157  
4801b99588a2e0 Lucas De Marchi       2022-02-16  1158  		if (record_read(&rec_map, last_switch_in_stamp) == *last_in &&
4801b99588a2e0 Lucas De Marchi       2022-02-16  1159  		    record_read(&rec_map, current_context_index) == *id &&
4801b99588a2e0 Lucas De Marchi       2022-02-16  1160  		    record_read(&rec_map, total_runtime) == *total)
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1161  			break;
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1162  	} while (++i < 6);
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1163  }
512712a824de9b Umesh Nerlige Ramappa 2022-01-24  1164  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
