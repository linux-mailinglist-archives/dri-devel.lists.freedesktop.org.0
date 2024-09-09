Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666E9716EB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB53510E379;
	Mon,  9 Sep 2024 11:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R5vQR9q/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDFE10E377;
 Mon,  9 Sep 2024 11:31:42 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so14122785e9.0; 
 Mon, 09 Sep 2024 04:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725881500; x=1726486300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uSQ8DnlWBkAu7rryVAU68vxkUdLhsbCL/EHImXGoOho=;
 b=R5vQR9q/z312hvqp8M/Y0KWYi4LhH9srzhxMQEvh2AM69pgIyH05810pY6QAiDfr0y
 jB1PeHH/Bnf8vZAvt4RAzLXp5cU3mFEt3dVuD10ksK11PlLkpTdLxsBX3k1Q32Mcossr
 4wuneGMt2XfOKxykKF7G0gkIVheKTop8F7Lf3Scm6MUAiwk6Kr+K5HF5hr0ftIOYm80v
 yrfTk6GnzdrN/BMeQxXbFJxCPdTnuIIfHPjOqrSbqGUGP9cexBuZ83V1vAna3mtYvz17
 +Y+NC47yGC2yLNJVtk5huUVt6VgF1Sn+J0KxeLLQWzIbOD9heULAMeoSf5AuJCh4vtXe
 IiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725881500; x=1726486300;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uSQ8DnlWBkAu7rryVAU68vxkUdLhsbCL/EHImXGoOho=;
 b=m9IC8829IfJrtl/taefrKoYYB5xnLdpeq/+K3eMOTXUaPoA8AT2tHZ4mPxWKUSiHeR
 fIXyVdtz/D6PjywM0kViwBooo2K+19zNSKthRXPVKXwnA7pfxeR+WHZ5l47leH2LQKEq
 HzJOnUjLp747r/vQ8rZr1e2ZuefU4goF/wiaj86w+tCIKkki70+9iLEFk1bDtIMy57vL
 QkcYKLAfXigu5eNIexJwJSds6lI5/+tMcovXCy4+sqMbYoFqBE1dg7/ElRLC08Fh7vth
 rINqoJyr3A/WQqZAaxHslPfuMhRgFH+m9RO8r5hqp/llnFtz/NTlWvEeahj440DHHVPB
 7u2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR19jRwj/zOD0cy6JSqajQtDEn3ZK1dkTG9ssDTE4MJjsNdgldw/hleYvKa0mzM+UExN+ToD/zLXhe@lists.freedesktop.org,
 AJvYcCXjxTztuYekNqrBQ7NEZFX4MkYjLg1ArAEyi2N9UA9H69BnLxi3yrQ0HTXhsyEQE9ohagwKEHnh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGjonSJ9TtqmIn3VI12rvz3W0WoGA5G6gCNg8RyY464MIYN6ch
 pWQIvqjha3uJeD2oi9UqlHJYqS6D9yaI42bI+IAzo+QCPAgW+I8I
X-Google-Smtp-Source: AGHT+IF5JWMxmrkXMHQ1hLF1Imsbf560J8naprq0JYGcLAYu7eBg/ZJazjze3qFIZW3QP01yw4XYug==
X-Received: by 2002:a05:600c:3ba7:b0:42c:ba1f:543e with SMTP id
 5b1f17b1804b1-42cba1f5946mr9572135e9.26.1725881499523; 
 Mon, 09 Sep 2024 04:31:39 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895676117sm5795161f8f.60.2024.09.09.04.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:31:39 -0700 (PDT)
Message-ID: <9f2bd368-1d73-4d87-9b13-c90cd5a2cbbe@gmail.com>
Date: Mon, 9 Sep 2024 13:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/4] drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-3-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240906180618.12180-3-tursulin@igalia.com>
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

Am 06.09.24 um 20:06 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Since drm_sched_entity_modify_sched() can modify the entities run queue
> lets make sure to only derefernce the pointer once so both adding and
> waking up are guaranteed to be consistent.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify sched list")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.7+
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index ae8be30472cd..62b07ef7630a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -599,6 +599,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   	/* first job wakes up scheduler */
>   	if (first) {
> +		struct drm_sched_rq *rq;
> +

I think we should go a step further and keep the scheduler to wake up 
and not the rq.

Regards,
Christian.

>   		/* Add the entity to the run queue */
>   		spin_lock(&entity->rq_lock);
>   		if (entity->stopped) {
> @@ -608,13 +610,15 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   			return;
>   		}
>   
> -		drm_sched_rq_add_entity(entity->rq, entity);
> +		rq = entity->rq;
> +
> +		drm_sched_rq_add_entity(rq, entity);
>   		spin_unlock(&entity->rq_lock);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>   			drm_sched_rq_update_fifo(entity, submit_ts);
>   
> -		drm_sched_wakeup(entity->rq->sched, entity);
> +		drm_sched_wakeup(rq->sched, entity);
>   	}
>   }
>   EXPORT_SYMBOL(drm_sched_entity_push_job);

