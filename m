Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337FD5A5EF7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8844588F94;
	Tue, 30 Aug 2022 09:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6C288EFF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:13:21 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bq23so14647296lfb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=85ddw98iKNFdMuScvqYcAwOPIMZilnqs6BhTFJ5fmQo=;
 b=RxXyqq8+0Sxkf95IUpCyHZevRPKgc/uV5kRhgHRSayzKqoncb1jP95k6uoqpB+Q7Ih
 XbDvlK7PdYc4wBljUVJm4e7bC6hgCSPMsCRiqAQT5lD/IYU2O6yQR6uF29h0OwYG5Jft
 lW+dJJNbBhSClZ4dtreIM5qESkCbodSoEsmYEC0Jt0OghwP+Au7FMDroyDf9vY38R105
 jANwEVyNnrniE9bcocSlxFMaPHqTTp+j+S5uXy9c/c7zsy9JKWQK2j1uet5Td2os0RoZ
 hWLBySci78bEdowzZO29kvGhhxBSGFoGJHHxxIFzHWfj9GK78HFt/hsI9rADW/JLcgVD
 Iilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=85ddw98iKNFdMuScvqYcAwOPIMZilnqs6BhTFJ5fmQo=;
 b=ICEhtZnVEMCUN3A19l7tEP6qXLnUGsBE5M/tN5JF5axFm2VUKDqlILjkqpIOBW7RAJ
 j5IrHyJhpYADd+0jvpGuDihuHEa8hjSv65Tplc1SIKtK0fBWjrZLU7vHWPkwDnClk9J2
 MFmEJqbCXJaAMaUZVgfToC9GWe4mu4EpA4qJSkdFeG8mquF6iKUF88bBCrEr1xI4EIBB
 YZmXMRzNoP6ORcnGjiXun9fhtbnPLOQFzRZT/EMbjJlpYnH5Ta49h6f3lm9SIssER6QE
 p4auY2PZE3qcCCzkrgw6Bi3FMO8rGB/JVZZ70rzn22TX5VH9Dhm3WrlM9/PCX9s3l1eB
 misw==
X-Gm-Message-State: ACgBeo3r9tZPtkeQlIhEJKfnQ+ayhRGHEZ26knw1s5lqtA4Aw9moaJAM
 quNge0lxfLFkxvtpynWToIBcFiYOmJ3XvpRlpFM=
X-Google-Smtp-Source: AA6agR6Epke9TZidjS+t7TVXu/nI8IDXuv2Zcj4qF33M58gVrL9aocLEX9bOQfB3mw2k5CxN4EZ2zg==
X-Received: by 2002:a05:6512:4012:b0:492:c667:c899 with SMTP id
 br18-20020a056512401200b00492c667c899mr7177797lfb.48.1661850799778; 
 Tue, 30 Aug 2022 02:13:19 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 v1-20020a05651203a100b0049482adb3basm11931lfp.63.2022.08.30.02.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 02:13:19 -0700 (PDT)
Message-ID: <e668a86b-f47b-bc42-440a-a74591827ccb@linaro.org>
Date: Tue, 30 Aug 2022 12:13:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/08/2022 09:39, zheng-yan.chen wrote:
> Modify gamma compatible for mt8195.

Commit should explain why. "What" we all can easily see.
> 
> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for vdosys0")

Your patchset is not bisectable and might cause ABI break. I doubt that
it matches the criteria of backports, especially that you did not
describe here bug being fixed.

Drop the tag and explain reasons for ABI break.

> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index a50ebb5d145f..d4110f6fac62 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2022,7 +2022,7 @@
>  		};
>  
>  		gamma0: gamma@1c006000 {
> -			compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";
> +			compatible = "mediatek,mt8195-disp-gamma";
>  			reg = <0 0x1c006000 0 0x1000>;
>  			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;


Best regards,
Krzysztof
