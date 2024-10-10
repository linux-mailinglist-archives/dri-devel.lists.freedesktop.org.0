Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C41998745
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEAD10E8ED;
	Thu, 10 Oct 2024 13:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eXzADYQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AF110E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 13:12:17 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fadb636abaso8191011fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728565936; x=1729170736; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8oQ6GD8MQZYcrXheM1dKv/EP5g/yYfuhywKE4ovWK+c=;
 b=eXzADYQaHzJbR+L2u/KIBjtgdBx4j9K8jlGxGiMNgvPE2fnPNIZPCEJFqbYXBFrLFQ
 tJRh+zURp+Ur+pR/jA9I6JZjusqqIEn8Mo/0YIED6XD+xrU157jb4ClxydVn59QTmIPs
 eb7mMWGY3GfhUlsG9ZAuBaUFDVUGSz5VwryiKzu144Uc2BBDfcgdbshRd7hQNMBwPXBP
 ZwBJ4Dp7lzorfGrvpVho0fUxa5X4SRHTJOb9M6gXx+Ed6T++uu7P+zZEUMY1+UUPjVtR
 WsmeL05qwmwJGzrjOJ07uvKbG5MM+/PzBl5+RKQUEHT+IRcKXCe16gHC/r2Y7Rff2/7p
 is5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728565936; x=1729170736;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oQ6GD8MQZYcrXheM1dKv/EP5g/yYfuhywKE4ovWK+c=;
 b=HfEboc1TiXK79I+JJtVkjrjEOVFLjXV4hiami6Z/hNBa/x0KpHUJ8RQOf6Fhcrcx76
 67C7K4VFVtbYIJskhwqXtAxJ+GHHXKGHMeQX8B4DbGUpOPhSMc3f+8EJ4r21V4ez/ZYX
 FIhS4hbpjq20FTTuZ4nnL2fiJoQmxN55TuA4gFU6Jque0Cy/240rQlnPtu6TqAM8muAk
 8QgEua5JFKZx5sepAju+tQi5ADbroYYQwxaPVwwLwJayQ4anTlDHDnyE/vCoPqqDdEY+
 gbhpAFju31/TEmQc8HhNrXsOKJJ9x5kky21zZGQowhr+92TnIotQJpLHLXYCK+r53vec
 1Kgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz+aib+lN0ut2eNSXyWlM7P2y79yHck2uhzfaj3lSG0/mj+G3QD64bdSs8CKrnTHOpXVmWD0NGzJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaCQ/XuOYkaVrV1tmEA8C9XisNeSknBepPq9c07mtO5rIpuoF6
 Z6xrI8n5+0IPMft3PQCC896lk95+Kua20XrN20DN+A3OvXE2dkZ0G9rVPpzMWlQ=
X-Google-Smtp-Source: AGHT+IF3He53CvkRJkxofe5tl8tnrXaXIeMvIqxCeWY4+8hdVEZb6tiIi6SGDk3CRN6Uet1MYDTxFg==
X-Received: by 2002:a2e:a985:0:b0:2f5:806:5d00 with SMTP id
 38308e7fff4ca-2fb187be78bmr39711411fa.32.1728565935651; 
 Thu, 10 Oct 2024 06:12:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb29fb4b61sm403631fa.128.2024.10.10.06.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:12:14 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:12:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
Message-ID: <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:21PM GMT, Jun Nie wrote:
> Update mixer number info earlier so that the plane nopipe check
> can have the info to clip the plane. Otherwise, the first nonpipe
> check will have mixer number as 0 and plane is not checked.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index dfe282c607933..68655c8817bf8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
>  	struct dpu_global_state *global_state;
>  	struct drm_framebuffer *fb;
>  	struct drm_dsc_config *dsc;
> +	struct dpu_crtc_state *cstate;
>  	int ret = 0;
>  
>  	if (!drm_enc || !crtc_state || !conn_state) {
> @@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
>  	dsc = dpu_encoder_get_dsc_config(drm_enc);
>  
>  	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
> +	cstate = to_dpu_crtc_state(crtc_state);
> +	cstate->num_mixers = topology.num_lm;
>  
>  	/*
>  	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> @@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	}
>  
>  	cstate->num_dscs = num_dsc;
> -	cstate->num_mixers = num_lm;
> +	if (cstate->num_mixers != num_lm) {
> +		if (!cstate->num_mixers)
> +			DPU_ERROR_ENC(dpu_enc,
> +				      "mixer number %d is not as expected %d\n",
> +				      num_lm, cstate->num_mixers);
> +		cstate->num_mixers = num_lm;
> +	}

Is it a possible case or just defensive coding?

>  	dpu_enc->connector = conn_state->connector;
>  
>  	/*
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
