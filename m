Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70EA26196
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D2F10E536;
	Mon,  3 Feb 2025 17:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dJHZxHio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC610E539
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:41:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so4885528e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738604479; x=1739209279; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Jii2RT6Vdqu1kWiW5gEilxyPVOEgz8U9u99F97i4EU=;
 b=dJHZxHioCMYeqKZt9o8mdVgXzDRUp4ZgtEgD54sp6K/BGaQEVVUJKRzxXvr5uIcm4q
 YwHs6uf4pM3GMMOpILVoTbuaki2KFcws2PIAv0jBN7TsZOiIQTjc9t2KjnZiBrLY5Bl2
 GzdtZiT+k3P7HZGz704ux/YbL7AXnLtcKz+7920FmC4wcSZn+rqjEs6mLnkAENiBphGd
 /4sF/uhB6xMw+AMSvgfVqlfmouJE0aZ7BgGtwQA/4Ah9/c3U8PYVS15GDNTBPnZgbN+/
 Se7klWR9tghPl1Q23Dqtz7ItXstKVsF21oaprBH1+OW4at/Kl7tfCmkDWTFcf1PE+4U7
 URrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738604479; x=1739209279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Jii2RT6Vdqu1kWiW5gEilxyPVOEgz8U9u99F97i4EU=;
 b=udkiDuJAWJ/kgrV0ExDiTbOrlSn0vpF8+phceMHVUM2M8Xpwb6o9NBNdVZMaJiny5t
 gNJvOvVQhFUuDhRLbWzOaisq9nOAWrCNyqbv+2m5Z3a/y7UIYAoY3ywsbfM6FKjOFmxD
 dq34kaSinH6QhKI+6sWviNM/1e8ErSeHjESzw9tSTmeq7xPh81RK2wA8bhpw7Q1h+EYD
 tKwhZaMad9NqAwEYUezZ5ZXbn0kQy6/+in8txaWyfQ7LA9m6sRZozoIsraLtIoaQK/tk
 lZkxsj70MGzC0hAk5L11HZMzDl0l3cmzo/0zirTScM8EX4pdybEQI/eEJbrBU0tzlF2z
 ybcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsN+bFEszswTMu3jrz2H1lAJDiRwcek9z/i4JAGSvzFcw/SCJOZiL297+Nf6SjKz0JmgVB3AiFNFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAzuB6pMgg0nKXAuONWrfFXzGHlkG/sIM18Xha/lMC2reGg4gs
 L/fQhEfAHhxYhf9+L8uSx6T/LxtJgN2j4HpFD3575JsP+IAXHPfD+R74zOX8vxo=
X-Gm-Gg: ASbGncttd7CQCnkqMJ4trfxQau8hTaOlFhAlskQdVce1wGm5oEBHkJlxLBoqDq93HWX
 Ygcx3BtMB5Yh/TWkjHVyqu1+AtUwTkpLqu/FHOnk+CKhiw6Bdj+G88JF2GaQYYPULmZd9nxnd/u
 pNTMAVMGmTb0yuz4hBdS/jR7OA2l/eoJMnYIHPkUIQwmWlDfGsXY1xhaHdUuWqvrMxcnXeH2fxR
 mJjpEuX74fNqpH/YOTkPC8PgsOH6ptcSbz8nHi+JbG1kC27T+1MYVGoHNTmlIf9FJDESwtA4XOu
 w4LPpOTcs7a/b3ALnU2IAkk+b1iyYZKCrll4kD3UsxWLEPx8k29Ytlm8sM4ZasjYxPyGeV0=
X-Google-Smtp-Source: AGHT+IGMHXTAqiNtzIR1SWRvuj6gwq0wIP4uwvupjv/2fWX/inkjy/bcBUX6RWDJkRgSgVTBLrQfJQ==
X-Received: by 2002:a05:6512:3b98:b0:543:9a61:a2e7 with SMTP id
 2adb3069b0e04-543e4c3fdd0mr8509343e87.48.1738604479389; 
 Mon, 03 Feb 2025 09:41:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb7953sm1340249e87.169.2025.02.03.09.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:41:18 -0800 (PST)
Date: Mon, 3 Feb 2025 19:41:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
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

On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>  	spinlock_t postdiv_lock;
>  
> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> +	spinlock_t pclk_mux_lock;
> +
>  	struct pll_7nm_cached_state cached_state;
>  
>  	struct dsi_pll_7nm *slave;
> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>  }
>  
> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> +					u32 val)
>  {
> +	unsigned long flags;
>  	u32 data;
>  
> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	data &= ~mask;
> +	data |= val & mask;
> +
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> +}
> +
> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> +{
> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>  }
>  
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	u32 data;
> +	u32 cfg_1 = BIT(5) | BIT(4);

Please define these two bits too.

>  
>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
> -
> -	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
>  }
>  
>  static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> @@ -574,7 +587,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
> -	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 val;
>  	int ret;
>  
> @@ -585,11 +597,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  
>  	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>  				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> -
> -	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	val &= ~0x3;
> -	val |= cached->pll_mux;
> -	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
>  
>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>  			pll_7nm->vco_current_rate,
> @@ -742,7 +750,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  					pll_by_2_bit,
>  				}), 2, 0, pll_7nm->phy->base +
>  					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -				0, 1, 0, NULL);
> +				0, 1, 0, &pll_7nm->pclk_mux_lock);
>  		if (IS_ERR(hw)) {
>  			ret = PTR_ERR(hw);
>  			goto fail;
> @@ -787,6 +795,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
>  	pll_7nm_list[phy->id] = pll_7nm;
>  
>  	spin_lock_init(&pll_7nm->postdiv_lock);
> +	spin_lock_init(&pll_7nm->pclk_mux_lock);
>  
>  	pll_7nm->phy = phy;
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
