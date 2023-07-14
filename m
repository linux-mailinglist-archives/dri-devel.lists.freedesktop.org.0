Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AFB75338E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706AC10E7FF;
	Fri, 14 Jul 2023 07:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5248210E7FD;
 Fri, 14 Jul 2023 07:50:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9928abc11deso213646266b.1; 
 Fri, 14 Jul 2023 00:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689321023; x=1691913023;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WS0uRbknENSFdhFyzOpTBxGUHhSmQi3/u5sdc2+cv28=;
 b=MT3RHzYfatlsktEfUwhZ4T41uHOlJSAajosy8POWYmo98w03os4GfagCgRREa7BoC9
 fOrX04cWgfF2dG+S82LR8SjlthNpsk1GCKfidm8Wy94xWWesDePrx6UyqlcETZwAZkK3
 3IOLbLgNu7oGHbVBlZW0XizZCqCqwb1x/zLlebjSPLLu/McfGZzcUnMrcD3XKT9H7opS
 aP5hzkxQDYjPdCFij4pW1G2QfrozQwoN/0rDOyyAZYZWhKo0aGye4pBkg7Zk1e0ImmiB
 kVpMJnYrqElJietXYC4/HR5rTIfRJLf81Pd7yhFR+uwuV3+C30VdQvABzrp2Y9ARHsz3
 T9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689321023; x=1691913023;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WS0uRbknENSFdhFyzOpTBxGUHhSmQi3/u5sdc2+cv28=;
 b=P6PbgBLO0xi+Izq27xvgE9MHRpLTCjmc9St+GT86OODwGS8VBOu5fqcdMlTPaTIaTc
 Z/HVh4xYPvBlXyboMjR7nvp3fERdilIA0nSBzVuwZ5wfQ5B/SOmYq2q6uQ06GegIVAl0
 VP5F23xVw/KrhCQiLXDq5FVVtXHkXSFWGqea37fZ85cpo+cj0rOdXTwNtDzlCHBMXulz
 OsK897LmLX0Tj/yKNHkw3pEVLRZlIv274wt8DlnTvkEIHb31x6wIDHtGpfts793ypjQ6
 /odTDsYaFAfLvq3MKBNWyfHv3NM6dj6f+FdoPSLO+WVLzrJ+DoCwIgPnPLXMxuCCkoXL
 TlOg==
X-Gm-Message-State: ABy/qLYodu5WTI+yM3PhrnD+oEhfP4tfwt/3Czsb7nzzFilrv7YOoZF4
 20b1zAT9FZCq6nl1IA3SrPY=
X-Google-Smtp-Source: APBJJlGyf2JY/FhxaHjGybcshfi+GT0jf0yTIK77WHTzLdrH8owNW5XBn7XuYbFFeBUVUbLKK8JQjQ==
X-Received: by 2002:a17:906:1009:b0:994:5340:22f4 with SMTP id
 9-20020a170906100900b00994534022f4mr391867ejm.6.1689321023278; 
 Fri, 14 Jul 2023 00:50:23 -0700 (PDT)
Received: from ?IPV6:2a00:e180:156e:8700:817e:6375:6a13:2da9?
 ([2a00:e180:156e:8700:817e:6375:6a13:2da9])
 by smtp.gmail.com with ESMTPSA id
 lc16-20020a170906f91000b0096f6a131b9fsm5041020ejb.23.2023.07.14.00.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 00:50:22 -0700 (PDT)
Message-ID: <f5c72c41-5d36-710c-72a8-c06260a2df41@gmail.com>
Date: Fri, 14 Jul 2023 09:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/6] drm/amdgpu: Rework coredump to use memory
 dynamically
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230713213242.680944-1-andrealmeid@igalia.com>
 <20230713213242.680944-4-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230713213242.680944-4-andrealmeid@igalia.com>
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
> Instead of storing coredump information inside amdgpu_device struct,
> move if to a proper separated struct and allocate it dynamically. This
> will make it easier to further expand the logged information.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Replace GFP_KERNEL with GPF_NOWAIT

Much better, thanks!

>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 65 ++++++++++++++--------
>   2 files changed, 51 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index dbe062a087c5..e1cc83a89d46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1068,11 +1068,6 @@ struct amdgpu_device {
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
> @@ -1085,6 +1080,15 @@ struct amdgpu_device {
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

We should probably put that into amdgpu_reset.h instead and move the 
amdgpu_coredump_* functions into amdgpu_reset.c as well.

Apart from that this looks good of hand.

Thanks,
Christian.

>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>   {
>   	return container_of(ddev, struct amdgpu_device, ddev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a824f844a984..e80670420586 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4963,12 +4963,17 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
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
> @@ -4982,21 +4987,21 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
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
> @@ -5004,14 +5009,34 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
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
> +	coredump = kmalloc(sizeof(*coredump), GFP_NOWAIT);
> +
> +	if (!coredump) {
> +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
> +		return;
> +	}
> +
> +	memset(coredump, 0, sizeof(*coredump));
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
> @@ -5119,15 +5144,9 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
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

