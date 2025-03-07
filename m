Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E5A5667E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 12:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F40110E0DA;
	Fri,  7 Mar 2025 11:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KBduHuKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229EC10E0DA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ors1pkwknFseYIbrY74Qzm8VVh5BR/wGamHVxP8zF50=; b=KBduHuKksNMTfHcesUA3wrYRnc
 SFlGqVeNUcmpLxqWEusoDcxAzFTLMHln5MxNbyiSZ63WOgNX4m5eBbQca3yCCEzgdoVSIKjoAXt0a
 dzER4PBcRhz8fLL7BFXV6tPBXy3e9az8t/vjaRoIVluelieJrj/HJbLgB+4suFdk2+Uk6ObobQfIG
 wWgbbAAt8UCvrrXBpbOxGCyLyGxLDb4haxw27jnXzPFt6+3eIbzG+K8jWwZAmpWWZYR28P30zSYj/
 wj+hQdJYO4ZzNiyhcflGP7wvIAGl/e8zUxhUCd55zkLIN1ppBcHp3YKDzsMkC8qMgeCgTHS2+kpfJ
 lNgOYv2Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tqVl3-005JuM-Q8; Fri, 07 Mar 2025 12:20:55 +0100
Message-ID: <06ff8bcc-b550-4575-920d-2bee13a4d04c@igalia.com>
Date: Fri, 7 Mar 2025 11:20:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] DRM scheduler kunit tests
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250304131030.52850-1-tvrtko.ursulin@igalia.com>
 <00d9bf39713e995d62ffb10eb9a85028d213f3aa.camel@mailbox.org>
 <c2052196-b67e-407f-8d99-c4b26e9ed199@igalia.com>
 <d4f08145-df2f-4178-acad-3a55fa8ae82c@igalia.com>
 <7fcc66f3-47c6-4867-829c-1a51e09e4d04@igalia.com>
 <20fe30189a03f4eb241524c5a92cf1d52ee5081e.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20fe30189a03f4eb241524c5a92cf1d52ee5081e.camel@mailbox.org>
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


On 07/03/2025 07:21, Philipp Stanner wrote:
> On Thu, 2025-03-06 at 17:10 +0000, Tvrtko Ursulin wrote:
>>
>> On 06/03/2025 15:18, Tvrtko Ursulin wrote:
>>>
>>> On 06/03/2025 14:56, Tvrtko Ursulin wrote:
>>>>
>>>> On 06/03/2025 12:37, Philipp Stanner wrote:
>>>>> On Tue, 2025-03-04 at 13:10 +0000, Tvrtko Ursulin wrote:
>>>>>> There has repeatedly been quite a bit of apprehension when
>>>>>> any change
>>>>>> to the DRM
>>>>>> scheduler is proposed, with two main reasons being code base
>>>>>> is
>>>>>> considered
>>>>>> fragile, not well understood and not very well documented,
>>>>>> and
>>>>>> secondly the lack
>>>>>> of systematic testing outside the vendor specific tests
>>>>>> suites and/or
>>>>>> test
>>>>>> farms.
>>>>>>
>>>>>> This series is an attempt to dislodge this status quo by
>>>>>> adding some
>>>>>> unit tests
>>>>>> using the kunit framework.
>>>>>>
>>>>>> General approach is that there is a mock "hardware" backend
>>>>>> which can
>>>>>> be
>>>>>> controlled from tests, which in turn allows exercising
>>>>>> various
>>>>>> scheduler code
>>>>>> paths.
>>>>>>
>>>>>> Only some simple basic tests get added in the series and
>>>>>> hopefully it
>>>>>> is easy to
>>>>>> understand what tests are doing.
>>>>>>
>>>>>> An obligatory "screenshot" for reference:
>>>>>>
>>>>>> [14:29:37] ============ drm_sched_basic_tests (3 subtests)
>>>>>> ============
>>>>>> [14:29:38] [PASSED] drm_sched_basic_submit
>>>>>> [14:29:38] ================== drm_sched_basic_test
>>>>>> ===================
>>>>>> [14:29:38] [PASSED] A queue of jobs in a single entity
>>>>>> [14:29:38] [PASSED] A chain of dependent jobs across multiple
>>>>>> entities
>>>>>> [14:29:38] [PASSED] Multiple independent job queues
>>>>>> [14:29:38] [PASSED] Multiple inter-dependent job queues
>>>>>> [14:29:38] ============== [PASSED] drm_sched_basic_test
>>>>>> ===============
>>>>>> [14:29:38] [PASSED] drm_sched_basic_entity_cleanup
>>>>>> [14:29:38] ============== [PASSED] drm_sched_basic_tests
>>>>>> ==============
>>>>>> [14:29:38] ======== drm_sched_basic_timeout_tests (1 subtest)
>>>>>> =========
>>>>>> [14:29:40] [PASSED] drm_sched_basic_timeout
>>>>>> [14:29:40] ========== [PASSED] drm_sched_basic_timeout_tests
>>>>>> ==========
>>>>>> [14:29:40] ======= drm_sched_basic_priority_tests (2
>>>>>> subtests)
>>>>>> ========
>>>>>> [14:29:42] [PASSED] drm_sched_priorities
>>>>>> [14:29:42] [PASSED] drm_sched_change_priority
>>>>>> [14:29:42] ========= [PASSED] drm_sched_basic_priority_tests
>>>>>> ==========
>>>>>> [14:29:42] ====== drm_sched_basic_modify_sched_tests (1
>>>>>> subtest)
>>>>>> ======
>>>>>> [14:29:43] [PASSED] drm_sched_test_modify_sched
>>>>>> [14:29:43] ======= [PASSED]
>>>>>> drm_sched_basic_modify_sched_tests
>>>>>> ========
>>>>>> [14:29:43]
>>>>>> ============================================================
>>>>>> [14:29:43] Testing complete. Ran 10 tests: passed: 10
>>>>>> [14:29:43] Elapsed time: 13.330s total, 0.001s configuring,
>>>>>> 4.005s
>>>>>> building, 9.276s running
>>>>>
>>>>> Yo,
>>>>>
>>>>> so I tried to test this all this in QEMU and I am encountering
>>>>> some
>>>>> explosions when I activate the scheduler tests. Just DRM tests
>>>>> boot
>>>>> fine.
>>>>>
>>>>> I'm using a kernel on relatively current drm-misc-next:
>>>>> 44d2f310f008
>>>>>
>>>>> I apply your series, then
>>>>> make defconfig
>>>>> make menuconfig # switch on kunit framework and scheduler tests
>>>>> install everything + initramfs
>>>>>
>>>>> Boot then causes errors as below. Just using the DRM kunit
>>>>> tests works
>>>>> fine.
>>>>>
>>>>> Excerpt of the first fault:
>>>>>
>>>>> [    1.040513] # kunit_device: pass:3 fail:0 skip:0 total:3
>>>>> [    1.040867] # Totals: pass:3 fail:0 skip:0 total:3
>>>>> [    1.041296] ok 7 kunit_device
>>>>> [    1.041936]     KTAP version 1
>>>>> [    1.042186]     # Subtest: kunit_fault
>>>>> [    1.042517]     # module: kunit_test
>>>>> [    1.042517]     1..1
>>>>> [    1.043147] BUG: kernel NULL pointer dereference, address:
>>>>> 0000000000000000
>>>>> [    1.043765] #PF: supervisor write access in kernel mode
>>>>> [    1.044189] #PF: error_code(0x0002) - not-present page
>>>>> [    1.044617] PGD 0 P4D 0
>>>>> [    1.044818] Oops: Oops: 0002 [#1] PREEMPT SMP PTI
>>>>> [    1.045380] CPU: 7 UID: 0 PID: 214 Comm: kunit_try_catch
>>>>> Tainted:
>>>>> G                 N 6.14.0-rc4-00387-g33e4632926a0 #8
>>>>> [    1.046262] Tainted: [N]=TEST
>>>>> [    1.046521] Hardware name: QEMU Standard PC (i440FX + PIIX,
>>>>> 1996),
>>>>> BIOS 1.16.3-2.fc40 04/01/2014
>>>>> [    1.047224] RIP: 0010:kunit_test_null_dereference+0x37/0x80
>>>>> [    1.047706] Code: 80 b5 49 c7 c0 50 7f 56 b4 ba 01 00 00 00
>>>>> 65 48
>>>>> 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 48 8d 4c 24 07 48 c7
>>>>> c6 80
>>>>> 8a 26 b5 <c7> 04 25 00 00 00 00 00 00 00 00 48 c7 87 70 01 00
>>>>> 00 a6
>>>>> e9 8c b5
>>>>> [    1.049204] RSP: 0000:ffffa609807c7ec8 EFLAGS: 00010246
>>>>> [    1.049642] RAX: 0000000000000000 RBX: ffff91d982623000 RCX:
>>>>> ffffa609807c7ecf
>>>>> [    1.050213] RDX: 0000000000000001 RSI: ffffffffb5268a80 RDI:
>>>>> ffffa60980013c68
>>>>> [    1.050799] RBP: ffff91d98105afc0 R08: ffffffffb4567f50 R09:
>>>>> ffffffffb5807ce8
>>>>> [    1.051375] R10: 0000000000000000 R11: 0000000000000001 R12:
>>>>> ffff91d98105afc0
>>>>> [    1.051941] R13: ffff91d983c749c0 R14: ffffffffb45685e0 R15:
>>>>> ffff91d982623000
>>>>> [    1.052543] FS:  0000000000000000(0000)
>>>>> GS:ffff91e48f9c0000(0000)
>>>>> knlGS:0000000000000000
>>>>> [    1.053187] CS:  0010 DS: 0000 ES: 0000 CR0:
>>>>> 0000000080050033
>>>>> [    1.053649] CR2: 0000000000000000 CR3: 00000004cee30000 CR4:
>>>>> 00000000000006f0
>>>>> [    1.054214] Call Trace:
>>>>> [    1.054427]  <TASK>
>>>>> [    1.054597]  ? __die+0x1e/0x60
>>>>> [    1.054844]  ? page_fault_oops+0x17b/0x4a0
>>>>> [    1.055174]  ? search_extable+0x26/0x30
>>>>> [    1.055482]  ? kunit_test_null_dereference+0x37/0x80
>>>>> [    1.055888]  ? search_module_extables+0x14/0x50
>>>>> [    1.056255]  ? exc_page_fault+0x6b/0x150
>>>>> [    1.056571]  ? asm_exc_page_fault+0x26/0x30
>>>>> [    1.056898]  ?
>>>>> __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
>>>>> [    1.057387]  ? __pfx_kunit_fail_assert_format+0x10/0x10
>>>>> [    1.057799]  ? kunit_test_null_dereference+0x37/0x80
>>>>> [    1.058195]  ? __kthread_parkme+0x33/0x80
>>>>> [    1.058523]  kunit_generic_run_threadfn_adapter+0x1c/0x40
>>>>> [    1.058949]  kthread+0xe9/0x1f0
>>>>> [    1.059206]  ? __pfx_kthread+0x10/0x10
>>>>> [    1.059513]  ret_from_fork+0x2f/0x50
>>>>> [    1.059798]  ? __pfx_kthread+0x10/0x10
>>>>> [    1.060095]  ret_from_fork_asm+0x1a/0x30
>>>>> [    1.060421]  </TASK>
>>>>> [    1.060597] Modules linked in:
>>>>> [    1.060841] CR2: 0000000000000000
>>>>> [    1.061104] ---[ end trace 0000000000000000 ]---
>>>>> [    1.061481] RIP: 0010:kunit_test_null_dereference+0x37/0x80
>>>>>
>>>>>
>>>>> I attach my kernel config and the full log file.
>>>>>
>>>>> What's awkward is that it does not seem to be related directly
>>>>> to
>>>>> sched, but only faults with sched.
>>>>>
>>>>>
>>>>> Could you try to reproduce this, Tvrtko?
>>>>
>>>> Any chance that between the two runs you somehow manage to enable
>>>> CONFIG_KUNIT_FAULT_TEST?
>>>
>>> Hmm in the sea of kunit_test_null_dereference there was a drm sched
>>> related fail too. Investigating.
>>
>> Well this was quite embarrassing - I had an use after free due
>> relying
>> on scheduler fences for querying job status. That's what I get for
>> over-relying on KASAN...
> 
> Interesting, so KASAN had a false negative with those?

No, just that it cannot see UAF if it doesn't happen due timing. I was 
referring to the false sense of security of "I am running with KASAN 
therefore there cannot possibly be bugs." :)

>> I've fixed it by tracking the job completion status in the mock job
>> object directly and sent v4 out.
>>
>> Also interestingly, for me testing under qemu failed to catch it.
>> Only
>> one out of two real hw test machines hit it.
> 
> That's very awkward. How can my QEMU be that different from your QEMU?
> Did you use the commit I provided above as the base of your kernel,
> too?

It was just about timing. Scheduler free job worker had to run before 
the test dereferenced job->s_fence one last time. I replaced that with a 
direct status check on the container object in the new version.

Regards,

Tvrtko

>>   Excellent that you gave it
>> a spin and caught it before merge, thanks for that!
> 
> No worries, that's our mission. Cool that you found it so quickly!
> 
> P.
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>>
>>>>>
>>>>> Thanks
>>>>> P.
>>>>>
>>>>>
>>>>>>
>>>>>> v2:
>>>>>>    * Parameterize a bunch of similar tests.
>>>>>>    * Improve test commentary.
>>>>>>    * Rename TDR test to timeout. (Christian)
>>>>>>    * Improve quality and consistency of naming. (Philipp)
>>>>>>
>>>>>> RFC v2 -> series v1:
>>>>>>    * Rebased for drm_sched_init changes.
>>>>>>    * Fixed modular build.
>>>>>>    * Added some comments.
>>>>>>    * Filename renames. (Philipp)
>>>>>>
>>>>>> v2:
>>>>>>    * Dealt with a bunch of checkpatch warnings.
>>>>>>
>>>>>> v3:
>>>>>>    * Some mock API renames, kerneldoc grammar fixes and
>>>>>> indentation
>>>>>> fixes.
>>>>>>
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>>>
>>>>>> Tvrtko Ursulin (5):
>>>>>>     drm: Move some options to separate new Kconfig
>>>>>>     drm/scheduler: Add scheduler unit testing infrastructure
>>>>>> and some
>>>>>>       basic tests
>>>>>>     drm/scheduler: Add a simple timeout test
>>>>>>     drm/scheduler: Add basic priority tests
>>>>>>     drm/scheduler: Add a basic test for modifying entities
>>>>>> scheduler
>>>>>> list
>>>>>>
>>>>>>    drivers/gpu/drm/Kconfig                       | 109 +----
>>>>>>    drivers/gpu/drm/Kconfig.debug                 | 115 +++++
>>>>>>    drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
>>>>>>    drivers/gpu/drm/scheduler/Makefile            |   2 +
>>>>>>    drivers/gpu/drm/scheduler/tests/Makefile      |   7 +
>>>>>>    .../gpu/drm/scheduler/tests/mock_scheduler.c  | 323
>>>>>> +++++++++++++
>>>>>>    drivers/gpu/drm/scheduler/tests/sched_tests.h | 223
>>>>>> +++++++++
>>>>>>    drivers/gpu/drm/scheduler/tests/tests_basic.c | 426
>>>>>> ++++++++++++++++++
>>>>>>    8 files changed, 1113 insertions(+), 104 deletions(-)
>>>>>>    create mode 100644 drivers/gpu/drm/Kconfig.debug
>>>>>>    create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
>>>>>>    create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
>>>>>>    create mode 100644
>>>>>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>>    create mode 100644
>>>>>> drivers/gpu/drm/scheduler/tests/sched_tests.h
>>>>>>    create mode 100644
>>>>>> drivers/gpu/drm/scheduler/tests/tests_basic.c
>>>>>>
>>>>>
>>>>
>>>
>>
> 

