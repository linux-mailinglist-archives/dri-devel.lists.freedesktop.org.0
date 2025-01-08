Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB8A063EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20AA10E90E;
	Wed,  8 Jan 2025 18:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qjUvGMIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859810E910
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EdTAlMDIRHcP9DgqBQ7VKy7BpTSwqNclkuKvVt5HR14=; b=qjUvGMIO8hfTkU9Vap4m+zLZi1
 eUHUJS0WRhBxPHu7mExW4uk1h0jl8TYnvXEf395d/VcxF91hhYXBrgD2Uz5qMPq5//kRFuZN8sd+k
 hfy29XNEW88/6faYkEMVtndL4oJLUoStXniNgGHYJICeuXx8acqABPhZtAUsZ6Rtck7wrLoEw4Y9F
 cm0xGoAmVUFhQNNWqfIWU5H3ORy7wFyU5SB89eFFuOF/lIjYV3+S4dHeM2t7CywrMjXVYKuLgxZP4
 Vz0oIHrrXtBKBrUJVkDz8ungKoPMovV39qrxwtiOE+vslK86hH9nWS+ADN12uB1G/mI8RzXyecr/q
 6Ix+mdmg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVaRY-00DEj7-Ee; Wed, 08 Jan 2025 19:06:12 +0100
Message-ID: <468652e7-2092-4306-a409-2d76dad02e6b@igalia.com>
Date: Wed, 8 Jan 2025 18:06:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [RFC 00/14] Deadline scheduler and other ideas
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Philipp Stanner <pstanner@redhat.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <PH7PR12MB568508440AB661A0B168721A83152@PH7PR12MB5685.namprd12.prod.outlook.com>
 <Z3vfDWrQUYV7k7VJ@phenom.ffwll.local>
 <9ba4f8b8d400d937bff1f4019df68a7625408993.camel@redhat.com>
 <Z369HN8gkxOOMAPT@phenom.ffwll.local>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z369HN8gkxOOMAPT@phenom.ffwll.local>
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


On 08/01/2025 17:59, Simona Vetter wrote:
> On Wed, Jan 08, 2025 at 09:07:44AM +0100, Philipp Stanner wrote:
>> On Mon, 2025-01-06 at 14:47 +0100, Simona Vetter wrote:
>>> On Fri, Jan 03, 2025 at 03:16:56PM +0000, Koenig, Christian wrote:
>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>
>>>> Could you send that whole patch set to me once more?
>>>>
>>>> The AMD mails servers seem to have had a hickup over the holidays
>>>> and
>>>> all mails received between ~25.12.2024 and 1.1.2025 are somehow
>>>> mangled.
>>>
>>> I seem to have the same issue with fetching from lore.o.k, despite
>>> that
>>> the archives seem to be complete. No idea what's happened.
>>
>> I could pull it just fine with b4
> 
> Yeah now they all just magically showed up. No idea what happened.
You can hold off reading until v2 of the series.

Or if you really want some reading material for a cold winter's evening 
you could have a look at the syncobj optimisation series. ;)

Regards,

Tvrtko

>>>> Thanks in advance,
>>>> Christian.
>>>>
>>>> ________________________________________
>>>> Von: Tvrtko Ursulin <tursulin@igalia.com>
>>>> Gesendet: Montag, 30. Dezember 2024 17:52
>>>> An: dri-devel@lists.freedesktop.org
>>>> Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian;
>>>> Danilo Krummrich; Matthew Brost; Philipp Stanner
>>>> Betreff: [RFC 00/14] Deadline scheduler and other ideas
>>>>
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> <tldr>
>>>> Replacing FIFO with a flavour of deadline driven scheduling and
>>>> removing round-
>>>> robin. Connecting the scheduler with dma-fence deadlines. First
>>>> draft and
>>>> testing by different drivers and feedback would be nice. I was only
>>>> able to test
>>>> it with amdgpu. Other drivers may not even compile.
>>>> </tldr>
>>>>
>>>> If I remember correctly Christian mentioned recently (give or take)
>>>> that maybe
>>>> round-robin could be removed. That got me thinking how and what
>>>> could be
>>>> improved and simplified. So I played a bit in the scheduler code
>>>> and came up
>>>> with something which appears to not crash at least. Whether or not
>>>> there are
>>>> significant advantages apart from maybe code consolidation and
>>>> reduction is the
>>>> main thing to be determined.
>>>>
>>>> One big question is whether round-robin can really be removed. Does
>>>> anyone use
>>>> it, rely on it, or what are even use cases where it is much better
>>>> than FIFO.
>>>>
>>>> See "drm/sched: Add deadline policy" commit message for a short
>>>> description on
>>>> what flavour of deadline scheduling it is. But in essence it should
>>>> a more fair
>>>> FIFO where higher priority can not forever starve lower priorities.
>>>>
>>>> "drm/sched: Connect with dma-fence deadlines" wires up dma-fence
>>>> deadlines to
>>>> the scheduler because it is easy and makes logical sense with this.
>>>> And I
>>>> noticed userspace already uses it so why not wire it up fully.
>>>>
>>>> Otherwise the series is a bit of progression from consolidating RR
>>>> into FIFO
>>>> code paths and going from there to deadline and then to a change in
>>>> how
>>>> dependencies are handled. And code simplification to 1:1 run queue
>>>> to scheduler
>>>> relationship, because deadline does not need per priority run
>>>> queues.
>>>>
>>>> There is quite a bit of code to go throught here so I think it
>>>> could be even
>>>> better if other drivers could give it a spin as is and see if some
>>>> improvements
>>>> can be detected. Or at least no regressions.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>>>
>>>> Tvrtko Ursulin (14):
>>>>    drm/sched: Delete unused update_job_credits
>>>>    drm/sched: Remove idle entity from tree
>>>>    drm/sched: Implement RR via FIFO
>>>>    drm/sched: Consolidate entity run queue management
>>>>    drm/sched: Move run queue related code into a separate file
>>>>    drm/sched: Ignore own fence earlier
>>>>    drm/sched: Resolve same scheduler dependencies earlier
>>>>    drm/sched: Add deadline policy
>>>>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>>>>    drm/sched: Queue all free credits in one worker invocation
>>>>    drm/sched: Connect with dma-fence deadlines
>>>>    drm/sched: Embed run queue singleton into the scheduler
>>>>    dma-fence: Add helper for custom fence context when merging
>>>> fences
>>>>    drm/sched: Resolve all job dependencies in one go
>>>>
>>>>   drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
>>>>   drivers/gpu/drm/scheduler/Makefile          |   2 +-
>>>>   drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
>>>>   drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
>>>>   drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++-----------
>>>> ----
>>>>   drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
>>>>   include/drm/gpu_scheduler.h                 |  74 ++-
>>>>   include/linux/dma-fence-unwrap.h            |  31 +-
>>>>   14 files changed, 606 insertions(+), 678 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>>>
>>>> --
>>>> 2.47.1
>>>>
>>>
>>
> 
