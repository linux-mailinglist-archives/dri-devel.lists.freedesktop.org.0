Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD188A1353A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EF510E8F2;
	Thu, 16 Jan 2025 08:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eZnisCCi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3475110E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:20:51 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5401be44b58so717783e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737015590; x=1737620390; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EzvEM6Sx/Mz/fcLQKNf1rXALQX/HnytzEqDjtX99KKo=;
 b=eZnisCCi2vwE0pjiZIXFtvopLIqMUJ8mii4CDbDUdTXxMFKEwEdXrDjIfEJr3lK1TL
 FyNSoNQkEYTxgKkofQEArLca6jH7FROCr3MPh8P8h4PMdjOwfXCM+dFbmVEjcRaFQFvJ
 TTwmPFmZyyp/jSYhibRBfuhH563EmvVAH3HQG4KUKOGbm3UJOJ5Mlg2fvymAKr5xhoik
 V9jzZHGE47CEe0FtlkpZK4H+SUZQ6mzKxg1iKfoXUkuvRUc7vkxq+EkWfE/j5kMjlNc9
 pyVxp3IoeUPbMjk0kOmteMwDtVEkb/cPjDGlRvTDhaAHgRwMtUlFUT404i6JzS7WIX/g
 pUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737015590; x=1737620390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzvEM6Sx/Mz/fcLQKNf1rXALQX/HnytzEqDjtX99KKo=;
 b=qL1wF8zcMG/bnNYxOoIdOgu8AL+lzRIEJ4n2o579LhPLoNxqiUw5TitG8YuwLCXRpL
 +DEGGiKdyKmF+rHo4SN96o4eCyKRxDeHy0mFm71fIR8FAJO8mMKl5PjLSYHOR3FrHXDL
 RAkByyvjYFP6nhSongbj8/y5h2JX/7U4LWbr20e/Sgf6OhooljIO9RiBfTUVJkpaiYPp
 99574itMbIHyG9FRoe4soR5w51yxe1YQqX4o0UY8bkgdGKszeYSZGph/C3yjuNDxJW8t
 xUaQBwKGx7L4O4bk2698cL45/SIeQ23ATQGU9On2W+tdGPecku8j6x3ioLofFQzJu0ti
 DWYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbwguQaF0riMclXGKrvOYUlzO5mHUNHHYeQVrSNWOBfO0g5wOpA33D34RxPrba+23HhIUIUbMtSRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe4P8w5wOC5avFA9r4hEQuw0IHJT9dP2f7nPtAsMhOCpBhGmu/
 em2jxgilWZfeCPFeTMAMHKmwVfD5YfmcCS05iF8QjYzOk+zHOgy7UdQ5ikzZo6M=
X-Gm-Gg: ASbGncsrSHrdi/SC7L4OXUAhMowqturRX74DdljDNnLa7LRK9bV0xSpAif8qfsiLi7w
 2GwlyRZJm+NUuo/bGfrNpF8bqmfmhu3+elSUGNFJ8b2w6cTl4QOlDSWkBXlvnSpWZov+QSz92Vc
 T6JWIGoFEmqpooNkGjy2PeTRPH1I77c0RsvrRZQkYYmHhA+Phm5NoltXDVji/vKLwQtBfRZOukx
 j0Dph4MlbqHDL+Iy/NwiMwF7dtUx/AI+RFoAyNJj1SWkDM9tB1EXC/BhgA7Hg8OLU0PY+jSRGrp
 OJYxa1agdyaDjLC7aTPVsc5M0+GUmpVf1fh3
X-Google-Smtp-Source: AGHT+IEW+BLFAKp5RZ8kJKPMw7gbZ80UVcR5TDbEC3UmcmTe61NigrFsJGQQDkAseKY0uUZNPZhGmw==
X-Received: by 2002:a05:6512:158f:b0:542:28a9:dcbf with SMTP id
 2adb3069b0e04-542845bac70mr9816333e87.23.1737015589596; 
 Thu, 16 Jan 2025 00:19:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6a5bsm2234637e87.129.2025.01.16.00.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:19:49 -0800 (PST)
Date: Thu, 16 Jan 2025 10:19:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 15/16] drm/msm/dpu: Disable SSPP multi-rect mode for
 every pair
Message-ID: <riau5d6ndc7ujjyzgbdzwybzigot7xdg6xweewqmnsmlr4xws2@zwcg2fdngr55>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-15-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-15-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:04PM +0800, Jun Nie wrote:
> Currently, 2 pipes are supported at most. It is enough to check id to
> know which pipe is in multi-rect mode and disable it. Multiple pairs
> are used and need to check multirect_index to decide what pipes are in
> multi-rect mode to disable them.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d96f4405a4c26..d2e0fcfbc30cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1480,7 +1480,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  		 * clear multirect for the right pipe so that the SSPP
>  		 * can be further reused in the solo mode
>  		 */
> -		if (pipe->sspp && i == 1) {
> +		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {

I don't fully appreciate this change. I'd really rather keep it as
i % PIPES_PER_STAGE != 0

>  			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>  			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
