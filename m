Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731BE9B5004
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 18:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFE210E696;
	Tue, 29 Oct 2024 17:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Iyo2sqXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E894110E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:43:41 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so6763282e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1730191420; x=1730796220; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BLXKVldI/g3voxoBGLq0d6DqPKPKG/canXisgbzAIBc=;
 b=Iyo2sqXbIGt+vzVrVNLLcREylxaHwiT6LUYmolnOwanJwoUVEavDBLjn6T7YwNJeSf
 6btBEx1HJbRCx7Ppo5LuGGoDQW9WbV1PYyGhNh+gj3ogzRiLdDt7J1a182Os7L0bU4T2
 sAt6Xyo7DUzdP67YxjNRn7ALX7+0Wc837ZDn9vbokGXQEJAjNu0jO8xtOm1I5Nwp3ByX
 0DlrjNvtRxr+My/udFdjsWcRMU7WXs6JuXi9aumt+O3A+7WpHynw91vhWyjrUXatT5r+
 c0QA9kTVU9VkWso09W5t7DS4dx0MmxfTRGVO41sTcrAsYirX0ASXXXfkL6Q3cEEVLdE6
 lHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730191420; x=1730796220;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLXKVldI/g3voxoBGLq0d6DqPKPKG/canXisgbzAIBc=;
 b=FOWJn1BZq0RHf9/0KAJvph3CkjYXb3ZZASlIpoN1jk22YzHKzUpzHlC43dylHFY3ix
 F6UlDRvp7gfM3yxV/bEA0+2yNXqsDIEL6aYCmrhDsG/LhpizBjvUcXERf7GZjuQ+9oof
 ntvXh+YwWUm1u587DgthKuXvJa9c2ImP7aVMzqQHqT+sdlEPNUcfNQdY9E74qDBpQ3cr
 24H/Rqm0U/Lb6AN7cyj5BuNBikzgQ7/rLLghF5ChwOJyPi19XFFPMWT5l7bwBmxZWq84
 7Jj+do2G0VxYJq5zaHpT79slBQmjdwmWiCCZussIm/fodVuNB7vUxCFOjqJuhRLJ5vp2
 Gl5Q==
X-Gm-Message-State: AOJu0YyGTf5le2XyGmnXB5Am8ixlTY9CCzG+k+6uHZfHjkcWNsDaxXmv
 VQB/8xIKGSpEb1tFlEHfWPo9oh0RTzbHCexJrikCYtwcCX1rYbPSD+By5nSJSuY=
X-Google-Smtp-Source: AGHT+IEGLZnRrJy/jMMoUb+FFDp/k5KZoUpVk1H48XaQaLGmoEYg9e8WQhMQ+3GpwDXEQHgslaN6KQ==
X-Received: by 2002:a05:6512:238a:b0:539:f949:c027 with SMTP id
 2adb3069b0e04-53b348f9b74mr5202491e87.18.1730191419938; 
 Tue, 29 Oct 2024 01:43:39 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431935a4c0esm138314875e9.27.2024.10.29.01.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:43:39 -0700 (PDT)
Message-ID: <49593924-4e4a-4341-9a10-5733a9be082b@suse.com>
Date: Tue, 29 Oct 2024 09:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Drop allocation of object without mountpoint
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 matthias.bgg@kernel.org, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20241028-v3d-v1-1-907bee355edf@gmail.com>
 <38486268-ad83-4719-8ad5-ead05935d02d@igalia.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <38486268-ad83-4719-8ad5-ead05935d02d@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Oct 2024 17:03:24 +0000
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

Hi Maria,

On 29/10/2024 01:41, Maíra Canal wrote:
> Hi Matthias,
> 
> Thanks for your patch!
> 
> On 28/10/24 11:27, matthias.bgg@kernel.org wrote:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> Function drm_gem_shmem_create_with_mnt() creates an object
>> without using the mountpoint if gemfs is NULL.
>>
>> Drop the else branch calling drm_gem_shmem_create().
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_bo.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
>> index 
>> 7055f7c7bcfe5700aee10b09ecc0005197323b01..f6df9e0947b6ee06043cdbb42c4f98a71bdeba4d 100644
>> --- a/drivers/gpu/drm/v3d/v3d_bo.c
>> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
>> @@ -157,13 +157,8 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, 
>> struct drm_file *file_priv,
>>       struct v3d_bo *bo;
>>       int ret;
>> -    /* Let the user opt out of allocating the BOs with THP */
>> -    if (v3d->gemfs)
>> -        shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
>> +    shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
>>                                 v3d->gemfs);
> 
> Please, run scripts/checkpatch.pl before sending the patch.
> 

I did with b4 prep --check which gave no errors, just double checked with:
$ ./scripts/checkpatch.pl 
0001-drm-v3d-Drop-allocation-of-object-without-mountpoint.patch
total: 0 errors, 0 warnings, 14 lines checked

0001-drm-v3d-Drop-allocation-of-object-without-mountpoint.patch has no obvious 
style problems and is ready for submission.

I suppose you want line "v3d->gemfs" to get an extra tab, correct?

Regards,
Matthias

> Best Regards,
> - Maíra
> 
>> -    else
>> -        shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
>> -
>>       if (IS_ERR(shmem_obj))
>>           return ERR_CAST(shmem_obj);
>>       bo = to_v3d_bo(&shmem_obj->base);
>>
>> ---
>> base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
>> change-id: 20241028-v3d-1d2546ed92d7
>>
>> Best regards,
> 
