Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FFD96680A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B8710EAB9;
	Fri, 30 Aug 2024 17:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NepVer76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EF510EAB9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:33:47 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53349d3071eso2768886e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725039225; x=1725644025; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FZovmunSahKLAoS+vXYOMOjVXjpqJMaKf0ge9u6vq/g=;
 b=NepVer76bad2gtV9YAVvPFY+YOWYVhPc//jfK+OY5IRw0o1+jboFMQ9vZK/xi+5Gj3
 /aYVm9pP3yr7vWc8paEqBZz7lrZcLGSgNW4DzqGQVpMqUvxvZbJpPCTWWczH7UbCBJ2R
 vS/4R8hBSNWC9aBobdl0oUi3VJU2zneAworSUsXVAaV6bpWGRokNEweHjTflCz05o6dy
 LRYdCjU4lryuP6qwG/8jF1W8i/XzmloTbKrNI7KT5qzfDsUM1krrmsNJ9S0YzzcAKUnT
 +nygow21dyF+ovNUvACv1pMUkYGyXjsIBgiOit3KW3ImfOm2QYeeZyjQufuErTWGlKz6
 Xq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725039225; x=1725644025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZovmunSahKLAoS+vXYOMOjVXjpqJMaKf0ge9u6vq/g=;
 b=t9t86GhfSkThNHJs86bPgWxs38VEIai167toy1WZpUskk4WgFAZYNSJhp4WMvPUw2W
 y7ZggvFm57xcycyqqH3/xcClXo5FrqQetbNted5dzlsbtyPeytB6oIr6YMUfH4Ch7u7y
 1iOE1OrBq0t3J0KrmrbrsZAijJe8IrRX08hP3u5gnEFAVnROcZX3OITqmptgh2l8kRS0
 9wRUaVXHjuOUBNaTYh9F8YGsAI+asjYnWBEz9iC7MeRVgrOuzBF+5360H7RMG4npJ+TX
 BsT1O3xIBGUk6GWh/nYo3YlXtbNiyMS8gKljD8NkwcSvUay6KRcr2uUP2/nAxHyfTKmP
 EONg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoE30oCyaoBuZPdBwL6oZ+SUr5FP0JfOMnqCf6u4ZXCFSavJOQmPMY3TLtbbx7fjPOjGjH9rNV6Ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzXVewAY41pDEf3w9Q32H34ZmYjKGKpU8sTu+iBkKR+EPv0AuS
 h7pXLGKrNPO4+8Db7YdRoG7kNZiNqh9Q6/EAfPfgbLB8zrLYWxtLwLeBBFjavQ8=
X-Google-Smtp-Source: AGHT+IFKju2ZfMc9w9jdIMtGL/qYj6Cz+l1WLEv32Uz+h2UqFKnaakxWIPJ6i5XbIKCOFyFGs2p3qg==
X-Received: by 2002:a05:6512:2393:b0:52c:e084:bb1e with SMTP id
 2adb3069b0e04-53546b04944mr2218053e87.13.1725039224564; 
 Fri, 30 Aug 2024 10:33:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079bcf7sm712538e87.34.2024.08.30.10.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:33:44 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:33:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 19/21] drm/msm/dpu: Skip trigger flush and start for CWB
Message-ID: <g6zlve4onws3ncg6l4j2b6tzpkgbp2qntublyw4oxhlvca4tmp@g6j7bsvewgtv>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-19-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-19-502b16ae2ebb@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 29, 2024 at 01:48:40PM GMT, Jessica Zhang wrote:
> For concurrent writeback, the real time encoder is responsible for
> trigger flush and trigger start. Return early for trigger start and
> trigger flush for the concurrent writeback encoders.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9d495a186eb8..47b5a5994234 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1493,6 +1493,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>  		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
>  {
>  	struct dpu_hw_ctl *ctl;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);

Please move one line up.

>  	int pending_kickoff_cnt;
>  	u32 ret = UINT_MAX;
>  
> @@ -1509,6 +1510,15 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>  
>  	pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
>  
> +	/* Return early if encoder is writeback and in clone mode */
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
> +			dpu_enc->cwb_mask) {

Alignment

> +		DPU_DEBUG("encoder %d skip flush for concurrent writeback encoder\n",
> +				DRMID(drm_enc));
> +		return;
> +	}
> +
> +
>  	if (extra_flush_bits && ctl->ops.update_pending_flush)
>  		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
>  
> @@ -1531,6 +1541,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>   */
>  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  {
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> +
>  	if (!phys) {
>  		DPU_ERROR("invalid argument(s)\n");
>  		return;
> @@ -1541,6 +1553,13 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  		return;
>  	}
>  
> +	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
> +			dpu_enc->cwb_mask) {

Align to open bracket. Please adapt your editor (e.g. 'set cino=(0' in Vim).

> +		DPU_DEBUG("encoder %d CWB enabled, skipping\n",
> +				DRMID(phys->parent));

Single line, please.

> +		return;
> +	}
> +
>  	if (phys->ops.trigger_start && phys->enable_state != DPU_ENC_DISABLED)
>  		phys->ops.trigger_start(phys);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
