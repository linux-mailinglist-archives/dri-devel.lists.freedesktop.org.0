Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19812525312
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 18:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775ED10E721;
	Thu, 12 May 2022 16:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998DC112077
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652367397; x=1683903397;
 h=date:from:to:cc:subject:message-id:mime-version: in-reply-to;
 bh=PFoHYMfK5RpqpQdFk5nrEmqvKN0/m4BgbCo6vEXOIO8=;
 b=G0P0zTe9XA55QWDCgF8F3B5K8NLbQfnvQPC6eUiRsLyokqu+n7hh3LzH
 Bx0NXBm7jNluCJIhGgKeivZwaZa9apb2hvHX+dJn1U1OsyO3TWZZPHVD4
 46TG7FJJ9tQUMbKBpM+cXTQJNNluPImDeA2tOrI8BL3S5z72wtbdvV2yx
 edPP0a8sBo4BzM38pBbjhtmIpKEH2SHwM8tFWZxt0HhAAlMxZ00x45YFv
 aRSuJFs7DKftshTIG6t4ITHaS8GnTn9d7N9yNP0nc6hhdgFp7nhYHjCqn
 GB/8FVsTczyUFHax5SatkUBiYbapTzS9SEI7PXGU8OynGGhWGt3jrDk/N Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="333059991"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
 d="xz'?yaml'?scan'208";a="333059991"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 07:56:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
 d="xz'?yaml'?scan'208";a="566720354"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 07:56:30 -0700
Date: Thu, 12 May 2022 22:56:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: [dma]  a9290ca07a:
 BUG:KASAN:slab-out-of-bounds_in__dma_fence_unwrap_merge
Message-ID: <20220512145627.GC36375@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <20220506141009.18047-4-christian.koenig@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 12 May 2022 16:56:15 +0000
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
Cc: 0day robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, lkp@lists.01.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Greeting,

FYI, we noticed the following commit (built with gcc-11):

commit: a9290ca07a36882b114c3cd9bbd8f66ed47508bd ("[PATCH 4/5] dma-buf: generalize dma_fence unwrap & merging v2")
url: https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-cleanup-dma_fence_unwrap-selftest-v2/20220506-221317
base: git://anongit.freedesktop.org/drm/drm drm-next
patch link: https://lore.kernel.org/dri-devel/20220506141009.18047-4-christian.koenig@amd.com

in testcase: igt
version: igt-x86_64-eddc67c5-1_20220430
with following parameters:

	group: group-04
	ucode: 0xc2



on test machine: 20 threads 1 sockets Commet Lake with 16G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):



If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


kern :err : [   35.911985] BUG: KASAN: slab-out-of-bounds in __dma_fence_unwrap_merge (drivers/dma-buf/dma-fence-unwrap.c:130) 
kern  :err   : [   35.920255] Write of size 8 at addr ffff888105400508 by task api_intel_bb/1309

kern  :err   : [   35.930379] CPU: 4 PID: 1309 Comm: api_intel_bb Not tainted 5.18.0-rc5-01118-ga9290ca07a36 #1
kern  :err   : [   35.939601] Hardware name: Intel Corporation CometLake Client Platform/CometLake S UDIMM (ERB/CRB), BIOS CMLSFWR1.R00.2212.D00.2104290922 04/29/2021
kern  :err   : [   35.953601] Call Trace:
kern  :err   : [   35.956758]  <TASK>
kern :err : [   35.959564] ? __dma_fence_unwrap_merge (drivers/dma-buf/dma-fence-unwrap.c:130) 
kern :err : [   35.965157] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1)) 
kern :err : [   35.969534] print_address_description+0x1f/0x200 
kern :err : [   35.975983] ? __dma_fence_unwrap_merge (drivers/dma-buf/dma-fence-unwrap.c:130) 
kern :err : [   35.981562] print_report.cold (mm/kasan/report.c:430) 
kern :err : [   35.986277] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock.h:82 include/linux/spinlock.h:185 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
kern :err : [   35.991606] kasan_report (mm/kasan/report.c:162 mm/kasan/report.c:493) 
kern :err : [   35.995892] ? __dma_fence_unwrap_merge (drivers/dma-buf/dma-fence-unwrap.c:130) 
kern :err : [   36.001474] __dma_fence_unwrap_merge (drivers/dma-buf/dma-fence-unwrap.c:130) 
kern :err : [   36.006878] sync_file_merge+0xf7/0x240 
kern :err : [   36.012465] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock.h:82 include/linux/spinlock.h:185 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
kern :err : [   36.017088] ? sync_file_create (drivers/dma-buf/sync_file.c:159) 
kern :err : [   36.021798] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2293 include/linux/atomic/atomic-arch-fallback.h:2318 include/linux/atomic/atomic-long.h:491 include/linux/atomic/atomic-instrumented.h:1846 fs/file.c:903 fs/file.c:934) 
kern :err : [   36.026342] sync_file_ioctl (drivers/dma-buf/sync_file.c:235 drivers/dma-buf/sync_file.c:360) 
kern :err : [   36.030966] ? sync_file_ioctl_fence_info (drivers/dma-buf/sync_file.c:355) 
kern :err : [   36.036717] ? task_work_run (kernel/task_work.c:167 (discriminator 1)) 
kern :err : [   36.041254] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:870 fs/ioctl.c:856 fs/ioctl.c:856) 
kern :err : [   36.045884] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
kern :err : [   36.050166] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:115) 
kern  :err   : [   36.055922] RIP: 0033:0x7fd878745e57
kern :err : [ 36.060203] Code: 00 00 90 48 8b 05 39 a0 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 09 a0 0c 00 f7 d8 64 89 01 48
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	90                   	nop
   3:	48 8b 05 39 a0 0c 00 	mov    0xca039(%rip),%rax        # 0xca043
   a:	64 c7 00 26 00 00 00 	movl   $0x26,%fs:(%rax)
  11:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  18:	c3                   	retq   
  19:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  20:	00 00 00 
  23:	b8 10 00 00 00       	mov    $0x10,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 09 a0 0c 00 	mov    0xca009(%rip),%rcx        # 0xca043
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 09 a0 0c 00 	mov    0xca009(%rip),%rcx        # 0xca019
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
kern  :err   : [   36.079659] RSP: 002b:00007ffe4d4d2e88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
kern  :err   : [   36.087937] RAX: ffffffffffffffda RBX: 00005558619a1940 RCX: 00007fd878745e57
kern  :err   : [   36.095770] RDX: 00007ffe4d4d2e90 RSI: 00000000c0303e03 RDI: 0000000000000008
kern  :err   : [   36.103613] RBP: 0000000000000006 R08: 000000000000000f R09: 00005558619a4c30
kern  :err   : [   36.111444] R10: 0000000000000006 R11: 0000000000000246 R12: 00005558619a1a00
kern  :err   : [   36.119279] R13: 00005558619a46e0 R14: 00007ffe4d4d2ef0 R15: 0000000000000000
kern  :err   : [   36.127113]  </TASK>

kern  :err   : [   36.132209] Allocated by task 1309:
kern :warn : [   36.136405] kasan_save_stack (mm/kasan/common.c:39) 
kern :warn : [   36.140943] __kasan_kmalloc (mm/kasan/common.c:45 mm/kasan/common.c:436 mm/kasan/common.c:515 mm/kasan/common.c:524) 
kern :warn : [   36.145395] __dma_fence_unwrap_merge (include/linux/slab.h:621 drivers/dma-buf/dma-fence-unwrap.c:81) 
kern :warn : [   36.150800] sync_file_merge+0xf7/0x240 
kern :warn : [   36.156386] sync_file_ioctl (drivers/dma-buf/sync_file.c:235 drivers/dma-buf/sync_file.c:360) 
kern :warn : [   36.161010] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:870 fs/ioctl.c:856 fs/ioctl.c:856) 
kern :warn : [   36.165643] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
kern :warn : [   36.169921] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:115) 

kern  :err   : [   36.177867] The buggy address belongs to the object at ffff888105400500
which belongs to the cache kmalloc-8 of size 8
kern  :err   : [   36.191437] The buggy address is located 0 bytes to the right of
8-byte region [ffff888105400500, ffff888105400508)

kern  :err   : [   36.206942] The buggy address belongs to the physical page:
kern  :warn  : [   36.213220] page:00000000c4ee5dee refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff8881054008c0 pfn:0x105400
kern  :warn  : [   36.224636] flags: 0x17ffffc0000200(slab|node=0|zone=2|lastcpupid=0x1fffff)
kern  :warn  : [   36.232305] raw: 0017ffffc0000200 ffffea0004155e80 dead000000000002 ffff888100042280
kern  :warn  : [   36.240745] raw: ffff8881054008c0 0000000080660035 00000001ffffffff 0000000000000000
kern  :warn  : [   36.249190] page dumped because: kasan: bad access detected

kern  :err   : [   36.257659] Memory state around the buggy address:
kern  :err   : [   36.263155]  ffff888105400400: fc fc fa fc fc fc fc fb fc fc fc fc fb fc fc fc
kern  :err   : [   36.271079]  ffff888105400480: fc fb fc fc fc fc fb fc fc fc fc fb fc fc fc fc
kern  :err   : [   36.279001] >ffff888105400500: 00 fc fc fc fc fb fc fc fc fc fa fc fc fc fc fb
kern  :err   : [   36.286921]                       ^
kern  :err   : [   36.291117]  ffff888105400580: fc fc fc fc fb fc fc fc fc fb fc fc fc fc fb fc
kern  :err   : [   36.299043]  ffff888105400600: fc fc fc fa fc fc fc fc fb fc fc fc fc fb fc fc
kern  :err   : [   36.306970] ==================================================================
kern  :warn  : [   36.314953] Disabling lock debugging due to kernel taint
user  :info  : [   36.321624] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   36.381966] Console: switching to colour frame buffer device 160x64
kern  :info  : [   36.448188] Console: switching to colour dummy device 80x25
user  :info  : [   36.454538] [IGT] api_intel_bb: executing
user  :info  : [   36.459757] [IGT] api_intel_bb: starting subtest blit-noreloc-keep-cache-random
user  :info  : [   36.471434] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   36.531917] Console: switching to colour frame buffer device 160x64
kern  :info  : [   36.598425] Console: switching to colour dummy device 80x25
user  :info  : [   36.604786] [IGT] api_intel_bb: executing
user  :info  : [   36.609923] [IGT] api_intel_bb: starting subtest blit-noreloc-purge-cache
user  :info  : [   36.621155] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   36.681867] Console: switching to colour frame buffer device 160x64
kern  :info  : [   36.748514] Console: switching to colour dummy device 80x25
user  :info  : [   36.755092] [IGT] api_intel_bb: executing
user  :info  : [   36.760433] [IGT] api_intel_bb: starting subtest blit-noreloc-purge-cache-random
user  :info  : [   36.772151] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   36.831817] Console: switching to colour frame buffer device 160x64
kern  :info  : [   36.897995] Console: switching to colour dummy device 80x25
user  :info  : [   36.904350] [IGT] api_intel_bb: executing
user  :info  : [   36.909457] [IGT] api_intel_bb: starting subtest blit-reloc-keep-cache
user  :info  : [   36.921693] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   36.981895] Console: switching to colour frame buffer device 160x64
kern  :info  : [   37.047892] Console: switching to colour dummy device 80x25
user  :info  : [   37.054232] [IGT] api_intel_bb: executing
user  :info  : [   37.059343] [IGT] api_intel_bb: starting subtest blit-reloc-purge-cache
user  :info  : [   37.071548] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   37.131724] Console: switching to colour frame buffer device 160x64
kern  :info  : [   37.197818] Console: switching to colour dummy device 80x25
user  :info  : [   37.204190] [IGT] api_intel_bb: executing
user  :info  : [   37.209296] [IGT] api_intel_bb: starting subtest delta-check
user  :info  : [   37.216856] [IGT] api_intel_bb: exiting, ret=0
user  :notice: [   37.245164] result_service: raw_upload, RESULT_MNT: /internal-lkp-server/result, RESULT_ROOT: /internal-lkp-server/result/igt/group-04-ucode=0xc2/lkp-cml-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/1, TMP_RESULT_ROOT: /tmp/lkp/result

user  :notice: [   37.276355] run-job /lkp/jobs/scheduled/lkp-cml-d02/igt-group-04-ucode=0xc2-debian-10.4-x86_64-20200603.cgz-a9290ca07a36882b114c3cd9bbd8f66ed47508bd-20220511-19224-132epq3-1.yaml

kern  :info  : [   37.281678] Console: switching to colour frame buffer device 160x64
kern  :info  : [   37.366074] Console: switching to colour dummy device 80x25
user  :info  : [   37.372429] [IGT] api_intel_bb: executing
user  :info  : [   37.377548] [IGT] api_intel_bb: starting subtest destroy-bb
user  :info  : [   37.388923] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   37.431625] Console: switching to colour frame buffer device 160x64
kern  :info  : [   37.497522] Console: switching to colour dummy device 80x25
user  :info  : [   37.503871] [IGT] api_intel_bb: executing
user  :info  : [   37.508999] [IGT] api_intel_bb: starting subtest full-batch
user  :info  : [   37.516733] [IGT] api_intel_bb: exiting, ret=0
kern  :info  : [   37.564907] Console: switching to colour frame buffer device 160x64
kern  :info  : [   37.630954] Console: switching to colour dummy device 80x25
user  :info  : [   37.637306] [IGT] api_intel_bb: executing
user  :info  : [   37.642423] [IGT] api_intel_bb: starting subtest intel-bb-blit-none
user  :notice: [   38.035871] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-cml-d02/igt-group-04-ucode=0xc2-debian-10.4-x86_64-20200603.cgz-a9290ca07a36882b114c3cd9bbd8f66ed47508bd-20220511-19224-132epq3-1.yaml&job_state=running -O /dev/null

user  :notice: [   38.069080] target ucode: 0xc2

user  :notice: [   38.075557] current_version: c2, target_version: c2



To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.18.0-rc5-01118-ga9290ca07a36"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.18.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.2.0-20) 11.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_CC_HAS_SLS=y
# CONFIG_SLS is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
# CONFIG_MICROCODE_AMD is not set
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
CONFIG_PMIC_OPREGION=y
CONFIG_X86_PM_TIMER=y
CONFIG_ACPI_PRMT=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
# CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_SYSVIPC_COMPAT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_FC_APPID is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_THP_SWAP=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
# CONFIG_ZSWAP_DEFAULT_ON is not set
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_HMM_MIRROR=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=m
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XTABLES_COMPAT=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB2 is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_RDMA is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_VARS=y
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=m
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_LZO is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
CONFIG_ZRAM_WRITEBACK=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_RDMA is not set
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_RDMA is not set
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
CONFIG_VMWARE_VMCI=m
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_EFCT is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
# CONFIG_DM_ZONED is not set
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
CONFIG_DUMMY=m
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_FIRESTREAM is not set
# CONFIG_ATM_ZATM is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_AMBASSADOR is not set
# CONFIG_ATM_HORIZON is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
CONFIG_IXGBE_IPSEC=y
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# CONFIG_PCS_XPCS is not set
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
# CONFIG_ATH11K is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
# CONFIG_IWLMEI is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
# CONFIG_RTW89 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=m
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_MMA8450 is not set
# CONFIG_INPUT_APANEL is not set
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
# CONFIG_INPUT_GPIO_VIBRA is not set
# CONFIG_INPUT_ATLAS_BTNS is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_UINPUT=y
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
# CONFIG_INPUT_DA7280_HAPTICS is not set
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_IQS626A is not set
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
# CONFIG_SENSORS_SY7636A is not set
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_WMI_EC is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SIMPLE_MFD_I2C is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
# CONFIG_DRM_I915_GVT_KVMGT is not set
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
CONFIG_DRM_GMA500=m
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y
CONFIG_DRM_PRIVACY_SCREEN=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_EFA is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_USNIC is not set
# CONFIG_INFINIBAND_RDMAVT is not set
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=m
CONFIG_INFINIBAND_SRPT=m
# CONFIG_INFINIBAND_ISER is not set
# CONFIG_INFINIBAND_ISERT is not set
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
# CONFIG_INFINIBAND_OPA_VNIC is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMC is not set
# CONFIG_AMD_HSMP is not set
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
# CONFIG_WIRELESS_HOTKEY is not set
CONFIG_HP_WMI=m
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_ISHTP_ECLITE is not set
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
CONFIG_PMC_ATOM=y
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
# CONFIG_MLXREG_LC is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_IRQ_REMAP=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_FREE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
# CONFIG_SECURITY_PATH is not set
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CHACHA20_X86_64=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=m
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_STACK_HASH_ORDER=20
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
# CONFIG_FAIL_SUNRPC is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
CONFIG_TEST_BPF=m
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='igt'
	export testcase='igt'
	export category='functional'
	export job_origin='igt-part1.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-cml-d02'
	export tbox_group='lkp-cml-d02'
	export kconfig='x86_64-rhel-8.3-func'
	export submit_id='627bb8e47134fe4b18d222f7'
	export job_file='/lkp/jobs/scheduled/lkp-cml-d02/igt-group-04-ucode=0xc2-debian-10.4-x86_64-20200603.cgz-a9290ca07a36882b114c3cd9bbd8f66ed47508bd-20220511-19224-132epq3-1.yaml'
	export id='88dda2254ac584b855f53eed1cb0028cc1b20ed9'
	export queuer_version='/zday/lkp'
	export model='Commet Lake'
	export nr_node=1
	export nr_cpu=20
	export memory='16G'
	export ssd_partitions='/dev/disk/by-id/ata-INTEL_SSDSC2BA800G4_BTHV61840945800OGN-part4'
	export rootfs_partition='/dev/disk/by-id/ata-INTEL_SSDSC2BA800G4_BTHV61840945800OGN-part3'
	export kernel_cmdline_hw='acpi_rsdp=0x9b0fe014'
	export commit='a9290ca07a36882b114c3cd9bbd8f66ed47508bd'
	export netconsole_port=6683
	export ucode='0xc2'
	export need_kconfig_hw='{"IGB"=>"y"}
{"E1000E"=>"y"}
SATA_AHCI
DRM_I915
{"IGC"=>"y"}'
	export bisect_dmesg=true
	export enqueue_time='2022-05-11 21:23:48 +0800'
	export _id='627bb8e47134fe4b18d222f7'
	export _rt='/result/igt/group-04-ucode=0xc2/lkp-cml-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='781f24707a020e96d9fffdb343d210a77094cd75'
	export base_commit='672c0c5173427e6b3e2a9bbb7be51ceeec78093a'
	export branch='linux-review/Christian-K-nig/dma-buf-cleanup-dma_fence_unwrap-selftest-v2/20220506-221317'
	export rootfs='debian-10.4-x86_64-20200603.cgz'
	export result_root='/result/igt/group-04-ucode=0xc2/lkp-cml-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/1'
	export scheduler_version='/lkp/lkp/.src-20220511-170024'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-10.4-x86_64-20200603.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/igt/group-04-ucode=0xc2/lkp-cml-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/1
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/vmlinuz-5.18.0-rc5-01118-ga9290ca07a36
branch=linux-review/Christian-K-nig/dma-buf-cleanup-dma_fence_unwrap-selftest-v2/20220506-221317
job=/lkp/jobs/scheduled/lkp-cml-d02/igt-group-04-ucode=0xc2-debian-10.4-x86_64-20200603.cgz-a9290ca07a36882b114c3cd9bbd8f66ed47508bd-20220511-19224-132epq3-1.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-func
commit=a9290ca07a36882b114c3cd9bbd8f66ed47508bd
acpi_rsdp=0x9b0fe014
max_uptime=2100
LKP_SERVER=internal-lkp-server
nokaslr
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/modules.cgz'
	export bm_initrd='/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20220105.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/igt_20220430.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/igt-x86_64-eddc67c5-1_20220430.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20220216.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='5.18.0-rc5-wt-ath-07655-g781f24707a02'
	export repeat_to=6
	export schedule_notify_address=
	export stop_repeat_if_found='dmesg.BUG:KASAN:slab-out-of-bounds_in__dma_fence_unwrap_merge'
	export kbuild_queue_analysis=1
	export kernel='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/vmlinuz-5.18.0-rc5-01118-ga9290ca07a36'
	export dequeue_time='2022-05-11 22:09:00 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-cml-d02/igt-group-04-ucode=0xc2-debian-10.4-x86_64-20200603.cgz-a9290ca07a36882b114c3cd9bbd8f66ed47508bd-20220511-19224-132epq3-1.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test group='group-04' $LKP_SRC/tests/wrapper igt
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env group='group-04' $LKP_SRC/stats/wrapper igt
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time igt.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--qjNfmADvan18RZcF
Content-Type: application/x-xz
Content-Disposition: attachment; filename="kmsg.xz"
Content-Transfer-Encoding: base64

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
AgAAAAAEWVo=

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=igt

2022-05-11 14:09:54 build/tests/api_intel_bb --run-subtest add-remove-objects
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: add-remove-objects
Subtest add-remove-objects: SUCCESS (0.002s)
2022-05-11 14:09:54 build/tests/api_intel_bb --run-subtest bb-with-allocator
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: bb-with-allocator
Subtest bb-with-allocator: SUCCESS (0.001s)
2022-05-11 14:09:54 build/tests/api_intel_bb --run-subtest blit-noreloc-keep-cache
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: blit-noreloc-keep-cache
Subtest blit-noreloc-keep-cache: SUCCESS (0.420s)
2022-05-11 14:09:55 build/tests/api_intel_bb --run-subtest blit-noreloc-keep-cache-random
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: blit-noreloc-keep-cache-random
Subtest blit-noreloc-keep-cache-random: SUCCESS (0.003s)
2022-05-11 14:09:55 build/tests/api_intel_bb --run-subtest blit-noreloc-purge-cache
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: blit-noreloc-purge-cache
Subtest blit-noreloc-purge-cache: SUCCESS (0.003s)
2022-05-11 14:09:55 build/tests/api_intel_bb --run-subtest blit-noreloc-purge-cache-random
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: blit-noreloc-purge-cache-random
Subtest blit-noreloc-purge-cache-random: SUCCESS (0.003s)
2022-05-11 14:09:55 build/tests/api_intel_bb --run-subtest blit-reloc-keep-cache
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: blit-reloc-keep-cache
Subtest blit-reloc-keep-cache: SUCCESS (0.005s)
2022-05-11 14:09:55 build/tests/api_intel_bb --run-subtest blit-reloc-purge-cache
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: blit-reloc-purge-cache
Subtest blit-reloc-purge-cache: SUCCESS (0.005s)
2022-05-11 14:09:55 build/tests/api_intel_bb --run-subtest delta-check
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: delta-check
Subtest delta-check: SUCCESS (0.001s)
2022-05-11 14:09:56 build/tests/api_intel_bb --run-subtest destroy-bb
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: destroy-bb
Subtest destroy-bb: SUCCESS (0.004s)
2022-05-11 14:09:56 build/tests/api_intel_bb --run-subtest full-batch
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: full-batch
Subtest full-batch: SUCCESS (0.001s)
2022-05-11 14:09:56 build/tests/api_intel_bb --run-subtest intel-bb-blit-none
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: intel-bb-blit-none
Subtest intel-bb-blit-none: SUCCESS (2.662s)
2022-05-11 14:09:59 build/tests/api_intel_bb --run-subtest intel-bb-blit-x
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: intel-bb-blit-x
Subtest intel-bb-blit-x: SUCCESS (2.484s)
2022-05-11 14:10:01 build/tests/api_intel_bb --run-subtest intel-bb-blit-y
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: intel-bb-blit-y
Subtest intel-bb-blit-y: SUCCESS (2.481s)
2022-05-11 14:10:04 build/tests/api_intel_bb --run-subtest lot-of-buffers
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: lot-of-buffers
Subtest lot-of-buffers: SUCCESS (0.926s)
2022-05-11 14:10:05 build/tests/api_intel_bb --run-subtest object-noreloc-keep-cache-random
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: object-noreloc-keep-cache-random
Subtest object-noreloc-keep-cache-random: SUCCESS (0.001s)
2022-05-11 14:10:05 build/tests/api_intel_bb --run-subtest object-noreloc-keep-cache-simple
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: object-noreloc-keep-cache-simple
Subtest object-noreloc-keep-cache-simple: SUCCESS (0.001s)
2022-05-11 14:10:06 build/tests/api_intel_bb --run-subtest object-noreloc-purge-cache-random
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: object-noreloc-purge-cache-random
Subtest object-noreloc-purge-cache-random: SUCCESS (0.001s)
2022-05-11 14:10:06 build/tests/api_intel_bb --run-subtest object-noreloc-purge-cache-simple
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: object-noreloc-purge-cache-simple
Subtest object-noreloc-purge-cache-simple: SUCCESS (0.001s)
2022-05-11 14:10:06 build/tests/api_intel_bb --run-subtest object-reloc-keep-cache
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: object-reloc-keep-cache
Subtest object-reloc-keep-cache: SUCCESS (0.002s)
2022-05-11 14:10:06 build/tests/api_intel_bb --run-subtest object-reloc-purge-cache
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: object-reloc-purge-cache
Subtest object-reloc-purge-cache: SUCCESS (0.003s)
2022-05-11 14:10:06 build/tests/api_intel_bb --run-subtest offset-control
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: offset-control
Subtest offset-control: SUCCESS (0.003s)
2022-05-11 14:10:06 build/tests/api_intel_bb --run-subtest purge-bb
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: purge-bb
Subtest purge-bb: SUCCESS (0.001s)
2022-05-11 14:10:06 build/tests/api_intel_bb --run-subtest render
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: render
Starting dynamic subtest: render-none-512
Dynamic subtest render-none-512: SUCCESS (0.065s)
Starting dynamic subtest: render-none-reloc-512
Dynamic subtest render-none-reloc-512: SUCCESS (0.065s)
Starting dynamic subtest: render-none-1024
Dynamic subtest render-none-1024: SUCCESS (0.246s)
Starting dynamic subtest: render-none-reloc-1024
Dynamic subtest render-none-reloc-1024: SUCCESS (0.254s)
Starting dynamic subtest: render-x-512
Dynamic subtest render-x-512: SUCCESS (0.059s)
Starting dynamic subtest: render-x-reloc-512
Dynamic subtest render-x-reloc-512: SUCCESS (0.059s)
Starting dynamic subtest: render-x-1024
Dynamic subtest render-x-1024: SUCCESS (0.236s)
Starting dynamic subtest: render-x-reloc-1024
Dynamic subtest render-x-reloc-1024: SUCCESS (0.237s)
Starting dynamic subtest: render-y-512
Dynamic subtest render-y-512: SUCCESS (0.059s)
Starting dynamic subtest: render-y-reloc-512
Dynamic subtest render-y-reloc-512: SUCCESS (0.058s)
Starting dynamic subtest: render-y-1024
Dynamic subtest render-y-1024: SUCCESS (0.236s)
Starting dynamic subtest: render-y-reloc-1024
Dynamic subtest render-y-reloc-1024: SUCCESS (0.225s)
Subtest render: SUCCESS (1.891s)
2022-05-11 14:10:09 build/tests/api_intel_bb --run-subtest render-ccs
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: render-ccs
Subtest render-ccs: SUCCESS (0.245s)
2022-05-11 14:10:09 build/tests/api_intel_bb --run-subtest reset-bb
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: reset-bb
Subtest reset-bb: SUCCESS (0.001s)
2022-05-11 14:10:09 build/tests/api_intel_bb --run-subtest reset-flags
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: reset-flags
Subtest reset-flags: SUCCESS (0.004s)
2022-05-11 14:10:09 build/tests/api_intel_bb --run-subtest simple-bb
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: simple-bb
Subtest simple-bb: SUCCESS (0.001s)
2022-05-11 14:10:09 build/tests/api_intel_bb --run-subtest simple-bb-ctx
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: simple-bb-ctx
Subtest simple-bb-ctx: SUCCESS (0.002s)
2022-05-11 14:10:10 build/tests/gem_media_fill --run-subtest media-fill
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: media-fill
Starting dynamic subtest: smem
Dynamic subtest smem: SUCCESS (0.002s)
Subtest media-fill: SUCCESS (0.009s)
2022-05-11 14:10:10 build/tests/gem_render_tiled_blits --run-subtest aperture-shrink
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: aperture-shrink
(gem_render_tiled_blits:1985) intel_os-WARNING: Insufficient free memory; /proc/meminfo:
MemTotal:       13829356 kB
MemFree:        11726904 kB
MemAvailable:   11607148 kB
Buffers:               0 kB
Cached:          1130512 kB
SwapCached:            0 kB
Active:              712 kB
Inactive:         212432 kB
Active(anon):        552 kB
Inactive(anon):   212284 kB
Active(file):        160 kB
Inactive(file):      148 kB
Unevictable:     1120872 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:        203648 kB
Mapped:            30440 kB
Shmem:              9456 kB
KReclaimable:      79968 kB
Slab:             578948 kB
SReclaimable:      79968 kB
SUnreclaim:       498980 kB
KernelStack:       10304 kB
PageTables:         2572 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     6914676 kB
Committed_AS:     264988 kB
VmallocTotal:   34359738367 kB
VmallocUsed:       43884 kB
VmallocChunk:          0 kB
Percpu:             8160 kB
HardwareCorrupted:     0 kB
AnonHugePages:     26624 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
DirectMap4k:      496692 kB
DirectMap2M:     7770112 kB
DirectMap1G:     9437184 kBInsufficient free memory; /proc/slabinfo:
slabinfo - version: 2.1
# name            <active_objs> <num_objs> <objsize> <objperslab> <pagesperslab> : tunables <limit> <batchcount> <sharedfactor> : slabdata <active_slabs> <num_slabs> <sharedavail>
btrfs_end_io_wq      126    126    192   42    2 : tunables    0    0    0 : slabdata      3      3      0
btrfs_prelim_ref       0      0    120   34    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_extent_op      0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_data_ref      0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_tree_ref      0      0    168   24    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_ref_head      0      0    208   39    2 : tunables    0    0    0 : slabdata      0      0      0
btrfs_inode_defrag      0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_node      0      0    376   43    4 : tunables    0    0    0 : slabdata      0      0      0
btrfs_ordered_extent      0      0    504   32    4 : tunables    0    0    0 : slabdata      0      0      0
btrfs_extent_map      39     39    208   39    2 : tunables    0    0    0 : slabdata      1      1      0
btrfs_extent_state    108    108    112   36    1 : tunables    0    0    0 : slabdata      3      3      0
bio-304              168    168    384   42    4 : tunables    0    0    0 : slabdata      4      4      0
btrfs_extent_buffer     75     75    320   25    2 : tunables    0    0    0 : slabdata      3      3      0
btrfs_free_space_bitmap      0      0   8192    4    8 : tunables    0    0    0 : slabdata      0      0      0
btrfs_free_space       0      0    168   24    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_path           230    230    176   46    2 : tunables    0    0    0 : slabdata      5      5      0
btrfs_trans_handle    384    384    168   24    1 : tunables    0    0    0 : slabdata     16     16      0
btrfs_inode           72     72   1320   24    8 : tunables    0    0    0 : slabdata      3      3      0
i915_vma_resource   6975   8778    384   42    4 : tunables    0    0    0 : slabdata    209    209      0
i915_vma            4998   4998    768   42    8 : tunables    0    0    0 : slabdata    119    119      0
i915_priolist        704    704     64   64    1 : tunables    0    0    0 : slabdata     11     11      0
i915_dependency        0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
execute_cb             0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
i915_request         672    672    768   42    8 : tunables    0    0    0 : slabdata     16     16      0
drm_i915_gem_object  55900  55900   1216   26    8 : tunables    0    0    0 : slabdata   2150   2150      0
i915_lut_handle     5610   5610     48   85    1 : tunables    0    0    0 : slabdata     66     66      0
intel_context        672    672    768   42    8 : tunables    0    0    0 : slabdata     16     16      0
active_node         4832   4832    128   32    1 : tunables    0    0    0 : slabdata    151    151      0
drm_buddy_block        0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
sd_ext_cdb             0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
bio-120               42     42    192   42    2 : tunables    0    0    0 : slabdata      1      1      0
kvm_async_pf           0      0    200   40    2 : tunables    0    0    0 : slabdata      0      0      0
kvm_vcpu               0      0  11200    1    4 : tunables    0    0    0 : slabdata      0      0      0
kvm_mmu_page_header      0      0    248   33    2 : tunables    0    0    0 : slabdata      0      0      0
pte_list_desc          0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
x86_emulator           0      0   2816   11    8 : tunables    0    0    0 : slabdata      0      0      0
scsi_sense_cache     224    224    128   32    1 : tunables    0    0    0 : slabdata      7      7      0
fscrypt_info           0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
zswap_entry            0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
p9_req_t               0      0    200   40    2 : tunables    0    0    0 : slabdata      0      0      0
ip6-frags              0      0    248   33    2 : tunables    0    0    0 : slabdata      0      0      0
fib6_nodes            64     64    128   32    1 : tunables    0    0    0 : slabdata      2      2      0
ip6_dst_cache        100    100    320   25    2 : tunables    0    0    0 : slabdata      4      4      0
ip6_mrt_cache          0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
PINGv6                 0      0   1344   24    8 : tunables    0    0    0 : slabdata      0      0      0
RAWv6                 24     24   1344   24    8 : tunables    0    0    0 : slabdata      1      1      0
UDPLITEv6              0      0   1472   22    8 : tunables    0    0    0 : slabdata      0      0      0
UDPv6                 66     66   1472   22    8 : tunables    0    0    0 : slabdata      3      3      0
tw_sock_TCPv6          0      0    304   26    2 : tunables    0    0    0 : slabdata      0      0      0
request_sock_TCPv6      0      0    368   44    4 : tunables    0    0    0 : slabdata      0      0      0
TCPv6                 26     26   2496   13    8 : tunables    0    0    0 : slabdata      2      2      0
uhci_urb_priv          0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
sgpool-128             7      7   4352    7    8 : tunables    0    0    0 : slabdata      1      1      0
sgpool-64             75     75   2176   15    8 : tunables    0    0    0 : slabdata      5      5      0
sgpool-32            196    196   1152   28    8 : tunables    0    0    0 : slabdata      7      7      0
sgpool-16            175    175    640   25    4 : tunables    0    0    0 : slabdata      7      7      0
sgpool-8             225    225    320   25    2 : tunables    0    0    0 : slabdata      9      9      0
bfq_io_cq              0      0    296   27    2 : tunables    0    0    0 : slabdata      0      0      0
bfq_queue              0      0    704   46    8 : tunables    0    0    0 : slabdata      0      0      0
mqueue_inode_cache     30     30   1088   30    8 : tunables    0    0    0 : slabdata      1      1      0
v9fs_inode_cache       0      0    840   39    8 : tunables    0    0    0 : slabdata      0      0      0
nfs_direct_cache       0      0    288   28    2 : tunables    0    0    0 : slabdata      0      0      0
nfs_commit_data       36     36    896   36    8 : tunables    0    0    0 : slabdata      1      1      0
nfs_write_data        60     60   1088   30    8 : tunables    0    0    0 : slabdata      2      2      0
nfs_read_data          0      0   1088   30    8 : tunables    0    0    0 : slabdata      0      0      0
nfs_inode_cache        0      0   1176   27    8 : tunables    0    0    0 : slabdata      0      0      0
nfs_page               0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_transaction_s      0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
jbd2_inode             0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_journal_handle      0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_journal_head      0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
jbd2_revoke_table_s      0      0     32  128    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_revoke_record_s      0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_fc_dentry_update      0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_inode_cache       0      0   1304   25    8 : tunables    0    0    0 : slabdata      0      0      0
ext4_free_data         0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_allocation_context      0      0    208   39    2 : tunables    0    0    0 : slabdata      0      0      0
ext4_prealloc_space      0      0    168   24    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_system_zone       0      0     56   73    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_io_end_vec        0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_io_end            0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_bio_post_read_ctx    128    128     64   64    1 : tunables    0    0    0 : slabdata      2      2      0
ext4_pending_reservation      0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_extent_status      0      0     56   73    1 : tunables    0    0    0 : slabdata      0      0      0
mbcache                0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
io_kiocb               0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
kioctx                 0      0    704   46    8 : tunables    0    0    0 : slabdata      0      0      0
aio_kiocb              0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
userfaultfd_ctx_cache      0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
fanotify_perm_event      0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
fanotify_path_event      0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
fanotify_fid_event      0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
fsnotify_mark          0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
dnotify_mark           0      0    112   36    1 : tunables    0    0    0 : slabdata      0      0      0
dnotify_struct         0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
dio                    0      0    768   42    8 : tunables    0    0    0 : slabdata      0      0      0
fasync_cache           0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
audit_tree_mark        0      0    112   36    1 : tunables    0    0    0 : slabdata      0      0      0
pid_namespace          0      0    200   40    2 : tunables    0    0    0 : slabdata      0      0      0
posix_timers_cache      0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
rpc_inode_cache       39     39    832   39    8 : tunables    0    0    0 : slabdata      1      1      0
rpc_buffers           15     15   2176   15    8 : tunables    0    0    0 : slabdata      1      1      0
rpc_tasks             25     25    320   25    2 : tunables    0    0    0 : slabdata      1      1      0
UNIX-STREAM          832    832   1216   26    8 : tunables    0    0    0 : slabdata     32     32      0
UNIX                 442    442   1216   26    8 : tunables    0    0    0 : slabdata     17     17      0
ip4-frags              0      0    264   31    2 : tunables    0    0    0 : slabdata      0      0      0
ip_mrt_cache           0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
UDP-Lite               0      0   1280   25    8 : tunables    0    0    0 : slabdata      0      0      0
tcp_bind_bucket       96     96    128   32    1 : tunables    0    0    0 : slabdata      3      3      0
inet_peer_cache        0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
xfrm_dst_cache         0      0    384   42    4 : tunables    0    0    0 : slabdata      0      0      0
xfrm_state             0      0    896   36    8 : tunables    0    0    0 : slabdata      0      0      0
ip_fib_trie          128    128     64   64    1 : tunables    0    0    0 : slabdata      2      2      0
ip_fib_alias          92     92     88   46    1 : tunables    0    0    0 : slabdata      2      2      0
ip_dst_cache         417    544    256   32    2 : tunables    0    0    0 : slabdata     17     17      0
PING                   0      0   1152   28    8 : tunables    0    0    0 : slabdata      0      0      0
RAW                   56     56   1152   28    8 : tunables    0    0    0 : slabdata      2      2      0
UDP                  275    275   1280   25    8 : tunables    0    0    0 : slabdata     11     11      0
tw_sock_TCP           26     26    304   26    2 : tunables    0    0    0 : slabdata      1      1      0
request_sock_TCP       0      0    368   44    4 : tunables    0    0    0 : slabdata      0      0      0
TCP                   52     52   2368   13    8 : tunables    0    0    0 : slabdata      4      4      0
hugetlbfs_inode_cache     84     84    776   42    8 : tunables    0    0    0 : slabdata      2      2      0
dquot                  0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
bio-248               50     50    320   25    2 : tunables    0    0    0 : slabdata      2      2      0
ep_head             2432   2432     32  128    1 : tunables    0    0    0 : slabdata     19     19      0
eventpoll_pwq        924    924     96   42    1 : tunables    0    0    0 : slabdata     22     22      0
eventpoll_epi        924    924    192   42    2 : tunables    0    0    0 : slabdata     22     22      0
inotify_inode_mark    540    540    112   36    1 : tunables    0    0    0 : slabdata     15     15      0
dax_cache             36     36    896   36    8 : tunables    0    0    0 : slabdata      1      1      0
request_queue_srcu      0      0  52720    1   16 : tunables    0    0    0 : slabdata      0      0      0
request_queue         22     22   1488   22    8 : tunables    0    0    0 : slabdata      1      1      0
blkdev_ioc             0      0    120   34    1 : tunables    0    0    0 : slabdata      0      0      0
bio-184              256    256    256   32    2 : tunables    0    0    0 : slabdata      8      8      0
biovec-max            77     77   4352    7    8 : tunables    0    0    0 : slabdata     11     11      0
biovec-128             0      0   2176   15    8 : tunables    0    0    0 : slabdata      0      0      0
biovec-64            168    168   1152   28    8 : tunables    0    0    0 : slabdata      6      6      0
biovec-16            150    150    320   25    2 : tunables    0    0    0 : slabdata      6      6      0
bio_integrity_payload     64     64    256   32    2 : tunables    0    0    0 : slabdata      2      2      0
khugepaged_mm_slot    874    874    176   46    2 : tunables    0    0    0 : slabdata     19     19      0
ksm_mm_slot            0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
ksm_stable_node        0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
ksm_rmap_item          0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
user_namespace         0      0    752   43    8 : tunables    0    0    0 : slabdata      0      0      0
uid_cache             96     96    256   32    2 : tunables    0    0    0 : slabdata      3      3      0
iommu_iova             0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
dmaengine-unmap-256     14     14   2240   14    8 : tunables    0    0    0 : slabdata      1      1      0
dmaengine-unmap-128     26     26   1216   26    8 : tunables    0    0    0 : slabdata      1      1      0
dmaengine-unmap-16     32     32    256   32    2 : tunables    0    0    0 : slabdata      1      1      0
dmaengine-unmap-2     64     64     64   64    1 : tunables    0    0    0 : slabdata      1      1      0
audit_buffer         102    102     40  102    1 : tunables    0    0    0 : slabdata      1      1      0
sock_inode_cache     972    972    896   36    8 : tunables    0    0    0 : slabdata     27     27      0
skbuff_ext_cache       0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
skbuff_fclone_cache     25     25    640   25    4 : tunables    0    0    0 : slabdata      1      1      0
skbuff_head_cache   2286   2325    320   25    2 : tunables    0    0    0 : slabdata     93     93      0
configfs_dir_cache     34     34    120   34    1 : tunables    0    0    0 : slabdata      1      1      0
file_lock_cache      667    667    280   29    2 : tunables    0    0    0 : slabdata     23     23      0
file_lock_ctx        322    322     88   46    1 : tunables    0    0    0 : slabdata      7      7      0
fsnotify_mark_connector   1190   1190     48   85    1 : tunables    0    0    0 : slabdata     14     14      0
buffer_head           48     48    168   24    1 : tunables    0    0    0 : slabdata      2      2      0
x86_lbr                0      0    928   35    8 : tunables    0    0    0 : slabdata      0      0      0
task_delay_info        0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
taskstats              0      0    432   37    4 : tunables    0    0    0 : slabdata      0      0      0
proc_dir_entry       800    800    256   32    2 : tunables    0    0    0 : slabdata     25     25      0
pde_opener          1460   1460     56   73    1 : tunables    0    0    0 : slabdata     20     20      0
proc_inode_cache    2671   2964    824   39    8 : tunables    0    0    0 : slabdata     76     76      0
seq_file            3347   3608    184   44    2 : tunables    0    0    0 : slabdata     82     82      0
sigqueue            1152   1152    112   36    1 : tunables    0    0    0 : slabdata     32     32      0
bdev_cache            54     54   1728   18    8 : tunables    0    0    0 : slabdata      3      3      0
shmem_inode_cache   6156   6156    888   36    8 : tunables    0    0    0 : slabdata    171    171      0
kernfs_iattrs_cache    306    306    120   34    1 : tunables    0    0    0 : slabdata      9      9      0
kernfs_node_cache  42786  43512    192   42    2 : tunables    0    0    0 : slabdata   1036   1036      0
mnt_cache            588    588    384   42    4 : tunables    0    0    0 : slabdata     14     14      0
filp               40950  40950    320   25    2 : tunables    0    0    0 : slabdata   1638   1638      0
inode_cache        53789  54868    752   43    8 : tunables    0    0    0 : slabdata   1276   1276      0
dentry             93408  93408    256   32    2 : tunables    0    0    0 : slabdata   2919   2919      0
names_cache        38969  38969   4352    7    8 : tunables    0    0    0 : slabdata   5567   5567      0
net_namespace          0      0   4416    7    8 : tunables    0    0    0 : slabdata      0      0      0
iint_cache             0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
key_jar              325    325    320   25    2 : tunables    0    0    0 : slabdata     13     13      0
uts_namespace          0      0    496   33    4 : tunables    0    0    0 : slabdata      0      0      0
nsproxy              117    117    104   39    1 : tunables    0    0    0 : slabdata      3      3      0
vm_area_struct     47399  47399    264   31    2 : tunables    0    0    0 : slabdata   1529   1529      0
mm_struct           1337   1456   1216   26    8 : tunables    0    0    0 : slabdata     56     56      0
fs_cache            1344   1344    128   32    1 : tunables    0    0    0 : slabdata     42     42      0
files_cache         1365   1365    832   39    8 : tunables    0    0    0 : slabdata     35     35      0
signal_cache        1354   1375   1280   25    8 : tunables    0    0    0 : slabdata     55     55      0
sighand_cache        588    588   2240   14    8 : tunables    0    0    0 : slabdata     42     42      0
task_struct          777    777  10688    3    8 : tunables    0    0    0 : slabdata    259    259      0
cred_jar            3488   3488    256   32    2 : tunables    0    0    0 : slabdata    109    109      0
anon_vma_chain     23562  23562     96   42    1 : tunables    0    0    0 : slabdata    561    561      0
anon_vma            3502   3502    120   34    1 : tunables    0    0    0 : slabdata    103    103      0
pid                 1554   1554    192   42    2 : tunables    0    0    0 : slabdata     37     37      0
Acpi-Operand       17113  31395    104   39    1 : tunables    0    0    0 : slabdata    805    805      0
Acpi-ParseExt       2772   2772    112   36    1 : tunables    0    0    0 : slabdata     77     77      0
Acpi-Parse          4186   4186     88   46    1 : tunables    0    0    0 : slabdata     91     91      0
Acpi-State          3888   3888    112   36    1 : tunables    0    0    0 : slabdata    108    108      0
Acpi-Namespace      8320   8320     64   64    1 : tunables    0    0    0 : slabdata    130    130      0
shared_policy_node      0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
numa_policy           24     24    336   24    2 : tunables    0    0    0 : slabdata      1      1      0
perf_event           480    480   1328   24    8 : tunables    0    0    0 : slabdata     20     20      0
trace_event_file    2074   2074    120   34    1 : tunables    0    0    0 : slabdata     61     61      0
ftrace_event_field   5376   5376     64   64    1 : tunables    0    0    0 : slabdata     84     84      0
pool_workqueue       224    224    512   32    4 : tunables    0    0    0 : slabdata      7      7      0
radix_tree_node    15732  15732    704   46    8 : tunables    0    0    0 : slabdata    342    342      0
task_group           507    507    832   39    8 : tunables    0    0    0 : slabdata     13     13      0
vmap_area           3150   3150     96   42    1 : tunables    0    0    0 : slabdata     75     75      0
dma-kmalloc-8k         0      0  16384    2    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-4k         0      0   8192    4    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-2k         0      0   4096    8    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-1k         0      0   2048   16    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-512        0      0   1024   32    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-256        0      0    512   32    4 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-128        0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-64         0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-32         0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-16         0      0     32  128    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-8          0      0     40  102    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-192        0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-96         0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-8k         0      0  16384    2    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-4k         0      0   8192    4    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-2k         0      0   4096    8    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-1k         0      0   2048   16    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-512        0      0   1024   32    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-256        0      0    512   32    4 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-192       32     32    256   32    2 : tunables    0    0    0 : slabdata      1      1      0
kmalloc-rcl-128      384    544    256   32    2 : tunables    0    0    0 : slabdata     17     17      0
kmalloc-rcl-96      1666   1824    128   32    1 : tunables    0    0    0 : slabdata     57     57      0
kmalloc-rcl-64      2848   3232    128   32    1 : tunables    0    0    0 : slabdata    101    101      0
kmalloc-rcl-32         0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-16         0      0     32  128    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-8          0      0     40  102    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-cg-8k          4      4  16384    2    8 : tunables    0    0    0 : slabdata      2      2      0
kmalloc-cg-4k        356    356   8192    4    8 : tunables    0    0    0 : slabdata     89     89      0
kmalloc-cg-2k        256    256   4096    8    8 : tunables    0    0    0 : slabdata     32     32      0
kmalloc-cg-1k        720    720   2048   16    8 : tunables    0    0    0 : slabdata     45     45      0
kmalloc-cg-512      1058   1184   1024   32    8 : tunables    0    0    0 : slabdata     37     37      0
kmalloc-cg-256        32     32    512   32    4 : tunables    0    0    0 : slabdata      1      1      0
kmalloc-cg-192       832    832    256   32    2 : tunables    0    0    0 : slabdata     26     26      0
kmalloc-cg-128       192    192    256   32    2 : tunables    0    0    0 : slabdata      6      6      0
kmalloc-cg-96        224    224    128   32    1 : tunables    0    0    0 : slabdata      7      7      0
kmalloc-cg-64        544    544    128   32    1 : tunables    0    0    0 : slabdata     17     17      0
kmalloc-cg-32       1984   1984     64   64    1 : tunables    0    0    0 : slabdata     31     31      0
kmalloc-cg-16       1152   1152     32  128    1 : tunables    0    0    0 : slabdata      9      9      0
kmalloc-cg-8        1122   1122     40  102    1 : tunables    0    0    0 : slabdata     11     11      0
kmalloc-8k           332    332  16384    2    8 : tunables    0    0    0 : slabdata    166    166      0
kmalloc-4k         12568  12588   8192    4    8 : tunables    0    0    0 : slabdata   3147   3147      0
kmalloc-2k          1598   2584   4096    8    8 : tunables    0    0    0 : slabdata    323    323      0
kmalloc-1k          2178   2752   2048   16    8 : tunables    0    0    0 : slabdata    172    172      0
kmalloc-512         9227  10240   1024   32    8 : tunables    0    0    0 : slabdata    320    320      0
kmalloc-256        11625  12320    512   32    4 : tunables    0    0    0 : slabdata    385    385      0
kmalloc-192         3032   4096    256   32    2 : tunables    0    0    0 : slabdata    128    128      0
kmalloc-128         2592   2592    256   32    2 : tunables    0    0    0 : slabdata     81     81      0
kmalloc-96          3593   4640    128   32    1 : tunables    0    0    0 : slabdata    145    145      0
kmalloc-64         32960  53760    128   32    1 : tunables    0    0    0 : slabdata   1680   1680      0
kmalloc-32         69929  82496     64   64    1 : tunables    0    0    0 : slabdata   1289   1289      0
kmalloc-16         65422  65792     32  128    1 : tunables    0    0    0 : slabdata    514    514      0
kmalloc-8          11103  23562     40  102    1 : tunables    0    0    0 : slabdata    231    231      0
kmem_cache_node      480    480    128   32    1 : tunables    0    0    0 : slabdata     15     15      0
kmem_cache           400    400    320   25    2 : tunables    0    0    0 : slabdata     16     16      0Test requirement not met in function intel_require_memory, file ../lib/intel_os.c:398:
Test requirement: sufficient_memory
Estimated that we need 402653184 objects and 405798912 MiB for the test, but only have 12439 MiB available (RAM) and a maximum of 9223372036854775807 objects
Subtest aperture-shrink: SKIP (0.121s)
gem_render_tiled_blits: ../lib/igt_core.c:2130: igt_exit: Assertion `waitpid(-1, &tmp, WNOHANG) == -1 && errno == ECHILD' failed.
Received signal SIGABRT.
Stack trace: 
 #0 [fatal_sig_handler+0xd6]
 #1 [killpg+0x40]
 #2 [gsignal+0x10b]
 #3 [abort+0x121]
 #4 [<unknown>+0x121]
 #5 [__assert_fail+0x42]
 #6 [igt_exit+0x181]
 #7 [main+0x2c]
 #8 [__libc_start_main+0xeb]
 #9 [_start+0x2a]
Aborted
2022-05-11 14:10:10 build/tests/gem_render_tiled_blits --run-subtest aperture-thrash
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: aperture-thrash
(gem_render_tiled_blits:2008) intel_os-WARNING: Insufficient free memory; /proc/meminfo:
MemTotal:       13829356 kB
MemFree:        11730276 kB
MemAvailable:   11610624 kB
Buffers:               0 kB
Cached:          1130580 kB
SwapCached:            0 kB
Active:              248 kB
Inactive:         212888 kB
Active(anon):        248 kB
Inactive(anon):   212600 kB
Active(file):          0 kB
Inactive(file):      288 kB
Unevictable:     1120872 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:        203512 kB
Mapped:            30312 kB
Shmem:              9544 kB
KReclaimable:      80200 kB
Slab:             571272 kB
SReclaimable:      80200 kB
SUnreclaim:       491072 kB
KernelStack:       10432 kB
PageTables:         2448 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     6914676 kB
Committed_AS:     261840 kB
VmallocTotal:   34359738367 kB
VmallocUsed:       43916 kB
VmallocChunk:          0 kB
Percpu:             8160 kB
HardwareCorrupted:     0 kB
AnonHugePages:     26624 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
DirectMap4k:      496692 kB
DirectMap2M:     7770112 kB
DirectMap1G:     9437184 kBInsufficient free memory; /proc/slabinfo:
slabinfo - version: 2.1
# name            <active_objs> <num_objs> <objsize> <objperslab> <pagesperslab> : tunables <limit> <batchcount> <sharedfactor> : slabdata <active_slabs> <num_slabs> <sharedavail>
btrfs_end_io_wq      126    126    192   42    2 : tunables    0    0    0 : slabdata      3      3      0
btrfs_prelim_ref       0      0    120   34    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_extent_op      0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_data_ref      0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_tree_ref      0      0    168   24    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_ref_head      0      0    208   39    2 : tunables    0    0    0 : slabdata      0      0      0
btrfs_inode_defrag      0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_delayed_node      0      0    376   43    4 : tunables    0    0    0 : slabdata      0      0      0
btrfs_ordered_extent      0      0    504   32    4 : tunables    0    0    0 : slabdata      0      0      0
btrfs_extent_map      39     39    208   39    2 : tunables    0    0    0 : slabdata      1      1      0
btrfs_extent_state    108    108    112   36    1 : tunables    0    0    0 : slabdata      3      3      0
bio-304              168    168    384   42    4 : tunables    0    0    0 : slabdata      4      4      0
btrfs_extent_buffer     75     75    320   25    2 : tunables    0    0    0 : slabdata      3      3      0
btrfs_free_space_bitmap      0      0   8192    4    8 : tunables    0    0    0 : slabdata      0      0      0
btrfs_free_space       0      0    168   24    1 : tunables    0    0    0 : slabdata      0      0      0
btrfs_path           230    230    176   46    2 : tunables    0    0    0 : slabdata      5      5      0
btrfs_trans_handle    384    384    168   24    1 : tunables    0    0    0 : slabdata     16     16      0
btrfs_inode           72     72   1320   24    8 : tunables    0    0    0 : slabdata      3      3      0
i915_vma_resource   6581   8778    384   42    4 : tunables    0    0    0 : slabdata    209    209      0
i915_vma            4998   4998    768   42    8 : tunables    0    0    0 : slabdata    119    119      0
i915_priolist        704    704     64   64    1 : tunables    0    0    0 : slabdata     11     11      0
i915_dependency        0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
execute_cb             0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
i915_request         672    672    768   42    8 : tunables    0    0    0 : slabdata     16     16      0
drm_i915_gem_object  55900  55900   1216   26    8 : tunables    0    0    0 : slabdata   2150   2150      0
i915_lut_handle     5610   5610     48   85    1 : tunables    0    0    0 : slabdata     66     66      0
intel_context        672    672    768   42    8 : tunables    0    0    0 : slabdata     16     16      0
active_node         4832   4832    128   32    1 : tunables    0    0    0 : slabdata    151    151      0
drm_buddy_block        0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
sd_ext_cdb             0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
bio-120               42     42    192   42    2 : tunables    0    0    0 : slabdata      1      1      0
kvm_async_pf           0      0    200   40    2 : tunables    0    0    0 : slabdata      0      0      0
kvm_vcpu               0      0  11200    1    4 : tunables    0    0    0 : slabdata      0      0      0
kvm_mmu_page_header      0      0    248   33    2 : tunables    0    0    0 : slabdata      0      0      0
pte_list_desc          0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
x86_emulator           0      0   2816   11    8 : tunables    0    0    0 : slabdata      0      0      0
scsi_sense_cache     224    224    128   32    1 : tunables    0    0    0 : slabdata      7      7      0
fscrypt_info           0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
zswap_entry            0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
p9_req_t               0      0    200   40    2 : tunables    0    0    0 : slabdata      0      0      0
ip6-frags              0      0    248   33    2 : tunables    0    0    0 : slabdata      0      0      0
fib6_nodes            64     64    128   32    1 : tunables    0    0    0 : slabdata      2      2      0
ip6_dst_cache        100    100    320   25    2 : tunables    0    0    0 : slabdata      4      4      0
ip6_mrt_cache          0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
PINGv6                 0      0   1344   24    8 : tunables    0    0    0 : slabdata      0      0      0
RAWv6                 24     24   1344   24    8 : tunables    0    0    0 : slabdata      1      1      0
UDPLITEv6              0      0   1472   22    8 : tunables    0    0    0 : slabdata      0      0      0
UDPv6                 66     66   1472   22    8 : tunables    0    0    0 : slabdata      3      3      0
tw_sock_TCPv6          0      0    304   26    2 : tunables    0    0    0 : slabdata      0      0      0
request_sock_TCPv6      0      0    368   44    4 : tunables    0    0    0 : slabdata      0      0      0
TCPv6                 26     26   2496   13    8 : tunables    0    0    0 : slabdata      2      2      0
uhci_urb_priv          0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
sgpool-128             7      7   4352    7    8 : tunables    0    0    0 : slabdata      1      1      0
sgpool-64             75     75   2176   15    8 : tunables    0    0    0 : slabdata      5      5      0
sgpool-32            196    196   1152   28    8 : tunables    0    0    0 : slabdata      7      7      0
sgpool-16            175    175    640   25    4 : tunables    0    0    0 : slabdata      7      7      0
sgpool-8             225    225    320   25    2 : tunables    0    0    0 : slabdata      9      9      0
bfq_io_cq              0      0    296   27    2 : tunables    0    0    0 : slabdata      0      0      0
bfq_queue              0      0    704   46    8 : tunables    0    0    0 : slabdata      0      0      0
mqueue_inode_cache     30     30   1088   30    8 : tunables    0    0    0 : slabdata      1      1      0
v9fs_inode_cache       0      0    840   39    8 : tunables    0    0    0 : slabdata      0      0      0
nfs_direct_cache       0      0    288   28    2 : tunables    0    0    0 : slabdata      0      0      0
nfs_commit_data       36     36    896   36    8 : tunables    0    0    0 : slabdata      1      1      0
nfs_write_data        60     60   1088   30    8 : tunables    0    0    0 : slabdata      2      2      0
nfs_read_data          0      0   1088   30    8 : tunables    0    0    0 : slabdata      0      0      0
nfs_inode_cache        0      0   1176   27    8 : tunables    0    0    0 : slabdata      0      0      0
nfs_page               0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_transaction_s      0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
jbd2_inode             0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_journal_handle      0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_journal_head      0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
jbd2_revoke_table_s      0      0     32  128    1 : tunables    0    0    0 : slabdata      0      0      0
jbd2_revoke_record_s      0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_fc_dentry_update      0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_inode_cache       0      0   1304   25    8 : tunables    0    0    0 : slabdata      0      0      0
ext4_free_data         0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_allocation_context      0      0    208   39    2 : tunables    0    0    0 : slabdata      0      0      0
ext4_prealloc_space      0      0    168   24    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_system_zone       0      0     56   73    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_io_end_vec        0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_io_end            0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_bio_post_read_ctx    128    128     64   64    1 : tunables    0    0    0 : slabdata      2      2      0
ext4_pending_reservation      0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
ext4_extent_status      0      0     56   73    1 : tunables    0    0    0 : slabdata      0      0      0
mbcache                0      0     88   46    1 : tunables    0    0    0 : slabdata      0      0      0
io_kiocb               0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
kioctx                 0      0    704   46    8 : tunables    0    0    0 : slabdata      0      0      0
aio_kiocb              0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
userfaultfd_ctx_cache      0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
fanotify_perm_event      0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
fanotify_path_event      0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
fanotify_fid_event      0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
fsnotify_mark          0      0    104   39    1 : tunables    0    0    0 : slabdata      0      0      0
dnotify_mark           0      0    112   36    1 : tunables    0    0    0 : slabdata      0      0      0
dnotify_struct         0      0     48   85    1 : tunables    0    0    0 : slabdata      0      0      0
dio                    0      0    768   42    8 : tunables    0    0    0 : slabdata      0      0      0
fasync_cache           0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
audit_tree_mark        0      0    112   36    1 : tunables    0    0    0 : slabdata      0      0      0
pid_namespace          0      0    200   40    2 : tunables    0    0    0 : slabdata      0      0      0
posix_timers_cache      0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
rpc_inode_cache       39     39    832   39    8 : tunables    0    0    0 : slabdata      1      1      0
rpc_buffers           15     15   2176   15    8 : tunables    0    0    0 : slabdata      1      1      0
rpc_tasks             25     25    320   25    2 : tunables    0    0    0 : slabdata      1      1      0
UNIX-STREAM          832    832   1216   26    8 : tunables    0    0    0 : slabdata     32     32      0
UNIX                 442    442   1216   26    8 : tunables    0    0    0 : slabdata     17     17      0
ip4-frags              0      0    264   31    2 : tunables    0    0    0 : slabdata      0      0      0
ip_mrt_cache           0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
UDP-Lite               0      0   1280   25    8 : tunables    0    0    0 : slabdata      0      0      0
tcp_bind_bucket       96     96    128   32    1 : tunables    0    0    0 : slabdata      3      3      0
inet_peer_cache        0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
xfrm_dst_cache         0      0    384   42    4 : tunables    0    0    0 : slabdata      0      0      0
xfrm_state             0      0    896   36    8 : tunables    0    0    0 : slabdata      0      0      0
ip_fib_trie          128    128     64   64    1 : tunables    0    0    0 : slabdata      2      2      0
ip_fib_alias          92     92     88   46    1 : tunables    0    0    0 : slabdata      2      2      0
ip_dst_cache         417    544    256   32    2 : tunables    0    0    0 : slabdata     17     17      0
PING                   0      0   1152   28    8 : tunables    0    0    0 : slabdata      0      0      0
RAW                   56     56   1152   28    8 : tunables    0    0    0 : slabdata      2      2      0
UDP                  275    275   1280   25    8 : tunables    0    0    0 : slabdata     11     11      0
tw_sock_TCP           26     26    304   26    2 : tunables    0    0    0 : slabdata      1      1      0
request_sock_TCP       0      0    368   44    4 : tunables    0    0    0 : slabdata      0      0      0
TCP                   52     52   2368   13    8 : tunables    0    0    0 : slabdata      4      4      0
hugetlbfs_inode_cache     84     84    776   42    8 : tunables    0    0    0 : slabdata      2      2      0
dquot                  0      0    320   25    2 : tunables    0    0    0 : slabdata      0      0      0
bio-248               50     50    320   25    2 : tunables    0    0    0 : slabdata      2      2      0
ep_head             2432   2432     32  128    1 : tunables    0    0    0 : slabdata     19     19      0
eventpoll_pwq        924    924     96   42    1 : tunables    0    0    0 : slabdata     22     22      0
eventpoll_epi        924    924    192   42    2 : tunables    0    0    0 : slabdata     22     22      0
inotify_inode_mark    540    540    112   36    1 : tunables    0    0    0 : slabdata     15     15      0
dax_cache             36     36    896   36    8 : tunables    0    0    0 : slabdata      1      1      0
request_queue_srcu      0      0  52720    1   16 : tunables    0    0    0 : slabdata      0      0      0
request_queue         22     22   1488   22    8 : tunables    0    0    0 : slabdata      1      1      0
blkdev_ioc             0      0    120   34    1 : tunables    0    0    0 : slabdata      0      0      0
bio-184              256    256    256   32    2 : tunables    0    0    0 : slabdata      8      8      0
biovec-max            77     77   4352    7    8 : tunables    0    0    0 : slabdata     11     11      0
biovec-128             0      0   2176   15    8 : tunables    0    0    0 : slabdata      0      0      0
biovec-64            168    168   1152   28    8 : tunables    0    0    0 : slabdata      6      6      0
biovec-16            150    150    320   25    2 : tunables    0    0    0 : slabdata      6      6      0
bio_integrity_payload     64     64    256   32    2 : tunables    0    0    0 : slabdata      2      2      0
khugepaged_mm_slot    874    874    176   46    2 : tunables    0    0    0 : slabdata     19     19      0
ksm_mm_slot            0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
ksm_stable_node        0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
ksm_rmap_item          0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
user_namespace         0      0    752   43    8 : tunables    0    0    0 : slabdata      0      0      0
uid_cache             96     96    256   32    2 : tunables    0    0    0 : slabdata      3      3      0
iommu_iova             0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
dmaengine-unmap-256     14     14   2240   14    8 : tunables    0    0    0 : slabdata      1      1      0
dmaengine-unmap-128     26     26   1216   26    8 : tunables    0    0    0 : slabdata      1      1      0
dmaengine-unmap-16     32     32    256   32    2 : tunables    0    0    0 : slabdata      1      1      0
dmaengine-unmap-2     64     64     64   64    1 : tunables    0    0    0 : slabdata      1      1      0
audit_buffer         102    102     40  102    1 : tunables    0    0    0 : slabdata      1      1      0
sock_inode_cache     972    972    896   36    8 : tunables    0    0    0 : slabdata     27     27      0
skbuff_ext_cache       0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
skbuff_fclone_cache     25     25    640   25    4 : tunables    0    0    0 : slabdata      1      1      0
skbuff_head_cache   2318   2325    320   25    2 : tunables    0    0    0 : slabdata     93     93      0
configfs_dir_cache     34     34    120   34    1 : tunables    0    0    0 : slabdata      1      1      0
file_lock_cache      667    667    280   29    2 : tunables    0    0    0 : slabdata     23     23      0
file_lock_ctx        322    322     88   46    1 : tunables    0    0    0 : slabdata      7      7      0
fsnotify_mark_connector   1190   1190     48   85    1 : tunables    0    0    0 : slabdata     14     14      0
buffer_head           48     48    168   24    1 : tunables    0    0    0 : slabdata      2      2      0
x86_lbr                0      0    928   35    8 : tunables    0    0    0 : slabdata      0      0      0
task_delay_info        0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
taskstats              0      0    432   37    4 : tunables    0    0    0 : slabdata      0      0      0
proc_dir_entry       800    800    256   32    2 : tunables    0    0    0 : slabdata     25     25      0
pde_opener          1460   1460     56   73    1 : tunables    0    0    0 : slabdata     20     20      0
proc_inode_cache    2671   2964    824   39    8 : tunables    0    0    0 : slabdata     76     76      0
seq_file            3347   3608    184   44    2 : tunables    0    0    0 : slabdata     82     82      0
sigqueue            1152   1152    112   36    1 : tunables    0    0    0 : slabdata     32     32      0
bdev_cache            54     54   1728   18    8 : tunables    0    0    0 : slabdata      3      3      0
shmem_inode_cache   6156   6156    888   36    8 : tunables    0    0    0 : slabdata    171    171      0
kernfs_iattrs_cache    306    306    120   34    1 : tunables    0    0    0 : slabdata      9      9      0
kernfs_node_cache  42786  43512    192   42    2 : tunables    0    0    0 : slabdata   1036   1036      0
mnt_cache            588    588    384   42    4 : tunables    0    0    0 : slabdata     14     14      0
filp               43050  43050    320   25    2 : tunables    0    0    0 : slabdata   1722   1722      0
inode_cache        53789  54868    752   43    8 : tunables    0    0    0 : slabdata   1276   1276      0
dentry             95520  95520    256   32    2 : tunables    0    0    0 : slabdata   2985   2985      0
names_cache        41783  41783   4352    7    8 : tunables    0    0    0 : slabdata   5969   5969      0
net_namespace          0      0   4416    7    8 : tunables    0    0    0 : slabdata      0      0      0
iint_cache             0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
key_jar              325    325    320   25    2 : tunables    0    0    0 : slabdata     13     13      0
uts_namespace          0      0    496   33    4 : tunables    0    0    0 : slabdata      0      0      0
nsproxy              117    117    104   39    1 : tunables    0    0    0 : slabdata      3      3      0
vm_area_struct     49848  49848    264   31    2 : tunables    0    0    0 : slabdata   1608   1608      0
mm_struct           1337   1456   1216   26    8 : tunables    0    0    0 : slabdata     56     56      0
fs_cache            1376   1376    128   32    1 : tunables    0    0    0 : slabdata     43     43      0
files_cache         1365   1365    832   39    8 : tunables    0    0    0 : slabdata     35     35      0
signal_cache        1354   1375   1280   25    8 : tunables    0    0    0 : slabdata     55     55      0
sighand_cache        588    588   2240   14    8 : tunables    0    0    0 : slabdata     42     42      0
task_struct          792    792  10688    3    8 : tunables    0    0    0 : slabdata    264    264      0
cred_jar            3680   3680    256   32    2 : tunables    0    0    0 : slabdata    115    115      0
anon_vma_chain     24738  24738     96   42    1 : tunables    0    0    0 : slabdata    589    589      0
anon_vma            3496   3502    120   34    1 : tunables    0    0    0 : slabdata    103    103      0
pid                 1554   1554    192   42    2 : tunables    0    0    0 : slabdata     37     37      0
Acpi-Operand       17301  31395    104   39    1 : tunables    0    0    0 : slabdata    805    805      0
Acpi-ParseExt       2772   2772    112   36    1 : tunables    0    0    0 : slabdata     77     77      0
Acpi-Parse          4462   4462     88   46    1 : tunables    0    0    0 : slabdata     97     97      0
Acpi-State          4284   4284    112   36    1 : tunables    0    0    0 : slabdata    119    119      0
Acpi-Namespace      8320   8320     64   64    1 : tunables    0    0    0 : slabdata    130    130      0
shared_policy_node      0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
numa_policy           24     24    336   24    2 : tunables    0    0    0 : slabdata      1      1      0
perf_event           480    480   1328   24    8 : tunables    0    0    0 : slabdata     20     20      0
trace_event_file    2074   2074    120   34    1 : tunables    0    0    0 : slabdata     61     61      0
ftrace_event_field   5376   5376     64   64    1 : tunables    0    0    0 : slabdata     84     84      0
pool_workqueue       224    224    512   32    4 : tunables    0    0    0 : slabdata      7      7      0
radix_tree_node    15732  15732    704   46    8 : tunables    0    0    0 : slabdata    342    342      0
task_group           507    507    832   39    8 : tunables    0    0    0 : slabdata     13     13      0
vmap_area           3150   3150     96   42    1 : tunables    0    0    0 : slabdata     75     75      0
dma-kmalloc-8k         0      0  16384    2    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-4k         0      0   8192    4    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-2k         0      0   4096    8    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-1k         0      0   2048   16    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-512        0      0   1024   32    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-256        0      0    512   32    4 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-128        0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-64         0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-32         0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-16         0      0     32  128    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-8          0      0     40  102    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-192        0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-96         0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-8k         0      0  16384    2    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-4k         0      0   8192    4    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-2k         0      0   4096    8    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-1k         0      0   2048   16    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-512        0      0   1024   32    8 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-256        0      0    512   32    4 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-192       32     32    256   32    2 : tunables    0    0    0 : slabdata      1      1      0
kmalloc-rcl-128      384    544    256   32    2 : tunables    0    0    0 : slabdata     17     17      0
kmalloc-rcl-96      1666   1824    128   32    1 : tunables    0    0    0 : slabdata     57     57      0
kmalloc-rcl-64      2848   3232    128   32    1 : tunables    0    0    0 : slabdata    101    101      0
kmalloc-rcl-32         0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-16         0      0     32  128    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-rcl-8          0      0     40  102    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-cg-8k          4      4  16384    2    8 : tunables    0    0    0 : slabdata      2      2      0
kmalloc-cg-4k        400    400   8192    4    8 : tunables    0    0    0 : slabdata    100    100      0
kmalloc-cg-2k        256    256   4096    8    8 : tunables    0    0    0 : slabdata     32     32      0
kmalloc-cg-1k        720    720   2048   16    8 : tunables    0    0    0 : slabdata     45     45      0
kmalloc-cg-512      1058   1184   1024   32    8 : tunables    0    0    0 : slabdata     37     37      0
kmalloc-cg-256        32     32    512   32    4 : tunables    0    0    0 : slabdata      1      1      0
kmalloc-cg-192       832    832    256   32    2 : tunables    0    0    0 : slabdata     26     26      0
kmalloc-cg-128       192    192    256   32    2 : tunables    0    0    0 : slabdata      6      6      0
kmalloc-cg-96        224    224    128   32    1 : tunables    0    0    0 : slabdata      7      7      0
kmalloc-cg-64        544    544    128   32    1 : tunables    0    0    0 : slabdata     17     17      0
kmalloc-cg-32       2048   2048     64   64    1 : tunables    0    0    0 : slabdata     32     32      0
kmalloc-cg-16       1152   1152     32  128    1 : tunables    0    0    0 : slabdata      9      9      0
kmalloc-cg-8        1122   1122     40  102    1 : tunables    0    0    0 : slabdata     11     11      0
kmalloc-8k           336    336  16384    2    8 : tunables    0    0    0 : slabdata    168    168      0
kmalloc-4k          9735   9828   8192    4    8 : tunables    0    0    0 : slabdata   2457   2457      0
kmalloc-2k          1612   2584   4096    8    8 : tunables    0    0    0 : slabdata    323    323      0
kmalloc-1k          2262   2752   2048   16    8 : tunables    0    0    0 : slabdata    172    172      0
kmalloc-512         8361   9568   1024   32    8 : tunables    0    0    0 : slabdata    299    299      0
kmalloc-256        11519  12320    512   32    4 : tunables    0    0    0 : slabdata    385    385      0
kmalloc-192         3032   4096    256   32    2 : tunables    0    0    0 : slabdata    128    128      0
kmalloc-128         2624   2624    256   32    2 : tunables    0    0    0 : slabdata     82     82      0
kmalloc-96          3593   4640    128   32    1 : tunables    0    0    0 : slabdata    145    145      0
kmalloc-64         30200  53760    128   32    1 : tunables    0    0    0 : slabdata   1680   1680      0
kmalloc-32         68508  82496     64   64    1 : tunables    0    0    0 : slabdata   1289   1289      0
kmalloc-16         65422  65792     32  128    1 : tunables    0    0    0 : slabdata    514    514      0
kmalloc-8          11103  23562     40  102    1 : tunables    0    0    0 : slabdata    231    231      0
kmem_cache_node      480    480    128   32    1 : tunables    0    0    0 : slabdata     15     15      0
kmem_cache           400    400    320   25    2 : tunables    0    0    0 : slabdata     16     16      0Test requirement not met in function intel_require_memory, file ../lib/intel_os.c:398:
Test requirement: sufficient_memory
Estimated that we need 402653184 objects and 405798912 MiB for the test, but only have 12442 MiB available (RAM) and a maximum of 9223372036854775807 objects
Subtest aperture-thrash: SKIP (0.139s)
2022-05-11 14:10:10 build/tests/gem_render_tiled_blits --run-subtest basic
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: basic
Using a snoop linear buffer for comparisons
Verifying initialisation...
Cyclic blits, forward...
Cyclic blits, backward...
Random blits...
Subtest basic: SUCCESS (0.021s)
2022-05-11 14:10:11 build/tests/gem_render_tiled_blits --run-subtest swap-thrash
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: swap-thrash
Test requirement not met in function __igt_unique____real_main197, file ../tests/i915/gem_render_tiled_blits.c:230:
Test requirement: swap_mb > 0
Subtest swap-thrash: SKIP (0.000s)
2022-05-11 14:10:11 build/tests/gem_ringfill --run-subtest basic-all
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest basic-all: SKIP
LKP SKIP igt@gem_ringfill@engines-S3
2022-05-11 14:10:11 build/tests/gem_ringfill --run-subtest engines-S4
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-S4: SKIP
2022-05-11 14:10:11 build/tests/gem_ringfill --run-subtest engines-basic
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-basic: SKIP
2022-05-11 14:10:11 build/tests/gem_ringfill --run-subtest engines-bomb
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-bomb: SKIP
2022-05-11 14:10:12 build/tests/gem_ringfill --run-subtest engines-child
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-child: SKIP
2022-05-11 14:10:12 build/tests/gem_ringfill --run-subtest engines-fd
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-fd: SKIP
2022-05-11 14:10:12 build/tests/gem_ringfill --run-subtest engines-forked
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-forked: SKIP
2022-05-11 14:10:12 build/tests/gem_ringfill --run-subtest engines-hang
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-hang: SKIP
2022-05-11 14:10:13 build/tests/gem_ringfill --run-subtest engines-interruptible
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest engines-interruptible: SKIP
LKP SKIP igt@gem_ringfill@legacy-S3
2022-05-11 14:10:13 build/tests/gem_ringfill --run-subtest legacy-S4
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-S4: SKIP
2022-05-11 14:10:13 build/tests/gem_ringfill --run-subtest legacy-basic
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-basic: SKIP
2022-05-11 14:10:13 build/tests/gem_ringfill --run-subtest legacy-bomb
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-bomb: SKIP
2022-05-11 14:10:13 build/tests/gem_ringfill --run-subtest legacy-child
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-child: SKIP
2022-05-11 14:10:14 build/tests/gem_ringfill --run-subtest legacy-fd
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-fd: SKIP
2022-05-11 14:10:14 build/tests/gem_ringfill --run-subtest legacy-forked
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-forked: SKIP
2022-05-11 14:10:14 build/tests/gem_ringfill --run-subtest legacy-hang
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-hang: SKIP
2022-05-11 14:10:14 build/tests/gem_ringfill --run-subtest legacy-interruptible
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4 (vgem)
Last errno: 2, No such file or directory
Subtest legacy-interruptible: SKIP
2022-05-11 14:10:15 build/tests/gem_tiled_partial_pwrite_pread --run-subtest reads
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: reads
Subtest reads: SUCCESS (0.145s)
2022-05-11 14:10:15 build/tests/gem_tiled_partial_pwrite_pread --run-subtest writes
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: writes
Subtest writes: SUCCESS (0.243s)
2022-05-11 14:10:16 build/tests/gem_tiled_partial_pwrite_pread --run-subtest writes-after-reads
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: writes-after-reads
Subtest writes-after-reads: SUCCESS (0.382s)
2022-05-11 14:10:17 build/tests/i915_module_load --run-subtest reload
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: reload
Subtest reload: SUCCESS (3.299s)
2022-05-11 14:10:20 build/tests/i915_module_load --run-subtest reload-no-display
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: reload-no-display
Reloading i915 with disable_display=1

Subtest reload-no-display: SUCCESS (2.605s)
2022-05-11 14:10:23 build/tests/i915_module_load --run-subtest reload-with-fault-injection
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: reload-with-fault-injection
Test requirement not met in function __igt_unique____real_main239, file ../tests/i915/i915_module_load.c:278:
Test requirement: igt_kmod_has_param("i915", param)
Subtest reload-with-fault-injection: SKIP (0.002s)
2022-05-11 14:10:23 build/tests/kms_fbcon_fbt --run-subtest fbc
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: fbc
Modes unset.
Setting 1280x1024 mode for HDMI-A connector
Screen set.
Back to fbcon.
Subtest fbc: SUCCESS (3.329s)
LKP SKIP igt@kms_fbcon_fbt@fbc-suspend
2022-05-11 14:10:28 build/tests/kms_fbcon_fbt --run-subtest psr
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: psr
Test requirement not met in function subtest, file ../tests/i915/kms_fbcon_fbt.c:340:
Test requirement: feature->supported_on_chipset(drm->fd, drm->debugfs_fd)
Last errno: 19, No such device
Subtest psr: SKIP (0.000s)
LKP SKIP igt@kms_fbcon_fbt@psr-suspend
2022-05-11 14:10:28 build/tests/kms_force_connector_basic --run-subtest force-connector-state
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: force-connector-state
Subtest force-connector-state: SUCCESS (0.177s)
2022-05-11 14:10:29 build/tests/kms_force_connector_basic --run-subtest force-edid
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: force-edid
Subtest force-edid: SUCCESS (0.060s)
2022-05-11 14:10:29 build/tests/kms_force_connector_basic --run-subtest force-load-detect
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: force-load-detect
Test requirement not met in function __igt_unique____real_main78, file ../tests/kms_force_connector_basic.c:149:
Test requirement: connector->connector_type == DRM_MODE_CONNECTOR_VGA
Subtest force-load-detect: SKIP (0.000s)
2022-05-11 14:10:30 build/tests/kms_force_connector_basic --run-subtest prune-stale-modes
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: prune-stale-modes
Subtest prune-stale-modes: SUCCESS (0.056s)
2022-05-11 14:10:30 build/tests/kms_universal_plane --run-subtest cursor-fb-leak-pipe-A
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: cursor-fb-leak-pipe-A
Subtest cursor-fb-leak-pipe-A: SUCCESS (0.201s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:31 build/tests/kms_universal_plane --run-subtest cursor-fb-leak-pipe-B
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: cursor-fb-leak-pipe-B
Subtest cursor-fb-leak-pipe-B: SUCCESS (0.226s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:31 build/tests/kms_universal_plane --run-subtest cursor-fb-leak-pipe-C
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: cursor-fb-leak-pipe-C
Subtest cursor-fb-leak-pipe-C: SUCCESS (0.222s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:31 build/tests/kms_universal_plane --run-subtest cursor-fb-leak-pipe-D
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Subtest cursor-fb-leak-pipe-D: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:32 build/tests/kms_universal_plane --run-subtest cursor-fb-leak-pipe-E
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Subtest cursor-fb-leak-pipe-E: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:32 build/tests/kms_universal_plane --run-subtest cursor-fb-leak-pipe-F
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
Subtest cursor-fb-leak-pipe-F: SKIP
2022-05-11 14:10:32 build/tests/kms_universal_plane --run-subtest disable-primary-vs-flip-pipe-A
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: disable-primary-vs-flip-pipe-A
Subtest disable-primary-vs-flip-pipe-A: SUCCESS (0.234s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:32 build/tests/kms_universal_plane --run-subtest disable-primary-vs-flip-pipe-B
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: disable-primary-vs-flip-pipe-B
Subtest disable-primary-vs-flip-pipe-B: SUCCESS (0.259s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:33 build/tests/kms_universal_plane --run-subtest disable-primary-vs-flip-pipe-C
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: disable-primary-vs-flip-pipe-C
Subtest disable-primary-vs-flip-pipe-C: SUCCESS (0.256s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:33 build/tests/kms_universal_plane --run-subtest disable-primary-vs-flip-pipe-D
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Subtest disable-primary-vs-flip-pipe-D: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:33 build/tests/kms_universal_plane --run-subtest disable-primary-vs-flip-pipe-E
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Subtest disable-primary-vs-flip-pipe-E: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:34 build/tests/kms_universal_plane --run-subtest disable-primary-vs-flip-pipe-F
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
Subtest disable-primary-vs-flip-pipe-F: SKIP
2022-05-11 14:10:34 build/tests/kms_universal_plane --run-subtest universal-plane-gen9-features-pipe-A
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-gen9-features-pipe-A
Subtest universal-plane-gen9-features-pipe-A: SUCCESS (0.297s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:34 build/tests/kms_universal_plane --run-subtest universal-plane-gen9-features-pipe-B
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-gen9-features-pipe-B
Subtest universal-plane-gen9-features-pipe-B: SUCCESS (0.313s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:35 build/tests/kms_universal_plane --run-subtest universal-plane-gen9-features-pipe-C
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-gen9-features-pipe-C
Subtest universal-plane-gen9-features-pipe-C: SUCCESS (0.313s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:35 build/tests/kms_universal_plane --run-subtest universal-plane-gen9-features-pipe-D
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Subtest universal-plane-gen9-features-pipe-D: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:35 build/tests/kms_universal_plane --run-subtest universal-plane-gen9-features-pipe-E
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Subtest universal-plane-gen9-features-pipe-E: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:36 build/tests/kms_universal_plane --run-subtest universal-plane-gen9-features-pipe-F
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
Subtest universal-plane-gen9-features-pipe-F: SKIP
2022-05-11 14:10:36 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-A-functional
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-pipe-A-functional
Testing connector HDMI-A-2 using pipe A
Subtest universal-plane-pipe-A-functional: SUCCESS (1.654s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:38 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-A-sanity
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-pipe-A-sanity
Subtest universal-plane-pipe-A-sanity: SUCCESS (0.291s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:38 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-B-functional
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-pipe-B-functional
Testing connector HDMI-A-2 using pipe B
Subtest universal-plane-pipe-B-functional: SUCCESS (1.683s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:40 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-B-sanity
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-pipe-B-sanity
Subtest universal-plane-pipe-B-sanity: SUCCESS (0.303s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:40 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-C-functional
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-pipe-C-functional
Testing connector HDMI-A-2 using pipe C
Subtest universal-plane-pipe-C-functional: SUCCESS (1.680s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:42 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-C-sanity
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Starting subtest: universal-plane-pipe-C-sanity
Subtest universal-plane-pipe-C-sanity: SUCCESS (0.313s)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:43 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-D-functional
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Subtest universal-plane-pipe-D-functional: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:43 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-D-sanity
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Subtest universal-plane-pipe-D-sanity: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:43 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-E-functional
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Subtest universal-plane-pipe-E-functional: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:43 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-E-sanity
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Subtest universal-plane-pipe-E-sanity: SKIP
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
2022-05-11 14:10:44 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-F-functional
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
Subtest universal-plane-pipe-F-functional: SKIP
2022-05-11 14:10:44 build/tests/kms_universal_plane --run-subtest universal-plane-pipe-F-sanity
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../lib/igt_kms.c:2135:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
Subtest universal-plane-pipe-F-sanity: SKIP
2022-05-11 14:10:44 build/tests/prime_nv_pcopy --run-subtest test1_macro
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test1_macro: SKIP
2022-05-11 14:10:44 build/tests/prime_nv_pcopy --run-subtest test1_micro
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test1_micro: SKIP
2022-05-11 14:10:44 build/tests/prime_nv_pcopy --run-subtest test2
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test2: SKIP
2022-05-11 14:10:44 build/tests/prime_nv_pcopy --run-subtest test3_1
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test3_1: SKIP
2022-05-11 14:10:44 build/tests/prime_nv_pcopy --run-subtest test3_2
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test3_2: SKIP
2022-05-11 14:10:44 build/tests/prime_nv_pcopy --run-subtest test3_3
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test3_3: SKIP
2022-05-11 14:10:45 build/tests/prime_nv_pcopy --run-subtest test3_4
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test3_4: SKIP
2022-05-11 14:10:45 build/tests/prime_nv_pcopy --run-subtest test3_5
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test3_5: SKIP
2022-05-11 14:10:45 build/tests/prime_nv_pcopy --run-subtest test_semaphore
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function __igt_unique____real_main851, file ../tests/prime_nv_pcopy.c:856:
Test requirement: nouveau_fd != -1
Last errno: 2, No such file or directory
Subtest test_semaphore: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest 32bits-limit
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest 32bits-limit: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest device-signal-unordered
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest device-signal-unordered: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest device-submit-unordered
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest device-submit-unordered: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-available-unsubmitted: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-available-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-available-unsubmitted-signaled: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-available-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-available-unsubmitted-submitted: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-submitted: SKIP
2022-05-11 14:10:45 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-submitted-signaled: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-unsubmitted: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-unsubmitted-signaled: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-unsubmitted-submitted: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-for-submit-unsubmitted-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-for-submit-unsubmitted-submitted-signaled: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-submitted: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-all-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-all-submitted-signaled: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-for-submit-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-for-submit-available-unsubmitted: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-for-submit-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-for-submit-submitted: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-for-submit-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-for-submit-unsubmitted: SKIP
2022-05-11 14:10:46 build/tests/syncobj_timeline --run-subtest etime-multi-wait-for-submit-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-for-submit-unsubmitted-submitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-multi-wait-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-multi-wait-submitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-all-for-submit-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-all-for-submit-available-unsubmitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-all-for-submit-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-all-for-submit-submitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-all-for-submit-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-all-for-submit-unsubmitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-all-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-all-submitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-for-submit-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-for-submit-available-unsubmitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-for-submit-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-for-submit-submitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-for-submit-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-for-submit-unsubmitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest etime-single-wait-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest etime-single-wait-submitted: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest host-signal-ordered
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest host-signal-ordered: SKIP
2022-05-11 14:10:47 build/tests/syncobj_timeline --run-subtest host-signal-points
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest host-signal-points: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-available-unsubmitted: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-available-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-available-unsubmitted-signaled: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-available-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-available-unsubmitted-submitted: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-available-unsubmitted-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-available-unsubmitted-submitted-signaled: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-unsubmitted: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-unsubmitted-signaled: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-unsubmitted-submitted: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-all-unsubmitted-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-all-unsubmitted-submitted-signaled: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-available-unsubmitted: SKIP
2022-05-11 14:10:48 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-available-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-available-unsubmitted-signaled: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-available-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-available-unsubmitted-submitted: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-available-unsubmitted-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-available-unsubmitted-submitted-signaled: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-unsubmitted: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-unsubmitted-signaled: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-unsubmitted-submitted: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-multi-wait-unsubmitted-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-multi-wait-unsubmitted-submitted-signaled: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-query-bad-pad
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-query-bad-pad: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-query-illegal-handle
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-query-illegal-handle: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-query-one-illegal-handle
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-query-one-illegal-handle: SKIP
2022-05-11 14:10:49 build/tests/syncobj_timeline --run-subtest invalid-query-zero-handles
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-query-zero-handles: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-signal-bad-pad
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-signal-bad-pad: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-signal-illegal-handle
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-signal-illegal-handle: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-signal-illegal-point
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-signal-illegal-point: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-signal-one-illegal-handle
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-signal-one-illegal-handle: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-signal-zero-handles
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-signal-zero-handles: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-single-wait-all-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-single-wait-all-available-unsubmitted: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-single-wait-all-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-single-wait-all-unsubmitted: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-single-wait-available-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-single-wait-available-unsubmitted: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-single-wait-unsubmitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-single-wait-unsubmitted: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-transfer-bad-pad
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-transfer-bad-pad: SKIP
2022-05-11 14:10:50 build/tests/syncobj_timeline --run-subtest invalid-transfer-illegal-handle
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-transfer-illegal-handle: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest invalid-transfer-non-existent-point
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-transfer-non-existent-point: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest invalid-wait-bad-flags
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-wait-bad-flags: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest invalid-wait-illegal-handle
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-wait-illegal-handle: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest invalid-wait-zero-handles
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest invalid-wait-zero-handles: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest multi-wait-all-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-available-signaled: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest multi-wait-all-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-available-submitted: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest multi-wait-all-available-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-available-submitted-signaled: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest multi-wait-all-for-submit-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-for-submit-available-signaled: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest multi-wait-all-for-submit-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-for-submit-available-submitted: SKIP
2022-05-11 14:10:51 build/tests/syncobj_timeline --run-subtest multi-wait-all-for-submit-available-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-for-submit-available-submitted-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-all-for-submit-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-for-submit-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-all-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-all-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-available-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-available-submitted: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-available-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-available-submitted-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-available-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-available-submitted: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-available-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-available-submitted-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-available-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-available-unsubmitted-signaled: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-available-unsubmitted-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-available-unsubmitted-submitted: SKIP
2022-05-11 14:10:52 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-available-unsubmitted-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-available-unsubmitted-submitted-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-submitted-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-unsubmitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-unsubmitted-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest multi-wait-for-submit-unsubmitted-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-for-submit-unsubmitted-submitted-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest multi-wait-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest multi-wait-submitted-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest multi-wait-submitted-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest reset-during-wait-for-submit
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest reset-during-wait-for-submit: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest reset-multiple-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest reset-multiple-signaled: SKIP
2022-05-11 14:10:53 build/tests/syncobj_timeline --run-subtest reset-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest reset-signaled: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest reset-unsignaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest reset-unsignaled: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest signal
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest signal: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest signal-array
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest signal-array: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest signal-point-0
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest signal-point-0: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest single-wait-all-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-all-available-signaled: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest single-wait-all-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-all-available-submitted: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest single-wait-all-for-submit-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-all-for-submit-available-signaled: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest single-wait-all-for-submit-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-all-for-submit-available-submitted: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest single-wait-all-for-submit-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-all-for-submit-signaled: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest single-wait-all-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-all-signaled: SKIP
2022-05-11 14:10:54 build/tests/syncobj_timeline --run-subtest single-wait-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-available-signaled: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest single-wait-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-available-submitted: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest single-wait-for-submit-available-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-for-submit-available-signaled: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest single-wait-for-submit-available-submitted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-for-submit-available-submitted: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest single-wait-for-submit-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-for-submit-signaled: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest single-wait-signaled
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest single-wait-signaled: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest transfer-timeline-point
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest transfer-timeline-point: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest wait-all-complex
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-all-complex: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest wait-all-delayed-signal
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-all-delayed-signal: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest wait-all-for-submit-complex
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-all-for-submit-complex: SKIP
2022-05-11 14:10:55 build/tests/syncobj_timeline --run-subtest wait-all-for-submit-delayed-submit
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-all-for-submit-delayed-submit: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-all-for-submit-snapshot
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-all-for-submit-snapshot: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-all-interrupted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-all-interrupted: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-all-snapshot
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-all-snapshot: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-any-complex
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-any-complex: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-any-interrupted
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-any-interrupted: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-any-snapshot
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-any-snapshot: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-delayed-signal
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-delayed-signal: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-for-submit-complex
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-for-submit-complex: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-for-submit-delayed-submit
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-for-submit-delayed-submit: SKIP
2022-05-11 14:10:56 build/tests/syncobj_timeline --run-subtest wait-for-submit-snapshot
IGT-Version: 1.26-geddc67c5 (x86_64) (Linux: 5.18.0-rc5-01118-ga9290ca07a36 x86_64)
Test requirement not met in function igt_require_sw_sync, file ../lib/sw_sync.c:265:
Test requirement: kernel_has_sw_sync()
Last errno: 2, No such file or directory
Subtest wait-for-submit-snapshot: SKIP
LKP SKIP igt@v3d_get_param@base-params
LKP SKIP igt@v3d_get_param@get-bad-flags
LKP SKIP igt@v3d_get_param@get-bad-param

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="job.yaml"

---
:#! jobs/igt-part1.yaml:
suite: igt
testcase: igt
category: functional
igt:
  group: group-04
job_origin: igt-part1.yaml
:#! queue options:
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-cml-d02
tbox_group: lkp-cml-d02
kconfig: x86_64-rhel-8.3-func
submit_id: 627bb4427134fe49392b94b1
job_file: "/lkp/jobs/scheduled/lkp-cml-d02/igt-group-04-ucode=0xc2-debian-10.4-x86_64-20200603.cgz-a9290ca07a36882b114c3cd9bbd8f66ed47508bd-20220511-18745-i5yelg-0.yaml"
id: 4ade6e00aae171c6b3101446f0f9000a5c7cfcb3
queuer_version: "/zday/lkp"
:#! hosts/lkp-cml-d02:
model: Commet Lake
nr_node: 1
nr_cpu: 20
memory: 16G
ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BA800G4_BTHV61840945800OGN-part4"
rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BA800G4_BTHV61840945800OGN-part3"
kernel_cmdline_hw: acpi_rsdp=0x9b0fe014
:#! include/category/functional:
kmsg:
heartbeat:
meminfo:
:#! include/queue/cyclic:
commit: a9290ca07a36882b114c3cd9bbd8f66ed47508bd
:#! include/testbox/lkp-cml-d02:
netconsole_port: 6683
ucode: '0xc2'
need_kconfig_hw:
- IGB: y
- E1000E: y
- SATA_AHCI
- DRM_I915
- IGC: y
bisect_dmesg: true
enqueue_time: 2022-05-11 21:04:03.873025817 +08:00
_id: 627bb4427134fe49392b94b1
_rt: "/result/igt/group-04-ucode=0xc2/lkp-cml-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd"
:#! schedule options:
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: 781f24707a020e96d9fffdb343d210a77094cd75
base_commit: 672c0c5173427e6b3e2a9bbb7be51ceeec78093a
branch: linux-devel/devel-hourly-20220507-045611
rootfs: debian-10.4-x86_64-20200603.cgz
result_root: "/result/igt/group-04-ucode=0xc2/lkp-cml-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/0"
scheduler_version: "/lkp/lkp/.src-20220511-170024"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/igt/group-04-ucode=0xc2/lkp-cml-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/vmlinuz-5.18.0-rc5-01118-ga9290ca07a36
- branch=linux-devel/devel-hourly-20220507-045611
- job=/lkp/jobs/scheduled/lkp-cml-d02/igt-group-04-ucode=0xc2-debian-10.4-x86_64-20200603.cgz-a9290ca07a36882b114c3cd9bbd8f66ed47508bd-20220511-18745-i5yelg-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-func
- commit=a9290ca07a36882b114c3cd9bbd8f66ed47508bd
- acpi_rsdp=0x9b0fe014
- max_uptime=2100
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/modules.cgz"
bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20220105.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/igt_20220430.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/igt-x86_64-eddc67c5-1_20220430.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20220216.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn
:#! /cephfs/db/releases/20220507003519/lkp-src/include/site/inn:
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
:#! runtime status:
last_kernel: 5.18.0-rc6
schedule_notify_address:
:#! user overrides:
kernel: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/a9290ca07a36882b114c3cd9bbd8f66ed47508bd/vmlinuz-5.18.0-rc5-01118-ga9290ca07a36"
dequeue_time: 2022-05-11 21:10:41.571069130 +08:00
:#! /cephfs/db/releases/20220511172323/lkp-src/include/site/inn:
job_state: finished
loadavg: 1.61 0.56 0.20 1/292 6476
start_time: '1652274704'
end_time: '1652274767'
version: "/lkp/lkp/.src-20220511-170101:91c8f71c:054a88fad"

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

 "build/tests/api_intel_bb" "--run-subtest" "add-remove-objects"
 "build/tests/api_intel_bb" "--run-subtest" "bb-with-allocator"
 "build/tests/api_intel_bb" "--run-subtest" "blit-noreloc-keep-cache"
 "build/tests/api_intel_bb" "--run-subtest" "blit-noreloc-keep-cache-random"
 "build/tests/api_intel_bb" "--run-subtest" "blit-noreloc-purge-cache"
 "build/tests/api_intel_bb" "--run-subtest" "blit-noreloc-purge-cache-random"
 "build/tests/api_intel_bb" "--run-subtest" "blit-reloc-keep-cache"
 "build/tests/api_intel_bb" "--run-subtest" "blit-reloc-purge-cache"
 "build/tests/api_intel_bb" "--run-subtest" "delta-check"
 "build/tests/api_intel_bb" "--run-subtest" "destroy-bb"
 "build/tests/api_intel_bb" "--run-subtest" "full-batch"
 "build/tests/api_intel_bb" "--run-subtest" "intel-bb-blit-none"
 "build/tests/api_intel_bb" "--run-subtest" "intel-bb-blit-x"
 "build/tests/api_intel_bb" "--run-subtest" "intel-bb-blit-y"
 "build/tests/api_intel_bb" "--run-subtest" "lot-of-buffers"
 "build/tests/api_intel_bb" "--run-subtest" "object-noreloc-keep-cache-random"
 "build/tests/api_intel_bb" "--run-subtest" "object-noreloc-keep-cache-simple"
 "build/tests/api_intel_bb" "--run-subtest" "object-noreloc-purge-cache-random"
 "build/tests/api_intel_bb" "--run-subtest" "object-noreloc-purge-cache-simple"
 "build/tests/api_intel_bb" "--run-subtest" "object-reloc-keep-cache"
 "build/tests/api_intel_bb" "--run-subtest" "object-reloc-purge-cache"
 "build/tests/api_intel_bb" "--run-subtest" "offset-control"
 "build/tests/api_intel_bb" "--run-subtest" "purge-bb"
 "build/tests/api_intel_bb" "--run-subtest" "render"
 "build/tests/api_intel_bb" "--run-subtest" "render-ccs"
 "build/tests/api_intel_bb" "--run-subtest" "reset-bb"
 "build/tests/api_intel_bb" "--run-subtest" "reset-flags"
 "build/tests/api_intel_bb" "--run-subtest" "simple-bb"
 "build/tests/api_intel_bb" "--run-subtest" "simple-bb-ctx"
 "build/tests/gem_media_fill" "--run-subtest" "media-fill"
 "build/tests/gem_render_tiled_blits" "--run-subtest" "aperture-shrink"
 "build/tests/gem_render_tiled_blits" "--run-subtest" "aperture-thrash"
 "build/tests/gem_render_tiled_blits" "--run-subtest" "basic"
 "build/tests/gem_render_tiled_blits" "--run-subtest" "swap-thrash"
 "build/tests/gem_ringfill" "--run-subtest" "basic-all"
 "build/tests/gem_ringfill" "--run-subtest" "engines-S4"
 "build/tests/gem_ringfill" "--run-subtest" "engines-basic"
 "build/tests/gem_ringfill" "--run-subtest" "engines-bomb"
 "build/tests/gem_ringfill" "--run-subtest" "engines-child"
 "build/tests/gem_ringfill" "--run-subtest" "engines-fd"
 "build/tests/gem_ringfill" "--run-subtest" "engines-forked"
 "build/tests/gem_ringfill" "--run-subtest" "engines-hang"
 "build/tests/gem_ringfill" "--run-subtest" "engines-interruptible"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-S4"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-basic"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-bomb"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-child"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-fd"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-forked"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-hang"
 "build/tests/gem_ringfill" "--run-subtest" "legacy-interruptible"
 "build/tests/gem_tiled_partial_pwrite_pread" "--run-subtest" "reads"
 "build/tests/gem_tiled_partial_pwrite_pread" "--run-subtest" "writes"
 "build/tests/gem_tiled_partial_pwrite_pread" "--run-subtest" "writes-after-reads"
 "build/tests/i915_module_load" "--run-subtest" "reload"
 "build/tests/i915_module_load" "--run-subtest" "reload-no-display"
 "build/tests/i915_module_load" "--run-subtest" "reload-with-fault-injection"
 "build/tests/kms_fbcon_fbt" "--run-subtest" "fbc"
 "build/tests/kms_fbcon_fbt" "--run-subtest" "psr"
 "build/tests/kms_force_connector_basic" "--run-subtest" "force-connector-state"
 "build/tests/kms_force_connector_basic" "--run-subtest" "force-edid"
 "build/tests/kms_force_connector_basic" "--run-subtest" "force-load-detect"
 "build/tests/kms_force_connector_basic" "--run-subtest" "prune-stale-modes"
 "build/tests/kms_universal_plane" "--run-subtest" "cursor-fb-leak-pipe-A"
 "build/tests/kms_universal_plane" "--run-subtest" "cursor-fb-leak-pipe-B"
 "build/tests/kms_universal_plane" "--run-subtest" "cursor-fb-leak-pipe-C"
 "build/tests/kms_universal_plane" "--run-subtest" "cursor-fb-leak-pipe-D"
 "build/tests/kms_universal_plane" "--run-subtest" "cursor-fb-leak-pipe-E"
 "build/tests/kms_universal_plane" "--run-subtest" "cursor-fb-leak-pipe-F"
 "build/tests/kms_universal_plane" "--run-subtest" "disable-primary-vs-flip-pipe-A"
 "build/tests/kms_universal_plane" "--run-subtest" "disable-primary-vs-flip-pipe-B"
 "build/tests/kms_universal_plane" "--run-subtest" "disable-primary-vs-flip-pipe-C"
 "build/tests/kms_universal_plane" "--run-subtest" "disable-primary-vs-flip-pipe-D"
 "build/tests/kms_universal_plane" "--run-subtest" "disable-primary-vs-flip-pipe-E"
 "build/tests/kms_universal_plane" "--run-subtest" "disable-primary-vs-flip-pipe-F"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-gen9-features-pipe-A"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-gen9-features-pipe-B"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-gen9-features-pipe-C"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-gen9-features-pipe-D"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-gen9-features-pipe-E"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-gen9-features-pipe-F"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-A-functional"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-A-sanity"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-B-functional"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-B-sanity"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-C-functional"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-C-sanity"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-D-functional"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-D-sanity"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-E-functional"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-E-sanity"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-F-functional"
 "build/tests/kms_universal_plane" "--run-subtest" "universal-plane-pipe-F-sanity"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test1_macro"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test1_micro"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test2"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test3_1"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test3_2"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test3_3"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test3_4"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test3_5"
 "build/tests/prime_nv_pcopy" "--run-subtest" "test_semaphore"
 "build/tests/syncobj_timeline" "--run-subtest" "32bits-limit"
 "build/tests/syncobj_timeline" "--run-subtest" "device-signal-unordered"
 "build/tests/syncobj_timeline" "--run-subtest" "device-submit-unordered"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-available-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-available-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-for-submit-unsubmitted-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-all-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-for-submit-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-for-submit-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-for-submit-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-for-submit-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-multi-wait-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-all-for-submit-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-all-for-submit-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-all-for-submit-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-all-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-for-submit-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-for-submit-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-for-submit-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "etime-single-wait-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "host-signal-ordered"
 "build/tests/syncobj_timeline" "--run-subtest" "host-signal-points"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-available-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-available-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-available-unsubmitted-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-all-unsubmitted-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-available-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-available-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-available-unsubmitted-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-multi-wait-unsubmitted-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-query-bad-pad"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-query-illegal-handle"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-query-one-illegal-handle"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-query-zero-handles"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-signal-bad-pad"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-signal-illegal-handle"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-signal-illegal-point"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-signal-one-illegal-handle"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-signal-zero-handles"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-single-wait-all-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-single-wait-all-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-single-wait-available-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-single-wait-unsubmitted"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-transfer-bad-pad"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-transfer-illegal-handle"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-transfer-non-existent-point"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-wait-bad-flags"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-wait-illegal-handle"
 "build/tests/syncobj_timeline" "--run-subtest" "invalid-wait-zero-handles"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-available-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-for-submit-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-for-submit-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-for-submit-available-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-for-submit-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-all-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-available-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-available-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-available-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-available-unsubmitted-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-available-unsubmitted-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-unsubmitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-for-submit-unsubmitted-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "multi-wait-submitted-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "reset-during-wait-for-submit"
 "build/tests/syncobj_timeline" "--run-subtest" "reset-multiple-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "reset-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "reset-unsignaled"
 "build/tests/syncobj_timeline" "--run-subtest" "signal"
 "build/tests/syncobj_timeline" "--run-subtest" "signal-array"
 "build/tests/syncobj_timeline" "--run-subtest" "signal-point-0"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-all-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-all-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-all-for-submit-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-all-for-submit-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-all-for-submit-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-all-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-for-submit-available-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-for-submit-available-submitted"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-for-submit-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "single-wait-signaled"
 "build/tests/syncobj_timeline" "--run-subtest" "transfer-timeline-point"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-all-complex"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-all-delayed-signal"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-all-for-submit-complex"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-all-for-submit-delayed-submit"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-all-for-submit-snapshot"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-all-interrupted"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-all-snapshot"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-any-complex"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-any-interrupted"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-any-snapshot"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-delayed-signal"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-for-submit-complex"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-for-submit-delayed-submit"
 "build/tests/syncobj_timeline" "--run-subtest" "wait-for-submit-snapshot"

--qjNfmADvan18RZcF--
