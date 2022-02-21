Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280AB4BEBF0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 21:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2337610E30C;
	Mon, 21 Feb 2022 20:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB91A10E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 20:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645475813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkxKWpQx5iuNsF54dXkXbOPAbRKT1pxdxrwColcc4Lg=;
 b=Ettjf36jVUyWpBQIQFn+T7WwlG6r0yQkU5k+7fAvCEiKLH/f27+Vh0IA2tDy7p6rGWdzaF
 4MlrUAuRVSny+5dNLWcsy+QyfqbMeX7LDfx8YpjmkPr7ONIAfYosssugNeF4t88EgVqEnp
 oHd7V8HE+e3d1m1NGaqa4nU3JxCnwlM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-mTQ7dNO1Peuw2QbH0gse8g-1; Mon, 21 Feb 2022 15:36:50 -0500
X-MC-Unique: mTQ7dNO1Peuw2QbH0gse8g-1
Received: by mail-qk1-f200.google.com with SMTP id
 p67-20020a378d46000000b0062adb7627edso10375922qkd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 12:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OkxKWpQx5iuNsF54dXkXbOPAbRKT1pxdxrwColcc4Lg=;
 b=ipbNIaIGD43GiTJUztcJ5TCtM2ThoD1XwOM87j2S5q5mnfSbxwkXUyUTBMkrPJll+/
 tpknoalj291QkUKvgZMiMDNBaLPvJt0bhqEc289nUaSP6WD2Kf3X5M99H9NQYsDCz+4P
 88uG+vnhedlmclDIq36UqlFUCqT5b8rBHRUal7ZdtYs0pnL4WEgQWOKxbboT6He7i1rH
 53bCmJEpifMh5fYd/RarkgphrcOCw1Q0VZZf3P89X6yRvK7I3zlLJnzKq1NAcK6Zm93a
 wtBiyvP7qd66se1rOBsw4yK0GbsgfybkYDjMV1KzrLvVYlnIrb/so+F4NMrpm6YAr8Oc
 Ifpw==
X-Gm-Message-State: AOAM530fr1QiwD08FrvEL1ZZc72RSyhCcYzHvSXl7fpJtBXiiEAst/hi
 j9kRG3xqSI33VdhzEx60NN3pbKWutxoCFJg4KqE4cxQn7z7bnl/qTyyxHpa3Tp2MO06SbcYwEmW
 wBTkpzcVzz6k6G3tmnrcGqMDDW/GS
X-Received: by 2002:a05:622a:187:b0:2d6:8444:e30c with SMTP id
 s7-20020a05622a018700b002d68444e30cmr19439484qtw.413.1645475810417; 
 Mon, 21 Feb 2022 12:36:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1SIyikKpt7KcdTkPlcwI08+ZgJfv7m97UYuDDAl3EUY10LCmode/caJrxhfn3/liH99A5Rw==
X-Received: by 2002:a05:622a:187:b0:2d6:8444:e30c with SMTP id
 s7-20020a05622a018700b002d68444e30cmr19439455qtw.413.1645475810151; 
 Mon, 21 Feb 2022 12:36:50 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id x13sm28560921qko.114.2022.02.21.12.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:36:49 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: fix printk format for size_t variable
To: Luben Tuikov <luben.tuikov@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, guchun.chen@amd.com, Prike.Liang@amd.com,
 Hawking.Zhang@amd.com
References: <20220221173737.3725760-1-trix@redhat.com>
 <84e354ec-cfbf-a23f-ddd5-417d6f029873@amd.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <e490241d-9a22-f873-2b15-18b12896ea65@redhat.com>
Date: Mon, 21 Feb 2022 12:36:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <84e354ec-cfbf-a23f-ddd5-417d6f029873@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/21/22 11:57 AM, Luben Tuikov wrote:
> Hi Tom,
>
> This was already fixed with this patch, and LKML was CC-ed. See the CC tags in the patch below,
>
> commit 4f7d7cda90cbd7
> Author: Luben Tuikov <luben.tuikov@amd.com>
> Date:   Wed Feb 16 16:47:32 2022 -0500
>
>      drm/amdgpu: Fix ARM compilation warning
>      
>      Fix this ARM warning:

I glad it wasn't just mips ;)

There have been a couple of build breaks with amdgpu recently.

Nick asked about adding clang to your ci.

Could at least one non x86_64 gcc also be added, maybe aarch64 ?

Tom

>      
>      drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:664:35: warning: format '%ld'
>      expects argument of type 'long int', but argument 4 has type 'size_t' {aka
>      'unsigned int'} [-Wformat=]
>      
>      Cc: Alex Deucher <Alexander.Deucher@amd.com>
>      Cc: kbuild-all@lists.01.org
>      Cc: linux-kernel@vger.kernel.org
>      Reported-by: kernel test robot <lkp@intel.com>
>      Fixes: 7e60fbfbdc10a0 ("drm/amdgpu: Show IP discovery in sysfs")
>      Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>      Acked-by: Alex Deucher <Alexander.Deucher@amd.com>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 2506bcf36c870c..6c7ec058125e1d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>                              le16_to_cpu(ip->hw_id) != ii)
>                                  goto next_ip;
>   
> -                       DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
> +                       DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
>   
>                          /* We have a hw_id match; register the hw
>                           * block if not yet registered.
>
> Regards,
> Luben
>
> On 2022-02-21 12:37, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> On mips64 allyesconfig, there is this build break
>> amdgpu_discovery.c:671:35: error: format '%ld' expects
>>    argument of type 'long int', but argument 4 has
>>    type 'size_t' {aka 'unsigned int'}
>>    DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>>
>> For size_t, use %zu.
>>
>> Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 7c7e28fd912e..58238f67b1d3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>>   			    le16_to_cpu(ip->hw_id) != ii)
>>   				goto next_ip;
>>   
>> -			DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>> +			DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
>>   
>>   			/* We have a hw_id match; register the hw
>>   			 * block if not yet registered.
> Regards,

