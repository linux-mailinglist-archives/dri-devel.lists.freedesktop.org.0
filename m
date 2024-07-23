Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A7A939CFF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 10:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CFA10E4BD;
	Tue, 23 Jul 2024 08:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dEho8L7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1210E4BD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 08:53:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4266dc7591fso37694205e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721724796; x=1722329596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=opJ1q0zzQ1MRfRz4kJl2Gglo6klNpOZDdHqwtHHMc6U=;
 b=dEho8L7wMZXfPATl2EDC9ZKuGG3rwGGyAg9m8BDJx2hgNUXccnEBfUSBOhNzRiJAcu
 dDoQo7RlDK+AyhCIywnVvgHp5S5fi+y+sQkKEh5/zO8ywi9+oDkAIgAK1du+pyGYXCU2
 oYS19NVrH0pkXv8PTGoWe+jRK6cDa95sTbv8rWpos7UnOf1x+NtUDeb5WflYCLfidnOp
 Xleu1tUT1yNh1I1IS87Q4WfDb3hvO2eI5jOrQ0lhLO85mQeS4mHMXU4z84GNvwc7WO+Y
 eCHjK1Z501066zcAIogKpXTmeLtDcs4+93Vio0fnEY+LLqI74H39mZ6l9Lmwd069Bolc
 /R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721724796; x=1722329596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=opJ1q0zzQ1MRfRz4kJl2Gglo6klNpOZDdHqwtHHMc6U=;
 b=tIFFrGA4lz6svgIt9pB/Ps1ope0hi1HyY5IkPb3Au2W7kvY34AEI9RzksxS5Gpd0Zq
 GUlw0g6PW9Eap4RvVSGO+OL+2ikT7nQVFVf++R1Qj2wrbry6wUEqWlbl9oh38WQbcO22
 U46qYrdz9Bsjts58xXPaoEtLqneXo7rsJXEoaUM3bcFJgDTcb8igx8cBNk/DSh2BzEvi
 U2jMs1PloBhxNvVE/DDGbncg8r6wVVg8UR3ca1IFIusyOC2++5MjEQJvcP7rcqMh31ie
 6Kk9Cue2RVQyPiQjF0lpfje+WKYYQjpZBH6sqqw+HZ3hTqmPDThZ6PuzItIHkitndRZm
 PmrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNVZudtBoh+8CLOxDvZ93qAIYjwhFBVKb4DLeFAi5Hgl7GfvwTVY1GbJPuZtH22/l5puJX6krjXRVbF7Xoev7TpXVu8CDSS27go/YQvpZl
X-Gm-Message-State: AOJu0YzhFkZxVDd3GoMzY1xnYuPndPtw8Fug03c2CYWpFmpFNzb+AVAF
 bpQunjHC5vpgMFoOal/zhxVbLj0guNysui9mXGyC72W8jEJRk3g4
X-Google-Smtp-Source: AGHT+IE8Pjq5SS557GXXRm5sAjQK/9OpC70NpMplJwacI7RdeXFvzGBHdOdeB86rZayvbfza7XeW4Q==
X-Received: by 2002:a05:600c:4f56:b0:426:6edf:4f41 with SMTP id
 5b1f17b1804b1-427dc53b695mr67634675e9.8.1721724795682; 
 Tue, 23 Jul 2024 01:53:15 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427ef3f4665sm12657725e9.0.2024.07.23.01.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 01:53:15 -0700 (PDT)
Message-ID: <c34ba135-5a02-47b0-9d5d-ad25091e25bd@gmail.com>
Date: Tue, 23 Jul 2024 10:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/ttm: make ttm_bo_get internal
To: Matthew Brost <matthew.brost@intel.com>
Cc: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-10-christian.koenig@amd.com>
 <ZpboGfzAI1wHTqS6@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZpboGfzAI1wHTqS6@DUT025-TGLU.fm.intel.com>
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

Am 16.07.24 um 23:37 schrieb Matthew Brost:
> On Tue, Jul 16, 2024 at 02:35:19PM +0200, Christian König wrote:
>> Prevent drivers from using this directly.
>>
> This is a good change. Early on in Xe, our reference counting for BOs
> was flawed (and incorrect) due to confusion between GEM ref count and
> TTM ref count.
>
> Is there any way we can just eliminate this and use GEM ref count? I'm
> still confused about why we seemingly have two reference counts for the
> same object.

I don't want to give your nightmares but initially we had *four* 
reference counts for the same object!

I've already removed one of it quite a while ago because I ran into 
similar issues, but currently we have three:
1. The GEM kref
2. The GEM handle count
3. The TTM kref

The handle count and GEM kref make sense since the handle count controls 
when to release DMA-buf and the GEM kref controls when to release the 
structure and backing store.

The TTM kref is another structure reference created because historically 
TTM BOs were not based on GEM objects. Since this is no longer the case 
we can probably nuke that one.

Regards,
Christian.

>
> Matt
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_internal.h | 10 ++++++++++
>>   include/drm/ttm/ttm_bo.h              | 10 ----------
>>   2 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
>> index 6a7305efd778..9d8b747a34db 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
>> @@ -27,6 +27,16 @@
>>   
>>   #include <drm/ttm/ttm_bo.h>
>>   
>> +/**
>> + * ttm_bo_get - reference a struct ttm_buffer_object
>> + *
>> + * @bo: The buffer object.
>> + */
>> +static inline void ttm_bo_get(struct ttm_buffer_object *bo)
>> +{
>> +	kref_get(&bo->kref);
>> +}
>> +
>>   /**
>>    * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
>>    * its refcount has already reached zero.
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index 31ec7fd34eeb..8c1577d8793c 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -229,16 +229,6 @@ struct ttm_lru_walk {
>>   s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>>   			   struct ttm_resource_manager *man, s64 target);
>>   
>> -/**
>> - * ttm_bo_get - reference a struct ttm_buffer_object
>> - *
>> - * @bo: The buffer object.
>> - */
>> -static inline void ttm_bo_get(struct ttm_buffer_object *bo)
>> -{
>> -	kref_get(&bo->kref);
>> -}
>> -
>>   /**
>>    * ttm_bo_reserve:
>>    *
>> -- 
>> 2.34.1
>>

