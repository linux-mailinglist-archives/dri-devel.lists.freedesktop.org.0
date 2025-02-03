Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369CDA25CBA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 15:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725A410E503;
	Mon,  3 Feb 2025 14:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hwgWHfII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4683F10E521
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 14:35:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso4097879e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 06:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593347; x=1739198147; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q/CBL2MqSqojMhTBmJBlsXjTebcqv/OWdhdx1LIiXsQ=;
 b=hwgWHfII9ibfdjrG4t6FzN0kUegqSdXO9fP1p3RwXRI3XitAOWMdNyfaERQPIOxfoM
 mNbWe4rWCOi/mooSuG2e2T6y3DLz59TBXDxGe2YK6W17zJV3wYq0zY/4EeDBY5IiJCbq
 F6slC7oOG1U3y9T+CxIqGgUMimomv9jLGxpPxvH8DmszEeVqsd59s3FB9HK89H7vrgSi
 er5b45BYSEgtVe4Eq+cQy64NllwA5PWuZqzOHn0WSiqnpWwRQ1R6KNl9HewflXIguTEh
 hbu+t3Fsjf2UkuUA7GbXDbZDlakfqFq2ptwUUGxnAEHVqvSuUOT+tqTyT4oZhVLV4ZtD
 8gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593347; x=1739198147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/CBL2MqSqojMhTBmJBlsXjTebcqv/OWdhdx1LIiXsQ=;
 b=r1XIqtMnbTuVUGaEw77a4v+KGe18MMpSqJQCHzlBi71VGm+l4tE1LWe/YnSGw0oY2E
 G1UrCEiW5wdeANLMcndsWnCwHbJs7TNYBW0ZD612q4mUSxXbTDTXEW7M864ut+Y2jJPD
 5J5bfVXg+3aLWZgThhaQwOqn2Ja/ggSv/P67QnMkooX4sHHMG+VlOasMo4nlzHcQGWLj
 /L8DL7wCz+J784GccIPMBR4fV3Or67fmzUuBWNjp4bm1OjQCIbBDqIvos4gfmVi5roSy
 8/L6qvvS2XsqvxtYVvGxh4elFXoX7IGODhxOrYRSw0JlbLuPnN7wBlMfDgKfDt57XnnP
 PrnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMg3ppoQCPQZDUtZQiC/N6dIcHijaCoNn/1wqAKxx+FWpPQV+0tWeriYEqs5CZuD1pt4A/1nDBeY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywyb8w+PTqTRxUPB1/kTPsvcaa/ecs4FttDIWsxUqU9+++mBlBb
 WIX9vn/Ye3hWx2fG6uRdVJE6XW1/RhpviJxmdxVooMlrKVoCqUHtJ+VZ1qOJfco=
X-Gm-Gg: ASbGnctDbGpMmrHOG7N3I7pQPlmBQiHqAZAuu1W0IwsgEgZhr8DTVq5FN8lqTCIhgZN
 Nt/JjB9yRUag3h9w4txJfRACQSMD95VpMISk7UeGghTu4SYxnC3Qzv93LMU+bsSd29mNyE2xd6D
 ulaEXKzREKOJa5CDqarT+1tgxlStY0/um6JzzXW4X1c3wEIL8loLGYezUuYxysWr51DMiGE8b+r
 3m/4mOhimJnY7wem6vfgL2Qx5XE1gYd8LjdUVUenNvNW1n0rOCxpTOkeZ+j4iZy9S//E3Sj9+gD
 Dc6K+W1StEVTVPrwfaBhA4tgwDRNAtWSOwRo4AlRHvZYl3sLFybEYFQgJPlS23uA75ZEhNY=
X-Google-Smtp-Source: AGHT+IHmpsMOUXj9J7uJNG7xObWsutT5JkdY7XQTqCfqYOO3ezVejDnIR+luTef92RNP0eR3hf/euA==
X-Received: by 2002:a05:6512:32c9:b0:542:7ff6:73c4 with SMTP id
 2adb3069b0e04-543f0edde38mr3901410e87.1.1738593345964; 
 Mon, 03 Feb 2025 06:35:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a3097f27sm14979041fa.45.2025.02.03.06.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:35:44 -0800 (PST)
Date: Mon, 3 Feb 2025 16:35:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <7srflbpb72amuky33bv2etyuo2wcmrcmrlc6sknx37gzp6v6s2@qpxelvzoo6gd>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
 <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
 <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
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

On Mon, Feb 03, 2025 at 12:19:04PM +0100, Krzysztof Kozlowski wrote:
> On 31/01/2025 17:25, Dmitry Baryshkov wrote:
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
> > 
> > PLease add these bits to the corresponding XML file (here and later on)
> 
> 
> I need some more input from you - I don't know which XML you talk about.
> Do you think about:
> drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml

Yes

> and others alike? But doesn't it have only register offsets, not field
> offsets?

It can, see for example the mdp5.xml, you can add <bitfield> under the
<reg> node. Be sure to install python3-lxml and enable
CONFIG_DRM_MSM_VALIDATE_XML if you are modifying those files.

-- 
With best wishes
Dmitry
