Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE8A276CF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 17:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47B110E362;
	Tue,  4 Feb 2025 16:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eTZXlttH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FEB10E360
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 16:07:02 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30229d5b229so57787161fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 08:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738685221; x=1739290021; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QcM0dBP9g39GXdi7mAUq5Bo01wVZTt8edmUCGV/0Hw8=;
 b=eTZXlttHao2LQdO66wGJOvsgt3Su72KTLO1kS8sbzfUcOIcZd54Wr1vVrR+drYiL52
 1gd9wwON+qjwMXctR8ucidDBxGOssdKYGuvuIpteZ4rUc6a3u6DKx9MT33WSNbkmHF8M
 LRAKYvxkIh2h9yyqZaN7NoEVEVD5l+1ax5wcPGNiCGXUgz4HM+lwHUA6ovFC/vR3zpFw
 bTYFPAqUwM+n6phFcwuj1OxMIuso4p0TgWChNxbLm6DpoNNB/xVCf3fnjTH+X9tsZ5Fo
 JsuuUTHJxJ9gkJ6mHImlBTI0HxOFsh+4kSYtZx4RWlFLXe0L6Mu1bq4lKbNGH9Ux+ceh
 m2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738685221; x=1739290021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QcM0dBP9g39GXdi7mAUq5Bo01wVZTt8edmUCGV/0Hw8=;
 b=wD6UAcGUqzjWKnh95QG+hPjAP5cmFoeN+bGzShKKwWMz+ybCVmrQk8kkKLoQ9/NE/M
 ehfmR055qPrzDjd3DO4c4p2b7xYP619QVbFZ4JAyKsWdv2KEGK+ysaZqQB66iIMLTAZg
 cB4xMw/FhaJtZzWmgLjopLIrPvEp3jFUYIi1K5VHeByiLNLEp5LVIH7CQLSmot6+WGxC
 N+WivIIrVBakeNLxg8yBrBNzPMhY2zpYOonLmK9m4v88rdG8dGXLPKLInyQCrcqZspjw
 qB1dezZGKByp1Xvi2lL4VM9GF/0GCajXqEV2hEPqRmfqh3Mmlcm0HkL0qmp905wMJG6M
 ErPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYgQjeVUrRDuSoRWlkixrkLOtez6YPTe0ycw/Be541Ub3aKbv1qvRTT0aNn8hi9CYdMvayUffwoAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEvQUGlw7wHNNwAF/SJArp+BPRjsMVaLLRI5OnCil000d8aq1b
 ZZ31CfdfF0LxSpEVoMwfquhP7OGDzVEpBBfmiIr2pinblpEf0seLZU4DZgRo5Lo=
X-Gm-Gg: ASbGncuYauAYUUHdG7lYEUwna13L7k/s9DlpfFvc3q4RWYsp61IqXjGg/jZIbx0ihnc
 eOV8dyYP5dlYEnycplKJTRuDJfbS2i4mMhftkobsLVNWiFzz8WW3s4oNmF9IvUvC6IxenaDC7JH
 gX/npjLCyZZcV2Ax7in10ExEVj39w9FtojyrGW3tl1rW+xleONQzzLQHTVyKa/YOE+ztBEb2oRS
 rTBPha4IXzGEX0DEcWOjpVY3oQFgiYS4N7ZSUm2tlxWfd3+OcbfqgEEGKwCLhR6ZG4mMHeYRe4N
 4npEWE0KBP46XepTXkasi/h+tSUU4Uc7zI10qIgKDwcIDCmMv+6YYoChscE40NtvhN1g5a0=
X-Google-Smtp-Source: AGHT+IEiaDM/fV1OOyZrYGn4JSpNEJKdHLwZhH84L9MO8D7AIbye89bpe0ENwwrU/i4TaJWy2LjXDA==
X-Received: by 2002:a05:651c:220e:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-3079680fbc2mr88609331fa.2.1738685220999; 
 Tue, 04 Feb 2025 08:07:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a33f77casm18969821fa.81.2025.02.04.08.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 08:06:59 -0800 (PST)
Date: Tue, 4 Feb 2025 18:06:57 +0200
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
Message-ID: <rjjaanthmbb5fer53ffu2evxohyusj4me2db5r4jnxy2wt7dxk@a6r2a5ddxoxq>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
 <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
 <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>
 <dtenajcyhcrejiiadcfmpz3h3cg3l2rkio55625umao6gl3q3k@asy2ecfz37ps>
 <30518b66-71c5-43ed-a770-e3ecbfdb1f58@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30518b66-71c5-43ed-a770-e3ecbfdb1f58@linaro.org>
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

On Tue, Feb 04, 2025 at 04:48:43PM +0100, Krzysztof Kozlowski wrote:
> On 04/02/2025 15:28, Dmitry Baryshkov wrote:
> >>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
> >>>>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
> >>>>  2 files changed, 27 insertions(+), 16 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
> >>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> @@ -67,8 +67,7 @@ struct dsi_pll_config {
> >>>>  
> >>>>  struct pll_7nm_cached_state {
> >>>>  	unsigned long vco_rate;
> >>>> -	u8 bit_clk_div;
> >>>> -	u8 pix_clk_div;
> >>>> +	u8 clk_div;
> >>>>  	u8 pll_out_div;
> >>>>  	u8 pll_mux;
> >>>>  };
> >>>> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>>>  
> >>>>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>  {
> >>>> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
> >>>>  }
> >>>>  
> >>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>  {
> >>>> -	u32 cfg_1 = BIT(5) | BIT(4);
> >>>> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
> >>>>  
> >>>>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
> >>>>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
> >>>> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
> >>>>  	cached->pll_out_div &= 0x3;
> >>>>  
> >>>>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >>>> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> >>>> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> >>>> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
> >>>> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);
> >>>
> >>> Could you rather store these two fields separately by using FIELD_GET?
> >>
> >> So make the code again more complicated? OK.
> > 
> > It was already there, bit_clk_div and pix_clk_div.
> 
> 
> Yes and I (believe) simplified it. It is subjective, so I don't mind
> going back to two fields, as you asked.

I'd prefer it this way, thank you.

-- 
With best wishes
Dmitry
