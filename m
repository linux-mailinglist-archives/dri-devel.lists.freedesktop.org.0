Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697AC62643D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C893810E074;
	Fri, 11 Nov 2022 22:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A776A10E074
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 22:11:24 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l8so5921910ljh.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lr/qaRH4q95/e5Icbd0qeNc/ho2LiwjTqmhsXQ1TWlA=;
 b=BOvgcdm8m3gqPfgZKGTO/mZyX1zTJyyGT1pDgt2iUNkblObO5lMusRl64Jl5lP21A3
 dQqBkOMU56MWloyrzViwbRU7lkP3X5iXreKPdpur15kCHzleGtrSNlXN1dUzbg2zK7Jx
 EnIahTmMbU53YODTDUJCfzQ9emUiHulZ1Cod8DUNRZItj5D/UjjZw1SnktB5JEdAkLVv
 mxji2QBcltp7UI/mi6w23k3v/EFbp9llCh8xZUYBelO0plNGPinAGxIsh9ptErQ9PFDS
 4B48i8croDSNX6s80xeHw/K3e8QI4SVEjvB6CQK/cu6/YhH+gtlGkZbpqLctd3KpXtLa
 W+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lr/qaRH4q95/e5Icbd0qeNc/ho2LiwjTqmhsXQ1TWlA=;
 b=DCjyvpRUM6uQi717wbFuGqny25GEa2BqDaqABfrEiMiHttvYYNt32N+HrGQiuTJeKs
 XraD8o4R/RirtfTeOV1ULbVjaEERRCPg2JRT5loQDKE5dbvbjTi9KJGC2iDwPRruMOcS
 nJ9NcP24sybi027YqtygXqyZftbG40m5hMApgWFo90YrEzkzV/3SoJe+YjqkJ9tdU9Vm
 sLjVWi8+3i3RQVxI4JhmYlHIiGUFIUGQOBfRu40IL2Kic32QuSPWdWPhShuC775U3dD1
 S5xIup3R7fSsqt3M8N9RsJgKOJelsOyQoaljlfAriV0V+Mqek1Cfm083D8NpGJ/X0BKj
 5z1g==
X-Gm-Message-State: ANoB5pkXwbdyIMMfi3VKyaCmb+HbB4B8EeT4PDdUDsjE5ldTv0O2AHQ/
 S8L+U7k0FWmbtsA7MzaR464IMw==
X-Google-Smtp-Source: AA0mqf40xK5ipaT/frimMXzgRq9eBGEF7J24bMyT2AhqQG/WvWIvy+J1hlr5nmJYXhB228AGrx3bYQ==
X-Received: by 2002:a2e:94d0:0:b0:26d:a666:6358 with SMTP id
 r16-20020a2e94d0000000b0026da6666358mr1176621ljh.148.1668204682534; 
 Fri, 11 Nov 2022 14:11:22 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q13-20020ac246ed000000b004b40f2e25d3sm530368lfo.122.2022.11.11.14.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 14:11:22 -0800 (PST)
Message-ID: <1a1a91fa-fb1d-34e1-1b10-a01b9446f30a@linaro.org>
Date: Sat, 12 Nov 2022 01:11:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [v9] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1668174927-10603-1-git-send-email-quic_kalyant@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668174927-10603-1-git-send-email-quic_kalyant@quicinc.com>
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

On 11/11/2022 16:55, Kalyan Thota wrote:
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
> Changes in v9:
> - use DSPP enum while accessing flush mask to make it readable (Dmitry)
> - Few nits (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 64 +++++++++++++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  5 +-
>   5 files changed, 65 insertions(+), 15 deletions(-)
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
> index 38aa38a..126ee37 100644
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
> @@ -191,6 +193,7 @@ enum {
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
>    * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
>    * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> + * @DPU_CTL_DSPP_BLOCK_FLUSH  CTL config to support dspp sub-block flush
>    * @DPU_CTL_MAX
>    */
>   enum {
> @@ -198,6 +201,7 @@ enum {
>   	DPU_CTL_ACTIVE_CFG,
>   	DPU_CTL_FETCH_ACTIVE,
>   	DPU_CTL_VM_CFG,
> +	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>   	DPU_CTL_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6..0ee8220 100644
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

Whitespace changes should go to a separate patch. And I'd prefer to have 
extra whitespaces removed, not added.

Other than that LGTM now.

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
> @@ -113,6 +114,9 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>   	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>   				     dpu_hw_ctl_get_flush_register(ctx));
>   	ctx->pending_flush_mask = 0x0;
> +
> +	memset(ctx->pending_dspp_flush_mask, 0,
> +		sizeof(ctx->pending_dspp_flush_mask));
>   }
>   
>   static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
> @@ -130,6 +134,8 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   
>   static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> +	int dspp;
> +
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>   				ctx->pending_merge_3d_flush_mask);
> @@ -140,6 +146,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>   				ctx->pending_wb_flush_mask);
>   
> +	for(dspp = DSPP_0; dspp < DSPP_MAX; dspp++)
> +		if (ctx->pending_dspp_flush_mask[dspp - DSPP_0])
> +			DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp - DSPP_0),
> +				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
> +
>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>   }
>   
> @@ -287,8 +298,9 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
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
> @@ -307,6 +319,30 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
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
> @@ -675,7 +711,11 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
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
> index 96c012e..78611a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -152,9 +152,11 @@ struct dpu_hw_ctl_ops {
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

