Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A358063E5E3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 00:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35D810E134;
	Wed, 30 Nov 2022 23:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD4E10E134
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 23:58:15 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x11so75267ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 15:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jO8nXDV58mXkso9ZU1/d1ihgDXy7YP60Vhf2BkvzF7w=;
 b=XxxJfDWdCxAhpELeMOamNXvu9KcKqStzqg/qwaA1hN8IvqgHqv6LfFB1ANWrVfkZU+
 bRFhHHnHGqc/bD99ukBp2WxIa87RaF4EWP38sIjoZu9ZbU0ZM8ld4q46YYTW8jZ6PDWz
 9oUwMicFBQ5/bm1DREbqHZonoxek7/iGwjI2AwV7aNT0RmC6QIgbypD1lZINNG5LToY8
 EfrHZNlPVmawBXC5txAtMzRBFcQzntYSRrcdR68Bxg6AXMDYUEUff9Ya2GuL/0HA8ftc
 UPwWLI55uGjeuJCsb4t2B5g56ztxZHsuXz9gEJFpbeEYRE++k6RLSFEfI7iwSEZgXjzv
 qXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jO8nXDV58mXkso9ZU1/d1ihgDXy7YP60Vhf2BkvzF7w=;
 b=fouvtueOlMFQ8yE6NOZTrKbzM3JIN69x1H31NcAhu3NY4lrOe7JZErvLv2eeeJ42V0
 Ba3ZFQg4GYj5KFzDK5Tb34Z3PJHzbbXD+DZ0uu6qMddWj+8sSdT0lssJN9HRPMo4Mplq
 zhAqNUCWJGEqJVgmhGEX4NZUbDp1e3Y2Gzn5RCWxPtTfiBKwzLzIy2fSQGMmRg61Gsr1
 g9RxMayzkuzC7N78N2UIUo+woE0DHwM9xtYDsyMqFpi14R5z6ZD/XW21sBY8jeGU5YD/
 lDM/95Z3kdsG0ICc0F+HqfSHwijO0Iuohd4kosVCK7sSwpS60pwlks6XRq+NBbyKR6Fs
 13hw==
X-Gm-Message-State: ANoB5pm3NqCkFg/C/thKqEbi8+Zwxs4VZNsSdzz9kbV6fD6s1BHKg7ko
 ScuYU44hR/d7MyDQviEacUGgWw==
X-Google-Smtp-Source: AA0mqf4CRsX1JYhgTQ1nD8I3uKIXrcY4b5xxYBCLdMzNHNgsIkpPn1zxR/eMXR0GKObqz2JgnTgh0Q==
X-Received: by 2002:a2e:a375:0:b0:277:7c00:e130 with SMTP id
 i21-20020a2ea375000000b002777c00e130mr13190727ljn.268.1669852693637; 
 Wed, 30 Nov 2022 15:58:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f33-20020a0565123b2100b00494643db68fsm423005lfv.81.2022.11.30.15.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 15:58:13 -0800 (PST)
Message-ID: <50405292-d6c1-d9ee-20fe-46f4feee6d9c@linaro.org>
Date: Thu, 1 Dec 2022 01:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 2/4] drm/msm/dp: parser data-lanes as property of
 dp_out endpoint
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1669852310-22360-3-git-send-email-quic_khsieh@quicinc.com>
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

On 01/12/2022 01:51, Kuogee Hsieh wrote:
> Add capability to parser data-lanes as property of dp_out endpoint.
> Also retain the original capability to parser data-lanes as property
> of mdss_dp node to handle legacy case.
> 
> Changes in v6:
> -- first patch after split parser patch into two
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 30 +++++++++++++++++++++++-------
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index dd73221..b06ff60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -94,16 +94,32 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
> -	int len;
> +	struct device_node *endpoint;
> +	int cnt;
> +
> +	/*
> +	 * legacy code, data-lanes is the property of mdss_dp node
> +	 */
> +	cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> +	if (cnt > 0) {
> +		parser->max_dp_lanes = cnt;
> +		return 0;
> +	}
>   
> -	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> -	if (len < 0) {
> -		DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
> -			 DP_MAX_NUM_DP_LANES);
> -		len = DP_MAX_NUM_DP_LANES;
> +	/*
> +	 * data-lanes is the property of dp_out endpoint
> +	 */
> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +	if (endpoint) {
> +		cnt = of_property_count_u32_elems(endpoint, "data-lanes");

drm_of_get_data_lanes_count(), or better drm_of_get_data_lanes_count_ep().

Also please check new property first, then check the legacy one.

So it would be:

cnt = drm_of_get_data_lanes_count_ep();
if (cnt < 0)
     cnt = drm_of_get_data_lanes_count();
if (cnt < 0) {
     DRM_WARN(...);
     cnt = DP_MAX_NUM_DP_LANES;
}


> +		if (cnt < 0)
> +			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +		else
> +			parser->max_dp_lanes = cnt;
> +	} else {
> +		parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>   	}
>   
> -	parser->max_dp_lanes = len;
>   	return 0;
>   }
>   

-- 
With best wishes
Dmitry

