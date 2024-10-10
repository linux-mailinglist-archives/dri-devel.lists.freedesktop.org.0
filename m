Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEF9986EA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 14:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10610E8EB;
	Thu, 10 Oct 2024 12:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="evn8u2fX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0010E8E5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:59:39 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fac63abf63so8974951fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728565177; x=1729169977; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=36NOSeErwXpLnSIxfSSqwMj8Lcluu1V/I96m1cnaxMk=;
 b=evn8u2fXwlEidbwa0xnj54BBjkqPJ78QJXI0UiqLV6tJF29Z6YePE2DffounN6gfwM
 TEL1+kwa8kyfSeJix6aqtX14Fd4o6cY1+atfl/LgMjGcuI91DMcG2/CJN/ISlhfVF0Ov
 /SR7y1tDSWv+1abLXzKgriDtx4TPE+k+xAE1LMwqPfN3V9W5mIBGN4yKRAkT3PsiWXK1
 6I13US1wp50n5xqMGptYYZG6SBUaZ60HqkorlaD7VcBOrLwLD8EgVrKI7LlLPi44vxMD
 XZGBGcHnJPtsiUeHQSAMGPZZV9vsKnOXnjT0TdxwSON9Kh8lnXHe1NQcPNDr8ByWnGH9
 UbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728565177; x=1729169977;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36NOSeErwXpLnSIxfSSqwMj8Lcluu1V/I96m1cnaxMk=;
 b=AdhhKmoKVI+2x/ZceTuwG6+8i9g+V9M3fZP6tN4GNKO3EIaT/ribK7LCpwF5ORkDLs
 h5ISyUFjFjG96mP8SGmp2DCacmFGSog0fqck7fyY7s7ZxR8lQe60oepP0lmLvOzMtSMm
 cHBEs84dvrdEeVwvmFfX7ijBvRwM0xnMxcSCEhSafyejrFLjDbR8qgqMBD/QlRKXwll7
 6UoL0iUdVmi1zGwlRW14/FGqhe6NeamfCr6V+CSXipalw0UMvJy6PDp34umVTwzDnaQs
 WILsyCQJjTEjJZDeJ+g5qHgBnsHkEBjU3IjR/VGO47OAB0vWK3SKChqRmmVzXIBSJ1Cj
 0iIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPkZbupOeo2dB1QUTJwCFseciXQaI/Txk5e7EOSOHypugr5AXNH3lvS43xPMIkcwgwzceB4paMkhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ15x+QYQJ3UGAt4RcVq5fWwqJs67R0gs7sPT2Z5FIP61cry+U
 yikcwz2PFwlwvdt0ox4/ZDtQEH+3exBek0yZwlpSnoEiXhZ2tiDooekvJFRiK4Q=
X-Google-Smtp-Source: AGHT+IFY7BZoKpY4gXXDowPZQJ9kCDf3g7HVgd9T5+NX2HqZudxIwPOU8AAV3qqHVLmN94N+juBEmw==
X-Received: by 2002:a2e:a989:0:b0:2fa:cf5b:1ea7 with SMTP id
 38308e7fff4ca-2fb1872993amr43592271fa.6.1728565177250; 
 Thu, 10 Oct 2024 05:59:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb2457972esm1978601fa.20.2024.10.10.05.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 05:59:35 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:59:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/14] drm/msm/dpu: Support quad pipe with dual-DSI
Message-ID: <twqjthrjzagqhvednxk2plwynxjbxwusvx7a3745mjv5foelh2@fhzyipmelvnv>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:13PM GMT, Jun Nie wrote:
> 
> ---
> 2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
> And 4 DSC are prefered for power optimal in this case. This patch set
> extend number of pipes to 4 and revise related mixer blending logic
> to support quad pipe.  All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
> 
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
> 
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
> 
> This patch set depends on virtual plane patch set v5 and flexible
> number of DSC patch set:
> https://patchwork.freedesktop.org/series/135456/
> 
> Changes in v2:
> - Revise the patch sequence with changing to 2 pipes topology first. Then
>   prepare for quad-pipe setup, then enable quad-pipe at last.

Is this the only change? Doesn't seem so. Please don't make it harder
than it should be.

> - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> 
> ---
> Jun Nie (14):
>       drm/msm/dpu: polish log for resource allocation
>       drm/msm/dpu: decide right side per last bit
>       drm/msm/dpu: fix mixer number counter on allocation
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>       drm/msm/dpu: handle pipes as array
>       drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
>       drm/msm/dpu: bind correct pingpong for quad pipe
>       drm/msm/dpu: update mixer number info earlier
>       drm/msm/dpu: blend pipes per mixer pairs config
>       drm/msm/dpu: Support quad-pipe in SSPP checking
>       drm/msm/dpu: Share SSPP info for multi-rect case
>       drm/msm/dpu: support plane splitting in quad-pipe case
>       drm/msm/dpu: support SSPP assignment for quad-pipe case
>       drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  74 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  69 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 408 +++++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 210 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
>  15 files changed, 478 insertions(+), 364 deletions(-)
> ---
> base-commit: eac5b436019c2eeb005f7bdf3ca29d5e8f443d67
> change-id: 20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-1142507692ba
> 
> Best regards,
> -- 
> Jun Nie <jun.nie@linaro.org>
> 

-- 
With best wishes
Dmitry
