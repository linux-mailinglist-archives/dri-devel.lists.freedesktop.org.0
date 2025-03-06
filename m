Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07C4A542FD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 07:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C718410E8FC;
	Thu,  6 Mar 2025 06:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tC/ZBtu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914D010E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 06:45:01 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30613802a59so3167711fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 22:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741243500; x=1741848300; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vJcWTKFiNofQSBl8Y+/9Hv1NdwHNGxMC5GhCSRQfHSY=;
 b=tC/ZBtu5qse2hWerOHAyv32foU+GsRgprOU78etf5yMB5IGmXm+Esvm3IPez6vPdlh
 Hqxu2wgwepsdPi/VK32bq4L1MDkJqUKG2GP++B74SLoyfnHEZUHvyJ5AHT+Ky+OCKlHi
 jEgHRw221jGza4icA8SNovejLC3lQEAMtXbokSBE6gZFHhLszj7Tn3LZdQXPTQ5xls7i
 qPDl9ogRnXBQncyhIfY29ZfIFXrNCB9G2LH6kqjizN7Ir2QmvCmcHKXRVBS9XFpeI2TO
 skYm6rLuYCV72hAmEXAQRYb1rNu+bhuRNUGDtHjj3nWpMJ2ug8aLrpg8A47GiElXGrMT
 DdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741243500; x=1741848300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJcWTKFiNofQSBl8Y+/9Hv1NdwHNGxMC5GhCSRQfHSY=;
 b=D16MRclqJKLu4VcxdkZqBibRFMf3iWfgXrgJgyMaC9omNYlmN5NVIU/odapv2M1Jmr
 gsFQNapVOaWqKrRMY2H+V3YHWzyaAJLEDLT8DmpSH0h6keHhBurCprMVVNglrfFPgW6k
 n6ZkC5b1SlvSS5wUP2BcahtFhhA3N8Nl5V/pUDtNWQWvo1cRH0wuEPP8MighYwyRLt+O
 CzDCJBRoK85kCty0hEnTcF4al3SSl75rxGIauWgU690SnpV+JFnYpS0qPVMh5Oqgz7Xc
 +hZ3AANwDY57bGyX/Lj903XRrjfBK/g/ngvVEo6OWpgLntDRK9Z+VkNV8bvpjUENYCBt
 wp/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMTn+pQhjpSJKpF0K+isXr9ADG9O3hPkNydbIPd6F7ARna6Nhy0PHJ/3U+LC48HiKwT5vcyk4O+Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCgdzHFyo0ZaxPzqg1k6Ijdqi7c/HxxL2xIMLQMVWOqBUwdJUJ
 65gPQw/6n6+EPNFdNx8Y9ztxG63nCA1pDXombzVqKYdmtBquCxadiZv7dr6xHCA=
X-Gm-Gg: ASbGncuhBtriZhDg3DlQwtoNKlho860lclgCn6TXFqs94e41TPKDldMtUqxLLucOCoh
 H/2LnkfM7/78ig7lWw43wh+9QDEjCpFn5ebC9cWt5t3IRf9eo+Or9PR74s2hoo15WQQc60xASVO
 XRLZIhDzfFHTGNcHU1y0/3STYG0st4deNKyD1JnlpJ5P1cFrA3pPcwARHm2/sO8NsPJRGPk75r2
 weBdrp2+flOnMdwYQnhg8twlwRNEewMFLei5XZfqzaT7P+cw30IBCP0LTAMdYspucILYIPG5Ozk
 r8ppkDUA1mpmYZbAR9o4Qt6Qw/TVbOQaYuzmugLnvnIA3ee5OuDk0MzImifJhGXMxLem4iHbEO5
 1mZ61GM9JRdXHCs5QaIFf1XOa
X-Google-Smtp-Source: AGHT+IGKZmSCFgA/R9sb1yzYNL1vBOalW8LPwb3ZSbsOkodGM8bD2zIilQTAga0vyIRSmk9t4Oethg==
X-Received: by 2002:a05:651c:4cb:b0:30b:ee44:b692 with SMTP id
 38308e7fff4ca-30bee44d138mr619121fa.33.1741243499788; 
 Wed, 05 Mar 2025 22:44:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be99c8319sm1034191fa.76.2025.03.05.22.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:44:58 -0800 (PST)
Date: Thu, 6 Mar 2025 08:44:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Message-ID: <vjufkcrkungrwy7w4pxzsac57ilzk2dt3eeypzy6pna2z5ocxg@uf237ixu6kqq>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
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

On Wed, Mar 05, 2025 at 07:16:51PM -0800, Jessica Zhang wrote:
> Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> dedicated CWB PINGPONGs
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> index ae1534c49ae0..3f88c3641d4a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
>  	mux_cfg = DPU_REG_READ(c, CDM_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (pp)
> +	if (pp >= PINGPONG_CWB_0)
> +		mux_cfg |= 0xd;

Shouldn't it be 0xb for PINGPONG_CWB_2 and 3?

> +	else if (pp)
>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> 
> ---
> base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry
