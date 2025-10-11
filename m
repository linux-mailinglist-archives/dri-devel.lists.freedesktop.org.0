Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C3BCEE7D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 04:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D218E10E144;
	Sat, 11 Oct 2025 02:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USJytzyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D1E10E144
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760148961; x=1791684961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HAjCWKolC3ZacDQUc7fPdoNjpnlO+ipcnTC8RVumBKA=;
 b=USJytzyIrD7mKYDVL6MWRLivcwbIAA8DeQtSr1lryjDOJNqZX2R6HnwW
 HvvUYoA4HFDM4t1HcwbzOrB+5/70kXfnntB/oKnXTIVK/y22oY7MPQIeR
 0Sb/uhfO4dNfS9Hvgxnldxe3fNrQM18LGZciJ2cIKr1kd8qb1fsqNWDwX
 EvcUkb8I7vcKpJYPnQSTzne93MTT+3IlfDHFzyM57SpMedr7fi00nA5kr
 Dap0E/K2YkJR7JfMjpdTsUFtP8q8lgwnVnaBUlRMqNE/ds75TnUmbJEqQ
 hljghcFRfWfKbzm9iVzbBBHdZ1pMbdrcDT8byaDYkjw4U+DtHgahqY4CD g==;
X-CSE-ConnectionGUID: L9JA35hMRZGkBLdAAFkBog==
X-CSE-MsgGUID: N8/FojHbT9iIaCVhRa/QhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72622591"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="72622591"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 19:16:01 -0700
X-CSE-ConnectionGUID: syYBh3+sTeewNeZ3Ptu+lQ==
X-CSE-MsgGUID: XvEfwxtORbWo/K4ShDxF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180365077"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 10 Oct 2025 19:15:57 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v7P9H-0003QF-08;
 Sat, 11 Oct 2025 02:15:55 +0000
Date: Sat, 11 Oct 2025 10:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Add warning for removing hack in
 drm_sched_fini()
Message-ID: <202510110929.AxIiHbe0-lkp@intel.com>
References: <20251009125928.250652-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009125928.250652-2-phasta@kernel.org>
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

Hi Philipp,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/drm-sched-Add-warning-for-removing-hack-in-drm_sched_fini/20251010-120556
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251009125928.250652-2-phasta%40kernel.org
patch subject: [PATCH] drm/sched: Add warning for removing hack in drm_sched_fini()
config: parisc-randconfig-r072-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110929.AxIiHbe0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110929.AxIiHbe0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110929.AxIiHbe0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/wait.h:7,
                    from drivers/gpu/drm/scheduler/sched_main.c:70:
   drivers/gpu/drm/scheduler/sched_main.c: In function 'drm_sched_fini':
>> include/linux/list.h:784:2: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
     for (pos = list_first_entry(head, typeof(*pos), member); \
     ^~~
   drivers/gpu/drm/scheduler/sched_main.c:1422:3: note: in expansion of macro 'list_for_each_entry'
      list_for_each_entry(s_entity, &rq->entities, list)
      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:1446:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
       s_entity->stopped = true;
       ^~~~~~~~


vim +/for +784 include/linux/list.h

4d70c74659d9746 Andy Shevchenko 2022-11-30  767  
e130816164e244b Andy Shevchenko 2020-10-15  768  /**
e130816164e244b Andy Shevchenko 2020-10-15  769   * list_entry_is_head - test if the entry points to the head of the list
e130816164e244b Andy Shevchenko 2020-10-15  770   * @pos:	the type * to cursor
e130816164e244b Andy Shevchenko 2020-10-15  771   * @head:	the head for your list.
e130816164e244b Andy Shevchenko 2020-10-15  772   * @member:	the name of the list_head within the struct.
e130816164e244b Andy Shevchenko 2020-10-15  773   */
e130816164e244b Andy Shevchenko 2020-10-15  774  #define list_entry_is_head(pos, head, member)				\
2932fb0a927d306 Wei Yang        2024-02-08  775  	list_is_head(&pos->member, (head))
e130816164e244b Andy Shevchenko 2020-10-15  776  
^1da177e4c3f415 Linus Torvalds  2005-04-16  777  /**
^1da177e4c3f415 Linus Torvalds  2005-04-16  778   * list_for_each_entry	-	iterate over list of given type
8e3a67a99231f9f Randy Dunlap    2006-06-25  779   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f415 Linus Torvalds  2005-04-16  780   * @head:	the head for your list.
3943f42c11896ce Andrey Utkin    2014-11-14  781   * @member:	the name of the list_head within the struct.
^1da177e4c3f415 Linus Torvalds  2005-04-16  782   */
^1da177e4c3f415 Linus Torvalds  2005-04-16  783  #define list_for_each_entry(pos, head, member)				\
93be3c2eb3371f0 Oleg Nesterov   2013-11-12 @784  	for (pos = list_first_entry(head, typeof(*pos), member);	\
e130816164e244b Andy Shevchenko 2020-10-15  785  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a420 Oleg Nesterov   2013-11-12  786  	     pos = list_next_entry(pos, member))
^1da177e4c3f415 Linus Torvalds  2005-04-16  787  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
