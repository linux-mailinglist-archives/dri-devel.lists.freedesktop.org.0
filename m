Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABCE394108
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786046EB93;
	Fri, 28 May 2021 10:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68666EB93
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 10:36:27 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id w15so4616202ljo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RR9aCa9Fk1AeEQeB1a7U6H9kC0xMAO6dnDCAHEDi0SI=;
 b=yiMz6B5SYuvBzuFIME7sP9Bn3VZo6YFTVXBW3XSARrbiEm4DrxokDFdhzmi5vN1qOy
 KyyNTVuiLDyvbxeNu2fm7Q6usGpuDBxa1L+mlevW0FH6wkl5dZhoGRDZyKqZG/6hYJnu
 VQxfieqB8G8hXaLWKW1lWrVZ9EFkulgjvjECS1o7jSi2RCiDPizIws+xTP4Epx9hu1DH
 03c+l3fnGQqs8ONy5FwymjXM72hACeZvzPvJw+Cuoo5uEbiPpVDE6J4i4KeCAfK6BRDy
 sbJsMkyWOwL19AAt6+NDCDiAwSAJ4pp3DIXnge7rtjO8nlGsZ5hiWI4Hg5Q+IZ+oTQGZ
 OQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RR9aCa9Fk1AeEQeB1a7U6H9kC0xMAO6dnDCAHEDi0SI=;
 b=rLZJsxSUs0gCe9E1pLapVSAfVp6fmK0Ky7+nAAwkEdzXUZfLbLxi2s4hgm60k/HlAD
 1tVjWUIUvqZO6oQ2k+h/S7bYeeJ7mHE6YsL4EuDYKdErwRJgFVJYPTKYTTOHurnqJI38
 SPj0wTwY3purXMtL+TUlfnSUJetPiZivJXUcDHthTNUCXWsBwy9wENxEZP7s/8VjKRGf
 Cakz2IuP5LFeC55KBMPhBN6XMcYhff8lptpoV19pZu5LVYkHSuR5pM7n0IF3Iwwu9AuR
 3yuSjPi1wdAIftVhJ9MEh3l0QBCz0vkPHDFdtXfHOZdA19v3yxA2HXLwTkBjJCin7GKa
 s2mg==
X-Gm-Message-State: AOAM531PTTFRibloWIvv912Kq3lSrpOyRYl7c5ncCty2kUm6IQQ65fQR
 pnsniFhLVvm67EU9rv2MYIk8Gw==
X-Google-Smtp-Source: ABdhPJzBHl9y7Py40EKPhM3j6vdNArq5eiVI3abzPIby43QpcRZeOCJsS5VukeIzJneEkb5ITPC8Ig==
X-Received: by 2002:a05:651c:1a7:: with SMTP id
 c7mr5917480ljn.77.1622198186160; 
 Fri, 28 May 2021 03:36:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v138sm440261lfa.224.2021.05.28.03.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 03:36:25 -0700 (PDT)
Subject: Re: [RFC PATCH 09/13] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-13-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <32463a8c-3baa-cc88-6e55-f65bc2d92608@linaro.org>
Date: Fri, 28 May 2021 13:36:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-13-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2021 15:49, Vinod Koul wrote:
> We cannot enable mode_3d when we are using the DSC. So pass
> configuration to detect DSC is enabled and not enable mode_3d
> when we are using DSC
> 
> We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
> enabled and pass this to .setup_intf_cfg()
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  5 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>   4 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index ecbc4be98980..d43b804528eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -336,6 +336,17 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   	return BLEND_3D_NONE;
>   }
>   
> +static inline bool dpu_encoder_helper_get_dsc_mode(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct drm_encoder *drm_enc = phys_enc->parent;
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +
> +	if (priv->dsc)
> +		return true;
> +
> +	return false;
> +}
> +
>   /**
>    * dpu_encoder_helper_split_config - split display configuration helper function
>    *	This helper function may be used by physical encoders to configure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b2be39b9144e..5fe87881c30c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -69,6 +69,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>   	intf_cfg.stream_sel = cmd_enc->stream_sel;
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc_mode(phys_enc);
> +
>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index aeea6add61ee..f059416311ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -121,7 +121,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   	return ctx->pending_flush_mask;
>   }
>   
> -static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> +static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
>   	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | BIT(3));
>   
> @@ -522,7 +522,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>   
>   	intf_cfg |= (cfg->intf & 0xF) << 4;
>   
> -	if (cfg->mode_3d) {
> +	/* In DSC we can't set merge, so check for dsc too */
> +	if (cfg->mode_3d && !cfg->dsc) {

I think we should catch this earlier (in atomic_check?), so that we 
won't enable modes that would require merge_3d with DSC enabled (until 
we support DSC merge?)

>   		intf_cfg |= BIT(19);
>   		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 806c171e5df2..347a653c1e01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>    * @mode_3d:               3d mux configuration
>    * @merge_3d:              3d merge block used
>    * @intf_mode_sel:         Interface mode, cmd / vid
> + * @dsc:                   DSC is enabled
>    * @stream_sel:            Stream selection for multi-stream interfaces
>    */
>   struct dpu_hw_intf_cfg {
> @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
>   	enum dpu_3d_blend_mode mode_3d;
>   	enum dpu_merge_3d merge_3d;
>   	enum dpu_ctl_mode_sel intf_mode_sel;
> +	bool dsc;
>   	int stream_sel;
>   };
>   
> 


-- 
With best wishes
Dmitry
