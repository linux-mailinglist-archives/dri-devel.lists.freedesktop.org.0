Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157D634B62
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFB510E4AC;
	Tue, 22 Nov 2022 23:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B4710E4A8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:54:09 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u2so19682809ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vSQxsfoYnD2A3tH+O3pkstLuZIwU+jkrLdSB14gdhug=;
 b=vBWoS7NGEmZ4M8NUTF4f50mMJ+CyxMmbJWmVfdhdi/wQYco0DXDHWbkO+kq5K7tbfl
 dSpgdY1eGcCZ3wmETUxnjEVWKJsvzMefqQktCpYXzKBshcAUdKPXNSeinyxRWjyLtb37
 elrtpxMEA88/Sp5Oh64GPVBahbh4PsS0mmS68O/krFQhSTIXOrq/pSfWjwi29l8r2fpI
 kkngvioKMztgCcyDN1NStajFyOmsnh3r/mGcNKaPR4mUqMe+vZnqVLaeyHJtbrHQGiVK
 7CIx6R0Grk/B7CkoxN25PHIonDDP6SYQDunqvK/4damSUlCizO2yQV5xaS+TRcPDn0r8
 dCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSQxsfoYnD2A3tH+O3pkstLuZIwU+jkrLdSB14gdhug=;
 b=6Ig/zcbaEh6dFNAqAN158pM0v2ffrUdKn0HCMEdJZ+MCXnisEg4aXQRE54riwgPFcR
 bw4veoOiNIPNfSooZwU3hg2SsvK5sEu1/xzk04MEZp/PK41NLULIK/dIxdqpQ//pk3MT
 /tEeketsV+89WvruNHUmDr+0LBWQuE4gvJOQxqbBOwb8PasKDay1Rqm5ZF6sl3CSbcdS
 hc9cUGG+mJY+mByjV2s2pMbDnZagirQWYk0DrZA0xM9unVv9bFHQtC1RMOLfF7HU8OBP
 qArIZf6qV1avC43ahxdlclEPTpRimxzYDfONDe4Qq3un63KaaGILGiODyQJZS0rcad9l
 GUpw==
X-Gm-Message-State: ANoB5pkMTYEBo3Dbv0Q+ULoZdQTuyiTmk9bBqNPnzWLCOezxitjUrvEU
 8+lArTn4hJn/Sik/MFoSYXLymQ==
X-Google-Smtp-Source: AA0mqf6qg6QL8mtw0Y4ZgkbmPG9ZL4mch+rv29n4tkp7iw2Xw+a/UuSczczoRzzpOUoRBvOKd8bU1w==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id
 h12-20020a05651c158c00b0026c090ff8femr8807484ljq.2.1669161247954; 
 Tue, 22 Nov 2022 15:54:07 -0800 (PST)
Received: from ?IPV6:2001:14ba:a302:8a1a::1?
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b004acd6e441cesm2663361lfr.205.2022.11.22.15.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 15:54:07 -0800 (PST)
Message-ID: <f39ae6c3-e156-7366-6802-c392f1b1246e@linaro.org>
Date: Wed, 23 Nov 2022 01:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] drm/msm/disp/dpu1: add support for display on SM6115
Content-Language: en-GB
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221120133744.24808-1-a39.skl@gmail.com>
 <20221120133744.24808-3-a39.skl@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221120133744.24808-3-a39.skl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Adam Skladowski <a_skl39@protonmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Jason Wang <wangborong@cdjrlc.com>, Sean Paul <sean@poorly.run>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/11/2022 15:37, Adam Skladowski wrote:
> Add required display hw catalog changes for SM6115.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 87 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 +
>   drivers/gpu/drm/msm/msm_mdss.c                |  5 ++
>   4 files changed, 94 insertions(+)
> 

[skipped]

> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 6a4549ef34d4..86b28add1fff 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -280,6 +280,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		/* UBWC_2_0 */
>   		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>   		break;
> +	case DPU_HW_VER_630:
> +		/* UBWC_2_0 */
> +		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
> +		break;

According to the vendor dtsi the sm6115 is UBWC 1.0, not 2.0

Could you please doublecheck?

Looks good to me otherwise.

>   	case DPU_HW_VER_720:
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>   		break;
> @@ -509,6 +513,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-mdss" },
>   	{ .compatible = "qcom,sc7280-mdss" },
>   	{ .compatible = "qcom,sc8180x-mdss" },
> +	{ .compatible = "qcom,sm6115-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
>   	{}

-- 
With best wishes
Dmitry

