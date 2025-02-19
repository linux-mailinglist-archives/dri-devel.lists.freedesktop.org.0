Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C5A3B07E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 05:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8557910E20F;
	Wed, 19 Feb 2025 04:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YakXu136";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBDE10E1E2;
 Wed, 19 Feb 2025 04:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739940766; x=1771476766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q8ctQsR2351bxrMFb8cCweqJBN/E/bdNGQaYMMTG9Iw=;
 b=YakXu13654mDgOI7mW4oAn9mjGPkLRTHjEQzPQ0tJpScgzAODLK8m83M
 +WDXTZnFEIF2MuukIbWNuqCo1EaKsUdYizY0vmX4ZCKQIFHs2lVCwPEM2
 Sx2rGyrnDeUfLPVHSKnjwjdBEDukzQP2x9PJfSP4EXj7+q7aBWqKFUVNN
 YTsIfUvdcQK8nxujoTlrs+hcODin5Ot1UwfUlseFqarA9anin2l4MSkPu
 n72MAQgh0tJ6bWMzn9lwiWBZdwgBlkfNbMHKStoEKizjoOe98YU+5062q
 e6eNb+2+OHeS4/PHL+zz+ucgzSotgYTBAtqMA6/CTRlLgNwFCmeyGs7DD Q==;
X-CSE-ConnectionGUID: yMKrpzdjSnmlcvZ+IlBM4w==
X-CSE-MsgGUID: rys+Q3WpQYGODsvx+l6XOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43495370"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="43495370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 20:52:45 -0800
X-CSE-ConnectionGUID: 3uZNm+txTRiSv/mFjGpSzQ==
X-CSE-MsgGUID: y6PB4NRPQL61whdOUES/kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119254335"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2025 20:52:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tkc4S-0001Fd-38;
 Wed, 19 Feb 2025 04:52:33 +0000
Date: Wed, 19 Feb 2025 12:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 lucas.demarch@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: Re: [PATCH v2 6/6] drm/xe/xe_query: Add support for per-drm-client
 reset stat querying
Message-ID: <202502191202.It7kBP8q-lkp@intel.com>
References: <20250218202426.103151-7-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218202426.103151-7-jonathan.cavitt@intel.com>
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

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250218]
[cannot apply to linus/master v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_exec_queue-Add-ID-param-to-exec-queue-struct/20250219-042528
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250218202426.103151-7-jonathan.cavitt%40intel.com
patch subject: [PATCH v2 6/6] drm/xe/xe_query: Add support for per-drm-client reset stat querying
config: xtensa-randconfig-001-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191202.It7kBP8q-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191202.It7kBP8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191202.It7kBP8q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_query.c: In function 'calc_reset_stats_size':
>> drivers/gpu/drm/xe/xe_query.c:749:26: error: 'struct xe_drm_client' has no member named 'blame_lock'
     749 |         spin_lock(&client->blame_lock);
         |                          ^~
>> drivers/gpu/drm/xe/xe_query.c:750:62: error: 'struct xe_drm_client' has no member named 'blame_len'
     750 |         size += sizeof(struct drm_xe_exec_queue_ban) * client->blame_len;
         |                                                              ^~
   drivers/gpu/drm/xe/xe_query.c:751:26: error: 'struct xe_drm_client' has no member named 'blame_lock'
     751 |         spin_lock(&client->blame_lock);
         |                          ^~
   drivers/gpu/drm/xe/xe_query.c: In function 'query_reset_stats':
>> drivers/gpu/drm/xe/xe_query.c:778:47: error: 'struct xe_drm_client' has no member named 'reset_count'
     778 |         resp.reset_count = atomic_read(&client->reset_count);
         |                                               ^~
   drivers/gpu/drm/xe/xe_query.c:780:26: error: 'struct xe_drm_client' has no member named 'blame_lock'
     780 |         spin_lock(&client->blame_lock);
         |                          ^~
   drivers/gpu/drm/xe/xe_query.c:781:32: error: 'struct xe_drm_client' has no member named 'blame_len'
     781 |         resp.ban_count = client->blame_len;
         |                                ^~
   In file included from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from drivers/gpu/drm/xe/xe_query.c:9:
>> drivers/gpu/drm/xe/xe_query.c:782:39: error: 'struct xe_drm_client' has no member named 'blame_list'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |                                       ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_query.c:782:9: note: in expansion of macro 'list_for_each_entry'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
>> drivers/gpu/drm/xe/xe_query.c:782:39: error: 'struct xe_drm_client' has no member named 'blame_list'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |                                       ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_query.c:782:9: note: in expansion of macro 'list_for_each_entry'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_query.c:782:39: error: 'struct xe_drm_client' has no member named 'blame_list'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |                                       ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_query.c:782:9: note: in expansion of macro 'list_for_each_entry'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:483:27: error: expression in static assertion is not an integer
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_query.c:782:9: note: in expansion of macro 'list_for_each_entry'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_query.c:782:39: error: 'struct xe_drm_client' has no member named 'blame_list'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |                                       ^~
   include/linux/list.h:761:37: note: in definition of macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/gpu/drm/xe/xe_query.c:782:9: note: in expansion of macro 'list_for_each_entry'
     782 |         list_for_each_entry(b, &client->blame_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_query.c:800:28: error: 'struct xe_drm_client' has no member named 'blame_lock'
     800 |         spin_unlock(&client->blame_lock);
         |                            ^~


vim +749 drivers/gpu/drm/xe/xe_query.c

   744	
   745	static size_t calc_reset_stats_size(struct xe_drm_client *client)
   746	{
   747		size_t size = sizeof(struct drm_xe_query_reset_stats);
   748	
 > 749		spin_lock(&client->blame_lock);
 > 750		size += sizeof(struct drm_xe_exec_queue_ban) * client->blame_len;
   751		spin_lock(&client->blame_lock);
   752	
   753		return size;
   754	}
   755	
   756	static int query_reset_stats(struct xe_device *xe,
   757				     struct drm_xe_device_query *query,
   758				     struct drm_file *file)
   759	{
   760		void __user *query_ptr = u64_to_user_ptr(query->data);
   761		struct drm_xe_query_reset_stats resp;
   762		struct xe_file *xef = to_xe_file(file);
   763		struct xe_drm_client *client = xef->client;
   764		struct blame *b;
   765		size_t size = calc_reset_stats_size(client);
   766		int i = 0;
   767	
   768		if (query->size == 0) {
   769			query->size = size;
   770			return 0;
   771		} else if (XE_IOCTL_DBG(xe, query->size != size)) {
   772			return -EINVAL;
   773		}
   774	
   775		if (copy_from_user(&resp, query_ptr, size))
   776			return -EFAULT;
   777	
 > 778		resp.reset_count = atomic_read(&client->reset_count);
   779	
   780		spin_lock(&client->blame_lock);
 > 781		resp.ban_count = client->blame_len;
 > 782		list_for_each_entry(b, &client->blame_list, list) {
   783			struct drm_xe_exec_queue_ban *ban = &resp.ban_list[i++];
   784			struct pagefault *pf = b->pf;
   785	
   786			ban->exec_queue_id = b->exec_queue_id;
   787			ban->pf_found = pf ? 1 : 0;
   788			if (!pf)
   789				continue;
   790	
   791			ban->access_type = pf->access_type;
   792			ban->fault_type = pf->fault_type;
   793			ban->vfid = pf->vfid;
   794			ban->asid = pf->asid;
   795			ban->pdata = pf->pdata;
   796			ban->engine_class = xe_to_user_engine_class[pf->engine_class];
   797			ban->engine_instance = pf->engine_instance;
   798			ban->fault_addr = pf->page_addr;
   799		}
   800		spin_unlock(&client->blame_lock);
   801	
   802		if (copy_to_user(query_ptr, &resp, size))
   803			return -EFAULT;
   804	
   805		return 0;
   806	}
   807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
