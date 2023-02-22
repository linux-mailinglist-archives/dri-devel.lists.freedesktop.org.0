Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B297C69FE35
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 23:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A2710E412;
	Wed, 22 Feb 2023 22:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67A110E3E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 22:12:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id s20so11664323lfb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 14:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hGZr4GB37okt9ns/7m+dFk/oY3FVz2qC1daXRw1yuJ0=;
 b=p0OnXRAlhWxfboCKRQVVAEGT0BLMcjKThuGG4IznwRspSxUpT5OS/qbA6o3bccRBlH
 MGs2a1Ev1Ob/eFQJ6TXPG26A2nZDYaWPL99/XG3HM+Ndbf5YOW3Ow0S75H69HMpiYjO7
 h5tfm8UzlrDMi9I7+My8MIo9V4SrLTw14eKlaeZ+sewiUiezM9dcymUKcCjlaKiYbvht
 k1SHx/T+uajghDgRuvS3CD1i+Og9LlBbLbYDkKZWmPqdkaWUl0nUf6fS7Ha7XFOaGF1Q
 vXJkr4IZ3wbslNp1SH8H80Ckivs2xqlCQMZfY47FCSI+BO4+5T/GVHDPHZ09j13WdjYR
 hPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGZr4GB37okt9ns/7m+dFk/oY3FVz2qC1daXRw1yuJ0=;
 b=tK5bRwihzKzSJAmnxsNgReE/TRE5xb+ZSQ9XwLWU9n0SRhz4iKh+4yjMt66406jacX
 9qp+WIYTIwt3d6Ebz7e1JtEeOAhTMNyU8lQvTq58S9LJuaWszelENjFtbFdUxGoWGXGC
 05suC15hPYHMUV5Z4dfFfpVgYhRmBoIICQWDcGmOUaNONSqA4Nsz14neXV8cxw3XKVT7
 VSimQkV7btzU6hK9ZRUk4iHoDhRVQ3V2oGbP0IXrAEghON1BIR3NvJSl58jT0loBaFVd
 NJQwsNQU3yuwjhXWb3kzX+kaAktktxPIVzqjcUzIXK9SXrENrbvdSF0u6iL1mkhA8uEi
 xEzQ==
X-Gm-Message-State: AO0yUKWMBA3bWLW8WeXXboF5Zw9QTuLfl9hPFqZFt85QHFRYxaL59hIM
 U2xdhb6XIMP/bMRZlOjRoH3kgw==
X-Google-Smtp-Source: AK7set9TRNdjF5tyidrvhYqKAA784Ti8Hwk1puhQzfAnq9RFgTuW55KmHTiMvXqomFgwEPzc96xTyw==
X-Received: by 2002:ac2:5615:0:b0:4a4:68b8:f4bd with SMTP id
 v21-20020ac25615000000b004a468b8f4bdmr3282585lfd.3.1677103974194; 
 Wed, 22 Feb 2023 14:12:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u20-20020ac243d4000000b004d575f56227sm837784lfl.114.2023.02.22.14.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:12:53 -0800 (PST)
Message-ID: <4b9145e0-0526-dd08-2d92-05a49e50e3bc@linaro.org>
Date: Thu, 23 Feb 2023 00:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 5/5] drm/msm/a5xx: Enable optional icc voting from OPP
 tables
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-5-01021425781b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-5-01021425781b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
> handle bus voting as part of power level setting.

This can probably go to the generic code path rather than sticking it 
into a5xx only.

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index d09221f97f71..a33af0cc27b6 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1775,5 +1775,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>   	/* Set up the preemption specific bits and pieces for each ringbuffer */
>   	a5xx_preempt_init(gpu);
>   
> +	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return gpu;
>   }
> 

-- 
With best wishes
Dmitry

