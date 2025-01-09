Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD507A06CDE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856FF10E2BE;
	Thu,  9 Jan 2025 04:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eNhgPOpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA01A10E2BE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 04:23:44 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-304d9a1f198so3680531fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 20:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736396563; x=1737001363; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+8RZpQ2r9Mn21NHPw670vKYSiFhVy622sgKUY1Z4mzI=;
 b=eNhgPOpFRshGplT4DHINypPwKEnYIp0h1qZofFkydL5W6oOVYF38IHKqIGaIBYErMh
 ue2gg9V8hWa0EuiY2zPxWC2dXATFsGA0gddAY+iOSa+Y0IHe3cFCd9ezJ3CD17cNKq9P
 KV9lG6nQ+tfmyB2CCBX6MjjZF9HCzEUwEBAOfSMLVhfhP8hvfav6WJ1FD73TB0Q6gk/a
 w6RojJywmaA/HKJbArkZNnRprC/OMgQr6IK2DN4BHkWh68Cd9zB66um2WNUMqh2pCz6x
 +haG+HDYK5KHAO/cpnzy2jclVjImPlpBTiVSN8YeVWlFR8B/Cye0IqDIpV+xO/fQPkTN
 TZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736396563; x=1737001363;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8RZpQ2r9Mn21NHPw670vKYSiFhVy622sgKUY1Z4mzI=;
 b=ilr9yHrWEyoJfnSJLPnS34d9KOpJZrcKV4lxj/4uyIta+SCvZNZschDM3Hnrz4Zf5u
 GtBhxvHwzQ6yRdFemWh5wiCHYsnsObbgSYB1PnHLLdUbyVfuWQLO9lFAfnLkXGlres76
 yxDjGWIW5Dq3h/CbxuQmb6ZhHa19MGw+TsaGv2Ol11oC4OBtqoBeOApBaKwEAuKpo2CC
 d/9bP7MZdAEDp0QKNOjiZN8mL1s7zb4u6uHT7yaOrU1gWRIOi7M2/0RntPU1VK6AJAG9
 pQ1X4kxDV7058g76iYtAzcfF1QTPep3X1eJw7thxhZfgeeTWG60SdqJqeum+XQO2wW/R
 jT7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVk6YMcLICLklHfU7YzxzuRSZNWZRMWWVZ+CgMkz2xqHW+1QOgswgki8EA2zhhKp/PtQGtAu7sEXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwF343rHH62uLtaMSq/rAwtUa32gCANCnqBpDBeGyItZstADyrE
 MJbYx05HCMC86ZsEJ8QeNWFfhnHKZWdCp4JGy7ONwirf9xdqBCeOEpqKVjOM3to=
X-Gm-Gg: ASbGncvXDgCmmxvlw72/Oeg5LWXBEB0zUmJa1ai3aeTlWSL1AThWiCsiCtp8IJNH9DN
 W9lRhS09vT3SH0uA9pZ/7linL0oSLDX43xd9NltSNDWaqNE8S09xqO2wGU777XIZHWfUJ3HtrSZ
 4Zz7ebznG+lHqA3DJ0ePL8Ci+6sV+uB/g2i35UALymf/zPXmSQe2ITgvLrWwqlPYbtFiZvlI8WK
 6CVUs+trYM8KBEink+rCHcZjK4n/W8UgPtUSeicRGCYxTffa1y9n3lChC/LFrLgCCEPXp7VM7Z0
 8XJHuJdlmnjWx4OyNJm58wxe+rJAxS6sxgFN
X-Google-Smtp-Source: AGHT+IG1V8Jg2MaRUXUmzF8uHSbf02lJcqcW8qbepGUCESN2xtzsOIioyzPL1t8gTqIQIkv8DzAQUg==
X-Received: by 2002:a05:6512:3e23:b0:542:1bdd:511a with SMTP id
 2adb3069b0e04-542845268e7mr1247466e87.13.1736396562833; 
 Wed, 08 Jan 2025 20:22:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be549c2sm73895e87.109.2025.01.08.20.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 20:22:41 -0800 (PST)
Date: Thu, 9 Jan 2025 06:22:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
Message-ID: <vhqmcb6fu6mfmbjo3jyjdhzpowhvnxbtxg2osk42xwogrsylku@5hvs6mtizqcr>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
 <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>
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

On Wed, Jan 08, 2025 at 05:19:40PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > The driver isn't supposed to consult crtc_state->active/active_check for
> > resource allocation. Instead all resources should be allocated if
> > crtc_state->enabled is set. Stop consulting active / active_changed in
> > order to determine whether the hardware resources should be
> > (re)allocated.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
> >   2 files changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >   	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
> > -	/* force a full mode set if active state changed */
> > -	if (crtc_state->active_changed)
> > -		crtc_state->mode_changed = true;
> > -
> >   	if (cstate->num_mixers) {
> >   		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
> >   		if (rc)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
> >   		crtc_state->mode_changed = true;
> >   	/*
> >   	 * Release and Allocate resources on every modeset
> > -	 * Dont allocate when active is false.
> >   	 */
> >   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> >   		dpu_rm_release(global_state, drm_enc);
> > -		if (!crtc_state->active_changed || crtc_state->enable)
> 
> I think this was leftover code.
> 
> What happened was, we used to have dpu_rm_reserve() both in dpu_encoder's
> atomic_check and mode_set. Hence this is checking !active_changed because
> that case was expected to get handled in mode_set to avoid duplicate
> dpu_rm_reserve() calls. Code has progressed since then to drop the
> dpu_rm_reserve() from mode_set and only use atomic_check.
> 
> So the correct fixes tag for this should be:
> 
> Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")

Actually it should be:

Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")

> With that addressed, this is
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > +		if (crtc_state->enable)
> >   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> >   					drm_enc, crtc_state, topology);
> >   		if (!ret)
> > 

-- 
With best wishes
Dmitry
