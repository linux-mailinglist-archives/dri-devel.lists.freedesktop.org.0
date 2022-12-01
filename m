Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A463E675
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 01:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84CC10E516;
	Thu,  1 Dec 2022 00:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC4F10E502
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 00:26:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p8so20881lfu.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 16:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IigBehPc+Em/qusf/7j6u/r/e7HcF8wFshWUasQJ9B8=;
 b=jgQJptowxk+tpWm5JxfxLPZwgR+m+Otq4kBaWUfskKldD7GOkjHQI8c1yN6MFxojOn
 OJ6TBG7mwc0Tbr4l/vtUCCgley8qf2inX64QF059GLKiCOEeGuO//CjDxYsziREdqREF
 PwaIzaWDzaMiar5Ynyc2kgkNc91VZ/q2xLMvFZPuYfuqs4+1ZRxXvgvacj7F8Wue40Cc
 A2SDp/u46syaVrCHgAxDcU79nj779XG5rnceNUJtIbeG0pDpdtJP1hTB2NLGTMeD2I+H
 QLtpdoxtZzTuzLo6dK2dmNChr0r9f1j79Tm7nKvD1rbU2pV1XZ+COTVnPvFDvJwjpsbT
 mG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IigBehPc+Em/qusf/7j6u/r/e7HcF8wFshWUasQJ9B8=;
 b=fiXksXsEKlf145Peaq3XRQ0RMXRBSKO8pPlA/Z19FF4E7PGelmisqKCuW8IBIY7NV3
 TcJIxfaOHMaNLRJLzdzDv4uB0uQRcBeBQ6GXgoE2NbmFzlqbwgh8BzZAJIpvGcBlbzMQ
 LnqTh3VMkYB4LPmDrKSRL1GDCIQ2rOzuZtGS2h9A0EEKTqbM8gNRFM9WhcMJMymVW/jn
 K2mfaFLMTQ2Goeh5HUCzDOZhp9e2ykvtjDPuam3lXgObGL6yYQBSjZZkBOeQZ7uINZlY
 gRN3eE7jkZPdUtW8b2GJxFmBcfJGO8XXtjuu8Q29iNLJH6YM7Z9/cEDs4fM0RRs9xMzB
 sSjA==
X-Gm-Message-State: ANoB5pk4BWXU+K4AMiwV210jbjSG4s3mWzXTKGGJBhSy6dj0I7B1lcGH
 cXLfA7FtTYB73cV9yBJQNjHZrA==
X-Google-Smtp-Source: AA0mqf6Y/rBxKmL6xGjcEbKjQtStZUc7jyTJiN1dVB/hUBKz123VUR/fTeFuMFM5wE5Gj9ziDBr4Lg==
X-Received: by 2002:a05:6512:15a8:b0:4a6:3ed2:3717 with SMTP id
 bp40-20020a05651215a800b004a63ed23717mr16703128lfb.637.1669854380184; 
 Wed, 30 Nov 2022 16:26:20 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a056512208f00b004b4ec76016esm426881lfr.113.2022.11.30.16.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 16:26:19 -0800 (PST)
Message-ID: <3ead3652-1241-89bd-3441-8ca4a4c8df57@linaro.org>
Date: Thu, 1 Dec 2022 02:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 3/4] drm/msm/dp: parser link-frequencies as property of
 dp_out endpoint
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1669852310-22360-4-git-send-email-quic_khsieh@quicinc.com>
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
> Add capability to parser and retrieve max DP link supported rate from
> link-frequencies property of dp_out endpoint.
> 
> Changes in v6:
> -- second patch after split parser patch into two patches
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 16 ++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_parser.h |  2 ++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index b06ff60..2006341 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -95,6 +95,7 @@ static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
>   	struct device_node *endpoint;
> +	u64 frequency;
>   	int cnt;
>   
>   	/*
> @@ -103,6 +104,7 @@ static int dp_parser_misc(struct dp_parser *parser)
>   	cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>   	if (cnt > 0) {
>   		parser->max_dp_lanes = cnt;
> +		parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */
>   		return 0;
>   	}
>   
> @@ -116,8 +118,22 @@ static int dp_parser_misc(struct dp_parser *parser)
>   			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>   		else
>   			parser->max_dp_lanes = cnt;
> +
> +		cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> +		if (cnt < 0) {
> +			parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */
> +		} else {
> +			if (cnt > DP_MAX_NUM_DP_LANES)
> +				cnt = DP_MAX_NUM_DP_LANES;

Why are you comparing the number of link frequencies with the number of 
lanes? You don't need the comparison at all.

> +
> +			of_property_read_u64_index(endpoint, "link-frequencies",
> +							cnt - 1, &frequency);

Checking of the return value?

> +
> +			parser->max_dp_link_rate = (frequency / 1000); /* kbits */
> +		}
>   	} else {
>   		parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +		parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */

Instead of having all the nested if's and setting of max_dp_link rate in 
several branches, please add a function that returns either a valid rate 
or an error. Then you can simply check the result of that function and 
set the default.

>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 866c1a8..3ddf639 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -15,6 +15,7 @@
>   #define DP_LABEL "MDSS DP DISPLAY"
>   #define DP_MAX_PIXEL_CLK_KHZ	675000
>   #define DP_MAX_NUM_DP_LANES	4
> +#define DP_LINK_RATE_HBR2       540000
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

