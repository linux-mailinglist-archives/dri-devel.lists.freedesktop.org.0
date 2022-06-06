Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F382E53E4D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 15:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E18A10E784;
	Mon,  6 Jun 2022 13:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77010E784
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 13:46:15 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e5e433d66dso19166973fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xTpWPSxN0cL0aVs3iLR/HmIswwTyMjklIN9jCgr7T+Q=;
 b=FcPDlAGsBBZqIo/U7deOp4+kp/FFXUkJnzTHVfhMBmEPyi9B3VzXHpf9gxN0z9WkZE
 zMex9FE2JL2CXklp11tM+RvrBj2sYpgTHD7by7BoUHU3pZmfwFqd8lcUpyC1rjyBO1bm
 YCd03N3WPWfcU+4W6kh7sCBKnMJnjOmWzjjWZWdg4XY4USYk6DjUd77G1FNecYHavaK9
 aGMnGYduuyWNrQl6bnFZuv9IHGX89Lrc6mq3xecc153xREDsJw++jqd/pn3Abtox+NkW
 wzKxonhke55kKh88L6qB9H87YfwIf04YwnblGT9+aG1335WeM4zWDlhR7pVeun0+kLQB
 ViWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xTpWPSxN0cL0aVs3iLR/HmIswwTyMjklIN9jCgr7T+Q=;
 b=wWDcT3HUKZpQ9lFUH9q34eghO/OkyXJhPJlnL1rW0qJqTJrzkbxEB2Nuh/MaYaWi7j
 WIKxogSX3lVcY7OmGo6a8p8xSKm1JxTL3FU65w3BEbnJ965QCcmabh84MnyGxHD+Y25I
 IVa3tvrh0p6kxSDGk2qe8c1/0yE/O/cItLUOPFpGiYn4QMn0ByTrzhl4ufX1/L23BK51
 hdEJBWEQcu5sHkEMU9BaITGSh+Fo3hRkjCgzfNvoLlNRdaqCJWkcTHYsY0KPtZLFcltL
 PWl7xCA+Ik/NnlcGtC9/lxRUfZmzVhhRKkqmcX2AuezRtr/QvCTdhBhU1RIuELglpTfh
 U/Dg==
X-Gm-Message-State: AOAM531Il4ySrv8lRo58uxFBhPWJ9rt4Wh4MJ3WCzVrQRUMoPbnmRI+6
 r1kIQBqroL0RebO6DtjHLaLL5w==
X-Google-Smtp-Source: ABdhPJzjWkyxD1qfFKANpxzk990e+EpRbqV/OdMD73IIFh/8xr2wLPUb0uOpjWjw5mrkS+7u1j/ptw==
X-Received: by 2002:a05:6870:8184:b0:f5:dd95:7ef7 with SMTP id
 k4-20020a056870818400b000f5dd957ef7mr13883037oae.117.1654523174846; 
 Mon, 06 Jun 2022 06:46:14 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 pu7-20020a0568709e8700b000f5e33aaa66sm6770625oab.0.2022.06.06.06.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 06:46:14 -0700 (PDT)
Date: Mon, 6 Jun 2022 06:48:39 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v13 1/3] phy: qcom-edp: add regulator_set_load to edp phy
Message-ID: <Yp4FtznlEzNKmRPZ@ripper>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
 <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
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

On Wed 25 May 14:02 PDT 2022, Kuogee Hsieh wrote:

> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..7e357078 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,18 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +	if (ret) {
> +		dev_err(dev, "failed to set load at %s\n", edp->supplies[0].supply);
> +		return ret;
> +	}
> +
> +	ret = regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
> +	if (ret) {
> +		dev_err(dev, "failed to set load at %s\n", edp->supplies[1].supply);
> +		return ret;
> +	}
> +
>  	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
>  	if (ret)
>  		return ret;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
