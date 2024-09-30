Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C198A4F4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C5D10E4B7;
	Mon, 30 Sep 2024 13:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="HwgPdfV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39C10E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:28:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37cca239886so2516828f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1727702883; x=1728307683;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HtAJ1L+E1hJ3bscjV6SDP0/iFQswRqQhFE1mXcnx6wk=;
 b=HwgPdfV2Dfq4FwE4qfyaPCQ/pxJPtmg3p1HZmKJ63KZjmlLMlgxFHAtY0nMHKxDKwl
 OThJfO9aHDsgP6L05UVgNaqxSJmDH6GjYJCokaNQF2C8RUaqOw3uXvIh0LQVuTAMSAIM
 h/skMkyFFK0tpho0NQJXZBxwIr1vpJvr1byVdfcqmn8gczBmoUVJSyawic7JiM/Ri+2V
 X89oFRBeuXswU0VunHlBeJSZa56EqjpEOCB2Z3v029DNGUwzr0LZ9SkPV2norjYQpFAs
 UMm2xT6X1Qn14mVgodPGus+SJqTqSC+R4zZPzgFZ94rMo9K6XObMzA/wLvomacSgDslZ
 2CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727702883; x=1728307683;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HtAJ1L+E1hJ3bscjV6SDP0/iFQswRqQhFE1mXcnx6wk=;
 b=lieXZ49bqVQH6manpMMwsHcJlo9Pu0VwBigHn4UY88ReA/B7PZ8w0lYnGXKn4/y3OD
 hJPcSEW3l+SxZvDZXXESGfx4zLso2wdu7456lI7VSKZOwJo15Vqn1j7uoY2/vsVnsTei
 RLElQrK2w3SgjK6CgBOIfJKJ7N6k4AyFu4udBU+bvp2iBAJB3LOWHnuDyHzVv9RM6LuT
 5Lmz6qddkUFK0Ym607BPnPAm3ETsXmLV5MUTfGPCzFu8qxkKwJ+0PsMMIA385y/UKNqc
 ymlSJh5NRHkI/CYDCjJiBRdYYM9YhjTjkwwyePn23al96cIZBWon3qhzEwRGJYS66F5j
 Y27w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWacG7GMLH9UILLFRFynzoz3mCv6Ol3GSDVYZiIqSB5DiUBK4JR6/Ri/lJi3AFaO1O8nC2LTjKlBR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwzi02SRLcsX07A1s2lY2CdFQn2JFaOtUKJOj8MHvjy1VX2Kbv
 jMRQhQH3PEGT/igAiXJ5deSCTy/HXrDLR8X9EIM6m4FN/ac/DRQrEuGEbuy19Pl5TNBNkdqHDgB
 l
X-Google-Smtp-Source: AGHT+IE6maxGl4FyzySdOpQwy+SQDZwICBkf4UrY4Qh9xDVkMrehBPf5schRV8IWUYl0Zq6aqCZ6lA==
X-Received: by 2002:adf:eac5:0:b0:374:ca43:cda5 with SMTP id
 ffacd0b85a97d-37cd59e250amr7217869f8f.0.1727702883341; 
 Mon, 30 Sep 2024 06:28:03 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd57570acsm9013184f8f.109.2024.09.30.06.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 06:28:02 -0700 (PDT)
Message-ID: <452f9c0d-d397-48c3-ab7f-1912b9e57fb1@ursulin.net>
Date: Mon, 30 Sep 2024 14:28:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: revert "Always increment correct scheduler
 score"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 tvrtko.ursulin@igalia.com, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240930131451.536150-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240930131451.536150-1-christian.koenig@amd.com>
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


On 30/09/2024 14:14, Christian König wrote:
> This reverts commit 087913e0ba2b3b9d7ccbafb2acf5dab9e35ae1d5.
> 
> It turned out that the original code was correct since the rq can only
> change when there is no armed job for an entity.
> 
> This change here broke the logic since we only incremented the counter
> for the first job, so revert it.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index b2cf3e0c1838..a75eede8bf8d 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -586,6 +586,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	ktime_t submit_ts;
>   
>   	trace_drm_sched_job(sched_job, entity);
> +	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   
>   	/*
> @@ -613,7 +614,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   		rq = entity->rq;
>   		sched = rq->sched;
>   
> -		atomic_inc(sched->score);
>   		drm_sched_rq_add_entity(rq, entity);
>   		spin_unlock(&entity->rq_lock);
>   

This was definitely broken so revert is the right thing, thank you.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
