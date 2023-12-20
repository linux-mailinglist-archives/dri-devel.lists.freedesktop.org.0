Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3829819F85
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA9910E59F;
	Wed, 20 Dec 2023 13:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D174310E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703077792; x=1734613792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YmJJ/ywwMFUEe1HB9Rdue5kNC/FoUdtA01gR+RQluFc=;
 b=JXWzBHVtS4hdOjzy1UY6l7Hpm8477abh9YizZTRhF7fCrKZSze46AHKz
 bBEj1iOVPKSTcNaZhOuRbICht7kYLMjMBXWKu1dknYXu1f9d1hDSVVqZP
 Cik3knpEMuG1j/mE0047+iPF6pUxfJL6MJYO8JzLp2LAe8kHyPzOieiYu
 hFl5IDTV92+fzmM08gS+pPFrhPTMKC5SkJiFedKm48GTkd9FIMuMiokUr
 iGcks01buL5R1sV+q269/U0IeHcfK1W1hgi0rtjWJzUprG+gBcIVXOenC
 lgMzPAK8xe+5fAE/zFUXbAn8YH4XY26FjIi+RyIjGCUYUogZsj5sYw3Gx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="375966913"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="375966913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 05:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="10751570"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2023 05:09:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rFwKV-0006tP-0m;
 Wed, 20 Dec 2023 13:09:43 +0000
Date: Wed, 20 Dec 2023 21:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tglx@linutronix.de
Subject: Re: [PATCH v3 6/6] x86/vmware: Add TDX hypercall support
Message-ID: <202312202020.5O1T2aSk-lkp@intel.com>
References: <20231219215751.9445-7-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219215751.9445-7-alexey.makhalov@broadcom.com>
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
Cc: jsipek@vmware.com, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 horms@kernel.org, zackr@vmware.com, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, llvm@lists.linux.dev,
 x86@kernel.org, dri-devel@lists.freedesktop.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 tzimmermann@suse.de, oe-kbuild-all@lists.linux.dev, namit@vmware.com,
 airlied@gmail.com, kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus linus/master v6.7-rc6 next-20231220]
[cannot apply to tip/x86/vmware]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Makhalov/x86-vmware-Move-common-macros-to-vmware-h/20231220-060028
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231219215751.9445-7-alexey.makhalov%40broadcom.com
patch subject: [PATCH v3 6/6] x86/vmware: Add TDX hypercall support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231220/202312202020.5O1T2aSk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312202020.5O1T2aSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312202020.5O1T2aSk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/vmware.c:439:40: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   pr_warn("Out of range command %x\n", cmd);
                                                 ~~     ^~~
                                                 %lx
   include/linux/printk.h:508:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                      ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +439 arch/x86/kernel/cpu/vmware.c

   430	
   431	#ifdef CONFIG_INTEL_TDX_GUEST
   432	unsigned long vmware_tdx_hypercall(unsigned long cmd,
   433					   struct tdx_module_args *args)
   434	{
   435		if (!hypervisor_is_type(X86_HYPER_VMWARE))
   436			return 0;
   437	
   438		if (cmd & ~VMWARE_CMD_MASK) {
 > 439			pr_warn("Out of range command %x\n", cmd);
   440			return 0;
   441		}
   442	
   443		args->r10 = VMWARE_TDX_VENDOR_LEAF;
   444		args->r11 = VMWARE_TDX_HCALL_FUNC;
   445		args->r12 = VMWARE_HYPERVISOR_MAGIC;
   446		args->r13 = cmd;
   447	
   448		__tdx_hypercall(args);
   449	
   450		return args->r12;
   451	}
   452	EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
   453	#endif
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
