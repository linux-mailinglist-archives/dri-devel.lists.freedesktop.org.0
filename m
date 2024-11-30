Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F7A9DEE8F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC1110EE48;
	Sat, 30 Nov 2024 01:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SrKC7Gjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F312110EE44
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:58:07 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ffe28c12bdso21476771fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931886; x=1733536686; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E8OZWsrIrTwnUzalAhGoRoN2jmtZFU/SWdczT+zM8Bg=;
 b=SrKC7GjwoPOZLO3Pdr9dIezm8SlLp25U8yeYRoenAVQgvA+4HaGhHAJw2Aps2iZP3j
 DM4BRobr5ArATE5WHo8Gkqjtwh/1lC3Tk2p63qcMlE1EEY4ixBs+6hDwu3L1lFkSsdbp
 64msB3hgx2uWn7myc5hVtHuSnZbZzHagSNFpCJMIjSzg3k8Ka8ZelemnohpIc4kcgMc8
 A4qlBqrGikQqKFVpG5/1DcL1hyH1o76Kq7O25TZ9Cn9hJp7pdWwfFNBfSCLl+ATn3QuS
 bIc1FpGtEoaZUKDxZ3wQyd8kUp7aNWsR9+nMDAwwwixwO35Nejd4aZTwu7v+ZJFlWCgR
 um/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931886; x=1733536686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8OZWsrIrTwnUzalAhGoRoN2jmtZFU/SWdczT+zM8Bg=;
 b=Og2cqnyFzvp+7TrhikLsuzS12Al224s5PKJHG48vbViI8ZU7vRDi930dAZCtJ1L4wB
 is6Q5mHTsb3tv/K/h75FTe/aERfP46Q9rwJe2WEMLNxX/UB6e1TUKNF5dRFgYhZP2h+P
 NNmIP2aOjWx/wre4A6FDoXbe2SXuC2Z/oSPi2eafqrNnHFZw/W8sTnk2Pyukp0Q2LRi3
 98erGJzB/sPO54WMbWt/CDQl23eh2XZ4DUWwg0umMxjm/MxGa7pmsFEu3Fwf93MAcTzr
 UUKBfJi3+AiTspfEoW/36XE7CL4ZfkK5Nt22lZ3XFZPKSVC6W0yDW8Dk/e5aB1AQQRjF
 Qm8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqjVPEtbs8RMUwhVMGFvwxuhv9A3yPDIs/ZCaksZFCNs+Bf+G3L5fQdj2Ts/oIl+aCbGG8CaqYgVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCIwr+rcpsZLER1LPaFh3BykOzlxyNMh8qRbB7qCzQSyDEK74d
 HKKx306N4KRjieV6CRxpDmp6MilvfXpA6bPM7uETvN5E1V0XSslmG7s9fpBuBdw=
X-Gm-Gg: ASbGncsK7cTvkir2rPFKvMihPm4ubCp3EN5MV/PhruqIQpR7Tu499PRGw0ZtaWGF+EA
 pnjagbTSCxh2zKY6svrdItlZlznlyexIipHgeNuta2BZcwKxgDLvMbHfFSXUqfGcKF2B77FAhO8
 Dk29l31/730VtWdqKXS18zvBUfhe7cGRP8JnBnw1C2OB5laeptuj3U1drSOGJEcc3R3vOagwhr6
 TbvaWTWynTRVFXk4Wj5JOM6SXzhm4UFO+Xx3jkbNdsfx4x7xLWZe8ZCn69A3DkP2F0o5MTncQSb
 hvg1tCD7Nu8dOPEPhCawM4YUM3ATog==
X-Google-Smtp-Source: AGHT+IH3PxC/7zsS1K0DnMW67rOahIA/SiVj7/NI8dYtx07JEByEXiIOKaepX+9HHyKUtQ3n8U7v3g==
X-Received: by 2002:a05:6512:3181:b0:53d:a4f9:6141 with SMTP id
 2adb3069b0e04-53df00d1b1cmr7390373e87.14.1732931886173; 
 Fri, 29 Nov 2024 17:58:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbb915esm5675341fa.19.2024.11.29.17.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:58:04 -0800 (PST)
Date: Sat, 30 Nov 2024 03:58:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Message-ID: <6hunbphnn2m647swkujhyjywp3e7vnlxhrbye5tjakvlfclimc@j64qbwen2hh4>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
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

On Mon, Nov 04, 2024 at 05:07:38PM +0800, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Fixes: 29ac8979cdf7 ("drm/msm/a6xx: use msm_gem for GMU memory objects")
Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 37927bdd6fbe..b26dfe0a76c5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1605,7 +1605,9 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  	gmu->dev = &pdev->dev;
>  
> -	of_dma_configure(gmu->dev, node, true);
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
>  
>  	pm_runtime_enable(gmu->dev);
>  
> @@ -1670,7 +1672,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  	gmu->dev = &pdev->dev;
>  
> -	of_dma_configure(gmu->dev, node, true);
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
>  
>  	/* Fow now, don't do anything fancy until we get our feet under us */
>  	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
