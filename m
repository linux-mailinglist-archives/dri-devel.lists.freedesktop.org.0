Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5E56E2730
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB9410E1D8;
	Fri, 14 Apr 2023 15:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EB010E1BB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 15:43:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id gw13so10601312wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681487030; x=1684079030;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YIbNvnDJkbKIDG9W40wHYyYsAJM6e0/VxMfL2/QQhNY=;
 b=QXpobAtYXuuja8eAnUitUYYdJFXqaConoab7s3RSbwHCOgxUoVFacXpnQJBcpA+JQb
 5N5tvC74yxQMqIqvqsop1XuZ4P+M7IaoRPqSbiY/1c2NeOfnuh57dPnBNRYtuvpOuOYQ
 d4ovTXDqN0R67vvA11ZrTveMDsLXR57NkWxMv0PtrbwpGTIEWGxabu7b6Kc4D1VC/yVL
 ftBSnh4ajvZ0aKZhcFea4GRL9sEGf22K7vufTD/WbjkwkdvB2NQi/q4ApF1oXBGDeC/I
 rZ1ZyK37G8LoSePqAYSqaAqTRIwbVHk0FT/40JaT1ZT4QJ2nRUPTFVGP/TsKf+MDR3mA
 gvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681487030; x=1684079030;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YIbNvnDJkbKIDG9W40wHYyYsAJM6e0/VxMfL2/QQhNY=;
 b=BERqAKEyln8qmEWWmDPPJf4O1gsZiPJwvaiDlTTXr1Oq8CpycLr3tRaH3Ryh0Bjf9X
 LvRj7r0GS3r2MLC9hWNNsc5nGdO4+zUBQq4ZKBmiBYmIoG9oDuBJXg9DpBgZ/PYFeQCn
 urk3XzQKgpzDEmhhqhzgmQNY4sGQd0jtYZJfsnDyyuAq/Kh8SPOSmF8ncH2F30Ct/be3
 hRCwga0Go+uzUi5kHhdpTYlLLYfIhqsA3zLNr/CDP1e8QI5bGEy5zSoZqRASNdQWtW0M
 JvDkShPlTcZ9hsOpKT1SjvpTTt/83nwI1x5OZcul6gsUlLw5vXMERd9IB+6A9kJa4enC
 fSVw==
X-Gm-Message-State: AAQBX9f+A6Y1bHLE6yxZycSaoaouog2RO7eHiyhTlDcol/BtRfSpwQxa
 XVqKYML3aN2RZIsWkD2kvy4=
X-Google-Smtp-Source: AKy350a/b5Qg3ihzSVs/aHO9rCG1Yz359ZRWoVzo+MEmLSGdlhob8RT2eGiZbxTyHZHZZ5H4owZGGA==
X-Received: by 2002:a1c:770d:0:b0:3ed:95a5:3257 with SMTP id
 t13-20020a1c770d000000b003ed95a53257mr5261946wmi.2.1681487029517; 
 Fri, 14 Apr 2023 08:43:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c458400b003f0a090d798sm6510629wmo.18.2023.04.14.08.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:43:48 -0700 (PDT)
Message-ID: <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
Date: Fri, 14 Apr 2023 17:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com,
 nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com
References: <20230414122253.3171524-1-trix@redhat.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/04/2023 14:22, Tom Rix wrote:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>          if (ret)
>              ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..c63294e451d6 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	if (!(digital_div <= 32 && digital_div >= 1))
>   		return -EINVAL;
>   
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> -			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> -			    txposdiv, digital_div);
> +	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +				  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> +				  txposdiv, digital_div);
>   	if (ret)
>   		return -EINVAL;
>   
