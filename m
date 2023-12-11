Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81C80C70A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 11:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869D110E3A7;
	Mon, 11 Dec 2023 10:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9AD10E3A7;
 Mon, 11 Dec 2023 10:47:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c32df9174so34999895e9.3; 
 Mon, 11 Dec 2023 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702291630; x=1702896430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ce0zbxA04eGm5L5oadZ3wbq0BpUtWOBHwT553G24fMY=;
 b=Xa09P9c0PDx70waXmLcv3BFgFmyM3VWtsxQXhOFeLpVPTuTDXOqV2bAXwVfGJGv622
 Ut4CJ+RfNda4cGvugsEN52Od029wZWFY1EEhUkQObilZy/8WE/4Jzz0fcsdzydkxA8Py
 rRnUbfuLpKGzT6W1F6IPlQzm6NpslbZ/hu0vNNkHQEKTcKMFwqRq9t2i0SLDDl1TWXjJ
 rFnEGZVG9R5MXbcP3bVVqTlvABgCDDORa1anT+v7aVe20ShvM0Gwx65ywI1PYInyvGUz
 8X6DapcBwiGZ4sjxo6N2AWVzufhc8HFCpH7E7WM6BH+qp6XjPucyml5GhvJC9MJxWfP5
 nx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702291630; x=1702896430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ce0zbxA04eGm5L5oadZ3wbq0BpUtWOBHwT553G24fMY=;
 b=uW+SctOwJQYGYTFyiBjR1EMnqcOiL1xhb1y5+F/9f6dbPeKqj/ZmPGl6vDuuHPzLhX
 58HSbqaNnTvJ2CdVKbInH+lvGtVAHxhDVwtZb+/80Glgowrba47tuBKseSexWrlRFqGw
 eGgdQleBk2sKIoC2S8N452Pc9yvFhTzQ6aiuqca2mK7crlGNga8U1Kv8EXcaGxsr+i+U
 VrMoFNqvwhyueKR7kNZENsOZJ0kihXI8OMjyJRDPTI0XBKgRwey8RZXQDxxUxipJj0q1
 Xi900QdyIuHYNecwJYO4XjZkFY4Gnj7NcKkWcXwfIOQvs5PVvXQeklxykgjdVJGDyYxE
 a+8g==
X-Gm-Message-State: AOJu0YxjqnSmMCELdF44FRbIaxw1xnDAYcH3BdR9loT6QzSO/oYtGgnL
 bObxRNol3RhkZ0Fp459jSG8=
X-Google-Smtp-Source: AGHT+IFDLSWtwRz+Mep0P2wHU03mEf8uT1tA4CK01mVy2soy6G7lwo395lYfptDQ0/ItbXxPbv0GHA==
X-Received: by 2002:a05:600c:4195:b0:40c:243f:c36a with SMTP id
 p21-20020a05600c419500b0040c243fc36amr1555228wmh.206.1702291629926; 
 Mon, 11 Dec 2023 02:47:09 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b0040c4c9c52a3sm888618wmo.12.2023.12.11.02.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 02:47:09 -0800 (PST)
Message-ID: <9637309c-af25-4117-be4f-b8cbdc087d60@gmail.com>
Date: Mon, 11 Dec 2023 11:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] drm/scheduler: Unwrap job dependencies
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231205190234.371322-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231205190234.371322-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Luben Tuikov <ltuikov89@gmail.com>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linaro-mm-sig@lists.linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.12.23 um 20:02 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Container fences have burner contexts, which makes the trick to store at
> most one fence per context somewhat useless if we don't unwrap array or
> chain fences.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 47 ++++++++++++++++++--------
>   1 file changed, 32 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 9762464e3f99..16b550949c57 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -52,6 +52,7 @@
>   #include <linux/wait.h>
>   #include <linux/sched.h>
>   #include <linux/completion.h>
> +#include <linux/dma-fence-unwrap.h>
>   #include <linux/dma-resv.h>
>   #include <uapi/linux/sched/types.h>
>   
> @@ -684,27 +685,14 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   }
>   EXPORT_SYMBOL(drm_sched_job_arm);
>   
> -/**
> - * drm_sched_job_add_dependency - adds the fence as a job dependency
> - * @job: scheduler job to add the dependencies to
> - * @fence: the dma_fence to add to the list of dependencies.
> - *
> - * Note that @fence is consumed in both the success and error cases.
> - *
> - * Returns:
> - * 0 on success, or an error on failing to expand the array.
> - */
> -int drm_sched_job_add_dependency(struct drm_sched_job *job,
> -				 struct dma_fence *fence)
> +static int drm_sched_job_add_single_dependency(struct drm_sched_job *job,
> +					       struct dma_fence *fence)
>   {
>   	struct dma_fence *entry;
>   	unsigned long index;
>   	u32 id = 0;
>   	int ret;
>   
> -	if (!fence)
> -		return 0;
> -
>   	/* Deduplicate if we already depend on a fence from the same context.
>   	 * This lets the size of the array of deps scale with the number of
>   	 * engines involved, rather than the number of BOs.
> @@ -728,6 +716,35 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   
>   	return ret;
>   }
> +
> +/**
> + * drm_sched_job_add_dependency - adds the fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @fence: the dma_fence to add to the list of dependencies.
> + *
> + * Note that @fence is consumed in both the success and error cases.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> +				 struct dma_fence *fence)
> +{
> +	struct dma_fence_unwrap iter;
> +	struct dma_fence *f;
> +	int ret = 0;
> +
> +	dma_fence_unwrap_for_each (f, &iter, fence) {
> +		dma_fence_get(f);
> +		ret = drm_sched_job_add_single_dependency(job, f);
> +		if (ret)
> +			break;
> +	}
> +
> +	dma_fence_put(fence);
> +
> +	return ret;
> +}
>   EXPORT_SYMBOL(drm_sched_job_add_dependency);
>   
>   /**

