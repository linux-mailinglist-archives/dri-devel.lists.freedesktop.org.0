Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05813622BC5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F169710E0B0;
	Wed,  9 Nov 2022 12:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADA410E0B0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 12:40:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id d6so25426099lfs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 04:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NTbIVOkpTxDlpNF3rpTQmeBwd13hKYdqfNWi6t3DSeI=;
 b=nJtcfx0wes5l6LrF7xW4S2ddblHCf5amR9JBvltx0+HxLtcHKj1HLbekm3Rb7aoe+Y
 4ucxUA2tgtg55LsTOas/0g+QRj/Itp5vEan9sPM1OxXbZ6/OAg30q61BX8ba+lrtbNX3
 bMFCLjlQOXUV9Cs8VFTzxBOUTgR5pMcIrEOADCAj+jpaWfGuQo8Vk44MTVvLKsjoYWrQ
 ttzrlF8XIBuj+s9usRdQ/I5ZQUiaIj5mk+luynk2/c7+GtVeeY+mxO8TCmqL6ellXI+M
 4uWxlxhoNqyg2LTAfPEsQD8myrEzSXLnEnzwGVGVJQ6cFCMfAUFRy+SM7Xa8pkBEZkPg
 8tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NTbIVOkpTxDlpNF3rpTQmeBwd13hKYdqfNWi6t3DSeI=;
 b=qTh1oSZt2ebofP+GyHiAZcBN6z1LMmA/ArgNb4Qvt/Ifr7uxtzccgdpcE14PukQVeH
 kVcTCA3AzZLam8//ysyJaHLELPApLgejPJ64DBZIhlleS5E0Nr4I9v/wry5Zv7gzsIg8
 zXr7/865Md2pHYeWtZdrOM11XNMh9913mQpxmcBwyjz2QdfWUnzAqWZ4HRtmb3LlKMcR
 cM7i4jBdH86wwrByyPWud10ZiSKKUdJAhu9gGr1RHmWFgiWsBoqSkH/FN1YepQu3A6Zx
 lGJB6PZq9NH98CS9fXmevDMjscMxpUQQvS7xKIc/ARFfyy90AYa1UmtpeO+1nG9WO8xF
 yB2A==
X-Gm-Message-State: ACrzQf0bcYrC9xd8/z7svLWecX/ve6o2ETO0SBYhZe9vc1ZfjinKUQFa
 eys2h75YIuFSnKu0ZLVYEEmnXg==
X-Google-Smtp-Source: AMsMyM66jdbYB+aHf8vtfcUyQhi/0vbdpV/HPC+i8KuS+1MK3N8grevMLsa7JXPaCmnPGjYw0TFLDg==
X-Received: by 2002:a05:6512:168e:b0:4aa:cfa1:ee46 with SMTP id
 bu14-20020a056512168e00b004aacfa1ee46mr21156974lfb.197.1667997605430; 
 Wed, 09 Nov 2022 04:40:05 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a056512344a00b0049ade93ad24sm2198556lfr.156.2022.11.09.04.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:40:05 -0800 (PST)
Message-ID: <01e32ce9-8d6f-0bd1-fe12-b4ab575e8aa6@linaro.org>
Date: Wed, 9 Nov 2022 15:40:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [v8] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667996080-23870-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667996080-23870-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 15:14, Kalyan Thota wrote:
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
> 
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
> 
> This change adds necessary support for the above design.
> 
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
> 
> Changes in v2:
> - Move the address offset to flush macro (Dmitry)
> - Seperate ops for the sub block flush (Dmitry)
> 
> Changes in v3:
> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
> 
> Changes in v4:
> - Use shorter version for unsigned int (Stephen)
> 
> Changes in v5:
> - Spurious patch please ignore.
> 
> Changes in v6:
> - Add SOB tag (Doug, Dmitry)
> 
> Changes in v7:
> - Cache flush mask per dspp (Dmitry)
> - Few nits (Marijn)
> 
> Changes in v8:
> - Few nits (Marijn)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 66 +++++++++++++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  7 ++-
>   5 files changed, 72 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 601d687..4170fbe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>   
>   		/* stage config flush mask */
>   		ctl->ops.update_pending_flush_dspp(ctl,
> -			mixer[i].hw_dspp->idx);
> +			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029f..0eecb2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -65,7 +65,10 @@
>   	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>   
>   #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> +	(BIT(DPU_CTL_ACTIVE_CFG) | \
> +	 BIT(DPU_CTL_FETCH_ACTIVE) | \
> +	 BIT(DPU_CTL_VM_CFG) | \
> +	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>   
>   #define MERGE_3D_SM8150_MASK (0)
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38a..35f4810 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -161,10 +161,12 @@ enum {
>    * DSPP sub-blocks
>    * @DPU_DSPP_PCC             Panel color correction block
>    * @DPU_DSPP_GC              Gamma correction block
> + * @DPU_DSPP_IGC             Inverse gamma correction block
>    */
>   enum {
>   	DPU_DSPP_PCC = 0x1,
>   	DPU_DSPP_GC,
> +	DPU_DSPP_IGC,
>   	DPU_DSPP_MAX
>   };
>   
> @@ -188,16 +190,18 @@ enum {
>   
>   /**
>    * CTL sub-blocks
> - * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> - * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
> - * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> - * @DPU_CTL_MAX
> + * @DPU_CTL_SPLIT_DISPLAY     CTL supports video mode split display
> + * @DPU_CTL_FETCH_ACTIVE      Active CTL for fetch HW (SSPPs)
> + * @DPU_CTL_VM_CFG            CTL config to support multiple VMs
> + * @DPU_CTL_DSPP_BLOCK_FLUSH  CTL config to support dspp sub-block flush
> + * @DPU_CTL_MAX               Maximum value

No unnecessary whitespace changes please.

>    */
>   enum {
>   	DPU_CTL_SPLIT_DISPLAY = 0x1,
>   	DPU_CTL_ACTIVE_CFG,
>   	DPU_CTL_FETCH_ACTIVE,
>   	DPU_CTL_VM_CFG,
> +	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>   	DPU_CTL_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6..29821ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -28,22 +28,23 @@
>   #define   CTL_INTF_ACTIVE               0x0F4
>   #define   CTL_MERGE_3D_FLUSH            0x100
>   #define   CTL_DSC_ACTIVE                0x0E8
> -#define   CTL_DSC_FLUSH                0x104
> +#define   CTL_DSC_FLUSH                 0x104
>   #define   CTL_WB_FLUSH                  0x108
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> +#define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>   
> -#define CTL_MIXER_BORDER_OUT            BIT(24)
> -#define CTL_FLUSH_MASK_CTL              BIT(17)
> +#define   CTL_MIXER_BORDER_OUT          BIT(24)
> +#define   CTL_FLUSH_MASK_CTL            BIT(17)
>   
> -#define DPU_REG_RESET_TIMEOUT_US        2000
> -#define  MERGE_3D_IDX   23
> -#define  DSC_IDX        22
> -#define  INTF_IDX       31
> -#define WB_IDX          16
> -#define CTL_INVALID_BIT                 0xffff
> -#define CTL_DEFAULT_GROUP_ID		0xf
> +#define   DPU_REG_RESET_TIMEOUT_US      2000
> +#define   MERGE_3D_IDX                  23
> +#define   DSC_IDX                       22
> +#define   INTF_IDX                      31
> +#define   WB_IDX                        16
> +#define   CTL_INVALID_BIT               0xffff
> +#define   CTL_DEFAULT_GROUP_ID          0xf
>   
>   static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
>   	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
> @@ -110,9 +111,14 @@ static inline void dpu_hw_ctl_trigger_pending(struct dpu_hw_ctl *ctx)
>   
>   static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>   {
> +	int i;
> +
>   	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>   				     dpu_hw_ctl_get_flush_register(ctx));
>   	ctx->pending_flush_mask = 0x0;
> +
> +	for(i = 0; i < ARRAY_SIZE(ctx->pending_dspp_flush_mask); i++)
> +		ctx->pending_dspp_flush_mask[i] = 0x0;

memset(ctx->pending_dspp_flush_mask, 0, 
sizeof(ctx->pending_dspp_flush_mask)); ?

>   }
>   
>   static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
> @@ -130,6 +136,8 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   
>   static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> +	int i;
> +
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>   				ctx->pending_merge_3d_flush_mask);
> @@ -140,6 +148,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>   				ctx->pending_wb_flush_mask);
>   
> +	for(i = 0; i < ARRAY_SIZE(ctx->pending_dspp_flush_mask); i++)
> +		if (ctx->pending_dspp_flush_mask[i])
> +			DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(i),
> +				ctx->pending_dspp_flush_mask[i]);
> +

I'm somewhat biased towards:

for (dspp = DSPP_0; dspp < DSPP_MAX; dspp++)
   if (ctx->pending_dspp_flush_mask[dspp - DSPP_0]
        DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp),
                  ctx->pending_dspp_flush_mask[dspp]);

WDYT? Yes, you'd have to adjust CTL_DSPP_n_FLUSH to subtract DSPP_0 from 
the passed value.

>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>   }
>   
> @@ -287,8 +300,9 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>   }
>   
>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
> -	enum dpu_dspp dspp)
> +	enum dpu_dspp dspp, u32 dspp_sub_blk)
>   {
> +
>   	switch (dspp) {
>   	case DSPP_0:
>   		ctx->pending_flush_mask |= BIT(13);
> @@ -307,6 +321,30 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>   	}
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
> +	struct dpu_hw_ctl *ctx,	enum dpu_dspp dspp, u32 dspp_sub_blk)
> +{
> +
> +	if (dspp >= DSPP_MAX)
> +		return;
> +
> +	switch (dspp_sub_blk) {
> +	case DPU_DSPP_IGC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(2);
> +		break;
> +	case DPU_DSPP_PCC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
> +		break;
> +	case DPU_DSPP_GC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	ctx->pending_flush_mask |= BIT(29);
> +}
> +
>   static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> @@ -675,7 +713,11 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>   	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
>   	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> -	ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_subblocks;
> +	else
> +		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +
>   	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
>   		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 96c012e..ff4e92c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -148,13 +148,15 @@ struct dpu_hw_ctl_ops {
>   		enum dpu_lm blk);
>   
>   	/**
> -	 * OR in the given flushbits to the cached pending_flush_mask
> +	 * OR in the given flushbits to the cached pending_dspp_flush_mask

The existence of pending_dspp_flush is a detail. For earlier revisions 
there is no such mask. Thus I'd suggest leaving the comment intact.

>   	 * No effect on hardware
>   	 * @ctx       : ctl path ctx pointer
>   	 * @blk       : DSPP block index
> +	 * @dspp_sub_blk : DSPP sub-block index
>   	 */
>   	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
> -		enum dpu_dspp blk);
> +		enum dpu_dspp blk, u32 dspp_sub_blk);
> +
>   	/**
>   	 * Write the value of the pending_flush_mask to hardware
>   	 * @ctx       : ctl path ctx pointer
> @@ -242,6 +244,7 @@ struct dpu_hw_ctl {
>   	u32 pending_intf_flush_mask;
>   	u32 pending_wb_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
> +	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>   
>   	/* ops */
>   	struct dpu_hw_ctl_ops ops;

-- 
With best wishes
Dmitry

