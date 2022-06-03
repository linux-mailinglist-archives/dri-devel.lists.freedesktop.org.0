Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0153D39C
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 00:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7C8113FCC;
	Fri,  3 Jun 2022 22:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCDB113FC8;
 Fri,  3 Jun 2022 22:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654295283; x=1685831283;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UbTAxIh4DzT52E00UwYbJzVyhNhK5EyK3tY/MGYpzOA=;
 b=bHlYFujenyjWN2bjN4y29J+Oeot66OKwkOAXMTL9Sl2Y0G0w6PrIb9oA
 sJy8O1SR6wkSEf5BN0H+WPzKcDE3Tngwu4wOYjhkaxTPVNfZDtFFE2pqr
 YQyyGLKYmpOI2u5LEv9u+sOa9axwHagW729BCf40iHgiYpM9Dsqlddv5T w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 03 Jun 2022 15:28:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 15:28:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 3 Jun 2022 15:28:02 -0700
Received: from [10.111.174.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 3 Jun 2022
 15:27:59 -0700
Message-ID: <7bc9511f-9fe4-191f-aaa3-f56af76c9fc7@quicinc.com>
Date: Fri, 3 Jun 2022 15:27:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v4 7/7] drm/msm/dpu: make dpu hardware catalog
 static const
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
 <20220602202447.1755115-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602202447.1755115-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 1:24 PM, Dmitry Baryshkov wrote:
> Replace superfluous cfg_init functions, which just assign a static
> config to the struct dpu_mdss_cfg, with static instances of struct
> dpu_mdss_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 475 ++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
>   3 files changed, 213 insertions(+), 269 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1c40307af0ec..6d52db450e42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1722,283 +1722,228 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   /*************************************************************
> - * Hardware catalog init
> + * Hardware catalog
>    *************************************************************/
>   
> -/*
> - * msm8998_cfg_init(): populate sdm845 dpu sub-blocks reg offsets
> - * and instance counts.
> - */
> -static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &msm8998_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(msm8998_mdp),
> -		.mdp = msm8998_mdp,
> -		.ctl_count = ARRAY_SIZE(msm8998_ctl),
> -		.ctl = msm8998_ctl,
> -		.sspp_count = ARRAY_SIZE(msm8998_sspp),
> -		.sspp = msm8998_sspp,
> -		.mixer_count = ARRAY_SIZE(msm8998_lm),
> -		.mixer = msm8998_lm,
> -		.dspp_count = ARRAY_SIZE(msm8998_dspp),
> -		.dspp = msm8998_dspp,
> -		.pingpong_count = ARRAY_SIZE(sdm845_pp),
> -		.pingpong = sdm845_pp,
> -		.intf_count = ARRAY_SIZE(msm8998_intf),
> -		.intf = msm8998_intf,
> -		.vbif_count = ARRAY_SIZE(msm8998_vbif),
> -		.vbif = msm8998_vbif,
> -		.reg_dma_count = 0,
> -		.perf = &msm8998_perf_data,
> -		.mdss_irqs = IRQ_SM8250_MASK,
> -	};
> -}
> -
> -/*
> - * sdm845_cfg_init(): populate sdm845 dpu sub-blocks reg offsets
> - * and instance counts.
> - */
> -static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &sdm845_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(sdm845_mdp),
> -		.mdp = sdm845_mdp,
> -		.ctl_count = ARRAY_SIZE(sdm845_ctl),
> -		.ctl = sdm845_ctl,
> -		.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -		.sspp = sdm845_sspp,
> -		.mixer_count = ARRAY_SIZE(sdm845_lm),
> -		.mixer = sdm845_lm,
> -		.pingpong_count = ARRAY_SIZE(sdm845_pp),
> -		.pingpong = sdm845_pp,
> -		.dsc_count = ARRAY_SIZE(sdm845_dsc),
> -		.dsc = sdm845_dsc,
> -		.intf_count = ARRAY_SIZE(sdm845_intf),
> -		.intf = sdm845_intf,
> -		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -		.vbif = sdm845_vbif,
> -		.reg_dma_count = 1,
> -		.dma_cfg = &sdm845_regdma,
> -		.perf = &sdm845_perf_data,
> -		.mdss_irqs = IRQ_SDM845_MASK,
> -	};
> -}
> -
> -/*
> - * sc7180_cfg_init(): populate sc7180 dpu sub-blocks reg offsets
> - * and instance counts.
> - */
> -static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &sc7180_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(sc7180_mdp),
> -		.mdp = sc7180_mdp,
> -		.ctl_count = ARRAY_SIZE(sc7180_ctl),
> -		.ctl = sc7180_ctl,
> -		.sspp_count = ARRAY_SIZE(sc7180_sspp),
> -		.sspp = sc7180_sspp,
> -		.mixer_count = ARRAY_SIZE(sc7180_lm),
> -		.mixer = sc7180_lm,
> -		.dspp_count = ARRAY_SIZE(sc7180_dspp),
> -		.dspp = sc7180_dspp,
> -		.pingpong_count = ARRAY_SIZE(sc7180_pp),
> -		.pingpong = sc7180_pp,
> -		.intf_count = ARRAY_SIZE(sc7180_intf),
> -		.intf = sc7180_intf,
> -		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -		.vbif = sdm845_vbif,
> -		.reg_dma_count = 1,
> -		.dma_cfg = &sdm845_regdma,
> -		.perf = &sc7180_perf_data,
> -		.mdss_irqs = IRQ_SC7180_MASK,
> -	};
> -}
> -
> -/*
> - * sm8150_cfg_init(): populate sm8150 dpu sub-blocks reg offsets
> - * and instance counts.
> - */
> -static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &sm8150_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(sdm845_mdp),
> -		.mdp = sdm845_mdp,
> -		.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -		.ctl = sm8150_ctl,
> -		.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -		.sspp = sdm845_sspp,
> -		.mixer_count = ARRAY_SIZE(sm8150_lm),
> -		.mixer = sm8150_lm,
> -		.dspp_count = ARRAY_SIZE(sm8150_dspp),
> -		.dspp = sm8150_dspp,
> -		.pingpong_count = ARRAY_SIZE(sm8150_pp),
> -		.pingpong = sm8150_pp,
> -		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> -		.merge_3d = sm8150_merge_3d,
> -		.intf_count = ARRAY_SIZE(sm8150_intf),
> -		.intf = sm8150_intf,
> -		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -		.vbif = sdm845_vbif,
> -		.reg_dma_count = 1,
> -		.dma_cfg = &sm8150_regdma,
> -		.perf = &sm8150_perf_data,
> -		.mdss_irqs = IRQ_SDM845_MASK,
> -	};
> -}
> -
> -/*
> - * sc8180x_cfg_init(): populate sc8180 dpu sub-blocks reg offsets
> - * and instance counts.
> - */
> -static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &sc8180x_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(sc8180x_mdp),
> -		.mdp = sc8180x_mdp,
> -		.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -		.ctl = sm8150_ctl,
> -		.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -		.sspp = sdm845_sspp,
> -		.mixer_count = ARRAY_SIZE(sm8150_lm),
> -		.mixer = sm8150_lm,
> -		.pingpong_count = ARRAY_SIZE(sm8150_pp),
> -		.pingpong = sm8150_pp,
> -		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> -		.merge_3d = sm8150_merge_3d,
> -		.intf_count = ARRAY_SIZE(sc8180x_intf),
> -		.intf = sc8180x_intf,
> -		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -		.vbif = sdm845_vbif,
> -		.reg_dma_count = 1,
> -		.dma_cfg = &sm8150_regdma,
> -		.perf = &sc8180x_perf_data,
> -		.mdss_irqs = IRQ_SC8180X_MASK,
> -	};
> -}
> -
> -/*
> - * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
> - * and instance counts.
> - */
> -static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &sm8250_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(sm8250_mdp),
> -		.mdp = sm8250_mdp,
> -		.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -		.ctl = sm8150_ctl,
> -		.sspp_count = ARRAY_SIZE(sm8250_sspp),
> -		.sspp = sm8250_sspp,
> -		.mixer_count = ARRAY_SIZE(sm8150_lm),
> -		.mixer = sm8150_lm,
> -		.dspp_count = ARRAY_SIZE(sm8150_dspp),
> -		.dspp = sm8150_dspp,
> -		.pingpong_count = ARRAY_SIZE(sm8150_pp),
> -		.pingpong = sm8150_pp,
> -		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> -		.merge_3d = sm8150_merge_3d,
> -		.intf_count = ARRAY_SIZE(sm8150_intf),
> -		.intf = sm8150_intf,
> -		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -		.vbif = sdm845_vbif,
> -		.wb_count = ARRAY_SIZE(sm8250_wb),
> -		.wb = sm8250_wb,
> -		.reg_dma_count = 1,
> -		.dma_cfg = &sm8250_regdma,
> -		.perf = &sm8250_perf_data,
> -		.mdss_irqs = IRQ_SM8250_MASK,
> -	};
> -}
> -
> -static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &sc7280_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(sc7280_mdp),
> -		.mdp = sc7280_mdp,
> -		.ctl_count = ARRAY_SIZE(sc7280_ctl),
> -		.ctl = sc7280_ctl,
> -		.sspp_count = ARRAY_SIZE(sc7280_sspp),
> -		.sspp = sc7280_sspp,
> -		.mixer_count = ARRAY_SIZE(sc7280_lm),
> -		.mixer = sc7280_lm,
> -		.pingpong_count = ARRAY_SIZE(sc7280_pp),
> -		.pingpong = sc7280_pp,
> -		.intf_count = ARRAY_SIZE(sc7280_intf),
> -		.intf = sc7280_intf,
> -		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -		.vbif = sdm845_vbif,
> -		.perf = &sc7280_perf_data,
> -		.mdss_irqs = IRQ_SC7280_MASK,
> -	};
> -}
> -
> -
> -/*
> - * qcm2290_cfg_init(): populate qcm2290 dpu sub-blocks reg offsets
> - * and instance counts.
> - */
> -static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	*dpu_cfg = (struct dpu_mdss_cfg){
> -		.caps = &qcm2290_dpu_caps,
> -		.mdp_count = ARRAY_SIZE(qcm2290_mdp),
> -		.mdp = qcm2290_mdp,
> -		.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> -		.ctl = qcm2290_ctl,
> -		.sspp_count = ARRAY_SIZE(qcm2290_sspp),
> -		.sspp = qcm2290_sspp,
> -		.mixer_count = ARRAY_SIZE(qcm2290_lm),
> -		.mixer = qcm2290_lm,
> -		.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> -		.dspp = qcm2290_dspp,
> -		.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> -		.pingpong = qcm2290_pp,
> -		.intf_count = ARRAY_SIZE(qcm2290_intf),
> -		.intf = qcm2290_intf,
> -		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -		.vbif = sdm845_vbif,
> -		.reg_dma_count = 1,
> -		.dma_cfg = &sdm845_regdma,
> -		.perf = &qcm2290_perf_data,
> -		.mdss_irqs = IRQ_SC7180_MASK,
> -	};
> -}
> +static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
> +	.caps = &msm8998_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(msm8998_mdp),
> +	.mdp = msm8998_mdp,
> +	.ctl_count = ARRAY_SIZE(msm8998_ctl),
> +	.ctl = msm8998_ctl,
> +	.sspp_count = ARRAY_SIZE(msm8998_sspp),
> +	.sspp = msm8998_sspp,
> +	.mixer_count = ARRAY_SIZE(msm8998_lm),
> +	.mixer = msm8998_lm,
> +	.dspp_count = ARRAY_SIZE(msm8998_dspp),
> +	.dspp = msm8998_dspp,
> +	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> +	.pingpong = sdm845_pp,
> +	.intf_count = ARRAY_SIZE(msm8998_intf),
> +	.intf = msm8998_intf,
> +	.vbif_count = ARRAY_SIZE(msm8998_vbif),
> +	.vbif = msm8998_vbif,
> +	.reg_dma_count = 0,
> +	.perf = &msm8998_perf_data,
> +	.mdss_irqs = IRQ_SM8250_MASK,
> +};
> +
> +static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
> +	.caps = &sdm845_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> +	.mdp = sdm845_mdp,
> +	.ctl_count = ARRAY_SIZE(sdm845_ctl),
> +	.ctl = sdm845_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> +	.sspp = sdm845_sspp,
> +	.mixer_count = ARRAY_SIZE(sdm845_lm),
> +	.mixer = sdm845_lm,
> +	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> +	.pingpong = sdm845_pp,
> +	.dsc_count = ARRAY_SIZE(sdm845_dsc),
> +	.dsc = sdm845_dsc,
> +	.intf_count = ARRAY_SIZE(sdm845_intf),
> +	.intf = sdm845_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sdm845_regdma,
> +	.perf = &sdm845_perf_data,
> +	.mdss_irqs = IRQ_SDM845_MASK,
> +};
> +
> +static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
> +	.caps = &sc7180_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sc7180_mdp),
> +	.mdp = sc7180_mdp,
> +	.ctl_count = ARRAY_SIZE(sc7180_ctl),
> +	.ctl = sc7180_ctl,
> +	.sspp_count = ARRAY_SIZE(sc7180_sspp),
> +	.sspp = sc7180_sspp,
> +	.mixer_count = ARRAY_SIZE(sc7180_lm),
> +	.mixer = sc7180_lm,
> +	.dspp_count = ARRAY_SIZE(sc7180_dspp),
> +	.dspp = sc7180_dspp,
> +	.pingpong_count = ARRAY_SIZE(sc7180_pp),
> +	.pingpong = sc7180_pp,
> +	.intf_count = ARRAY_SIZE(sc7180_intf),
> +	.intf = sc7180_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sdm845_regdma,
> +	.perf = &sc7180_perf_data,
> +	.mdss_irqs = IRQ_SC7180_MASK,
> +};
> +
> +static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
> +	.caps = &sm8150_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> +	.mdp = sdm845_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> +	.ctl = sm8150_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> +	.sspp = sdm845_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> +	.pingpong = sm8150_pp,
> +	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> +	.merge_3d = sm8150_merge_3d,
> +	.intf_count = ARRAY_SIZE(sm8150_intf),
> +	.intf = sm8150_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8150_regdma,
> +	.perf = &sm8150_perf_data,
> +	.mdss_irqs = IRQ_SDM845_MASK,
> +};
> +
> +static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
> +	.caps = &sc8180x_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
> +	.mdp = sc8180x_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> +	.ctl = sm8150_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> +	.sspp = sdm845_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> +	.pingpong = sm8150_pp,
> +	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> +	.merge_3d = sm8150_merge_3d,
> +	.intf_count = ARRAY_SIZE(sc8180x_intf),
> +	.intf = sc8180x_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8150_regdma,
> +	.perf = &sc8180x_perf_data,
> +	.mdss_irqs = IRQ_SC8180X_MASK,
> +};
> +
> +static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
> +	.caps = &sm8250_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sm8250_mdp),
> +	.mdp = sm8250_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> +	.ctl = sm8150_ctl,
> +	.sspp_count = ARRAY_SIZE(sm8250_sspp),
> +	.sspp = sm8250_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> +	.pingpong = sm8150_pp,
> +	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> +	.merge_3d = sm8150_merge_3d,
> +	.intf_count = ARRAY_SIZE(sm8150_intf),
> +	.intf = sm8150_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.wb_count = ARRAY_SIZE(sm8250_wb),
> +	.wb = sm8250_wb,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8250_regdma,
> +	.perf = &sm8250_perf_data,
> +	.mdss_irqs = IRQ_SM8250_MASK,
> +};
> +
> +static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
> +	.caps = &sc7280_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sc7280_mdp),
> +	.mdp = sc7280_mdp,
> +	.ctl_count = ARRAY_SIZE(sc7280_ctl),
> +	.ctl = sc7280_ctl,
> +	.sspp_count = ARRAY_SIZE(sc7280_sspp),
> +	.sspp = sc7280_sspp,
> +	.mixer_count = ARRAY_SIZE(sc7280_lm),
> +	.mixer = sc7280_lm,
> +	.pingpong_count = ARRAY_SIZE(sc7280_pp),
> +	.pingpong = sc7280_pp,
> +	.intf_count = ARRAY_SIZE(sc7280_intf),
> +	.intf = sc7280_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sc7280_perf_data,
> +	.mdss_irqs = IRQ_SC7280_MASK,
> +};
> +
> +static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
> +	.caps = &qcm2290_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
> +	.mdp = qcm2290_mdp,
> +	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> +	.ctl = qcm2290_ctl,
> +	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
> +	.sspp = qcm2290_sspp,
> +	.mixer_count = ARRAY_SIZE(qcm2290_lm),
> +	.mixer = qcm2290_lm,
> +	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> +	.dspp = qcm2290_dspp,
> +	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> +	.pingpong = qcm2290_pp,
> +	.intf_count = ARRAY_SIZE(qcm2290_intf),
> +	.intf = qcm2290_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sdm845_regdma,
> +	.perf = &qcm2290_perf_data,
> +	.mdss_irqs = IRQ_SC7180_MASK,
> +};
>   
>   static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
> -	{ .hw_rev = DPU_HW_VER_300, .cfg_init = msm8998_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_301, .cfg_init = msm8998_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_510, .cfg_init = sc8180x_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_650, .cfg_init = qcm2290_cfg_init},
> -	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
> -};
> -
> -const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev)
> +	{ .hw_rev = DPU_HW_VER_300, .dpu_cfg = &msm8998_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_301, .dpu_cfg = &msm8998_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_400, .dpu_cfg = &sdm845_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_401, .dpu_cfg = &sdm845_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_500, .dpu_cfg = &sm8150_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_501, .dpu_cfg = &sm8150_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_510, .dpu_cfg = &sc8180x_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
> +};
> +
> +const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
>   {
>   	int i;
>   	struct dpu_mdss_cfg *dpu_cfg;
>   
> -	dpu_cfg = devm_kzalloc(dev, sizeof(*dpu_cfg), GFP_KERNEL);
> +	dpu_cfg = kzalloc(sizeof(*dpu_cfg), GFP_KERNEL);
>   	if (!dpu_cfg)
>   		return ERR_PTR(-ENOMEM);
>   
>   	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
> -		if (cfg_handler[i].hw_rev == hw_rev) {
> -			cfg_handler[i].cfg_init(dpu_cfg);
> -			return dpu_cfg;
> -		}
> +		if (cfg_handler[i].hw_rev == hw_rev)
> +			return cfg_handler[i].dpu_cfg;
>   	}
>   
>   	DPU_ERROR("unsupported chipset id:%X\n", hw_rev);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c317fa27daa0..71fe4c505f5b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -878,17 +878,16 @@ struct dpu_mdss_cfg {
>   
>   struct dpu_mdss_hw_cfg_handler {
>   	u32 hw_rev;
> -	void (*cfg_init)(struct dpu_mdss_cfg *dpu_cfg);
> +	const struct dpu_mdss_cfg *dpu_cfg;
>   };
>   
>   /**
>    * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
>    * hardcoded target specific catalog information in config structure
> - * @dev:          DPU device
>    * @hw_rev:       caller needs provide the hardware revision.
>    *
>    * Return: dpu config structure
>    */
> -const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev);
> +const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev);
>   
>   #endif /* _DPU_HW_CATALOG_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index bba29c31f843..688dc4409af6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1093,7 +1093,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   	pr_info("dpu hardware revision:0x%x\n", dpu_kms->core_rev);
>    > -	dpu_kms->catalog = dpu_hw_catalog_init(dev->dev, dpu_kms->core_rev);
> +	dpu_kms->catalog = dpu_hw_catalog_init(dpu_kms->core_rev);
>   	if (IS_ERR_OR_NULL(dpu_kms->catalog)) {
>   		rc = PTR_ERR(dpu_kms->catalog);
>   		if (!dpu_kms->catalog)
