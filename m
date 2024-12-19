Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8269F877C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFA310EE02;
	Thu, 19 Dec 2024 22:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z1euAoco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776D10EDFD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:06:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so1284107e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734645985; x=1735250785; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sadvPQGyZFnk5L8H9OLf57JxFXnM4lchsSRTPwpDzuA=;
 b=z1euAocoQ7DUoxBWzrjcCbxts/N+dD2JFcWUD7RpZUX6Obcg8ZpOy5AKmGHK4NjHNk
 Bqjtk3kknJXLu31X+7FW0CBvjEZUqiBheiSK6KiQR/w8bprMJpA70IietkI8l747UDfG
 bjpyvz8u0jYw3t0/F7lIzfcliaDCSuL7FnxSZiLaU98IvIkAei3BGINKRjdPrlOr6jZ9
 sKqNzGig32KgF4nftFkqRFlQaGU+CU4N88L8DG97bD21eMQLYQXUklZDnL2D9M5KIr9q
 yabi5VQQcSUW3a3j/vqL6FOGKeM5JTHJX5sF0zQOuNoyxLB+/bdubBLPPBDfxZ4vwptc
 MG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734645985; x=1735250785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sadvPQGyZFnk5L8H9OLf57JxFXnM4lchsSRTPwpDzuA=;
 b=Ks3lec7upJWBJ+Ljz0rQ+3w44CGi5DOd83Mfhesq1bP67lh79dSiSQheUb9bKrfIGi
 1em5glhqciPwniBWpEK+qfg+5CFscTWsUUbfAdjn89vOwMhKygGUF76SKaCgXYCOCRWv
 f/IigHhH8QCN+sSbgTSrIZOMLYWUq5mHqUXahj0w8FW46bLwG9zbgng2TpHzW/xr2Hzc
 /RZhNBr4sGMC6VvctJ5NEpScxGkxEovc3NsSY7H0LysO3y1fuU7gUvFxcxczG1045ZkU
 h2yU5/xh6TxKuMscP4D1kmQLQ49t4flsNd9YWANL7CyHVy/yCgdwPVVOqaaLFYlYZ7Qo
 ZjtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUdNKQ0oHUnD6tF7pHqOpPo1ZQbpvFEAC3J+caPYue397StOR6q9BwmvLuYik2rp/LYQj0vuhRDzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4gO9l+XiP+yac3Tqi0gd2ml49Y0i9bKkZrlVvvpp2muwShzEZ
 oxvtMu/+KSruE/BMQJQU3hiX9i0vWVwSPek0rxPbFfSMiDKyhBqWymteSlkoqEs=
X-Gm-Gg: ASbGncvWRPoEUEGnuzpMTZxlDYqCPdL9Zg9ZVoDFiI/KjsxQ/5e26zZ0gWXfB0GsJ5Z
 TdLuhtpN9f2+NHGtwtohRu39a/42YyKcKfz98Ab4Az9b4CoCjM/xah/03hgrV+cOsg0yG8q9J8p
 6D2RgA3S0u3MhVzx7vZQKEAv57BQqivUc9U/By6lOpjXe2zng3ewbBpQQ1k1dkpuQ4ASO7PDRiu
 LrtF9y8KnA2YfnK4KoTwBIGjq2jl71mgvkwxhsPn5pxVp9Zkufm8RH5ohVYzTIekyjZqmQGTjJ1
 DnKcsMhQiMzvVDr5l4YKblxWwDvNrHA+SODP
X-Google-Smtp-Source: AGHT+IG/oQ8IpfK5v75iR85HF9dLqNh4xH59OagcfgNjPICAJFcqOQUIpt3LAxhSNqh7VkOKFn3u9Q==
X-Received: by 2002:a05:6512:3a96:b0:53e:3a73:d179 with SMTP id
 2adb3069b0e04-5422954064dmr80477e87.31.1734645984651; 
 Thu, 19 Dec 2024 14:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adad6dcsm3412371fa.60.2024.12.19.14.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:06:23 -0800 (PST)
Date: Fri, 20 Dec 2024 00:06:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/15] drm/msm/dpu: configure DSC per number in use
Message-ID: <fut2yuxo7ixrbxg24n4azeuyxury5i2ggcbo4pfvfxnp22wbs2@uhulitajdrb5>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:20PM +0800, Jun Nie wrote:
> Currently if DSC support is requested, the driver only supports using
> 2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So let's
> only configure DSC engines in use, instead of the maximum number of
> DSC engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 650df585138cd..cc23f364dd080 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2028,6 +2028,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
>  	/* coding only for 2LM, 2enc, 1 dsc config */

Is the comment still relevant?

> +	int num_dsc = dpu_enc->num_dscs;
>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2039,7 +2040,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	u32 initial_lines;
>  	int i;
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +	for (i = 0; i < num_dsc; i++) {
>  		hw_pp[i] = dpu_enc->hw_pp[i];
>  		hw_dsc[i] = dpu_enc->hw_dsc[i];
>  
> @@ -2068,7 +2069,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	enc_ip_w = intf_ip_w / 2;
>  	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>  
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < num_dsc; i++)
>  		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>  					 dsc, dsc_common_mode, initial_lines);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
