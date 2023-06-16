Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF6E733C9E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE97F10E6A5;
	Fri, 16 Jun 2023 22:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3836210E6A2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:53:37 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A464921543;
 Sat, 17 Jun 2023 00:53:33 +0200 (CEST)
Date: Sat, 17 Jun 2023 00:53:32 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 05/19] drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
Message-ID: <jfbjsdjjnbjezfdbiwbvfauztggqlp7qhxyeaozh26wfmqx6wm@sy6tb5ubgfa4>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-6-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-16 13:03:03, Dmitry Baryshkov wrote:
> Since there is always just a single MDP_TOP instance, drop the enum
> dpu_mdp and corresponding index value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 5 -----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 6 ++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h               | 7 ++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
>  19 files changed, 20 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index e0d2ee48d733..30565b245b29 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg msm8998_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x458,
>  	.features = BIT(DPU_MDP_VSYNC_SEL),
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 72295d5a10dc..35c495bdcbe9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sdm845_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x45c,
>  	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 418312b164b8..cb2716715e3d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm8150_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x45c,
>  	.features = BIT(DPU_MDP_AUDIO_SELECT),
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index ffacf29926b3..a655e84cf147 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sc8180x_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x45c,
>  	.features = BIT(DPU_MDP_AUDIO_SELECT),
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 86dfc5745630..90e561d086e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm8250_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = 0,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index f42f27707453..3aafe4dfb663 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -23,7 +23,7 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sc7180_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = 0,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 1d21c33542a7..3ff4817de0cc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -24,7 +24,7 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm6115_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = 0,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 6ad68764e13f..198865fe5cba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm6350_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = 0,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 80670e7cfc57..ba0e419e17cf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -21,7 +21,7 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg qcm2290_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = 0,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 8e7dcb2e8762..8b659a60d2c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm6375_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = 0,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 83dafd3f2a41..c741595e2b62 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm8350_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = 0,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index a7695f05beab..6174f7433203 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -24,7 +24,7 @@ static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sc7280_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x2014,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 54543dc3985a..6574875c4f13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sc8280xp_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 0f8bf4465372..60a914f19b0d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm8450_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
>  	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 851aa078a4bd..6db1b57e6132 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
>  };
>  
>  static const struct dpu_mdp_cfg sm8550_mdp = {
> -	.name = "top_0", .id = MDP_TOP,
> +	.name = "top_0",
>  	.base = 0, .len = 0x494,
>  	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x4330, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 02a0f48aac94..d85157acfbf8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -101,11 +101,6 @@ enum dpu_hw_blk_type {
>  	DPU_HW_BLK_MAX,
>  };
>  
> -enum dpu_mdp {
> -	MDP_TOP = 0x1,
> -	MDP_MAX,
> -};
> -
>  enum dpu_sspp {
>  	SSPP_NONE,
>  	SSPP_VIG0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 8e2f02731143..1d01f53cd6d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -268,9 +268,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>  		ops->intf_audio_select = dpu_hw_intf_audio_select;
>  }
>  
> -struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
> -		void __iomem *addr,
> -		const struct dpu_mdss_cfg *m)
> +struct dpu_hw_mdp *dpu_hw_mdptop_init(void __iomem *addr,
> +				      const struct dpu_mdss_cfg *m)
>  {
>  	struct dpu_hw_mdp *mdp;
>  	const struct dpu_mdp_cfg *cfg;

As mentioned in the previous patch I think you can pass this directly in
place of `idx` and `m` now, so that it doesn't get left unassigned.

- Marijn

> @@ -288,7 +287,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
>  	/*
>  	 * Assign ops
>  	 */
> -	mdp->idx = idx;
>  	mdp->caps = cfg;
>  	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index a1a9e44bed36..6414111991b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -137,7 +137,6 @@ struct dpu_hw_mdp {
>  	struct dpu_hw_blk_reg_map hw;
>  
>  	/* top */
> -	enum dpu_mdp idx;
>  	const struct dpu_mdp_cfg *caps;
>  
>  	/* ops */
> @@ -146,13 +145,11 @@ struct dpu_hw_mdp {
>  
>  /**
>   * dpu_hw_mdptop_init - initializes the top driver for the passed idx
> - * @idx:  Interface index for which driver object is required
>   * @addr: Mapped register io address of MDP
>   * @m:    Pointer to mdss catalog data
>   */
> -struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
> -		void __iomem *addr,
> -		const struct dpu_mdss_cfg *m);
> +struct dpu_hw_mdp *dpu_hw_mdptop_init(void __iomem *addr,
> +				      const struct dpu_mdss_cfg *m);
>  
>  void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..f5c7ec923104 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  
>  	dpu_kms->rm_init = true;
>  
> -	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
> +	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->mmio,
>  					     dpu_kms->catalog);
>  	if (IS_ERR(dpu_kms->hw_mdp)) {
>  		rc = PTR_ERR(dpu_kms->hw_mdp);
> -- 
> 2.39.2
> 
