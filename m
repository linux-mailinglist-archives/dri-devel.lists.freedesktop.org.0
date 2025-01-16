Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1DA1355B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8838810E8F5;
	Thu, 16 Jan 2025 08:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S5nomleG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9010E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:32:25 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3061513d3a6so6340781fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737016344; x=1737621144; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JELxApQBYXscs6o4pzVvERT8kCwa0GBmZxwst9tiL/4=;
 b=S5nomleGH/QXoql4prefr4ocZhhtd7F2ZjK/Vat0H/KmUvt7KrfP68vO3DOmk93Ed3
 SXZybRMmBGEte/NKiVy3cXMsF090GfdqXwEx8TwJWqs+0Dp2dJybNtLLxXfSugDQWUFL
 G3wCcT3KNxW5yKoCPFlbrm5N+Na4OUpTcYPn+y1DDpxZtMVUcnTwbKLAr8oQg24s8Kz9
 Cm1BxMW13EIWSz/NUQYe+BQ3oJFyBa2RINPPyBl0oPXyTYkHvfo4Uvyoi/k1qMKGEO13
 BjcJ4bHhaqkRDt+JDQXau24A9TmUkI09TDswwck7amjurQYv41cVGG76bvPqjnOHCuKQ
 gBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737016344; x=1737621144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JELxApQBYXscs6o4pzVvERT8kCwa0GBmZxwst9tiL/4=;
 b=dM/VFT/Jsxb2XWs+CB2paO6YCdDq7mutQfwrQvTAnerlj6r0ai7XbIyJDw/zOeECAG
 iL5OEpcXIBjb7qWon9KeVgZ7/p6gpqIpxmda/+QYOxYgBzzcwgsPHO4NYPpPW7s50ssD
 pdX7njETrAmHkFQXRWboMnHkYVSosgXcQwQYV4xgs8Fh0aVfet4mHmT4UpR9Y6ONz+i4
 cgJNcvvfVhYTCIbps0FUuDJmF34YxHf4lkOknezaS6XGZ20L6FL/nn1nGRBGnCkUNrhJ
 yESMFfIrMVKv085OtaJiBXyuXSacbGBETtzhZNOYE63OjtgBJlsp+iRrSPZOeHCyX7jn
 N/ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuL6dwleTN5L6nOKBO9RBeJBLB36l2DednzN50bqn7f16ZyAMlk5Xx3VnPuLgGNjxDsNHEDfZgUNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0coIaUMvjdpLtSx9EIy+KGbg0kTlTmXFTdQFEfafEyVv0vMHW
 BzVGldhFH/IVQKSXRoB4aCcO3qLdJ0n1886sIrY0KcRm6NwEV1QFDAgkTbetfT0=
X-Gm-Gg: ASbGncsAJkG0yVXPBiKud7FDDVQTZfnqxuAN9XaJS2rqpzqJuA3zmxjHEsoT0h+vlu0
 /f/MQqXQEKjWbJAJR59dzHg/kl+juzz/eYqWjPeNSUDnVnQRuhsOJr5nXTYmV47SsBAQ/x0fAZV
 vRFSg9jsYdhkKUsLtF3UGd3aONgPwPjWGe50bVvHMuKec4Tup6QnCRt1vd4LEmyrdPp6QlUM+/S
 mHLikSdqYvHakgSXrcusmEzkOVeK1Bmlb4IZLeicdEYUyK4TbIC2GRtP8dZHCLYgpQneq+RgPjX
 +0yXBAbLTJgbALeW7YJTujQ1ocTC/qbAB9VY
X-Google-Smtp-Source: AGHT+IHf1QkPHEH+gYTiHUprZLlRzENM5Wzn0GjuOJKVCo+ZX8LZ/i1daAtaAZX+OpWKiFta2uF9Pg==
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id
 2adb3069b0e04-542845b9480mr9657745e87.14.1737016343789; 
 Thu, 16 Jan 2025 00:32:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0613sm2277202e87.181.2025.01.16.00.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:32:22 -0800 (PST)
Date: Thu, 16 Jan 2025 10:32:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> enabled.

Why? What is the issue that you are solving?

> 4 pipes are preferred for dual DSI case for it is power optimal
> for DSC.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 29 insertions(+), 14 deletions(-)
> 

> @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  
>  	/* Datapath topology selection
>  	 *
> -	 * Dual display
> +	 * Dual display without DSC
>  	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
>  	 *
> +	 * Dual display with DSC
> +	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
> +	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
>  	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>  	 *
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
> +

irrlevant extra line, please drop.

>  	if (intf_count == 2)
>  		topology.num_lm = 2;
>  	else if (!dpu_kms->catalog->caps->has_3d_merge)
> @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  		 * 2 DSC encoders, 2 layer mixers and 1 interface
>  		 * this is power optimal and can drive up to (including) 4k
>  		 * screens
> +		 * But for dual display case, we prefer 4 layer mixers. Because
> +		 * the resolution is always high in the case and 4 DSCs are more
> +		 * power optimal.

I think this part is thought about in a wrong way. If it was just about
power efficiency, we wouldn't have to add quad pipe support.
Please correct me if I'm wrong, but I think it is about the maximum
width supported by a particular topology being too low for a requested
resolution. So, if there is a DSC and mode width is higher than 5120
(8.x+) / 4096 ( <= 7.x), then we have to use quad pipe. Likewise if
there is no DSC in play, the limitation should be 2 * max_mixer_width.

>  		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +
> +		if (intf_count == 2) {
> +			topology.num_dsc = dpu_kms->catalog->dsc_count >= 4 ? 4 : 2;

This assumes that the driver can support 2:2:2. Is it the case?

> +			topology.num_lm = topology.num_dsc;
> +			topology.num_intf = 2;
> +		} else {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +			topology.num_intf = 1;
> +		}
>  	}
>  
>  	return topology;

-- 
With best wishes
Dmitry
