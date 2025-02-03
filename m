Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF12A2618E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267C110E134;
	Mon,  3 Feb 2025 17:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JtZSti/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B423210E530
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:40:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30225b2586cso53897801fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738604450; x=1739209250; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eA9LVH1stBv0ECBYagns/f2KMhNlEurGDeUp3Juc0l0=;
 b=JtZSti/wvBaODf1bTa6mj2LLQBSU8KX24H9TxrLFZlH82nWLQ/86S4AeILV3uT0i4n
 FAnqF944ydXtd41FjvrpjYMTP3nU152JsS/D+e1nuiEESL7z4djVrH5lKm2Yc1H1Tffj
 fCmk61J4Kv+XYhNkI2m6vshQXKs+DwPcDqMrOP035c1xTktiH//PixYEKHBG9oyDN88P
 6fn17ndZNjsm/L3v0LPZIrqA+BXS+hDlHNHo1UmMmsy2OUBZIBDRSbmQEbaMIDUjOikc
 KEkTbLltNPJIoOEkFmfluXJMNjYvM4erMYB1blZ8Jgcq3C2ZDyrQwBpHYBIJJHnf0KvU
 go0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738604450; x=1739209250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eA9LVH1stBv0ECBYagns/f2KMhNlEurGDeUp3Juc0l0=;
 b=s310mjND60jhKXlrZDYFe6HtCuBPNBHLvB0NSnOkmbCar82IjF46FKYyoYahcFU+Gh
 brZCwHQuHpUm0vPr9qrgyVLhvORCyhsKfQcdz/c1HmxKIDTps9XcSRQ22arGn6BueKWt
 Yq5chlsuGOif8Oo3a1lMT8XMDA6eSavDTjO3et6h9XSbRurLWQDjEO7l9sZ9mia2nlhG
 BqCjW4w0C72qvxhb+Rnqd+C6JJ8MpJswXGUY3U0O/qUAxcOHO6Ig6HVCxfITDRNcEH3a
 DOdO0IL7b1fY3USjuu0iULCoRh/Pgh7cI8Z2gEa31vPIvjXuIxnI9jvX11hgZkI9e1c3
 qcFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3dQGVIAKgrT4KIiMqyhFelQIXB31GT1EqIiRJAVAFrrgdxZzxsHPd6iRKeAFURCScDmP1hvh0cYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0Q9kKHvCI6WwSzPDtNKt3G7AYOGj/dxVWhQet/nj5demfCoY+
 UJ7I+2L4GTh8WS9WeSsidca5C3eZEwculIqD2FzosU5Pbhx9cs0B8j94fK/ZYcQ=
X-Gm-Gg: ASbGncsf6nFBJjC1JsKkwq0T8fcYZ4JGHyzq3b13vDduEcijjePyMmxL4/Xpq8585ll
 /FzHhQlyCd5urkoXWdMJSBZg7bOzwpuq5oWc8pr9Gujmuci2gjV5dXwehVqRX0DYrHoVcTtvw9v
 kQEv/Z/vsSXn//40Q/9vyzOeqiYuEViEQnvyRhzfFoULuDK2oZgw3i/yOA1is9KgB5jArjyehL2
 OtNCHm9FDmiMmhHYa/s0coR0FSRroXAoMDymmu66212tqjW99vW4+I+oiyzNuZj0us6hs5mVRa+
 cCTex18cA/97yPsBTaRtnJtp0MF18hk7nKvuoLBhOYOzf3pvksWK+Lty62jCvroEtjqm9zs=
X-Google-Smtp-Source: AGHT+IHY24nboD8BN6UXFEq13aCacnm+x9IFyD9DyCkPKzh/1S25FaBfGTGrXfjyKKUiYJc6Rbvxnw==
X-Received: by 2002:a05:651c:1588:b0:306:16ca:ed05 with SMTP id
 38308e7fff4ca-307c6959783mr444801fa.17.1738604449826; 
 Mon, 03 Feb 2025 09:40:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a309b1dcsm15431281fa.49.2025.02.03.09.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:40:48 -0800 (PST)
Date: Mon, 3 Feb 2025 19:40:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
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

On Mon, Feb 03, 2025 at 06:29:20PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> -	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
>  
>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);

The mask is not defined, still.

>  
>  	return 0;
>  }
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
