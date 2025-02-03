Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D3A261D1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A8F10E540;
	Mon,  3 Feb 2025 17:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sg4P5ZOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92B610E53F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:58:59 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so4089648e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738605538; x=1739210338; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Stn8iOzRg0pl2xk4Aml3qZzGpyJrcj7qEXXMSflHudU=;
 b=sg4P5ZOu++FVMAJrFj9DljTi/QdFXcq5SpC+DQiy8ON7Ab63+QGRZWTl1rTsOdZ2OW
 Gdj80kibbhfETYFCSyKKbwmdZhGl7xlxHuBNL0PTShSplzFX3E++DCXTrEh+s3R6WhmN
 cKjigs2b1eh3zxDZfj4EMFxGFZ1LYwYH7PvJtLamVY9oEwSQuY7RLWZoQJw1xoUJF3Jp
 3XMFO09SwapgQbgYZR9zgzD5TMjbJzt32Vux9WR7hb7ebsTcdsS8Bi38QxJtRoYMx3ba
 fHhTS4E2ZoabuyfdO2YwjQ4zP3JYHhLdOs/AZcmAtz6iU0u5kNVNhvoUxPen6n5xLvoy
 bKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738605538; x=1739210338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Stn8iOzRg0pl2xk4Aml3qZzGpyJrcj7qEXXMSflHudU=;
 b=h3XQiIXFx+/hEgtyTdVICwLCUL51suJJYAtrz6R4XdeEackBcMONDoE3MGsKqVe4Yb
 GYbSulN5MnPW8QpDFtylcCXWx/FkjhyphS7GFtlYNKlcnUP+qsIb3ieHVYZcwHuQZDea
 Cs1VYPcMcgYtEa42dPb2I7qhfJalfGCfbiyW3V18vwr3I0lIaVoJjKpvutgRfgn1WVmi
 rIirqnl6nmAKr7f9JSupPbZLyZBZpTeKEq8QcA7DCkgUMC/e76BRu7Ob5Ru+bzrF+DeG
 U4BN54xnJCJUDRWEPBXe/czb6QFP39VvkPLAeQSsQAThDS5R+u7e7A6qaOW9wa89+4Bh
 GtQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcWny3Cn1EGeM0+sPu01Ne+cuv3oGmCNAf80xZ98s2buUFQC0VILCE2t1ZnET/AS9R5XpvbW+PYDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw//W5psUccMuT8UnoZHRfambJpZn+7Wkzun3NqV5YmDOZ8MXqe
 NY3FNFA+hEne0gndxxN/pBWiE2q3NzlNVz2CR+JYse6VKhB/vkpN0LNhdNejcQE=
X-Gm-Gg: ASbGncv92ukwdG5W5k4zUTv4D2Qp67gia4iwL86VpHi8nOjWBTixeQmUURx+8ufB89z
 DszFi3lzcBs3efdAkespNcLywIbwmUBZaG87FbD2t69ihm9VBzlse0b5LV+o+DRIMhTnl1+Kagx
 AmaPJE49DkgEr7vZw7QrDj2FPdV0661E7vw1x4m5hvX+JHHPBYFyXG0AS/Eyk0636EBDjjFd30m
 uJr5TPbk02cQP0dGh6keRNQ8ZDzpuXF/elhY7h+wVD7/hG/OeXYYKbWSWm5jNM3kkma2Dzjwb51
 i3xPGLwEaw97bcb4oA8I+u+wd7hGOyjc7KL4swDSPh/6ETqGnbQVIWSyVGfeIqCLkYM4H5g=
X-Google-Smtp-Source: AGHT+IH1q3ZO9LNsyTVW4NPTdU//0Fx/rXlFPloiEN1WTFjn/TPZDusif7LVG5SOUF6QcwTmsZ4I/w==
X-Received: by 2002:ac2:41d7:0:b0:542:6f2a:946a with SMTP id
 2adb3069b0e04-543e4be034cmr5391500e87.6.1738605537977; 
 Mon, 03 Feb 2025 09:58:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb06d1sm1367606e87.121.2025.02.03.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:58:57 -0800 (PST)
Date: Mon, 3 Feb 2025 19:58:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
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

On Mon, Feb 03, 2025 at 06:29:21PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.  While touching the lines in dsi_7nm_pll_save_state()
> resulting cached->pix_clk_div assignment would be too big, so just
> combine pix_clk_div and bit_clk_div into one cached state to make
> everything simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
>  2 files changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -67,8 +67,7 @@ struct dsi_pll_config {
>  
>  struct pll_7nm_cached_state {
>  	unsigned long vco_rate;
> -	u8 bit_clk_div;
> -	u8 pix_clk_div;
> +	u8 clk_div;
>  	u8 pll_out_div;
>  	u8 pll_mux;
>  };
> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>  
>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
>  }
>  
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	u32 cfg_1 = BIT(5) | BIT(4);
> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
>  
>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>  	cached->pll_out_div &= 0x3;
>  
>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);

Could you rather store these two fields separately by using FIELD_GET?

>  
>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;

FIELD_GET

>  
>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
> -	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
> -	    cached->pix_clk_div, cached->pll_mux);
> +	    pll_7nm->phy->id, cached->pll_out_div,
> +	    cached->clk_div & DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK,
> +	    cached->clk_div >> DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT,
> +	    cached->pll_mux);
>  }
>  
>  static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> @@ -595,9 +596,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	val |= cached->pll_out_div;
>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  
> -	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> -				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm, cached->clk_div);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> +				    cached->pll_mux);
>  
>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>  			pll_7nm->vco_current_rate,
> @@ -634,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
> +				    data << DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__SHIFT);

use accessor function from the header.

>  
>  	return 0;
>  }
> @@ -737,7 +739,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  		u32 data;
>  
>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  
>  		phy_pll_out_dsi_parent = pll_post_out_div;
>  	} else {
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index d54b72f924493b4bf0925c287366f7b1e18eb46b..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -9,8 +9,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x00004" name="REVISION_ID1"/>
>  	<reg32 offset="0x00008" name="REVISION_ID2"/>
>  	<reg32 offset="0x0000c" name="REVISION_ID3"/>
> -	<reg32 offset="0x00010" name="CLK_CFG0"/>
> -	<reg32 offset="0x00014" name="CLK_CFG1"/>
> +	<reg32 offset="0x00010" name="CLK_CFG0">
> +		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
> +		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>

Are there any sensible names for these two regs? It looks ther are
not...

> +	</reg32>
> +	<reg32 offset="0x00014" name="CLK_CFG1">
> +		<bitfield name="CLK_EN" pos="5" type="boolean"/>
> +		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
> +		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
> +		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
> +	</reg32>
>  	<reg32 offset="0x00018" name="GLBL_CTRL"/>
>  	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
>  	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
