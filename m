Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D175346C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A1A10E078;
	Fri, 14 Jul 2023 07:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE1D10E078;
 Fri, 14 Jul 2023 07:57:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-991c786369cso210376366b.1; 
 Fri, 14 Jul 2023 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689321461; x=1691913461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J5ElJcCisTjTfQ81l4I/8cbaR6lPIqj8nspiY8+QPbo=;
 b=cl74GZw1rLNDlObn1H0rDHOmAQcY0x7dSphtCKEbGFS2NS1i0Eg9+y1ZuSm+t6Llqy
 cU8pttD+1H4AYiQj6ehEm1S9Aqg+OQkdYtNkHb89lVRxohvWR7/6swVroTQzUqCV7V8D
 LZ7v62it/YBY1Nob8vlNE+aIxpm77K4D60NLMQrBB0gr2EiDqbKPRF1u1WLrvU0Gs77B
 GNQ5d1Rr9q9t3I/VdLX/V0cDkotFGpxx+OFvKPzuqBSrPEgzPoyP9A2KvX27VCGadbE4
 hTEpgBDT1+hPy2Bk6B0rw0OEZeFVgGf0OjqMkPBJWd4EgUCe/10+Zh8YhfqiSSipGG8f
 +6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689321461; x=1691913461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J5ElJcCisTjTfQ81l4I/8cbaR6lPIqj8nspiY8+QPbo=;
 b=RemjkOrZAiWjnyvt4lWayePMqktxAJ4oReEfevrjcmoUZ061xp24uvaj2xn6C4KD1d
 DN9I8t0H+22jTlYfEQ5zQl85HC/Y3IFKqXUzTNI4jXb/pW7PMi9ZeeX0WchiM40uvgKH
 aQPDxK6GTsStnzguyVit0A91IW0HNoQWSS0j02XnWwRnYOaGWQJaUsXccygVA/7igDc6
 ZRygv9qyPUk6evq2KAlt6/glp7TezeRyImAFVwa/Nzr4fSd4uWOrMxILV4pjrF2OLRIC
 5jy7AMF+8FdI+jPWk5sozgtJeCwo2Hmf/F3lkgtJLV/sur4EKQgvbS44xIeoO6bYV37J
 RDLg==
X-Gm-Message-State: ABy/qLZ4hg0Ut5uXphgl4QQoBDuXt/gXkpbGlNrj4fndVsC84GsPyTdp
 1g0zES7KtzqgnqMCF0AXtyGv5+adsmY=
X-Google-Smtp-Source: APBJJlH5SoaeB9vzqm17ilB32zwQfDLRF6M/of9REA5jG11AZA/r44YTR2+Z2CBn4HUBYnonpvM8Tw==
X-Received: by 2002:a17:906:2487:b0:992:9d41:875b with SMTP id
 e7-20020a170906248700b009929d41875bmr2967787ejb.32.1689321461287; 
 Fri, 14 Jul 2023 00:57:41 -0700 (PDT)
Received: from ?IPV6:2a00:e180:156e:8700:817e:6375:6a13:2da9?
 ([2a00:e180:156e:8700:817e:6375:6a13:2da9])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a17090607d900b0097404f4a124sm4968547ejc.2.2023.07.14.00.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 00:57:40 -0700 (PDT)
Message-ID: <6485568b-da41-b549-f6bd-36139df59215@gmail.com>
Date: Fri, 14 Jul 2023 09:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/6] drm/amdgpu: Log IBs and ring name at coredump
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230713213242.680944-1-andrealmeid@igalia.com>
 <20230713213242.680944-6-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230713213242.680944-6-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.23 um 23:32 schrieb André Almeida:
> Log the IB addresses used by the hung job along with the stuck ring
> name. Note that due to nested IBs, the one that caused the reset itself
> may be in not listed address.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 +++++++++++++++++++++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index e1cc83a89d46..cfeaf93934fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1086,6 +1086,9 @@ struct amdgpu_coredump_info {
>   	struct amdgpu_task_info         reset_task_info;
>   	struct timespec64               reset_time;
>   	bool                            reset_vram_lost;
> +	u64				*ibs;
> +	u32				num_ibs;
> +	char				ring_name[16];
>   };
>   #endif
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 07546781b8b8..431ccc3d7857 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5008,12 +5008,24 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   				   coredump->adev->reset_dump_reg_value[i]);
>   	}
>   
> +	if (coredump->num_ibs) {
> +		drm_printf(&p, "IBs:\n");
> +		for (i = 0; i < coredump->num_ibs; i++)
> +			drm_printf(&p, "\t[%d] 0x%llx\n", i, coredump->ibs[i]);
> +	}
> +
> +	if (coredump->ring_name[0] != '\0')
> +		drm_printf(&p, "ring name: %s\n", coredump->ring_name);
> +
>   	return count - iter.remain;
>   }
>   
>   static void amdgpu_devcoredump_free(void *data)
>   {
> -	kfree(data);
> +	struct amdgpu_coredump_info *coredump = data;
> +
> +	kfree(coredump->ibs);
> +	kfree(coredump);
>   }
>   
>   static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> @@ -5021,6 +5033,8 @@ static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>   {
>   	struct amdgpu_coredump_info *coredump;
>   	struct drm_device *dev = adev_to_drm(adev);
> +	struct amdgpu_job *job = reset_context->job;
> +	int i;
>   
>   	coredump = kmalloc(sizeof(*coredump), GFP_NOWAIT);
>   
> @@ -5038,6 +5052,21 @@ static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>   
>   	coredump->adev = adev;
>   
> +	if (job && job->num_ibs) {

I really really really don't want any dependency of the core dump 
feature towards the job.

What we could do is to record the first executed IB VAs in the hw fence, 
but I'm not sure how useful this is in the first place.

We have some internal feature in progress to query the VA of the draw 
command which cause the waves currently executing in the SQ to be retrieved.

> +		struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
> +		u32 num_ibs = job->num_ibs;
> +
> +		coredump->ibs = kmalloc_array(num_ibs, sizeof(coredump->ibs), GFP_NOWAIT);

This can fail pretty easily.

Christian.

> +		if (coredump->ibs)
> +			coredump->num_ibs = num_ibs;
> +
> +		for (i = 0; i < coredump->num_ibs; i++)
> +			coredump->ibs[i] = job->ibs[i].gpu_addr;
> +
> +		if (ring)
> +			strncpy(coredump->ring_name, ring->name, 16);
> +	}
> +
>   	ktime_get_ts64(&coredump->reset_time);
>   
>   	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,

