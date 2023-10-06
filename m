Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48B7BB685
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 13:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B66610E0D0;
	Fri,  6 Oct 2023 11:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB9010E0D0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 11:37:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50444e756deso2721618e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696592236; x=1697197036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W1VsvxhUXFiTgLAymq3ebUz3YFWk1kEe5SWqaT+jDqg=;
 b=fp5oVsmW23OMkPtx+Z+ZjG2UP2omKRtRFfwZzY8ELpFa1ozam/bzBVzuUnKgGN0S4w
 voXKIlTIRB7tfS0u79zGULNdVt4PbnfmTS0FEEszL+gpyD3zae9Sm9isFYq3/veecEQO
 ZkO/hYHKyTPK6TMNu2GS+iV0gExezxf5iCXhyzABuHwn54MqAoIZBwRKVOIKIFF87vLm
 u+rjzAbqYorE/UD6jcYvuGDxCbU73E3cQ65aBhdvEXIHCwGWBIBvv+lsSp42v3JXMLTC
 YxJ3Gy+WAymvtOiJIqmezTiKk8eLey+b37XhQavtWnMA5HUL7coNby5MK4WgJbo8orwg
 g1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696592236; x=1697197036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W1VsvxhUXFiTgLAymq3ebUz3YFWk1kEe5SWqaT+jDqg=;
 b=EWZykhrK+p2Y/PE2iw3Xwt4kQ5EeODP0SzmkITm6dmKZlsfzRYThhsLZJfTDutuKcY
 J/kmV8HrOKRjrPggXPqih6W5DjFbhNwl3ZUZ8nlph8mSivrvhRxhbf40fPxjVvzhkkbl
 s42f7VV0mUQbXRW8jMyLJnVru1+yTKjQSP/C7Pz6VnlzBCYknhx3UQZwIFgbIWIg3aaX
 eVskIsx6xKjWGe+zr6gFzLE5L1tlOtIFwulzzQo+OCYp85TwPOt12X5jNqS7GwB92oCQ
 ErNyT8AwU1CMU8CcQwDmT/okydDvgnjf/xo3g6HGJJLItXlqurEe8UcHEU1pavT6rWE6
 41jg==
X-Gm-Message-State: AOJu0Yx6Cj1wdSs/Lhb/LXQ+/hz02qaCzcz+Bx8/cQ6IS3k5WUvlpuWZ
 Umy6SmrocHn0aBsZz6oljdS6dA==
X-Google-Smtp-Source: AGHT+IF+Jpya32i8cpjd/eEUDafUcO+YT0nT8KXnyToGumNwtjpvCiq/Lgj7ChqbBTe+srBXkEe46g==
X-Received: by 2002:a05:6512:4015:b0:503:9eb:d277 with SMTP id
 br21-20020a056512401500b0050309ebd277mr8005030lfb.49.1696592235801; 
 Fri, 06 Oct 2023 04:37:15 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y20-20020ac24214000000b00500829f7b2bsm269094lfh.250.2023.10.06.04.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 04:37:15 -0700 (PDT)
Message-ID: <1b317a1f-f7d1-4ec2-8e15-7c9cad3036bf@linaro.org>
Date: Fri, 6 Oct 2023 14:37:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1696436821-14261-1-git-send-email-quic_khsieh@quicinc.com>
 <1696436821-14261-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696436821-14261-5-git-send-email-quic_khsieh@quicinc.com>
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

On 04/10/2023 19:26, Kuogee Hsieh wrote:
> Original both parser->parse() and dp_power_client_init() are done at
> dp_display_bind() since eDP population is done at binding time.
> In the preparation of having eDP population done at probe() time,
> move both function from dp_display_bind() to dp_display_probe().
> 
> Changes in v4:
> -- explain why parser->parse() and dp_power_client_init() are moved to probe time
> -- tear down sub modules if failed
> 
> Changes in v4:
> -- split this patch out of "incorporate pm_runtime framework into DP driver" patch
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 32663ea..e4942fc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -276,11 +276,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   	dp->dp_display.drm_dev = drm;
>   	priv->dp[dp->id] = &dp->dp_display;
>   
> -	rc = dp->parser->parse(dp->parser);
> -	if (rc) {
> -		DRM_ERROR("device tree parsing failed\n");
> -		goto end;
> -	}
>   
>   
>   	dp->drm_dev = drm;
> @@ -291,11 +286,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   		goto end;
>   	}
>   
> -	rc = dp_power_client_init(dp->power);

As we have moved dp_power_client_init() from bind() to probe(), we 
should also move dp_power_client_deinit() to remove(). Otherwise after 
several bind/unbind attempts the pm enablement count can become negative.

> -	if (rc) {
> -		DRM_ERROR("Power client create failed\n");
> -		goto end;
> -	}
>   
>   	rc = dp_register_audio_driver(dev, dp->audio);
>   	if (rc) {
> @@ -1250,6 +1240,18 @@ static int dp_display_probe(struct platform_device *pdev)
>   		return -EPROBE_DEFER;
>   	}
>   
> +	rc = dp->parser->parse(dp->parser);
> +	if (rc) {
> +		DRM_ERROR("device tree parsing failed\n");
> +		goto err;
> +	}
> +
> +	rc = dp_power_client_init(dp->power);
> +	if (rc) {
> +		DRM_ERROR("Power client create failed\n");
> +		goto err;
> +	}
> +
>   	/* setup event q */
>   	mutex_init(&dp->event_mutex);
>   	init_waitqueue_head(&dp->event_q);

-- 
With best wishes
Dmitry

