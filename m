Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033069667E3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EE010EA9F;
	Fri, 30 Aug 2024 17:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r3dvTAzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A9010EA9F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:23:02 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f3f68dd44bso21186891fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038580; x=1725643380; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JonTUQCBs5ivMCokNBrIZmOlyFwwTNBGJMICc1ZLhJA=;
 b=r3dvTAzFmisf/hS/lJg+wX45he5MaHM/q2Db7hWNA+8pR20m6QPfwB1Dee4/+6LoCW
 FhivnlHPyjd1BM4lGe0HulvvP/NnsnY4b6Wz+ZIT1mdjMGkedJwPTjnoTDXXql0DonWX
 OWgN3O7/jltHULYskk194PlTAAoFldPUWNF9IMmmPjTTpEAqCnDOFOWMY6F0CEwkuJcg
 QoynF8x5kJez6VcIlG+iSXRdF+eJlT3+f/hX47eqk3dVw4qwVb/dj7S0cPPkw78hWVfl
 u5yz0RmpKL90SIjd0LlGXAVJkTDWwn7EDAo+Qtvglj4oRORa6j8/YRVL3qn5kRxVbaey
 sINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038580; x=1725643380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JonTUQCBs5ivMCokNBrIZmOlyFwwTNBGJMICc1ZLhJA=;
 b=nLjBBo31OULUx2DEm7ObpgmYlnE21NE94SwZIEA3H3auSZ9Xun7E/rAQ7QHP2UnOn0
 4vbnDNZUJoIMLGi5ofbXHi5TJ0nCg+pZXuFmvc0MQGLKlcyVHFTZ3JUeIYsGrTYHrX3l
 7BS9T/Yu1VZ1dd7R2zf53FOuYO+BIE0RJMxIAIAMBKvkdaIGnXmyH6R38zNspIs5zbnE
 LI+zrnsfez2OrqTZ0Ejm/vnXkqtAJTj7nirv3DFVaIftWZCjBMvf6rpI+uOJkjSYKGLf
 DbaSAPm1U2M57p8ieHOXB/KQBDY9q9I4c01wWxOomCcoRjHKVbvzKAO7B/QPtC6MW6Vq
 Hp8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM1TZBb9c/dws443D523b7eQIx47QdCqfLmbIKMhur8fVfPt+nwTo57IqxXPLUvx+Zq+rMnjmAM8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB/CD7fyfmgaf76N77u1iTq3jZeE1SpyrcE0/ILngprAZcFOhK
 anp7yiqArSkzo6890pFkCf0H7BN1i66kdeV6BpJV3LpAN4i8UZVMH+FMQ6OMK9Y=
X-Google-Smtp-Source: AGHT+IECxz/qb6Vkma2IUS75Cre/bsH2ReQknO4hqXXTWChfooNaf/Zhku94vdEvgJjNzUn4a2iYPw==
X-Received: by 2002:a2e:b8d1:0:b0:2f6:1d9e:adfa with SMTP id
 38308e7fff4ca-2f61e056430mr21468051fa.19.1725038579557; 
 Fri, 30 Aug 2024 10:22:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f379b0sm7692581fa.55.2024.08.30.10.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:22:59 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:22:57 +0300
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
Subject: Re: [PATCH 13/21] drm/msm/dpu: Require modeset if clone mode status
 changes
Message-ID: <at6ejhvsqu5r3zdmsd22vtwagyogdb33cazutkkz5xayxsyebn@zravwdqovgaf>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:34PM GMT, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 1b0cc899e8c1..99eaaca405a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1306,6 +1306,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc->state);

No, use old CRTC state from drm_atomic_state.

> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1313,6 +1315,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +			(!clone_mode_requested && clone_mode_enabled))

PLease align to opening bracket. Drop extra brackets.

> +		crtc_state->mode_changed = true;
> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
