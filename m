Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98565A27451
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD9810E659;
	Tue,  4 Feb 2025 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iH/aknL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA2910E65D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:27:52 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so7282864e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738679271; x=1739284071; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Uc9E3UYFfRAAW+rGyz5Tj1RPAc405r5bXy2a5xn17O0=;
 b=iH/aknL3FEpsipBKdarlXJwV5I49HCPm/g5edCkd/0CamWYy4/in/5d65Pa6+RyW5b
 NuqVq/ybnUL9BpOgyVO5bkwaJDRD+wdt77XEJ5WZca9jRRidBz16Lj2NsrWWPwr8/Y4T
 kGF7aCwiKcj3AZzA4I+1cONKXG+W1+/U+BR+Quclak91D9e1cofslM/fB+n5FaR1tdH0
 y5ptBQS9sLJT4aRNrhaxIwP6My00govZuQvAkbz77BX20r/oX4N1X2uVqoNmteJ7KPqj
 W0lxH032xKMHlyQKNesEWGzV5FRZK1BeHUDKZxBJ6m57ONziLV2gADh9+eLj/ZiDBPzI
 9sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738679271; x=1739284071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uc9E3UYFfRAAW+rGyz5Tj1RPAc405r5bXy2a5xn17O0=;
 b=PKSVtBYO6VwRHgCUI3lk32rLzfW+t+Nwwj7DR7qkTSMXkKVtUtvzjmfWl5BeUojtZT
 LLbOAs/42KAmCNt1L7kLL5dJAt/Mzugu1lOX2MteXkHC35Bhs+v7K7A5RpJJ940EM6Z+
 S8ZVsUg6UxBjVX0kXs8WyrRmPULt3MHAxWud8tqqMfLCv9nctvk7cpy5hBXqzeBb7oQn
 kiHQDyHgVRAlqmpetZttLxBlR52spsoZHuRFRHyWx8233S5sQhx2vTIoFvuLeielhV0H
 9UmGC+O3Q3cTKDB9s1WOHZosvtBcGnD7OCNDTg9HY9/T0blVHHdKzEHv99HTl6OCF5S3
 8uJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzPN+0m3unsFnReRFie+9mwDNF6ikSJgQqZFr4IU10qCtgQPdw20PleLh1K7nrQVFpciT6d010idw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcm+dk7HF7WBB90OG8d0Bs2OHCaa2sHIqzu73aWIU5dlxFMTww
 zvf3Dkeip4j83frTUa8mHeaO5B8Ka+kskoQIDWPtaD+pepuFqmryzs+EP8q6vT0=
X-Gm-Gg: ASbGnctV4+ZEKxW5sw+6IufEdBSBV5XXOm8tVYGPBXqp9CQJX+rkdDYQDgoNC9gw0Xl
 RUoLViwxRR02lGYfRyix+cPl0OL34YvJETrLULBNQ44CuJe752fCQjR2SwpnlycAJAt6XMkmODA
 Q4O2uF7DGz+HL8J8qXc74xwZIdh43xOpBDa8h8GjH/k7JAOTel5amahS1MHHAPpmZAolLe+PXZH
 pX+R+bm7Qk/tFgkDzO9xwY7U62wrcgA7LsL3pbAPvQzMBPaCoLmA1pvl8OAvedN41VI33Oso8Dk
 h3lovrG/VLxwbMQ7WcmJw1XABGZDQ8MPXrsoCgb8hi3MbHHXuBp7d2pemBrz0t6dCKJi+GY=
X-Google-Smtp-Source: AGHT+IEg7SdqGeCK1dtrjyU3szLN/KK1/z3qC0jeEm29ccKN8bg4q8Wmp9gw0E5IcQUUGfBE7uB23Q==
X-Received: by 2002:a05:6512:230a:b0:53e:3852:999c with SMTP id
 2adb3069b0e04-543ffb2cc63mr1218071e87.12.1738679270909; 
 Tue, 04 Feb 2025 06:27:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebebe781sm1585368e87.217.2025.02.04.06.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:27:49 -0800 (PST)
Date: Tue, 4 Feb 2025 16:27:47 +0200
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
Message-ID: <iygq2utzftqrvekz2mm2nnjriwvbtnpskbb4th3wg2jczfikw3@5m7cttkxwenq>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
 <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
 <1fdf132f-085d-4420-88c0-bdbe87ac2c74@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fdf132f-085d-4420-88c0-bdbe87ac2c74@linaro.org>
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

On Tue, Feb 04, 2025 at 10:22:19AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:40, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:20PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> >> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> >> clocks.
> >>
> >> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> >> all other bits untouched.  Use newly introduced
> >> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> >> overwriting the rest.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
> >>  {
> >>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> >> -	void __iomem *base = phy->base;
> >>  	u32 data = 0x0;	/* internal PLL */
> >>  
> >>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> >> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
> >>  	}
> >>  
> >>  	/* set PLL src */
> >> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
> > 
> > The mask is not defined, still.
> 
> Why would it be? That's old/existing code. Commit is doing only one
> thing - fixing something. Not introducing some masks or defines and
> changing hard-coded values into defines.

GENMASK(3, 2) needs to be defined in the XML file. It was not there
beforehand, you have just introduced it.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
