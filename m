Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA62ADECD1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 14:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635AE10E815;
	Wed, 18 Jun 2025 12:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1+QSRJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DC610E827
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750250567; x=1781786567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U3QVeTEgxFm4JMribOpKn4yHkR72d8sO0EKYIQdXhnQ=;
 b=A1+QSRJghEYMpyXToJeMiwldyqfa04tkCK8H11ELnv9xtwxIAshNRXSl
 q5JQKIZzx9ehA/xGITQPkiPWQOItb2yf2vgxEfzCCURaArWxShB0wZg00
 qJni4rKVLJSjtUp8mWwt2GAo1f5eD9sjAyPOzxxKIHdplkpd3B+fakk4N
 lUzFUSnJoiaKQG3KyWsVU86bNYKodwQVCaS8dQRiYTz3ohqO/ctdANofh
 0zildtW+jNCLXTUVAUCoLdtiBcuk0LeNOpJtfm+VBJcsAhSd6lYsY0IkG
 wxqtO2tTEcaEif5k6IPGbV80KjE7suo7XJ02nRaTrigad8xe42PQRerf6 A==;
X-CSE-ConnectionGUID: SOhdMwK0SPq3mYdiEIPPFQ==
X-CSE-MsgGUID: //hDYe7nSsuqpIgtYxcz0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="62741709"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="62741709"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:42:46 -0700
X-CSE-ConnectionGUID: EdabbREvRfaI4+tk0ICOQw==
X-CSE-MsgGUID: hjlF0qJmSVS+TZJUCf1eJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="180569245"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 05:42:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uRs7k-000Jm6-0s;
 Wed, 18 Jun 2025 12:42:40 +0000
Date: Wed, 18 Jun 2025 20:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 tvrtko.ursulin@igalia.com, Felix.Kuehling@amd.com,
 David.YatSin@amd.com, Chris.Freehill@amd.com,
 Christian.Koenig@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de,
 David Francis <David.Francis@amd.com>
Subject: Re: [PATCH 3/4] drm/amdgpu: Add CRIU mapping info ioctl
Message-ID: <202506182058.pHESGM1d-lkp@intel.com>
References: <20250617194536.538681-4-David.Francis@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617194536.538681-4-David.Francis@amd.com>
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

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.16-rc2]
[cannot apply to next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Francis/drm-amdgpu-Add-CRIU-ioctl-to-get-bo-info/20250618-044539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250617194536.538681-4-David.Francis%40amd.com
patch subject: [PATCH 3/4] drm/amdgpu: Add CRIU mapping info ioctl
config: i386-buildonly-randconfig-005-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182058.pHESGM1d-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506182058.pHESGM1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506182058.pHESGM1d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'invalids' in 'struct amdgpu_bo_va_mapping'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^                                        ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:40: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                                               ~~~~~  ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'invalids' in 'struct amdgpu_bo_va_mapping'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^                                        ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:40: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                                               ~~~~~  ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:503:63: note: expanded from macro '__same_type'
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'invalids' in 'struct amdgpu_bo_va_mapping'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^                                        ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:40: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                                               ~~~~~  ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:503:63: note: expanded from macro '__same_type'
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'list' in 'amdgpu_bo_va'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:3: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                 ^                                              ~~~~
   include/linux/list.h:770:13: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^                                    ~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^                             ~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^                       ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'list' in 'struct amdgpu_bo_va'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^                                                 ~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:50: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                                     ~~~~~~~                    ^
   include/linux/list.h:771:38: note: expanded from macro 'list_for_each_entry'
     771 |              !list_entry_is_head(pos, head, member);                    \
         |                                  ~~~        ^
   include/linux/list.h:761:21: note: expanded from macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                       ~~~  ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'invalids' in 'struct amdgpu_bo_va_mapping'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^                                        ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:40: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                                               ~~~~~  ^
   include/linux/list.h:771:32: note: expanded from macro 'list_for_each_entry'
     771 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:761:30: note: expanded from macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'list' in 'struct amdgpu_bo_va'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:50: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:772:34: note: expanded from macro 'list_for_each_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'list' in 'struct amdgpu_bo_va'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:50: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:772:34: note: expanded from macro 'list_for_each_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:503:63: note: expanded from macro '__same_type'
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'list' in 'struct amdgpu_bo_va'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:50: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:772:34: note: expanded from macro 'list_for_each_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:503:63: note: expanded from macro '__same_type'
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:208:2: error: no member named 'list' in 'amdgpu_bo_va'
     208 |         amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h:674:3: note: expanded from macro 'amdgpu_vm_bo_va_for_each_invalid_mapping'
     674 |                 list_for_each_entry(mapping, &bo_va->invalids, list)
         |                 ^                                              ~~~~
   include/linux/list.h:772:13: note: expanded from macro 'list_for_each_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ^                    ~~~~~~
   include/linux/list.h:645:2: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^                                              ~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^                       ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   10 errors generated.


vim +208 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c

   145	
   146	/**
   147	 * amdgpu_criu_mapping_info_ioctl - get information about a buffer's mappings
   148	 *
   149	 * @dev: drm device pointer
   150	 * @data: drm_amdgpu_criu_mapping_info_args
   151	 * @filp: drm file pointer
   152	 *
   153	 * num_mappings is set as an input to the size of the vm_buckets array.
   154	 * num_mappings is sent back as output as the number of mappings the bo has.
   155	 * If that number is larger than the size of the array, the ioctl must
   156	 * be retried.
   157	 *
   158	 * Returns:
   159	 * 0 for success, -errno for errors.
   160	 */
   161	int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
   162	                struct drm_file *filp)
   163	{
   164	    struct drm_amdgpu_criu_mapping_info_args *args = data;
   165	    struct drm_gem_object *gobj = idr_find(&filp->object_idr, args->gem_handle);
   166	    struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)filp->driver_priv)->vm;
   167	    struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
   168	    struct amdgpu_bo_va *bo_va = amdgpu_vm_bo_find(avm, bo);
   169	    struct amdgpu_fpriv *fpriv = filp->driver_priv;
   170	    struct drm_amdgpu_criu_vm_bucket *vm_buckets;
   171	    struct amdgpu_bo_va_mapping *mapping;
   172	    struct drm_exec exec;
   173	    int num_mappings = 0;
   174	    int ret;
   175	
   176	    vm_buckets = kvzalloc(args->num_mappings * sizeof(*vm_buckets), GFP_KERNEL);
   177	    if (!vm_buckets) {
   178	        ret = -ENOMEM;
   179	        goto free_vms;
   180	    }
   181	
   182	    drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
   183	              DRM_EXEC_IGNORE_DUPLICATES, 0);
   184	    drm_exec_until_all_locked(&exec) {
   185	        if (gobj) {
   186	            ret = drm_exec_lock_obj(&exec, gobj);
   187	            drm_exec_retry_on_contention(&exec);
   188	            if (ret)
   189	                goto unlock_exec;
   190	        }
   191	
   192	        ret = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
   193	        drm_exec_retry_on_contention(&exec);
   194	        if (ret)
   195	            goto unlock_exec;
   196	    }
   197	
   198		amdgpu_vm_bo_va_for_each_valid_mapping(bo_va, mapping) {
   199	        if (num_mappings < args->num_mappings) {
   200	            vm_buckets[num_mappings].start = mapping->start;
   201	            vm_buckets[num_mappings].last = mapping->last;
   202	            vm_buckets[num_mappings].offset = mapping->offset;
   203	            vm_buckets[num_mappings].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
   204	        }
   205	        num_mappings += 1;
   206		}
   207	
 > 208		amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
