Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BB743D37
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 16:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD16610E48A;
	Fri, 30 Jun 2023 14:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A7F10E47F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688134190; x=1719670190;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=87HWBjxPKH1eCSf8y/PM6kHwdjnnl/CXZEzOqA7rh38=;
 b=DwA/ykdbg4yP4wZ+yqPtdNg5TQ0duTF+4idFgA1Pjulqf5ouzq0OtnBI
 I9z/c4LIzHxXfe7INSb8e3I/EkCYj2a8VEji1iKIn8DGR7sY7KvrDGPVc
 ZZtZQCxT7/NFNgokp1WvJ/2tz8GHKExyDAWQ4vQktktHVOnsjV5qFqJbI
 V2n5HIcsuxtuFuu5mf3brQVKvQDnuo3ABJHVv2jlD+lBJ5qle1mF9wNFB
 3tPELNdduNz0GRrWuUodhbtcE5FADbvayNjXhjSsXQEZLKeoGK2vXDJlB
 UCb27i789ffNpTt8KM+Lmi4KpLv++acMBSRI8PLqHU8gTo7b/NTWhLIEt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="362442646"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="362442646"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 07:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841882631"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="841882631"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 30 Jun 2023 07:09:28 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qFEoS-000F1Z-00;
 Fri, 30 Jun 2023 14:09:28 +0000
Date: Fri, 30 Jun 2023 22:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Mario.Limonciello@amd.com,
 mdaenzer@redhat.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, hdegoede@redhat.com, jingyuwang_vip@163.com,
 Lijo.Lazar@amd.com, jim.cromie@gmail.com, bellosilicio@gmail.com,
 andrealmeid@igalia.com, trix@redhat.com, jsg@jsg.id.au, arnd@arndb.de
Subject: Re: [PATCH V5 4/9] wifi: mac80211: Add support for ACPI WBRF
Message-ID: <202306302133.Px6k3Lmq-lkp@intel.com>
References: <20230630103240.1557100-5-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630103240.1557100-5-evan.quan@amd.com>
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
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Evan,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.4]
[cannot apply to drm-misc/drm-misc-next next-20230630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Quan/drivers-core-Add-support-for-Wifi-band-RF-mitigations/20230630-183633
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230630103240.1557100-5-evan.quan%40amd.com
patch subject: [PATCH V5 4/9] wifi: mac80211: Add support for ACPI WBRF
config: powerpc-randconfig-r025-20230630 (https://download.01.org/0day-ci/archive/20230630/202306302133.Px6k3Lmq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302133.Px6k3Lmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302133.Px6k3Lmq-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                 ^~~~~~~~~~~~~~
   <scratch space>:87:1: note: expanded from here
      87 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
     615 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rx.c:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:89:1: note: expanded from here
      89 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rx.c:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:91:1: note: expanded from here
      91 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rx.c:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:93:1: note: expanded from here
      93 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rx.c:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:95:1: note: expanded from here
      95 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rx.c:26:
>> net/mac80211/ieee80211_i.h:2655:48: error: void function 'ieee80211_add_wbrf' should not return a value [-Wreturn-type]
    2655 |                                       struct cfg80211_chan_def *chandef) { return 0; }
         |                                                                            ^      ~
   6 warnings and 1 error generated.
--
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:87:1: note: expanded from here
      87 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rc80211_minstrel_ht.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:89:1: note: expanded from here
      89 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rc80211_minstrel_ht.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:91:1: note: expanded from here
      91 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rc80211_minstrel_ht.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:93:1: note: expanded from here
      93 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/rc80211_minstrel_ht.c:15:
   In file included from net/mac80211/rate.h:16:
>> net/mac80211/ieee80211_i.h:2655:48: error: void function 'ieee80211_add_wbrf' should not return a value [-Wreturn-type]
    2655 |                                       struct cfg80211_chan_def *chandef) { return 0; }
         |                                                                            ^      ~
   6 warnings and 1 error generated.
--
   In file included from include/linux/ieee80211.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:126:1: note: expanded from here
     126 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/ht.c:15:
   In file included from include/linux/ieee80211.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:128:1: note: expanded from here
     128 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/ht.c:15:
   In file included from include/linux/ieee80211.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:130:1: note: expanded from here
     130 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/ht.c:15:
   In file included from include/linux/ieee80211.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:132:1: note: expanded from here
     132 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/mac80211/ht.c:18:
>> net/mac80211/ieee80211_i.h:2655:48: error: void function 'ieee80211_add_wbrf' should not return a value [-Wreturn-type]
    2655 |                                       struct cfg80211_chan_def *chandef) { return 0; }
         |                                                                            ^      ~
   6 warnings and 1 error generated.
..


vim +/ieee80211_add_wbrf +2655 net/mac80211/ieee80211_i.h

  2630	
  2631	u8 ieee80211_ie_len_eht_cap(struct ieee80211_sub_if_data *sdata, u8 iftype);
  2632	u8 *ieee80211_ie_build_eht_cap(u8 *pos,
  2633				       const struct ieee80211_sta_he_cap *he_cap,
  2634				       const struct ieee80211_sta_eht_cap *eht_cap,
  2635				       u8 *end,
  2636				       bool for_ap);
  2637	
  2638	void
  2639	ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
  2640					    struct ieee80211_supported_band *sband,
  2641					    const u8 *he_cap_ie, u8 he_cap_len,
  2642					    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
  2643					    u8 eht_cap_len,
  2644					    struct link_sta_info *link_sta);
  2645	
  2646	#ifdef CONFIG_WBRF
  2647	void ieee80211_check_wbrf_support(struct ieee80211_local *local);
  2648	void ieee80211_add_wbrf(struct ieee80211_local *local,
  2649				struct cfg80211_chan_def *chandef);
  2650	void ieee80211_remove_wbrf(struct ieee80211_local *local,
  2651				   struct cfg80211_chan_def *chandef);
  2652	#else
  2653	static inline void ieee80211_check_wbrf_support(struct ieee80211_local *local) { }
  2654	static inline void ieee80211_add_wbrf(struct ieee80211_local *local,
> 2655					      struct cfg80211_chan_def *chandef) { return 0; }
  2656	static inline void ieee80211_remove_wbrf(struct ieee80211_local *local,
  2657						 struct cfg80211_chan_def *chandef) { }
  2658	#endif /* CONFIG_WBRF */
  2659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
