Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD89992DFC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 15:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6998910E3B1;
	Mon,  7 Oct 2024 13:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MGExPeU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5A410E3A5;
 Mon,  7 Oct 2024 13:56:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37ce18b042fso3364840f8f.1; 
 Mon, 07 Oct 2024 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728309414; x=1728914214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KQ61dB7jkql91Wwl4QMMI6l5ptFCuhAlraxPtLhCqb0=;
 b=MGExPeU8JGbc2s2/TGWl8T69T5ig4R6LvKiNBixKHtYw+SB2OpLlzjWGc38hQtNcHI
 I8wbZKIibN65HUSB2F0pMWP5FJsqB8YvSAmberYBMyK6gw5hrTt/mdec4tY5u/WJCk2K
 NEcAKqv45F55gEDK5U880R43p+0F3NA4Nuye1qQeOPchP7HZylOFoSb/FjuLuGWrBsnV
 YMVEcmlX2x31nlRTyCnfS1Zq06sXInbK9/G/jKWnOV3Ju4KyrUGE8ZPGgJl8Oiq3YtrN
 Ahyz5nQ8HBxWs1SIsMtWmnjEwMbfAqaQSLto1telswFKAErbkvQYeeWDouYIMwSugFvl
 isiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728309414; x=1728914214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQ61dB7jkql91Wwl4QMMI6l5ptFCuhAlraxPtLhCqb0=;
 b=bxyP089lYC/YvDtprb2I904O50KUaneHYWMbjJR5YzJdObRpeIU+w8J/lJ3EwpQ2D3
 J/4rJ5fGk6k2DvMEnCrgnzuo0aX5r4PhrkzRlAueqZ30RwxI91cgdQeKPcakYHJqWi4g
 Ygo9wHIdcvicv5dE9WNepScjyFL4sBW4/5cGVkCKLzzW3zWpp3sTcDztaZpszJgwwBN8
 6086WK2Jl8+1df0uqnJdtI8wKBads34kNkBBE0EwCXKzjxjZ71zGz4F/P+YXxsAuJPXP
 o2TfkFe2cA+dnZ4oCy4kw+XIe2ldqmwV3d32tKg3GJaoZZzoJ+eVlzUoIF2UFyc8TG4f
 yT2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFBtD7pPhVtkARt8bYYMRaoV1egbwLzbRj3wqD96/UpuhowmvhlIx+OZw+X60ZpzMnUMDb3bNa@lists.freedesktop.org,
 AJvYcCWn13PNC8pvM5q8F2B8aILYs8+EJOuDw+YcZ/UHQhaj/HsFzUOQS3tYuLg9nuUBaH9ZckiAmJxDhifa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkPLzH9zpodVfTgyqATJSfjMWKktMav0N8XB3cR01gk36e9d08
 u3ikhtJUsrXepJVS+KM4qJ44cT4UkE0KWJzW6p8kM9+7hMM9DsUr
X-Google-Smtp-Source: AGHT+IH/q1VTtfjLXfrhmwRg+gLiNkYH+OCAEiAquIhPhab6OE1vVHnQyi4Iedws4f5SFu+JB3JeZA==
X-Received: by 2002:adf:ba4d:0:b0:37c:ced2:843f with SMTP id
 ffacd0b85a97d-37d0e737753mr6460202f8f.16.1728309413887; 
 Mon, 07 Oct 2024 06:56:53 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1695e7e2sm5799578f8f.84.2024.10.07.06.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 06:56:53 -0700 (PDT)
Message-ID: <82c60f1b-a52a-4bc7-a635-06198dba0e13@gmail.com>
Date: Mon, 7 Oct 2024 15:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 "Sundararaju, Sathishkumar" <sasundar@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, leo.liu@amd.com, sathishkumar.sundararaju@amd.com,
 saleemkhan.jamadar@amd.com, Veerabadhran.Gopalakrishnan@amd.com,
 sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, anupnewsmail@gmail.com,
 "Lazar, Lijo" <lijo.lazar@amd.com>
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
 <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
 <CADnq5_OKww1YZ1R_OytEMLcNVwdq=-ckc2gqQ+WMyOv6AZ9kqg@mail.gmail.com>
 <007679b9-b7b6-4385-9a2e-2be392cb5f58@amd.com>
 <CAJ7bepLv3Z9RwuxoBS3SfkMjeBkN1LRTjLEjT8Lv4Jdu-CXb6Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAJ7bepLv3Z9RwuxoBS3SfkMjeBkN1LRTjLEjT8Lv4Jdu-CXb6Q@mail.gmail.com>
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

Am 05.10.24 um 09:05 schrieb Advait Dhamorikar:
> Hi Sathish,
>
>> Please collate the changes together with Lijo's suggestion as well,
>> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
>> f0b19b84d391.
> I could only observe two instances of this error in f0b19b84d391 at:
> 'mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;`
> and `mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);`
>
> There are a few instances where we can use 1U instead of int as
> harvest_config uses unsigned int
> (adev->jpeg.harvest_config & (1 << i)
> However I think they should be fixed in a separate patch?

No, all of this are numerical problems where not taken into account the 
size of the destination type.

Saying that all of that are basically just style cleanups which doesn't 
need to be back-ported in any way, so please drop the Fixes: tag.

And you should probably change the subject line to something like 
"drm/amdgpu: cleanup shift coding style".

Regards,
Christian.

>
> Thanks and regards,
> Advait
>
> On Sat, 5 Oct 2024 at 09:05, Sundararaju, Sathishkumar <sasundar@amd.com> wrote:
>>
>>
>> On 10/4/2024 11:30 PM, Alex Deucher wrote:
>>> On Fri, Oct 4, 2024 at 5:15 AM Sundararaju, Sathishkumar
>>> <sasundar@amd.com> wrote:
>>>> All occurrences of this error fix should have been together in a single patch both in _get and _set callbacks corresponding to f0b19b84d391, please avoid separate patch for each occurrence.
>>>>
>>>> Sorry Alex, I missed to note this yesterday.
>>> I've dropped the patch.  Please pick it up once it's fixed up appropriately.
>> Thanks Alex.
>>
>> Hi Advait,
>> Please collate the changes together with Lijo's suggestion as well,
>> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
>> f0b19b84d391.
>>
>> Regards,
>> Sathish
>>> Thanks,
>>>
>>> Alex
>>>
>>>> Regards,
>>>> Sathish
>>>>
>>>>
>>>> On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
>>>>
>>>> Fix shift-count-overflow when creating mask.
>>>> The expression's value may not be what the
>>>> programmer intended, because the expression is
>>>> evaluated using a narrower integer type.
>>>>
>>>> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
>>>> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>>> index 95e2796919fc..7df402c45f40 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>>> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
>>>>     for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>>>>     ring = &adev->jpeg.inst[i].ring_dec[j];
>>>>     if (ring->sched.ready)
>>>> - mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>>>> + mask |= (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>>>>     }
>>>>     }
>>>>     *val = mask;

