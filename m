Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532F9CD9F7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 08:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C443B10E167;
	Fri, 15 Nov 2024 07:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c9D90FYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3226E10E167
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:33:48 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ff57619835so13790081fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 23:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731656026; x=1732260826; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VXUA+xFQvFcv5jH0QqKITZEkbXxSgGAOHInFqY1wEGU=;
 b=c9D90FYxO+s+yC6oWUxXbh9xnJ5WJpMxcKPy/qBHlE8ssTsaqkX0uwC7c50YEOrQxr
 q62yveLoXc919DU4/9RcjgwlpcakE0JIdJw1rLUINaMcBjkPF3/CCxaYGlVMZyzPFHTH
 4LbRtcIqOAzrD44pYVSQQ6mdi1NPt0DVy/nkX749rHKONanDQ9oCvf4/BYzpjTit+Zzh
 xHCYcv6BskwVNGUnWkn28DiMXM9eNvKzQCW5FLzsnC6vATf/kCqfwZa22Qps6Y4Jd+eF
 M13bZ+zOD8491JiKfVNQmshRQLRLLx+24rqNMg2Ijdwt25YGIiwC2qTRQGXLXemTT0ZE
 VfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731656026; x=1732260826;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXUA+xFQvFcv5jH0QqKITZEkbXxSgGAOHInFqY1wEGU=;
 b=DqmjR43f464etrrAMRHJKpbLLgXGeerhcitWvJHa+dpzYp9t3LyL1NhcrDpBTn63Px
 9Bdpe2CywE3CyBrQ/OGfmLe4NfdaQuaFrkQ2W+LieQlOuimoQJqzShMjJJD65IwBWdRO
 EqjhHMZ6cNxUjwaszWtuDipy7QMQ76OdX5+iLjp+7VRAOQnsgW9RcQve3inLWnLZQP7z
 3MKbfzCuGMrGWrF0fkdwHMUZOVEvjFkpW5GRWvUQ2eKsTQHhNKP1wEZIqQnGuxIJ2Dhk
 HzdM0pEr90GYeIBU8pq75TovHEjpkJFgExIa10nH16tSJXNswnBFd3K6ys6jCOdsim02
 u+1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEyA0dNkYoTRns4GkM3jivy0Mr8nh/YQMSOBDNlJMttaIe/wFdnp4FSyZIZUW/FHulcuvMTSRA73c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIGWzua+NKdPzW+P7oKYG8HjYTgoEB35sRPVTaIT35GLZvfGwm
 qONR5sZTzCu5E+8TUW4NQAO9IaqssoU8yxeIZ4zyAEw4BWVz/lom23rlonBHNv4=
X-Google-Smtp-Source: AGHT+IEG2HyAK/keKdAkffHHfxXY9upS6+zDWPBk8B70ezx4vv7IgjX67R5jNW80lSYbongEkvCjpA==
X-Received: by 2002:a2e:a883:0:b0:2ff:5d45:883d with SMTP id
 38308e7fff4ca-2ff606937e2mr5432671fa.13.1731656026282; 
 Thu, 14 Nov 2024 23:33:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff5aad77b9sm4273791fa.73.2024.11.14.23.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 23:33:44 -0800 (PST)
Date: Fri, 15 Nov 2024 09:33:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
Message-ID: <nw2sqnxmhntvizzvygfho6nhiwfni4xfquwst5gd5g2tel6pnr@h66d4mw46jcf>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
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

On Wed, Nov 13, 2024 at 04:48:32PM +0100, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, let's declare the Bus Control Modules (BCMs) and

s/let's //g

> it's parameters in the GPU info struct and add the GMU_BW_VOTE
> quirk to enable it.

Can we define a function that checks for info.bcm[0].name isntead of
adding a quirk?

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..014a24256b832d8e03fe06a6516b5348a5c0474a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>  			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION |
> +			  ADRENO_QUIRK_GMU_BW_VOTE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a740_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7020100,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcm = {
> +				[0] = { .name = "SH0", .buswidth = 16 },
> +				[1] = { .name = "MC0", .buswidth = 4 },
> +				[2] = {
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,

Is it a platform property or GPU / GMU property? Can expect that there
might be several SoCs having the same GPU, but different perfmode_bw
entry?

> +				},
> +			},
>  		},
>  		.address_space_size = SZ_16G,
>  		.preempt_record_size = 4192 * SZ_1K,
> @@ -1424,7 +1435,8 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>  			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION |
> +			  ADRENO_QUIRK_GMU_BW_VOTE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "gen70900_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1432,6 +1444,16 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7090100,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcm = {
> +				[0] = { .name = "SH0", .buswidth = 16 },
> +				[1] = { .name = "MC0", .buswidth = 4 },
> +				[2] = {
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(2),
> +					.perfmode_bw = 10687500,
> +				},
> +			},
>  		},
>  		.address_space_size = SZ_16G,
>  		.preempt_record_size = 3572 * SZ_1K,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
