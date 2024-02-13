Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6085387A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 18:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA13F10E0A4;
	Tue, 13 Feb 2024 17:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Nr6zhF+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D4810E08F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707845869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6CePIDfsDcVvbRAJ1gcQ0gDJK1NiHScRn5OrLlnFnw=;
 b=Nr6zhF+h4U02/sEOzXNK5Qw8ewOukCtUWO4iXLqfiMqJaAUeqQ0YNmADjmFQrxgW21BhWr
 aciUlTlFpJwHb16R3eZs3XdLvgiJiFu+tzN8ZpzWwBf4MDgXILOMZboj9lEJLm+aMF3ntZ
 gGS8gz/22md6AAiH26S43r2WpBQ2lag=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-8Vz7fO5FPcGZEYetf7aqaA-1; Tue, 13 Feb 2024 12:37:47 -0500
X-MC-Unique: 8Vz7fO5FPcGZEYetf7aqaA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a2c4e9cb449so311073366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 09:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845866; x=1708450666;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I6CePIDfsDcVvbRAJ1gcQ0gDJK1NiHScRn5OrLlnFnw=;
 b=H33NtOjADoqb2Eh+AXiXAmjcSSayNuWO2w52fl1/+73C+wgG1p3ePbvoJcs7WdiP/r
 QgkLmro1lZVIydFb+UhXUo552nUSkchk3AXafQ9T9XrCMxztCE8pk7LKBvkqOsmVCedJ
 2B6oWMZp5IxjS1uAKBRCqdTFVVbPWIShOxtkdeO3XIW1xUW8s01orSG7MlPMIYgKGX9S
 znSa6tZgKslfxK8fQFXZ8rf15pgn57E+eD4vlq0CLr5y/GKx5SjUUKqKcXEzIx9Erfak
 dPVKWmzNc6mLRzKV2AnwTcXSGqCvGf/gUmz7TeC6/ae1H66lm2fy91deS8GoJmSAehi0
 tOOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7asaq0VeXeSVdbrMkhqUaZSEy81jcbUs3vHx9pQf2I1hkmbZYQ11/eBXJuPORYdK5nM4J1hWIqDv5Zh3qP7g8wQhWn3xXHovi0ENdq8Hv
X-Gm-Message-State: AOJu0YwF66/ybUbAO9gAyZefqjA0n1ApgEEHfY5gOW92579SslPkxn1d
 N3zSs/n4Pv/A70TRitqN2BtFyMkJ6Tq3NtXBLmj7U0Tm0A/JqZ9k9+fvOEWAabexk1SKq7wYeA9
 XfpAfo7LDdKXMcHo6CgzJOJP2BnhTXWoSMSxuBEMakxhu8nBUoFAOhCi/Giw1LaVaUQ==
X-Received: by 2002:aa7:db4f:0:b0:55f:4464:d044 with SMTP id
 n15-20020aa7db4f000000b0055f4464d044mr305571edt.6.1707845866328; 
 Tue, 13 Feb 2024 09:37:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtvJRGogEF8rUGzRcOwIN19jHR5qXH0OeLCVPqM0CDYoGGWj+yUFIRdlxf9ZYW0VSdWWKqKw==
X-Received: by 2002:aa7:db4f:0:b0:55f:4464:d044 with SMTP id
 n15-20020aa7db4f000000b0055f4464d044mr305549edt.6.1707845865948; 
 Tue, 13 Feb 2024 09:37:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVEMXOsIBtmPxaox1ubEb95Qj5cm042MaOjEgt50MQiPGG3+rbtrRhdj7jC0d7UQ39xq7TZCpHTyU45JxsztRb83seorjhOKFGxNIOCpGObMSkbgeYjkp6alnw+NdMd8aNwD3TPbzAXpfpGVd9DMNuyWW9Ihh329+++EjZ0alPxNAxQP7fFip0ltHwjBYdZ4MhQRZVWsnmP2xFpdNvJuwKc2xr3eGz2Nzci0O6tn60BUKWIKybI1a1Czbjl+Cqmp/AtT3iVWgQnbiPYhd/NGdiJnWZCutCub+MEnSKMd7C2s1k
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 c19-20020aa7c993000000b0056211a1635esm242219edt.47.2024.02.13.09.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 09:37:45 -0800 (PST)
Message-ID: <b38ea934-ea53-422f-aaa9-34ec468ea52c@redhat.com>
Date: Tue, 13 Feb 2024 18:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
From: Danilo Krummrich <dakr@redhat.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: airlied@gmail.com, ltuikov89@gmail.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20231116141547.206695-1-christian.koenig@amd.com>
 <ZVaWVH+mX+PXKqfD@pollux>
Organization: RedHat
In-Reply-To: <ZVaWVH+mX+PXKqfD@pollux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

Hi Christian,

What's the status of this effort? Was there ever a follow-up?

- Danilo

On 11/16/23 23:23, Danilo Krummrich wrote:
> Hi Christian,
> 
> Thanks for sending an update of this patch!
> 
> On Thu, Nov 16, 2023 at 03:15:46PM +0100, Christian König wrote:
>> Start to improve the scheduler document. Especially document the
>> lifetime of each of the objects as well as the restrictions around
>> DMA-fence handling and userspace compatibility.
>>
>> v2: Some improvements suggested by Danilo, add section about error
>>      handling.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   Documentation/gpu/drm-mm.rst           |  36 +++++
>>   drivers/gpu/drm/scheduler/sched_main.c | 174 +++++++++++++++++++++----
>>   2 files changed, 188 insertions(+), 22 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index acc5901ac840..112463fa9f3a 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -552,12 +552,48 @@ Overview
>>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>      :doc: Overview
>>   
>> +Job Object
>> +----------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Job Object
>> +
>> +Entity Object
>> +-------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Entity Object
>> +
>> +Hardware Fence Object
>> +---------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Hardware Fence Object
>> +
>> +Scheduler Fence Object
>> +----------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Scheduler Fence Object
>> +
>> +Scheduler and Run Queue Objects
>> +-------------------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Scheduler and Run Queue Objects
>> +
>>   Flow Control
>>   ------------
>>   
>>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>      :doc: Flow Control
>>   
>> +Error and Timeout handling
>> +--------------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Error and Timeout handling
>> +
>>   Scheduler Function References
>>   -----------------------------
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 044a8c4875ba..026123497b0e 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -24,28 +24,122 @@
>>   /**
>>    * DOC: Overview
>>    *
>> - * The GPU scheduler provides entities which allow userspace to push jobs
>> - * into software queues which are then scheduled on a hardware run queue.
>> - * The software queues have a priority among them. The scheduler selects the entities
>> - * from the run queue using a FIFO. The scheduler provides dependency handling
>> - * features among jobs. The driver is supposed to provide callback functions for
>> - * backend operations to the scheduler like submitting a job to hardware run queue,
>> - * returning the dependencies of a job etc.
>> - *
>> - * The organisation of the scheduler is the following:
>> - *
>> - * 1. Each hw run queue has one scheduler
>> - * 2. Each scheduler has multiple run queues with different priorities
>> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
>> - * 3. Each scheduler run queue has a queue of entities to schedule
>> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
>> - *    the hardware.
>> - *
>> - * The jobs in a entity are always scheduled in the order that they were pushed.
>> - *
>> - * Note that once a job was taken from the entities queue and pushed to the
>> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
>> - * through the jobs entity pointer.
>> + * The GPU scheduler implements some logic to decide which command submission
>> + * to push next to the hardware. Another major use case of the GPU scheduler
>> + * is to enforce correct driver behavior around those command submissions.
>> + * Because of this it's also used by drivers which don't need the actual
>> + * scheduling functionality.
> 
> This reads a bit like we're already right in the middle of the documentation.
> I'd propose to start with something like "The DRM GPU scheduler serves as a
> common component intended to help drivers to manage command submissions." And
> then mention the different solutions the scheduler provides, e.g. ordering of
> command submissions, dma-fence handling in the context of command submissions,
> etc.
> 
> Also, I think it would be good to give a rough overview of the topology of the
> scheduler's components. And since you already mention that the component is
> "also used by drivers which don't need the actual scheduling functionality", I'd
> also mention the special case of a single entity and a single run-queue per
> scheduler.
> 
>> + *
>> + * All callbacks the driver needs to implement are restricted by DMA-fence
>> + * signaling rules to guarantee deadlock free forward progress. This especially
>> + * means that for normal operation no memory can be allocated in a callback.
>> + * All memory which is needed for pushing the job to the hardware must be
>> + * allocated before arming a job. It also means that no locks can be taken
>> + * under which memory might be allocated as well.
> 
> I think that's good. Even though, with the recently merged workqueue patches,
> drivers can actually create a setup where the free_job callback isn't part of
> the fence signalling critical path anymore. But I agree with Sima that this is
> probably too error prone to give drivers ideas. So, this paragraph is probably
> good as it is. :-)
> 
>> + *
>> + * Memory which is optional to allocate, for example for device core dumping or
>> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate error
>> + * handling taking if that allocation fails. GFP_ATOMIC should only be used if
>> + * absolutely necessary since dipping into the special atomic reserves is
>> + * usually not justified for a GPU driver.
>> + */
>> +
>> +/**
>> + * DOC: Job Object
>> + *
>> + * The base job object contains submission dependencies in the form of DMA-fence
>> + * objects. Drivers can also implement an optional prepare_job callback which
>> + * returns additional dependencies as DMA-fence objects. It's important to note
>> + * that this callback can't allocate memory or grab locks under which memory is
>> + * allocated.
>> + *
>> + * Drivers should use this as base class for an object which contains the
>> + * necessary state to push the command submission to the hardware.
>> + *
>> + * The lifetime of the job object should at least be from pushing it into the
> 
> "should at least last from"
> 
>> + * scheduler until the scheduler notes through the free callback that a job
> 
> What about "until the free_job callback has been called and hence the scheduler
> does not require the job object anymore."?
> 
>> + * isn't needed any more. Drivers can of course keep their job object alive
>> + * longer than that, but that's outside of the scope of the scheduler
>> + * component. Job initialization is split into two parts, drm_sched_job_init()
>> + * and drm_sched_job_arm(). It's important to note that after arming a job
> 
> I suggest to add a brief comment on why job initialization is split up.
> 
>> + * drivers must follow the DMA-fence rules and can't easily allocate memory
>> + * or takes locks under which memory is allocated.
>> + */
>> +
>> +/**
>> + * DOC: Entity Object
>> + *
>> + * The entity object which is a container for jobs which should execute
>> + * sequentially. Drivers should create an entity for each individual context
>> + * they maintain for command submissions which can run in parallel.
>> + *
>> + * The lifetime of the entity should *not* exceed the lifetime of the
>> + * userspace process it was created for and drivers should call the
>> + * drm_sched_entity_flush() function from their file_operations.flush
>> + * callback. So it's possible that an entity object is not alive any
> 
> "Note that it is possible..."
> 
>> + * more while jobs from it are still running on the hardware.
> 
> "while jobs previously fetched from this entity are still..."
> 
>> + *
>> + * Background is that for compatibility reasons with existing
>> + * userspace all results of a command submission should become visible
>> + * externally even after after a process exits. This is normal POSIX behavior
>> + * for I/O operations.
>> + *
>> + * The problem with this approach is that GPU submissions contain executable
>> + * shaders enabling processes to evade their termination by offloading work to
>> + * the GPU. So when a process is terminated with a SIGKILL the entity object
>> + * makes sure that jobs are freed without running them while still maintaining
>> + * correct sequential order for signaling fences.
>> + */
>> +
>> +/**
>> + * DOC: Hardware Fence Object
>> + *
>> + * The hardware fence object is a DMA-fence provided by the driver as result of
>> + * running jobs. Drivers need to make sure that the normal DMA-fence semantics
>> + * are followed for this object. It's important to note that the memory for
>> + * this object can *not* be allocated in the run_job callback since that would
>> + * violate the requirements for the DMA-fence implementation. The scheduler
>> + * maintains a timeout handler which triggers if this fence doesn't signal in
>> + * a configurable time frame.
>> + *
>> + * The lifetime of this object follows DMA-fence ref-counting rules, the
>> + * scheduler takes ownership of the reference returned by the driver and drops
>> + * it when it's not needed any more.
>> + */
>> +
>> +/**
>> + * DOC: Scheduler Fence Object
>> + *
>> + * The scheduler fence object which encapsulates the whole time from pushing
>> + * the job into the scheduler until the hardware has finished processing it.
>> + * This is internally managed by the scheduler, but drivers can grab additional
>> + * reference to it after arming a job. The implementation provides DMA-fence
>> + * interfaces for signaling both scheduling of a command submission as well as
>> + * finishing of processing.
>> + *
>> + * The lifetime of this object also follows normal DMA-fence ref-counting
>> + * rules. The finished fence is the one normally exposed outside of the
>> + * scheduler, but the driver can grab references to both the scheduled as well
>> + * as the finished fence when needed for pipe-lining optimizations.
>> + */
>> +
>> +/**
>> + * DOC: Scheduler and Run Queue Objects
>> + *
>> + * The scheduler object itself does the actual work of selecting a job and
>> + * pushing it to the hardware. Both FIFO and RR selection algorithm are
>> + * supported, but FIFO is preferred for many use cases.
> 
> I suggest to name the use cases FIFO scheduling is preferred for and why.
> 
> If, instead, it's just a general recommendation, I also suggest to explain why.
> 
>> + *
>> + * The lifetime of the scheduler is managed by the driver using it. Before
>> + * destroying the scheduler the driver must ensure that all hardware processing
>> + * involving this scheduler object has finished by calling for example
>> + * disable_irq(). It is *not* sufficient to wait for the hardware fence here
>> + * since this doesn't guarantee that all callback processing has finished.
> 
> This is the part I'm most concerned about, since I feel like we leave drivers
> "up in the air" entirely. Hence, I think here we need to be more verbose and
> detailed about the options drivers have to ensure that.
> 
> For instance, let's assume we have the single-entity-per-scheduler topology
> because the driver only uses the GPU scheduler to feed a firmware scheduler with
> dynamically allocated ring buffers.
> 
> In this case the entity, scheduler and ring buffer are bound to the lifetime of
> a userspace process.
> 
> What do we expect the driver to do if the userspace process is killed? As you
> mentioned, only waiting for the ring to be idle (which implies all HW fences
> are signalled) is not enough. This doesn't guarantee all the free_job()
> callbacks have been called yet and hence stopping the scheduler before the
> pending_list is actually empty would leak the memory of the jobs on the
> pending_list waiting to be freed.
> 
> I already brought this up when we were discussing Matt's Xe inspired scheduler
> patch series and it seems there was no interest to provide drivers with some
> common mechanism that gurantees that the pending_list is empty. Hence, I really
> think we should at least give recommendations how drivers should deal with that.
> 
>> + *
>> + * The run queue object is a container of entities for a certain priority
>> + * level. This object is internally managed by the scheduler and drivers
>> + * shouldn't touch them directly. The lifetime of run queues are bound to the
>> + * schedulers lifetime.
> 
> I think we should also mention that we support a variable number of run-queues
> up to DRM_SCHED_PRIORITY_COUNT. Also there is this weird restriction on which
> priorities a driver can use when choosing less than DRM_SCHED_PRIORITY_COUNT
> run-queues.
> 
> For instance, initializing the scheduler with a single run-queue, requires the
> corresponding entities to pick DRM_SCHED_PRIORITY_MIN, otherwise we'll just
> fault since the priority is also used as an array index into sched->sched_rq[].
> 
>>    */
>>   
>>   /**
>> @@ -72,6 +166,42 @@
>>    * limit.
>>    */
>>   
>> +/**
>> + * DOC: Error and Timeout handling
>> + *
>> + * Errors schould be signaled by using dma_fence_set_error() on the hardware
>> + * fence object before signaling it. Errors are then bubbled up from the
>> + * hardware fence to the scheduler fence.
>> + *
>> + * The entity allows querying errors on the last run submission using the
>> + * drm_sched_entity_error() function which can be used to cancel queued
>> + * submissions in the run_job callback as well as preventing pushing further
>> + * ones into the entity in the drivers submission function.
>> + *
>> + * When the hardware fence fails to signal in a configurable amount of time the
>> + * timedout_job callback is issued. The driver should then follow the procedure
>> + * described on the &struct drm_sched_backend_ops.timedout_job callback (TODO:
>> + * The timeout handler should probably switch to using the hardware fence as
>> + * parameter instead of the job. Otherwise the handling will always race
>> + * between timing out and signaling the fence).
>> + *
>> + * The scheduler also used to provided functionality for re-submitting jobs
>> + * with replacing the hardware fence during reset handling. This functionality
>> + * is now marked as deprecated. This has proven to be fundamentally racy and
>> + * not compatible with DMA-fence rules and shouldn't be used in any new code.
>> + *
>> + * Additional there is the drm_sched_increase_karma() function which tries to
>   
> "Additionally"
> 
>> + * find the entity which submitted a job and increases it's 'karma'
>> + * atomic variable to prevent re-submitting jobs from this entity. This has
>> + * quite some overhead and re-submitting jobs is now marked as deprecated. So
>> + * using this function is rather discouraged.
>> + *
>> + * Drivers can still re-create the GPU state should it be lost during timeout
>> + * handling when they can guarantee that forward progress is made and this
>> + * doesn't cause another timeout. But this is strongly hardware specific and
>> + * out of the scope of the general GPU scheduler.
>> + */
>> +
>>   #include <linux/wait.h>
>>   #include <linux/sched.h>
>>   #include <linux/completion.h>
>> -- 
>> 2.34.1
>>

