Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA08A4CF6C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 00:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B12F10E2EB;
	Mon,  3 Mar 2025 23:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HM8YfZuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB7210E2EB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 23:49:22 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5496078888eso1967291e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 15:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741045761; x=1741650561; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TGh2Jh07iqN6b8Vz0+08UIfINMxu82nUoWOUL86HJGU=;
 b=HM8YfZuutngZtz27fUS9Q3qXr0I3ct/Vz4kKYODDiBIq4mofaKga491+lNhiYq61zV
 2Fdatau+C+eYjjT1s0FEvvkPFKuqbV4kMDqi5LQ9qx+Lni5swFVHV1ABhR3YVBtLfxga
 0XY/kySD4zFZ1atPriHeGOPSK8E/SFFzFCF26yN9tJS1UEwUZI2YQdEcRsk4+0w9wc+4
 6o17SBKWfq8uvr4W8GoODURaCqOIhF802bPMCyZXuBS8Z7nCimgnIiL1WQFDc8qo5P1d
 5q0mZVtDz4a00EUy5GFk1sfRYZSD0Qocs3laqX0L93s/2a5PC7LUCSa5bSOlNOuaKY4v
 nJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741045761; x=1741650561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGh2Jh07iqN6b8Vz0+08UIfINMxu82nUoWOUL86HJGU=;
 b=qxc6w1ZTl3IfFifpMuIql3ArdTVc3znc1aB3y5Gg5Pnb9/o66okmBLfEFNga9UHbUU
 MmbLZRxbXycIsT4OInBo53OD1U538XXgReIJcZg/SD+KOvYp790I9yZZ6t9ubrwAN176
 19vaOTwKr9CH9SFPIxG38sNqGEdV/BInJ92GdYyb52wQ1u3T6wFIpVPPoDyTW25tPzqO
 4XGwcdGatOsAzcv2ab4lIcZHb86o6BrROwCfTV2NZukQN5v1NZ8r5G2buy/4kOXb53Fm
 4AjmXlgdlGZxoRrvaP0mpIdoKeeJlvRQaP5UEaix0CNQqdGcB05YP74nqAZPtf68DRJk
 UOQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoTtfiOrNl+Cm2DT7DSXgKG5Ad13zg7lNTJlbQsdbBXOzHYbR/OHkfdSHERs1KWC2bQ1pP7//eOVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp8TqrSX708Xc2Ig5lE0Ziy/v57QzLmzv2tqfSNA2xic8WFaWz
 EmA79+mCwx+01RyzG4XnSPZxY6Vu9jE7icJIHgj2Hb+4zZ1RAX82cafHz+YYdsQ=
X-Gm-Gg: ASbGncto8kxlDG2eXV0v4l1dI+ezFUbUFCkuN/btJON8SV4EAltBtqK2uuo4UtdRRcy
 94RXDr4LiMDvMSqQbRLru3IUpxijLMgIdgGK2gG2GNBxoyauz0im+7wqOsd621U92V3Bf0P9vJM
 /vfx9Rk3ZOFzHa7Mk0IWcvUVWxhAS77mMnqbOT+zWezINa0f0vi4VvvrFnTYlROzWPekqjcPtKY
 PDpj3yULJZ7WO8NCp6QTlvolnOCoyK9Nt1jUaHuBIJuksxK7NNh2o3aU4/39aEEYam/+vO9Hq9U
 LgbuJFtXPrPSebF5iA7Awvml8wDb/8OTpxpwkrd8NqRe5X6NFtV6PDxVXAiX/S2zIf21pFOgom+
 GTRzQdSbXbOh/oPT+cwFuBC94
X-Google-Smtp-Source: AGHT+IFWAkh7m/Jl/ntM6OdiF2e3PXJPllKscV8h133CwwWAxNYSo0Ra0mjbeHO46uPyn1my6qBAFw==
X-Received: by 2002:a05:6512:6c9:b0:545:2a7f:8f79 with SMTP id
 2adb3069b0e04-5494c320129mr6121961e87.16.1741045760896; 
 Mon, 03 Mar 2025 15:49:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54954afb00csm1069042e87.250.2025.03.03.15.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 15:49:19 -0800 (PST)
Date: Tue, 4 Mar 2025 01:49:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dpu: Force modeset if new CTLs have been
 reserved
Message-ID: <flc3cyky4wxfin7dlxhukwmhonze3napmuyhl2s6jbsgepco7a@q4l2ndh23lus>
References: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>
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

On Mon, Mar 03, 2025 at 10:28:00AM -0800, Jessica Zhang wrote:
> If new CTLs are reserved by CRTC but atomic_enable() is skipped, the
> encoders will configure the stale CTL instead of the newly reserved one.

The CTLs are propagates in .atomic_mode_set(), not in .atomic_enable().

> 
> Avoid this by setting mode_changed to true if new CTLs have been
> reserved by CRTC.

This looks very strange. First we reserve new CTLs when there is a
modeset requested. Then on one of the next commits we detect that
encoder has stale CTLs and try to upgrade the commit to full modeset
(while the user might not have .allow_modeset set to true for whatever
reason, e.g. because only ACTIVE is changed).

Could you please check if the following change fixes the issue: in
crtc_set_mode() replace the raw !new_crtc_state->mode_changed check with
the drm_atomic_crtc_needs_modeset() call?

> 
> Note: This patch only adds tracking for the CTL reservation, but eventually
> all HW blocks used by encoders (i.e. DSC, PINGPONG, CWB) should have a
> similar check to avoid the same issue.
> 
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Closes: https://lists.freedesktop.org/archives/freedreno/2025-February/036719.html
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4073d821158c0..a1a8be8f5ab9f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1406,19 +1406,32 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
>  	struct drm_crtc *crtc = new_crtc_state->crtc;
>  	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
>  	bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(new_crtc_state);
> +	uint32_t enc_ctl_mask = 0;
> +	uint32_t crtc_ctl_mask = 0;
> +	struct dpu_crtc_mixer *m;
>  
>  	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
>  
> +	for (int i = 0; i < cstate->num_mixers; i++) {
> +		m = &cstate->mixers[i];
> +		crtc_ctl_mask |= BIT(m->lm_ctl->idx - CTL_0);
> +	}
> +
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
>  		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
>  			new_crtc_state->mode_changed = true;
> +		enc_ctl_mask |= dpu_encoder_get_ctls(drm_enc);
>  	}
>  
>  	if ((clone_mode_requested && !clone_mode_enabled) ||
>  	    (!clone_mode_requested && clone_mode_enabled))
>  		new_crtc_state->mode_changed = true;
>  
> +	if (crtc_ctl_mask != enc_ctl_mask)
> +		new_crtc_state->mode_changed = true;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index a61598710acda..2f3101caeba91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -188,6 +188,7 @@ struct dpu_encoder_virt {
>  
>  	unsigned int dsc_mask;
>  	unsigned int cwb_mask;
> +	unsigned int ctl_mask;
>  
>  	bool intfs_swapped;
>  
> @@ -707,6 +708,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>  	}
>  }
>  
> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	return dpu_enc->ctl_mask;
> +}
> +
>  bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
>  {
>  	struct drm_connector *connector;
> @@ -1155,6 +1163,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	bool is_cwb_encoder;
>  	unsigned int dsc_mask = 0;
>  	unsigned int cwb_mask = 0;
> +	unsigned int ctl_mask = 0;
>  	int i;
>  
>  	if (!drm_enc) {
> @@ -1245,11 +1254,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  				"no ctl block assigned at idx: %d\n", i);
>  			return;
>  		}
> +		ctl_mask |= BIT(phys->hw_ctl->idx - CTL_0);
>  
>  		phys->cached_mode = crtc_state->adjusted_mode;
>  		if (phys->ops.atomic_mode_set)
>  			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>  	}
> +
> +	dpu_enc->ctl_mask = ctl_mask;
>  }
>  
>  static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ca1ca2e51d7ea..70b03743dc346 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -91,6 +91,7 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
>  
>  void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>  		struct drm_writeback_job *job);
> +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc);
>  
>  void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>  		struct drm_writeback_job *job);
> 
> ---
> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> change-id: 20250228-force-modeset-hw-ctl-d02b80a2bb4c
> prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> prerequisite-change-id: 20250209-dpu-c3fac78fc617:v2
> prerequisite-patch-id: c84d2b4b06be06384968429085d1e8ebae23a583
> prerequisite-patch-id: fb8ea7b9e7c85fabd27589c6551108382a235002
> prerequisite-change-id: 20250211-dither-disable-b77b1e31977f:v1
> prerequisite-patch-id: 079e04296212b4b83d51394b5a9b5eea6870d98a
> prerequisite-change-id: 20240618-concurrent-wb-97d62387f952:v6
> prerequisite-patch-id: b52034179741dc182aea9411fd446e270fdc69d1
> prerequisite-patch-id: bc472765a7d5214691f3d92696cc8b0119f3252e
> prerequisite-patch-id: c959bc480e96b04297ebaf30fea3a68bbac69da6
> prerequisite-patch-id: f7db8449b241a41faac357d9257f8c7cb16503ec
> prerequisite-patch-id: 7beb73131d0ab100f266fcd3c1f67c818a3263f4
> prerequisite-patch-id: c08cbb5cf4e67e308afd61fdad6684b89429d3b6
> prerequisite-patch-id: a4e343143b8fbe98ae4aa068cc459c750105eb9d
> prerequisite-patch-id: 1d09edcf12ef7e7ab43547eefacae5b604b698e9
> prerequisite-patch-id: 0008f9802bfd3c5877267666cceb7608203e5830
> prerequisite-patch-id: 49402eb767c97915faf2378c5f5d05ced2dcfdac
> prerequisite-patch-id: 522be2a6b5fe4e3a2d609526bb1539f9bc6f828f
> prerequisite-patch-id: 031da00d0fffd522f74d682a551362f3ecda0c71
> prerequisite-patch-id: 9454cec22231a8f3f01c33d52a5df3e26dd88287
> prerequisite-patch-id: 7edbeaace3549332e581bee3183a76b0e4d18163
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry
