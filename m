Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E4A38C46
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881FA10E5C3;
	Mon, 17 Feb 2025 19:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zHL5TbuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9912B10E5C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:22:48 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30920855d5bso34251851fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739820167; x=1740424967; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S9GjiPamODZZMscfrw9WONv6M/bFOtmRPiKnVBr0uxQ=;
 b=zHL5TbuQ/9mDNXnWtgMxUqCeszvoXr6tKDiE5w+exlKFLCyhQs6aJtG1Yi4t/1RhUx
 5bla9NXhGp0fXfhk7XL8Q+Wh9wkt+FbQpCN43TMVrvdpCFe38hWrhTEWPZuvG0NALVXJ
 tHUe2qzl8GackHCqke7qHjiS628xWFfVC51VpGMv8sJCbEwpyw7DVi7gOi38U6GPuphO
 WT7dC1znu1+8B4zu2GPLQP20SqD2uz2SV0z9j91koVxwRhyJIAIanjZhIs8x55AV/St/
 mOzSMdfOHEK5fP6FoVvl28ZcGHzpns6vBnlJFqdr3etkYK3a35AtSNA74ijq83mR7Yit
 YJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739820167; x=1740424967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9GjiPamODZZMscfrw9WONv6M/bFOtmRPiKnVBr0uxQ=;
 b=DayLLBLBZ/Wcol3EpRqFElCfooa2GkzXJ+3DRYrj5wBIUWo8nKs+lLQYL1mZhhns9L
 BH7x2XAoH57jbF8xWz3Uitt+aFaIqlK7IrHYYvjfMFDcgbOMPGlE82a4yB3upNgEinsN
 9q4yHNrruJNmEfDyPrVIyJSzewIkTOEp549X/+FBOHaX1r3ba9JUNLZZdF7bE27tx3OY
 Mu21EZLDL6GMMjdjroO2+OUIV2k7mgbh640l2eTimdVXO3MHl0cCWI2WLR1hkTumzc3e
 B7tvll4in1v3UjMpqmoiM3V+a+YXHTN77WTV5cAB30mzh7QhveNU9zO7kHKjjxQfeE8p
 Y1vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7wepT+UaJ/oo4xASF9GNQ6yUDmt3aXiHFgk26HMRrXvMRomHU0PX0R2GvPiFLgKoCUFkgWKKJ4mA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySHtqliNMa81AckdJ1RBUn7kTpdBeQREcU3rhPNuhPamf/8V14
 JX1Br5AsZg4k0V7gFcjBbdoVSPgMHoO8D2NDYP/Fq7ElXYCSpJ/F8zRwYjXzebE=
X-Gm-Gg: ASbGncst5+yUDaK/V/eRp5ZeLtA0mrxDr04BhEaM1QA2bK8eQvmFNIcj5lhBfGund13
 SXehG6ChKRLUtbj3sIsV12a+7VPYo7ingNSFX51TF6zeDYf6I8i+5jslc/WfzspvAdVLD69bk3J
 2JHWpjqn7FxP8bPz4ZOAdAgAMZmt+SrVDExTui7Ez7U52VxGb2pbdnt+GuOVUr8OWTWlZekqj3e
 9EJpnYGx+rKhJ+2Fg9kJihmSG6p018kqvtrFaPkP1Fo7XmwdBGvoi3JtaclyrbWr77RSZtIzFfi
 WsMgchJSean5whXTQIYD4jJs10wPUG/FSukwGobO//qTyZ8ZwG2EsiGInvb6DNPFNyuBnCQ=
X-Google-Smtp-Source: AGHT+IFlV1UP/wKVxhbwSwQTJ2SEmKZ4/rOsrk8g+x6pZhmGCoSOJCnGQ4bptI2YGeo2RC0BYkCcnA==
X-Received: by 2002:a05:6512:108f:b0:545:16a8:6a5d with SMTP id
 2adb3069b0e04-5451dfc13a5mr4931403e87.2.1739820166729; 
 Mon, 17 Feb 2025 11:22:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452cb59c35sm1293957e87.203.2025.02.17.11.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:22:45 -0800 (PST)
Date: Mon, 17 Feb 2025 21:22:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 08/16] drm/msm/dpu: Drop useless comments
Message-ID: <w3i4e3hkbemmjdbzp5kevxouv4smftsnzml3wa6mkd2e7mzmi6@op2uaa26kz2z>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:29PM +0100, Krzysztof Kozlowski wrote:
> Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
> SoC because it's duplicating the actual name of structure.

Historically there were more SoC-specific data, now we are really
limited to the LM sblk. Maybe that points out that we should rename
those to drop the SoC name. Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>   * MIXER sub blocks config
>   *************************************************************/
>  
> -/* MSM8998 */
> -
>  static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	},
>  };
>  
> -/* SDM845 */
> -
>  static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 11, /* excluding base layer */
> @@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	},
>  };
>  
> -/* SC7180 */
> -
>  static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	},
>  };
>  
> -/* QCM2290 */
> -
>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
>  	.maxblendstages = 4, /* excluding base layer */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
