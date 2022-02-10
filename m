Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C314B0B7B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518E110E7FA;
	Thu, 10 Feb 2022 10:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A3C10E7FA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:55:32 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h8so6416917lfj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 02:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gAbvkkOMr7PxpULPtXuB0NxD4mTH8ipHNDayBfqdakY=;
 b=KurLFWxVHDrlTwpwvUuZQ1Mh5fqIYbgqlEzuomiNqwTvgqpguB4OTtOqbR8bs86gRg
 vD2Q0Ir7QyYtRQjV4HymrwX1TKUb3zrQpocNjaNbb3lAxjli8wee0ZozTwg4aKvvjPFL
 Y/G/SPrvNs88DXKiKIDeBYJhsaDlTeQz5Tg9yF9Mukp8TvNbbB7EtOv6KoUNl9y335pb
 AWTvG931NnBR/PrLaEkFKCwPPbrYZ+/6WC590Jfm8xgHBqVUr1OrpjMGqmQpql7eOP6s
 tNRg9yNPzp9ow7/NAy8kYN76F6hsXQPodez1XUSQZYH1lI8UC2Wjn/Ioo/YNZcn8iI5e
 gKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gAbvkkOMr7PxpULPtXuB0NxD4mTH8ipHNDayBfqdakY=;
 b=pAI2jhDo7AmpbvxnpAQBGWd74SOBPS2e9HOt4NrA7CZWM+C6EuqHvXNIAOaaRuxChW
 PDq90FKN8+fAT6foBwDZgm0fUrLQlYXyI7EoNN3LNdE1YZ8aDb666cmwG/NhC7JZWtmc
 sHHa5jySJl1iai4W/LUqXARDLM0y6jL/99gkZHBBqb5DUgSHtAWpuBsdM0vrXIZJQLEQ
 AnPay/Ppt1Fr3sVVWJt3prl3omiAvu6Vv54RnzBFT7TC5E4fPRXwDIZTqkORbb1plLwP
 XoJp60wAJ68vC2wr6nGmJi+Qsr6QZkGlBSLtPs0ahkl1f9Nj0qqz931VBhmvhvYZ8ZNe
 JXxg==
X-Gm-Message-State: AOAM5303PYD9V6DH6JzWZZb5f570kUqqgnODfRhlkOUGA8aqb+FMWkAV
 H6sE4ICzW/K7T2VVVeahV0sRXA==
X-Google-Smtp-Source: ABdhPJwwSMqQiT+3qMl2wffuwYEg7FwRpyq6E9ToujIF0jMlsoGmBMJxIdnAVQKe0fK/8rkVJd5dRw==
X-Received: by 2002:ac2:598e:: with SMTP id w14mr4783080lfn.218.1644490530615; 
 Thu, 10 Feb 2022 02:55:30 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d38sm2218378lfv.8.2022.02.10.02.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 02:55:30 -0800 (PST)
Message-ID: <3035968b-8323-5380-afe3-4ddcc1ca65c4@linaro.org>
Date: Thu, 10 Feb 2022 13:55:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [REPOST PATCH v4 08/13] drm/msm/disp/dpu1: Don't use DSC with
 mode_3d
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-9-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-9-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2022 13:34, Vinod Koul wrote:
> We cannot enable mode_3d when we are using the DSC. So pass
> configuration to detect DSC is enabled and not enable mode_3d
> when we are using DSC
> 
> We add a helper dpu_encoder_helper_get_dsc() to detect dsc
> enabled and pass this to .setup_intf_cfg()
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

You seem to insist on this.
Ok, lets agree that you did not test any other topologies and let 
anybody adding support for SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC handle this.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           | 7 ++++++-
>   3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 34a6940d12c5..ed37a4c21596 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -70,6 +70,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>   	intf_cfg.stream_sel = cmd_enc->stream_sel;
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> +	if (intf_cfg.dsc)
> +		intf_cfg.mode_3d = 0;
> +
>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..218009855fca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -284,6 +284,10 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> +	if (intf_cfg.dsc)
> +		intf_cfg.mode_3d = 0;
> +
>   	if (phys_enc->hw_pp->merge_3d)
>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 49659165cea8..6d5268b7da90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -536,7 +536,12 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>   
>   	intf_cfg |= (cfg->intf & 0xF) << 4;
>   
> -	if (cfg->mode_3d) {
> +	/* In DSC we can't set merge, so check for dsc and complain */
> +	if (cfg->mode_3d && cfg->dsc)
> +		pr_err("DPU1: DSC and Merge 3D both are set!! it may not work\n");
> +
> +	/* set merge only when dsc is not set */
> +	if (cfg->mode_3d && !cfg->dsc) {
>   		intf_cfg |= BIT(19);
>   		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>   	}


-- 
With best wishes
Dmitry
