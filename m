Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED474A813
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 02:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B147810E4D8;
	Fri,  7 Jul 2023 00:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E3310E4D8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 00:24:15 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fbaef9871cso1923316e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 17:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688689454; x=1691281454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1CKFofg2COVa+3UsVzZ5/g1kQLOvyhdMC9h7juZx0uI=;
 b=ZlZv+jkzIZRP8kaNc9pGucbnh2+3Sw1ja8PUlhBmxWGfOdYXJ58MAd3ot/ccZhBCQm
 CrdIEV+DwTtz9PerJB7y9iU9wujsRLYD4o5vsSn+roDlIAeXHMN9y2dR7mzzGZ9CbsmJ
 K0Jl0Dcio7V/1qQK5ItSXQdcmtut06MwCU+P2jefAV/kIwuuZe9ceRnotgnj8lvVRjH+
 lUwXkTke0u/vyT/CBFxKZPqNeC0xATiBVN3lSCYh06NJLpWLWUxxJC+Qlpb32gFEeFKe
 cJCE4VluTUJMqZP9h7LJnepVruGR5J9Rj/pCyb+MXkpQIWRNiuU6e2aSvQmgEEjBMhnI
 IiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688689454; x=1691281454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CKFofg2COVa+3UsVzZ5/g1kQLOvyhdMC9h7juZx0uI=;
 b=Y1jyrX5zhMHj/4vkrck3JB4y/fjbQFIBX3mb4xwdclMiRMKYS65mWjbxvfULPYULA6
 vVpThaiju5QE+mIVA9bVoG4m6t4vzq2yg4l6Iz0LpBa2EuQb1vvkxXzWDHw4C9qcobn+
 wTC6HheYMOmYg4YCmyGNUbkTx+38Iq6WXXmegqbBSgNmfDbV21V8FxJO5mxetTQosuWG
 VbnIWdrdIUVfUHZnZlCzYBMcw7d3Z3kQDHwJo4ICK/zBOJkyQ8X49ZwLamu81RyfoinK
 TFW9HtJbiPiFd5d/VpY2AQEMYYPRLMTPDZqfyctReOWLndCJxiSb2X1iSHA+LPhwJl81
 WnfA==
X-Gm-Message-State: ABy/qLZiz+Gz7346YIYAy0GmCp4Z2b3GZsj7SkR8Gt/GtgvvhGLHqxXA
 yzgccW9CVXp7mQeSRxXbaKzHzQ==
X-Google-Smtp-Source: APBJJlGAZ9rak/oL5Iz0pWx+xIf+r+efjcI9Mj+vqpbMKBZFyG34mvxSZloyT0NRwGp4SpeFIhSmOA==
X-Received: by 2002:a05:6512:220e:b0:4f8:442c:de25 with SMTP id
 h14-20020a056512220e00b004f8442cde25mr3033179lfu.5.1688689453964; 
 Thu, 06 Jul 2023 17:24:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b12-20020ac247ec000000b004fa52552c82sm452171lfp.155.2023.07.06.17.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 17:24:13 -0700 (PDT)
Message-ID: <0493c891-9cde-8284-a988-b6e95135db85@linaro.org>
Date: Fri, 7 Jul 2023 03:24:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 6/6] drm/msm/dpu: Update dev core dump to dump
 registers of sub-blocks
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
 <20230622-devcoredump_patch-v4-6-e304ddbe9648@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v4-6-e304ddbe9648@quicinc.com>
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

On 06/07/2023 23:48, Ryan McCann wrote:
> Currently, the device core dump mechanism does not dump registers of
> sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
> dpu_kms_mdp_snapshot function to account for sub-blocks.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 66 ++++++++++++++++++++++++++++++---
>   1 file changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 70dbb1204e6c..afc45d597d65 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -903,25 +903,58 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   					    cat->ctl[i].base, cat->ctl[i].name);
>   
>   	/* dump DSPP sub-blocks HW regs info */
> -	for (i = 0; i < cat->dspp_count; i++)
> +	for (i = 0; i < cat->dspp_count; i++) {
>   		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, dpu_kms->mmio +
>   					    cat->dspp[i].base, cat->dspp[i].name);
>   
> +		if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->dspp[i].sblk->pcc.len,
> +						    dpu_kms->mmio + cat->dspp[i].base +
> +						    cat->dspp[i].sblk->pcc.base, "%s_%s",

This might look simpler in the following form. Could you please consider it?


void *base =  dpu_kms + cat->dspp[i].base;

msm_disp_snapshot_add_block(..., base, cat->dspp[i].name)

if (!cat->dspp[i].sblk)
     continue;

if (cat->dspp[i].sblk->pcc.len)
     msm_disp_snapshot_add_block(..., base + 
cat->dspp[i].sblk->pcc.base, ...);

> +						    cat->dspp[i].name,
> +						    cat->dspp[i].sblk->pcc.name);
> +	}
> +
>   	/* dump INTF sub-blocks HW regs info */
>   	for (i = 0; i < cat->intf_count; i++)
>   		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, dpu_kms->mmio +
>   					    cat->intf[i].base, cat->intf[i].name);
>   
>   	/* dump PP sub-blocks HW regs info */
> -	for (i = 0; i < cat->pingpong_count; i++)
> +	for (i = 0; i < cat->pingpong_count; i++) {
>   		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, dpu_kms->mmio +
>   					    cat->pingpong[i].base, cat->pingpong[i].name);
>   
> +		/* TE2 block has length of 0, so will not print it */
> +
> +		if (cat->pingpong[i].sblk && cat->pingpong[i].sblk->dither.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].sblk->dither.len,
> +						    dpu_kms->mmio + cat->pingpong[i].base +
> +						    cat->pingpong[i].sblk->dither.base, "%s_%s",
> +						    cat->pingpong[i].name,
> +						    cat->pingpong[i].sblk->dither.name);
> +	}
> +
>   	/* dump SSPP sub-blocks HW regs info */
> -	for (i = 0; i < cat->sspp_count; i++)
> +	for (i = 0; i < cat->sspp_count; i++) {
>   		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, dpu_kms->mmio +
>   					    cat->sspp[i].base, cat->sspp[i].name);
>   
> +		if (cat->sspp[i].sblk && cat->sspp[i].sblk->scaler_blk.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->scaler_blk.len,
> +						    dpu_kms->mmio + cat->sspp[i].base +
> +						    cat->sspp[i].sblk->scaler_blk.base, "%s_%s",
> +						    cat->sspp[i].name,
> +						    cat->sspp[i].sblk->scaler_blk.name);
> +
> +		if (cat->sspp[i].sblk && cat->sspp[i].sblk->csc_blk.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->csc_blk.len,
> +						    dpu_kms->mmio + cat->sspp[i].base +
> +						    cat->sspp[i].sblk->csc_blk.base, "%s_%s",
> +						    cat->sspp[i].name,
> +						    cat->sspp[i].sblk->csc_blk.name);
> +	}
> +
>   	/* dump LM sub-blocks HW regs info */
>   	for (i = 0; i < cat->mixer_count; i++)
>   		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len, dpu_kms->mmio +
> @@ -943,9 +976,30 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   	}
>   
>   	/* dump DSC sub-blocks HW regs info */
> -	for (i = 0; i < cat->dsc_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, dpu_kms->mmio +
> -					    cat->dsc[i].base, cat->dsc[i].name);
> +	for (i = 0; i < cat->dsc_count; i++) {
> +		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
> +			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
> +			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
> +
> +			/* For now, pass in a length of 0 because the DSC_BLK register space
> +			 * overlaps with the sblks' register space.
> +			 *
> +			 * TODO: Pass in a length of 0 to DSC_BLK_1_2 in the HW catalog where
> +			 * applicable.

Please assume that https://patchwork.freedesktop.org/series/119776/ and 
rebase your code on top of it.

> +			 */
> +			msm_disp_snapshot_add_block(disp_state, 0, dpu_kms->mmio +
> +						    cat->dsc[i].base, cat->dsc[i].name);
> +			msm_disp_snapshot_add_block(disp_state, enc.len, dpu_kms->mmio +
> +						    cat->dsc[i].base + enc.base, "%s_%s",
> +						    cat->dsc[i].name, enc.name);
> +			msm_disp_snapshot_add_block(disp_state, ctl.len, dpu_kms->mmio +
> +						    cat->dsc[i].base + ctl.base, "%s_%s",
> +						    cat->dsc[i].name, ctl.name);
> +		} else {
> +			msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, dpu_kms->mmio +
> +						    cat->dsc[i].base, cat->dsc[i].name);
> +		}
> +	}
>   
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
> 

-- 
With best wishes
Dmitry

