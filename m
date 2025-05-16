Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583ADAB9704
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF4E10E9D6;
	Fri, 16 May 2025 07:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="CgXcYEZX";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="cr+6076D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934B410E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1747382182;
 bh=YPy+tEZL6apKgfvAMCRSsSk
 8zKBxHWC7t2m1Vfn3jPs=; b=CgXcYEZX8hN/Q2e8M/80XSvSboXrdC5slsIEaxO8MEjbT6Mt06
 NdM43xSHHG2AVxLNrAJ4Z/rw82f8ujBNTnDLilcOjG59X7I7rVHF//JMltYERkh69ySJFndsqSx
 2HhmYqvQC7SUV5omtgvmMwLo0ARUefbpfAS/r+YYeQl/GundzUUsICBAzgrplwocwNIoenYkdiW
 goHq/TnW15uWBkrP31QDMpLX2C8+q4Gm30YK12rfwlU0W2q4vIPu1XLqmwTw79bf5dWhsKd/qJi
 RepcAKpFb9Gsi4geYsjwp19Die7hbGY4GrXm9agLG5xJ3BpvoG7HBdb1iKUDvsec6cQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1747382182; bh=YPy+tEZL6apKgfvAMCRSsSk
 8zKBxHWC7t2m1Vfn3jPs=; b=cr+6076Dkxypklpp92ebvSZPCsy2GPT7BKIzpqigg57qRQwr/u
 kl/P0+TezIcHj+VIk3KIKeqKsYydjFqRI+Aw==;
Message-ID: <7f04847e-9549-47cc-9b61-7b32df24ef8e@damsy.net>
Date: Fri, 16 May 2025 09:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] drm/doc: document some tracepoints as uAPI
To: phasta@kernel.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-10-pierre-eric.pelloux-prayer@amd.com>
 <27825c551adeda28f4b329f44c316ad2ab67fa5d.camel@mailbox.org>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <27825c551adeda28f4b329f44c316ad2ab67fa5d.camel@mailbox.org>
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

Hi,

Le 14/05/2025 à 14:53, Philipp Stanner a écrit :
> On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
>> This commit adds a document section in drm-uapi.rst about
>> tracepoints,
>> and mark the events gpu_scheduler_trace.h as stable uAPI.
>>
>> The goal is to explicitly state that tools can rely on the fields,
>> formats and semantics of these events.
>>
>> Acked-by: Lucas Stach <l.stach@pengutronix.de>
>> Acked-by: Maíra Canal <mcanal@igalia.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer
>> <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst                | 19
>> +++++++++++++++++++
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 19
>> +++++++++++++++++++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-
>> uapi.rst
>> index 69f72e71a96e..4863a4deb0ee 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -693,3 +693,22 @@ dma-buf interoperability
>>   
>>   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst
>> for
>>   information on how dma-buf is integrated and exposed within DRM.
>> +
>> +
>> +Trace events
>> +============
>> +
>> +See Documentation/trace/tracepoints.rst for information about using
>> +Linux Kernel Tracepoints.
>> +In the DRM subsystem, some events are considered stable uAPI to
>> avoid
>> +breaking tools (e.g.: GPUVis, umr) relying on them. Stable means
>> that fields
>> +cannot be removed, nor their formatting updated. Adding new fields
>> is
>> +possible, under the normal uAPI requirements.
>> +
>> +Stable uAPI events
>> +------------------
>> +
>> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>> +
>> +.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +   :doc: uAPI trace events
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 781b20349389..7e840d08ef39 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -32,6 +32,25 @@
>>   #define TRACE_SYSTEM gpu_scheduler
>>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>>   
>> +/**
>> + * DOC: uAPI trace events
>> + *
>> + * ``drm_sched_job_queue``, ``drm_sched_job_run``,
>> ``drm_sched_job_add_dep``,
>> + * ``drm_sched_job_done`` and ``drm_sched_job_unschedulable`` are
>> considered
>> + * stable uAPI.
>> + *
>> + * Common trace events attributes:
>> + *
>> + * * ``dev``   - the dev_name() of the device running the job.
>> + *
>> + * * ``ring``  - the hardware ring running the job. Together with
>> ``dev`` it
>> + *   uniquely identifies where the job is going to be executed.
>> + *
>> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
>> + *   &drm_sched_fence.finished
>> + *
>> + */
> 
> For my understanding, why do you use the double apostrophes here?

To get similar formatting to function arguments and make the output a bit nicer to read.

> 
> Also, the linking for the docu afair here two requires you to write
> 
> &struct dma_fence.seqno
> 
> If I am not mistaken
> 
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#highlights-and-cross-references

Indeed, thanks. I fixed this.

Pierre-Eric

> 
> 
> P.
> 
>> +
>>   DECLARE_EVENT_CLASS(drm_sched_job,
>>   	    TP_PROTO(struct drm_sched_job *sched_job, struct
>> drm_sched_entity *entity),
>>   	    TP_ARGS(sched_job, entity),
