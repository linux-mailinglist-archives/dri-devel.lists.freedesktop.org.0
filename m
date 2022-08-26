Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE95A2354
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087FD10E764;
	Fri, 26 Aug 2022 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDA110E764
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:41:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z25so1131468lfr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jkT6gfgICzVkFvceCDxEfQxnxppLCkfQb5gmM0FPJRg=;
 b=rin1WIxVfyiLMGrE8Uh+xahqZfKsOPuxS3QTtDklgYTUzlvoE5bB1IVgg3SNDIJHUx
 CG7kgg6SG8vQn7GiIxIRtSbqy9FzTM29mYE2eZQEih+v19mqG9T0zv2FOUy6V0APQZ/g
 9Ws8U04aMXHtV1hYL1Uo5uqKK5wtoSOY6o1Q/WiiTItE95E2uqGOZIMwHXxQr3CI2GJz
 lwr/S1aIs78HaihY5rrwtIdXucXVORiCXfjExvgZSr0d3crgS/OLOKqaCb7LiwEGrcfA
 +jG/wpNRqQluD1aBZf5w8htL5VlAkPA64qWePYOmER2pipKHjhGGYHIdMddI2ILRoyx6
 5lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jkT6gfgICzVkFvceCDxEfQxnxppLCkfQb5gmM0FPJRg=;
 b=c1vgGVAP80WWjGw3EyJ3MOIhX14sGTGtV6lQ0L1+7ZSOilk6eqR9g6A7XlmiEdjoRK
 GOiEUc1K4pP5sdgr/6L50boMbVEVYYPd7ZNSmxFGEJMat0BCvbCEqnlo9tkppx0Kznjw
 vbs84y6XOO92FPNbbX/SqTa8hDkL0ebUvomoaxsUIZhoAUWl8RizO6Olyg/nMFKJvG4j
 LXC2uORX4/bVq6GqBC9fUocBwH9dtnlxa8Xe3ekizlhiurumvdFxc+rMhIZ941xyMfce
 fONI/2ro//+CLwUb93PpEOyZd55PobMA+Uo3D9oPncQ8pMVkrW4sVOqfyI/hUMnikZJ9
 olbQ==
X-Gm-Message-State: ACgBeo3YYeodGPab+tIt8Pjc2owDsfZDrhq7nypgzdVuQqfMoGCqlbfn
 +KcVertWaUkWFUddYAzbNFB4KQ==
X-Google-Smtp-Source: AA6agR5A/b73aktwecITAWQUppQ5OiPqU+lEF99OaO/Wi/Q0aVV+ToX6wP4FSKt7x8kynNkKltrQaw==
X-Received: by 2002:a05:6512:39d3:b0:492:e172:e313 with SMTP id
 k19-20020a05651239d300b00492e172e313mr2006474lfu.628.1661503291407; 
 Fri, 26 Aug 2022 01:41:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05651220cb00b00492df838a40sm295396lfr.280.2022.08.26.01.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 01:41:30 -0700 (PDT)
Message-ID: <f70f9f1b-c835-7baf-974d-87f2bf6e4e53@linaro.org>
Date: Fri, 26 Aug 2022 11:41:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [v2] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
 <29ae886c-b2b2-2387-87cb-e4a885080418@linaro.org>
In-Reply-To: <29ae886c-b2b2-2387-87cb-e4a885080418@linaro.org>
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
Cc: dianders@chromium.org, vpolimer@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, kalyant@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/06/2022 15:23, Dmitry Baryshkov wrote:
> On 03/06/2022 12:42, Vinod Polimera wrote:
>> During probe defer, drm device is not initialized and an external
>> trigger to shutdown is trying to clean up drm device leading to crash.
>> Add checks to avoid drm device cleanup in such cases.
>>
>> BUG: unable to handle kernel NULL pointer dereference at virtual
>> address 00000000000000b8
>>
>> Call trace:
>>
>> drm_atomic_helper_shutdown+0x44/0x144
>> msm_pdev_shutdown+0x2c/0x38
>> platform_shutdown+0x2c/0x38
>> device_shutdown+0x158/0x210
>> kernel_restart_prepare+0x40/0x4c
>> kernel_restart+0x20/0x6c
>> __arm64_sys_reboot+0x194/0x23c
>> invoke_syscall+0x50/0x13c
>> el0_svc_common+0xa0/0x17c
>> do_el0_svc_compat+0x28/0x34
>> el0_svc_compat+0x20/0x70
>> el0t_32_sync_handler+0xa8/0xcc
>> el0t_32_sync+0x1a8/0x1ac
>>
>> Changes in v2:
>> - Add fixes tag.
>>
>> Fixes: 623f279c778 ("drm/msm: fix shutdown hook in case GPU components 
>> failed to bind")
>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 4448536..d62ac66 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -142,6 +142,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
>>       struct msm_drm_private *priv = dev->dev_private;
>>       struct msm_kms *kms = priv->kms;
>> +    if (!irq_has_action(kms->irq))
>> +        return;
> 
> As a second thought I'd still prefer a variable here. irq_has_action 
> would check that there is _any_ IRQ handler for this IRQ. While we do 
> not have anybody sharing this IRQ, I'd prefer to be clear here, that we 
> do not want to uninstall our IRQ handler rather than any IRQ handler.

Vinod, do we still want to pursue this fix? If so, could you please 
update it according to the comment.

> 
>> +
>>       kms->funcs->irq_uninstall(kms);
>>       if (kms->irq_requested)
>>           free_irq(kms->irq, dev);
>> @@ -259,6 +262,7 @@ static int msm_drm_uninit(struct device *dev)
>>       ddev->dev_private = NULL;
>>       drm_dev_put(ddev);
>> +    priv->dev = NULL;
>>       destroy_workqueue(priv->wq);
>> @@ -1167,7 +1171,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
>>       struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>       struct drm_device *drm = priv ? priv->dev : NULL;
>> -    if (!priv || !priv->kms)
>> +    if (!priv || !priv->kms || !drm)
>>           return;
>>       drm_atomic_helper_shutdown(drm);
> 
> 

-- 
With best wishes
Dmitry

