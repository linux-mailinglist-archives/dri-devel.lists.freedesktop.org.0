Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831D883CF23
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 23:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9C10E441;
	Thu, 25 Jan 2024 22:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEC610E38B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 22:06:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51025cafb51so25078e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 14:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706220319; x=1706825119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7i/JDSfurnJPpUe/CPBVMrv5ANrpnAIpMMbTtbyaJuI=;
 b=sQ12exi+uwNczy7tD04Z58PY673SgglT6OAwaRwW8IJQA0az3SErxhS4GpIDs11LKT
 jFPHwUBEqqTKz5Fl1wa6hO7J8yiIdPv0liN33aAKL7uiV8bJq/nLlTv5QyX4awncumOM
 +1hOgEcNaMPDm7Ed/iIOox65UAjPKXxCzmc/b2dX9jXJfYsf7Wn5TyOXqoA0CSmspM/R
 TVHp9d5NGSFf5vy+If0bz+b3j0ziLj8kswVIFheQlGBSXovB0iqn1HfACu380J2Re2VE
 pVAzO1daYMKtiv0PgVs6MQl6UGpC/cuekOm9XtL7N/uutYj8+qwzmUS1iyaQNgwsBatz
 cWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706220319; x=1706825119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7i/JDSfurnJPpUe/CPBVMrv5ANrpnAIpMMbTtbyaJuI=;
 b=TM56645kubyWUcVQG+MyktAuAF9jFVQ9GYZ+626tL7zL9kpymAlM4aa4bZ8YuUQPZg
 vQsog2DiFQrdlAoweXXnB0YuaA4drGqikKBWDzR7+rn2DiYIQlGqRmIYMeWE71Frky4s
 FtiiAHIDdTOTcyVA9kUYRTArlin/qN7RWAqCZzpfiizKn65zGIC6H9AsEz4jiwnVCaOt
 FD6TwlxTKRGg3uUyAIvwIKQUeaDcEY/HdyC0+SW6Q9S2WaQYcf8oYdLGMzInMPx8GWik
 uB6Jvp7SwAlZMyKn+AOp2dhX/EBpXISqPWXFoJjIKoV+TGCFY8gLqDFJbi5u1dw3ibXi
 HoLQ==
X-Gm-Message-State: AOJu0YwvI6cNDwbeHkbxK20NeXH9w2L5YC8HuLkDCuJZw/DLljC4gNVV
 tf7suGAlZi00p5CT3pogvL+34uDbwTXm1+nX06Gz64KkXEFY9jlj8MsD5QXAJ3M=
X-Google-Smtp-Source: AGHT+IFDduVkeK4mjioFIvOjCs6CeJJEEGFhLLaWm7OiBTdqHt8ALpkAwAt+jkft1PjdbPUGblheuA==
X-Received: by 2002:a05:6512:3d06:b0:510:15e4:ffbc with SMTP id
 d6-20020a0565123d0600b0051015e4ffbcmr370775lfv.35.1706220318705; 
 Thu, 25 Jan 2024 14:05:18 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a19c50b000000b005101ea5ca1csm226264lfe.178.2024.01.25.14.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 14:05:18 -0800 (PST)
Message-ID: <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
Date: Fri, 26 Jan 2024 00:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when
 VSC SDP supported
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-18-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> All the components of YUV420 over DP are added. Therefore, let's mark the
> connector property as true for DP connector when the DP type is not eDP
> and when VSC SDP is supported.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4329435518351..97edd607400b8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   
>   	dp_link_process_request(dp->link);
>   
> -	if (!dp->dp_display.is_edp)
> +	if (!dp->dp_display.is_edp) {
> +		if (dp_panel_vsc_sdp_supported(dp->panel))
> +			dp->dp_display.connector->ycbcr_420_allowed = true;

Please consider fixing a TODO in drm_bridge_connector_init().

>   		drm_dp_set_subconnector_property(dp->dp_display.connector,
>   						 connector_status_connected,
>   						 dp->panel->dpcd,
>   						 dp->panel->downstream_ports);
> +	}
>   
>   	edid = dp->panel->edid;
>   

-- 
With best wishes
Dmitry

