Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAA4FB12A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A2E10E32B;
	Mon, 11 Apr 2022 00:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329A810E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:53:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r18so2583943ljp.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 17:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CXm5mSwaFzwzu++u9kIOHnOh36g7ghfH6gNr3++uBxs=;
 b=ZgLIKzQad+UIXhvwSf+OMYFQR95XXCDgfdbZbmLSyUys+coUKRAZFrBx8CJTb7acPK
 EAmY9lUFYaQxjPK6n1LWaGz4pFdLyuMJRDHAGbJka9iw0H+aQxw0+FY4ioxWAzwRo1NI
 ZEG66HRw5csV2NRgVpWBRHvsX75LVPB35CPQwiD1mTcZwdvvFkd7MAR5xlF03CgSqhCW
 u2o+VXQwphHxMRN+dUEWK7qJ9Rj9S72czNdxi9o8ZaKeKx9HCbKuPN5VR5TEgg3AKy3a
 xWTX4BRCxouPVrUGXQtPMRx8IldlPOWXpZA3sSf/Ix60phSyRcJ2GkI0yMjPEDHzTEU9
 HebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CXm5mSwaFzwzu++u9kIOHnOh36g7ghfH6gNr3++uBxs=;
 b=XwxUvzl0/k22RFy2s4PG1+U5p+R+w1zuMo/y5EsowMrmHSxdX2m6UnY0wcrWP8h3no
 CKOkWlTXHvOKIjfBKTXTzViVLE1iuVzgRJ65wZannSATcorxd+RrrknwiN/Z4R9Z2DTq
 hu6NXK9rNHonHpMGHsaN6TNDvN+o4ujFbdKGdd2xxsh8s2lw0tu5kEiyJDdD/j7Zhyle
 2dR+7n+9qR3dWreyMD/1beVS3IkaHwrl9Xt3F3sP0InBkMQU7QsAL6sSAW5hPrNo0jTP
 Djd3CGKvIGb+DyL0w5zoJcishY7q+ZDjysmhqlm9u64vo40Pf2GjvuOpFY6dFADkGNru
 ptRg==
X-Gm-Message-State: AOAM533Hm0je4qIJwDAxcW0GTgu5NjRAjTN/1xwhFkHh6IX/PWvMmDUY
 0E9sFm6Rmy7ec1Jlb1BjVr9Duw==
X-Google-Smtp-Source: ABdhPJxyt0wopKX7fx+Gbcpumbb1jU9zmGiIFPN4SS2c3gNFlQccFPOBLZ8BD2gFf85jsGnoRSBT0g==
X-Received: by 2002:a05:651c:1046:b0:24a:edc2:d107 with SMTP id
 x6-20020a05651c104600b0024aedc2d107mr18796586ljm.285.1649638383435; 
 Sun, 10 Apr 2022 17:53:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a197105000000b0046bab1edfddsm47552lfc.264.2022.04.10.17.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 17:53:02 -0700 (PDT)
Message-ID: <4deb0930-b244-677a-9f97-3730686eff5a@linaro.org>
Date: Mon, 11 Apr 2022 03:53:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220330180541.62250-1-nathan@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220330180541.62250-1-nathan@kernel.org>
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
Cc: linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2022 21:05, Nathan Chancellor wrote:
> When building with CONFIG_PM=y and CONFIG_PM_SLEEP=n (such as ARCH=riscv
> allmodconfig), the following warnings/errors occur:
> 
>    drivers/gpu/drm/msm/adreno/adreno_device.c:679:12: error: 'adreno_system_resume' defined but not used [-Werror=unused-function]
>      679 | static int adreno_system_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/msm/adreno/adreno_device.c:655:12: error: 'adreno_system_suspend' defined but not used [-Werror=unused-function]
>      655 | static int adreno_system_suspend(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> These functions are only used in SET_SYSTEM_SLEEP_PM_OPS(), which
> evaluates to empty when CONFIG_PM_SLEEP is not set, making these
> functions unused.
> 
> Traditionally, these functions are marked as __maybe_unused but in this
> case, there is already an '#ifdef CONFIG_PM' in the code, so just do the
> same thing with CONFIG_PM_SLEEP to resolve the warning.
> 
> Fixes: 7e4167c9e021 ("drm/msm/gpu: Park scheduler threads for system suspend")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I'd suggest using __maybe_unused instead (and maybe even sending the 
followup patch changing the #ifdef CONFIG_PM to __maybe_unused too):

If the code is included into the compilation, it means it's more widely 
compile tested. Which tends to reveal obscure bugs, dependencies, etc.


> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 661dfa7681fb..b25915230bab 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -621,6 +621,7 @@ static int adreno_runtime_suspend(struct device *dev)
>   	return gpu->funcs->pm_suspend(gpu);
>   }
>   
> +#ifdef CONFIG_PM_SLEEP
>   static void suspend_scheduler(struct msm_gpu *gpu)
>   {
>   	int i;
> @@ -681,8 +682,8 @@ static int adreno_system_resume(struct device *dev)
>   	resume_scheduler(dev_to_gpu(dev));
>   	return pm_runtime_force_resume(dev);
>   }
> -
> -#endif
> +#endif /* CONFIG_PM_SLEEP */
> +#endif /* CONFIG_PM */
>   
>   static const struct dev_pm_ops adreno_pm_ops = {
>   	SET_SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resume)
> 
> base-commit: 05241de1f69eb7f56b0a5e0bec96a7752fad1b2f


-- 
With best wishes
Dmitry
