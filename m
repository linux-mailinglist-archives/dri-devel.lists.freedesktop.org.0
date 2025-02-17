Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C541A38752
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C38610E4F9;
	Mon, 17 Feb 2025 15:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QUo1GGny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C3C10E4F9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:16:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30613802a59so46052391fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 07:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739805391; x=1740410191; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PsHNJZf4gBUaXZ8wW29cD/eT1WPiatSWZEkxIO7LMjQ=;
 b=QUo1GGny3efxK48PPfBi1tEyjowGiQzXVU/dyfk4OGYExvAXmoBWLXv2P2HGxK/WHN
 XwQFPxllYXVAfzW/wCPMtSlgJbBUtNBNPmXpDqIqJQjz4SsFwkvzJD4AzLiNxI+5HdjK
 /kW5BdmWqb6VhDtealNvVSxuvplwfK95RuNtjfnvab6CHTaXjCKSU5JqenjiRCP/LwGS
 QcMoFFALDz8P5Zr730P2a9PmQfp55qAluhYCgDPL20Ry5Sa3ZA9aYuGf4YxsUWjZy1GR
 3wVt+nOv/b5opvn+crtJcYWM97SS4rF+fKKO+gxxoPEr0coc04dXHmODtcSU4YW21W+p
 9P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739805391; x=1740410191;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PsHNJZf4gBUaXZ8wW29cD/eT1WPiatSWZEkxIO7LMjQ=;
 b=CaQ4rd073v+xdilSp4Fh4DznKhsdm660htK7QoSPnxxiq+UIyCeQObuFb45Ye/Xe/E
 efk1GkOrUDIKfJI2urkn9fUf/emvNLUKgWsNoz5P/KwmSLbeY7Ef6g9vBnH35NfuG5+k
 dhw7Y8dSLvLtx1ru97qb6gCvPnuC0+K+f1xWO14Mffew9kvvXPLrxZnQkBrdC/uBmlh1
 jnauX4R69iZE+XyZL8zwZEX46+9yoKUR47PRP2RQUELDJmbkOlkFarS7LPtBMlV1S8kx
 aUA/fUT4oh56Z3iNTYEySdDG2vU7D51unlNtBlEhsU3uplJ/OrU/0I0gnBPwA3KTLej3
 d7qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJdecB1zD45tbaCTwN0yWSwxWUBTFhhWeSQCmphW8jE2HlgVn05hMiamn2v5bFVfT11KbIrM7v5+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAKi/9HFErp3sX3fuhoZcwOdqR9uwS6lMfdbutrpihq1bkfe9E
 ZRk8V+zsjwy/A0I/zdAVT0Mn8t7RzSybA7JCuMNGIsBIryGVUaAODvjH9tPGmUQ=
X-Gm-Gg: ASbGncuneh1MRNaRIBzN+sx/8RsASB4Ubb28FtdbqsLqoS2Vw9X5lHY3J7In2l02VNn
 biWgWoNApna20+R5D8n9ZigH/P2q5yu102aAJZXyPQf8buptA3XsExoCA18iqrPzxzY1aU9WdYk
 jUnNqKtRvcpzrI+4Vi8jnM/ogRwejbHo51YuCpygMEkQ3wkYJzNeFhI19kV33Vqm0sN1ZzDTDHM
 kZkogsfDSQQ+/PUGKNEiM5hrCa4UTX0QWLwE5UAGkQVdA/4c60X+kLum8zabWTRhl9nD2fwewyY
 7PFAwJQe8epJFlar5uyuU5nC15eXC8WvWMUamnOGijN31XyuLabnXR7m8Mx9m9Ao4uBqxoU=
X-Google-Smtp-Source: AGHT+IFYw6tpGjpP7jPGRzku+1SoU+IGeFXOMCovWE5Iolwo1XU7UJdyi6AK5Q+nHB2rwXLxH+SKuQ==
X-Received: by 2002:a05:6512:238a:b0:545:381:70a with SMTP id
 2adb3069b0e04-5452fe42483mr3989060e87.15.1739805390495; 
 Mon, 17 Feb 2025 07:16:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452fb59e8bsm1043600e87.173.2025.02.17.07.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 07:16:30 -0800 (PST)
Date: Mon, 17 Feb 2025 17:16:27 +0200
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
Subject: Re: [PATCH v4 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <waevglqatvykntxnmaahjpgbhipxhtcfpn7gfwud4sdidqh3dz@bfm7foignlm4>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
 <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
 <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
 <df4cfdb1-66be-4264-aed3-0d5567e721f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df4cfdb1-66be-4264-aed3-0d5567e721f7@linaro.org>
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

On Mon, Feb 17, 2025 at 02:37:31PM +0100, Krzysztof Kozlowski wrote:
> On 17/02/2025 14:13, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 12:53:17PM +0100, Krzysztof Kozlowski wrote:
> >> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> >> avoid hard-coding bit masks and shifts and make the code a bit more
> >> readable.  While touching the lines in dsi_7nm_pll_save_state()
> >> resulting cached->pix_clk_div assignment would be too big, so just
> >> combine pix_clk_div and bit_clk_div into one cached state to make
> >> everything simpler.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v4:
> >> 1. Add mising bitfield.h include
> >> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> >>
> >> Changes in v3:
> >> 1. Use FIELD_GET
> >> 2. Keep separate bit_clk_div and pix_clk_div
> >> 3. Rebase (some things moved to previous patches)
> >>
> >> Changes in v2:
> >> 1. New patch
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 13 ++++++++-----
> >>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
> >>  2 files changed, 9 insertions(+), 5 deletions(-)
> >>
> >> @@ -739,7 +741,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
> >>  		u32 data;
> >>  
> >>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3),
> >> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> > 
> > Nit: should this also be using dsi_pll_cmn_clk_cfg1_update() ?
> 
> 
> This is before clocks are registered so there is really no chance for
> simultaneous access.
> 
> It is rather then question of code readability or obviousness.

That's why I added it as a nit. I don't think that it's required, but I
think it might improve the patch.

-- 
With best wishes
Dmitry
