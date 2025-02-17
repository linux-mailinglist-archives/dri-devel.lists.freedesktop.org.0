Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F00A38CD0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDA210E5C4;
	Mon, 17 Feb 2025 19:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PeXwZVzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9546610E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:57:29 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3098088c630so19321971fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739822248; x=1740427048; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xMGI211LrxE7ViIhzCm1kjlvh1GVYdKtuIIj0ObyhHo=;
 b=PeXwZVzsM8Tu/4vqGZqNO9k4EVdjxTQ3xsTRvM3NfKsQoWed3/MLlyhxvnnpAxEJJu
 AWTEdS9SQd16crLTUra6cxTnaD9coGLUavgbaqcWe0eBx3JqPAHofaybR3vjpDFvqg78
 +59hiTxCL53DpSJ5KXBJjmU9VQ4kwUmTPNoRPG3XQBxctnjcMWpu4UhRz9FyRqvTMt4T
 DfenKNw7U9uV8i/OY2l83X00GEEjbsJAnojD3Fc4K4QiHxLK8WmjCm1QFT2XHoQXSIHl
 CtzjBPSeXjxnmxYrvS7cKAO3A57D1gDRrd+j5D6Z5WaOqe29V78DFE9hLr281pemLr6S
 Ss+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739822248; x=1740427048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMGI211LrxE7ViIhzCm1kjlvh1GVYdKtuIIj0ObyhHo=;
 b=v2QDGINp9c854+BEi9CEXiQM+AWFiYajZ6N4t9N8/hjTIXorZkGPJzSAsqUZDuG6QG
 uzyfGG27o0M51J8P6BwL1eTt6qzoM9SkTkDdmTYImBsBhPDoXhiYp49/zcmDZVEfs7hk
 n5TCD6iCH24dtxqqAbs5hAqFK5coC6CjNxvCc8tATj5j5PIN98r+RjeLE4udq2pvMNfL
 bQB6sldDcBH9H+Hbo9NspC+39uEJhQQZslMty4BYB//r1lLDAN5raNr+KLf1gqhPG5hY
 eIOJDSZ5bS9Vkcaw2eH+02btExQZxDpTk/FsF0ryXXYQNvUYT/dXcYUJZxsz2KaMPXXO
 ZaXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSUeoYLE5ngLR3AGYPFK5nlvXZP4VQgohbvtbRJ+eSRozvQyM1hufGerIBcbkN+jdUSQCmkzOB9fI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGhNMh/oaSVLCW1QTDP4UgIZFkzq/1XnA0IWNFHZZMM/uxVluH
 GlfKBnKBiqunE6Y0PfzfL5gUhIO+5g0nP8RW+pd3HW2D+pToVWOOn5JykmT7euk=
X-Gm-Gg: ASbGnctQ25lyzAZeFMHdT9NBLWt5fillToGczOP84YJ1RTjxOxxjTPu9P7fel9rpwaT
 71+I8KB0mWPMssb2wyFfDQKWlnWhHL1sElrQKD9aEsESxE2SlI4odT7EGqxr8n7juRKqUqHd9Cu
 O+g4+crzuozMdqY3Y4rFFMgfNWNW+p+9UON2K5cC+lOU09hhbXznc1MLsrmcuPYXfy2wPYDYqvI
 ClP64rA2KU7jOEQ6bzDruCxrXKTyqFoU1JD7gFMauD9y+rrXNqJ/jFwMiWQIhULBWFhgqnJ/uin
 dBQlnBx4QzS+XhulmmasDDv2bcIl1ZMf//5lwP5nn5UfkK7yPGMZ0HkQ+jyoY7Holo3JkmE=
X-Google-Smtp-Source: AGHT+IHWktoREaaIkncp+ihbbZRuJV4rft7CykmfmlbEHdRBo5ws85YTHgTILXgtZzP9D8cAmBMh+Q==
X-Received: by 2002:a05:6512:108a:b0:545:d72:95f0 with SMTP id
 2adb3069b0e04-5452fe5bd70mr4139939e87.24.1739822247806; 
 Mon, 17 Feb 2025 11:57:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54530993e36sm1035359e87.3.2025.02.17.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:57:26 -0800 (PST)
Date: Mon, 17 Feb 2025 21:57:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> Currently, only 2 pipes are used at most for a plane. A stage structure
> describes the configuration for a mixer pair. So only one stage is needed
> for current usage cases. The quad-pipe case will be added in future and 2
> stages are used in the case. So extend the stage to an array with array size
> STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
> stage structure.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  2 files changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354faaa816fe74566784844c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  				       struct dpu_hw_stage_cfg *stage_cfg
>  				      )
>  {
> -	uint32_t lm_idx;
> +	uint32_t lm_idx, lm_in_pair;
>  	enum dpu_sspp sspp_idx;
>  	struct drm_plane_state *state;
>  
> @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
>  
>  	/* blend config update */
> -	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> +	lm_in_pair = num_mixers > 1 ? 2 : 1;
> +	for (lm_idx = 0; lm_idx < lm_in_pair; lm_idx++)
>  		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);

I almost missed this. Why is this necessary?

>  }
>  

[...]

> @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  			mixer[i].mixer_op_mode,
>  			ctl->idx - CTL_0);
>  
> +		/*
> +		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> +		 * There are 4 mixers at most. The first 2 are for the left half, and
> +		 * the later 2 are for the right half.
> +		 */

The comment is invalid until you introduce quad pipe, currently there
are 2 mixers at most. However you can just say something like 'stage
data is shared between PIPES_PER_STAGE pipes'.

>  		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -			&stage_cfg);
> +			&stage_cfg[i / PIPES_PER_STAGE]);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d02074505c5474a547a814 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,6 +34,7 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> +#define STAGES_PER_PLANE		2
>  #define PIPES_PER_PLANE			2
>  #define PIPES_PER_STAGE			2
>  #ifndef DPU_MAX_DE_CURVES
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
