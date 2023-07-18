Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B58757663
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F29F10E2F1;
	Tue, 18 Jul 2023 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4DB10E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:15:59 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso8909113e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689668157; x=1690272957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iw8rToh05r7bUfycHBeb+uZz00o8lFw7cQSPQLUCF2M=;
 b=tdM8sAUVKS2LHDZxtM7iRxFyCeKyFP/DhzOJ/LcgkJwYR8tK31PrRanIjDLxCKerFi
 Azz0AXE1Bv825E9D+/EbPXgtfE0b3ojU6znaC34tqB8U8GnLTnIG3CL+itF0HepL57GV
 L0LF8vZrF8UM1vUgvgiRpLgB2XXgiWYkxr0Kqt2KJqM8J9aEtD3mJQuaNvHvWmghxJng
 DjVZvsJjcISaQuZopEULICVLNs053lZBG5qjSo087RcINyWrmaoNUvyo0Q8qqhjjbZUA
 LZPc6EoevtJBR1R+ahTfTwnIWOMVhauDS6WtldaFOHXUUGJswcOZvMBwtVXrqwJ1iFzN
 ZUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689668157; x=1690272957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iw8rToh05r7bUfycHBeb+uZz00o8lFw7cQSPQLUCF2M=;
 b=W+ss7A6vAjt6mTLOnzlT4VYb3JbvZxG04c3Y5OoxfS0lZ21Lm73KsC0vjh/MoMkJns
 ayj4my56B4oG1wZYduvivBzBMxNB1a9N3tcS7A0N2E/UP3RRn4M/TLrwleB0E46zdDiA
 Y7/oHQfiXBkPQr9fvthxaSdANmWfi5XE1Oxd60+AHJlRrq2ucV3RB/8wdobGrggKHda2
 nJCRbVgWHY0qfab+Zm2dSVIqZXxTmupSYN+m/ZI3lsXUScc4ghtlU+onBJmRNI3M5MFK
 0XgM3+2dfJwFzFY652I1BM5AtAg5If5aNc9B5TMbrvNpI1e+bSCmcLrnybaNeKPjkND7
 BzrQ==
X-Gm-Message-State: ABy/qLamTcxPzyYdP2hN6hhOtI/zEVuzr/+Ut/ngqoREq254yksz/Ndg
 tPIsqk2saFnbPovUgHSUtT6LUQ==
X-Google-Smtp-Source: APBJJlG0i+8oZJSxOcAnNcuG+MiAU7YhlOlYb4AgmHWdYRATrnr8cHmgyMEWL/+T3Tpu+68WeMapPQ==
X-Received: by 2002:a05:6512:b1d:b0:4f8:4719:1f4a with SMTP id
 w29-20020a0565120b1d00b004f847191f4amr9888796lfu.7.1689668157012; 
 Tue, 18 Jul 2023 01:15:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05651211c800b004f9c44b3e6dsm320705lfr.127.2023.07.18.01.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 01:15:56 -0700 (PDT)
Message-ID: <c17625f5-515e-3c8a-29b8-0bef9f125dc4@linaro.org>
Date: Tue, 18 Jul 2023 11:15:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/dsi: add missing put_device()
Content-Language: en-GB
To: sunran001@208suo.com, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230718081139.16918-1-xujianghui@cdjrlc.com>
 <c07be8cdf5ceceeec6bc7918774c18e0@208suo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c07be8cdf5ceceeec6bc7918774c18e0@208suo.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 11:13, sunran001@208suo.com wrote:
> The of_find_device_by_node() takes a reference to the underlying device
> structure, we should release that reference.
> 
> Detected by coccinelle with the following ERROR:
> ./drivers/gpu/drm/msm/dsi/dsi.c:50:1-7: ERROR: missing put_device; call
> of_find_device_by_node on line 32, but without a corresponding object
> release within this function.
> 
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index baab79ab6e74..81461e8852a7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -46,7 +46,7 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>           DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", 
> __func__);
>           return -EPROBE_DEFER;
>       }
> -
> +    put_device(&pdev->dev);

NAK. First, you are putting pdev instead of phy_pdev. Next, the 
reference to the phy dev is correctly stored and then put in 
dsi_destroy(). Please do not make blind patches when reviewing static 
analyser warnings.

>       return 0;
>   }

-- 
With best wishes
Dmitry

