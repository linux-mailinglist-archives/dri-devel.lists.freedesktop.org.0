Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC450673AFE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DFC10E949;
	Thu, 19 Jan 2023 14:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783CD10E949
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:02:00 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kt14so5932064ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 06:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2x8S9tVFIZqDRv9aHkQ6xKCyTS3jpAIYNRHtCcpELmw=;
 b=PJhN37dt3vvxsYzj0Eg4zdSaSMqu97099U86iUJCurKx6eBfan8IS3fZiG0zE3ZsUW
 VMQGbhgeqbtfRVUTXp7RqFepqE5o1L0xd8vpdc9YZajcYqEiMN3+tJPBQM7Ussvhb8AW
 bLnMSjmvJLHQQKSuR/OOaVoq86Mu1IBCf2yPVX7Cv0c57eP4KRmsjUq0L9rZSLNzgwkL
 Kwmui1y9eZhv3kNQXXDfFV+r/8OnWAxKtT+FBr7voZg/KLXRAWqC/vLc6PPv9Rd4S17i
 WrUIikWJcFcp4haP0Qhao2VCQh5Qtp0ofPPehKsz493kPFTc6fGwAAfpscGVOH4A4Mnc
 o5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2x8S9tVFIZqDRv9aHkQ6xKCyTS3jpAIYNRHtCcpELmw=;
 b=k/Q0PDnqU/6M2x7V9lENJ8Qo37iaLMU0SiL2S8Hbr3WaXbMqQhIAcZIXM7XqXDV/33
 KH9VVNMxZCgo7ijkgmmSSmf7yoBVam7Ig1rdd18xZfhGsrVVkNc69pZKyL3TM26wbg3B
 otonowgkRUn0XU7/Y658N5osak+8PS2ltwJXKX8mIOrET+cHq4Ln0/+x5oL6C78sf4n/
 W94Wh6y/2p6zqdTnJm6Lqi0sbQgKP81lNuiwAV8suIijE9CLqo3LDx6D+gbavGWn23pB
 HW6gCKBfayx70qRVIO0lcBl3cBzoWiJQPI4CTCVbJuQZaTqXIg3gwkB6yZPqC2upr0J5
 J55g==
X-Gm-Message-State: AFqh2kqFTz/nesVYwoBnUbgimR2haJ75i9fNYgPZdkEpZmY/be+yYYBZ
 G+vVXOh+uHWtMT/B/QnKXG/8iQ==
X-Google-Smtp-Source: AMrXdXtxY4A4oBDtDd979MmrlD50V8QEnayPnQI0J2QTJ0QFspExAuwf02HDsF7SIivQLI4+nCtuxw==
X-Received: by 2002:a17:907:d15:b0:862:e612:effe with SMTP id
 gn21-20020a1709070d1500b00862e612effemr16052636ejc.14.1674136918662; 
 Thu, 19 Jan 2023 06:01:58 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1709061be100b0086f40238403sm6522221ejg.223.2023.01.19.06.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 06:01:58 -0800 (PST)
Message-ID: <efd3d3df-4d0e-8cd4-24f5-11aeb4682948@linaro.org>
Date: Thu, 19 Jan 2023 15:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/6] drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.01.2023 14:22, Dmitry Baryshkov wrote:
> On MSM8960 the HDMI PHY provides the PLL clock to the MMCC. As we are
> preparing to convert the MSM8960 to use DT clocks properties (rather
> than global clock names), register the OF clock provider.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> index c3e7ff45e52a..cb35a297afbd 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> @@ -422,8 +422,7 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct hdmi_pll_8960 *pll;
> -	struct clk *clk;
> -	int i;
> +	int i, ret;
>  
>  	/* sanity check: */
>  	for (i = 0; i < (ARRAY_SIZE(freqtbl) - 1); i++)
> @@ -443,10 +442,16 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>  	pll->pdev = pdev;
>  	pll->clk_hw.init = &pll_init;
>  
> -	clk = devm_clk_register(dev, &pll->clk_hw);
> -	if (IS_ERR(clk)) {
> +	ret = devm_clk_hw_register(dev, &pll->clk_hw);
> +	if (ret < 0) {
>  		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
> -		return -EINVAL;
> +		return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
> +		return ret;
>  	}
>  
>  	return 0;
