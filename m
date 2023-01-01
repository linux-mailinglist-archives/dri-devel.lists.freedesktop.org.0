Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D3265A8D2
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 05:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF81A10E075;
	Sun,  1 Jan 2023 04:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07510E075
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 04:28:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id cf42so37285121lfb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 20:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oH8K9f7UyJRuodGJ3yPCdaObtlNSOzXxH0uzeAO3bPo=;
 b=Ai8jQqzHZ/LlGgMhch3jtj6uaayE2qcuJ/awNPLcOAGYEutF/BCD/xQ4x9QmWBbMsM
 NNsbwmrdzyV5c1AOzeCM0PlMw7PYo7mb2RI7VSAIdhkzOv34o9lmx3SnTH955c5q/WK6
 jMYvr4atUtZLWFb4O3qwdUO56X/5UXfWbkx56FoJufUfjwMDvPfDT0DYnndlzw2MP21S
 weVijkSrjak1l122uNmTlM+8NLna10CIXMSBaMsysgZ0mmgHOJluexlb17P3x9D4UJ3c
 BAmwlcXQy6NRS8KYMu1xR2XgQUNtR0dMX3fuhuMRTP7SL04dXgFI+oRf/lgohIMuailC
 OHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oH8K9f7UyJRuodGJ3yPCdaObtlNSOzXxH0uzeAO3bPo=;
 b=1eoJIg2h6MdTt/dtVncswSsmsYqFxePduvAu48TA2wSB3g1g3hk7YsMOjWbPkrNoMT
 Li0Q2to61LSkg4r8vPkMbV7intOLOhNQ0a1pCCXW+q67eBledVQZprpgU7EairkNU3ZG
 1McgLLbqQwyi7v/BllinhDKNPY1kw0HFUv2MqXageJqP9ZOCHHdWYux2F1KNClblJak4
 sC1ML+zYawv5ic6eUJuDhxtjYpTwaTW9i1gtV352L/Jh7ZIOtzeON9XM/ovMt/T3pcdh
 S85m/uUb6kvPP5aebCKD4JizSefTxfu5Mb445fyBdCKH6HmsQWpVFG/ixI8iuZPfwse8
 zzSA==
X-Gm-Message-State: AFqh2kqNU6XuN3lHveiOMioHbOZMCFGyl3CnXbcuj5RULZZeO7+aoZTx
 ZGpagZRMK+AWcTY83SEBWkaTqw==
X-Google-Smtp-Source: AMrXdXvo4ZJmLN9FDqA8FOdIn63YSqaUle9vpmVE/whEmg6m1YU/5EVmBxKcIamme2TyWCUSLBEWBw==
X-Received: by 2002:ac2:4894:0:b0:4bb:710e:bf8 with SMTP id
 x20-20020ac24894000000b004bb710e0bf8mr10208282lfc.16.1672547304783; 
 Sat, 31 Dec 2022 20:28:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v20-20020ac258f4000000b004cb23904bd9sm971539lfo.144.2022.12.31.20.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Dec 2022 20:28:24 -0800 (PST)
Message-ID: <925e8214-4193-bee3-c26b-f7679a60484e@linaro.org>
Date: Sun, 1 Jan 2023 06:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 2/7] drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and
 above
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-3-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221231215006.211860-3-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/12/2022 23:50, Marijn Suijten wrote:
> Since hardware revision 5.0.0 the TE configuration moved out of the
> PINGPONG block into the INTF block.  Writing these registers has no
> effect, and is omitted downstream via the DPU/SDE_PINGPONG_TE feature
> flag.  This flag is only added to PINGPONG blocks used by hardware prior
> to 5.0.0.
> 
> The code that writes to these registers in the INTF block will follow in
> subsequent patches.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  5 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 53 +++++++++++--------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 18 ++++---
>   3 files changed, 44 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index ae28b2b93e69..7e5ba52197cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -582,7 +582,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   {
>   	struct dpu_hw_pp_vsync_info info;
>   
> -	if (!phys_enc)
> +	if (!phys_enc || !phys_enc->hw_pp->ops.get_vsync_info)
>   		return false;
>   
>   	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
> @@ -607,6 +607,9 @@ static void dpu_encoder_phys_cmd_prepare_commit(

This function works only with the hw_pp and if I'm not mistaken it 
becomes void for newer platforms. Please consider moving completely to 
the dpu_hw_pp.c Then we'd have a single optional callback instead of 
having a pile of them.

>   	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>   		return;
>   
> +	if (!phys_enc->hw_pp->ops.get_autorefresh || !phys_enc->hw_pp->ops.setup_autorefresh)
> +		return;
> +
>   	/* If autorefresh is already disabled, we have nothing to do */
>   	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
>   		return;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 9814ad52cc04..39d4b293710c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -59,11 +59,18 @@
>   #define MIXER_SC7180_MASK \
>   	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
> -#define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
> +#define PINGPONG_SDM845_MASK \
> +	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
>   
> -#define PINGPONG_SDM845_SPLIT_MASK \
> +#define PINGPONG_SDM845_TE2_MASK \
>   	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>   
> +#define PINGPONG_SM8150_MASK \
> +	(BIT(DPU_PINGPONG_DITHER))
> +
> +#define PINGPONG_SM8150_TE2_MASK \
> +	(PINGPONG_SM8150_MASK | BIT(DPU_PINGPONG_TE2))
> +
>   #define CTL_SC7280_MASK \
>   	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>   
> @@ -1156,21 +1163,21 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	.len = 0x20, .version = 0x20000},
>   };
>   
> -#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> +#define PP_BLK_TE(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
>   	{\
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = 0xd4, \
> -	.features = PINGPONG_SDM845_SPLIT_MASK, \
> +	.features = _features, \
>   	.merge_3d = _merge_3d, \
>   	.sblk = &_sblk, \
>   	.intr_done = _done, \
>   	.intr_rdptr = _rdptr, \
>   	}
> -#define PP_BLK(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> +#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
>   	{\
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = 0xd4, \
> -	.features = PINGPONG_SDM845_MASK, \
> +	.features = _features, \
>   	.merge_3d = _merge_3d, \
>   	.sblk = &_sblk, \
>   	.intr_done = _done, \
> @@ -1178,55 +1185,55 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	}
>   
>   static const struct dpu_pingpong_cfg sdm845_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>   };
>   
>   static struct dpu_pingpong_cfg sc7180_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, 0, sdm845_pp_sblk_te, -1, -1),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, 0, sdm845_pp_sblk_te, -1, -1),
>   };
>   
>   static const struct dpu_pingpong_cfg sm8150_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   			-1),
>   };
>   
>   static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
>   };
>   
>   static struct dpu_pingpong_cfg qcm2290_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>   		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..30896c057f87 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -274,14 +274,16 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
>   static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   				unsigned long features)
>   {
> -	c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
> -	c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> -	c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> -	c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
> -	c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
> -	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
> -	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
> -	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +	if (test_bit(DPU_PINGPONG_TE, &features)) {
> +		c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
> +		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> +		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> +		c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
> +		c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
> +		c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
> +		c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
> +		c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +	}
>   	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>   	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

-- 
With best wishes
Dmitry

