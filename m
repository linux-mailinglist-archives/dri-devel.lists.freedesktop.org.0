Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEC6479A8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 00:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477AB10E4E2;
	Thu,  8 Dec 2022 23:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1910E205
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 23:17:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d6so4363063lfs.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 15:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oCsKRmRYTaUN175iSQ+8CzQ2o2D9diPnWoiAzSTDmos=;
 b=BYb25JT1/vslYb1DVLQqLM2ML3g0LWdH5/ndWyCIwBRipkTd9axxTKxTKlNbz2vQMy
 DrqG+oxmI+U6ZL6iDFVGaNypyQ4WimpRF9/nGRaIM85Iaezq9GLkBZqmVrGhXGvxQOm8
 xAcDOs9HLWTaIS5TLAj0oIYXKmP/pY+Bn5mQ87Embw9cX0dHZF6XkN6eZ4fgdJfIy17+
 2IJhGmjRLLg1JijE1FBp7PenToFQMj/cI42N2sUl2N+fKF+CStWxgUflSYe5qyUYnZ9H
 01AplyEft30KlGoXeuIldop66n0dfONjmGWX0uc8N8EpvE+8MkNbJ8dqrcAK6o2ph2Cl
 Bxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCsKRmRYTaUN175iSQ+8CzQ2o2D9diPnWoiAzSTDmos=;
 b=CvfGlCL6alxM5aHhlx52G3x8sDRqsQNmALnsycGZMxY3HlY5rYDZ+achB3fweJtRxW
 PzxusCbxb+TI0CSZriu9XTJPvZuWfcCS8M4Xn8OphbfFhxQ91HwwKph18Rh9cXmFdKg7
 t96zsL895BKQOjiybnecQQrMjGq/W2RfiY3Cqt28mqdG+MGsWgI5o6vooJOKekBYk+41
 AZrdjjf8ZEgXh33Op+zHicPv168IXj0nYAHkoGA1zS5AD5xa2PeD6JPQE1eZRcUc6/C9
 BIbkzXTfHvPafhTwLSXJ2IPIQWQbfUVT2FScwTZzPNqzfRxpOrKz/BzVp+Re3urmBaGL
 s7lA==
X-Gm-Message-State: ANoB5pnN+g1KxgZ9bd4AjLLj7CSGgK5gIXgy6aGfUwPGr9nKztwvtT/f
 wG6yOzzSC49rskDrPjndgOI3Mg==
X-Google-Smtp-Source: AA0mqf64HHvBQnvh8Ga6+ZAmOSUnUf2eZ3LsaDK2t12dZu2v75LfbBkHvla/5YT+ih76Hp88Yyg7aA==
X-Received: by 2002:a05:6512:2a9a:b0:4a4:68b9:6091 with SMTP id
 dt26-20020a0565122a9a00b004a468b96091mr883514lfb.28.1670541434323; 
 Thu, 08 Dec 2022 15:17:14 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056512348400b004b097f2c73dsm3521105lfr.253.2022.12.08.15.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 15:17:13 -0800 (PST)
Message-ID: <e12f53ca-6934-fc9d-c99c-6859628238a1@linaro.org>
Date: Fri, 9 Dec 2022 01:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 4/5] drm/msm/dp: parser link-frequencies as property
 of dp_out endpoint
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1670539015-11808-5-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 00:36, Kuogee Hsieh wrote:
> Add capability to parser and retrieve max DP link supported rate from
> link-frequencies property of dp_out endpoint.
> 
> Changes in v6:
> -- second patch after split parser patch into two patches
> 
> Changes in v7:
> -- without checking cnt against DP_MAX_NUM_DP_LANES to retrieve link rate
> 
> Changes in v9:
> -- separate parser link-frequencies out of data-lanes
> 
> Changes in v10:
> -- add dp_parser_link_frequencies()
> 
> Changes in v11:
> -- return 0 if(!endpoint)
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 27 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_parser.h |  2 ++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index b5f7e70..9a7dcd4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -91,6 +91,29 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   	return 0;
>   }
>   
> +static u32 dp_parser_link_frequencies(struct device_node *of_node)
> +{
> +	struct device_node *endpoint;
> +	u64 frequency = 0;
> +	int cnt = 0;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +	if (!endpoint)
> +		return 0;
> +
> +	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> +
> +	if (cnt > 0)
> +		of_property_read_u64_index(endpoint, "link-frequencies",
> +						cnt - 1, &frequency);
> +	of_node_put(endpoint);
> +
> +	frequency /= 10;	/* from symbol rate to link rate */
> +	frequency /= 1000;	/* kbytes */
> +
> +	return frequency;
> +}
> +
>   static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
> @@ -113,6 +136,10 @@ static int dp_parser_misc(struct dp_parser *parser)
>   			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>   	}
>   
> +	parser->max_dp_link_rate = dp_parser_link_frequencies(of_node);
> +	if (!parser->max_dp_link_rate)
> +                parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */

Drop the comment please. One can jump to the defined value to see what 
is it equal to. So it adds no information.

> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 866c1a8..6b10c3e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -15,6 +15,7 @@
>   #define DP_LABEL "MDSS DP DISPLAY"
>   #define DP_MAX_PIXEL_CLK_KHZ	675000
>   #define DP_MAX_NUM_DP_LANES	4
> +#define DP_LINK_RATE_HBR2	540000 /* khz */

kbytes, not kHz. Otherwise it would have been 5400000.

>   
>   enum dp_pm_type {
>   	DP_CORE_PM,
> @@ -119,6 +120,7 @@ struct dp_parser {
>   	struct dp_io io;
>   	struct dp_display_data disp_data;
>   	u32 max_dp_lanes;
> +	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
>   
>   	int (*parse)(struct dp_parser *parser);

-- 
With best wishes
Dmitry

