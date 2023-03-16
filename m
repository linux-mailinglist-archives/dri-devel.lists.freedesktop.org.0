Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330276BCE68
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B62D10ECB2;
	Thu, 16 Mar 2023 11:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3F810ECAB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:37:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ek18so6321505edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678966619;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AfGhbI5w3WuDswJbCQtfkPCMptbW1heMaZynDig3b6o=;
 b=WdZEAyLcSkyP3jHiliNzzURVyP5bg0AhOJ/n1KD+xejldEkacpeekFFOUFx+zld37q
 U9EEZKk6uTvjNmm3UZZSpWL2MlXnABLnKMcCOdnPawFhuhCC3VMOuegNF1qvL6zd9WgM
 V507GkNiQG30Fj5zDyS0pi8sdPl1/sBVbh14SQGRObgzt6vNOd+8zSrqqi4sGKTuuPXC
 TTVujg0DzKVp4ZIAjD/8lFnLO+i8MHz/q/sl3QRwK002rNkmNRflt1cK5NEOLpUMlgkR
 POjrdhmPwHciq4cFWboHsEjP6oZ1SqATu6+yc9l5zY2xKj6TZ3Q7o+RkI0RAfcNjN4I8
 l8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678966619;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AfGhbI5w3WuDswJbCQtfkPCMptbW1heMaZynDig3b6o=;
 b=Ew67InCGhQQWgl4lpHyQ9BfNhMhVgq8Fap2CoI7PSmlL7rslJ2xiFcyRvxsbgwTAka
 qsRO76mm8Filf3uQv1q/2uEoVKe67MHFLZn50ctn1H+g7AKbUKwg6nybqRcgRWXcLZVk
 X99/gqYT6/zEE7dTq147JTGPxH1qBzAHj1cLNg7vJHEU+wObJ5YCTUtu5PQYa37cb7yN
 tH7SUHiHg0LX2JvJK50qGFLQVAcqcsLm0fqtELUgArvr6w6JqliEDxQTT9RwiTro42lp
 QkowrBgJPrIA02UhtX3vhu6sgUsoslEtAoFUAHnv5pNN57PG6quIxbV9Ju39bAOH6yWh
 DxOA==
X-Gm-Message-State: AO0yUKUflb5/g4dn/3oHf+1JHQYvA7m9g0cqFHYHeB/W6tWIoTR4O6Au
 pi2txHvWFXxvaZGwk3mtxyjKtA==
X-Google-Smtp-Source: AK7set80wKzIShLBKFRFwgznGN61cTEyjNtx9HtLBiDrk9zBalX963QlSRikXu3lp1lrDTbm0tt4Fg==
X-Received: by 2002:a05:6402:418:b0:4fc:52c0:df10 with SMTP id
 q24-20020a056402041800b004fc52c0df10mr6125485edv.26.1678966619655; 
 Thu, 16 Mar 2023 04:36:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 si2-20020a170906cec200b008e68d2c11d8sm3728845ejb.218.2023.03.16.04.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 04:36:59 -0700 (PDT)
Message-ID: <0ebf187d-972e-4228-d8a0-8c0ce02f642d@linaro.org>
Date: Thu, 16 Mar 2023 12:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
 <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
 <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2023 10:53, AngeloGioacchino Del Regno wrote:

> Hello Krzysztof, Nancy,
> 
> Since this series has reached v29, can we please reach an agreement on the bindings
> to use here, so that we can get this finally upstreamed?
> 
> I will put some examples to try to get this issue resolved.
> 
> ### Example 1: Constrain the number of GCE entries to *seven* array elements (7x4!)
> 
>    mediatek,gce-client-reg:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>      description: The register of display function block to be set by gce.
>        There are 4 arguments in this property, gce node, subsys id, offset and
>        register size. The subsys id is defined in the gce header of each chips
>        include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
>        function block.
>      items:
>        minItems: 28
>        maxItems: 28
>        items:                     <----- this block doesn't seem to get checked :\
>          - description: phandle of GCE
>          - description: GCE subsys id
>          - description: register offset
>          - description: register size

This is what we would like to have but it requires exception in
dtschema. Thus:

> 
> 
> ### Example 2: Don't care about constraining the number of arguments
> 
>    mediatek,gce-client-reg:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>      description: The register of display function block to be set by gce.
>        There are 4 arguments in this property, gce node, subsys id, offset and
>        register size. The subsys id is defined in the gce header of each chips
>        include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
>        function block.

use this.

Best regards,
Krzysztof

