Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8E73ADA3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 02:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA6510E066;
	Fri, 23 Jun 2023 00:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA8510E066
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 00:13:07 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b4636bb22eso1862961fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 17:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687479185; x=1690071185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7OBMWiQz5SKlQFOgJtcvGQb/Je3ERsxAOPrGehz6pFc=;
 b=s3uRz10048rHjIkbkzzNcnVpx4K4H57Z1xiig/1EJadsZ/CIlukZgGA2aYEBlcjRqy
 y4WPbemfowigrNbuc3X2Tc/jYYhwPNwYANWLo0HMD6kinxoONwe12yJjIA2EUNrl0/Vb
 C0rmK9dWExZIax1zcmYgtdRjwrJjDiD1j3mddjMXbsqVwJ33bq0B9a7EesVmPvAoVDO9
 eHqsxAWtx3RgYILjw7LfxQRWuRveZtUkBoVJBAvyUGxscdNTceAH28opg1ZfSXZBpVrA
 yb6FL9FSJquPYdw0HWEYUGaQQbI+w2nXspNU+z/yBRm5QBAla9BJckGN57kHY/aO6sug
 q9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687479185; x=1690071185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7OBMWiQz5SKlQFOgJtcvGQb/Je3ERsxAOPrGehz6pFc=;
 b=CSftop6cgIypt1oj6LnBFsBsnVo4rq1mOFC4Xt2CmKqWDvXN7NB3W+g+/ktvV5mwQ9
 ARkNiltKXfx3pynFJsHL50u2iJvHJ5DmmK2uLYs38BOw1RmYvoE8L5YXjIWkYMBwEmji
 TtttMGMFEqCHdSc1EJAgwshcYcVx+GmyLA5e440p/fN0bn7zI3z/KPpsJ+ZkCnftsfty
 oCqaAcyPD1eBCHYSzqxrfcXF4X3yvs3EQMDNX1FPgO8uE56Y33fB4PWx7YvoWAy/1rvq
 YMVInbZvzVU1Qf81pbVuXIwUvRW63BgSnBksVE/esaeOxUmvfofZ/1E7GCZjZBcjCId8
 PKag==
X-Gm-Message-State: AC+VfDxZvqiY0BYB338mw6AGvRP+IxRKaWiU30pezhqNRKOACXVxIsav
 yKy58i8Zvdw6rOGs+CIYuYm8dg==
X-Google-Smtp-Source: ACHHUZ6J0cGRchjcolAtWC9ovD1xV3EIViBTVz11rROZiFot+lLsFkdRvnYYz9Ketg5J7htNaIEeWg==
X-Received: by 2002:a2e:a401:0:b0:2b4:809a:1c7c with SMTP id
 p1-20020a2ea401000000b002b4809a1c7cmr7920540ljn.19.1687479185415; 
 Thu, 22 Jun 2023 17:13:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a2e918e000000b002b47d704330sm1493431ljg.6.2023.06.22.17.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 17:13:04 -0700 (PDT)
Message-ID: <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
Date: Fri, 23 Jun 2023 03:13:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub blocks
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 02:48, Ryan McCann wrote:
> Currently, the device core dump mechanism does not dump registers of sub
> blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
> function to dump hardware blocks that contain sub blocks.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 +++++++++++++++++++++++++++-----
>   1 file changed, 168 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..9b1b1c382269 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>   	return 0;
>   }
>   
> +static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state *disp_state,
> +					   void __iomem *mmio, void *blk,
> +					   enum dpu_hw_blk_type blk_type)

No. Such multiplexers add no value to the code. Please inline it.

Not to mention that this patch is hard to review. You both move existing 
code and add new features. If it were to go, it should have been split 
into two patches: one introducing the multiplexer and another one adding 
subblocks.

> +{
> +	u32 base;
> +
> +	switch (blk_type) {
> +	case DPU_HW_BLK_TOP:
> +	{
> +		struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
> +
> +		if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
> +			msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
> +						    mmio + top->base, "top");
> +			msm_disp_snapshot_add_block(disp_state, top->len - MDP_PERIPH_TOP0_END,
> +						    mmio + top->base + MDP_PERIPH_TOP0_END,
> +						    "top_2");
> +		} else {
> +			msm_disp_snapshot_add_block(disp_state, top->len, mmio + top->base, "top");
> +		}
> +		break;
> +	}
> +	case DPU_HW_BLK_LM:
> +	{
> +		struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
> +
> +		msm_disp_snapshot_add_block(disp_state, mixer->len, mmio + mixer->base, "%s",
> +					    mixer->name);
> +		break;
> +	}
> +	case DPU_HW_BLK_CTL:
> +	{
> +		struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
> +
> +		msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + ctl->base, "%s",
> +					    ctl->name);
> +		break;
> +	}
> +	case DPU_HW_BLK_INTF:
> +	{
> +		struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
> +
> +		msm_disp_snapshot_add_block(disp_state, intf->len, mmio + intf->base, "%s",
> +					    intf->name);
> +		break;
> +	}
> +	case DPU_HW_BLK_WB:
> +	{
> +		struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
> +
> +		msm_disp_snapshot_add_block(disp_state, wb->len, mmio + wb->base, "%s",
> +					    wb->name);
> +		break;
> +	}
> +	case DPU_HW_BLK_SSPP:
> +	{
> +		struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg *)blk;
> +		const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
> +
> +		base = sspp_block->base;
> +
> +		msm_disp_snapshot_add_block(disp_state, sspp_block->len, mmio + base, "%s",
> +					    sspp_block->name);
> +
> +		if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> +		    sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> +		    sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
> +			msm_disp_snapshot_add_block(disp_state, sblk->scaler_blk.len,
> +						    mmio + base + sblk->scaler_blk.base, "%s_%s",
> +						    sspp_block->name, sblk->scaler_blk.name);

Actually, it would be better to:
- drop name from all sblk instances (and use known string instead of the 
sblk name here)
- Use sblk->foo_blk.len to check if it should be printed or not.

> +
> +		if (sspp_block->features & BIT(DPU_SSPP_CSC) || sspp_block->features
> +					& BIT(DPU_SSPP_CSC_10BIT))

A very bad use of indentation. In future please split logically rather 
than just filling the line up to the line width.

> +			msm_disp_snapshot_add_block(disp_state, sblk->csc_blk.len,
> +						    mmio + base + sblk->csc_blk.base, "%s_%s",
> +						    sspp_block->name, sblk->csc_blk.name);
> +		break;
> +	}
> +	case DPU_HW_BLK_DSPP:
> +	{
> +		struct dpu_dspp_cfg *dspp_block = (struct dpu_dspp_cfg *)blk;
> +
> +		base = dspp_block->base;
> +
> +		msm_disp_snapshot_add_block(disp_state, dspp_block->len, mmio + base, "%s",
> +					    dspp_block->name);
> +
> +		if (dspp_block->features & BIT(DPU_DSPP_PCC))
> +			msm_disp_snapshot_add_block(disp_state, dspp_block->sblk->pcc.len,
> +						    mmio + base + dspp_block->sblk->pcc.base,
> +						    "%s_%s", dspp_block->name,
> +						    dspp_block->sblk->pcc.name);
> +		break;
> +	}
> +	case DPU_HW_BLK_PINGPONG:
> +	{
> +		struct dpu_pingpong_cfg *pingpong_block = (struct dpu_pingpong_cfg *)blk;
> +		const struct dpu_pingpong_sub_blks *sblk = pingpong_block->sblk;
> +
> +		base = pingpong_block->base;
> +
> +		msm_disp_snapshot_add_block(disp_state, pingpong_block->len, mmio + base, "%s",
> +					    pingpong_block->name);
> +
> +		if (pingpong_block->features & BIT(DPU_PINGPONG_TE2))
> +			msm_disp_snapshot_add_block(disp_state, sblk->te2.len,
> +						    mmio + base + sblk->te2.base, "%s_%s",
> +						    pingpong_block->name, sblk->te2.name);
> +
> +		if (pingpong_block->features & BIT(DPU_PINGPONG_DITHER))
> +			msm_disp_snapshot_add_block(disp_state, sblk->dither.len,
> +						    mmio + base + sblk->dither.base, "%s_%s",
> +						    pingpong_block->name, sblk->dither.name);
> +		break;
> +	}
> +	case DPU_HW_BLK_DSC:
> +	{
> +		struct dpu_dsc_cfg *dsc_block = (struct dpu_dsc_cfg *)blk;
> +
> +		base = dsc_block->base;
> +
> +		if (dsc_block->features & BIT(DPU_DSC_HW_REV_1_2)) {
> +			struct dpu_dsc_blk enc = dsc_block->sblk->enc;
> +			struct dpu_dsc_blk ctl = dsc_block->sblk->ctl;
> +
> +			/* For now, pass in a length of 0 because the DSC_BLK register space
> +			 * overlaps with the sblks' register space.
> +			 *
> +			 * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW catalog where
> +			 * applicable.

Nice catch, thank you. We should fix that.

> +			 */
> +			msm_disp_snapshot_add_block(disp_state, 0, mmio + base, "%s",
> +						    dsc_block->name);



> +			msm_disp_snapshot_add_block(disp_state, enc.len, mmio + base + enc.base,
> +						    "%s_%s", dsc_block->name, enc.name);
> +			msm_disp_snapshot_add_block(disp_state, ctl.len, mmio + base + ctl.base,
> +						    "%s_%s", dsc_block->name, ctl.name);
> +		} else {
> +			msm_disp_snapshot_add_block(disp_state, dsc_block->len, mmio + base, "%s",
> +						    dsc_block->name);
> +		}
> +		break;
> +	}
> +	default:
> +		DPU_ERROR("Block type not supported.");
> +	}
> +}
> +
>   static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_kms *kms)
>   {
>   	int i;
> @@ -899,53 +1047,47 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   
>   	/* dump CTL sub-blocks HW regs info */
>   	for (i = 0; i < cat->ctl_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
> -				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->ctl[i],
> +					       DPU_HW_BLK_CTL);
>   
>   	/* dump DSPP sub-blocks HW regs info */
>   	for (i = 0; i < cat->dspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
> -				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->dspp[i],
> +					       DPU_HW_BLK_DSPP);
>   
>   	/* dump INTF sub-blocks HW regs info */
>   	for (i = 0; i < cat->intf_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
> -				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->intf[i],
> +					       DPU_HW_BLK_INTF);
>   
>   	/* dump PP sub-blocks HW regs info */
>   	for (i = 0; i < cat->pingpong_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
> -				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->pingpong[i],
> +					       DPU_HW_BLK_PINGPONG);
>   
>   	/* dump SSPP sub-blocks HW regs info */
>   	for (i = 0; i < cat->sspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
> -				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->sspp[i],
> +					       DPU_HW_BLK_SSPP);
>   
>   	/* dump LM sub-blocks HW regs info */
>   	for (i = 0; i < cat->mixer_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
> -				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->mixer[i],
> +					       DPU_HW_BLK_LM);
>   
>   	/* dump WB sub-blocks HW regs info */
>   	for (i = 0; i < cat->wb_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
> -				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
> -
> -	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
> -		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
> -				dpu_kms->mmio + cat->mdp[0].base, "top");
> -		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,
> -				dpu_kms->mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END, "top_2");
> -	} else {
> -		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
> -				dpu_kms->mmio + cat->mdp[0].base, "top");
> -	}
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->wb[i],
> +					       DPU_HW_BLK_WB);
> +
> +	/* dump top block */
> +	dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->mdp[0],
> +				       DPU_HW_BLK_TOP);
>   
>   	/* dump DSC sub-blocks HW regs info */
>   	for (i = 0; i < cat->dsc_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> -				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
> +		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->dsc[i],
> +					       DPU_HW_BLK_DSC);
>   
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
> 

-- 
With best wishes
Dmitry

