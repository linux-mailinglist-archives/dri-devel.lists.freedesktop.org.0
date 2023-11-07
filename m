Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B57E47A1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 18:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6DE10E635;
	Tue,  7 Nov 2023 17:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9299B10E635
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699379633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGpL9NuEv6Ciw+zA4Ck7tukYdeQ54xRJGOuRiC3a+2o=;
 b=LyyDKcj2DYMlk6m8do+I9fIKmizTtc3WlYFyTWbpAQIk2YFVzvdlNpXLemQTQl2PdibPZz
 amBggpu3U+u7dIvB/152ESyRujaK4igV6RLxzHWAQ37g+3/Zf4j0g5qrYYUE0ju0/mpJqL
 xHrAvwocUBRrJ9bAvjpjAM12a2buB7Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-qMR_don9OwGSTVcrEIgidA-1; Tue, 07 Nov 2023 12:53:48 -0500
X-MC-Unique: qMR_don9OwGSTVcrEIgidA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-543f45ab457so4199089a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 09:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699379627; x=1699984427;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jGpL9NuEv6Ciw+zA4Ck7tukYdeQ54xRJGOuRiC3a+2o=;
 b=t70Md5v8S3hICmBkXCcsNNGZK+fVoTH0MgbiTC9DSW/oiPPJYLL++h0cfSo1YDetXi
 8J9VJuh1PibsBhgS4zQwoL9vSx/FvYyUbYGCRQEgkgDBOo2pJ+VxyuvTENW54RHwXcrC
 DvrVtkJSf8l/iaHTggUcxc2PBVQl909RviGS/JRJEqqXboHkHJfkv56ecyXCzgsP8H21
 JfqW4xm3JuZwngp0rCLHjMI4XTtOP91KXZY2ct29VGYpVpi3w2VHc+y4Y2hC3Jxg0N1S
 IhRbNhMDVevjVwts8JCZANvefjFcfNmQfORGsdAz5UdgHNgLS4Zt46zaeNX9CXKBT/Rg
 HDeA==
X-Gm-Message-State: AOJu0Yy//ESdJJeZlD4Wt+35DVhZWbKgvBh02xeA1IYWieIapq8zet7/
 YF4+Bel0prLQ9EYpnKyQH8wzvNZ2v4n1pUb3qzEi+YISMPXIwCptwbysZokkZlNOF+v9DT/nznW
 0o4c4zfEWDVcTN1U+d26WnFfh9oAZ
X-Received: by 2002:a17:906:730c:b0:9be:3c7e:7f38 with SMTP id
 di12-20020a170906730c00b009be3c7e7f38mr17886907ejc.10.1699379626850; 
 Tue, 07 Nov 2023 09:53:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuR3jCJ3lqgCr0hx0UTTJXLmRrXvqpbTQxvwLhIwrrbH950/Y9hi2jZCX17YLb2W57B0mmNA==
X-Received: by 2002:a17:906:730c:b0:9be:3c7e:7f38 with SMTP id
 di12-20020a170906730c00b009be3c7e7f38mr17886889ejc.10.1699379626497; 
 Tue, 07 Nov 2023 09:53:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a170906410b00b00992f2befcbcsm1280911ejk.180.2023.11.07.09.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 09:53:46 -0800 (PST)
Message-ID: <08dd5af8-a631-49d4-b0bd-13500d55198b@redhat.com>
Date: Tue, 7 Nov 2023 18:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
To: Luben Tuikov <ltuikov89@gmail.com>, tvrtko.ursulin@linux.intel.com
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231107041020.10035-2-ltuikov89@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ltuikov@yahoo.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 05:10, Luben Tuikov wrote:
> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
> it do just that, schedule the work item for execution.
> 
> The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
> to determine if the scheduler has an entity ready in one of its run-queues,
> and in the case of the Round-Robin (RR) scheduling, the function
> drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
> which is ready, sets up the run-queue and completion and returns that
> entity. The FIFO scheduling algorithm is unaffected.
> 
> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
> in the case of RR scheduling, that would result in drm_sched_select_entity()
> having been called twice, which may result in skipping a ready entity if more
> than one entity is ready. This commit fixes this by eliminating the call to
> drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
> in drm_sched_run_job_work().
> 
> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>      Add fixes-tag. (Tvrtko)
> 
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 27843e37d9b769..cd0dc3f81d05f0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   }
>   
>   /**
> - * __drm_sched_run_job_queue - enqueue run-job work
> + * drm_sched_run_job_queue - enqueue run-job work
>    * @sched: scheduler instance
>    */
> -static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   {
>   	if (!READ_ONCE(sched->pause_submit))
>   		queue_work(sched->submit_wq, &sched->work_run_job);
> @@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>   void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>   {
>   	if (drm_sched_can_queue(sched))
> -		__drm_sched_run_job_queue(sched);
> +		drm_sched_run_job_queue(sched);
>   }
>   
>   /**
> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   }
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
> -/**
> - * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> -{
> -	if (drm_sched_select_entity(sched))
> -		__drm_sched_run_job_queue(sched);
> -}
> -
>   /**
>    * drm_sched_free_job_work - worker to call free_job
>    *
> 
> base-commit: 27d9620e9a9a6bc27a646b464b85860d91e21af3

