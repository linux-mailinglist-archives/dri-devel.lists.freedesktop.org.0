Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288BA36159
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05CA10ECE5;
	Fri, 14 Feb 2025 15:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sduBXR9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D00310ECE5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:19:11 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-308f141518cso23621651fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546350; x=1740151150; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iazVnHSVmXcB7TiTuN2+wvNduJRAxfMyPBRb2NxJE08=;
 b=sduBXR9DOoq3j7jDQM2JWVTaOfXm7X4KgeTANs2OfXYugX79e7cA0SJpIert8RzQNG
 NZCFo7yrE9dptdqoru2tPsSwApaVwInRwwSEe7oJZvgKhETTtIaQPJi86M+7Mb11cV32
 6FGGA0gsOT7ItlYo/dqbqiaCSVwmZesg/+XPSkGafnvql8gUl2Nt2sUt0SfM6yeCBUNQ
 MewkVP1Y5jAaY3la7YWnHMT083Vqf/3pYO2pzo6XGAg2dF4aR8E5fiDVuaDHKxp1S7hX
 idkNgxcgTkuR3IP5/BNRje0gxdhCS1AqfXOCVJg4/+iyGGyL98k8fWoziTN2SXUzpfph
 huNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546350; x=1740151150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iazVnHSVmXcB7TiTuN2+wvNduJRAxfMyPBRb2NxJE08=;
 b=C02hkMMMpiBKedYZ/7NOW1JDKRu6nCT7y9MjVaVXUzUFouTvX9l1GSTgoodxm6xvcf
 XMAEvAnxZehdpoSdyGBIyvyA5OQjHbP0OEbqbE1tel/srRnmYXmLLMr9CSgaNm/zbU5b
 02yvgwvJvSAEjmuyZiE6K7HTSRBdU4vPu9QF2n4XPO2vB0LlHKzIYKerJB22hWTXDlUQ
 hwbF4zgwdzy8lD7r2PiErKkf4K6yG870Q6FGJ1vJgvV4whcWKFUPd7P0xykZ2QIHG/a7
 lnsCFYfM+W5TSefUwZRq0T1lY8KoU47P6uNUNWEZIl1cDWDkcqsPxpQkGdiG+22VyqV/
 Y7mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgEt9rR+PD4Pwx0riqOcaLtCvn/WNvgfjBJWAGARBPuTr3gXxyuvLKPpRrjFoPPsPATEqYXvNB1Kg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylPPzpBF4gX642o1mkMhIIwrtidcShnwMf9XjxOm+hL8jHpxCz
 dRT4aeVOyMEnIMIF3d+wSzbGAQiZqo6n+JtDz2/qrJx33Ej9qce+AITSoIRhG7U=
X-Gm-Gg: ASbGncv+OnOMpWg7KFDcKDvdATFCjEN/JpSjUpz9hPLRLBz1J+0BOoXPSZDsLC9j1Ld
 4ZHs8t9mphV0bKveGzWfKC1c93BO/9ykCIFGmqVNix1NPaCec1e5RLKYpAEjTNrpV+FqhM9GrEy
 mB8i9cVR1x8nuDqjuCG+LXl4WxV6aCuxEGBkczFuHQcCH2bRaxGKCDoyDkPc/Fl4v3Zfz+Dig70
 lh3xheMJF1P1NXVGJ2ihzLJuNn7su8QvjvudqtH72loEgI8wlAEe8Ft6za9+myFVuTPWLfWGkGB
 x41HuXDncVyuHeR8Z5rfKQmc/QTXktqX8T/CppvjVYuSqT18Y3cp3qMHPGINKv0dV0eGxbk=
X-Google-Smtp-Source: AGHT+IH4shqyBncbJWQ5+kQEmxXsyHynCpre9rBcdgpBSO7ycHWzcV+vcZr39orzd4H2/RKGIH2RfA==
X-Received: by 2002:a05:651c:1546:b0:308:eb34:1012 with SMTP id
 38308e7fff4ca-309050915ebmr41358031fa.30.1739546349771; 
 Fri, 14 Feb 2025 07:19:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c52f8sm6085611fa.8.2025.02.14.07.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:19:08 -0800 (PST)
Date: Fri, 14 Feb 2025 17:19:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <5mdw46egzwzyozejgofuw2cgntznovjpzkkkkxd76s5y4ol44x@zfa5ydz6ta5s>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-3-0943b850722c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-3-0943b850722c@linaro.org>
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

On Fri, Feb 14, 2025 at 04:08:43PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
> make the code more readable and obvious.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Define bitfields (move here parts from patch #4)
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 4 ++--
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
