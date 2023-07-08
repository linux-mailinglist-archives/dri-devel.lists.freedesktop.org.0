Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737EE74BA62
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 02:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356E210E61F;
	Sat,  8 Jul 2023 00:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A4D10E61F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 00:06:15 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b6ff1ad155so44897841fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 17:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688774773; x=1691366773;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uOm6ONPFmI/dV+4chdGjJVecrD5MmlD4Ahx6W6/8yEc=;
 b=sFzALzpLbJoMKAhx/sceY4MghcwmclKzQE27quEyVSGyYGdsbRROO24OlDOhvq9hq8
 8sxzqii+IY7IHuS2vEbXUn6uCeIbOUFte0tXGKEFfHGU8wPVu7wADNRanEG+o6drAds3
 Q4/Uy/J/Bo1tbDWvdqi+2n5Y5ww91fvi6sKyt5qEQZ2SOylx5TzIHXQ5BWmi1FaZ3Rrl
 IIwdu/LTc53jbRwVlk9DB8w7prWdm4cYFcKk/ipoZjGMzLFnfe+iEUqDIkaIV032/8/D
 L+mMiXtsJQsD8YYmVnJl6lKZhOJg/teks6r7P+gVVoY+S+/Nb4O6HLy8nFinbWagjAWL
 vH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688774773; x=1691366773;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uOm6ONPFmI/dV+4chdGjJVecrD5MmlD4Ahx6W6/8yEc=;
 b=AjlCWWd/H+i89AMIhuBF5YdF5F1ZHc2APCqXgU0DPUvLO7gmKZCUkyRhEVZdVhsk6d
 jiPoPr9mCl2kxoogKuoEX+KMqERKYdGNKTOxpMMLyooZ3IrNnboRV4485UD0exqv5VFp
 pkPUxEOhSvmss3UKLc/w64k8IxUDx/Lrwno+rcwQWFMoRLvY5Dc2NscEYpzbOwGo6jm0
 1WbJyo3kyqbNMid/nrisEK9i6PGEi5EaTRLxBYxyc+4n1MdH4Axp+zuH22XMKDQg+nCN
 Zalep37aGjbApYe8Wt/7TmzR9UBScGL5o7TVQc/GdtZ8yCogsKU9QSDUjGcWyhbnuaoT
 JUqQ==
X-Gm-Message-State: ABy/qLZ0N3lwgrjKAI7coYdhoMiptc2RrAwWaYfnNrNGzLNmXGvOAYVJ
 jfxkUZIIuIx+BBWge/kKYOMHSA==
X-Google-Smtp-Source: APBJJlHOik++wv/6w70KRSrv0bT3G7Snk21fU2xY9sNvvffzWq/fv3vPH6Vbrndhf8+kCMQIlNUieA==
X-Received: by 2002:a2e:2e17:0:b0:2b6:cd70:2781 with SMTP id
 u23-20020a2e2e17000000b002b6cd702781mr2298551lju.12.1688774773242; 
 Fri, 07 Jul 2023 17:06:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a2e2e14000000b002b6c61bac2esm988436lju.92.2023.07.07.17.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 17:06:12 -0700 (PDT)
Message-ID: <fc5501cf-c335-81f7-1ad7-26fdc1b6922d@linaro.org>
Date: Sat, 8 Jul 2023 03:06:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/5] drm/msm/dp: remove pm_runtime_xxx() from dp_power.c
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2023 02:52, Kuogee Hsieh wrote:
> Since both pm_runtime_resume() and pm_runtime_suspend() are not
> populated at dp_pm_ops. Those pm_runtime_get/put() functions within
> dp_power.c will not have any effects in addition to increase/decrease
> power counter.

Lie.

> Also pm_runtime_xxx() should be executed at top
> layer.

Why?

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_power.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 5cb84ca..ed2f62a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
>   
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
> -	pm_runtime_enable(power->dev);
> -
>   	return dp_power_clk_init(power);
>   }
>   
> @@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power *dp_power)
>   	struct dp_power_private *power;
>   
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
> -
> -	pm_runtime_disable(power->dev);
>   }
>   
>   int dp_power_init(struct dp_power *dp_power)
> @@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
>   
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
> -	pm_runtime_get_sync(power->dev);
> -
>   	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> -	if (rc)
> -		pm_runtime_put_sync(power->dev);
>   
>   	return rc;
>   }
> @@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
>   	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
> -	pm_runtime_put_sync(power->dev);
>   	return 0;
>   }
>   

-- 
With best wishes
Dmitry

