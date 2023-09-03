Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E8790F18
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53FE10E255;
	Sun,  3 Sep 2023 22:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3667E10E262
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:40:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5007f3d3235so1324436e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780850; x=1694385650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4uZeHrs3brpLA9BIYNN/FvNUjPGrJaqU0dAdN56uTls=;
 b=JUAuWgJrj21BKxSuRuevctx4ZIfzRe3U9ltgfssSN6NlTu0JTj1MdnTa1cspLh3xzV
 LU5qnInahGwndGCvYZzIfgfg03z+p/AD2W1OliyBXdpd8aZkeDTu7QXzJiI95fCD5Vze
 YEw3GEnJkoa7l5uOfMClNL7s1sqhx+utZaqJFBo0r3/oerRJt5ClcrzjLarsUAP0+gR0
 GpvsAXDqYD44nVOy22rzPG98+9V2NCgzd9292ZnJ/c22t6A20Xi1aup+J44hUGK7YRzR
 CkLyhX3k9MNTO6j1KvC2p6dPRtm93O3xI2PYNdxo4rG4HP8BVUnRvGwS1eyEQt1Y7pwv
 slNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780850; x=1694385650;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4uZeHrs3brpLA9BIYNN/FvNUjPGrJaqU0dAdN56uTls=;
 b=e076ETQxl/0xCcO40UgZZ0nlSF78aSbkHVBytRIvNKt7OnC8W9964LiIXfxm1nO3Ia
 66DSuOU986Mh/HXsH3nNketH03U6swasMjjGUmQmAXXsSSST8SrTmIOARL9eSrORxvlp
 xk9ciy+i43lD+AGsSIrj5eaQqY0FHhCdvmyjnYmgKc6IWCOXYMYvxkGgd9A/a3tNQVBe
 jCRGLMJf2b+8HXQjSM2Ichc5sHcTVBFD9lv8vx0cx83ZVLmjAi8JJtlNcd0T6doqjHNH
 Ed5Ft9vcvuC7bSsI/5UA7DW0AsU5jq+C3U/RuI1fBENpunV8uFfcuqc5PrlXXX5sWT/5
 abFg==
X-Gm-Message-State: AOJu0Yx9QKTLUN44EJhPBEYqA4os8zleFtKIf5+dzpPUpQ0MSrhX9a+R
 GfAEIbmYbcyf29/uP+gIk3Pvzw==
X-Google-Smtp-Source: AGHT+IFmWZRk24SDi37FSiWwzAUFzDGcudEUHjvx8xHvUKUKpT4Ml6Ym6mavr1lOx4JWTmr2YnXbNA==
X-Received: by 2002:a05:6512:3083:b0:500:9524:f733 with SMTP id
 z3-20020a056512308300b005009524f733mr6407395lfd.20.1693780850292; 
 Sun, 03 Sep 2023 15:40:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:40:49 -0700 (PDT)
Message-ID: <726d4be5-d207-4176-bc0d-43492eb2c4e5@linaro.org>
Date: Mon, 4 Sep 2023 01:40:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/msm/dp: Remove dp_display_is_ds_bridge()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-8-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-8-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 21:47, Stephen Boyd wrote:
> This function is simply drm_dp_is_branch() so use that instead of
> open-coding it.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 76f13954015b..96bbf6fec2f1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -341,19 +341,12 @@ static const struct component_ops dp_display_comp_ops = {
>   	.unbind = dp_display_unbind,
>   };
>   
> -static bool dp_display_is_ds_bridge(struct dp_panel *panel)
> -{
> -	return (panel->dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> -		DP_DWN_STRM_PORT_PRESENT);
> -}
> -
>   static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)

Nit: you might as well inline this function

>   {
>   	drm_dbg_dp(dp->drm_dev, "present=%#x sink_count=%d\n",
>   			dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT],
>   		dp->link->sink_count);
> -	return dp_display_is_ds_bridge(dp->panel) &&
> -		(dp->link->sink_count == 0);
> +	return drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0;
>   }
>   
>   static void dp_display_send_hpd_event(struct msm_dp *dp_display)

-- 
With best wishes
Dmitry

