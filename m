Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A03DA0BD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7FC89F6D;
	Thu, 29 Jul 2021 09:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD39C89F6D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:59:16 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id h11so6740304ljo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nIej11/PYcGeLGxt7QOR+AppfCQjgzk8NOs4YUKmoVs=;
 b=m6MS/ZA3IHYlnwTYoSS9WTrTqje10ox98fXiIHsiSs6fIpuUWgFw5PJ2vLzgiH9wXm
 oNfNwAKxV9xDmZdElU1gKVLdVXRyThDU+SXgY69YWjaRBJMBtxG0z3wQw7QWTapcts9O
 iN1OGi3uMFfiO74SU0ONms6KT5r1gWDPbABFRueW9HvNGsN6QmzU07E7pvIPOI8xZ3K5
 zYg7Tw/HopP5eN/tkjneBmxwAy3udxo8HUBRPuFH6YrHRzIipKqcfi67LLC9yY8F/I15
 YD19xIMW9/LGzpCQ3bwTc4kf7Yw+RkYA3Z1MMjpkJ62ao7I0D49Apn5ZdAQB1eZwmIgn
 hnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nIej11/PYcGeLGxt7QOR+AppfCQjgzk8NOs4YUKmoVs=;
 b=lu8onYZKcF28ge+vbHCttpgJhVBEyJsFdVzWNBZIfZxvkdwsUQAqQZ/txOGlgxaC7B
 QC6HTIKJjQoJFnpgf66jdbU+B3/W3Q5hf4hG9iRvnTf9lHf6oXScHQDqHH93zrcllect
 +wUYpX27m7S2knOVtjqAqkCy0EqRyMA7u/30mVzRJrC0T4XCSSvf9UjhnIibV44Dqnqm
 jj5yMPJbS+rnipi/I6riak/Pt8kayWvkZ167rTSw+SpFACWvI1nqiDxaC1TsLYZNAQxM
 81ElAY9FD+ognF0s0LweSh0ow1QqUVTlMIyd7isLWfjWjLaYshUEMAFfgtIK6S7TcetY
 /fhw==
X-Gm-Message-State: AOAM531kRqM/Ajkamy02UsNrj7GBxiIy+wMNbbsJGdVLHsk3ekwTCNUI
 cX4pf/YhpHX/R2IopjzGF+B/Gw==
X-Google-Smtp-Source: ABdhPJysezjVyG3wOZUNPI2nlc1wYDaL9jMePnngzQ5rByaB9dBKJMmfrXAUe2w0ApMfEdXkx8DVcQ==
X-Received: by 2002:a2e:b0c5:: with SMTP id g5mr2418335ljl.41.1627552754933;
 Thu, 29 Jul 2021 02:59:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x3sm117577ljd.66.2021.07.29.02.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 02:59:14 -0700 (PDT)
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3bb5dc26-6779-6cb4-b9dd-e64c306e9ae6@linaro.org>
Date: Thu, 29 Jul 2021 12:59:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Vara Reddy <varar@codeaurora.org>, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2021 02:13, Bjorn Andersson wrote:
> eDP panels might need some power sequencing and backlight management,
> so make it possible to associate a drm_panel with a DP instance and
> prepare and enable the panel accordingly.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

The idea looks good from my point of view. For v1 could you please 
extend it with the `if (panel)` checks and handling of the error codes.

> ---
> 
> This solves my immediate problem on my 8cx laptops, of indirectly controlling
> the backlight during DPMS. But my panel is powered when I boot it and as such I
> get the hpd interrupt and I don't actually have to deal with a power on
> sequence - so I'm posting this as an RFC, hoping to get some input on these
> other aspects.
> 
> If this is acceptable I'd be happy to write up an accompanying DT binding
> change that marks port 2 of the DP controller's of_graph as a reference to the
> attached panel.
> 
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++++++++--
>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 19 +++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
>   4 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 206bf7806f51..1db5a3f752d2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -10,6 +10,7 @@
>   #include <linux/component.h>
>   #include <linux/of_irq.h>
>   #include <linux/delay.h>
> +#include <drm/drm_panel.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
> @@ -252,6 +253,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   		goto end;
>   	}
>   
> +	dp->dp_display.drm_panel = dp->parser->drm_panel;
> +
>   	rc = dp_aux_register(dp->aux, drm);
>   	if (rc) {
>   		DRM_ERROR("DRM DP AUX register failed\n");
> @@ -867,8 +870,10 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>   	return 0;
>   }
>   
> -static int dp_display_prepare(struct msm_dp *dp)
> +static int dp_display_prepare(struct msm_dp *dp_display)
>   {
> +	drm_panel_prepare(dp_display->drm_panel);
> +
>   	return 0;
>   }
>   
> @@ -886,6 +891,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>   	if (!rc)
>   		dp_display->power_on = true;
>   
> +	drm_panel_enable(dp_display->drm_panel);
> +
>   	return rc;
>   }
>   
> @@ -915,6 +922,8 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>   	if (!dp_display->power_on)
>   		return 0;
>   
> +	drm_panel_disable(dp_display->drm_panel);
> +
>   	/* wait only if audio was enabled */
>   	if (dp_display->audio_enabled) {
>   		/* signal the disconnect event */
> @@ -939,8 +948,10 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>   	return 0;
>   }
>   
> -static int dp_display_unprepare(struct msm_dp *dp)
> +static int dp_display_unprepare(struct msm_dp *dp_display)
>   {
> +	drm_panel_unprepare(dp_display->drm_panel);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 8b47cdabb67e..ce337824c95d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -15,6 +15,7 @@ struct msm_dp {
>   	struct device *codec_dev;
>   	struct drm_connector *connector;
>   	struct drm_encoder *encoder;
> +	struct drm_panel *drm_panel;
>   	bool is_connected;
>   	bool audio_enabled;
>   	bool power_on;
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index fc8a6452f641..e6a6e9007bfd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -6,6 +6,7 @@
>   #include <linux/of_gpio.h>
>   #include <linux/phy/phy.h>
>   
> +#include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   
>   #include "dp_parser.h"
> @@ -276,6 +277,20 @@ static int dp_parser_clock(struct dp_parser *parser)
>   	return 0;
>   }
>   
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +	struct device_node *np = parser->pdev->dev.of_node;
> +	int rc;
> +
> +	rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> +	if (rc == -ENODEV)
> +		rc = 0;
> +	else if (rc)
> +		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
> +
> +	return rc;
> +}
> +
>   static int dp_parser_parse(struct dp_parser *parser)
>   {
>   	int rc = 0;
> @@ -297,6 +312,10 @@ static int dp_parser_parse(struct dp_parser *parser)
>   	if (rc)
>   		return rc;
>   
> +	rc = dp_parser_find_panel(parser);
> +	if (rc)
> +		return rc;
> +
>   	/* Map the corresponding regulator information according to
>   	 * version. Currently, since we only have one supported platform,
>   	 * mapping the regulator directly.
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 3266b529c090..994ca9336acd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -122,6 +122,7 @@ struct dp_parser {
>   	struct dp_display_data disp_data;
>   	const struct dp_regulator_cfg *regulator_cfg;
>   	u32 max_dp_lanes;
> +	struct drm_panel *drm_panel;
>   
>   	int (*parse)(struct dp_parser *parser);
>   };
> 


-- 
With best wishes
Dmitry
