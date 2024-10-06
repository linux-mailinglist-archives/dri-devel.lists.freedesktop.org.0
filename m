Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22B991FF3
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 19:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC36B10E184;
	Sun,  6 Oct 2024 17:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TsmKioV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398CC10E184
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 17:32:44 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fac787f39fso38155061fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 10:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728235962; x=1728840762; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r1NxQI5QV4DE8+i0IvHuqmyv/ESZiy42eqq5jBNAK5E=;
 b=TsmKioV5ACXxu5Uv3h9hBPDhwoXxTl5hhf/1IX+0JJ37pCpPkA1LFf+uwzgy6ZlWJv
 aFvulU8Ym/X/5S92j98/ZThyH44jjRNOkdBo4YbCdxG7nCoeaGweWVgmXVGP/LpuAJTr
 S4Wbs++MbusH/Tas8ye+B++alf9P3bwV+iT6axGEz/DIAbbIf6Bx3vo2l0gxZi1ChvzD
 Qc6DWAB6J/WX6Loj0u69oqr08E+B+RTIDb8EHlvwUxVLGj4rua2nu2fLZusNaYCv7jHA
 pVp64wADxvtwHlks/CTRfvy8I56hHOTgqHySrp0p5slzlvU2ZIyV/lkXfzMDxdSx64DV
 5ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728235962; x=1728840762;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1NxQI5QV4DE8+i0IvHuqmyv/ESZiy42eqq5jBNAK5E=;
 b=Weh5x8O4rY0P97Dj+zAge5bdnl1Nuheb1R2ghZtA+WukLee8NqpekB11IUMTMGJ6Ty
 tXAtBQ/9rMKJmOsmF7xZMGnMAmyL+BAb8Db7H2UCzVXpUkZlEC+WYZBrtmI+hBDCCcnq
 O3JCtSvkQzEaK1qtCu0mTSJ6Ui0Dy2MgwvDb4Yq/SvxKJYrniQQQqO789Gu9vGlL/Q4P
 x5NbpjdTtizS5X2lcV0FjcsyKzIA6W4u7hqWmHnWyL+qG70q722jts3eBXovdqP4mnfj
 ym+auMg0jbQ6fzbOHf06mZm1RniaPReoEkyCmtcWJXNidR1LV9S5EkrA8Ar5qsb5aD4s
 8sXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Ov1so4dw/ACRB9g3RqY5OPO0rSwFTSz23PiR6J+uMPqNB+KYxvsRWXoAVRVQGWB2QuitIZ33uhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzwok157asHdR6HA15fdmiILZWxqi/Qx+cKhUvmPuOi/uNuZ1Gx
 a5WGwEz7iMf5dCorzJaL6PjM3olFtgs4AuZ4hvrzEueV68NAxU2lAsrYoSSUmqI=
X-Google-Smtp-Source: AGHT+IG+QwZQ4OCtQHyqoK1+CJ+GHxPI8u5RieuMZEEdbaGmBdONOTKZQW0bvOywQEuMFL4+NafBXw==
X-Received: by 2002:a05:651c:544:b0:2fa:e658:27a1 with SMTP id
 38308e7fff4ca-2faf3c141aamr41730371fa.5.1728235962235; 
 Sun, 06 Oct 2024 10:32:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9b339b0sm5524611fa.124.2024.10.06.10.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 10:32:40 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:32:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi: fix 32-bit signed integer extension in
 pclk_rate calculation
Message-ID: <mk5mrypbeeuzhcmqimck42gnykjwj3yz6ua4npkxymrvho6z7i@dvvrxsafqcxj>
References: <20241005143818.2036-1-jonathan@marek.ca>
 <20241005143818.2036-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005143818.2036-2-jonathan@marek.ca>
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

On Sat, Oct 05, 2024 at 10:38:10AM GMT, Jonathan Marek wrote:
> When (mode->clock * 1000) is larger than (1<<31), int to unsigned long
> conversion will sign extend the int to 64 bits and the pclk_rate value
> will be incorrect.
> 
> Fix this by making the result of the multiplication unsigned.
> 
> Note that above (1<<32) would still be broken and require more changes, but
> its unlikely anyone will need that anytime soon.
> 

Fixes?

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1205aa398e445..a98d24b7cb00b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -550,7 +550,7 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
>  {
>  	unsigned long pclk_rate;
>  
> -	pclk_rate = mode->clock * 1000;
> +	pclk_rate = mode->clock * 1000u;
>  
>  	if (dsc)
>  		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
