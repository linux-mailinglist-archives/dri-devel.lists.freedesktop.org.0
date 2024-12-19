Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B411A9F879A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4676710E4B1;
	Thu, 19 Dec 2024 22:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cAo59qTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C1A10E2A7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:14:25 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3003943288bso13261851fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734646464; x=1735251264; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lp/0WgoJMYBw3pbcjem9wtwnD12qURoBMg8Gz+u8iz0=;
 b=cAo59qTjR6bmbiZdnwqXsFF0L9RGNA1Ja9uqRt4Pa6KFWB8p7uJPo1Kl5ZRKWsTPQd
 F58qYkiIkbVNOT22qb1wrwqlAtn+zTWYDqHWwB84Bm6t98c0CNtMwxS+zOiXy+fMWIeA
 lcnyF3rBWqO8SUq3yDcRVGgqpS110GRTsEm2Rn78LbY+G/TfvgpSSOUUHAEuxHRgWaOv
 WVgVtTyv345cSYhwn3MUxzTNv+zMHHUcrBr28Jm/PAZXV28ozJWWE4z8gGSQueSitFnK
 OiK19sBFnY0syIUb0cro/ot8ASIpcvLNowTDw/cljrX78AR5oNYbKdFZxaUBHeJM69BP
 gBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734646464; x=1735251264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp/0WgoJMYBw3pbcjem9wtwnD12qURoBMg8Gz+u8iz0=;
 b=Nfk0kFP7ocuiDMZ4CB+BxsGb0JXnGHLEwW2q9T5LtaBjqbRcbOMjQxZZ2nGGDRWk6T
 9m1+ayE27vkVNcH/CXZ8rgtsaWeSTdgUfaD0k0f1Tx+S4I7BXcUnoWaDYcgevL6wAN/G
 tj5VaKga/TsZxLYad6brLalF978BCiGcFeeQNS9ihd3dsjz5FUqT7HXEn9uoOlgovUo2
 7pUR4SAHXQ6OGVxCPDZQHc1OsC6pWUjIsg3jSckB0D3wkFkkfwF4oqn/Wa6KbTaCLkq+
 VdLeTFAwKBp4TRAu1IIrjRRHS0HiAWix9d1KWZwgIvcAHB83LUwYMjWc3oNIFo9fFnmA
 zQJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd/Ni6sgEty6RXJQro1u4bVi5e8yjd7sjDxe/gwOErGCOFpOJe+pyDCZG1LWnwKB9g2ghRgOfXOPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwGvEWRJkBawoXw0dkgIVUQdAcmpuq6QOke9HpJ12lCiH09cF0
 dr1yN6GHvVaNeRT6iFk3j3eJf8Z22DxlCbEdGWAB1y7Kpi5ICSChJgLJWtsBN8E=
X-Gm-Gg: ASbGncvWEc9qJuMti5T8M0Gm6m/rP7bUZQUY5DkLD9+tiTe1sGR8o267MkRaTekGSHQ
 Zbxj1OVtia62RhCsoeJAZtgr2F+kgWVtsiwa9M6sUfKA3IclhC9jreG72Mx5f8pibaclYYQb2KZ
 uCQPncjCuzipqYCeBtx+lztfl1E8VdZ01cw0zr87l5S00JRQu+yfZvxBw+yey4YGXy4xzhu8yVD
 /NogUDuSdF8butcrbCvwNVWBPKZHyqFIUIOaUG9+2/A3x6BHghGprfDgznawHnpn2qYVtNQpNBt
 rR/rerxVx3i0QBqcd7A13xWv0iVo7r4laVPH
X-Google-Smtp-Source: AGHT+IFNifr8Kzw3iPEBcMsxUT1SldWwUcNVnrkSzCCYrK96VGVfXM2/WECOPOwNTnRen4dFc2DMfw==
X-Received: by 2002:a05:6512:234d:b0:540:30df:b3ea with SMTP id
 2adb3069b0e04-54229533d4emr96410e87.15.1734646464146; 
 Thu, 19 Dec 2024 14:14:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382fa6asm286103e87.229.2024.12.19.14.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:14:22 -0800 (PST)
Date: Fri, 20 Dec 2024 00:14:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <auo3266g3wt6q4kowutx7tvysqrgr2v6v2kw4mnnzd2gqbxb5h@5473wmczjtjc>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:23PM +0800, Jun Nie wrote:
> Add the case to reserve multiple pairs mixers for high resolution.

You are not adding anything.

> Current code only supports one pair of mixer usage case. To support
> quad-pipe usage case, two pairs of mixers are needed.
> 
> Current code resets number of mixer on failure of pair's peer test and
> retry on another pair. If two pairs are needed, the failure on the test
> of 2nd pair results clearing to the 1st pair. This patch only clear the
> bit for the 2nd pair allocation before retry on another pair.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index cde3c5616f9bc..a8b01b78c02c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		lm_count = 0;
> +		/*
> +		 * Clear the last bit to drop the previous primary mixer if
> +		 * fail to find its peer.

if the driver failed

> +		 */
> +		lm_count &= 0xfe;
>  		lm_idx[lm_count] = i;
>  
>  		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
