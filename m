Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810E805EEA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 20:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6710E531;
	Tue,  5 Dec 2023 19:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974F010E606
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701806274; x=1733342274;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8+xl7o993QHoQJuM8EvkCoX7M+DgfwFuc3rXwdvt3a8=;
 b=EVOdDuKVGvdsV/ui+HX3qRRHDXuTXsljIViaojz+VjeHvRi4MZBCE9dq
 VXfltzI+zs80ILDSNdys7Sg9OhlPgbGPgXGUIzR8pdA9qUNmZLYLizWa+
 TkLQqNjgTKlF0svbZx8Tn7pSydIMwcnFxSRh+XfqADsrYxDkEm2GmdSIb
 ZzozjMd81FLyJWr2irkSyp8zwkiTuXNxoA9/uzW1tyzPpNoFGy4BgXPhO
 nrYtoAX7tZDFYfXhvuR1fecskS7IgBV7XQcYVy2T3qSCt6u/e8N27LP+q
 TacanICyXib2WDCdjH7RNArqKZKGvh4M98zRcPaZP8Jqhl1GCisGm7n64 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378973722"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="378973722"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="12449683"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 11:57:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAbY8-0009eY-2M;
 Tue, 05 Dec 2023 19:57:44 +0000
Date: Wed, 6 Dec 2023 03:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Makhalov <amakhalov@vmware.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, hpa@zytor.com,
 dave.hansen@linux.intel.co, bp@alien8.d, mingo@redhat.com,
 tglx@linutronix.de
Subject: Re: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
Message-ID: <202312060350.Paq0JYin-lkp@intel.com>
References: <20231201232452.220355-7-amakhalov@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201232452.220355-7-amakhalov@vmware.com>
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 akaher@vmware.com, dri-devel@lists.freedesktop.org, horms@kernel.org,
 oe-kbuild-all@lists.linux.dev, timothym@vmware.com,
 linux-graphics-maintainer@vmware.com, mripard@kernel.org, jsipek@vmware.com,
 linux-input@vger.kernel.org, namit@vmware.com, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus linus/master v6.7-rc4 next-20231205]
[cannot apply to tip/x86/vmware]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Makhalov/x86-vmware-Move-common-macros-to-vmware-h/20231202-072821
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231201232452.220355-7-amakhalov%40vmware.com
patch subject: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
config: x86_64-buildonly-randconfig-003-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060350.Paq0JYin-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060350.Paq0JYin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060350.Paq0JYin-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h:38,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:37:
>> arch/x86/include/asm/vmware.h:46:46: warning: 'struct tdx_module_args' declared inside parameter list will not be visible outside of this definition or declaration
      46 | extern void vmware_tdx_hypercall_args(struct tdx_module_args *args);
         |                                              ^~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h: In function 'vmware_tdx_hypercall':
>> arch/x86/include/asm/vmware.h:61:9: error: variable 'args' has initializer but incomplete type
      61 |  struct tdx_module_args args = {
         |         ^~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:62:4: error: 'struct tdx_module_args' has no member named 'r10'
      62 |   .r10 = VMWARE_TDX_VENDOR_LEAF,
         |    ^~~
>> arch/x86/include/asm/vmware.h:43:32: warning: excess elements in struct initializer
      43 | #define VMWARE_TDX_VENDOR_LEAF 0x1AF7E4909ULL
         |                                ^~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:62:10: note: in expansion of macro 'VMWARE_TDX_VENDOR_LEAF'
      62 |   .r10 = VMWARE_TDX_VENDOR_LEAF,
         |          ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:43:32: note: (near initialization for 'args')
      43 | #define VMWARE_TDX_VENDOR_LEAF 0x1AF7E4909ULL
         |                                ^~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:62:10: note: in expansion of macro 'VMWARE_TDX_VENDOR_LEAF'
      62 |   .r10 = VMWARE_TDX_VENDOR_LEAF,
         |          ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:63:4: error: 'struct tdx_module_args' has no member named 'r11'
      63 |   .r11 = VMWARE_TDX_HCALL_FUNC,
         |    ^~~
   arch/x86/include/asm/vmware.h:44:32: warning: excess elements in struct initializer
      44 | #define VMWARE_TDX_HCALL_FUNC  1
         |                                ^
   arch/x86/include/asm/vmware.h:63:10: note: in expansion of macro 'VMWARE_TDX_HCALL_FUNC'
      63 |   .r11 = VMWARE_TDX_HCALL_FUNC,
         |          ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:44:32: note: (near initialization for 'args')
      44 | #define VMWARE_TDX_HCALL_FUNC  1
         |                                ^
   arch/x86/include/asm/vmware.h:63:10: note: in expansion of macro 'VMWARE_TDX_HCALL_FUNC'
      63 |   .r11 = VMWARE_TDX_HCALL_FUNC,
         |          ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:64:4: error: 'struct tdx_module_args' has no member named 'r12'
      64 |   .r12 = VMWARE_HYPERVISOR_MAGIC,
         |    ^~~
   arch/x86/include/asm/vmware.h:31:34: warning: excess elements in struct initializer
      31 | #define VMWARE_HYPERVISOR_MAGIC  0x564D5868U
         |                                  ^~~~~~~~~~~
   arch/x86/include/asm/vmware.h:64:10: note: in expansion of macro 'VMWARE_HYPERVISOR_MAGIC'
      64 |   .r12 = VMWARE_HYPERVISOR_MAGIC,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/vmware.h:31:34: note: (near initialization for 'args')
      31 | #define VMWARE_HYPERVISOR_MAGIC  0x564D5868U
         |                                  ^~~~~~~~~~~
   arch/x86/include/asm/vmware.h:64:10: note: in expansion of macro 'VMWARE_HYPERVISOR_MAGIC'
      64 |   .r12 = VMWARE_HYPERVISOR_MAGIC,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/vmware.h:65:4: error: 'struct tdx_module_args' has no member named 'r13'
      65 |   .r13 = cmd,
         |    ^~~
   arch/x86/include/asm/vmware.h:65:10: warning: excess elements in struct initializer
      65 |   .r13 = cmd,
         |          ^~~
   arch/x86/include/asm/vmware.h:65:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:66:4: error: 'struct tdx_module_args' has no member named 'rbx'
      66 |   .rbx = in1,
         |    ^~~
   arch/x86/include/asm/vmware.h:66:10: warning: excess elements in struct initializer
      66 |   .rbx = in1,
         |          ^~~
   arch/x86/include/asm/vmware.h:66:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:67:4: error: 'struct tdx_module_args' has no member named 'rdx'
      67 |   .rdx = in3,
         |    ^~~
   arch/x86/include/asm/vmware.h:67:10: warning: excess elements in struct initializer
      67 |   .rdx = in3,
         |          ^~~
   arch/x86/include/asm/vmware.h:67:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:68:4: error: 'struct tdx_module_args' has no member named 'rsi'
      68 |   .rsi = in4,
         |    ^~~
   arch/x86/include/asm/vmware.h:68:10: warning: excess elements in struct initializer
      68 |   .rsi = in4,
         |          ^~~
   arch/x86/include/asm/vmware.h:68:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:69:4: error: 'struct tdx_module_args' has no member named 'rdi'
      69 |   .rdi = in5,
         |    ^~~
   arch/x86/include/asm/vmware.h:69:10: warning: excess elements in struct initializer
      69 |   .rdi = in5,
         |          ^~~
   arch/x86/include/asm/vmware.h:69:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:70:4: error: 'struct tdx_module_args' has no member named 'r14'
      70 |   .r14 = in6,
         |    ^~~
   arch/x86/include/asm/vmware.h:70:10: warning: excess elements in struct initializer
      70 |   .r14 = in6,
         |          ^~~
   arch/x86/include/asm/vmware.h:70:10: note: (near initialization for 'args')
>> arch/x86/include/asm/vmware.h:61:25: error: storage size of 'args' isn't known
      61 |  struct tdx_module_args args = {
         |                         ^~~~
>> arch/x86/include/asm/vmware.h:61:25: warning: unused variable 'args' [-Wunused-variable]


vim +/args +61 arch/x86/include/asm/vmware.h

    42	
  > 43	#define VMWARE_TDX_VENDOR_LEAF 0x1AF7E4909ULL
    44	#define VMWARE_TDX_HCALL_FUNC  1
    45	
  > 46	extern void vmware_tdx_hypercall_args(struct tdx_module_args *args);
    47	
    48	/*
    49	 * TDCALL[TDG.VP.VMCALL] uses rax (arg0) and rcx (arg2), while the use of
    50	 * rbp (arg6) is discouraged by the TDX specification. Therefore, we
    51	 * remap those registers to r12, r13 and r14, respectively.
    52	 */
    53	static inline
    54	unsigned long vmware_tdx_hypercall(unsigned long cmd, unsigned long in1,
    55					   unsigned long in3, unsigned long in4,
    56					   unsigned long in5, unsigned long in6,
    57					   uint32_t *out1, uint32_t *out2,
    58					   uint32_t *out3, uint32_t *out4,
    59					   uint32_t *out5, uint32_t *out6)
    60	{
  > 61		struct tdx_module_args args = {
  > 62			.r10 = VMWARE_TDX_VENDOR_LEAF,
  > 63			.r11 = VMWARE_TDX_HCALL_FUNC,
  > 64			.r12 = VMWARE_HYPERVISOR_MAGIC,
  > 65			.r13 = cmd,
  > 66			.rbx = in1,
  > 67			.rdx = in3,
  > 68			.rsi = in4,
  > 69			.rdi = in5,
  > 70			.r14 = in6,
    71		};
    72	
    73		vmware_tdx_hypercall_args(&args);
    74	
    75		if (out1)
    76			*out1 = args.rbx;
    77		if (out2)
    78			*out2 = args.r13;
    79		if (out3)
    80			*out3 = args.rdx;
    81		if (out4)
    82			*out4 = args.rsi;
    83		if (out5)
    84			*out5 = args.rdi;
    85		if (out6)
    86			*out6 = args.r14;
    87	
    88		return args.r12;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
