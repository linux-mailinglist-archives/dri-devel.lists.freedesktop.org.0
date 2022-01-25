Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22649A234
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 02:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2940110E8B1;
	Tue, 25 Jan 2022 01:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD38210E8AA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 01:56:50 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z7so10240645ljj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 17:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vl7zRt7CzWsP5dsK8jjPyozz1f+nDjiiAEcQBupI+gg=;
 b=n9wQmxV93FBjl1p6UWAnsR/Rp4I78wtTrlfGHx2HeDJvo28sEJ3Ui/yv/jSLo4OkTG
 itA+Z96FdTg7IqxtkVMyEUrAn80XGgC428mPsYkUzqOljwTg6O8NJ+iyMdieCWRi1nu9
 sh4JrOqePDuMC+5iw0mOkb2LuYDCSJgzjiQllRYSTB5bk8coihMSwkqQibGyeJm5h8C6
 5E0nkFOjRLe3vSC+lKGnA98V0sj51CEJ7yFiI9AqYgG50MwMhT7TrGZhHHRuAkswRbv+
 0TSMJAnk9PBntohIujBiATwlDwISz5tX0ggyfMVBmcFHJW0zFNrq4djqIjZZ5fb9dI1+
 Mydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vl7zRt7CzWsP5dsK8jjPyozz1f+nDjiiAEcQBupI+gg=;
 b=Y9Rx0+p/tM5w0vowZnFXG85c7/EMmHDoqQQfGwmTBHZs+qH7kOW6uRO/WEf4bf0lVd
 TE2vJJqXnlf6UQfLDalGV9A8flyKBtbVO2Ja8xh4O1eMGje1MngOr4k2T9OX+Y7aMMD2
 Zl7PoUMzFs8yO6JQaUB/EttbvRE5uxF5Dfx2frjArnYsHOI8fLTRPi7TAoz5QAz5H+tw
 56WXLORp8KdhAHfeCEFAEIqNA2F5ngnqZ5uxW2dUXP4uS1CBHyOfyemdzYXBi54wkuyW
 4pudtIX00NiuorANNthDtAOhlnDqxSkk6Vy+sT3CjYAxE+q3q/IZimlFODlgFutBNRLp
 oDAA==
X-Gm-Message-State: AOAM530KnQKMzt7atgaySni7yGC5ZCdel7n474RGyYNSF8Ut2NrEFAh7
 Dty0oYKh76x/ioDzNej2rTt3frChoedtDA==
X-Google-Smtp-Source: ABdhPJyGoLMRs00RgcJNojAwWsrQUnnYJ9BDZG0uXkgal8iXcUoDVBKfNsOhG8xLGfNq7k8uCISjgw==
X-Received: by 2002:a2e:8551:: with SMTP id u17mr3356586ljj.35.1643075809221; 
 Mon, 24 Jan 2022 17:56:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w16sm474939ljg.14.2022.01.24.17.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 17:56:48 -0800 (PST)
Message-ID: <e3ef9c30-ffc2-b7c1-a361-09a6d35da03d@linaro.org>
Date: Tue, 25 Jan 2022 04:56:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v3 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Content-Language: en-GB
To: Rajeev Nandan <quic_rajeevny@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
 <1642538320-1127-3-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1642538320-1127-3-git-send-email-quic_rajeevny@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, jonathan@marek.ca, airlied@linux.ie,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2022 23:38, Rajeev Nandan wrote:
> Add support for MSM DSI PHY tuning configuration. Current design is
> to support drive strength and drive level/amplitude tuning for
> 10nm PHY version, but this can be extended to other PHY versions.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes in v2:
>   - New.
>   - Split into generic code and 10nm-specific part (Dmitry Baryshkov)
> 
> Changes in v3:
>   - s/ops.tuning_cfg_init/ops.parse_dt_properties
>     To parse phy version specific DT properties (Dmitry Baryshkov)
>   - Address comments for phy tuning data structure (Dmitry Baryshkov)
> 
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 ++++++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 4 ++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 8c65ef6..fcbca76 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -739,6 +739,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	if (phy->cfg->ops.parse_dt_properties) {
> +		ret = phy->cfg->ops.parse_dt_properties(phy);
> +		if (ret)
> +			goto fail;
> +	}
> +
>   	ret = dsi_phy_regulator_init(phy);
>   	if (ret)
>   		goto fail;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b91303a..9e08081 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -25,6 +25,7 @@ struct msm_dsi_phy_ops {
>   	void (*save_pll_state)(struct msm_dsi_phy *phy);
>   	int (*restore_pll_state)(struct msm_dsi_phy *phy);
>   	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
> +	int (*parse_dt_properties)(struct msm_dsi_phy *phy);
>   };
>   
>   struct msm_dsi_phy_cfg {
> @@ -81,6 +82,8 @@ struct msm_dsi_dphy_timing {
>   #define DSI_PIXEL_PLL_CLK		1
>   #define NUM_PROVIDED_CLKS		2
>   
> +#define DSI_LANE_MAX			5
> +
>   struct msm_dsi_phy {
>   	struct platform_device *pdev;
>   	void __iomem *base;
> @@ -98,6 +101,7 @@ struct msm_dsi_phy {
>   
>   	struct msm_dsi_dphy_timing timing;
>   	const struct msm_dsi_phy_cfg *cfg;
> +	void *tuning_cfg;
>   
>   	enum msm_dsi_phy_usecase usecase;
>   	bool regulator_ldo_mode;


-- 
With best wishes
Dmitry
