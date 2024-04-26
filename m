Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279148B3063
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 08:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2131121C9;
	Fri, 26 Apr 2024 06:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LYh3883W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F671121C4;
 Fri, 26 Apr 2024 06:27:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41b869326daso2112625e9.0; 
 Thu, 25 Apr 2024 23:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714112836; x=1714717636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KIM9Jp8l8EHcEEIc5gsBP2lkn6c2G9W8perp3u/3KbI=;
 b=LYh3883Wx+wJC/Y5H1uouFdpJVCTTlwTXq7A9SVqzSqF8syNNjFIiNyIULEDHDlpSw
 yQIM5cAKJcZQNe+/i/KQTODQ4w5wmoo5yN6PbvyRmQQxs814LqMT06BTqs7o+EMrn/Tt
 FKiaNmMc+TLU4fU78Ox8wC36S+k3O60EgfX2PTA8IfXCu20tUNfV3G1UKMKYNTfxsIa9
 e21yaTylNX+JcddVH/WjXSmfG37X5HJs1U7u4q0un3ItAnqIJ3WbpUnatTJgFNIk35DZ
 OdM5ZXxeZC048ysSMVkerSopJAdxTIwNrH4nPZsHOOUfBiYUwjSflOYF2GP52cpG2BoA
 gYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714112836; x=1714717636;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KIM9Jp8l8EHcEEIc5gsBP2lkn6c2G9W8perp3u/3KbI=;
 b=bQcL+iKDNHLB2OUOWWsGDpDTBAS150a8j/Zwn/cCRxhU420BiAXumWH+AjDqhVxqxh
 gWqID6oXxExuWv6BYK7Rhm8iGcBINxESc9RV3204LnL5e/TgybZn3RA4pdkBrIbvaeWZ
 W3XhuiHn2/6FMysUvm6YD8X3ZlKsCsuwrnE5DYa7nJ92dUUEYhQrKSILbkQRqT0hM9Xe
 q1ImuZ9w/tLV27P6ggAotqWNb9Ha1TED+r/yaqUWPMF3/ks0xBXvZUZoPLPGWXKj/0+d
 e0AHl0PX3/Rr6UYVPnZtQb0irWMiP/x7tZuJLJJyBGmrhfhKWtt0tI1pvosLEHfHHGau
 5tVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyDqOQRWfp1Hsf3V2nSojKex0goPQ/vLzJOry5IOPLg5qZzBo75VsRxMaDWlygZC44tQ85fD1n4CWxgMnkpB/iEIXYV4jNbfo9Kv1N0TJ+59aHJJhvQo2tNWl264vmdri2WgZam17ov9D5UFIzHA==
X-Gm-Message-State: AOJu0Yz/R6v+OWwW2VbtLVSFnA0t5t3xZCVMc2MIPmNxHs8MOb7vBs64
 +x6Z8IsMnbAxUrC8Yel7x6hOfbPStqQWoCX8SCDJHev278ajFqCZ
X-Google-Smtp-Source: AGHT+IFomz3FfI26VY4RkDI7jYy7GRVm0MUsqyg1mtqR6H9MuN9wNiNB+mpVDupO2HiBfz+OvKp0Sg==
X-Received: by 2002:a05:600c:1992:b0:418:f8c2:c3bc with SMTP id
 t18-20020a05600c199200b00418f8c2c3bcmr1416834wmq.33.1714112835587; 
 Thu, 25 Apr 2024 23:27:15 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b00418d434ae4esm29754940wmq.10.2024.04.25.23.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:27:15 -0700 (PDT)
Message-ID: <8eecba49-52a2-465c-88e4-60722299a724@gmail.com>
Date: Fri, 26 Apr 2024 08:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/18] drm/ttm: Add per-BO eviction tracking
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-3-friedrich.vock@gmx.de>
 <ab9afb74-1490-45b0-9b40-2e46112538e0@amd.com>
 <Ziqo10vFfhVGQO6h@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Ziqo10vFfhVGQO6h@DUT025-TGLU.fm.intel.com>
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

Am 25.04.24 um 21:02 schrieb Matthew Brost:
> On Thu, Apr 25, 2024 at 08:18:38AM +0200, Christian König wrote:
>> Am 24.04.24 um 18:56 schrieb Friedrich Vock:
>>> Make each buffer object aware of whether it has been evicted or not.
>> That reverts some changes we made a couple of years ago.
>>
>> In general the idea is that eviction isn't something we need to reverse in
>> TTM.
>>
>> Rather the driver gives the desired placement.
>>
>> Regards,
>> Christian.
>>
> We have added a concept similar to this in drm_gpuvm [1]. GPUVM
> maintains a list of evicted BOs and when the GPUVM is locked for
> submission it has validate vfunc which is called on each BO. If driver
> is using TTM, this is where the driver would call TTM BO validate which
> unevicts the BO. Well at least this what we do it Xe [2].
>
> The uneviction is a per VM operation not a global one. With this, a
> global eviction list does not seem correct (admittedly not through the
> entire series).

Yeah, that's exactly what I meant when I wrote that this is controlled 
by the "driver" :)

The state machine in AMDGPUs VM code is pretty much the same.

Regards,
Christian.

>
> Matt
>
> [1] https://elixir.bootlin.com/linux/v6.8.7/source/drivers/gpu/drm/drm_gpuvm.c#L86
> [2] https://elixir.bootlin.com/linux/v6.8.7/source/drivers/gpu/drm/xe/xe_vm.c#L464
>
>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo.c |  1 +
>>>    include/drm/ttm/ttm_bo.h     | 11 +++++++++++
>>>    2 files changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index edf10618fe2b2..3968b17453569 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -980,6 +980,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>>>    	bo->pin_count = 0;
>>>    	bo->sg = sg;
>>>    	bo->bulk_move = NULL;
>>> +	bo->evicted_type = TTM_NUM_MEM_TYPES;
>>>    	if (resv)
>>>    		bo->base.resv = resv;
>>>    	else
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 0223a41a64b24..8a1a29c6fbc50 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -121,6 +121,17 @@ struct ttm_buffer_object {
>>>    	unsigned priority;
>>>    	unsigned pin_count;
>>>
>>> +	/**
>>> +	 * @evicted_type: Memory type this BO was evicted from, if any.
>>> +	 * TTM_NUM_MEM_TYPES if this BO was not evicted.
>>> +	 */
>>> +	int evicted_type;
>>> +	/**
>>> +	 * @evicted: Entry in the evicted list for the resource manager
>>> +	 * this BO was evicted from.
>>> +	 */
>>> +	struct list_head evicted;
>>> +
>>>    	/**
>>>    	 * @delayed_delete: Work item used when we can't delete the BO
>>>    	 * immediately
>>> --
>>> 2.44.0
>>>

