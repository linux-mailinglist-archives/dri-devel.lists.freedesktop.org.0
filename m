Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282653C7A2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 11:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1188C10FD29;
	Fri,  3 Jun 2022 09:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C3110E8E4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 09:37:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id be31so11725144lfb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FW0OcKetvC+lIk9+vSqmJ/X3hAy+zPwOBgA78zc4X9g=;
 b=gsfcUH8Mjbs6vjWR6OVLef3RXGt1dL0wLj1g24Hf+pBBKPWb7DigyiRPMOzeFr1u5j
 VOZA2/5b1K5xxYk40BbIxjpkydmyzWhH1U9Btq6iUH6VWU/APWVbYtRtyESOvZaaw51I
 +EUA96OYgC2x0/HQ2+mkaO0puaMAaviz878cYidQDovK5uqTOX6sxw5W9rpywSwdGh4P
 gGl4hSzcNXu6sNniK6+bgPD7StWd26qfR987HhPjqOcWcEdWLPnEk+FD5WnLdL3NMY0t
 WMVCbGaEZQnxTzW4t+EN/4MZ1LuhnhqTNu92C8hJX6PE3fq0uyCQRmc2LuyjkP2lR7qQ
 eQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FW0OcKetvC+lIk9+vSqmJ/X3hAy+zPwOBgA78zc4X9g=;
 b=7eE9/dedPI4Od/SRokWLASVNRzzM0Sv9aBBEgDEP2zl/usg6DcvgvNCFme7aL72Ogo
 8qMKCbcJ9AuhIRzPfaWEHnCtq5eh060i85ppi8sgcbrEzED3J9Mbk3/xVCwk541sCfKq
 En5rx8O5YSRVy8n7mxT4sHzhbjeZ7zRH4AhWRsgoV3K4o7BtiGL/YzVodz4Jbm8sWGyy
 PQfZIILG5+JEVy5kumv2X2tC7u9525v4XO31buUlQME+gPAUGcCihoHvyw57jNsDYXKJ
 3JmkoEr6drSSbcy6Ptj1ig4gAd/y0HJL3tFTcq2/SQF5C9rjy+sN4N89PXpFA6eHUIuR
 BNXg==
X-Gm-Message-State: AOAM531rg3zQcv5KZMYX9t2KJQ6s3/aJmzooXawypASqU/A0oHjnz/4D
 uhVO39zujv8PDX6R2kCZoeZSqw==
X-Google-Smtp-Source: ABdhPJy0JDZdzd64R/DyMNpsWi27+cupEdKSB8cuAXvobGfOOEW9jK6d7eY1QpJq4wPO2tK0VMchUg==
X-Received: by 2002:a05:6512:2251:b0:478:fc67:b09f with SMTP id
 i17-20020a056512225100b00478fc67b09fmr6087124lfu.196.1654249022539; 
 Fri, 03 Jun 2022 02:37:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a0565123d1000b0047255d21132sm1494245lfv.97.2022.06.03.02.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 02:37:02 -0700 (PDT)
Message-ID: <01f88e7a-eeef-d538-634d-bb8e7c1272a0@linaro.org>
Date: Fri, 3 Jun 2022 12:37:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [v1] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1654248167-10594-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654248167-10594-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: dianders@chromium.org, vpolimer@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, kalyant@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/06/2022 12:22, Vinod Polimera wrote:
> During probe defer, drm device is not initialized and an external
> trigger to shutdown is trying to clean up drm device leading to crash.
> Add checks to avoid drm device cleanup in such cases.
> 
> BUG: unable to handle kernel NULL pointer dereference at virtual
> address 00000000000000b8
> 
> Call trace:
> 
> drm_atomic_helper_shutdown+0x44/0x144
> msm_pdev_shutdown+0x2c/0x38
> platform_shutdown+0x2c/0x38
> device_shutdown+0x158/0x210
> kernel_restart_prepare+0x40/0x4c
> kernel_restart+0x20/0x6c
> __arm64_sys_reboot+0x194/0x23c
> invoke_syscall+0x50/0x13c
> el0_svc_common+0xa0/0x17c
> do_el0_svc_compat+0x28/0x34
> el0_svc_compat+0x20/0x70
> el0t_32_sync_handler+0xa8/0xcc
> el0t_32_sync+0x1a8/0x1ac
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Fixes ?

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4448536..d62ac66 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -142,6 +142,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   
> +	if (!irq_has_action(kms->irq))
> +		return;
> +

Is this part required with 
https://patchwork.freedesktop.org/patch/485422/?series=103702&rev=1?

>   	kms->funcs->irq_uninstall(kms);
>   	if (kms->irq_requested)
>   		free_irq(kms->irq, dev);
> @@ -259,6 +262,7 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	ddev->dev_private = NULL;
>   	drm_dev_put(ddev);
> +	priv->dev = NULL;

What are you trying to protect here?

>   
>   	destroy_workqueue(priv->wq);
>   
> @@ -1167,7 +1171,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
>   	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>   	struct drm_device *drm = priv ? priv->dev : NULL;
>   
> -	if (!priv || !priv->kms)
> +	if (!priv || !priv->kms || !drm)
>   		return;
>   
>   	drm_atomic_helper_shutdown(drm);


-- 
With best wishes
Dmitry
