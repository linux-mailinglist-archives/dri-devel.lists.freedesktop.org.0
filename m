Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839865CFE6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A8410E517;
	Wed,  4 Jan 2023 09:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E4710E51C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 09:46:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e13so32290964ljn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xLn2bt9y0tlIr7p0iSmEuj9u/yaMgCFX32OBdxNgivg=;
 b=QesHGYAH3/oBzujE24SxNEFgv671Lygrg1IqLa48kTIW1bAZCao5PTjg3ZTQMGxVu9
 qbtAXGqFRz59RlNBmTXCgJgScChAAmFYIWdbqk9l17dRWsZkKrbLaJBujo8dBXDLlk0B
 NgpooMW07nLSoZ41/a/5We5sRcBSw6itCUeuNT7LmzQt7BckIuQM4rIDAh/5YYQIEXa1
 RwWGYYzA7XjFD+nVZcPl5VGbHlBP5Gd+4qQcUTLmt8gDA8jLYOx8wJwQ9DPQaz/0XK25
 4wFMQOU/iIpFvm4PB+3CclA12V39T20KcJ18g3PL8fNfDIaGuYr1lCLcXJLdrbpwRcOI
 t46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xLn2bt9y0tlIr7p0iSmEuj9u/yaMgCFX32OBdxNgivg=;
 b=IpLq4mK2XeCBRW1DvKspNbNX6K+HGslTAcZPSmlgApaVJWpKzw3ZWOUcFdp365Jnkv
 PZ4EEpzPiF6/qnt7JwefROA2pkAxThlc/wS05hjVd0ojmbT1jS324ZNBMVCWxWo7yWzR
 VDsC8DtH4QfWciVDmNP6S3EDw+XQpo/6H8aZL/rI/ExieDoAnxIsWAdhtUqqXBZ/9k4t
 aENR/TDMAaMYnj5LaeG3/aauz23dNOWX1Om0uOVGnBgdqtTHCcWlYyLNlTSPpIEFvSD0
 yH1le6pWcr6RZ/b1O/Gud45J3dr/VP6KAysSwtq3quQRNOiqmRS/qLFBTFsN8rBiTFas
 W9OA==
X-Gm-Message-State: AFqh2koNs8DcPP+gbpKxHA4FDio2M4CbCqXs141yrwTScuxywqazT3I6
 lwz2TcKZfV1gyKTNonlPcvKbSA==
X-Google-Smtp-Source: AMrXdXtVOq8Byz0bWtV2/2hZ7V337JltXS2U1orF9hGxvAEjfykXA0Z3HJKdyd/cKK6hWH10tGShVg==
X-Received: by 2002:a05:651c:1a29:b0:280:b13e:8e84 with SMTP id
 by41-20020a05651c1a2900b00280b13e8e84mr537926ljb.16.1672825568416; 
 Wed, 04 Jan 2023 01:46:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a2ebe04000000b0027fd65e4faesm1636051ljq.108.2023.01.04.01.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:46:08 -0800 (PST)
Message-ID: <97ca4286-09c2-6883-f480-fbf6f94f74f2@linaro.org>
Date: Wed, 4 Jan 2023 11:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/6] drm/msm: mdss: add support for SM8550
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-4-9ccd7e652fcd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-4-9ccd7e652fcd@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 11:08, Neil Armstrong wrote:
> Add support for the MDSS block on SM8550 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 144c8dd82be1..54483fe30ffd 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -288,6 +288,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>   		break;
>   	case DPU_HW_VER_810:
> +	case DPU_HW_VER_900:
>   		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>   		break;
> @@ -521,6 +522,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
>   	{ .compatible = "qcom,sm8450-mdss" },
> +	{ .compatible = "qcom,sm8550-mdss" },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mdss_dt_match);
> 

-- 
With best wishes
Dmitry

