Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF29F8BEC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FDE10EEC1;
	Fri, 20 Dec 2024 05:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jduIpkuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDED10EEC1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:41:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-303548a9361so13731291fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734673301; x=1735278101; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zSd9RPD5SkoaoogLe4rfM84xfHjo1V6oblWgx/m35FM=;
 b=jduIpkuK2FVtn/cBHQh26lpobLcuD8dsxsUNs5SnXJ6nkLNxQQ7sA6NGW+uLiJqzb5
 5N8kusU0bwTldkCokd4pzJYdqUiMo5ut5oGe0LmZr2ap+rdWA4EDb+EFMBpvcLE5Qokl
 R1CZIeCZxCuh9PPoF0cpytGil1Dng/Q82rG3Bat+mH65xiakRqlpA1Zbbu+RT1MgrEB5
 ON4eTtbcISnbviAKgkR4qUAYgRdYHtyKQ8ZFVhvFcSKD5OPBIRR7T1+iZ8/hWXOyo4pv
 0Y4p+jCa/0n8jAWQ5cbXGFOs5A+wVRUOBxIK9p9cHb12r0phx3Bddqav8frcJvsW3PNQ
 aQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734673301; x=1735278101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSd9RPD5SkoaoogLe4rfM84xfHjo1V6oblWgx/m35FM=;
 b=nEk2sIzJ6ep/sVOJ8/1N5/jJvCdS/xecCMIZKc+DXzIifrOeFZuy/+cgrpOVsWhrVx
 BeVO/cji0cRUzx+rDLcoXwR0NmM8L8rmK/VD0SdJGmabNNiKEtcIUKT8wHWJ4BRiqZhS
 VJoLprBKJd9d3YVTGlRbPe9uY6n0PM26WeLwB+K2mtn0UJKRQyE7sv0tYb7gbj0f4BA1
 o4hqOhElqKBmW/Pq4DJypL/a8s17DrBmBx99nazWheSdZGHNUhEhOoZ5FITzSRfrsdtz
 rVfvd9zreY56ympVDOiwgU5WxlQfMXsn89559H7pqwyJtng3CDP4HFVICwQqzcLaGC+1
 9EVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4gBxoYcRObytCABhnDVU4yMHDVe6rgEuq3DEB42WemlLla9x5rvvEXvAr5RVW+pRBYcpCEIR8zLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsX+ZGFqje7z5D8Ya1hxgydzRw5LNGqHyOFutBbkwtZO9L6g4i
 hv9cS+TBKd0EiG7ZjyY9h5V8vfiKmo0jYA3IjmsITN2sqW9EGGmXXD2xdq66OFw=
X-Gm-Gg: ASbGncv3ppt6iAju1e81BrLhABHJf1zEwzJiGoasac/vXz6ZO0lbQxvrx9KIcfo8E18
 19tWs9DU1h29vMbB9pSDNG5tPt43g1DXlRMmFh4lhAjpEjZX+YzaywzYm/IWAQIjCUdDq/EMGXW
 fF/zbkPj4HmdlFIAwugRVHAo91yrTvIr+XeN1vePx5P98PhAa7pak88z/ZPVRce3ar31x5UVwjr
 QxSxDpcYRvYAXnqMZcmuWDGKoY6Wu8ty7ehpEQ4lWodWbZ3vx7bV6PIB9sAjH//nMaV54qEiNf/
 K//DpSBxA60gf5Ow8tlQHVXY5OF+L5grdw4B
X-Google-Smtp-Source: AGHT+IE0SzyvkJ12RI8b+pvSj1Fq06vfOqKQF7hZ9uZpOQiOErELhSiSLImozHQHQDEUoLxuo7BCWA==
X-Received: by 2002:a2e:a588:0:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-30468608fb9mr5166751fa.28.1734673301233; 
 Thu, 19 Dec 2024 21:41:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d51sm4547741fa.32.2024.12.19.21.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 21:41:40 -0800 (PST)
Date: Fri, 20 Dec 2024 07:41:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 16/25] drm/msm/dpu: Require modeset if clone mode
 status changes
Message-ID: <x6q3jvoi452wql5wg3bizmrn657iyhyhrc3ffk5g3g26i6e4vo@n6hnqyjtuwg3>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-16-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-16-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:27PM -0800, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> 
> NOTE: As noted by Sima in the v1 [1], the DPU driver doesn't handle
> crtc_state->mode_changed correctly. However, fixing this is out of the
> scope of this series.
> 
> We will post a separate series addressing these issues across the driver

I'd rather fix the isssue first, as suggested by Sima, then we can see
how this function will evolve.

> 
> [1] https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b063c8fe4c0594772d84401fa56c9c21afc0ad18..9bb920d28bae2706b3892c167fe2bec3fd8857f4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1297,6 +1297,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  {
>  	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>  									  crtc);
> +	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> +									      crtc);
>  	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>  	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>  
> @@ -1308,6 +1310,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1315,6 +1319,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +	    (!clone_mode_requested && clone_mode_enabled))
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
