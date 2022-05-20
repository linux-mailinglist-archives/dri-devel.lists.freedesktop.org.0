Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8652F117
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 18:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1587A10EADE;
	Fri, 20 May 2022 16:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451EF10EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 16:50:53 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f189b07f57so10973421fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=udeMWIeImL8Et9KO+nQSrMb5ZhN50mdpj9tL8FAbJ98=;
 b=dSjL9hAHlZbIAXLFy2vchTxfjAqvwKvgE1MNoILsPw9WyYz0+UXNWHA0Bk8DDpr+Yy
 ulkoazNolUDBiOy5AGpy+c7A4tJWN1T6GpN++geAI5LfyRvjbhacoj37KDkh7v4gfs1f
 OLnuxI8/tnHwDzPtXMc1iLSM2V3W+FnGQkyINXLRrhJfigGM8PkuZN8FgNNoLChZW/jn
 52BC/7Vg2ZYSvXmnO/mumTnDZcDxkO8zR4HcODOoI3HohQ5+2oDvQerdqLWXSs7c21Ui
 H3VBQs+lvfKAPGFoZgF+pilzfTFyb+VjwCY2EkAIlBdLxs7eYYaOr/FesMklva8Qn/NT
 iuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=udeMWIeImL8Et9KO+nQSrMb5ZhN50mdpj9tL8FAbJ98=;
 b=G2R0oX+UXf8EN3jCRjSMGkTLqtWYkyXuHNeaiTilM1h2gLqC3Ni3MW+BHKhj6sbcVz
 mRx4tCALKqqie0aVmTZWnGamjqTF8kAfB0mctoZzEsWzOtf9wGrmnvK6xgh06raX+oIr
 iX0EDA7XML1+Zj36r7jxRhLxhx4YNv0KE/d62sukqx08LsNvZLyfUiN3AIXis/Njbj/9
 4ZpRTBvi3RUCaC2dwyH/0dyZvm+sDmFt6Z5v5fYkMDqlwsYPFoCzvNs4FbPlDwApPNVU
 oZuVd1v3WBd/GV7usAZYo36VA4F6HK2llMs4NAAHptisfU4Hwghwxw0sqR1rsfk4aiNI
 6AzQ==
X-Gm-Message-State: AOAM53209jPWXb3PVsWixOQRMffXDWUNtPxOzxtpjJH1uQGhDKT6aerr
 QQmHZVKHKZY2Y0xRsgKTnufDXw==
X-Google-Smtp-Source: ABdhPJygoccuSwJYhUd2CBzkd7UbxWWji/qDYdUC+b+SAmRANKb8lEqtNI/xUMGbleCdUTv+0fxA6Q==
X-Received: by 2002:a05:6870:5b89:b0:f1:d956:dee2 with SMTP id
 em9-20020a0568705b8900b000f1d956dee2mr6659444oab.72.1653065452505; 
 Fri, 20 May 2022 09:50:52 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056870214600b000f1b1ff7b8bsm1071185oae.51.2022.05.20.09.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 09:50:51 -0700 (PDT)
Date: Fri, 20 May 2022 09:53:10 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v8 1/3] phy: qcom-edp: add regulator_set_load to edp phy
Message-ID: <YofHdpcWJGQtERPy@ripper>
References: <1653064021-25400-1-git-send-email-quic_khsieh@quicinc.com>
 <1653064021-25400-2-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653064021-25400-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 20 May 09:26 PDT 2022, Kuogee Hsieh wrote:

> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..afd9e17 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,12 +87,17 @@ struct qcom_edp {
>  
>  	struct clk_bulk_data clks[2];
>  	struct regulator_bulk_data supplies[2];
> +	int enable_load[2];
>  };
>  
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>  	struct qcom_edp *edp = phy_get_drvdata(phy);
>  	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(edp->supplies); i++)
> +		regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);

The regulator framework only accounts for the load of enabled regulator
consumers, so you should be able to just call regulator_set_load() right
after devm_regulator_bulk_get() and not carry the enable_load array of
static constants.

Regards,
Bjorn

>  
>  	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>  	if (ret)
> @@ -635,6 +640,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  
>  	edp->supplies[0].supply = "vdda-phy";
>  	edp->supplies[1].supply = "vdda-pll";
> +	edp->enable_load[0] = 21800;	/* load for 1.2 V vdda-phy supply */
> +	edp->enable_load[1] = 36000;	/* load for 0.9 V vdda-pll supply */
>  	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>  	if (ret)
>  		return ret;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
