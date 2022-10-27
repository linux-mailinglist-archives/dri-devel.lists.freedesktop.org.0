Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249060FF6A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 19:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D187610E21A;
	Thu, 27 Oct 2022 17:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E51810E21A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 17:36:48 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id o4so4296819ljp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BN3Byo2U+tYcUHGltCzEtVoNw5zUtCpTRsVhrblr+j0=;
 b=q+bhotjZUMbV0vdRcBT0kLwMiDcGXX1ksvTnyyCFI/C0htww90XSYnUbYzk0VRHlj/
 27BlQSsM0JPPGGY3VIjkc+vdh3t285k/QlcE3ZJI41WtJ0Sls+etMGWGme9rejlOFudV
 3ZNEJru+nvfkTGRt+jwzWsOh0ZUZcPPE1ieZ4Bp7P2eA1JcstyVRtMW9NStpWsvIEbhT
 nfKk2kKvqwBsihls6fuQ0xvIlvCNk1myGg0HMnVOGEkV5bOxcUb6RkcH87KcFjDtEn6t
 fubll9AKjlEy0dd7o5YZfN6AOGXao+ddUXPTZT5ewcyGecVDWKg+8NpwfnvUrIQP3iaR
 0gDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BN3Byo2U+tYcUHGltCzEtVoNw5zUtCpTRsVhrblr+j0=;
 b=YzvB4Oq0mpxlUzOmhsRSx6v767lcNmWjJ9tYjJaQGLFHtpiyj9xTGtXiGCmHszJM6V
 9tWAxJ5B4F8MUYo1gBwmy/xVmaMmngLRhegjTTEVV/IbMHDO1/26ZqMQB8L7CSQbkNDX
 rYkobk2CuE7HMRZr/xj2/sIP+olJw1EOWCMU/9kVZtiTN/MSxwgzkcSLFk77fezUOHi1
 O6vNRQtnvK6P5HqQxJjuc0zSQ/os0YGLD1+cuWkXSHCbCUWWzWwwK5GPBfT7ghD/bWed
 wCjIXTlWoYnBM85Tj3Y0iEjBm8Ek1MTjgNq2QbT60TuiOIq/mrZhcYl65R9lMXalV+Wj
 M83g==
X-Gm-Message-State: ACrzQf0PH3cmftPp/2mdOQ87w6UbDGn3mq0i8b+TMW8CkkD60/i/GnAV
 gS9lV7+bosQKGhHs9dzyXJUyWA==
X-Google-Smtp-Source: AMsMyM7eUIGt4LJqV825lI0I7PnltTTOn6H8Z31v+0t0Rlx3wSdAy48ES5qB6WyMKbeskqEg2jOPRA==
X-Received: by 2002:ac2:4bc9:0:b0:4aa:66d3:c717 with SMTP id
 o9-20020ac24bc9000000b004aa66d3c717mr10640391lfq.73.1666892206451; 
 Thu, 27 Oct 2022 10:36:46 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a2e97cc000000b0026dd4be2290sm306248ljj.90.2022.10.27.10.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 10:36:46 -0700 (PDT)
Message-ID: <29e5110a-1759-8d8c-6646-f7b487990c0b@linaro.org>
Date: Thu, 27 Oct 2022 20:36:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] drm/msm/dsi: implement opp table based check for
 dsi_mgr_bridge_mode_valid()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <1663807768-23969-2-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1663807768-23969-2-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 03:49, Abhinav Kumar wrote:
> Currently there is no protection against a user trying to set
> an unsupported mode on DSI. Implement a check based on the opp
> table whether the byte clock for the mode can be supported by
> validating whether an opp table entry exists.
> 
> For devices which have not added opp table support yet, skip
> this check otherwise it will break bootup on those devices.
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 3a1417397283..87b518c42965 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -450,6 +450,29 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>   	int id = dsi_mgr_bridge_get_id(bridge);
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct mipi_dsi_host *host = msm_dsi->host;
> +	struct platform_device *pdev = msm_dsi->pdev;
> +	struct dev_pm_opp *opp;
> +	struct opp_table *opp_tbl;
> +	unsigned long byte_clk_rate;
> +
> +	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
> +
> +	/*
> +	 * first check if there is an opp table available for the calculated
> +	 * byte clock and then check DSC related info. Some devices have not
> +	 * added support for OPP table. Skip the check for those.
> +	 */
> +	opp_tbl = dev_pm_opp_get_opp_table(&pdev->dev);

Can we store the table inside the msm_dsi during the init? Then we won't 
have to get it again and again during each mode_valid call.

> +	if (opp_tbl) {
> +		opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
> +		if (IS_ERR(opp)) {
> +			pr_err("opp table not found for freq %lu err: %ld\n",
> +					byte_clk_rate, PTR_ERR(opp));
> +			return PTR_ERR(opp);
> +		}
> +		dev_pm_opp_put(opp);
> +		dev_pm_opp_put_opp_table(opp_tbl);
> +	}
>   
>   	return msm_dsi_host_check_dsc(host, mode);
>   }

-- 
With best wishes
Dmitry

