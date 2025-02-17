Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE48A38246
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4B710E432;
	Mon, 17 Feb 2025 11:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZUpfDABO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DABC10E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:51:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43937d315abso5553655e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 03:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739793084; x=1740397884; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=boBaE8FsMd5PXMpwiaXXEagFXKd5QEZ8O/kcdHJADSE=;
 b=ZUpfDABO9AHk71RDgeGQ+bRqoiWDRtZAoDEildmSFMgCPhAUP0hwAwL2QD2Sb6Myj/
 gEjWHXCe8SNGlSOukUcraXg9BUgdhVcr+kWYx1LnZurtM2BT7gedGiYrDiq9W9GLks8m
 r0M6ALODp8QMbbICUvdYHAB8/G4l9QUcBna9l1tJg8U114DVKIzG8zMuahXoRq8XACvW
 tUT6jslzL3aapLt4UCEJ6xlHo8qmTOVx6UFILAe1L51YLpQo+snVBtahauIVv2T2RV7k
 xuwF+e1j30Fp5frIrNBwY3/WzLBwzByU4apG4wSZJ3jddp4cpSDMRXgK3RX6mCkUW9v5
 V6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793084; x=1740397884;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=boBaE8FsMd5PXMpwiaXXEagFXKd5QEZ8O/kcdHJADSE=;
 b=pM0li4X8efYDzakeuy4LItZs7d5JAxaibej6NS7ApkJhsCTz22DdxA2rfAlrVEmCi7
 Sim+4Jv2gSNqHZwTLjikio+l/tF9zKzSv4m4xhMdpOCWITU2eIIZmyI4Lr6s3M37GWqU
 0lzPsrf+eRjILJBof8fwbnW3mOF1ILnS4qdNVvKd6kCyUDaKGePnhi9Zx0Dzz3E0zzB7
 S8iu1PO2P2UB6HNDMlAkhE2ZR7wkQ+utVNqDlltKWSG9kQMRzZaX2fpbyDrKCXTaasbE
 5N20y9jyfSd/fP3n8NpC0W3qwLxKoXXrgPXJLo0HLcjT1BLFfdQZdB0KDU8Vgy8cmVMM
 Mbbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPzXV4+1+JqA81zPmQmfzpICBhmRP1fDTWyGKFPRg5QQ2SQMfsw8DnybGiyz5RED7NKUW5k/Xlwe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtJ7dQwOy1ORRpW1uCuGh4AuRQUB/gRz7FNnSDz7O0tbtvx8aJ
 UPpp9EK9k2j0KdRassGh9Qg/G34L8Rh8ZsLCXomYZAYjidYozmTyaU6loWu2VuU=
X-Gm-Gg: ASbGncun2Iqkdi6sqOnx3RwknhxDHkGzPbf/OqpBkzloHx0r2IujcqUixbCSr9AM3OA
 l+zUJiBdH9NmJ+sHeQ0Yd6Cv3wZMVclwHuLRSOeFru/E7KFD3Piwm/kVwBuvGjxxC4xih67n/yK
 vsb/H5b7Bw5O5FCb1kteqngDtPhfMaGgWEJ2hsJ6YR5yhE2iELiOlytuzuS46Z6GxBdyTFVPk3K
 NoHh5vGoQOHp/t2NoNPPzBKOLw0/bvspZMfQVTdXlLUvYXi6Krv/PBLwP8IutXmTcVDNvTQiL61
 1sW89mXF6+WHz5j5ftb4XJHCMv0BadiBc34=
X-Google-Smtp-Source: AGHT+IGi9yee6Kch5zdJ4lFrZTfsijfYVXzBLjsh/4rp46Su5Z2UqTtgWBeW4d6pbu+ipSku6+B+DQ==
X-Received: by 2002:a05:6000:1f87:b0:38d:e078:4393 with SMTP id
 ffacd0b85a97d-38f33f38ce7mr3015012f8f.6.1739793084535; 
 Mon, 17 Feb 2025 03:51:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395aef82edsm146414205e9.38.2025.02.17.03.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 03:51:23 -0800 (PST)
Message-ID: <0e3068a7-29be-47c8-ab6f-caecccf275fd@linaro.org>
Date: Mon, 17 Feb 2025 12:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
 <vuqd6hfiobmbnll7flgltiivhbhksgz6r4uaxlmsp6dvfgmirv@mt5zkhgfl5ak>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <vuqd6hfiobmbnll7flgltiivhbhksgz6r4uaxlmsp6dvfgmirv@mt5zkhgfl5ak>
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

On 14/02/2025 16:20, Dmitry Baryshkov wrote:
> On Fri, Feb 14, 2025 at 04:08:44PM +0100, Krzysztof Kozlowski wrote:
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
>> Changes in v3:
>> 1. Use FIELD_GET
>> 2. Keep separate bit_clk_div and pix_clk_div
>> 3. Rebase (some things moved to previous patches)
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 12 +++++++-----
>>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 798168180c1ab6c96ec2384f854302720cb27932..a8a5b41b63fb78348038c8f9fbb141aab2b07c7a 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -572,11 +572,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>>  	cached->pll_out_div &= 0x3;
>>  
>>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
>> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
>> +	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
>> +	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
>>  
>>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
>> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
> 
> FIELD_GET.

Ack

> 
>>  
>>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
>>  	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
>> @@ -598,7 +598,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>>  	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
>>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
>> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
>> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
>> +				    cached->pll_mux);
> 
> DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(cached->pll_mux)
> 
>>  
>>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>>  			pll_7nm->vco_current_rate,
>> @@ -739,7 +740,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>>  		u32 data;
>>  
>>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> 
> data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3)
Ack

Best regards,
Krzysztof
