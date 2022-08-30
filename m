Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB05A5EEF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449F988C4C;
	Tue, 30 Aug 2022 09:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BC610E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:10:50 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s15so5508795ljp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+vFCSexr76HlBCHcrQn/vIs9359eDZxRFYJurz0HFmo=;
 b=CnU/2NHU+5ZWMnfhlGMXRn7vd0rQke55CYHYd58495fnKVaXeP96TZWwX3JyiBzaAo
 tLa1EeOJ5RW6ctdcTRSEo3eXTALArkmWt6QIRzQv11DAXQWF6g90wcU4FLVaZwkdi1Pi
 uOZpDqJ48USDbihnJ+aAYdqMWtptMbU8/4tukJW5RQqjTnL0XKLDhC13VAObrjnIuJO9
 28/UNhVbLU90yiRpL1sjPdMXj7a91Ey1HdW7lB6r7PAVJZcC4BhPX0oR8c5pA0DUSflv
 +9TaVFt7v0YhmhuOIvkVmdHaUHIt8l+CyqgX+mLkxqQ0ya58BSGwjvQ9ab1+nitEB3Ny
 sZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+vFCSexr76HlBCHcrQn/vIs9359eDZxRFYJurz0HFmo=;
 b=yn1wv2Voa/HcsE2Gn+VfaTut5r/8TMYXUZH0MQUniWClJE5A1MnjwOgT9jp3BsX2VY
 KjL/FDyqzlkVtNJldCrsVXcGr3/z2cllxmd7WrcHt9rQVMVWP3cGgLn8CZ5xYZuz+urd
 Y2BCh34HfOKOl3Ibbf/3O/YJSPxX+W1pJbVpk3F59GyuTQ+DSwK6BdlkgXySNBl+tMHZ
 zU2HCYrNaVVNjO1TFJ6Lcxg0LQUZfYPdpcKHFgVYiC3qG3IceZC4dusKPTNaCoJs6SXI
 w3GZvD08AhVrQ2dgu76EBTinET6TPSkOKBVWPnG7XezvVAlQ2YC2QrskQH/wGQ5CzkOJ
 Al1g==
X-Gm-Message-State: ACgBeo1hqy+sjU5PuV4UJsew5uOiaS6hyIiI0K+8R9F/Ue75B4sBjtFi
 1CqF4yW41oT0UB3I1m8H7PXeqQ==
X-Google-Smtp-Source: AA6agR7NEeEYYtmJpkCNYve98HSAgJWirTpD5nfKvslXsBiBWZAoj/T37NsmSWSobBGbte7eVK4Vig==
X-Received: by 2002:a2e:534e:0:b0:261:d1b5:dbca with SMTP id
 t14-20020a2e534e000000b00261d1b5dbcamr6223939ljd.187.1661850648437; 
 Tue, 30 Aug 2022 02:10:48 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 t11-20020a2e8e6b000000b0025ebaef9570sm1684850ljk.40.2022.08.30.02.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 02:10:47 -0700 (PDT)
Message-ID: <23d2764d-17da-5d26-29ed-0b1f5418d004@linaro.org>
Date: Tue, 30 Aug 2022 12:10:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
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
> mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> current 9bit-to-10bit gamma-LUT.
> 
> This patch thus add constant compatible for mt8195, which means that
> mt8195 should only use specified mt8195 gamma driver data.
> 
> Also, delete related compatible from enum, to ensure that
> mt8195 will not accidentally get others' gamma driver data and thus
> cause fatal error.
> 
> Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0")
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a89ea0ea7542..fbd7b9664a78 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -25,11 +25,12 @@ properties:
>            - const: mediatek,mt8173-disp-gamma
>        - items:
>            - const: mediatek,mt8183-disp-gamma
> +      - items:
> +          - const: mediatek,mt8195-disp-gamma

This is one item, so not a list. With all such cases this should be
dedicated enum.

Best regards,
Krzysztof
