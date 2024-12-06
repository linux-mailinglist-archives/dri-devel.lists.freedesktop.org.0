Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C239E6A9D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E010F065;
	Fri,  6 Dec 2024 09:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mtf7v0Ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36C710F065
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:42:26 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53df67d6659so1799267e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733478145; x=1734082945; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uUIRQbMczpjfL2wu8QV4pEN4I4ysbDGkQQGhfj0T2t4=;
 b=Mtf7v0ExBTcD22o2vWQwjXg9s1h04DTYzILVnTbffBNWY3F9+RQyQwcZ2LFZI6pnSj
 17zZ87mlhSzR+D1k9igZIHqzE2GixIIRFvXBvNJNSTmAL4i4PUIiKqBi4gohO0rAU6Qd
 2eErCw/XO/UJbD13vtne2yU6ruhvWzP8EZ9RrpkhDEaZfFjCbF3yi4G/TeHWrX9tR+PF
 dSZQ6p3lNYWibn5Wj1EcL1ExJ3HovBNCqV1K/p4pMHuBB8FLwY9r9S99V1mJAESdFR/B
 a40PPv6LKQEG4cwImuVShxJil9AujU9qX7HDU+HYJiJ4ENg4lcBYrcHANXdH+doeUkC3
 Mz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733478145; x=1734082945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUIRQbMczpjfL2wu8QV4pEN4I4ysbDGkQQGhfj0T2t4=;
 b=TImF+mgcedBmKLfQhYr1L6+1pMr3anr35dAcCIGfZ1wFqab16wMr0PlFwdr8PRzA9P
 GpPLxhrUqpKO4kkrR4bGIZ8YYs0n4Mwxt4QRenlle/+YOejUQa2RYUDns88UFyk2k8/p
 sEn4q5X4fy0317IPSJ9h5jxSUqcjVk7d9pFv0c3nYTfMgIUDumNcR1xDuneglrV/NKxm
 jKuUhdB/60waPUeiyWDi+5EUfYXBQ1P/Xaj1KHRkFh/guCFjJUj1NBa2snzM8OQbIU+W
 ddzqLICJY9d2xW7Ahm4RJARAjwUeDJMhbMyz9dDpquaJzABVxvoSqrKkjl9CAEE3eobp
 yJ/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVob4tBseoH4EK97Sb0bXi/Asr26icri0rg/RU20gt1moymZGI4U/Oy/7xaqP4JaKJPApiWgSF8XN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHxAsvUT0tpBOLlFDgkAUin3QldzCRPks/XXwVsI13NSHLaIPU
 YX9E0W41XzYb1PtQ1BupTHXWRBbfNSaMDizp3LhWd5s7hyewtLwmJzB5xxKd92E=
X-Gm-Gg: ASbGncurVqMDOVyCXogxQT8a73y07a5v7uAtnLqY1brBDPzL5puVhPn6sRmFMP2aIFm
 CZrhJ9/lAjwWMZUP/Stmmng1Z4hOMRmEsn87gN9fNZbw6y2YBmAr/jy6dFCuTgXpOQlxKaQoNXC
 NRnq2/F2AAgw4w5fONi7hfRaR0r31s+PGkJ/3wmCzyYHJFGSm6x9TQVAW+HttYAds0yIHvRXdPX
 PhEltwHbkNNEGlcMOfdAtXiZlRhlm2gQFNZvBjkWg6tXMbK8wE4S1QmWA+IaWc/XoPTyxViGpBq
 4YMYM6kyFaLpqPHRv5NVJXlp87Uyjw==
X-Google-Smtp-Source: AGHT+IH4esxK0uLXH9slo3btbx6QQTuIap6lMO09rzPOg/wiHUYCi6471yfGuoXePGv2SFTfDWGePw==
X-Received: by 2002:a05:6512:3092:b0:53d:ecfc:306d with SMTP id
 2adb3069b0e04-53e2c2b575cmr685333e87.19.1733478144895; 
 Fri, 06 Dec 2024 01:42:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22975264sm450841e87.92.2024.12.06.01.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:42:23 -0800 (PST)
Date: Fri, 6 Dec 2024 11:42:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 16/45] drm/msm/dp: add support for programming p1
 register block
Message-ID: <ewwpuc3f7vqjeazgeebecc3ygrha4ujq5r7bg5cow56zzb564l@kef4v3bwo3bi>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:47PM -0800, Abhinav Kumar wrote:
> p1 register block is needed for the second mst stream.
> Add support in the catalog to be able to program this block.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> @@ -1137,6 +1160,12 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
>  			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
>  			return PTR_ERR(dss->p0.base);
>  		}
> +
> +		dss->p1.base = msm_dp_ioremap(pdev, 4, &dss->p1.len);
> +		if (IS_ERR(dss->p1.base)) {
> +			DRM_ERROR("unable to remap p1 region: %pe\n", dss->p1.base);
> +			return PTR_ERR(dss->p1.base);
> +		}

Forgot to mention, please also map p1 in the legacy bingdings branch in
this function.

>  	}
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
