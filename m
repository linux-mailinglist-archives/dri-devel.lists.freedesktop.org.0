Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D7635C04
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130E510E22F;
	Wed, 23 Nov 2022 11:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761EA10E374
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:43:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f13so6249006lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 03:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o+T2mPZQp7vnmYO/VBII05x2MosM1f+t1yFyH0GD4j4=;
 b=iLE0E0fsgalMDgEFoiDG7mC4omu6kUK/OtiaPfnLb3jV1MHQDu/PW13DyQkmcI5G0y
 rPO52ta3HI3eVdT0RHgHBbRztSIq42qr1CNRicM9UJXhGa7U/nVPxXZTiJruswZUVrZJ
 tk0aeZQee+cd4tNAqcoHC8B5hRBpkKTldoj8F5jyLHbjXd1rrKuZBa4GF0n2ql5A7mPT
 qZnXZU+s8xFeJCbYsRWcMKXonxvPv+slcRzLldZL7HpTvhzjZNWWogbZFNT1sZf2wpam
 jEjSQofzm0dJDCpZriWJPGHopJo2gTZOVgnB3oLSbVcXjHW9keX7GKVBEtKgCDMM0PJx
 waoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o+T2mPZQp7vnmYO/VBII05x2MosM1f+t1yFyH0GD4j4=;
 b=KJBWQH8wH2Ffnfbf8e7FWxdJ0xZp0ViQItRMqP4JayAVhR2neDOvoWO0wKrvSy83OR
 Fu3l8oJYDCJNnVBHg4YMKD1Kl9FhAq5evfkSxysIUn9eOvawpPZHnTa8KZHNZH0Duqtj
 Wmhcn20H0kvLW4GcQiIH+MnNa+9Je6bk3qYws+7M/Fqkn3MXP5lkKDOGvRumdMF2lBCQ
 pJcLeg5+OdQVcrEG80kYzFmcyjaUsp03dM3QTxGd/Y7QGcyOSzHm6A5PbMP9XMFtcEMB
 ohPoe1LeeYzjsT/MiQz0W77Lh/wNxrHMo5XzFkIpwZf0OHSS1hX8nQ/a/swTAkoPugtL
 AxAA==
X-Gm-Message-State: ANoB5pnAqtpDsHYzjalfBPNEbONJFmsbSx8Pn/ZJCi+sAbJ3xxFjv0pC
 zFr7lviJqsbrFyN+CWWX9wwKQg==
X-Google-Smtp-Source: AA0mqf4QP+zArFz63fn57otD32gK2i2elrbUESyr+iPF2DcZAE9V8zZJ7nbMKdM25Fr7Z0/3Tu+lEA==
X-Received: by 2002:a05:6512:340a:b0:4ae:d9b4:bd31 with SMTP id
 i10-20020a056512340a00b004aed9b4bd31mr3787930lfr.645.1669203830759; 
 Wed, 23 Nov 2022 03:43:50 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl.
 [95.49.32.48]) by smtp.gmail.com with ESMTPSA id
 z18-20020a056512371200b004b4bae1a05asm2536301lfr.293.2022.11.23.03.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:43:50 -0800 (PST)
Message-ID: <e416812c-5524-673f-4c34-8dab758e0de8@linaro.org>
Date: Wed, 23 Nov 2022 12:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 06/11] drm/msm/dsi/phy: rework register setting for 7nm
 PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-7-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221122231235.3299737-7-dmitry.baryshkov@linaro.org>
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



On 23.11.2022 00:12, Dmitry Baryshkov wrote:
> In preparation to adding the sm8350 and sm8450 PHYs support, rearrange
> register values calculations in dsi_7nm_phy_enable(). This change bears
> no functional changes itself, it is merely a preparation for the next
> patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 26 +++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9e7fa7d88ead..0b780f9d3d0a 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -858,23 +858,34 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	/* Alter PHY configurations if data rate less than 1.5GHZ*/
>  	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>  
> +	if (phy->cphy_mode) {
> +		vreg_ctrl_0 = 0x51;
> +		vreg_ctrl_1 = 0x55;
> +		glbl_pemph_ctrl_0 = 0x11;
> +		lane_ctrl0 = 0x17;
> +	} else {
> +		vreg_ctrl_1 = 0x5c;
> +		glbl_pemph_ctrl_0 = 0x00;
> +		lane_ctrl0 = 0x1f;
> +	}
> +
>  	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> -		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>  		if (phy->cphy_mode) {
>  			glbl_rescode_top_ctrl = 0x00;
>  			glbl_rescode_bot_ctrl = 0x3c;
>  		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>  			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
>  			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
>  		}
>  		glbl_str_swi_cal_sel_ctrl = 0x00;
>  		glbl_hstx_str_ctrl_0 = 0x88;
>  	} else {
> -		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>  		if (phy->cphy_mode) {
>  			glbl_str_swi_cal_sel_ctrl = 0x03;
>  			glbl_hstx_str_ctrl_0 = 0x66;
>  		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>  			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
>  			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
>  		}
> @@ -882,17 +893,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  		glbl_rescode_bot_ctrl = 0x3c;
>  	}
>  
> -	if (phy->cphy_mode) {
> -		vreg_ctrl_0 = 0x51;
> -		vreg_ctrl_1 = 0x55;
> -		glbl_pemph_ctrl_0 = 0x11;
> -		lane_ctrl0 = 0x17;
> -	} else {
> -		vreg_ctrl_1 = 0x5c;
> -		glbl_pemph_ctrl_0 = 0x00;
> -		lane_ctrl0 = 0x1f;
> -	}
> -
>  	/* de-assert digital and pll power down */
>  	data = BIT(6) | BIT(5);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
