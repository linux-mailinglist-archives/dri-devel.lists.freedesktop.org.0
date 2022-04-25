Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2650EC0B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 00:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA0C10EEA2;
	Mon, 25 Apr 2022 22:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB7110EEA2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 22:25:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id t25so28757414lfg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wt4SKBmA6dd3dzu1mZ1RfRyaYtR/x/4FZ2KdRLDFj/w=;
 b=QPsZgMq9SXue2UQ1itdFFnFRHTYz99R6bWiozqdCJ1DjeRHUBuaeHMoDWqMeLVq3qC
 6zn3z5PRQidDkoT5ynr71CckobSDuaaYq6OEtKwyqGFFWOuUpp0roRbuW0r0jNMuiB/2
 WtLhur6/V+llbtlNayllEvd44XCctKoZNqefEgr2AYQ76gJT14Jt4QcFT05ek0xV0L+t
 xvgxVSOC+uM0CVYFs83z6R4NRGJsdwzw/1KJyEx3Av94fRbvbrh7dlLzKPUHCsTvRvw6
 Qu315gYD31FKrwGn9K31G/7i2o80qfMeKYMH6ksad9qF9sFX5yIjEaCog8xX+b4c55OZ
 0BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wt4SKBmA6dd3dzu1mZ1RfRyaYtR/x/4FZ2KdRLDFj/w=;
 b=3QhhqFG8C1WrCQnUkNhHQzRrLwOSbNnP9SG4SnRCg/Fx0Lg135fM4z/T8hDswt3Z8/
 fLa0NPg0IHCB/jyXDEGFIPx+/XtJFycZ6kFt2ai0atHMPZB6a8ma9nUEcTmBivI+WKpQ
 60BUoYrdG00GZNT7AoVZqYWLkopbffWlDPBGRO6JG3ZjSJKgd77W72G0iVHjti/Bgwkw
 N0LoU26UL88cGOD8OIgkHTz5PaF0sdmXd3+SUou5tXpGmr6qaTW5zL+VLNIZZ3QPY4VF
 6lGyi7nH2q5hE78qDblNl/lTyctbkycUBNnRhVMPLuNdDX7W6b9b/UhCfgxlQfaavNNf
 eC0w==
X-Gm-Message-State: AOAM532G4Otjv7QSlQSMxAr4ui3A9fLqJ3swBNEEAJlsiJ3chA1KLC4r
 wb38fWTdTZZznAt5bVsmuWz7Hw==
X-Google-Smtp-Source: ABdhPJw0tFjZFuKCNqAzwmsqgFMUo+ArHGFhefQtAIvPI+U/f87C4DgCN1sMXpUvxSaY12lfIIyQ0A==
X-Received: by 2002:ac2:5601:0:b0:472:11a6:8287 with SMTP id
 v1-20020ac25601000000b0047211a68287mr1724721lfd.440.1650925541873; 
 Mon, 25 Apr 2022 15:25:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s30-20020a195e1e000000b00471fa87b819sm1041159lfb.271.2022.04.25.15.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:25:41 -0700 (PDT)
Message-ID: <53d24218-c04f-7157-bd62-997b7a970a5d@linaro.org>
Date: Tue, 26 Apr 2022 01:25:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-GB
To: cgel.zte@gmail.com
References: <0e6028f6-3fc1-2a27-0a45-0e024c632248@linaro.org>
 <20220424032418.3173632-1-lv.ruyi@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220424032418.3173632-1-lv.ruyi@zte.com.cn>
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
Cc: sean@poorly.run, quic_abhinavk@quicinc.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, lv.ruyi@zte.com.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, swboyd@chromium.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/04/2022 06:24, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2: don't print rc, and return -EINVAL rather than 0
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a42732b67349..c3566e6564b1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1239,10 +1239,9 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
>   	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> -	if (dp->irq < 0) {
> -		rc = dp->irq;
> -		DRM_ERROR("failed to get irq: %d\n", rc);
> -		return rc;
> +	if (!dp->irq) {
> +		DRM_ERROR("failed to get irq\n");
> +		return -EINVAL;
>   	}
>   
>   	rc = devm_request_irq(&dp->pdev->dev, dp->irq,


-- 
With best wishes
Dmitry
