Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B96DA5DE1E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6640C10E2CF;
	Wed, 12 Mar 2025 13:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QOVD6/7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA8A10E2CF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rfqf5Dzqv29IeJ3ydojv3QjTFcNf0867LbCgqqv/3BE=; b=QOVD6/7VPR3Ne1TnXW1HKzf9p+
 vFy8mzirmJsjQFOE35eOUvZPAG2FIRDwX0Z/rTVOWHn+n4z4moHvo8i985IkAvrSvAKsJtV48qzyK
 k2S7YeLuJ5neNqop5OYaJSfq79lIUPMROzcpqrTKUvEyjIAQBGww4i1x0moQpmgEw+WRWXoFsrmCz
 Rggh20DaPvpqq0B7U1MtR1XCdCaVtD4ikHV1lewqDQi2d0WONuSalDO2UHlfCCyFSTz+Keai+3Z1E
 EQzZwq+HtkPjG3P67YNAzovXSddhLhKeDw+QQDBA1Fh3c0/qY6pTm18Ys068F4D0qG1r3K60I2e27
 2mL6twMw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tsMFN-007dU3-4M; Wed, 12 Mar 2025 14:35:51 +0100
Message-ID: <750b4501-fd2b-45e9-b563-1e6440216129@igalia.com>
Date: Wed, 12 Mar 2025 13:35:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] DRM scheduler kunit tests
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
 <d92d3b58fa34f4beb957feeb372f9e18237d1c1c.camel@mailbox.org>
 <0f0102cb-8036-4fc6-898e-cd4eab4edfe0@igalia.com>
 <3ce2bdb2cacd9d30bd5de282e227721d838822b8.camel@mailbox.org>
 <f3e52167-eab5-44a7-a769-c861c7f46a8d@igalia.com>
Content-Language: en-GB
In-Reply-To: <f3e52167-eab5-44a7-a769-c861c7f46a8d@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 12/03/2025 13:27, Tvrtko Ursulin wrote:
> 
> On 12/03/2025 12:35, Philipp Stanner wrote:
>> On Wed, 2025-03-12 at 10:50 +0000, Tvrtko Ursulin wrote:
>>>
>>> On 12/03/2025 10:39, Philipp Stanner wrote:
>>>> On Tue, 2025-03-11 at 09:23 +0000, Tvrtko Ursulin wrote:
>>>>> There has repeatedly been quite a bit of apprehension when any
>>>>> change
>>>>> to the DRM
>>>>> scheduler is proposed, with two main reasons being code base is
>>>>> considered
>>>>> fragile, not well understood and not very well documented, and
>>>>> secondly the lack
>>>>> of systematic testing outside the vendor specific tests suites
>>>>> and/or
>>>>> test
>>>>> farms.
>>>>>
>>>>> This series is an attempt to dislodge this status quo by adding
>>>>> some
>>>>> unit tests
>>>>> using the kunit framework.
>>>>>
>>>>> General approach is that there is a mock "hardware" backend which
>>>>> can
>>>>> be
>>>>> controlled from tests, which in turn allows exercising various
>>>>> scheduler code
>>>>> paths.
>>>>>
>>>>> Only some simple basic tests get added in the series and
>>>>> hopefully it
>>>>> is easy to
>>>>> understand what tests are doing.
>>>>>
>>>>> An obligatory "screenshot" for reference:
>>>>>
>>>>> [14:09:05] ============ drm_sched_basic_tests (3 subtests)
>>>>> ============
>>>>> [14:09:06] [PASSED] drm_sched_basic_submit
>>>>> [14:09:06] ================== drm_sched_basic_test
>>>>> ===================
>>>>> [14:09:06] [PASSED] A queue of jobs in a single entity
>>>>> [14:09:06] [PASSED] A chain of dependent jobs across multiple
>>>>> entities
>>>>> [14:09:06] [PASSED] Multiple independent job queues
>>>>> [14:09:06] [PASSED] Multiple inter-dependent job queues
>>>>> [14:09:07] ============== [PASSED] drm_sched_basic_test
>>>>> ===============
>>>>> [14:09:07] [PASSED] drm_sched_basic_entity_cleanup
>>>>> [14:09:07] ============== [PASSED] drm_sched_basic_tests
>>>>> ==============
>>>>> [14:09:07] ======== drm_sched_basic_timeout_tests (1 subtest)
>>>>> =========
>>>>> [14:09:08] [PASSED] drm_sched_basic_timeout
>>>>> [14:09:08] ========== [PASSED] drm_sched_basic_timeout_tests
>>>>> ==========
>>>>> [14:09:08] ======= drm_sched_basic_priority_tests (2 subtests)
>>>>> ========
>>>>> [14:09:10] [PASSED] drm_sched_priorities
>>>>> [14:09:10] [PASSED] drm_sched_change_priority
>>>>> [14:09:10] ========= [PASSED] drm_sched_basic_priority_tests
>>>>> ==========
>>>>> [14:09:10] ====== drm_sched_basic_modify_sched_tests (1 subtest)
>>>>> ======
>>>>> [14:09:11] [PASSED] drm_sched_test_modify_sched
>>>>> [14:09:11] ======= [PASSED] drm_sched_basic_modify_sched_tests
>>>>> ========
>>>>> [14:09:11] ======== drm_sched_basic_credits_tests (1 subtest)
>>>>> =========
>>>>> [14:09:12] [PASSED] drm_sched_test_credits
>>>>> [14:09:12] ========== [PASSED] drm_sched_basic_credits_tests
>>>>> ==========
>>>>> [14:09:12]
>>>>> ============================================================
>>>>> [14:09:12] Testing complete. Ran 11 tests: passed: 11
>>>>> [14:09:13] Elapsed time: 13.539s total, 0.001s configuring,
>>>>> 3.004s
>>>>> building, 10.462s running
>>>>>
>>>>> v2:
>>>>>    * Parameterize a bunch of similar tests.
>>>>>    * Improve test commentary.
>>>>>    * Rename TDR test to timeout. (Christian)
>>>>>    * Improve quality and consistency of naming. (Philipp)
>>>>>
>>>>> RFC v2 -> series v1:
>>>>>    * Rebased for drm_sched_init changes.
>>>>>    * Fixed modular build.
>>>>>    * Added some comments.
>>>>>    * Filename renames. (Philipp)
>>>>>
>>>>> v2:
>>>>>    * Dealt with a bunch of checkpatch warnings.
>>>>>
>>>>> v3:
>>>>>    * Some mock API renames, kerneldoc grammar fixes and
>>>>> indentation
>>>>> fixes.
>>>>>
>>>>> v4:
>>>>>    * Fix use after free caused by relying on scheduler fence for
>>>>> querying status.
>>>>>    * Kerneldoc fixes.
>>>>>
>>>>> v5:
>>>>>    * Cleanup in-flight jobs on scheduler shutdown.
>>>>>    * Change hang_limit to 1.
>>>>>
>>>>> v6:
>>>>>    * Use KUNIT_ASSERT_TRUE/FALSE.
>>>>>    * Fixed patch titles.
>>>>>    * Added credit_limit test.
>>>>
>>>> Please don't add new tests in a settled series. Doing so may seem
>>>> efficient, but causes another round of review and can cause you and
>>>> me
>>>> trouble when trying to find the cause of issues such as the one
>>>> mentioned below:
>>>>
>>>>>    * Added CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL.
>>>>>
>>>>> v7:
>>>>>    * v6 omitted to send the first patch by mistake.
>>>>
>>>> I either see a new NULL ptr deref added through the new test or an
>>>> old
>>>> one that has slipped us. My test setup is unchanged.
>>>
>>> All I see in what you pasted are kunit_test_null_dereference
>>> "crashes".
>>> Ie. expected ones from having enabled CONFIG_KUNIT_FAULT_TEST.
>>
>> Allright, didn't know about that. Help me out here quickly, so would
>> this option lead to a real fault on a real CPU? Or is it "simulated"?
> 
> AFAIU it is real faults where kunit test framework is testing itself 
> whether it can catch them.
> 
>>> Is there something more that you did not paste?
>>
>> No, that was all.
>>
>> I tried it again without the KUNIT_FAULT option and activated
>> aspirational mode. (on top of current drm-misc-next, eff0347e7c22).
>>
>> There I see a UAF. Do you have an idea what that might be? I would only
>> expect memory leaks and the test assertions failing.
> 
> It is expected all hell to break loose in aspirational mode. There the 
> mock scheduler shutdown relies solely on drm_sched_fini. So all tests 
> which do not fully idle the mock scheduler themselves, whether implicity 
> or explicitly, will explode in various ways.

To clarify I made it like that because that is what I understood was 
your vision for drm_sched_fini. That it would be able to clean 
everything up etc.

If you meant something different we need to adjust it. Although it could 
be done later as well.

Regards,

Tvrtko

>> [    3.976637] Demotion targets for Node 0: null
>> [    3.977265] kmemleak: Kernel memory leak detector initialized (mem 
>> pool available: 11277)
>> [    3.977274] kmemleak: Automatic memory scanning thread started
>> [    3.978604] PM:   Magic number: 1:529:430
>> [    3.978914] printk: legacy console [netcon0] enabled
>> [    3.979247] netconsole: network logging started
>> [    3.979839] cfg80211: Loading compiled-in X.509 certificates for 
>> regulatory database
>> [    3.980811] kworker/u72:1 (156) used greatest stack depth: 28552 
>> bytes left
>> [    3.981632] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>> [    3.982437] Loaded X.509 cert 'wens: 
>> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
>> [    3.983110] platform regulatory.0: Direct firmware load for 
>> regulatory.db failed with error -2
>> [    3.983578] KTAP version 1
>> [    3.983767] cfg80211: failed to load regulatory.db
>> [    3.983988] 1..5
>> [    3.984976]     KTAP version 1
>> [    3.985299]     # Subtest: drm_sched_basic_tests
>> [    3.985681]     # module: drm_sched_tests
>> [    3.985683]     1..3
>> [    4.319827] input: ImExPS/2 Generic Explorer Mouse as /devices/ 
>> platform/i8042/serio1/input/input3
>> [    4.495862]     ok 1 drm_sched_basic_submit
>> [    4.495879]         KTAP version 1
>> [    4.496468]         # Subtest: drm_sched_basic_test
>> [    4.598388]         ok 1 A queue of jobs in a single entity
>> [    4.700730]         ok 2 A chain of dependent jobs across multiple 
>> entities
>> [    4.803439]         ok 3 Multiple independent job queues
>> [    4.905560]         ok 4 Multiple inter-dependent job queues
>> [    4.906029]     # drm_sched_basic_test: pass:4 fail:0 skip:0 total:4
>> [    4.906500]     ok 2 drm_sched_basic_test
>> [    4.959366]     # drm_sched_basic_entity_cleanup: ASSERTION FAILED 
>> at drivers/gpu/drm/scheduler/tests/mock_scheduler.c:294
>> [    4.959366]     Expected list_empty(&sched->job_list) to be true, 
>> but is false
>> [    4.961263]     # drm_sched_basic_entity_cleanup: test aborted 
>> during cleanup. continuing without cleaning up
>> [    4.961997]     not ok 3 drm_sched_basic_entity_cleanup
>> [    4.961999] # drm_sched_basic_tests: pass:2 fail:1 skip:0 total:3
>> [    4.962384] # Totals: pass:5 fail:1 skip:0 total:6
>> [    4.962823] not ok 1 drm_sched_basic_tests
>> [    4.963465]     KTAP version 1
>> [    4.963691]     # Subtest: drm_sched_basic_timeout_tests
>> [    4.964065]     # module: drm_sched_tests
>> [    4.964067]     1..1
>> [    6.503265]     # drm_sched_basic_timeout: ASSERTION FAILED at 
>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c:294
>> [    6.503265]     Expected list_empty(&sched->job_list) to be true, 
>> but is false
>> [    6.504778]     # drm_sched_basic_timeout: test aborted during 
>> cleanup. continuing without cleaning up
>> [    6.505457]     not ok 1 drm_sched_basic_timeout
>> [    6.505460] not ok 2 drm_sched_basic_timeout_tests
>> [    6.506128]     KTAP version 1
>> [    6.506360]     # Subtest: drm_sched_basic_priority_tests
>> [    6.506751]     # module: drm_sched_tests
>> [    6.506753]     1..2
>> [    6.609082]     ok 1 drm_sched_priorities
>> [    7.614297]     ok 2 drm_sched_change_priority
>> [    7.614723] # drm_sched_basic_priority_tests: pass:2 fail:0 skip:0 
>> total:2
>> [    7.615130] # Totals: pass:2 fail:0 skip:0 total:2
>> [    7.615667] ok 3 drm_sched_basic_priority_tests
>> [    7.616344]     KTAP version 1
>> [    7.616580]     # Subtest: drm_sched_basic_modify_sched_tests
>> [    7.617039]     # module: drm_sched_tests
>> [    7.617042]     1..1
>> [    7.926594]     # drm_sched_test_modify_sched: ASSERTION FAILED at 
>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c:294
>> [    7.926594]     Expected list_empty(&sched->job_list) to be true, 
>> but is false
>> [    7.928533] 
>> ==================================================================
>> [    7.929065] BUG: KASAN: slab-use-after-free in 
>> timerqueue_add+0x24e/0x320
>> [    7.929596] Read of size 8 at addr ffff8881092ec8e8 by task 
>> swapper/5/0
>> [    7.930092]
>> [    7.930251] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Tainted: 
>> G                 N 6.14.0-rc4-00476-ge1aa9011309e #6
>> [    7.930256] Tainted: [N]=TEST
>> [    7.930257] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
>> BIOS 1.16.3-2.fc40 04/01/2014
>> [    7.930258] Call Trace:
>> [    7.930260]  <IRQ>
>> [    7.930261]  dump_stack_lvl+0x53/0x70
>> [    7.930265]  print_report+0xce/0x680
>> [    7.930269]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>> [    7.930271]  ? __pfx_calc_global_load_tick+0x10/0x10
>> [    7.930274]  ? timerqueue_add+0x24e/0x320
>> [    7.930276]  kasan_report+0xe2/0x120
>> [    7.930278]  ? timerqueue_add+0x24e/0x320
>> [    7.930280]  timerqueue_add+0x24e/0x320
>> [    7.930281]  __hrtimer_run_queues+0x358/0x6f0
>> [    7.930284]  ? __pfx___hrtimer_run_queues+0x10/0x10
>> [    7.930286]  ? ktime_get_update_offsets_now+0x7c/0x2c0
>> [    7.930288]  hrtimer_interrupt+0x2cd/0x7e0
>> [    7.930290]  __sysvec_apic_timer_interrupt+0x88/0x260
>> [    7.930293]  sysvec_apic_timer_interrupt+0x67/0x80
>> [    7.930295]  </IRQ>
>> [    7.930296]  <TASK>
>> [    7.930296]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
>> [    7.930299] RIP: 0010:default_idle+0xf/0x20
>> [    7.930302] Code: 4c 01 c7 4c 29 c2 e9 72 ff ff ff 90 90 90 90 90 
>> 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d b3 d6 06 
>> 00 fb f4 <fa> c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 
>> 90 90
>> [    7.930304] RSP: 0000:ffff888100b8fe70 EFLAGS: 00000206
>> [    7.930306] RAX: ffff888a8ec80000 RBX: 0000000000000005 RCX: 
>> ffffffffbb3b7c41
>> [    7.930308] RDX: ffffed1151d96a83 RSI: 0000000000000004 RDI: 
>> 0000000000036334
>> [    7.930309] RBP: ffffed1020161d58 R08: 0000000000000001 R09: 
>> ffffed1151d96a82
>> [    7.930309] R10: ffff888a8ecb5413 R11: 0000000000001400 R12: 
>> ffff888100b0eac0
>> [    7.930310] R13: ffffffffbc7f36d0 R14: 1ffff11020171fd2 R15: 
>> 0000000000000000
>> [    7.930312]  ? ct_kernel_exit.constprop.0+0xa1/0xc0
>> [    7.930314]  default_idle_call+0x3a/0x60
>> [    7.930316]  do_idle+0x2f2/0x3b0
>> [    7.930318]  ? __pfx_do_idle+0x10/0x10
>> [    7.930320]  ? __switch_to+0x5cd/0xe30
>> [    7.930323]  cpu_startup_entry+0x4f/0x60
>> [    7.930324]  start_secondary+0x1b7/0x210
>> [    7.930326]  common_startup_64+0x12c/0x138
>> [    7.930328]  </TASK>
>> [    7.930329]
>> [    7.931848]     not ok 1 drm_sched_test_modify_sched
>> [    7.932019] Allocated by task 187:
>> [    7.932285] not ok 4 drm_sched_basic_modify_sched_tests
>> [    7.932486]  kasan_save_stack+0x33/0x60
>> [    7.932835]     KTAP version 1
>> [    7.933153]  kasan_save_track+0x14/0x30
>> [    7.933156]  __kasan_kmalloc+0x8f/0xa0
>> [    7.933652]     # Subtest: drm_sched_basic_credits_tests
>> [    7.934095]  __kmalloc_noprof+0x18a/0x440
>> [    7.934494]     # module: drm_sched_tests
>> [    7.934817]  kunit_kmalloc_array+0x1b/0x50
>> [    7.935201]     1..1
>> [    7.935589]  drm_mock_sched_job_new+0x8f/0x400
>> [    7.935592]  drm_sched_test_modify_sched+0x1cd/0x490
>> [    7.950666]  kunit_try_run_case+0x1ae/0x490
>> [    7.950977]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
>> [    7.951400]  kthread+0x30f/0x620
>> [    7.951656]  ret_from_fork+0x2f/0x70
>> [    7.951936]  ret_from_fork_asm+0x1a/0x30
>> [    7.952250]
>> [    7.952373] Freed by task 192:
>> [    7.952605]  kasan_save_stack+0x33/0x60
>> [    7.952884]  kasan_save_track+0x14/0x30
>> [    7.953169]  kasan_save_free_info+0x3b/0x60
>> [    7.953495]  __kasan_slab_free+0x37/0x50
>> [    7.953797]  kfree+0x12f/0x350
>> [    7.954035]  kunit_remove_resource+0x130/0x1f0
>> [    7.954379]  kunit_cleanup+0x6e/0x110
>> [    7.954656]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
>> [    7.955044]  kthread+0x30f/0x620
>> [    7.955286]  ret_from_fork+0x2f/0x70
>> [    7.955557]  ret_from_fork_asm+0x1a/0x30
>> [    7.955844]
>> [    7.955956] The buggy address belongs to the object at 
>> ffff8881092ec800
>> [    7.955956]  which belongs to the cache kmalloc-512 of size 512
>> [    7.956883] The buggy address is located 232 bytes inside of
>> [    7.956883]  freed 512-byte region [ffff8881092ec800, 
>> ffff8881092eca00)
>> [    7.957790]
>> [    7.957904] The buggy address belongs to the physical page:
>> [    7.958324] page: refcount:0 mapcount:0 mapping:0000000000000000 
>> index:0x0 pfn:0x1092e8
>> [    7.958925] head: order:3 mapcount:0 entire_mapcount:0 
>> nr_pages_mapped:0 pincount:0
>> [    7.959527] flags: 0x200000000000040(head|node=0|zone=2)
>> [    7.959926] page_type: f5(slab)
>> [    7.960163] raw: 0200000000000040 ffff888100042c80 dead000000000122 
>> 0000000000000000
>> [    7.960743] raw: 0000000000000000 0000000080200020 00000000f5000000 
>> 0000000000000000
>> [    7.961304] head: 0200000000000040 ffff888100042c80 
>> dead000000000122 0000000000000000
>> [    7.961880] head: 0000000000000000 0000000080200020 
>> 00000000f5000000 0000000000000000
>> [    7.962460] head: 0200000000000003 ffffea000424ba01 
>> ffffffffffffffff 0000000000000000
>> [    7.963025] head: 0000000000000008 0000000000000000 
>> 00000000ffffffff 0000000000000000
>> [    7.963602] page dumped because: kasan: bad access detected
>> [    7.964001]
>> [    7.964113] Memory state around the buggy address:
>> [    7.964481]  ffff8881092ec780: fc fc fc fc fc fc fc fc fc fc fc fc 
>> fc fc fc fc
>> [    7.965007]  ffff8881092ec800: fa fb fb fb fb fb fb fb fb fb fb fb 
>> fb fb fb fb
>> [    7.965576] >ffff8881092ec880: fb fb fb fb fb fb fb fb fb fb fb fb 
>> fb fb fb fb
>> [    
>> 7.966120]                                                           ^
>> [    7.966625]  ffff8881092ec900: fb fb fb fb fb fb fb fb fb fb fb fb 
>> fb fb fb fb
>> [    7.967199]  ffff8881092ec980: fb fb fb fb fb fb fb fb fb fb fb fb 
>> fb fb fb fb
>> [    7.967734] 
>> ==================================================================
>> [    7.968267] Disabling lock debugging due to kernel taint
>> [    8.999147]     # drm_sched_test_credits: ASSERTION FAILED at 
>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c:295
>> [    8.999147]     Expected list_empty(&sched->base.pending_list) to 
>> be true, but is false
>> [    9.001031]     not ok 1 drm_sched_test_credits
>> [    9.001034] not ok 5 drm_sched_basic_credits_tests
>>
>>
>>
>>>
>>>> On which commit do you apply and test this series? Tell me, then I
>>>> test again.
>>>
>>> Depending on the setup, these three:
>>>
>>> commit 413ae464b8021542ad90cb1fbb15f8efc5050a5d
>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>> Date:   Mon Mar 3 16:41:48 2025 +0100
>>>
>>>       drm-tip: 2025y-03m-03d-15h-40m-53s UTC integration manifest
>>>
>>> commit 5bcb67a2a4c61034f5a25c024631c5fbf351ee8d
>>> Author: Matt Coster <matt.coster@imgtec.com>
>>> Date:   Wed Feb 26 10:01:09 2025 +0000
>>>
>>>       drm-tip: 2025y-02m-26d-09h-59m-48s UTC integration manifest
>>>
>>> commit 777e1850811f9864aa8b55940634d3da19712bf7
>>> Author: Imre Deak <imre.deak@intel.com>
>>> Date:   Tue Mar 11 11:31:04 2025 +0200
>>>
>>>       drm-tip: 2025y-03m-11d-09h-30m-13s UTC integration manifest
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> [    3.902457] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>>>> [    3.903376] Loaded X.509 cert 'wens:
>>>> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
>>>> [    3.904064] platform regulatory.0: Direct firmware load for
>>>> regulatory.db failed with error -2
>>>> [    3.904673] cfg80211: failed to load regulatory.db
>>>> [    3.905037] ALSA device list:
>>>> [    3.905376]   No soundcards found.
>>>> [    3.905631] KTAP version 1
>>>> [    3.905834] 1..17
>>>> [    3.906732]     KTAP version 1
>>>> [    3.906999]     # Subtest: kunit_executor_test
>>>> [    3.907335]     # module: kunit
>>>> [    3.907337]     1..8
>>>> [    3.908476]     ok 1 parse_filter_test
>>>> [    3.909064]     ok 2 filter_suites_test
>>>> [    3.909801]     ok 3 filter_suites_test_glob_test
>>>> [    3.910678]     ok 4 filter_suites_to_empty_test
>>>> [    3.911621]     ok 5 parse_filter_attr_test
>>>> [    3.912641]     ok 6 filter_attr_test
>>>> [    3.913511]     ok 7 filter_attr_empty_test
>>>> [    3.914081]     ok 8 filter_attr_skip_test
>>>> [    3.914400] # kunit_executor_test: pass:8 fail:0 skip:0 total:8
>>>> [    3.914685] # Totals: pass:8 fail:0 skip:0 total:8
>>>> [    3.915121] ok 1 kunit_executor_test
>>>> [    3.915736]     KTAP version 1
>>>> [    3.915949]     # Subtest: kunit-try-catch-test
>>>> [    3.916314]     # module: kunit_test
>>>> [    3.916315]     1..2
>>>> [    3.917655]     ok 1
>>>> kunit_test_try_catch_successful_try_no_catch
>>>> [    3.917979]     ok 2
>>>> kunit_test_try_catch_unsuccessful_try_does_catch
>>>> [    3.918630] # kunit-try-catch-test: pass:2 fail:0 skip:0 total:2
>>>> [    3.919118] # Totals: pass:2 fail:0 skip:0 total:2
>>>> [    3.919578] ok 2 kunit-try-catch-test
>>>> [    3.920248]     KTAP version 1
>>>> [    3.920473]     # Subtest: kunit-resource-test
>>>> [    3.920796]     # module: kunit_test
>>>> [    3.920797]     1..12
>>>> [    3.921565]     ok 1 kunit_resource_test_init_resources
>>>> [    3.921793]     ok 2 kunit_resource_test_alloc_resource
>>>> [    3.922449]     ok 3 kunit_resource_test_destroy_resource
>>>> [    3.923013]     ok 4 kunit_resource_test_remove_resource
>>>> [    3.924438]     ok 5 kunit_resource_test_cleanup_resources
>>>> [    3.925834]     ok 6 kunit_resource_test_proper_free_ordering
>>>> [    3.926700]     ok 7 kunit_resource_test_static
>>>> [    3.927588]     ok 8 kunit_resource_test_named
>>>> [    3.928244]     ok 9 kunit_resource_test_action
>>>> [    3.928774]     ok 10 kunit_resource_test_remove_action
>>>> [    3.929309]     ok 11 kunit_resource_test_release_action
>>>> [    3.929826] action_order_2
>>>> [    3.930325] action_order_2
>>>> [    3.930521] action_order_1
>>>> [    3.931007]     ok 12 kunit_resource_test_action_ordering
>>>> [    3.931308] # kunit-resource-test: pass:12 fail:0 skip:0
>>>> total:12
>>>> [    3.931702] # Totals: pass:12 fail:0 skip:0 total:12
>>>> [    3.932183] ok 3 kunit-resource-test
>>>> [    3.932809]     KTAP version 1
>>>> [    3.933040]     # Subtest: kunit-log-test
>>>> [    3.933367]     # module: kunit_test
>>>> [    3.933368]     1..2
>>>> [    3.934030] put this in log.
>>>> [    3.934033] this too.
>>>> [    3.934305] add to suite log.
>>>> [    3.934500] along with this.
>>>> [    3.934982]     ok 1 kunit_log_test
>>>> [    3.935405]     # kunit_log_newline_test: Add newline
>>>> [    3.936164]     ok 2 kunit_log_newline_test # SKIP only useful
>>>> when debugfs is enabled
>>>> [    3.936166] # kunit-log-test: pass:1 fail:0 skip:1 total:2
>>>> [    3.936752] # Totals: pass:1 fail:0 skip:1 total:2
>>>> [    3.937197] ok 4 kunit-log-test
>>>> [    3.937776]     KTAP version 1
>>>> [    3.938004]     # Subtest: kunit_status
>>>> [    3.938324]     # module: kunit_test
>>>> [    3.938325]     1..2
>>>> [    3.938921]     ok 1 kunit_status_set_failure_test
>>>> [    3.939049]     ok 2 kunit_status_mark_skipped_test
>>>> [    3.939445] # kunit_status: pass:2 fail:0 skip:0 total:2
>>>> [    3.939816] # Totals: pass:2 fail:0 skip:0 total:2
>>>> [    3.940436] ok 5 kunit_status
>>>> [    3.941142]     KTAP version 1
>>>> [    3.941508]     # Subtest: kunit_current
>>>> [    3.941793]     # module: kunit_test
>>>> [    3.941794]     1..2
>>>> [    3.942526]     ok 1 kunit_current_test
>>>> [    3.942596]     # fake test: lib/kunit/kunit-test.c:722: This
>>>> should make `fake` test fail.
>>>> [    3.943302]     ok 2 kunit_current_fail_test
>>>> [    3.943908] # kunit_current: pass:2 fail:0 skip:0 total:2
>>>> [    3.944271] # Totals: pass:2 fail:0 skip:0 total:2
>>>> [    3.944661] ok 6 kunit_current
>>>> [    3.945285]     KTAP version 1
>>>> [    3.945511]     # Subtest: kunit_device
>>>> [    3.945789]     # module: kunit_test
>>>> [    3.945790]     1..3
>>>> [    3.946905]     ok 1 kunit_device_test
>>>> [    3.947420]     ok 2 kunit_device_cleanup_test
>>>> [    3.948621]     ok 3 kunit_device_driver_test
>>>> [    3.948972] # kunit_device: pass:3 fail:0 skip:0 total:3
>>>> [    3.949349] # Totals: pass:3 fail:0 skip:0 total:3
>>>> [    3.949760] ok 7 kunit_device
>>>> [    3.950395]     KTAP version 1
>>>> [    3.950617]     # Subtest: kunit_fault
>>>> [    3.950889]     # module: kunit_test
>>>> [    3.950890]     1..1
>>>> [    3.951773] Oops: general protection fault, probably for non-
>>>> canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
>>>> PTI
>>>> [    3.952672] KASAN: null-ptr-deref in range [0x0000000000000000-
>>>> 0x0000000000000007]
>>>> [    3.953239] CPU: 2 UID: 0 PID: 225 Comm: kunit_try_catch
>>>> Tainted: G                 N 6.14.0-rc4-00388-g712b7c2f4d5d #21
>>>> [    3.954000] Tainted: [N]=TEST
>>>> [    3.954245] Hardware name: QEMU Standard PC (i440FX + PIIX,
>>>> 1996), BIOS 1.16.3-2.fc40 04/01/2014
>>>> [    3.954850] RIP: 0010:kunit_test_null_dereference+0x4a/0x150
>>>> [    3.955285] Code: b5 41 48 c7 44 24 08 98 95 51 ba 48 c1 ed 03
>>>> 48 c7 44 24 10 40 af 3b b7 48 8d 54 05 00 c7 02 f1 f1 f1 f1 c7 42
>>>> 04 01 f3 f3 f3 <0f> b6 04
>>>> [    3.956604] RSP: 0000:ffff88810920fe00 EFLAGS: 00010a06
>>>> [    3.956972] RAX: dffffc0000000000 RBX: ffff88810088fb30 RCX:
>>>> ffffffffb65da11d
>>>> [    3.957651] RDX: ffffed1021241fc0 RSI: 0000000000000008 RDI:
>>>> ffff88810088fb30
>>>> [    3.958317] RBP: 1ffff11021241fc0 R08: 0000000000000000 R09:
>>>> ffffed10207de600
>>>> [    3.958849] R10: ffff888103ef3007 R11: 0000000000000000 R12:
>>>> ffffffffb73baf40
>>>> [    3.959425] R13: ffffffffb73b1c60 R14: ffff8881038a9d80 R15:
>>>> ffff8881091c6ac0
>>>> [    3.959917] FS:  0000000000000000(0000)
>>>> GS:ffff888a88700000(0000) knlGS:0000000000000000
>>>> [    3.960521] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [    3.960920] CR2: 0000000000000000 CR3: 0000000b1406a000 CR4:
>>>> 00000000000006f0
>>>> [    3.961480] Call Trace:
>>>> [    3.961655]  <TASK>
>>>> [    3.961805]  ? die_addr+0x3b/0xa0
>>>> [    3.962052]  ? exc_general_protection+0x151/0x220
>>>> [    3.962439]  ? asm_exc_general_protection+0x26/0x30
>>>> [    3.962801]  ?
>>>> __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
>>>> [    3.963447]  ? __pfx_kunit_test_null_dereference+0x10/0x10
>>>> [    3.964150]  ? __kthread_parkme+0x7d/0x140
>>>> [    3.964443]  ? kunit_test_null_dereference+0x4a/0x150
>>>> [    3.964785]  ? __pfx_kunit_test_null_dereference+0x10/0x10
>>>> [    3.965205]  ? __kthread_parkme+0x7d/0x140
>>>> [    3.965494]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
>>>> [    3.965859]  kthread+0x30f/0x620
>>>> [    3.966108]  ? __pfx_kthread+0x10/0x10
>>>> [    3.966406]  ? __pfx_kthread+0x10/0x10
>>>> [    3.966680]  ret_from_fork+0x2f/0x70
>>>> [    3.966941]  ? __pfx_kthread+0x10/0x10
>>>> [    3.967264]  ret_from_fork_asm+0x1a/0x30
>>>> [    3.967560]  </TASK>
>>>> [    3.967722] Modules linked in:
>>>> [    3.967989] ---[ end trace 0000000000000000 ]---
>>>> [    3.968368] RIP: 0010:kunit_test_null_dereference+0x4a/0x150
>>>> [    3.968780] Code: b5 41 48 c7 44 24 08 98 95 51 ba 48 c1 ed 03
>>>> 48 c7 44 24 10 40 af 3b b7 48 8d 54 05 00 c7 02 f1 f1 f1 f1 c7 42
>>>> 04 01 f3 f3 f3 <0f> b6 04
>>>> [    3.970211] RSP: 0000:ffff88810920fe00 EFLAGS: 00010a06
>>>> [    3.970567] RAX: dffffc0000000000 RBX: ffff88810088fb30 RCX:
>>>> ffffffffb65da11d
>>>> [    3.971074] RDX: ffffed1021241fc0 RSI: 0000000000000008 RDI:
>>>> ffff88810088fb30
>>>> [    3.971580] RBP: 1ffff11021241fc0 R08: 0000000000000000 R09:
>>>> ffffed10207de600
>>>> [    3.972089] R10: ffff888103ef3007 R11: 0000000000000000 R12:
>>>> ffffffffb73baf40
>>>> [    3.972629] R13: ffffffffb73b1c60 R14: ffff8881038a9d80 R15:
>>>> ffff8881091c6ac0
>>>> [    3.973176] FS:  0000000000000000(0000)
>>>> GS:ffff888a88700000(0000) knlGS:0000000000000000
>>>> [    3.973720] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [    3.974148] CR2: 0000000000000000 CR3: 0000000b1406a000 CR4:
>>>> 00000000000006f0
>>>> [    3.974659] kunit_try_catch (225) used greatest stack depth:
>>>> 28416 bytes left
>>>> [    3.974764]     # kunit_test_fault_null_dereference: try
>>>> faulted: last line seen lib/kunit/kunit-test.c:95
>>>> [    3.976367]     ok 1 kunit_test_fault_null_dereference
>>>> [    3.976370] ok 8 kunit_fault
>>>> [    3.976946]     KTAP version 1
>>>> [    3.977208]     # Subtest: kunit_platform_device
>>>> [    3.977549]     # module: platform_test
>>>> [    3.977550]     1..4
>>>> [    3.978550]     ok 1 kunit_platform_device_alloc_test
>>>> [    3.978989]     ok 2 kunit_platform_device_add_test
>>>> [    3.980097] sysfs: cannot create duplicate filename
>>>> '/devices/platform/kunit-platform-add-2'
>>>> [    3.981138] CPU: 7 UID: 0 PID: 231 Comm: kunit_try_catch
>>>> Tainted: G      D          N 6.14.0-rc4-00388-g712b7c2f4d5d #21
>>>> [    3.981142] Tainted: [D]=DIE, [N]=TEST
>>>> [    3.981143] Hardware name: QEMU Standard PC (i440FX + PIIX,
>>>> 1996), BIOS 1.16.3-2.fc40 04/01/2014
>>>> [    3.981144] Call Trace:
>>>> [    3.981145]  <TASK>
>>>> [    3.981146]  dump_stack_lvl+0x53/0x70
>>>> [    3.981151]  sysfs_warn_dup+0x70/0x90
>>>> [    3.981154]  sysfs_create_dir_ns+0x209/0x280
>>>> [    3.981156]  ? __pfx_sysfs_create_dir_ns+0x10/0x10
>>>> [    3.981159]  ? _raw_spin_lock+0x80/0xe0
>>>> [    3.981161]  kobject_add_internal+0x216/0x8b0
>>>> [    3.981163]  kobject_add+0x13b/0x200
>>>> [    3.981165]  ? __pfx_kobject_add+0x10/0x10
>>>> [    3.981167]  ? kobject_get+0x50/0xe0
>>>> [    3.981169]  device_add+0x217/0x1460
>>>> [    3.981171]  ? __pfx_device_add+0x10/0x10
>>>> [    3.981173]  ? _raw_spin_lock_irqsave+0x86/0xe0
>>>> [    3.981174]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>>>> [    3.981176]  ? device_initialize+0x1f4/0x410
>>>> [    3.981179]  ? platform_device_alloc+0x97/0x200
>>>> [    3.981182]  platform_device_add+0x375/0x5b0
>>>> [    3.981184]  kunit_platform_device_add+0x20/0x2c0
>>>> [    3.981186]
>>>> kunit_platform_device_add_twice_fails_test+0x1f5/0x420
>>>> [    3.981189]  ?
>>>> __pfx_kunit_platform_device_add_twice_fails_test+0x10/0x10
>>>> [    3.981191]  ? __schedule+0xdda/0x24f0
>>>> [    3.981193]  ? kvm_clock_get_cycles+0x18/0x30
>>>> [    3.981196]  ? ktime_get_ts64+0x7d/0x220
>>>> [    3.981200]  kunit_try_run_case+0x1ae/0x490
>>>> [    3.981202]  ? __pfx_kunit_try_run_case+0x10/0x10
>>>> [    3.981204]  ? _raw_spin_lock_irqsave+0x86/0xe0
>>>> [    3.981205]  ? __pfx_kunit_try_run_case+0x10/0x10
>>>> [    3.981207]  ?
>>>> __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
>>>> [    3.981210]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
>>>> [    3.981212]  kthread+0x30f/0x620
>>>> [    3.981214]  ? __pfx_kthread+0x10/0x10
>>>> [    3.981216]  ? __pfx_kthread+0x10/0x10
>>>> [    3.981217]  ret_from_fork+0x2f/0x70
>>>> [    3.981223]  ? __pfx_kthread+0x10/0x10
>>>> [    3.981225]  ret_from_fork_asm+0x1a/0x30
>>>> [    3.981227]  </TASK>
>>>> [    3.981232] kobject: kobject_add_internal failed for kunit-
>>>> platform-add-2 with -EEXIST, don't try to register things with the
>>>> same name in the same direc.
>>>> [    3.995255] kunit_try_catch (231) used greatest stack depth:
>>>> 27528 bytes left
>>>> [    3.995525]     ok 3 kunit_platform_device_add_twice_fails_test
>>>> [    3.996247]     ok 4 kunit_platform_device_add_cleans_up
>>>> [    3.996678] # kunit_platform_device: pass:4 fail:0 skip:0
>>>> total:4
>>>> [    3.997073] # Totals: pass:4 fail:0 skip:0 total:4
>>>> [    3.997530] ok 9 kunit_platform_device
>>>> [    3.998130]     KTAP version 1
>>>> [    3.998356]     # Subtest: kunit_platform_driver
>>>> [    3.998664]     # module: platform_test
>>>> [    3.998665]     1..2
>>>> [    3.999663]     ok 1 kunit_platform_driver_register_test
>>>> [    4.000372]     ok 2
>>>> kunit_platform_device_prepare_wait_for_probe_completes_when_already
>>>> _probed
>>>> [    4.000750] # kunit_platform_driver: pass:2 fail:0 skip:0
>>>> total:2
>>>> [    4.001372] # Totals: pass:2 fail:0 skip:0 total:2
>>>> [    4.001777] ok 10 kunit_platform_driver
>>>> [    4.002412]     KTAP version 1
>>>> [    4.002618]     # Subtest: string-stream-test
>>>> [    4.002909]     # module: string_stream_test
>>>> [    4.002910]     1..12
>>>> [    4.003643]     ok 1 string_stream_managed_init_test
>>>> [    4.003919]     ok 2 string_stream_unmanaged_init_test
>>>> [    4.004581]     ok 3 string_stream_managed_free_test
>>>> [    4.005295]     ok 4 string_stream_resource_free_test
>>>> [    4.007076]     ok 5 string_stream_line_add_test
>>>> [    4.008801]     ok 6 string_stream_variable_length_line_test
>>>> [    4.009944]     ok 7 string_stream_append_test
>>>> [    4.010840]     ok 8 string_stream_append_auto_newline_test
>>>> [    4.011461]     ok 9 string_stream_append_empty_string_test
>>>> [    4.012233]     ok 10 string_stream_no_auto_newline_test
>>>> [    4.013158]     ok 11 string_stream_auto_newline_test
>>>> [    4.063760]     # string_stream_performance_test: Time
>>>> elapsed:           49385 us
>>>> [    4.064713]     # string_stream_performance_test: Total string
>>>> length:    573890
>>>> [    4.065271]     # string_stream_performance_test: Bytes
>>>> requested:        823930
>>>> [    4.065803]     # string_stream_performance_test: Actual bytes
>>>> allocated: 1048312
>>>> [    4.098820]     ok 12 string_stream_performance_test
>>>> [    4.098826] # string-stream-test: pass:12 fail:0 skip:0 total:12
>>>> [    4.099348] # Totals: pass:12 fail:0 skip:0 total:12
>>>> [    4.099814] ok 11 string-stream-test
>>>> [    4.100495]     KTAP version 1
>>>> [    4.100735]     # Subtest: kunit-assert
>>>> [    4.101048]     # module: assert_test
>>>> [    4.101050]     1..11
>>>> [    4.101943]     ok 1 kunit_test_is_literal
>>>> [    4.102331]     ok 2 kunit_test_is_str_literal
>>>> [    4.103177]     ok 3 kunit_test_assert_prologue
>>>> [    4.103996]     ok 4 kunit_test_assert_print_msg
>>>> [    4.104867]     ok 5 kunit_test_unary_assert_format
>>>> [    4.105908]     ok 6 kunit_test_ptr_not_err_assert_format
>>>> [    4.107022]     ok 7 kunit_test_binary_assert_format
>>>> [    4.107868]     ok 8 kunit_test_binary_ptr_assert_format
>>>> [    4.108702]     ok 9 kunit_test_binary_str_assert_format
>>>> [    4.109969]     ok 10 kunit_test_assert_hexdump
>>>> [    4.111490]     ok 11 kunit_test_mem_assert_format
>>>> [    4.111845] # kunit-assert: pass:11 fail:0 skip:0 total:11
>>>> [    4.112522] # Totals: pass:11 fail:0 skip:0 total:11
>>>> [    4.112949] ok 12 kunit-assert
>>>> [    4.113628]     KTAP version 1
>>>> [    4.113867]     # Subtest: drm_sched_basic_tests
>>>> [    4.114281]     # module: drm_sched_tests
>>>> [    4.114283]     1..3
>>>> [    4.234223] input: ImExPS/2 Generic Explorer Mouse as
>>>> /devices/platform/i8042/serio1/input/input3
>>>> [    4.617191]     ok 1 drm_sched_basic_submit
>>>> [    4.617197]         KTAP version 1
>>>> [    4.617765]         # Subtest: drm_sched_basic_test
>>>> [    4.719657]         ok 1 A queue of jobs in a single entity
>>>> [    4.821976]         ok 2 A chain of dependent jobs across
>>>> multiple entities
>>>> [    4.924015]         ok 3 Multiple independent job queues
>>>> [    5.026465]         ok 4 Multiple inter-dependent job queues
>>>> [    5.026907]     # drm_sched_basic_test: pass:4 fail:0 skip:0
>>>> total:4
>>>> [    5.027322]     ok 2 drm_sched_basic_test
>>>> [    5.080020]     ok 3 drm_sched_basic_entity_cleanup
>>>> [    5.080317] # drm_sched_basic_tests: pass:3 fail:0 skip:0
>>>> total:3
>>>> [    5.080657] # Totals: pass:6 fail:0 skip:0 total:6
>>>> [    5.081103] ok 13 drm_sched_basic_tests
>>>> [    5.081679]     KTAP version 1
>>>> [    5.081881]     # Subtest: drm_sched_basic_timeout_tests
>>>> [    5.082259]     # module: drm_sched_tests
>>>> [    5.082260]     1..1
>>>>
>>>>
>>>>
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>>
>>>>> Tvrtko Ursulin (7):
>>>>>     drm: Move some options to separate new Kconfig
>>>>>     drm/sched: Add scheduler unit testing infrastructure and some
>>>>> basic
>>>>>       tests
>>>>>     drm/sched: Add aspirational unit test mode
>>>>>     drm/sched: Add a simple timeout test
>>>>>     drm/sched: Add basic priority tests
>>>>>     drm/sched: Add a basic test for modifying entities scheduler
>>>>> list
>>>>>     drm/sched: Add a basic test for checking credit limit
>>>>>
>>>>>    drivers/gpu/drm/Kconfig                       | 109 +---
>>>>>    drivers/gpu/drm/Kconfig.debug                 | 128 +++++
>>>>>    drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
>>>>>    drivers/gpu/drm/scheduler/Makefile            |   2 +
>>>>>    drivers/gpu/drm/scheduler/tests/Makefile      |   7 +
>>>>>    .../gpu/drm/scheduler/tests/mock_scheduler.c  | 345
>>>>> +++++++++++++
>>>>>    drivers/gpu/drm/scheduler/tests/sched_tests.h | 224 +++++++++
>>>>>    drivers/gpu/drm/scheduler/tests/tests_basic.c | 476
>>>>> ++++++++++++++++++
>>>>>    8 files changed, 1199 insertions(+), 104 deletions(-)
>>>>>    create mode 100644 drivers/gpu/drm/Kconfig.debug
>>>>>    create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
>>>>>    create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
>>>>>    create mode 100644
>>>>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>    create mode 100644
>>>>> drivers/gpu/drm/scheduler/tests/sched_tests.h
>>>>>    create mode 100644
>>>>> drivers/gpu/drm/scheduler/tests/tests_basic.c
>>>>>
>>>>
>>>
>>
> 

