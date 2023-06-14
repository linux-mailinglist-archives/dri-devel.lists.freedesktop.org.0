Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B6730AEA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 00:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97EC10E476;
	Wed, 14 Jun 2023 22:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E710E469
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 22:45:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f6170b1486so237360e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 15:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686782703; x=1689374703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFmEys4UP/BgwQm19UOfZJrlXyJD3pmyho65CpiqnbY=;
 b=P0xkljwPwEIx9AiLfTQ52OF2brfwDB4iX2e7Jv+LzXTgBkI/ZnBRbTtlAc7Bh4YMqO
 EEXq38ZzvaHMHJqQFYknBcSu1UmHdfOedsuvIeYhAjrX2BUHKUhF4JKDySzJ2dpDa4O1
 STA9E2hLePlmYiY0a091mZSsm6CrsqbcOEAoUMjJrGOKOxZwID0WFgNlrlrZuv+7hxBp
 nSnm2wB/3L1FKvBLMexFx0C69lhhJjibpN6Ovyg7JgXz9G6RI9jBkY8tWtHIPelfdvEb
 aFmtko2M4jIJNuyG5LafYw9GiVLS0Be1FFpoHkLSH1Xi/ZnAWrbMpv21T9t3/VmELmeO
 +GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686782703; x=1689374703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFmEys4UP/BgwQm19UOfZJrlXyJD3pmyho65CpiqnbY=;
 b=CShX0Qo2GB0rV81N+ZGSfsFl62u78LOQGqpQkpgRLAmy5BNe2xWQf0tYePijn876yq
 ZwBceC4yIzOedM7VGWK/1zYHud9Ea9WKyWaj5EmhX/4OqxonLyQWZtcPqCB4ca6Al+C4
 jH2EOZZ9d3oEjVrXbip5rlrKaeIaAIBPlFuj1OnUiTB/JHIWBfmTJNL7yp2bJt8XZJfS
 WhwyXRYKc50OLW80/pkpQqS5SfdXVoXV/9ZdUK3t+x3nIA5zlLdRzsx5pkl7cxwYQ1WP
 LIl5tLgikG4WYiH9ua/V5kDlMcQFIKq8bfVOOomabxK4kgL/WPhXYnjdieqdVBPiFWs4
 DhwA==
X-Gm-Message-State: AC+VfDxZGqKhP/WyKbxXN6IyuHz4I6j4v+8PzZh/gPyp9Z5o8Hdy9UcH
 rDzNlIx22oOTr1YeGhzYmrxilQ==
X-Google-Smtp-Source: ACHHUZ41d/xGmuzPjif6jwX/W74Tm1loth6hzxERHcbhrFmHVvv22kop8/IE1XX6TbWVmyC2w1FOkQ==
X-Received: by 2002:a05:6512:45a:b0:4f6:5473:7bf0 with SMTP id
 y26-20020a056512045a00b004f654737bf0mr1184339lfk.21.1686782703414; 
 Wed, 14 Jun 2023 15:45:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r23-20020ac252b7000000b004f2ce4b0f2esm2288991lfm.168.2023.06.14.15.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 15:45:02 -0700 (PDT)
Message-ID: <a1322d43-d1e6-059d-6428-f0da843a00b1@linaro.org>
Date: Thu, 15 Jun 2023 01:45:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dsi: Enable BURST_MODE for command mode for DSI
 6G v1.3+
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com>
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2023 02:37, Jessica Zhang wrote:
> During a frame transfer in command mode, there could be frequent
> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
> if the DSI controller is running on slow clock and is throttled. To
> minimize frame latency due to these transitions, it is recommended to
> send the frame in a single burst.
> 
> This feature is supported for DSI 6G 1.3 and above, thus enable burst
> mode if supported.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 744f2398a6d6..8254b06dca85 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -994,6 +994,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
>   			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
>   			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
> +
> +		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> +				msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
> +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2,
> +					DSI_CMD_MODE_MDP_CTRL2_BURST_MODE);

Please move this to dsi_ctrl_config(), the place where we set all the 
configs. Also please change this to RMW cycle.

>   	}
>   }
>   
> 
> ---
> base-commit: dd969f852ba4c66938c71889e826aa8e5300d2f2
> change-id: 20230608-b4-add-burst-mode-a5bb144069fa
> 
> Best regards,

-- 
With best wishes
Dmitry

