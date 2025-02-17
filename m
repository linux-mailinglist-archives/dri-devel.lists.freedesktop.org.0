Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CEA384C9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 14:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9410E35F;
	Mon, 17 Feb 2025 13:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j9jA1+lc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E0810E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 13:37:34 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43980f4d969so717875e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 05:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739799453; x=1740404253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yf/H9xQPOC5Mf7egObQiUCwJ+y9rttCstxQBnQsk93k=;
 b=j9jA1+lcVP4QuppWE64JH+huJYtYCygVPzd0pR8Y5+paZ7XMEhiyA2GWpqFWpIU1uh
 jhNuil0lFA4bacqYRXBu4VnlZXYw3YdS8Xxkbd4SMPBSZ7F9xjjN54wMzM1bgkn9wTXE
 0i4JzBaS7rxklbEmGrdwrKjqoHVWiP4qCXPEHykGeC5/mk9aKqLwRVmHUMyGyBMZxCZN
 HlHEPO2qSMVfrMEk+7mf5ioOU6miEL1vA8Op9deTr8ulvKopE13cCDllTsPRc17B+74m
 sCa6+bke4+UTipEyHX7ElQf4TygjQ5MkkKNVelz9mDwU4alKvmZ0hE0WZGDmblTVTX6M
 9G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739799453; x=1740404253;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yf/H9xQPOC5Mf7egObQiUCwJ+y9rttCstxQBnQsk93k=;
 b=Iqxwos5jRdCOf0UmQZ4Xf1NW6C6cFlb1SEDBIav7JQukmcusZxweSyVVb8vbwYbypb
 sBo6KZ6rnAduvYqIGOIAGn5ATbR/v1cgpRikLI3m8y1ndTUCSGOM4XgHf7sijjxku5Ol
 t2G9FPskS6JmeKYZEVPCt1a9QjL0eQ3tyihIlrZDuY5QDLrINcH9gDjxvWcm5Sl9ohgM
 /K+F7ALzqkfb9PR6rkF/3G5zgAMxwmHXoNs5aWM1IGpLtGN/ET+n4ydx5yfT8ytjMtFl
 fAbG/pUUxQRg+NBV1qSgqc/9+QAt0KVGcBttTBBIF2JnVA1orm9pUImXNgZo/+3jzgMJ
 1r4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+yf1SydCNB8QrkQZR5M32GL4CqUZuqssmHYBZ9dAEEQaZgGHv9f3tk6eJLYOOIyhwe+fXTtMNy+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY2jxu1vtKszMzeqtohrA2zNCsz58E2x3+HrBRCEnmbH943r93
 /H8iwgXg25cP0AtnlLarOVYxbYIrhzl0tMUbY8jKpAnOojEE2Ko+4Jyi/LHdE9Q=
X-Gm-Gg: ASbGncsjQq+mkkdTPX82FA4pB2doX+/pjhDX6RHENS/KPLe2o/0JxPK6Bf3+C0lRcZt
 9J9OOfswTkfR3sSC+tJpP+iKAqlvDSU+F89vKIRnhN7p5HSUwKtUE+12GM6jhsPD/mfakZMEDn6
 u27/KdW+jButJqu5l3JZXuqQOPPLc6uHfUqsb9M1GwWmW0hrCsSBX+Qu93ybQQLPoXYm4WXK9WK
 Uw0dINNFRXukQHKLMDvVsGyjLHgnY8ypdqNn9UnRxODj0bphx/NvYZC7tgOCkcUs607qUWs3wnX
 IwiMtnD/ALC63lKOp6Z6xdAFHrWp6aIB4VY=
X-Google-Smtp-Source: AGHT+IHJ+dLliMlsrncfroa5visZAN+EnKWNf/e+q93+1SrC2y08Ffo1fzeccqrwlWiQWBM98iwqIg==
X-Received: by 2002:a05:600c:1d23:b0:434:9cb7:7321 with SMTP id
 5b1f17b1804b1-4396e6d8163mr36478495e9.1.1739799453088; 
 Mon, 17 Feb 2025 05:37:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439831f209bsm33076465e9.13.2025.02.17.05.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 05:37:32 -0800 (PST)
Message-ID: <df4cfdb1-66be-4264-aed3-0d5567e721f7@linaro.org>
Date: Mon, 17 Feb 2025 14:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
 <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
 <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 17/02/2025 14:13, Dmitry Baryshkov wrote:
> On Mon, Feb 17, 2025 at 12:53:17PM +0100, Krzysztof Kozlowski wrote:
>> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
>> avoid hard-coding bit masks and shifts and make the code a bit more
>> readable.  While touching the lines in dsi_7nm_pll_save_state()
>> resulting cached->pix_clk_div assignment would be too big, so just
>> combine pix_clk_div and bit_clk_div into one cached state to make
>> everything simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v4:
>> 1. Add mising bitfield.h include
>> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
>>
>> Changes in v3:
>> 1. Use FIELD_GET
>> 2. Keep separate bit_clk_div and pix_clk_div
>> 3. Rebase (some things moved to previous patches)
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 13 ++++++++-----
>>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>>  2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> @@ -739,7 +741,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>>  		u32 data;
>>  
>>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3),
>> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> 
> Nit: should this also be using dsi_pll_cmn_clk_cfg1_update() ?


This is before clocks are registered so there is really no chance for
simultaneous access.

It is rather then question of code readability or obviousness.



Best regards,
Krzysztof
