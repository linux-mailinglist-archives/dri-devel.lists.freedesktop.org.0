Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62777DDB5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BA310E314;
	Wed, 16 Aug 2023 09:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FFF10E314;
 Wed, 16 Aug 2023 09:48:22 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so15191957a12.1; 
 Wed, 16 Aug 2023 02:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692179301; x=1692784101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LBkJe7BITaKSmj7NiH7cTlx5O0LFMlCti7ye0ReeYvA=;
 b=ZhXGC1pe7MXcatVqk42uv90DXCLLN1dl+fKZ0yEYJw5sld7cwXzDF1HqpjIp1bsLSH
 2gCPkc7Z+eujaWXvJe7JmGn406fHKJQou92oM1d5NuygnhE3CVZSd9B/DkT7JiBQ1+Y1
 SKgxgFlNPRV8HU6EPC6hB/Q5xCQZZdTqUuIj6MgK3U5y4ELjC+ashE1UMhhoiUUzZ+aU
 3wqlQxOSr9V/H2KJlXQ+aNIHNvKSJmyS/WiIX6DnKN+KiMlOAN7t7JYoqCArxlW3MaEV
 +T9kUbeCsmMHv+2mU8XhUDiZPXex5T4UX9YRHHiGcCGlwjZLYk+Yzyhn8ZWp1ev6lgFw
 BAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692179301; x=1692784101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LBkJe7BITaKSmj7NiH7cTlx5O0LFMlCti7ye0ReeYvA=;
 b=h+AbeinEeDcc3otU0ws5LCHhK272HBKNHJS/FWSMMhZnMX7I8U7Cx2qIq3qHnnBb0L
 Lv0vI/SFHoY4sFJBSFFvc5JV8iOd4m4rgzNo/kl6nHrV+ssBcgFYQEwcNPPN1+bJTHHw
 JZUIGLt4VDDUUAt7fP2qubA5XvnNSNWUK31Aa4zL/jvsZZHJkKk2mjzuFpgOHQ4RgUEi
 FCF84JX5y2NNhtRD4oTqVmZA4yRvBV6066E6Wns0x70z5Zx6okv8N0o2KfhrztS063YL
 JCEFYmK7p6HLCwmJd6XL7BeHG2oGDX/Ld40B5sB+qLmgp4eOqBR6slUKEn2NtQcJxIOl
 uLsw==
X-Gm-Message-State: AOJu0YyJWwJ/9cETGDBKzwgruqiBy6cZYuDGZazaNHmLKcK07trc6Ti6
 y6Szp1s9TTe/ko9+NkrPRho=
X-Google-Smtp-Source: AGHT+IEk2/EHFHtBeJHuE+9roAWrYHFL7uR3nraac6e7mEuQqUjE8c+5HnRYPHkOpgJl+PArX9qSWw==
X-Received: by 2002:a05:6402:11ce:b0:522:ddeb:cdcb with SMTP id
 j14-20020a05640211ce00b00522ddebcdcbmr5559574edw.18.1692179300904; 
 Wed, 16 Aug 2023 02:48:20 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15f4:7600:6260:d6f0:1ba4:569e?
 ([2a00:e180:15f4:7600:6260:d6f0:1ba4:569e])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a056402040900b0051dd19d6d6esm8145539edv.73.2023.08.16.02.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 02:48:20 -0700 (PDT)
Message-ID: <55088d5f-b241-8121-4ac5-e3b0c7cc53c5@gmail.com>
Date: Wed, 16 Aug 2023 11:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Rework coredump to use memory
 dynamically
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <20230815195100.294458-1-andrealmeid@igalia.com>
 <20230815195100.294458-3-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230815195100.294458-3-andrealmeid@igalia.com>
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
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.23 um 21:50 schrieb André Almeida:
> Instead of storing coredump information inside amdgpu_device struct,
> move if to a proper separated struct and allocate it dynamically. This
> will make it easier to further expand the logged information.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Shashank can you take a look at this one?

Thanks,
Christian.

> ---
> v4: change kmalloc to kzalloc
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 63 ++++++++++++++--------
>   2 files changed, 49 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9c6a332261ab..0d560b713948 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1088,11 +1088,6 @@ struct amdgpu_device {
>   	uint32_t                        *reset_dump_reg_list;
>   	uint32_t			*reset_dump_reg_value;
>   	int                             num_regs;
> -#ifdef CONFIG_DEV_COREDUMP
> -	struct amdgpu_task_info         reset_task_info;
> -	bool                            reset_vram_lost;
> -	struct timespec64               reset_time;
> -#endif
>   
>   	bool                            scpm_enabled;
>   	uint32_t                        scpm_status;
> @@ -1105,6 +1100,15 @@ struct amdgpu_device {
>   	uint32_t			aid_mask;
>   };
>   
> +#ifdef CONFIG_DEV_COREDUMP
> +struct amdgpu_coredump_info {
> +	struct amdgpu_device		*adev;
> +	struct amdgpu_task_info         reset_task_info;
> +	struct timespec64               reset_time;
> +	bool                            reset_vram_lost;
> +};
> +#endif
> +
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>   {
>   	return container_of(ddev, struct amdgpu_device, ddev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index bf4781551f88..b5b879bcc5c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4799,12 +4799,17 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_DEV_COREDUMP
> +#ifndef CONFIG_DEV_COREDUMP
> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +			    struct amdgpu_reset_context *reset_context)
> +{
> +}
> +#else
>   static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   		size_t count, void *data, size_t datalen)
>   {
>   	struct drm_printer p;
> -	struct amdgpu_device *adev = data;
> +	struct amdgpu_coredump_info *coredump = data;
>   	struct drm_print_iterator iter;
>   	int i;
>   
> @@ -4818,21 +4823,21 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
>   	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>   	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> -	drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, adev->reset_time.tv_nsec);
> -	if (adev->reset_task_info.pid)
> +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> +	if (coredump->reset_task_info.pid)
>   		drm_printf(&p, "process_name: %s PID: %d\n",
> -			   adev->reset_task_info.process_name,
> -			   adev->reset_task_info.pid);
> +			   coredump->reset_task_info.process_name,
> +			   coredump->reset_task_info.pid);
>   
> -	if (adev->reset_vram_lost)
> +	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> -	if (adev->num_regs) {
> +	if (coredump->adev->num_regs) {
>   		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>   
> -		for (i = 0; i < adev->num_regs; i++)
> +		for (i = 0; i < coredump->adev->num_regs; i++)
>   			drm_printf(&p, "0x%08x: 0x%08x\n",
> -				   adev->reset_dump_reg_list[i],
> -				   adev->reset_dump_reg_value[i]);
> +				   coredump->adev->reset_dump_reg_list[i],
> +				   coredump->adev->reset_dump_reg_value[i]);
>   	}
>   
>   	return count - iter.remain;
> @@ -4840,14 +4845,32 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   
>   static void amdgpu_devcoredump_free(void *data)
>   {
> +	kfree(data);
>   }
>   
> -static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +			    struct amdgpu_reset_context *reset_context)
>   {
> +	struct amdgpu_coredump_info *coredump;
>   	struct drm_device *dev = adev_to_drm(adev);
>   
> -	ktime_get_ts64(&adev->reset_time);
> -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_NOWAIT,
> +	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
> +
> +	if (!coredump) {
> +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
> +		return;
> +	}
> +
> +	coredump->reset_vram_lost = vram_lost;
> +
> +	if (reset_context->job && reset_context->job->vm)
> +		coredump->reset_task_info = reset_context->job->vm->task_info;
> +
> +	coredump->adev = adev;
> +
> +	ktime_get_ts64(&coredump->reset_time);
> +
> +	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
>   		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>   }
>   #endif
> @@ -4955,15 +4978,9 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   					goto out;
>   
>   				vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
> -#ifdef CONFIG_DEV_COREDUMP
> -				tmp_adev->reset_vram_lost = vram_lost;
> -				memset(&tmp_adev->reset_task_info, 0,
> -						sizeof(tmp_adev->reset_task_info));
> -				if (reset_context->job && reset_context->job->vm)
> -					tmp_adev->reset_task_info =
> -						reset_context->job->vm->task_info;
> -				amdgpu_reset_capture_coredumpm(tmp_adev);
> -#endif
> +
> +				amdgpu_coredump(tmp_adev, vram_lost, reset_context);
> +
>   				if (vram_lost) {
>   					DRM_INFO("VRAM is lost due to GPU reset!\n");
>   					amdgpu_inc_vram_lost(tmp_adev);

