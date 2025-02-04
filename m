Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42963A2744D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A502110E347;
	Tue,  4 Feb 2025 14:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XzDAZbKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D8C10E659
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:27:04 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-303548a9361so41401461fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738679223; x=1739284023; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
 b=XzDAZbKFI8VBWyyrj0KJ1lDhp5mphXxrRu81RL/MrI837+fmhfcbeaKYcibZfHKZ5O
 /whPwCOrgm1jYPUyQ+6noJpQpoEsY+J/m1U/iW0lxOnzIOw1Rj9ky2UijQx0xwrSS5RR
 GN9cyp37e+HkEDLS0V5EE1coQzqgWIT7cVgTz0w0wsgXTi6Zvq8GYM+fqMNcY3UqsqOd
 3zp1+Is4+PMWcFle1y8cci0HO1IukCOkL1GFPDSS6tJS1iVHGCXD18udTFBs0LKcS1lD
 CXVaYwDRpXe6XO4XIJFM9f2EGO423l6mbD1raCajXgJWUAiw8SmZRDFb95wb5Bm21fjJ
 GIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738679223; x=1739284023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
 b=I+jILptcyJZd+N3uoZM2WTHfRztuwdAQaQLAQVd7gdcjSj6TNA52cBeHWucPR4RXhF
 s+mt7qYtMiESzHOXK8V/NVw66FwTX90PhReaRyOafItEMNMKqvUY79snwJKClquXQ/Lm
 Jp+ytOfaQL0q6YzG7SPX4SUlZylv4ftlTPxWi/N1FIkqxMfip8myBEWSMCdnlawJ2m8L
 5L0DtJQLhaIRZhX37tSIL7psgYakbbbDrSqyyEadwAwO/0WcFoDqRuEKd+iz3xcJLjm2
 Nlu0C70ZaxvEMDsPuwo5K4nql59ulU7D+Un8FDBs2s+D+WQULOT+TGFE3o9z+kbmP2vS
 nEBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDVIO7CMwY4rzEM3BvXUpubntrZ+iUS5+m/5PFYhT1IOMbOr8giQ3JuKxV1KcjoH2IeDPIXuMoo6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1WqiUeg4EABgirhH3npqYB9glUnsszBY9b0XqYIMn19n2/+XA
 XrcRp4KHIUq7BngZPnHIRbHN9qxPkDPk8oRD0+OWYsvCPSnmFBtvxVlnitu4Kks=
X-Gm-Gg: ASbGncv9+yDOtC2mmkU5AoBvWLZzSPEyrRIxUWHaYgCJ87bSmpaf6mceoW62OgzXE4Q
 bhk5bCVKOi6N3yHsXpplkkRTNUi4j9PcyHLyzJ1f4qrWXqFs1e7vgvmn/Gv0sbJfu0n9TEdaxmK
 DrVo+JhHAZvbKb3AFlt88Pqd/WmXUy/NuE7zmeGp9m0mxvsbWH5hSST/YvdmGXV8Av/zd2hlX0a
 HD2Oa4+WC84yQCeUMvxayZ4REZTq8md3Lvewz2amAbDVrv1xvadoPZu7ac6q/90r/bpejhUyfy9
 eYllMMSx78iAl2BRK8GwjDatyEsfb28dmYscWLrUHnJuRjNUTd8s9JVKiVf3e293TEwqiFI=
X-Google-Smtp-Source: AGHT+IE8XOaYEj7jYvhNnwbtWQcvDKstTrzf5XAxQhgdONK67Y73izpEykGcxI07g33XKs4TMQ+cHA==
X-Received: by 2002:a05:651c:160f:b0:300:4107:6294 with SMTP id
 38308e7fff4ca-307968fb853mr89129541fa.35.1738679222565; 
 Tue, 04 Feb 2025 06:27:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a33f6aebsm18480671fa.73.2025.02.04.06.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:27:01 -0800 (PST)
Date: Tue, 4 Feb 2025 16:26:58 +0200
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
Message-ID: <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
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

On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >> clock from Common Clock Framework:
> >> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >> concurrent and conflicting updates between PHY driver and clock
> >> framework, e.g. changing the mux and enabling PLL clocks.
> >>
> >> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >> synchronized.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>  	spinlock_t postdiv_lock;
> >>  
> >> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >> +	spinlock_t pclk_mux_lock;
> >> +
> >>  	struct pll_7nm_cached_state cached_state;
> >>  
> >>  	struct dsi_pll_7nm *slave;
> >> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>  }
> >>  
> >> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >> +					u32 val)
> >>  {
> >> +	unsigned long flags;
> >>  	u32 data;
> >>  
> >> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	data &= ~mask;
> >> +	data |= val & mask;
> >> +
> >> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >> +}
> >> +
> >> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +{
> >> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>  }
> >>  
> >>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	u32 data;
> >> +	u32 cfg_1 = BIT(5) | BIT(4);
> > 
> > Please define these two bits too.
> 
> Why? They were not defined before. This only moving existing code.

Previously it was just a bit magic. Currently you are adding them as
masks. I want to know if BIT(4) and BIT(5) are parts of the same
bitfield (2 bits wide) or if they define two different bits.

-- 
With best wishes
Dmitry
