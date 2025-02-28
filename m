Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C767A49074
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1840B10EBF9;
	Fri, 28 Feb 2025 04:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P9MuSAWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18D110EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:39:45 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-548430564d9so1828274e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740717584; x=1741322384; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t3/MIfx773wjuQMH+TAWe/YUS0t51KLheOq9LWJO68g=;
 b=P9MuSAWDZaX+D2DMEDdKnMNv4s1zEHDLCXcVMHwjCzHZmlr3A+PFqDDualKeF3b4t0
 xQ0K90mNWMXDxowHqCJmiJb2VU6n9IbkgRy09WY4g5t6EMXjYPc8hPgOUXKBU/axmzpj
 H47ClZNQvD7CT1reHI2wOrzPyKvWkFBl3Ewh/LOZr748bgoi72ZxRJQeOp3aJkE2kpSj
 Xi8iZRA+n0OV+UY1AIpv+/FhKad4vQLwq8SrEgdAsrIzp443ml6TAFyuFjTvxoDy0iHg
 XsiP/BGY7C2sCSIToTSIYeUpHqfoOttSsjKdNiuRagJda5sZcpDOGioV7tG0OcZKTy7J
 MvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740717584; x=1741322384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3/MIfx773wjuQMH+TAWe/YUS0t51KLheOq9LWJO68g=;
 b=F7PE4yXPndOifFg6VhLj88v2UtQ90hZvJY8x1XOV7GfZFLw4WtiDKnkF7lGjmSSFMZ
 YxBaYexJ69hSRcufMe5OHC9wxSc+YxuD2uQsmm5JIkYKGXUzFVoNMIMocMfCDURcc/DD
 842gRpBgI9I2IBsSCJyhwofdusim0vQDuYTSKlmVJ0Vrgg6NjyiFZ2m2VejkCSCfvbPI
 EgIIEh5I2Bem1EQr9gAGEfVAdD7MzmdHCXqMsr4TeRtq4KjR88UMZlFZ7+VNPkWmoi4r
 EU9cqzdshUj3PhT6Xu/SSjIkcU7y2Jhf+7f2syvuKYvFkNc6wdhDbIOzDyZ0naTq5oIU
 EYeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+/iWUzYiL6p/eo5HADtm4uU5j5MV4i3XFt3bMUqLKH/a2gSxbjokQnXxJMASt7/fm33l7sDP5wtg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeSNhTv+filDtICX+/2ihlzbsJRJpG3FNGW5onenZ7Rad8kIX4
 xWCBsOKYEMmORj8WvlNionCmdUSwWH72hr35G58pebQXgp4zUlw3PcikBBeof0I=
X-Gm-Gg: ASbGncv4XTOBihUnzXIsCwvmJeaY2FPF+BHKmw/J0yDcYTTW+UML7FJ1p74rUaZviIS
 SMexOWVsy/J9e6/brKU34uZucHvRcx3ECERT1aFBdParbzNtkVmBf8saqAHrMX9swaEcu8r4mJE
 460OqX/di64TRLK0OI8LTSwgTes3nj/aVjr8X+gIrS2Sny7zRkopf/akWWHeDBgGI/qWohUo+hK
 G7PPz8rGzUCdkmuo+kHkaCH5ArUNbIjRAVCVNR+2eV1YVvIFICvvmyCp2UlRGMxPxJFoEbTcphH
 PHZZ6KhQlOx9T9dEl1IbXiiWfK0koWFQrMvMltft6xVpPIr1Pkl5uspTbyo6ROSSd4oDdxtEalM
 jA4R1AA==
X-Google-Smtp-Source: AGHT+IFzdRDUvFtdJ8+IGgeDJSTgkwAGTDf8+ZHuGxd9RaHvWBONVJP3iDWwDWh9JCasSnbBlOn/nA==
X-Received: by 2002:a05:6512:3f04:b0:545:2300:924d with SMTP id
 2adb3069b0e04-5494c328342mr684654e87.22.1740717584159; 
 Thu, 27 Feb 2025 20:39:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443cd032sm348540e87.243.2025.02.27.20.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:39:42 -0800 (PST)
Date: Fri, 28 Feb 2025 06:39:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <ca2xiobwbga3bet6u4ktsyo62p2l7vvzetkyzkr7ovu6soo4fb@uprexbwa7z6w>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
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

On Wed, Feb 26, 2025 at 08:31:02PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++-----------
>  3 files changed, 58 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0a053c5888262d863a1e549e14e3aa40a80c3f06..9405453cbf5d852e72a5f954cd8c6aed3a222723 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1366,6 +1366,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * @state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +	return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d09e11a43b9b4cf4153 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..d1d6c91ed0f8e1c62b757ca42546fbc421609f72 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate;
>  	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	pstate = to_dpu_plane_state(plane_state);
>  
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1142,24 +1136,49 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> -
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(plane_state->fb),
> -					      dpu_kms->catalog->caps->max_linewidth)) {
> -		/* multirect is not possible, use two SSPP blocks */
> -		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!r_pipe->sspp)
> -			return -ENODEV;
> -
> -		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
> +	num_stages = (num_lm + 1) / 2;
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
> +			struct dpu_sw_pipe *r_pipe;
> +			struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +
> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
> +
> +			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			/* use solo SSPP for the 2nd pipe in pipe pair */
> +			if (i % PIPES_PER_STAGE != 0)
> +				goto use_solo_sspp;

With this in place, do we need the nested loops? Wouldn't it be enough
to loop through the all pipes in a single run, as this condition will
force solo SSPP for the second pipes?

> +
> +			/*
> +			 * Check multi-rect opportunity for the 2nd pipe in the
> +			 * pair. SSPP multi-rect mode cross mixer pairs is not
> +			 * supported.
> +			 */
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +				continue;
> +			}
> +use_solo_sspp:
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +					pipe->sspp->idx - SSPP_NONE, i);
> +		}
>  	}
>  
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
