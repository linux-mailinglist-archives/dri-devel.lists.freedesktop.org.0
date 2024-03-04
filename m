Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7843870757
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84398112335;
	Mon,  4 Mar 2024 16:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MCHfAWjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6308F10EA26;
 Mon,  4 Mar 2024 16:39:36 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-412e7fe422fso4820245e9.2; 
 Mon, 04 Mar 2024 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709570374; x=1710175174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MhNUAiSWO4T7l6IiApvoEvlWA3p5lp7Kta44ylU3vRE=;
 b=MCHfAWjdCd1yS7g/yiHKSP3CrnrokuM+k9IuJfLihBXtLk3b7YJWG/AdaKw364YBQ6
 kL9HqP8npSVi7KYDzOxrIff8fZH/BtFbtYj8al6Z270mXfsabrDcaOH/mWeJ/T6IJSie
 mCiXHisPJetklgpBQPIZI2qvuCntMcAlHb+/FuvBoQMKdky6Sb5Pq84Q7MYvBkY2Yxtw
 NSzlQ7Ep4sbVX0jmQRZtc/1pCoos4M8Jkg+u3MR4YTjdZfMKfuV2934wNRgRKf3+qbJc
 v57/tvrqE1fQIdroGyhzBWCvqkxSPg5OegTKNpXvrUY56qjnBdsXzE/vSVBtOZGKHnm9
 7GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709570374; x=1710175174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MhNUAiSWO4T7l6IiApvoEvlWA3p5lp7Kta44ylU3vRE=;
 b=gDUXVMQ55kILsXvIQQWOKpOPMAgdG0OQloAR+CTBWZZECrFZniOQJMq4ibL7z5/YI4
 E3AOEsy3mcQXKzaquANVuTkQalQCHZ7LFHH7UFsuUhrHe8zomenqBBwyhpLOAW+/zakA
 cgP5NJKCKF1cWgrug2CwWjzVd8JTQWCnh3BgsF6jvLwiujJqsLXMgYJFxtQQpGpD+Pcl
 tXFAcmkiCEM8qC47F9sR07KLP+rOxo4os8s5hMvxQXf/mYC6bIOLRgn3m+MFFIOou6R1
 i+sc7NdMgfKJ2VoZ6vP/FOq2+xzfKd+2VfIL03LQQpSjRxgq/1OhIrNg4Qyo6VlbngzK
 zVZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOa33wDpzWGxPMjHcfOjVmzLYhGXgdk8hsNq0clh/dvJI4K/ZyZeP4jpy+u6RDYHkAA0pHfbIQuuS3HPDxIPdM+moDSAkW0UtH6m8Xo9/KN/52KSDmF2IunaKeoLfcHNclnjbxjxrcWY/afynxN3EuHSuVBreeu+JiL/jN/Pyvxy6/SzKfO4Q9/idncGlDLQ==
X-Gm-Message-State: AOJu0YwJZEEgvOIVfkw2n9DO7ieTcWsdSLiFMBBbwJy7AaGjLWF6PTkx
 StFaHL7Ro6QY0h7ZpcZr9I837DbkkI48Zct0WbDpOkfU+phWSjO0
X-Google-Smtp-Source: AGHT+IF8qB57ThaA300N8OaB2lwrFAu7k5Q7nXN5q3xnQJw/fI7SbrjzcKANpB1P578sPGSsPKIXww==
X-Received: by 2002:a05:600c:1f90:b0:412:6015:3dc5 with SMTP id
 je16-20020a05600c1f9000b0041260153dc5mr7873076wmb.14.1709570374219; 
 Mon, 04 Mar 2024 08:39:34 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 g3-20020adfe403000000b0033af3a43e91sm12642090wrm.46.2024.03.04.08.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:39:33 -0800 (PST)
Message-ID: <77148946-83ef-4576-a26b-ec84f9a4c63a@gmail.com>
Date: Mon, 4 Mar 2024 17:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/buddy: Add user for defragmentation
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
 <20240304163220.3093-3-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240304163220.3093-3-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Am 04.03.24 um 17:32 schrieb Arunpravin Paneer Selvam:
> Add amdgpu driver as user for the drm buddy
> defragmentation.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++++++--
>   drivers/gpu/drm/drm_buddy.c                  |  1 +
>   2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index e494f5bf136a..cff8a526c622 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   					   min_block_size,
>   					   &vres->blocks,
>   					   vres->flags);
> -		if (unlikely(r))
> -			goto error_free_blocks;
> +		if (unlikely(r)) {
> +			if (r == -ENOSPC) {
> +				drm_buddy_defrag(mm, min_block_size);
> +				r = drm_buddy_alloc_blocks(mm, fpfn,
> +							   lpfn,
> +							   size,
> +							   min_block_size,
> +							   &vres->blocks,
> +							   vres->flags);

That doesn't looks like something we should do.

We might fallback when contiguous memory is requested, but certainly not 
on normal allocation failure.

Regards,
Christian.

> +				if (unlikely(r))
> +					goto error_free_blocks;
> +			} else {
> +				goto error_free_blocks;
> +			}
> +		}
>   
>   		if (size > remaining_size)
>   			remaining_size = 0;
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 40131ed9b0cd..19440f8caec0 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -396,6 +396,7 @@ void drm_buddy_defrag(struct drm_buddy *mm,
>   		}
>   	}
>   }
> +EXPORT_SYMBOL(drm_buddy_defrag);
>   
>   /**
>    * drm_buddy_free_block - free a block

