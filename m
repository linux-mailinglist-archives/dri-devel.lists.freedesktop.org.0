Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17942860833
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 02:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B849F10E00E;
	Fri, 23 Feb 2024 01:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dX6Fz6c2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3018110E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 01:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708651639; x=1740187639;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VJfzL6GLEaZMoUqazrxisfj34PLQuSNA02WLHhDPT4k=;
 b=dX6Fz6c2jk/Lp1B6p6sdQ7HEwV3aqzBYkXrUF5tN095w3a3lyzIxadrp
 eCxWt1A5b8uFUKOGXZiONXXhwAQDdPwBk7wzcx+fm54nV5D2d79n7JYwR
 Rcs7vke0ptXwImjHzs1OJ7umu0391gl1Z0C8ibee165+Ix3boQJEhDqdD
 nSdg1i8m5TPE+PZNm77wPCM8B8YKwMBDd+256bU4UvHMxyD4kiIgmt0NI
 CcT76dCi1bIZkUVRcDvc8D11QLPEqN6qPgq9bLZojJnDSWw2p4N+TZ0vB
 csGdUwIKEzx/OtH+5PFbi9P0MTOV+/va83hXW5RvA5J2/WbQDAyup9Pvu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14072590"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="14072590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 17:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6192032"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 22 Feb 2024 17:27:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rdKL6-0006vK-2c;
 Fri, 23 Feb 2024 01:27:02 +0000
Date: Fri, 23 Feb 2024 09:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
 javierm@redhat.com, deller@gmx.de, suijingfeng@loongson.cn
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2/3] arch: Remove struct fb_info from video helpers
Message-ID: <202402230941.JZdvHHEX-lkp@intel.com>
References: <20240221161431.8245-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221161431.8245-3-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on deller-parisc/for-next arnd-asm-generic/master linus/master v6.8-rc5]
[cannot apply to next-20240222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/arch-Select-fbdev-helpers-with-CONFIG_VIDEO/20240222-001622
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240221161431.8245-3-tzimmermann%40suse.de
patch subject: [PATCH 2/3] arch: Remove struct fb_info from video helpers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240223/202402230941.JZdvHHEX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230941.JZdvHHEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230941.JZdvHHEX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `fbcon_select_primary':
>> drivers/video/fbdev/core/fbcon.c:2944: undefined reference to `video_is_primary_device'
   ld: vmlinux.o: in function `fb_io_mmap':
   drivers/video/fbdev/core/fb_io_fops.c:164: undefined reference to `pgprot_framebuffer'


vim +2944 drivers/video/fbdev/core/fbcon.c

  2939	
  2940	#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
  2941	static void fbcon_select_primary(struct fb_info *info)
  2942	{
  2943		if (!map_override && primary_device == -1 &&
> 2944		    video_is_primary_device(info->device)) {
  2945			int i;
  2946	
  2947			printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
  2948			       info->fix.id, info->node);
  2949			primary_device = info->node;
  2950	
  2951			for (i = first_fb_vc; i <= last_fb_vc; i++)
  2952				con2fb_map_boot[i] = primary_device;
  2953	
  2954			if (con_is_bound(&fb_con)) {
  2955				printk(KERN_INFO "fbcon: Remapping primary device, "
  2956				       "fb%i, to tty %i-%i\n", info->node,
  2957				       first_fb_vc + 1, last_fb_vc + 1);
  2958				info_idx = primary_device;
  2959			}
  2960		}
  2961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
