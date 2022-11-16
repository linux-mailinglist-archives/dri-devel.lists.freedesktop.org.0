Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1762B80F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 11:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3903F10E45C;
	Wed, 16 Nov 2022 10:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FDB10E16F;
 Wed, 16 Nov 2022 10:26:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id v7so11574598wmn.0;
 Wed, 16 Nov 2022 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6Dfl5kP7BvkO3ygiB9OHKZJjUeeBeY6h9AQv7zJ6S8=;
 b=hylW/wEp2bc4MfSlRqd88QDzBxLxAgTe1ozWtjy8WjEeZPt+BGqZfq4yB+SmLn2Fep
 Rx7X2BJ5cx82WoNy8cr/zLjdMlzg/tKbNNYPg5AXSg4WWW1d/J6w+B/wTIxBRFqfML9p
 Y4OammYMvouTP2Ld8gHXsAriAKY8yk9esaJUasi2tPUeEIt8rbmzLd70pXvjBu7a9Au1
 C3UNMWLxSOKb4vTKYShEWGYbgMpRbKsBce44JwTO6wmKdpr5SDiT6aEz7AE/I95eYIDs
 EDwm+HeM3bU3Ztff92gv1uOFbz9ALhpxJgaIYtmzPIH9VlRQNFRi3IzpCJJa6C9P0+t3
 eKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6Dfl5kP7BvkO3ygiB9OHKZJjUeeBeY6h9AQv7zJ6S8=;
 b=YUEEvP/3jbyFHFNT4m3JYbzNhMpk4xejQT0e+WTLhTrjUHP3wesQE48Mfk13T9/dOh
 0AbkEtTwniu5HuvEk2r2MsmiI+HiMm0/uz+SwPg21IaKbUQso7AvQ1DVEyxAbqvzHdAA
 GlFG+AB6mrafd+tKgMZ90QNkArm2Cm2LTYKxSFFkZvi1lyKbLCvMS9vMPpA/JFqEfmMn
 mjQRrf2KgIw4rjBMdOxKzXr22oD6p72hwLjps+2EfvhhzezsbBG3yz2dYTP0f+ykI1QY
 wqALHV8Ppz3IHJFGy3VKOLD2kbM1Kngx1UgAvoSRyBVWEEt8sde/HVOD2XT5yUvZIKX+
 fDXg==
X-Gm-Message-State: ANoB5pkoywaXPjO0r2gMrD5Vvf/brxppeRrRkB84bvsXbefNIZQApY0K
 IZo5JVwsrBpw3Sd+k1Ng1dQKvIs+HFA=
X-Google-Smtp-Source: AA0mqf5DXnFXR8hymh4SYHtltW3LuP06Cqo1rfgcJIcuMkyuqhLx0BY5cAPG4U4A902i/xR+GOqh1Q==
X-Received: by 2002:a05:600c:5014:b0:3cf:a18d:39a4 with SMTP id
 n20-20020a05600c501400b003cfa18d39a4mr1616811wmr.125.1668594409930; 
 Wed, 16 Nov 2022 02:26:49 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:a719:712a:c9e4:718d?
 ([2a02:908:1256:79a0:a719:712a:c9e4:718d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b003c6b70a4d69sm1820143wmb.42.2022.11.16.02.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 02:26:49 -0800 (PST)
Message-ID: <c58140a2-1cac-dfad-fb2e-4369bb384282@gmail.com>
Date: Wed, 16 Nov 2022 11:26:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] drm/gem: Remove BUG_ON in drm_gem_private_object_init
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
 <20221116085012.187756-2-Amaranath.Somalapuram@amd.com>
 <fa9ecb1f-17a9-c7ce-d25a-42c3860f1b8d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <fa9ecb1f-17a9-c7ce-d25a-42c3860f1b8d@amd.com>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.22 um 10:20 schrieb Arunpravin Paneer Selvam:
> Hi Amar,
>
> On 11/16/2022 2:20 PM, Somalapuram Amaranath wrote:
>> ttm_resource allocate size in bytes i.e less than page size.
>>
>> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index b8db675e7fb5..a346e3b7f9a8 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -152,7 +152,7 @@ EXPORT_SYMBOL(drm_gem_object_init);
>>   void drm_gem_private_object_init(struct drm_device *dev,
>>                    struct drm_gem_object *obj, size_t size)
>>   {
>> -    BUG_ON((size & (PAGE_SIZE - 1)) != 0);
>> +    //BUG_ON((size & (PAGE_SIZE - 1)) != 0);
> This line is added by mistake?

Yeah, comment it out is not a good idea. Instead we should probably move 
it somewhere else, e.g. the shmem object initializing code path still 
needs this.

Additional to that please re-order the patches, this here is a 
prerequisite and should come first.

Regards,
Christian.

>
> Regards,
> Arun
>>         obj->dev = dev;
>>       obj->filp = NULL;
>

