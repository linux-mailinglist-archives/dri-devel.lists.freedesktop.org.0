Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FE75341A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8AA10E814;
	Fri, 14 Jul 2023 07:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB60710E80D;
 Fri, 14 Jul 2023 07:52:28 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so222331466b.2; 
 Fri, 14 Jul 2023 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689321147; x=1691913147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sOVlS2YAuvrsf20+jrFcg/um5olVmnGgBe34iQHZIlQ=;
 b=e7zQskFd1+/J6qaQJ5w9NuZJXYRISLqdmLBz8C6tlCDh6ZJ5vUxguMbOYC0DDc4c2t
 rZifVjB7YG1xrGJoJJY0nDROdlpjM5kuYO9I2cTR1d4T5F7Crp0dFpVGY+MNDr5wyxLv
 HG40R6eeryGox0pzOYqyKA+JAB+asg66z1fPpliAnVGtbNEqQkSA0LWfnlbZrptfs7qp
 d/p6hl8IoyX1SjHF5lYfDLRgfXNcQIzSHFnDSnqU0XTzl6hiUxXqDrWzcahK00YItxTe
 PnJ6M/MQyLIiG93/2obyg8ku9yWCdUreFrP2z2OdjLE/xGxJauW/kwg1Y0aFnMrJbMCp
 dEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689321147; x=1691913147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sOVlS2YAuvrsf20+jrFcg/um5olVmnGgBe34iQHZIlQ=;
 b=NFQbtkNYCnhBtaNYZIjIfPfmc6d1Fi8GDCwX24kHcsNqfi2f+0fjBbkSea9EqUhmNX
 38hgIgdtvTrN9lpuuHReN6uOablnOcHxoyuGRX30+NsAh35Sa+pfGGaeAgby6vbbq0JW
 6Fva8FcquGN2dmxMzmyjNbT2iCfMcJ9yMd2X6OhHn9va0+HPepQ87WjnldKWaKddPkWO
 olJAUTi6a4NRJAKgss8nex06HCl/BBYbIUf2V4gb4PVGNdbm7VqPJ9jBQvLxcXP3cBpU
 tyyg966KyNtRAdkuKGKekR94Iyfj6gTejkv7wH2jzf+ukwrtVrAiw67DrmbNINOyNmP5
 h6xQ==
X-Gm-Message-State: ABy/qLZlQ71rloLVWmNCnNQhuTCkvPoOhYGVL2soyMm7YwV+0qNf8lHT
 /u2CS+y2FOqlhmkO+Ppyx3I=
X-Google-Smtp-Source: APBJJlFJqBvBNQDT0oi8m1LKbRiN/jcbi6Zg8upgZIA9EcHPBqmkQw/o1nmRpJunvMsqiX8DwkdHyQ==
X-Received: by 2002:a17:907:767b:b0:988:8be0:3077 with SMTP id
 kk27-20020a170907767b00b009888be03077mr3466572ejc.31.1689321146417; 
 Fri, 14 Jul 2023 00:52:26 -0700 (PDT)
Received: from ?IPV6:2a00:e180:156e:8700:817e:6375:6a13:2da9?
 ([2a00:e180:156e:8700:817e:6375:6a13:2da9])
 by smtp.gmail.com with ESMTPSA id
 lf16-20020a170907175000b00993928e4d1bsm5046737ejc.24.2023.07.14.00.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 00:52:25 -0700 (PDT)
Message-ID: <72a40172-86a8-64c0-0c06-cbc670503370@gmail.com>
Date: Fri, 14 Jul 2023 09:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/6] drm/amdgpu: Limit info in coredump for kernel
 threads
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230713213242.680944-1-andrealmeid@igalia.com>
 <20230713213242.680944-5-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230713213242.680944-5-andrealmeid@igalia.com>
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
> If a kernel thread caused the reset, the information available to be
> logged will be limited, so return early in the dump function.

Why? The register values and vram lost state should still be valid.

Christian.

>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e80670420586..07546781b8b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4988,10 +4988,14 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>   	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>   	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> -	if (coredump->reset_task_info.pid)
> +	if (coredump->reset_task_info.pid) {
>   		drm_printf(&p, "process_name: %s PID: %d\n",
>   			   coredump->reset_task_info.process_name,
>   			   coredump->reset_task_info.pid);
> +	} else {
> +		drm_printf(&p, "GPU reset caused by a kernel thread\n");
> +		return count - iter.remain;
> +	}
>   
>   	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");

