Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076C75081A1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EBF10E134;
	Wed, 20 Apr 2022 07:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D9310F123
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:02:21 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f5so807115ljp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0mT7GiiXOFy4P/MRHv9AyxW+W/WNPo8vEkwShDCGSc0=;
 b=BYzDgMwSlAT8dOki/hv4RHni9joC966N7hhJfvkyXcrQzpQuSLGrxbJYeMUMJP6jHV
 YnlHpDpMAMzVraBa4hpy2K1DFrdDOeDgHfEpIJ6hLPiKVmsBd1Oogm6zgw91f4zizP6U
 cefGJxTj7GxeJH7LaS0KFA4PAt9vLNr3CF6KYgmZtHYcJSoiyVvoIlM0FW/uumm25eW4
 VIf89JKjR54a0U5liK/reRrVD9BIJBEKfYzvda5Wqh7DaUvD/hbiSXRHo558bHxtiHYO
 enIwZjjSsuhVAmqhJVELrPxCpMSWqjFFqh1ISo5Ass5oPzMJiW4KWRld2X7xLAaWRWq9
 CZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0mT7GiiXOFy4P/MRHv9AyxW+W/WNPo8vEkwShDCGSc0=;
 b=CQxGC8IDV2N2hCmlrne/pW1eVPxedNvVpIBmovc6IoAPyezBgtlmFxJ6sKD/RQB0W8
 M+J0TMihko3XUzFdyf1iU0IEtNR6lZ5eQ6YcoZxn/QwdWte6MjWABgIPxFUmfQqYaAcu
 xLZVpRNatfyHsHGAHeXtikVyj5pYd2gPlc5pEd0+4jShKl++PMZmK/FZmE1zJDTvIEir
 jGG0to4Bz0mEBndd0ufCUqUNlQ2Etj8aMk5dIU8zlPUpFix322s8E1X/wBZWOnIMVt2X
 0ifGCNHH3DbS8cfLgWbcDxrgS9NPJjZqaoJKxvx0utp3bTh1ghObScZSAL21N4L4dzPQ
 r4Ew==
X-Gm-Message-State: AOAM532VYDccyVzXpeI1z+IyVoWBo+DqzEa9w1jp5Aw5l+WGQuEPfqGJ
 5KYWOAEArGExoTTIeGKfHNX/UQ==
X-Google-Smtp-Source: ABdhPJxIPphP3PfBEDhTjWSNL/6Gexlc8wQax4TMwHINIyPLXFVQrQJIojlB9N9IKtLPfmijObVQTw==
X-Received: by 2002:a2e:8245:0:b0:24b:48b1:a1ab with SMTP id
 j5-20020a2e8245000000b0024b48b1a1abmr12011185ljh.152.1650438139899; 
 Wed, 20 Apr 2022 00:02:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a19e010000000b0046bb663f05csm1739031lfg.99.2022.04.20.00.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:02:19 -0700 (PDT)
Message-ID: <4bc6aa77-ae20-e07c-39ce-e0b45606b9dd@linaro.org>
Date: Wed, 20 Apr 2022 10:02:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 05/17] drm/msm/dpu: add reset_intf_cfg operation for
 dpu_hw_ctl
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-6-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-6-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 04:45, Abhinav Kumar wrote:
> Add a reset_intf_cfg operation for dpu_hw_ctl to reset the
> entire CTL path by disabling each component namely layer mixer,
> 3d-merge and interface blocks.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 32 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  8 ++++++++
>   2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index dc27579..524f024 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -563,6 +563,37 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>   	DPU_REG_WRITE(c, CTL_TOP, intf_cfg);
>   }
>   
> +static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> +		struct dpu_hw_intf_cfg *cfg)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	u32 intf_active = 0;
> +	u32 merge3d_active = 0;
> +
> +	/*
> +	 * This API resets each portion of the CTL path namely,
> +	 * clearing the sspps staged on the lm, merge_3d block,
> +	 * interfaces etc to ensure clean teardown of the pipeline.
> +	 * This will be used for writeback to begin with to have a
> +	 * proper teardown of the writeback session but upon further
> +	 * validation, this can be extended to all interfaces.
> +	 */
> +	if (cfg->merge_3d) {
> +		merge3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
> +		merge3d_active &= ~BIT(cfg->merge_3d - MERGE_3D_0);
> +		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> +				merge3d_active);
> +	}
> +
> +	dpu_hw_ctl_clear_all_blendstages(ctx);
> +
> +	if (cfg->intf) {
> +		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
> +		intf_active &= ~BIT(cfg->intf - INTF_0);
> +		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
> +	}
> +}
> +
>   static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
>   	unsigned long *fetch_active)
>   {
> @@ -586,6 +617,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
>   		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
>   		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> +		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
>   		ops->update_pending_flush_intf =
>   			dpu_hw_ctl_update_pending_flush_intf_v1;
>   		ops->update_pending_flush_merge_3d =
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 97f326d..c61a8fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -140,6 +140,14 @@ struct dpu_hw_ctl_ops {
>   	void (*setup_intf_cfg)(struct dpu_hw_ctl *ctx,
>   		struct dpu_hw_intf_cfg *cfg);
>   
> +	/**
> +	 * reset ctl_path interface config
> +	 * @ctx    : ctl path ctx pointer
> +	 * @cfg    : interface config structure pointer
> +	 */
> +	void (*reset_intf_cfg)(struct dpu_hw_ctl *ctx,
> +			struct dpu_hw_intf_cfg *cfg);
> +
>   	int (*reset)(struct dpu_hw_ctl *c);
>   
>   	/*


-- 
With best wishes
Dmitry
