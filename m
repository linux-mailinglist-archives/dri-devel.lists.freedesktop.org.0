Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A748977EB1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 13:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDCE10ECE5;
	Fri, 13 Sep 2024 11:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iiSjkaTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33210ECDF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 11:43:09 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e1a7d43a226so794560276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726227788; x=1726832588; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9UwhSpacqWbNrpzy9OkkjEtHbhA7k4WWF7GmkMMBnJM=;
 b=iiSjkaThYWSFfswisatI9vj9t+dFa8P8RGfebk8fxauEfAI2BVNaxaa+LK5qyNuAx/
 GUyCK76zq9m0L5STlkqVXPJayPEcu9LVwdh2W6ze6YtDYwoCNH80uWPnHDj71Jk9Xk2h
 /gxlSp/dRl+PmyldZcsqfiNNHmZh5yNvzk4u3iZgQPPIgQWrwsMTeEdjYBUfD/iZMmLy
 WYbgxmeuCF9QDMvT6eWRtHR2gBkngRB1j8egOVmbYgnk8xJP/8cITRGZewVMkawzNjkr
 RKKoLdGnuaBdymY4q54pCV4k8ob9RzaPXivLYfOkLclLsZXd+Gi8WA9/SnPNHWsUgw6o
 VEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726227788; x=1726832588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9UwhSpacqWbNrpzy9OkkjEtHbhA7k4WWF7GmkMMBnJM=;
 b=N+L6VCSC2hwi/CBXukuPjONCUiIIAxkAntudH1Kuxc1C5KoVRBd+fc3x/ZyGiJI9ON
 1AzE2NBitNMholyDlK5PbBnGuHb6S2E2UfcZqVH2sGsqHHM9jfeZ8YrLnZ8DsyH1Vvya
 2tMwg46ONYw25bqhHfcmDTAoNoC8dfMJ0Keuc+mizItPz80i8ywfFHE15tfWGOE/95aW
 3fuXaZUQ6XG6MBWhfhrtDn4b9iZl0cFtvcCvQHESANE0IRP4xHcMNu28YETaVx5WVaXu
 +6KK/139UlSR8wxmGbPawpPkZMui5n+tyVHPfafFsgIrCWavv2W0vlgqcpOGcGk3DB4r
 Ee3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnexmm3Tzg4fHve/2HVzEhi8lxXNxE9IuqJ4VHKXv4/TjF0/toZRDQJJHmEl0Yf/Z9TphI92FpXDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBIUxRAZxd6nhup0MfhFF5fl92i8w2BEzLpRKC5N1XtV1weNj/
 dnSmWEnkHDAOJ570d5+R+HE2RKp5U6mhzwPIddgD5mkEhJ0imgb5faCeDCc5PPo1/T9MTlYHV7g
 qJdPZk0Bva0BJeOsVT8rrjqm2ps/Q4kePUYpPuw==
X-Google-Smtp-Source: AGHT+IE1TLnxU5IuXLszG0sh4Cmeh/NG3k6A0NeL7GYbVv4i0eJleu/njbaWM0plHlg4dpg3DlaBntAGY4GvPCDnoFM=
X-Received: by 2002:a05:690c:ec9:b0:632:5b24:c0c with SMTP id
 00721157ae682-6dbcc23000fmr21070177b3.5.1726227787870; Fri, 13 Sep 2024
 04:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com>
In-Reply-To: <20240913103755.7290-3-quic_mukhopad@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Sep 2024 14:42:56 +0300
Message-ID: <CAA8EJppddLmzJ9WSkLLr-nwM-qe647Sm6jV8SpHdB=0vRQT-=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
 quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Sept 2024 at 13:38, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
> In order to support different HW versions, introduce aux_cfg array
> to move v4 specific aux configuration settings.
>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Bjorn and Dmitry
>         - Made aux_cfg array as const.
>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index da2b32fb5b45..bcd5aced9e06 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>
>  struct qcom_edp_phy_cfg {
>         bool is_edp;
> +       const u8 *aux_cfg;
>         const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>         const struct phy_ver_ops *ver_ops;
>  };
> @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>         .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>  };
>
> +static const u8 edp_phy_aux_cfg_v4[10] = {
> +       0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> +};
> +
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
> +       u8 aux_cfg[10];

Please define 10, so that there are no magic numbers (and less chance
of damaging the stack if it gets changed in one place only.

>         int ret;
> -       u8 cfg8;
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
> @@ -200,6 +205,8 @@ static int qcom_edp_phy_init(struct phy *phy)
>         if (ret)
>                 goto out_disable_supplies;
>
> +       memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
> +
>         writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>                DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>                edp->edp + DP_PHY_PD_CTL);
> @@ -222,22 +229,20 @@ static int qcom_edp_phy_init(struct phy *phy)
>          * even needed.
>          */
>         if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
> -               cfg8 = 0xb7;
> -       else
> -               cfg8 = 0x37;
> +               aux_cfg[8] = 0xb7;
>
>         writel(0xfc, edp->edp + DP_PHY_MODE);
>
> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
> -       writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
> -       writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
> -       writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
> -       writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
> +       writel(aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
> +       writel(aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
> +       writel(aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
> +       writel(aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
> +       writel(aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
> +       writel(aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
> +       writel(aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
> +       writel(aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
> +       writel(aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
> +       writel(aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);

Replace this with a loop?

>
>         writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
>                PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> @@ -519,16 +524,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  };
>
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
> +       .aux_cfg = edp_phy_aux_cfg_v4,
>         .ver_ops = &qcom_edp_phy_ops_v4,
>  };
>
>  static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> +       .aux_cfg = edp_phy_aux_cfg_v4,
>         .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>         .ver_ops = &qcom_edp_phy_ops_v4,
>  };
>
>  static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>         .is_edp = true,
> +       .aux_cfg = edp_phy_aux_cfg_v4,
>         .swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>         .ver_ops = &qcom_edp_phy_ops_v4,
>  };
> @@ -707,6 +715,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>  };
>
>  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
> +       .aux_cfg = edp_phy_aux_cfg_v4,
>         .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>         .ver_ops = &qcom_edp_phy_ops_v6,
>  };
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
