Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE8CAE374
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 22:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D5710E10B;
	Mon,  8 Dec 2025 21:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwMtL0Gu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0A10E10B;
 Mon,  8 Dec 2025 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765228750; x=1796764750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=19mEY0sJ38OcBYzPHKcjSQBlBgs0qEEHKmNeGqG7q1U=;
 b=XwMtL0Gus8nnZOE71UEv9Cx0lsuiG8EVmAWSV8AvcHHme5lmrUy6G+M3
 6l/0B/VIFThFaRv0YXbMJGrq+tm2GPh77UYt5rlqII3E8D+Y9PjWwcjwo
 FCNjvZo6j5bFlkErtDy41099KJBHduMDAaPfQgkgKKDCwte5ie+ZZM9Rp
 2WXwDTqCbi4Q24P5DEDqOhk1FyB3mrecCOM9tMl0AzvvjkkzjrtyFApS7
 k8uKdjd2DKhq/iISGKGpD/mZO7Eo6HTQhJ9cZiDKUOODm8FG7k0+5yDHy
 E9arJOaTX61flP7OgtCyA0lGxaq0wFQ9H4X13id0Ri73N8Gy0jIajewF5 g==;
X-CSE-ConnectionGUID: aatHnJnyRrSAy2SXP8XEbQ==
X-CSE-MsgGUID: TvyliWhFS6eupIHOJJWstw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84785251"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="84785251"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:19:10 -0800
X-CSE-ConnectionGUID: +13paA+9ReKrnWExPKvifw==
X-CSE-MsgGUID: xJxC0ajlQUekpzEudrCaFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="195829752"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 13:19:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vSidM-000000000rV-3Ar1;
 Mon, 08 Dec 2025 21:19:04 +0000
Date: Tue, 9 Dec 2025 05:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] video/vga: Add VGA_IS0_R
Message-ID: <202512090554.7pZ9xOQ5-lkp@intel.com>
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208182637.334-15-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18 next-20251208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-vga-Register-vgaarb-client-later/20251209-030730
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251208182637.334-15-ville.syrjala%40linux.intel.com
patch subject: [PATCH 14/19] video/vga: Add VGA_IS0_R
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251209/202512090554.7pZ9xOQ5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090554.7pZ9xOQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090554.7pZ9xOQ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/video/console/vgacon.c:51:
>> include/video/vga.h:489:1: error: expected identifier or '('
     489 | ?
         | ^
>> drivers/video/console/vgacon.c:126:25: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     126 |         raw_spin_lock_irqsave(&vga_lock, flags);
         |                                ^~~~~~~~
         |                                pgd_lock
   include/linux/spinlock.h:266:26: note: expanded from macro 'raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                                        ^
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                                ^
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                                      ^
   include/linux/spinlock_api_up.h:31:35: note: expanded from macro '__LOCK'
      31 |   do { preempt_disable(); ___LOCK(lock); } while (0)
         |                                   ^
   include/linux/spinlock_api_up.h:28:32: note: expanded from macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:131:30: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     131 |         raw_spin_unlock_irqrestore(&vga_lock, flags);
         |                                     ^~~~~~~~
         |                                     pgd_lock
   include/linux/spinlock.h:282:31: note: expanded from macro 'raw_spin_unlock_irqrestore'
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^
   include/linux/spinlock_api_up.h:86:26: note: expanded from macro '_raw_spin_unlock_irqrestore'
      86 |                                         __UNLOCK_IRQRESTORE(lock, flags)
         |                                                             ^
   include/linux/spinlock_api_up.h:56:43: note: expanded from macro '__UNLOCK_IRQRESTORE'
      56 |   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
         |                                           ^
   include/linux/spinlock_api_up.h:46:36: note: expanded from macro '__UNLOCK'
      46 |   do { preempt_enable(); ___UNLOCK(lock); } while (0)
         |                                    ^
   include/linux/spinlock_api_up.h:43:32: note: expanded from macro '___UNLOCK'
      43 |   do { __release(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:485:25: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     485 |         raw_spin_lock_irqsave(&vga_lock, flags);
         |                                ^~~~~~~~
         |                                pgd_lock
   include/linux/spinlock.h:266:26: note: expanded from macro 'raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                                        ^
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                                ^
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                                      ^
   include/linux/spinlock_api_up.h:31:35: note: expanded from macro '__LOCK'
      31 |   do { preempt_disable(); ___LOCK(lock); } while (0)
         |                                   ^
   include/linux/spinlock_api_up.h:28:32: note: expanded from macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:503:30: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     503 |         raw_spin_unlock_irqrestore(&vga_lock, flags);
         |                                     ^~~~~~~~
         |                                     pgd_lock
   include/linux/spinlock.h:282:31: note: expanded from macro 'raw_spin_unlock_irqrestore'
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^
   include/linux/spinlock_api_up.h:86:26: note: expanded from macro '_raw_spin_unlock_irqrestore'
      86 |                                         __UNLOCK_IRQRESTORE(lock, flags)
         |                                                             ^
   include/linux/spinlock_api_up.h:56:43: note: expanded from macro '__UNLOCK_IRQRESTORE'
      56 |   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
         |                                           ^
   include/linux/spinlock_api_up.h:46:36: note: expanded from macro '__UNLOCK'
      46 |   do { preempt_enable(); ___UNLOCK(lock); } while (0)
         |                                    ^
   include/linux/spinlock_api_up.h:43:32: note: expanded from macro '___UNLOCK'
      43 |   do { __release(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:563:25: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     563 |         raw_spin_lock_irqsave(&vga_lock, flags);
         |                                ^~~~~~~~
         |                                pgd_lock
   include/linux/spinlock.h:266:26: note: expanded from macro 'raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                                        ^
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                                ^
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                                      ^


vim +489 include/video/vga.h

   487	
   488	#endif /* __linux_video_vga_h__ */
 > 489	?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
