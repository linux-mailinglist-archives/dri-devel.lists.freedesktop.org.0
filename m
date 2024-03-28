Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3C288FFE8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 14:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEF310F68C;
	Thu, 28 Mar 2024 13:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzX/RxoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D5A10F68C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 13:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711631737; x=1743167737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xo032l06yr/hR/jwn/WjJ3wew5ThoMRYTk7U+HZZzrE=;
 b=QzX/RxoZSCsPY+P434NzI4KRgu0qQ8ZeA0pWuZ18Hil4a76E6r4X9Xuv
 J6gqR4qM2sEgYw4cCie+wMmLWOGTwvP78ETDAeVhIP1g46TKcr3tf+4+F
 NE3DPvhEb/keBVS4BSFu8aMdJJ4CXlCHFKB0Z1Rs1HNO2DID15PqHR0f2
 /1P0ITjuoKhp8bMpSjCN8auZiYe5RQQtjPeH8/pVjOZGv4A36qZvugvCY
 0geBQAGm87x27cXy6n8pVXA1phkHTlEELVAU82NRkUI6SbybEtndvOvpj
 ab2Q6nei3KxusDxR4AEXIMSfJ4scX4Z8e/RH5E1Ae6oawliVw0zYSZolW A==;
X-CSE-ConnectionGUID: BHsw58/AQU6MiJ6jMyuxsQ==
X-CSE-MsgGUID: 4sEdrXS9SlaxYmYDUi7nUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6999354"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6999354"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 06:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16637521"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2024 06:15:08 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rppb0-0002A6-01;
 Thu, 28 Mar 2024 13:15:06 +0000
Date: Thu, 28 Mar 2024 21:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
 javierm@redhat.com, deller@gmx.de, sui.jingfeng@linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Vineet Gupta <vgupta@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Subject: Re: [PATCH v2 3/3] arch: Rename fbdev header and source files
Message-ID: <202403282102.OEKoBT3H-lkp@intel.com>
References: <20240327204450.14914-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-4-tzimmermann@suse.de>
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

[auto build test ERROR on linus/master]
[also build test ERROR on v6.9-rc1 next-20240328]
[cannot apply to tip/x86/core deller-parisc/for-next arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/arch-Select-fbdev-helpers-with-CONFIG_VIDEO/20240328-044735
base:   linus/master
patch link:    https://lore.kernel.org/r/20240327204450.14914-4-tzimmermann%40suse.de
patch subject: [PATCH v2 3/3] arch: Rename fbdev header and source files
config: um-randconfig-001-20240328 (https://download.01.org/0day-ci/archive/20240328/202403282102.OEKoBT3H-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282102.OEKoBT3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282102.OEKoBT3H-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/video/fbdev/core/fb_io_fops.o: in function `fb_io_mmap':
>> fb_io_fops.c:(.text+0x251): undefined reference to `pgprot_framebuffer'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
