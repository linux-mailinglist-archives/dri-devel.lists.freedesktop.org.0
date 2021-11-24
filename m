Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A600845C90E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E503E6E4C4;
	Wed, 24 Nov 2021 15:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DCC6E7EF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:43:22 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id e11so6264411ljo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 07:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ex6OYz5OcfnL7+IqwC8qcwWv2MWWHoNUmpLVkb145g0=;
 b=fQPOXf5npXO38RY4YdQwoy3+h1mMRcKn9fkTOvRG3EzKhWmYSZenngCNYBundlyv+8
 zRvjmqGy74pTJejq6wW0QdTP37pZ1qd8aCHKPSkDBFNAfo7ift66We7srJHpQvP3e/XI
 TBe6iIt/VooOnTGM4zuCvCzZbmBv6Akt4Vo8D5GaEswwBZ4IX81N22ko2eY1XgGKl6Cv
 qswhEyrh936gq1FxTor8owTOlkCrlq/yRrIpGcZR2ndqtSpsXbonBHoby3H0w5NTxcYc
 rrGz43z8w1ajjX4544K/cHJsqJ1BZNIH7MWi9WB7R8ZRBxrthWQYKgYydE3jopeu7qyI
 VBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ex6OYz5OcfnL7+IqwC8qcwWv2MWWHoNUmpLVkb145g0=;
 b=4xGI3PZ5tWbXyY32WqENXzXK1XEbRPmBa5/6idIWAJK3WUJIA6UZBN9t6wT/QAbBpd
 YzNepVyykOMogCqllW0LXyDp8Rvx8FQJ9abdD0okDmqe0aMEZeB+zCs4FtjPIY1YDg1z
 4IJji8SNoYQEWgUgsXDymikCNgi3yxHT7sdrEyLejN6r0ME0rULgc40IppxQyo6IG2Zc
 qc76YjY2+g6cAEuaT7/IoFms8ZvA7OsT8Vf3mQozP9o7JOQb6uCSsYYPgC60d0f7yyPg
 QRz3ncq8qPET7bMjaW69K7yhyVCozqU4Yz2DdkGDRhdBxj/YRiOvXBMuoydk6IXR0OvS
 B3Mw==
X-Gm-Message-State: AOAM530taoKRjsj5Sx7xUKJzOBS4pOi8Xw2n5/O0OTnfEs+lNXckqyTA
 SYLgYIVWrwfRutvzl0YO/RMDrQ==
X-Google-Smtp-Source: ABdhPJyRine8HQbXkjyMO+tpGm9oz/av529/TrB6QMx+HOSro1hU75Q1YTPf1Syl6TXwe2UIRX+VvQ==
X-Received: by 2002:a05:651c:504:: with SMTP id
 o4mr17394342ljp.242.1637768600043; 
 Wed, 24 Nov 2021 07:43:20 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g3sm19936ljj.37.2021.11.24.07.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 07:43:19 -0800 (PST)
Subject: Re: [PATCH v3 05/13] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-6-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <15006114-cef8-89e5-eb50-4c36fd11a293@linaro.org>
Date: Wed, 24 Nov 2021 18:43:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-6-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2021 09:22, Vinod Koul wrote:
> We cannot enable mode_3d when we are using the DSC. So pass
> configuration to detect DSC is enabled and not enable mode_3d
> when we are using DSC
> 
> We add a helper dpu_encoder_helper_get_dsc() to detect dsc
> enabled and pass this to .setup_intf_cfg()
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>   4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..efb85d595598 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -332,6 +332,17 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   	return BLEND_3D_NONE;
>   }
>   
> +static inline bool dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct drm_encoder *drm_enc = phys_enc->parent;
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +
> +	if (priv->dsc)
> +		return priv->dsc->dsc_mask;
> +
> +	return 0;
> +}
> +
>   /**
>    * dpu_encoder_helper_split_config - split display configuration helper function
>    *	This helper function may be used by physical encoders to configure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 34a6940d12c5..f3f00f4d0193 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -70,6 +70,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>   	intf_cfg.stream_sel = cmd_enc->stream_sel;
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> +

You are going to hate me for the comments on this patch. But this chunk 
should also go into dpu_encoder_phys_vid.c, shouldn't it?

>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 64740ddb983e..36831457a91b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -519,7 +519,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>   
>   	intf_cfg |= (cfg->intf & 0xF) << 4;
>   
> -	if (cfg->mode_3d) {
> +	/* In DSC we can't set merge, so check for dsc too */
> +	if (cfg->mode_3d && !cfg->dsc) {
>   		intf_cfg |= BIT(19);
>   		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 806c171e5df2..9847c9c46d6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
>    * @merge_3d:              3d merge block used
>    * @intf_mode_sel:         Interface mode, cmd / vid
>    * @stream_sel:            Stream selection for multi-stream interfaces
> + * @dsc:                   DSC BIT masks
>    */
>   struct dpu_hw_intf_cfg {
>   	enum dpu_intf intf;
> @@ -47,6 +48,7 @@ struct dpu_hw_intf_cfg {
>   	enum dpu_merge_3d merge_3d;
>   	enum dpu_ctl_mode_sel intf_mode_sel;
>   	int stream_sel;
> +	unsigned int dsc;
>   };
>   
>   /**
> 


-- 
With best wishes
Dmitry
