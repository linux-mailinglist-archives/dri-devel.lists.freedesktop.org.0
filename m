Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3E6FEAFA
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 06:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F3D10E59C;
	Thu, 11 May 2023 04:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0F510E599
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 04:56:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac8091351eso86466941fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683780979; x=1686372979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dRZd1tzoqAuaTW1SRnh5iUU0gXAD+I9pDiA72mx7Uts=;
 b=bvkuTe8YMsf2GpcQhl1jYYEp402pQga9ziDhYk2PptNdi9NgAFTzxposzpmGCzerc1
 XV13uDAPViVwhcNNFY/A6F/RtwjYNTfolTqlhTe714pU/fm5nO6GnTaAp7jOmablOOp+
 kItkXy31l5fJ5nQEu8zSwMQFI5+dxJHqB83yt4q4hLSUZdVPKvTXKSofQpQrVpKYvZK/
 lSCxhGJ1KaJyR1X0ZcPc+FP//WN0Y0WE0V3M96AklA+YWeqcOgRbWusf3BVdcPDD2Oac
 gI68v5yfjYYJYbvUV2+p+4vpMwSt5B27I3jDVrB2z+wVysVrpegHk+6N/lvttxaxtyj7
 bRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683780979; x=1686372979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dRZd1tzoqAuaTW1SRnh5iUU0gXAD+I9pDiA72mx7Uts=;
 b=jTRXps5NSntR9PiLnDVd5V6o1YQngQuh3DmPJ5JQNjbPYrtjE8a2z8Bq7fW3YgLjDu
 NPxsVVnKx60lE9xIITz+Io50hu8cnhcdj1EKmsnTbaAvtum3qlo+c2rCVzBoy4e2i4pQ
 qcTrs26XxXMR0v4rGGOqBrOLPPmk23A7s4DL6kwdWe2TuBFesbKlKpFSKbY2wpaaIvtO
 WZszQNKMa3nR+dZaO7ZZoDtmHefN9W0UGo4kF+t/9eYh6dUtCAJ8irhHe/sjOU6c3wWF
 dyqx8YQCWr9ZhUZHzGFEkjzjn9urNbuLqc1DacGIsOVHRrCNJ0mviyipeeBoomKZLJsg
 FO+g==
X-Gm-Message-State: AC+VfDy+kHmBS6//kd7J+TVb3eK2xYpp8nIyARVe7/twcI+VyyS6JlHd
 V9kwNnWzMCVdYZE8dMlG+9d+SA==
X-Google-Smtp-Source: ACHHUZ5XSyPymYTbS8Q0ywcE04vGdMXp5zAz0HjtrZfQSlXRTdozqyAsBMH1kXLKMkWFy+dpTaDqJA==
X-Received: by 2002:a2e:8916:0:b0:29b:80b4:7bf7 with SMTP id
 d22-20020a2e8916000000b0029b80b47bf7mr2763950lji.41.1683780978848; 
 Wed, 10 May 2023 21:56:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a2eb603000000b002a8c1462ecbsm2244685ljn.137.2023.05.10.21.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:56:18 -0700 (PDT)
Message-ID: <ea0d696f-7987-0b05-6710-0668e4e3a43b@linaro.org>
Date: Thu, 11 May 2023 07:56:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 8/8] drm/msm/dpu: tear down DSC data path when DSC
 disabled
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-9-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-9-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> Unset DSC_ACTIVE bit at dpu_hw_ctl_reset_intf_cfg_v1(),
> dpu_encoder_unprep_dsc() and dpu_encoder_dsc_pipe_clr() functions
> to tear down DSC data path if DSC data path was setup previous.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  7 +++++
>   2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 94b805b..6500589 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1214,6 +1214,45 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> +static void dpu_encoder_dsc_pipe_clr(struct dpu_encoder_virt *dpu_enc,
> +                                     struct dpu_hw_dsc *hw_dsc,
> +                                     struct dpu_hw_pingpong *hw_pp)
> +{
> +	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
> +	struct dpu_hw_ctl *ctl;
> +
> +	ctl = cur_master->hw_ctl;
> +
> +	if (hw_dsc->ops.dsc_disable)
> +		hw_dsc->ops.dsc_disable(hw_dsc);
> +
> +	if (hw_pp->ops.disable_dsc)
> +		hw_pp->ops.disable_dsc(hw_pp);
> +
> +	if (hw_dsc->ops.dsc_bind_pingpong_blk)
> +		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, PINGPONG_NONE);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> +}
> +
> +static void dpu_encoder_unprep_dsc(struct dpu_encoder_virt *dpu_enc)
> +{
> +	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	int i;
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		hw_pp[i] = dpu_enc->hw_pp[i];
> +		hw_dsc[i] = dpu_enc->hw_dsc[i];
> +
> +		if (hw_pp[i] && hw_dsc[i])
> +			dpu_encoder_dsc_pipe_clr(dpu_enc, hw_dsc[i], hw_pp[i]);
> +	}
> +
> +}
> +
>   static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>   					struct drm_atomic_state *state)
>   {
> @@ -2090,6 +2129,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   					phys_enc->hw_pp->merge_3d->idx);
>   	}
>   
> +	if (dpu_enc->dsc)
> +		dpu_encoder_unprep_dsc(dpu_enc);
> +
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>   
> @@ -2101,6 +2143,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   	if (phys_enc->hw_pp->merge_3d)
>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>   
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> +
>   	if (ctl->ops.reset_intf_cfg)
>   		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 832a6a7..b34dac5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -577,6 +577,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	u32 intf_active = 0;
>   	u32 wb_active = 0;
>   	u32 merge3d_active = 0;
> +	u32 dsc_active;
>   
>   	/*
>   	 * This API resets each portion of the CTL path namely,
> @@ -606,6 +607,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   		wb_active &= ~BIT(cfg->wb - WB_0);
>   		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>   	}
> +
> +	if (cfg->dsc) {
> +		dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
> +		dsc_active &= ~cfg->dsc;
> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> +	}
>   }
>   
>   static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,

-- 
With best wishes
Dmitry

