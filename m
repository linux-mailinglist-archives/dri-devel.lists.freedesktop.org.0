Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F95913406
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 14:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F9E10E1D5;
	Sat, 22 Jun 2024 12:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zl75Arj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1172310E182
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 12:48:11 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so35318081fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719060490; x=1719665290; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J4NrzrquMu2wm+RaIJw1sglld6u4UvhjbmFh93smTfA=;
 b=zl75Arj+/Ha7bhY5IzZMT5pIMkBgZUFzPwSqFDTA2U0Bk8x3MWhhEPTmrPspanDCmN
 qghiexIlvvW2Gn9HHVtqzqQm5t+XMAJV90qtM/IT/G9xit8mkFgKEEZusW8PYpTMftsA
 m+E4JTry9eDIN/CyfZ+1k1m2iq2+uuKVSVo4tbCrXKvm9YZV+TOfb6lAdoV4F3x3wq5C
 Hh+wOe5i9RHLe+gAYzzFFyeEdiK00L2EXBw7s76L4k7luMQjolVlhKiDKWzzVRhPQJI3
 +49vQrTIaFG4Gh4/hVjh2sRTnJshvydRY6XUjZDd95bAh2oqWWImj1mCJ0fAV5urJg/X
 FodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719060490; x=1719665290;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4NrzrquMu2wm+RaIJw1sglld6u4UvhjbmFh93smTfA=;
 b=vDImF2mHRRcSQSmtlHs5iiNKQebniVEHObUrfE82DySHUFhfv+1XOlYImMMZXJqSfv
 im38bbqqBP1umjz08ThyV/Lsc7/jRVmTOS2fOKvN/IHYlbyTC99HOlreKjCtdw5ODfDN
 VWGFX1A8s+/l21ER2GtISq7+FiFucYJFVTVOMj3AXkxs1+OfZj7jm3Vf6RweFR8B45i6
 sxwTiXYzT1OOmBrrShMeGVoFsoSitIyiIUOF82TqwoiOGtWEsgTImV+JWlnhpdGE+/6G
 HaGU/obm7KHsFoPLN+LK1iG2FAWpX5v8NjTcgllyI0HpmSJtIfvgbfbf0DGymGWxboQB
 ZvUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2fJ1DR0qnvc443FigtuEBcWg9Al2z0R39BEAPn6ym/BdVnbx582ijoLYPnR5xYu0ePqyNxjL19slnKCeiJ/PkNCUWt2L8e9ggrledmjsA
X-Gm-Message-State: AOJu0YwjbsAIkDX00hSEPCZ9RetkGtKfCXBhPK0QyLoiv+12hwGymtNI
 Jvr08Fc9rNFyn2F5g6I69zviGRk6oX09FZco72AvLU3sIl8VECK7LHVVQD1lDhtaNfhhcz8QpB8
 ttuw=
X-Google-Smtp-Source: AGHT+IHUtcMthGyb2HAUJ4dSJgS1RvVhsTp9d+IwnhEYCqcGykisBn3lTkmOciLbVOJPHTGKWoptCw==
X-Received: by 2002:a2e:998e:0:b0:2ec:4d5b:3d03 with SMTP id
 38308e7fff4ca-2ec579845dbmr6014601fa.31.1719060489910; 
 Sat, 22 Jun 2024 05:48:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec50860130sm3380151fa.140.2024.06.22.05.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 05:48:09 -0700 (PDT)
Date: Sat, 22 Jun 2024 15:48:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: rework vsync_source handling
Message-ID: <zxnlq4vc7w2j6jzwyuyvg65qguexs75y5urn3xub5wlqdm2hlu@ntfkwwvbplax>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-5-67a0116b5366@linaro.org>
 <flxejwpqw75thyeu5ycnlichh37l4ltuied36jjzvgifury7lp@gjjcbohuhfa3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <flxejwpqw75thyeu5ycnlichh37l4ltuied36jjzvgifury7lp@gjjcbohuhfa3>
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

On Thu, Jun 13, 2024 at 08:21:59PM GMT, Marijn Suijten wrote:
> Maybe retitle this to something that more closely resembles "remove unset
> is_te_using_watchdog_timer field"?

Well, it really moves vsync_source selection to
_dpu_kms_initialize_dsi(), it doesn't just drop the
is_te_using_watchdog_timer.

> 
> On 2024-06-13 20:05:08, Dmitry Baryshkov wrote:
> > The struct msm_display_info has is_te_using_watchdog_timer field which
> > is neither used anywhere nor is flexible enough to specify different
> 
> Well, it's "used", but not "set" (to anything other than the zero-initialized
> default). s/used/set?

ack

> 
> > sources. Replace it with the field specifying the vsync source using
> > enum dpu_vsync_source.
> > 
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Patch itself is fine, just think the title could be clearer:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 5 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 ++
> >  3 files changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index bd37a56b4d03..b147f8814a18 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -743,10 +743,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> >  		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> >  
> > -		if (disp_info->is_te_using_watchdog_timer)
> > -			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
> > -		else
> > -			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> > +		vsync_cfg.vsync_source = disp_info->vsync_source;
> >  
> >  		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> >  
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > index 76be77e30954..cb59bd4436f4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -26,15 +26,14 @@
> >   * @h_tile_instance:    Controller instance used per tile. Number of elements is
> >   *                      based on num_of_h_tiles
> >   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> > - * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> > - *				 used instead of panel TE in cmd mode panels
> > + * @vsync_source:	Source of the TE signal for DSI CMD devices
> >   */
> >  struct msm_display_info {
> >  	enum dpu_intf_type intf_type;
> >  	uint32_t num_of_h_tiles;
> >  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> >  	bool is_cmd_mode;
> > -	bool is_te_using_watchdog_timer;
> > +	enum dpu_vsync_source vsync_source;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 1955848b1b78..e9991f3756d4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -543,6 +543,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> >  
> >  		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
> >  
> > +		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> > +
> >  		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
> >  		if (IS_ERR(encoder)) {
> >  			DPU_ERROR("encoder init failed for dsi display\n");
> > 
> > -- 
> > 2.39.2
> > 

-- 
With best wishes
Dmitry
