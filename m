Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7980619681
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 13:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F55910E0F5;
	Fri,  4 Nov 2022 12:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA29010E038;
 Fri,  4 Nov 2022 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667566031; x=1699102031;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPunl4osppyLqR+Xi1y4JyX4umyoRMB/HIeAA3Sly5w=;
 b=eCjExWUioTnJ2Ck5VoDFNhzsMcBETomkItF8enPPJMXQj0QnPlcHpMSy
 7sXiZE92K2KCm0BzZkFtTMYhhuQoETO64/a4c+XUXTRQKLpF9KUTNTe0y
 qUA0XY5kDKj5Qksrdob1Inbtlg2tR0wCTTLR77ZlpdbyFXHcjz4l2SdZZ
 1Edqe5L6+bA0jCM5yBGuDVhzBdAUCBF2KmtZ5ylvFyB3rVG8J9b2waKHZ
 p4ccQjyhdfx15XcljtUwv8QTQIdwOclk6ljgz6HQf8Ooua6vhVmC4Jq6w
 tu8RezUn5/IVkZRYnqcY/KRWzA+SQ3rZnHISdK7QuGKT0WX3GlD23G2tm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="311697507"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="311697507"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 05:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="740612274"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="740612274"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2022 05:47:09 -0700
Received: from maurocar-mobl2 (unknown [10.252.31.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C344F58090D;
 Fri,  4 Nov 2022 05:47:06 -0700 (PDT)
Date: Fri, 4 Nov 2022 13:47:03 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: KUnit issues - Was: [igt-dev] [PATCH RFC v2 8/8] drm/i915:
 check if current->mm is not NULL
Message-ID: <20221104134703.3770b371@maurocar-mobl2>
In-Reply-To: <20221104084955.4e6e1093@maurocar-mobl2>
References: <20221103162302.4ba62d72@maurocar-mobl2>
 <CAGS_qxr1=PLFzM8bGjdowZwdOXMEPiJEnffPUGQvwdhYVJJNvA@mail.gmail.com>
 <20221104084955.4e6e1093@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: David Gow <davidgow@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Nov 2022 08:49:55 +0100
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> On Thu, 3 Nov 2022 15:43:26 -0700
> Daniel Latypov <dlatypov@google.com> wrote:
> 
> > On Thu, Nov 3, 2022 at 8:23 AM Mauro Carvalho Chehab
> > <mauro.chehab@linux.intel.com> wrote:  
> > >
> > > Hi,
> > >
> > > I'm facing a couple of issues when testing KUnit with the i915 driver.
> > >
> > > The DRM subsystem and the i915 driver has, for a long time, his own
> > > way to do unit tests, which seems to be added before KUnit.
> > >
> > > I'm now checking if it is worth start using KUnit at i915. So, I wrote
> > > a RFC with some patches adding support for the tests we have to be
> > > reported using Kernel TAP and KUnit.
> > >
> > > There are basically 3 groups of tests there:
> > >
> > > - mock tests - check i915 hardware-independent logic;
> > > - live tests - run some hardware-specific tests;
> > > - perf tests - check perf support - also hardware-dependent.
> > >
> > > As they depend on i915 driver, they run only on x86, with PCI
> > > stack enabled, but the mock tests run nicely via qemu.
> > >
> > > The live and perf tests require a real hardware. As we run them
> > > together with our CI, which, among other things, test module
> > > unload/reload and test loading i915 driver with different
> > > modprobe parameters, the KUnit tests should be able to run as
> > > a module.
> > >
> > > While testing KUnit, I noticed a couple of issues:
> > >
> > > 1. kunit.py parser is currently broken when used with modules
> > >
> > > the parser expects "TAP version xx" output, but this won't
> > > happen when loading the kunit test driver.
> > >
> > > Are there any plans or patches fixing this issue?    
> > 
> > Partially.
> > Note: we need a header to look for so we can strip prefixes (like timestamps).
> > 
> > But there is a patch in the works to add a TAP header for each
> > subtest, hopefully in time for 6.2.  
> 
> Good to know.
> 
> > This is to match the KTAP spec:
> > https://kernel.org/doc/html/latest/dev-tools/ktap.html  
> 
> I see.
> 
> > That should fix it so you can parse one suite's results at a time.
> > I'm pretty sure it won't fix the case where there's multiple suites
> > and/or you're trying to parse all test results at once via
> > 
> > $ find /sys/kernel/debug/kunit/ -type f | xargs cat |
> > ./tools/testing/kunit/kunit.py parse  
> 
> Could you point me to the changeset? perhaps I can write a followup
> patch addressing this case.
> 
> > I think that in-kernel code change + some more python changes could
> > make the above command work, but no one has actively started looking
> > at that just yet.
> > Hopefully we can pick this up and also get it done for 6.2 (unless I'm
> > underestimating how complicated this is).
> >   
> > >
> > > 2. current->mm is not initialized
> > >
> > > Some tests do mmap(). They need the mm user context to be initialized,
> > > but this is not happening right now.
> > >
> > > Are there a way to properly initialize it for KUnit?    
> > 
> > Right, this is a consequence of how early built-in KUnit tests are run
> > after boot.
> > I think for now, the answer is to make the test module-only.
> > 
> > I know David had some ideas here, but I can't speak to them.  
> 
> This is happening when test-i915 is built as module as well.
> 
> I suspect that the function which initializes it is mm_alloc() inside 
> kernel/fork.c:
> 
> 	struct mm_struct *mm_alloc(void)
> 	{
> 	        struct mm_struct *mm;
> 
> 	        mm = allocate_mm();
> 	        if (!mm)
> 	                return NULL;
> 
> 	        memset(mm, 0, sizeof(*mm));
> 	        return mm_init(mm, current, current_user_ns());
> 	}
> 
> As modprobing a test won't fork until all tests run, this never runs.
> 
> It seems that the normal usage is at fs/exec.c:
> 
> 	fs/exec.c:      bprm->mm = mm = mm_alloc();
> 
> but other places also call it:
> 
> 	arch/arm/mach-rpc/ecard.c:      struct mm_struct * mm = mm_alloc();
> 	drivers/dma-buf/dma-resv.c:     struct mm_struct *mm = mm_alloc();
> 	include/linux/sched/mm.h:extern struct mm_struct *mm_alloc(void);
> 	mm/debug_vm_pgtable.c:  args->mm = mm_alloc();
> 
> Probably the solution would be to call it inside kunit executor code,
> adding support for modules to use it.


Hmm... it is not that simple... I tried the enclosed patch, but it caused
another issue at the live/mman/mmap test:

<snip>
[  152.815543] test_i915: 0000:00:02.0: it is a i915 device.
[  152.816456]     # Subtest: i915 live selftests
[  152.816463]     1..1
[  152.816835] kunit_try_run_case: allocating user context
[  152.816978] CPU: 1 PID: 1139 Comm: kunit_try_catch Tainted: G                 N 6.1.0-rc2-drm-110e9bebcbcc+ #20
[  152.817063] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake Y LPDDR4x T4 Crb, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
[  152.817583] i915: Performing live_mman selftests with st_random_seed=0x11aaba4d st_timeout=500
[  152.817735] test_i915: Setting dangerous option KUnit live_mman - tainting kernel
[  152.817819] test_i915: Running live_mman on 0000:00:02.0
[  152.817899] i915: Running i915_gem_mman_live_selftests/igt_partial_tiling
[  153.346653] check_partial_mappings: timed out after tiling=0 stride=0
[  153.847696] check_partial_mappings: timed out after tiling=1 stride=262144
[  154.348615] check_partial_mappings: timed out after tiling=2 stride=262144
[  154.376677] i915: Running i915_gem_mman_live_selftests/igt_smoke_tiling
[  154.877686] igt_smoke_tiling: Completed 3465 trials
[  155.025764] i915: Running i915_gem_mman_live_selftests/igt_mmap_offset_exhaustion
[  155.050908] i915: Running i915_gem_mman_live_selftests/igt_mmap
[  155.052056] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  155.052080] #PF: supervisor instruction fetch in kernel mode
[  155.052095] #PF: error_code(0x0010) - not-present page
[  155.052110] PGD 0 P4D 0 
[  155.052121] Oops: 0010 [#1] PREEMPT SMP NOPTI
[  155.052135] CPU: 5 PID: 1139 Comm: kunit_try_catch Tainted: G     U           N 6.1.0-rc2-drm-110e9bebcbcc+ #20
[  155.052162] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake Y LPDDR4x T4 Crb, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
[  155.052191] RIP: 0010:0x0
[  155.052207] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[  155.052223] RSP: 0018:ffffc900019ebbe8 EFLAGS: 00010246
[  155.052238] RAX: 0000000000000000 RBX: 0000000000001000 RCX: 0000000000100000
[  155.052257] RDX: 0000000000001000 RSI: 0000000000000000 RDI: ffff8881111a6840
[  155.052275] RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
[  155.052292] R10: ffff8881049ad000 R11: 00000000ffffffff R12: 0000000000000002
[  155.052309] R13: ffff8881111a6840 R14: 0000000000100000 R15: 0000000000000000
[  155.052327] FS:  0000000000000000(0000) GS:ffff8883a3a80000(0000) knlGS:0000000000000000
[  155.052347] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  155.052361] CR2: ffffffffffffffd6 CR3: 000000011118c004 CR4: 0000000000770ee0
[  155.052379] PKRU: 55555554
[  155.052387] Call Trace:
[  155.052396]  <TASK>
[  155.052403]  get_unmapped_area+0x80/0x130
[  155.052422]  do_mmap+0xe5/0x530
[  155.052439]  vm_mmap_pgoff+0xab/0x150
[  155.052457]  igt_mmap_offset+0x133/0x1e0 [i915]
[  155.052875]  __igt_mmap+0xfe/0x680 [i915]
[  155.053233]  ? __i915_gem_object_create_user_ext+0x49c/0x550 [i915]
[  155.053614]  igt_mmap+0xd8/0x290 [i915]
[  155.054057]  ? __trace_bprintk+0x8c/0xa0
[  155.054080]  __i915_subtests.cold+0x53/0xd5 [i915]
[  155.054648]  ? __i915_nop_teardown+0x20/0x20 [i915]
[  155.055127]  ? __i915_live_setup+0x60/0x60 [i915]
[  155.055608]  ? singleton_release+0x40/0x40 [i915]
[  155.056060]  i915_gem_mman_live_selftests+0x4e/0x60 [i915]
[  155.056503]  run_pci_test.cold+0x4d/0x163 [test_i915]
[  155.056535]  ? kunit_try_catch_throw+0x20/0x20
[  155.056557]  live_mman+0x19/0x26 [test_i915]
[  155.056581]  kunit_try_run_case+0xf0/0x145
[  155.056607]  kunit_generic_run_threadfn_adapter+0x13/0x30
[  155.057715]  kthread+0xf2/0x120
[  155.058864]  ? kthread_complete_and_exit+0x20/0x20
[  155.060014]  ret_from_fork+0x1f/0x30
[  155.061108]  </TASK>
[  155.062174] Modules linked in: test_i915 x86_pkg_temp_thermal coretemp snd_hda_codec_hdmi mei_hdcp kvm_intel snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep kvm snd_hda_core mei_me irqbypass wmi_bmof snd_pcm i2c_i801 mei i2c_smbus intel_lpss_pci crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i915 prime_numbers drm_buddy drm_display_helper drm_kms_helper syscopyarea e1000e sysfillrect sysimgblt ptp fb_sys_fops pps_core ttm video wmi fuse
[  155.064354] CR2: 0000000000000000
[  155.065413] ---[ end trace 0000000000000000 ]---
[  155.074555] RIP: 0010:0x0
[  155.075437] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[  155.076313] RSP: 0018:ffffc900019ebbe8 EFLAGS: 00010246
[  155.077195] RAX: 0000000000000000 RBX: 0000000000001000 RCX: 0000000000100000
[  155.078124] RDX: 0000000000001000 RSI: 0000000000000000 RDI: ffff8881111a6840
[  155.079013] RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
[  155.079898] R10: ffff8881049ad000 R11: 00000000ffffffff R12: 0000000000000002
[  155.080785] R13: ffff8881111a6840 R14: 0000000000100000 R15: 0000000000000000
[  155.081668] FS:  0000000000000000(0000) GS:ffff8883a3a80000(0000) knlGS:0000000000000000
[  155.082565] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  155.083451] CR2: ffffffffffffffd6 CR3: 0000000110904006 CR4: 0000000000770ee0
[  155.084348] PKRU: 55555554
</snip>

It sounds that something else is needed to properly initialize the user
context.

Regards,
Mauro

---

[PATCH] kunit: allocate user context mm

Without that, tests envolving mmap won't work.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 90640a43cf62..809522e110c5 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -14,6 +14,7 @@
 #include <linux/moduleparam.h>
 #include <linux/panic.h>
 #include <linux/sched/debug.h>
+#include <linux/sched/mm.h>
 #include <linux/sched.h>
 
 #include "debugfs.h"
@@ -381,9 +382,23 @@ static void kunit_try_run_case(void *data)
 	struct kunit *test = ctx->test;
 	struct kunit_suite *suite = ctx->suite;
 	struct kunit_case *test_case = ctx->test_case;
+	struct mm_struct *mm = NULL;
 
 	current->kunit_test = test;
 
+	if (!current->mm) {
+		pr_info("%s: allocating user context\n", __func__);
+		mm = mm_alloc();
+		if (!mm) {
+			kunit_err(suite, KUNIT_SUBTEST_INDENT
+				"# failed to allocate mm user context");
+			return;
+		}
+		current->mm = mm;
+	} else {
+		pr_info("%s: using already-existing user context\n", __func__);
+	}
+
 	/*
 	 * kunit_run_case_internal may encounter a fatal error; if it does,
 	 * abort will be called, this thread will exit, and finally the parent
@@ -392,6 +407,11 @@ static void kunit_try_run_case(void *data)
 	kunit_run_case_internal(test, suite, test_case);
 	/* This line may never be reached. */
 	kunit_run_case_cleanup(test, suite);
+
+	if (mm) {
+		mmdrop(mm);
+		current->mm = NULL;
+	}
 }
 
 static void kunit_catch_run_case(void *data)

