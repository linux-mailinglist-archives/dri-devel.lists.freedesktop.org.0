Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB69667DD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD0F10EA9D;
	Fri, 30 Aug 2024 17:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rk+CQz2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2C210E0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:21:53 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so2776058e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038512; x=1725643312; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iKvLUae2xB3S1jTpjyPhws243myNsfzJ9gMn+BzbGFc=;
 b=Rk+CQz2rAn4U3D7pQ+zj19mJYcee5LNkzME+2U5iZ+A/TN6JGHElwMq57XyIofQZw4
 Dy7fjT6ImaokyxGl7m1rueBUNy/gW/3uOeT17aHvhjApOKkF+5KeKAPxmHlOzCjQPp/z
 0RJ2ppBy6JqskWQASjcFaD8/WTkt3daGYVINKTj4QLFqovADFTPD+eo85fFx5Z3gvKno
 cP1HdQ78LBZoVDHxz/r7EkpiAokh13MfzUamx8d78TPxBeReI0+r3CFmXwY4Pp+Jypfw
 08zYzqJno3ln8dJiqtfClEz4vRtLQEevwYP4JMPAQnr3CryAW+EdNsSCOh9QiFQur4ge
 9mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038512; x=1725643312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKvLUae2xB3S1jTpjyPhws243myNsfzJ9gMn+BzbGFc=;
 b=czmymdUdc4Gb9unAcJ+UCjZq6+kNWZQ/s0yzJWa4izgvaJsH8u+9YyovLfuk74CfCd
 dnKfN3+nUJv7y6p44arT7UIe9nAIhMWWm71j3/eLU2RoMOiOx8Mo5MdO6ba2rmlj1Lfq
 ZzDYXHkp+yBPdYvl15tvCo68Sjiylcm+LhPcD0yGd3VEipsEAye0iJnfL0Y66l4cqC/m
 Qt+8T9jGft9iJVD5y7OFNmjTCnDcZJu+qxMRx9MzO9WibWQii5+RENRfsNN7P5UP3+GL
 K+o4j61pujzDzI0zNy+RaRCwikrklwQWxJTPd6dy0VcJQmLpnrgoQE5UFQQDGeh4uuNr
 4ZOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4F1troqNQ8rReV9HQscdb9Zf0+QRxdhfZKgAzV4PfqhazQMO7SkAyeGJwGyhXV7VU/hfl5ieHB94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZXn4HEQI3ggW9Ac7CuDUnGRYUbL7FR9lUPpUbR0nbQkb5o90e
 POoE9xyHM2IswjxRE+aRmPSRN48RtpFtNaSjkGkipYTU/7peqRVzTQq7/yxGSdo=
X-Google-Smtp-Source: AGHT+IGQmODpu1GQhb9jQykvQPuBtYL1ZQZyZuIet71ZlcXlfEWqjUwFaVnHI4wGv7pyRo0vvIcGxg==
X-Received: by 2002:a05:6512:2804:b0:52c:d905:9645 with SMTP id
 2adb3069b0e04-53546b32d3dmr2187319e87.13.1725038511271; 
 Fri, 30 Aug 2024 10:21:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084edb6sm697900e87.283.2024.08.30.10.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:21:50 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:21:49 +0300
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
Subject: Re: [PATCH 12/21] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <f5xu7qvlkcghu4lxwhwsihljjzvy33rte3dtskcqpo7dl75pk4@gehpioc43lue>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-12-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-12-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:33PM GMT, Jessica Zhang wrote:
> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> to account for concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 11 +++++++++--
>  drivers/gpu/drm/msm/msm_drv.h            |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index bebae365c036..1b0cc899e8c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1176,6 +1176,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>  					    &crtc_state->adjusted_mode);
>  
> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> +
>  	/*
>  	 * Datapath topology selection
>  	 *
> @@ -1189,9 +1191,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
>  
> -	if (topology.num_intf == 2)
> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
> -	else if (topology.num_dsc == 2)
> +	else if (topology.num_dsc == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
>  	else if (dpu_kms->catalog->caps->has_3d_merge)
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 738e9a081b10..13f84375e15d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -384,8 +384,15 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	/*
> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> +	 * control path. Since only one CWB session can run at a time, hardcode
> +	 * num_ctls to 1 if CWB is enabled

I don't think that havign one session is relevant here. Just specify
that we need to use a single CTL if CWB is in play.

> +	 */
> +	if (top->cwb_enabled)
> +		num_ctls = 1;
> +	else
> +		num_ctls = top->num_intf;
>  
>  	needs_split_display = _dpu_rm_needs_split_display(top);
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index be016d7b4ef1..315895937832 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -88,6 +89,7 @@ struct msm_display_topology {
>  	u32 num_dspp;
>  	u32 num_dsc;
>  	bool needs_cdm;
> +	bool cwb_enabled;
>  };
>  
>  /* Commit/Event thread specific structure */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
