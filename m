Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC3461922F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 08:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36AA10E700;
	Fri,  4 Nov 2022 07:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED8210E6FB;
 Fri,  4 Nov 2022 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667548204; x=1699084204;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eTD+tGuQax3QBxtm2BROZYTlsWeRUT3TqDcLLZMYNXM=;
 b=JKGFnI2Y3Mx03mTZ4Ljz1vpEdt7ndjFKBfIMW0IqurODIrBjvtOPCCtg
 8ED8qHMZ+JWP+iZL8gFmm0JHS/intQM21iQPkLNZSmL981XLZIfD9xQZb
 Hp/hrgsxsUwy6jUb5C0dSEF4gAGQ+oCmsVSDQkmlG9zobi7eF70c8WEjT
 dWZ7/kPWvReMO0ztL4425c9vUuN8XlzZNFSviUgpbaG6PT7DCgTS5t0Ri
 CGtpvPVBPbwROPMbiMjqtFjj0Y9wy25vR2jFdG3ublDDL85StvEj9HtAe
 BOIDDcyg7+asY0SP5kXcK1EChRh78yQBAK2QEbQwGqQ4O+UY7iNVfN1KZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="311644698"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="311644698"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 00:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724263715"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="724263715"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2022 00:50:02 -0700
Received: from maurocar-mobl2 (CCARTHY-mobl1.ger.corp.intel.com [10.252.31.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7546C580DBC;
 Fri,  4 Nov 2022 00:49:59 -0700 (PDT)
Date: Fri, 4 Nov 2022 08:49:55 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: KUnit issues - Was: [igt-dev] [PATCH RFC v2 8/8] drm/i915:
 check if current->mm is not NULL
Message-ID: <20221104084955.4e6e1093@maurocar-mobl2>
In-Reply-To: <CAGS_qxr1=PLFzM8bGjdowZwdOXMEPiJEnffPUGQvwdhYVJJNvA@mail.gmail.com>
References: <20221103162302.4ba62d72@maurocar-mobl2>
 <CAGS_qxr1=PLFzM8bGjdowZwdOXMEPiJEnffPUGQvwdhYVJJNvA@mail.gmail.com>
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

On Thu, 3 Nov 2022 15:43:26 -0700
Daniel Latypov <dlatypov@google.com> wrote:

> On Thu, Nov 3, 2022 at 8:23 AM Mauro Carvalho Chehab
> <mauro.chehab@linux.intel.com> wrote:
> >
> > Hi,
> >
> > I'm facing a couple of issues when testing KUnit with the i915 driver.
> >
> > The DRM subsystem and the i915 driver has, for a long time, his own
> > way to do unit tests, which seems to be added before KUnit.
> >
> > I'm now checking if it is worth start using KUnit at i915. So, I wrote
> > a RFC with some patches adding support for the tests we have to be
> > reported using Kernel TAP and KUnit.
> >
> > There are basically 3 groups of tests there:
> >
> > - mock tests - check i915 hardware-independent logic;
> > - live tests - run some hardware-specific tests;
> > - perf tests - check perf support - also hardware-dependent.
> >
> > As they depend on i915 driver, they run only on x86, with PCI
> > stack enabled, but the mock tests run nicely via qemu.
> >
> > The live and perf tests require a real hardware. As we run them
> > together with our CI, which, among other things, test module
> > unload/reload and test loading i915 driver with different
> > modprobe parameters, the KUnit tests should be able to run as
> > a module.
> >
> > While testing KUnit, I noticed a couple of issues:
> >
> > 1. kunit.py parser is currently broken when used with modules
> >
> > the parser expects "TAP version xx" output, but this won't
> > happen when loading the kunit test driver.
> >
> > Are there any plans or patches fixing this issue?  
> 
> Partially.
> Note: we need a header to look for so we can strip prefixes (like timestamps).
> 
> But there is a patch in the works to add a TAP header for each
> subtest, hopefully in time for 6.2.

Good to know.

> This is to match the KTAP spec:
> https://kernel.org/doc/html/latest/dev-tools/ktap.html

I see.

> That should fix it so you can parse one suite's results at a time.
> I'm pretty sure it won't fix the case where there's multiple suites
> and/or you're trying to parse all test results at once via
> 
> $ find /sys/kernel/debug/kunit/ -type f | xargs cat |
> ./tools/testing/kunit/kunit.py parse

Could you point me to the changeset? perhaps I can write a followup
patch addressing this case.

> I think that in-kernel code change + some more python changes could
> make the above command work, but no one has actively started looking
> at that just yet.
> Hopefully we can pick this up and also get it done for 6.2 (unless I'm
> underestimating how complicated this is).
> 
> >
> > 2. current->mm is not initialized
> >
> > Some tests do mmap(). They need the mm user context to be initialized,
> > but this is not happening right now.
> >
> > Are there a way to properly initialize it for KUnit?  
> 
> Right, this is a consequence of how early built-in KUnit tests are run
> after boot.
> I think for now, the answer is to make the test module-only.
> 
> I know David had some ideas here, but I can't speak to them.

This is happening when test-i915 is built as module as well.

I suspect that the function which initializes it is mm_alloc() inside 
kernel/fork.c:

	struct mm_struct *mm_alloc(void)
	{
	        struct mm_struct *mm;

	        mm = allocate_mm();
	        if (!mm)
	                return NULL;

	        memset(mm, 0, sizeof(*mm));
	        return mm_init(mm, current, current_user_ns());
	}

As modprobing a test won't fork until all tests run, this never runs.

It seems that the normal usage is at fs/exec.c:

	fs/exec.c:      bprm->mm = mm = mm_alloc();

but other places also call it:

	arch/arm/mach-rpc/ecard.c:      struct mm_struct * mm = mm_alloc();
	drivers/dma-buf/dma-resv.c:     struct mm_struct *mm = mm_alloc();
	include/linux/sched/mm.h:extern struct mm_struct *mm_alloc(void);
	mm/debug_vm_pgtable.c:  args->mm = mm_alloc();

Probably the solution would be to call it inside kunit executor code,
adding support for modules to use it.

> > 3. there's no test filters for modules
> >
> > In order to be able to do proper CI automation, it is needed to
> > be able to control what tests will run or not. That's specially
> > interesting at development time where some tests may not apply
> > or not run properly on new hardware.
> >
> > Are there any plans to add support for it at kunit_test_suites()
> > when the driver is built as module? Ideally, the best would be to
> > export a per-module filter_glob parameter on such cases.  
> 
> I think this is a good idea and is doable. (I think I said as much on
> the other thread).
> 
> The thinking before was that people would make group tests together in modules.
> But if you want to share a single module for many tests, this becomes
> more useful.

At least for this RFC, I opted to place everything we have already on
a single module. 

Perhaps I could create, instead, 3 separate modules. This way, I would gain
a "third level" and a poor man's way of filtering what test type
will run (mock, live or perf).

Yet, we will still need to be able to filter the unit tests, as this
is where all the fun happens.

> This has some potential merge conflicts w/ other pending work.
> I was also prototyping the ability to tell KUnit "run tests #2 - #5",
> so that also touches the filtering code very heavily.

Are you planning to allow this to support such feature also on modules?

> (The goal there is to have kunit.py able to shard up tests and boot
> multiple kernels concurrently.)
> 
> >
> > 4. there are actually 3 levels of tests on i915:
> >         - Level 1: mock, live, perf
> >         - Level 2: test group (mmap, fences, ...)
> >         - Level 3: unit tests
> >
> > Currently, KUnit seems to have just two levels (test suite and tests).
> > Are there a way to add test groups there?  
> 
> Parameterized tests are the closest we have to a third-level of tests.
> But other than that, the answer is no.
> 
> I'd need to get more familiar with the existing tests, but I'm pretty
> sure parameters won't work for you.

Our current approach with selftests is that each test can be disabled.
You can see how it currently works by taking a look at the __run_selftests
logic (level 2 on the above hierarchy) inside
drivers/gpu/drm/i915/selftests/i915_selftest.c:


	static int __run_selftests(const char *name,
				   struct selftest *st,
				   unsigned int count,
				   void *data)
	{
...
		/* Tests are listed in order in i915_*_selftests.h */
		for (; count--; st++) {
			if (!st->enabled)
				continue;
...
		pr_info(DRIVER_NAME ": Running %s\n", st->name);
		if (data)
			err = st->live(data);
		else
			err = st->mock();

The same also happens at subtests (level 3):

	int __i915_subtests(const char *caller,
			    int (*setup)(void *data),
			    int (*teardown)(int err, void *data),
			    const struct i915_subtest *st,
			    unsigned int count,
			    void *data)
	{
...
		if (!apply_subtest_filter(caller, st->name))
			continue;
...
		pr_info(DRIVER_NAME ": Running %s/%s\n", caller, st->name);
		GEM_TRACE("Running %s/%s\n", caller, st->name);

		err = teardown(st->func(data), data);
 
> And I don't know if this will get done.
> 
> Note: the kunit_parser.py code should be able to handle arbitrary
> levels of tests in the output.
> This restriction is purely in the in-kernel code.
> 
> I had brought up the idea of more layers of tests before.
> It would also be useful for
> a) sharing expensive setup between multiple tests
> b) allowing more granular scope for cleanups (kunit_kmalloc and others)
> c) more flexibility in dynamically generating subtests than
> parameterized testing

Yes, it makes sense to me. 

> There's some precedent in other unit testing frameworks, for example:
> https://pkg.go.dev/testing#T.Run

Regards,
Mauro
