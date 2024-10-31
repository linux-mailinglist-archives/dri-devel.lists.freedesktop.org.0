Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA59B806E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1DE10E418;
	Thu, 31 Oct 2024 16:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nj+Bsm6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1D910E418
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:45:00 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso18062011fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730393099; x=1730997899; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kt+ok40lFX13Yzdkxs+h8BxbfiG8swFfP1jVOHqPZHk=;
 b=Nj+Bsm6BxGU8gnBzosCZfSjwX+iDJD4I9QmqsfGxZ7iBzeI/4IoFSYWGiVtcgom5sy
 niP4cXUUeaqrg1uqcG3PWWskQWi8tM3Aa9ZT4TzDY4pT2OFQZ6ug1vnzlcd27JSujnKH
 cZELpWyLEPYkswjYX7svaIRN/ciMTF0c7Bq/i+nctTqFhvcLSh7npMq0YXMWZ8JjYIs6
 W2mttKTetsYuO0UTETKSqncGBJ1R0OawUI17N8HLiyZKRzTI8AZduuSbQXl6IA2yFf+G
 CixvMQZ/MyYBo0gTSCY8EoAPjxVK7OD1GBDrtlU47ZkWtOz5KyqS5JtR9Bjl4vIrW7lY
 pj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730393099; x=1730997899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kt+ok40lFX13Yzdkxs+h8BxbfiG8swFfP1jVOHqPZHk=;
 b=jO7RxVUdlm0jbTFWCMSkXCQGk9erAoxjzjXphi3EdlB7pXZAkkxp9cc8fporueLRqf
 Y3Ft9XdNPPPTA02vRmHeweWcsYwRGrkU1/o5L1RP9hSNehjXPAA5UBGx7QLDDxQFaQly
 dUhosV0d0DGyFzLGaHvTE5y+PLBuaSqqFWccyetnHG+l5S0EcV7WsMYmTq0UHVMW67WD
 dz8aI/Q7IsF+A+nLNt3YKkKLjy6fIYQM9lDx7mlw+RLAEPhn+VQzjzdRqObylWc9CodY
 5YFeFSqNsItvHLDQsprAd15w1m+iQ28Yw8w/pWvvH+HNZwoIgHZ5TNZahRfL28jMKNo0
 SNxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyl1vDU4z8MdpGOT/+abP7uQaMV/PVeUzgfkk2FUHozBZ7wBuUv8lG09/kpLchriKFi/nKYfFBoeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIINKNlbMsq2gLfjjQ6dSSscFZailFTAHS7YsMuWrgB9p8Ad3P
 2W8zNONtj8DAtViFJzJiK0EPEKChHOoaOP4h7jbPGJbwkKbGqwIV2sHOKdnhlIs=
X-Google-Smtp-Source: AGHT+IHRQwOGhSkkEBtHlVJ+MZMA/jBWeUH8G5Fmi2dhuQ2z772Z0F7QMIMohuXdOiHSqhRBM4/r/w==
X-Received: by 2002:a2e:bc27:0:b0:2fb:5bd:8ff2 with SMTP id
 38308e7fff4ca-2fedb7a2d4fmr5016331fa.16.1730393098676; 
 Thu, 31 Oct 2024 09:44:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef3bbea1sm2684791fa.24.2024.10.31.09.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:44:57 -0700 (PDT)
Date: Thu, 31 Oct 2024 18:44:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to
 control LTTPR transparent mode
Message-ID: <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
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

On Thu, Oct 31, 2024 at 05:12:46PM +0200, Abel Vesa wrote:
> LTTPRs operating modes are defined by the DisplayPort standard and the
> generic framework now provides a helper to switch between them.
> So use the drm generic helper instead as it makes the code a bit cleaner.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>  		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
>  
>  		if (nr) {
> -			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -						DP_PHY_REPEATER_MODE_TRANSPARENT);
> +			drm_dp_lttpr_set_transparent_mode(aux, true);
>  
>  			if (nr > 0) {
> -				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
> +				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
>  				if (ret != 1) {
> -					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -								DP_PHY_REPEATER_MODE_TRANSPARENT);
> +					drm_dp_lttpr_set_transparent_mode(aux, true);
>  				} else {
>  					outp->dp.lttpr.nr = nr;
>  				}

Could you please extract this true-false-true dance to a new helper too?
This way Intel driver can use the simple helper, the rest of the drivers
can benefit having the common code.

> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
