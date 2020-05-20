Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B01DB2AD
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F3188FAD;
	Wed, 20 May 2020 12:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E04C88FAD;
 Wed, 20 May 2020 12:05:23 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id a2so3443526ejb.10;
 Wed, 20 May 2020 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IpcuDlVK4ewXDEYJwfHRhSq6queIrqFdGofnfdB2b5w=;
 b=onX2mjo3ZhjB0Rm0CUCdmoTq9xTcOPNo4s5dhyCMe2uhOVJMo7SZsPW9VGTeh20rH9
 Zay7CC5J9eMlj0sywrYRVB9uRatEAZAtXXGRxMVXkdTFQ1sK6od0rnvplRyxfP2ypBIy
 3fOk+Y6pqAI877qGZV9OO/rFrXX+8uScKcLpbOORM42wqnAlS1Xo5qCTFtIMx/KaxAW5
 7zQzorlV+jpu38Za5wp9UlKpBJdvzePpr81AhfJeuX3UYcPAdK9lyRyLBZjPVANWNkdd
 5ro6AbnmSMmcsjmW7ZjqI2wzwRUdgkhK8JZPXzkFr8PeMdayDguSyv/HTcuWoZ8Tunb0
 dI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=IpcuDlVK4ewXDEYJwfHRhSq6queIrqFdGofnfdB2b5w=;
 b=PSUrRMJMOeSyICJgJwwNPWBZbKm4HGrEBR26CZp93ErzrqQYV0cjZeijPrLlafAPLe
 Br2HuWx78J8+fxHxSXsVeAJFMoBSu2+pZm8wJZ9yDU/NrNOGEW5fI9S0Kru4ePLV5kb0
 Ub/D6ApZcAZ73wxOirmaM1EGBQWSchrX9cscCFp/aSoPIEHo93Y66k4vRHHPUbczQYVc
 Qqp1dssadz4UnzY9p/BHFxP1dP/sRXs2Tiqf3PtiH57LoWnbHIkHAEa/5zeP8q6Kzg6Z
 iq5zCv6eXIdFUdVxqb/9HLCQgy0JvzMLO6cAv7NjeJOLWuAZxckNkLN54otl5UwIeQ7N
 Ohdg==
X-Gm-Message-State: AOAM532sWNgZfPY3xqyDXzW18YJHhO+87/HQK5Z/Jp6zjPcelYpWaBWh
 kXJ5KQKZUp/u9gGJ1ZL2Ng8=
X-Google-Smtp-Source: ABdhPJwr6r+idrtcT++eTWfSy6fLWhDhq5ATlJSlfd5P0GodqO/MjCxxPCBQLhArlKbZoForyIwaWg==
X-Received: by 2002:a17:906:3cd:: with SMTP id
 c13mr3534648eja.164.1589976321947; 
 Wed, 20 May 2020 05:05:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g25sm1601766edm.57.2020.05.20.05.05.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 05:05:21 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: off by on in
 amdgpu_device_attr_create_groups() error handling
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
References: <20200520120054.GB172354@mwanda>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <62d9d539-8401-233a-3f20-984042489987@gmail.com>
Date: Wed, 20 May 2020 14:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200520120054.GB172354@mwanda>
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
Reply-To: christian.koenig@amd.com
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Rui Huang <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Yintian Tao <yttao@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.20 um 14:00 schrieb Dan Carpenter:
> This loop in the error handling code should start a "i - 1" and end at
> "i == 0".  Currently it starts a "i" and ends at "i == 1".  The result
> is that it removes one attribute that wasn't created yet, and leaks the
> zeroeth attribute.
>
> Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> index b75362bf0742..ee4a8e44fbeb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -1931,7 +1931,7 @@ static int amdgpu_device_attr_create_groups(struct amdgpu_device *adev,
>   					    uint32_t mask)
>   {
>   	int ret = 0;
> -	uint32_t i = 0;
> +	int i;
>   
>   	for (i = 0; i < counts; i++) {
>   		ret = amdgpu_device_attr_create(adev, &attrs[i], mask);
> @@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struct amdgpu_device *adev,
>   	return 0;
>   
>   failed:
> -	for (; i > 0; i--) {
> +	while (--i >= 0)

As far as I know the common idiom for this is while (i--) which even 
works without changing the type of i to signed.

Christian.

>   		amdgpu_device_attr_remove(adev, &attrs[i]);
> -	}
>   
>   	return ret;
>   }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
