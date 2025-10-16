Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C109BE22B6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2AC10E2E3;
	Thu, 16 Oct 2025 08:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="voc6cH1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9548810E2E3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:36:26 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so304933f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760603785; x=1761208585;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FF7hoCmX451mcWxQBup4CMKMPbyueFdMmoO/bureOuA=;
 b=voc6cH1ardI73CMxDsTMj1T7SrGWO9SYJYS7jgP9KEmnpM6GVASoqfurExT/9bM8xU
 G9Kqn3tF1sGJTqazoPjL3At207NOzdWyUrLOuijwQaguxD1bCu1SujRR6JUi9dxGYHmE
 R3676JRs1IFu6YsBZm16La5xe0hJ7Sfy2f+12fpB7YNiz1nG3i5sX7BM+/laJ+iTPAjr
 GT0pdapBJlQe3xHs1tTPNzRD3dgTjSA6a3kO24aStrOkNoUSS/Slp30gb7+clUbMA5a1
 VQCnzLxtaputkxF0DbK8x+deGUQ6rDG8DRqM8/IhhepPPVqSZy2E4BtXm6nCVR7+KaLv
 omwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760603785; x=1761208585;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FF7hoCmX451mcWxQBup4CMKMPbyueFdMmoO/bureOuA=;
 b=APxPOQ7j2Ov30idVro0WIclHlY0Liqykc8HJ/Uqevp2FHuBajLHxMADgekApuc766i
 8aG8q1avULiTB6+lVYk0A5hh8SM+f7PQpcqBciE5StjQ+L3xs9rpcA7OZAlDv/bu8ySm
 wHKxvbQ1EuZV1mg3GFtNa2omfKORqVLXV7nIlMVP3BdNTUVd0fRsPJyL519EFxU/biBJ
 iBWp26uYEvZBBHdBuefALPAPyXAerlmsSmeJL84f6LKdSab6ptHIuAyGBHLjD6s1xWN3
 PJ6YL+couh0FPJIKBOyHS5z3xAi3cJLJIJvNb+13n1wkpDXgEbmwrjd0rrE0wl22JhDB
 be6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHgUhpsM1F9+KtYwnoX+HjqKYT9ddbC0+0qq+CRxpoHqRA2cpYX9lpbAHh+yU92AuqiypaJstexys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBvC5JmELoJdwwtAgwmpBa0d1R5ntfo+t1+C2fLjDCqqaODpkJ
 5DtaCAQGJhzn8fBJ8IDsR4pbjJ2m/On+/6Qxj+YNx7YeFEICmoxKEJt7jJt66tUY1OE=
X-Gm-Gg: ASbGncvhDUJZayf2fHK6MQO2Rtp69OdEWrx2AlLr1wmd1Ig6X2p+ZScTcyhCQYPc0uJ
 nskBMlotlaob7vQ/cPawoRAmOy8LKwF0O+HvoLK3RTEzChLc8W22ViXeJgk+jEXUip5EAWEmRi2
 wdqCg2fLUHChIAoxJ0TCFZEZz4/0D2nvtBiPEPnxLgox/HpXhZEgTEjdzqJRbL5Wr2LaQ4/EbSo
 8aPWrHvaH+sdgPcwt/BL4tFQ2zD5nX1gIdCycEPJAqpKrjiXkB2Ig7h+dL+qHTcTP26yvyt+tr0
 6R7VT81SL2QybzU9VdH3Fl5EL+q0uVsZ2VrkD2AYc6ul/R0uczIndfpO3bvFn6ExCGVYEIw5o69
 TP2x2zi+9zuCeTvmRE/6TW7AtH+XTlWBHrdbzzjXbiiS/FqApIRuWZtC50umezFW6/VvG4e6vbY
 1VyXUT0hCw0UafAiXmW4EOFtmvYQ==
X-Google-Smtp-Source: AGHT+IEs/LRsCNX7AT63lV49eEk2pRqSubu0BBirtdOaMT8xK8HJyJr3+A2q2KvX7h7N7QzIN6zxlA==
X-Received: by 2002:a05:6000:4308:b0:427:77:b8e1 with SMTP id
 ffacd0b85a97d-4270077bd8bmr717282f8f.61.1760603784608; 
 Thu, 16 Oct 2025 01:36:24 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5825aasm32816914f8f.14.2025.10.16.01.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 01:36:24 -0700 (PDT)
Message-ID: <07fa5702-829a-4927-9a88-3623500921ed@ursulin.net>
Date: Thu, 16 Oct 2025 09:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.brost@intel.com, dakr@kernel.org, phasta@kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251014142430.2470-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251014142430.2470-1-christian.koenig@amd.com>
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


On 14/10/2025 15:24, Christian König wrote:
> From: David Rosca <david.rosca@amd.com>
> 
> The DRM scheduler tracks who last uses an entity and when that process
> is killed blocks all further submissions to that entity.
> 
> The problem is that we didn't tracked who initialy created an entity, so
> when an process accidentially leaked its file descriptor to a child and
> that child got killed we killed the parents entities.
> 
> Avoid that and instead initialize the entities last user on entity
> creation.
> 
> Signed-off-by: David Rosca <david.rosca@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org

Fixes: 43bce41cf48e ("drm/scheduler: only kill entity if last user is 
killed v2")
Cc: <stable@vger.kernel.org> # v4.19+

Up to back there perhaps?

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 5a4697f636f2..3e2f83dc3f24 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	entity->guilty = guilty;
>   	entity->num_sched_list = num_sched_list;
>   	entity->priority = priority;
> +	entity->last_user = current->group_leader;
>   	/*
>   	 * It's perfectly valid to initialize an entity without having a valid
>   	 * scheduler attached. It's just not valid to use the scheduler before it
> @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>   
>   	/* For a killed process disallow further enqueueing of jobs. */
>   	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
> -	if ((!last_user || last_user == current->group_leader) &&
> +	if (last_user == current->group_leader &&
>   	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>   		drm_sched_entity_kill(entity);
>   

Hm, but is it not just a band aid for a specific usage pattern?

Ie. the exiting process can still kill the shared entity, just needs to 
be the last one using it. So for an use case where two threads might be 
legitimately sharing it will be random chance whether one exiting thread 
kills the shared entity or not.

Not saying I know of such patterns, but I am also not sure at the 
scheduler level it should be precluded. Neither that defining sensible 
and compatible semantics is easy at this point.

So if what I write is correct perhaps just explain it in the commit 
message. Or even a code comment.

Regards,

Tvrtko

