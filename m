Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BC469393
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC2F73E81;
	Mon,  6 Dec 2021 10:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754636FBD9
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 00:04:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu18so15992109lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 16:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QHHT00VDKbwiouuYvA1Na4+bMK2mwHXPvhFSQ6VIIAQ=;
 b=SwRQubzrVU07x/VktGwMithEDwR0OtcUO9ZRFHzLW29oKvJBZZrIj3BQgW4J1XqokR
 rp2LCfezWTiENH43r57iXD7DQ5kMd/og8uEKihoNgjX9GfRuBouLkTgq5DNIASWEVZ5l
 sah5gLr05evGtVIBNyJwZn3dmNmHwTD9luKmqnv7wSFkPyEnIc8XJ36qmg+DPYe6wEnQ
 iH72RIuchoJnPUgGR6qo2f/CrIKy3SsJv7o69ZvmNc5qakkyvpo7/6s0buqpjodOXWhb
 fnx13/BsnQtUKnwKlUaXH8m6oM3j8KTnEOnJTULiFm2WXKCS/AutviM7TzmrK5HXtVyO
 ciDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QHHT00VDKbwiouuYvA1Na4+bMK2mwHXPvhFSQ6VIIAQ=;
 b=vTd+9AGnpL59kuSGBRdnKiiZjL6eQrQvaQjpJKzCbLSnAppo22z9B8q3JdYgu4YvBY
 VP4n0koY2powjRQdvgykS7HFnqOn520PUbIDCAayz5TRrVU4C/t3Uk2KNv/Hk4ynogwW
 CNX+1x4kqVNSUnWprwBi6y4gSFXE7dhmp4/jDB7nRQ/3rHMWUpP7LeMylnbGJ4v77cQo
 iWOnVZI84to6vy0UFWQMG/y5eCu9je8zKk9iNAPYAXbgp3u/l9c7qdECo7IRfBkEtWO3
 iOenRsr+9MV3DcgygDg1mzLoshBV85is8xzRqCrl9o/FEAhWuWCLhEik//xEXz10BVi9
 Vg9g==
X-Gm-Message-State: AOAM533WjMllTW1LUaLlyPvvPRt6JeqljL7t1VkmRteVzMswjW4SySjQ
 uQ7Q844bMOcdOQJg2qbWhB7gKw==
X-Google-Smtp-Source: ABdhPJyf0aWmyyXdQuK9tcW9hG+AZg5FYjzqR1EZHhkn86w8R8hWq3kojn/veWvo4kuYm0XtzbmClg==
X-Received: by 2002:a05:6512:3f0c:: with SMTP id
 y12mr18196895lfa.579.1638662692680; 
 Sat, 04 Dec 2021 16:04:52 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x6sm910322lff.125.2021.12.04.16.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 16:04:52 -0800 (PST)
Message-ID: <9ef59b63-fb05-5a4b-4327-479eb48cf618@linaro.org>
Date: Sun, 5 Dec 2021 03:04:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/dp: Add "qcom, sc7280-dp" to support display port.
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org
References: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2021 01:02, Kuogee Hsieh wrote:
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d44f18b..91582d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -146,6 +146,7 @@ static const struct msm_dp_config sc7280_dp_cfg = {
>   static const struct of_device_id dp_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>   	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> +	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
>   	{}
>   };
>   
> 


-- 
With best wishes
Dmitry
