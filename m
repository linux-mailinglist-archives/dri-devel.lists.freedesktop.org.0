Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B03A21F23
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC7D10E803;
	Wed, 29 Jan 2025 14:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="izW+pcs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DAA10E803
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:31:07 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401be44b58so7343605e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 06:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738161066; x=1738765866; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pVy4t4cB0UKE4FfYHqIFPU0/jXfWjWZ0p1/3jveveAc=;
 b=izW+pcs4O/uobmYJNNxc3eHKKV8C0pRldDvGtNUWgWRysJwvL4Te7ujeMBGHWCAgEG
 r/z3jMvauL9T48LS1qpV6szpk5ESw7jr3hNBLMBFU3QT56gc5mlAPvlOYr8QfhbRwnV3
 XV4u1otTdBSP65455SgOxScyoIQwDNHxugp0YiSWIFwjirTOLM3QYHxXwBFEbxmIO9lh
 UjTlfwhEh2NEsZG6MHN0VHdYjRgKy1CRzsW9yVd9Chogv5F2DkQE21MIRX4h69xZCpb6
 qEZGRKMUbOmi8476iyJcwHKw8AAOYERUqYr+Y6Fp5JDxh3fr6zv7N9CFZjkzHM+cNJAH
 OyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738161066; x=1738765866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVy4t4cB0UKE4FfYHqIFPU0/jXfWjWZ0p1/3jveveAc=;
 b=i9JPlosflmw5YAINuyyaRX7wm9pSccIUCD1nVqsd3L+b4XMV9pjuNiATWKV6xFqvXt
 j5fDWxMEVckyK2M1dfX03DNVY+hsz8/5u31AEro+WG80A23Bfsfz1OXNMn/hOO88ziKg
 1p2iw+fPMODGCzAxJ1XfkCQ2idO0DR77e3umjYNU9x6mElr0wNT4dWSSlk47SlXZO6of
 bytMMOxSMaOt6yMURoa0HG74Q9DS1DPL0OtDg9Tvtfig4G5wjtULQO4CTTab1R3kmddY
 TiKXAGHlcvKYuIDOxpK9z01bDrOruNHDh+zPyUW+bsfWcTCrXBZpzWN9thK3JTKgfsw3
 FjHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGA5CI4hLLKFpy1Uf1yZdashKFFPQcZi0XhU0Rs7UC03ZKbnl2MzVJ9Xo7NBL7Ymv7fRCVPaBX+zQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvTlbRxJjwu9b2VZdJf5JptcMFra6s1e7Mr8fFJiTVbAzVQbD7
 tlskR7gWgaHJCJ5GS0mfMpiEkJ6inA64XkG7c38+7+Qm9x9naew1QKR80pKk21s=
X-Gm-Gg: ASbGncvpiLenr0HRq1R2gH3o/O5SxEvE2Pt+M9WJ27pt7d+RVRjp+KPyRw4auve0t7x
 7CxnXQ1n+1D85U8fFrtUJuMoxE5enKlKxvQ5467f3L1gQToi8BZ3lAhhAU99lNV7ONpSEg1aGaQ
 tdjTarmmO6hcL63FDBFxdbEgryrOATfmjZcAs9J0Sb5FgFSFcX5Y1KfJMObOuvAC7+txxIc+GnF
 VRXBq1B/tD1LVenz7Q1T4S4foMcwd4uhwW9vHu8l37ldHqTbNEYSb+5J6tnARm6A1jwlB3/zMuF
 zq88Z9LBPPIqaeHJRu85ja9kB0xEfmlODHbJuXAQnzdMQnvAF1BkTFmS/NKwhEZP9xaINHY=
X-Google-Smtp-Source: AGHT+IGiFX0DAOip+lO73WcET9swpVWNQ7eiRCrLXIVYnD59II5BJCbVk0x92HCSNEMStqdqKSHwqg==
X-Received: by 2002:a2e:bc01:0:b0:302:29a5:6e01 with SMTP id
 38308e7fff4ca-3079680c529mr12837351fa.2.1738161065789; 
 Wed, 29 Jan 2025 06:31:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc18ce8sm21731551fa.67.2025.01.29.06.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 06:31:05 -0800 (PST)
Date: Wed, 29 Jan 2025 16:31:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct
 register
Message-ID: <kdnbhw2ng2kuhm2ynlmtxz4bnq6j243ktqwfvr4mgrr6w5uy7d@4j6cictf4tpu>
References: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
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

On Wed, Jan 29, 2025 at 12:55:04PM +0100, Krzysztof Kozlowski wrote:
> Since SM8250 all downstream sources program clock inverters in
> PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
> reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
> 4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested except my work-in-progress oon SM8750. Not sure what is the
> impact, so also no Fixes tag.

I'd say,

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I didn't fully test this, but according to msm-4.14, msm-4.19 and
display drivers techpack this change is required on all 7nm- PHYs
(including the SM8150).

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 7f6fb2a840d2..6646f8dbe457 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -326,7 +326,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
>  	writel(pll->phy->cphy_mode ? 0x00 : 0x10,
>  	       base + REG_DSI_7nm_PHY_PLL_CMODE_1);
>  	writel(config->pll_clock_inverters,
> -	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS);
> +	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1);
>  }
>  
>  static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
