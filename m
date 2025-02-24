Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B72A423C2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058AB10E3F8;
	Mon, 24 Feb 2025 14:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WUaiZIja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E3310E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:48:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87B7B44441;
 Mon, 24 Feb 2025 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740408510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NS2qwoJvJ8qoRdzcQTSlvegG8AHJ/S91xM5zgMD671c=;
 b=WUaiZIjazk95kA1adjvGhpb3Zo1r2Ik+kaXtg4prIl34mO3Nt18uzclf0pX1tKLFFTrdHH
 LPjH9YCddRknIP0azmfkW49ngkx7wxADPLkMl6Zfm1qxaiRSMOPZnz1CYoKNqEGZtZNZ1v
 G/fjJaUYCGX/gPQZ4JlFuqeR/5D1AW8VkUoIf1mZ+uWV8bLTfCeHkU2ktCNt9V8IUizt6G
 7IQ1DCdybTBrIvqnQyWNigP1dpXp8tq/mfaOl7nGQo0KUvB0n1NEXkc28xV3tg3Poj218w
 AVFz7tNlNpAQ2Fajr8WHQsYHGne1YywHj86Wm0tYR0CMD8SPL0szP+mn+kwPBA==
Message-ID: <c259c65d-8124-451b-b741-b288fc30663d@bootlin.com>
Date: Mon, 24 Feb 2025 15:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 3/5] drm/sched: stop passing non struct drm_device to
 drm_err() and friends
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
 <fe441dd1469d2b03e6b2ff247078bdde2011c6e3.1737644530.git.jani.nikula@intel.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <fe441dd1469d2b03e6b2ff247078bdde2011c6e3.1737644530.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejledtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfdtiefgheffudeuvdekfefgvdduudfgffetteffvdetfffgjeevudfggfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehinhhtvghlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvl
 heslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepmhgrthhthhgvfidrsghrohhsthesihhnthgvlhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhhrghsthgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtkhhovghnihhgrdhlvghitghhthiiuhhmvghrkhgvnhesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 23/01/2025 à 16:09, Jani Nikula a écrit :
> The expectation is that the struct drm_device based logging helpers get
> passed an actual struct drm_device pointer rather than some random
> struct pointer where you can dereference the ->dev member.
> 
> Convert drm_err(sched, ...) to dev_err(sched->dev, ...) and
> similar. This matches current usage, as struct drm_device is not
> available, but drops "[drm]" or "[drm] *ERROR*" prefix from logging.
> 
> Unfortunately, there's no dev_WARN_ON(), so the conversion is not
> exactly the same.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>   drivers/gpu/drm/scheduler/sched_main.c   | 20 +++++++++++---------
>   2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 69bcf0e99d57..e29af71d4b5c 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -92,7 +92,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   		 * the lowest priority available.
>   		 */
>   		if (entity->priority >= sched_list[0]->num_rqs) {
> -			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
> +			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_rqs:%u\n",
>   				entity->priority, sched_list[0]->num_rqs);
>   			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
>   						 (s32) DRM_SCHED_PRIORITY_KERNEL);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a48be16ab84f..d1c1f22fd1db 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>   {
>   	u32 credits;
>   
> -	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
> -					      atomic_read(&sched->credit_count),
> -					      &credits));
> +	WARN_ON(check_sub_overflow(sched->credit_limit,
> +				   atomic_read(&sched->credit_count),
> +				   &credits));
>   
>   	return credits;
>   }
> @@ -130,9 +130,11 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>   	/* If a job exceeds the credit limit, truncate it to the credit limit
>   	 * itself to guarantee forward progress.
>   	 */
> -	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
> -		     "Jobs may not exceed the credit limit, truncate.\n"))
> +	if (s_job->credits > sched->credit_limit) {
> +		dev_WARN(sched->dev,
> +			 "Jobs may not exceed the credit limit, truncate.\n");
>   		s_job->credits = sched->credit_limit;
> +	}
>   
>   	return drm_sched_available_credits(sched) >= s_job->credits;
>   }
> @@ -790,7 +792,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		 * or worse--a blank screen--leave a trail in the
>   		 * logs, so this can be debugged easier.
>   		 */
> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
> +		dev_err(job->sched->dev, "%s: entity has no rq!\n", __func__);
>   		return -ENOENT;
>   	}
>   
> @@ -1280,7 +1282,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>   		/* This is a gross violation--tell drivers what the  problem is.
>   		 */
> -		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> +		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
>   			__func__);
>   		return -EINVAL;
>   	} else if (sched->sched_rq) {
> @@ -1288,7 +1290,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		 * fine-tune their DRM calling order, and return all
>   		 * is good.
>   		 */
> -		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
> +		dev_warn(sched->dev, "%s: scheduler already initialized!\n", __func__);
>   		return 0;
>   	}
>   
> @@ -1343,7 +1345,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   Out_check_own:
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
> -	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
> +	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
>   	return -ENOMEM;
>   }
>   EXPORT_SYMBOL(drm_sched_init);

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


