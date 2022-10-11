Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3392E5FB171
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCE210E2B2;
	Tue, 11 Oct 2022 11:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30210E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:28:41 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qw20so30076598ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJ264yv6KZ1eEmLcb5Oa5ojHbwZRF62H56mHRqZ2LF8=;
 b=jryyR2Ih0teR14TR5opXE0vO9CZdX5xkVppwrhAD9BlVre4Qmlje4a/CyJv0EzHaZP
 2tiSYduJclkGFWoKSjpKkYDMFIoqN1wmA+4MkZ7xTW1j6R/aKXlRxMxyaMdOCNUdnWCx
 COZjVY/wguLQBjLQF/CBN59JFQYTHpqHHKujNwSCXUxT+P7PZsm7yyEDq/4yj6JGr/ew
 iiyMO3FjmgVS3q0viE8lgA/K8xpBnyu6fitiCuHOqxae7oe/93iAb2OWqL3GacNeWLy/
 gFlHhwy5rGbQTwyKZ6XP5LlsewfutuUcN91myuz1mBXDHrKPW2D32X5KswRRa0ALx5q7
 13LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJ264yv6KZ1eEmLcb5Oa5ojHbwZRF62H56mHRqZ2LF8=;
 b=C5CDsnee237oS3XHtI3g3qq6yFur9JLx/PAKk1X9GQRrJsYjQK0X8UB8i4730Y3nq8
 h2CLSGZnrxR3mGhL8iHniprjI9TMmyVlEtT9cWMWUg/SwMwxSD0eV7v8iPuOU3IhNBiM
 aAKMyMqNUslBTc42Lz/4tfOgf+aQmYiGmLDvtycTlbAzLs4n6VskBgURxG28N5MMV0lP
 KBYscj2SnhIW72urF5mIr588rKogYofG9BCKlY0dgz+7UU/BA8aaBD9X4nhfs0Ehse5G
 jG65EJlFsDN/qOpAgDD9WwnOgZdaP/sTyt1etQ2ZhyPrdMb9D+KuiXI5LsJDF8nOx4CN
 EGVA==
X-Gm-Message-State: ACrzQf22HHe3rTvz8Xaxi8vlyi302JQof4+uvGcYlgjeFrCnJXCQt0sz
 3ynEgAaVEgioVDRV10MEUwr+Nbq66Ck=
X-Google-Smtp-Source: AMsMyM5toQgQ+VKOgYau860dCu+FvUfcZv3FIE4LgFmFDY8dIyykvcwr3kM6VAbk/CgjS2lfwjvKSA==
X-Received: by 2002:a17:906:9bd3:b0:78d:a625:fef6 with SMTP id
 de19-20020a1709069bd300b0078da625fef6mr10146912ejc.273.1665487720236; 
 Tue, 11 Oct 2022 04:28:40 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eacfe.dip0.t-ipconnect.de.
 [91.14.172.254]) by smtp.gmail.com with ESMTPSA id
 ku2-20020a170907788200b0073dc5bb7c32sm6753411ejc.64.2022.10.11.04.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:28:39 -0700 (PDT)
Message-ID: <f2cf615c-421f-c92e-1a7d-9a5c9d66ca23@gmail.com>
Date: Tue, 11 Oct 2022 13:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] drm: add DRIVER_RENDER_ONLY
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 daniel@ffwll.ch, airlied@linux.ie
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <20221011110437.15258-3-christian.koenig@amd.com>
 <83005961-f45d-37ea-4c5a-71b1895eca16@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <83005961-f45d-37ea-4c5a-71b1895eca16@suse.de>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.10.22 um 13:27 schrieb Thomas Zimmermann:
> Hi
>
> Am 11.10.22 um 13:04 schrieb Christian König:
>> This allows to suppress creating the primary node. Useful for drivers
>> which don't expose any display functionality, but are render only by
>> design.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_drv.c   | 10 ++++++----
>>   drivers/gpu/drm/drm_prime.c |  2 +-
>>   include/drm/drm_drv.h       |  7 +++++++
>>   3 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index d81783f43452..4a525f78a932 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -634,9 +634,11 @@ static int drm_dev_init(struct drm_device *dev,
>>               goto err;
>>       }
>>   -    ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
>> -    if (ret)
>> -        goto err;
>> +    if (!drm_core_check_feature(dev, DRIVER_RENDER_ONLY)) {
>> +        ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
>> +        if (ret)
>> +            goto err;
>> +    }
>>         ret = drm_legacy_create_map_hash(dev);
>>       if (ret)
>> @@ -902,7 +904,7 @@ int drm_dev_register(struct drm_device *dev, 
>> unsigned long flags)
>>            driver->name, driver->major, driver->minor,
>>            driver->patchlevel, driver->date,
>>            dev->dev ? dev_name(dev->dev) : "virtual device",
>> -         dev->primary->index);
>> +         (dev->primary ?: dev->render)->index);
>>         goto out_unlock;
>>   diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index a3f180653b8b..4afd3f15b135 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -740,7 +740,7 @@ int drm_gem_prime_mmap(struct drm_gem_object 
>> *obj, struct vm_area_struct *vma)
>>       }
>>         /* Used by drm_gem_mmap() to lookup the GEM object */
>> -    priv->minor = obj->dev->primary;
>> +    priv->minor = obj->dev->primary ?: obj->dev->render;
>>       fil->private_data = priv;
>>         ret = drm_vma_node_allow(&obj->vma_node, priv);
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index f6159acb8856..0a1450d47ca2 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -94,6 +94,13 @@ enum drm_driver_feature {
>>        * synchronization of command submission.
>>        */
>>       DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
>> +    /**
>> +     * @DRIVER_RENDER_ONLY
>> +     *
>> +     * Driver is a render node only driver and don't want to support 
>> the
>> +     * primary interface.
>> +     */
>> +    DRIVER_RENDER_ONLY        = BIT(7),
>
> Is it really necessary to add a new flag?  If a driver sets DRIVER_GEM 
> and omits DRIVER_MODESET wouldn't this have the same meaning?

Mhm, good point. I haven't thought about that.

Let me double check if anybody is actually using this.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>>         /* IMPORTANT: Below are all the legacy flags, add new ones 
>> above. */
>

