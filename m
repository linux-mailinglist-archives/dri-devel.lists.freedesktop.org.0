Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D3162E364
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D54910E65F;
	Thu, 17 Nov 2022 17:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8494410E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 17:49:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id c25so3659720ljr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 09:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oKps2kj8vyioDRFfnDtXuYlVJybPlQiLeu0C1JmglC0=;
 b=DuNRImNUYAM9cXvN3ZheeodNKt4sZu1SzG7HzaUYBDsffFPakszDtyQfV3nYY103tR
 TzJJ505h03FRuj0vuH/xW7SU0KKAl++T8l353Opez4Qw68bEokbGrrIpRqL57pqipOaI
 VBBS27iR0paB2fXDQoJ44ljd8Za65G1HJIyMXU3pdgsKV3vweNf6a+QdDTJdcTSQqBpG
 iIJSyDMckDE8dXlrm3xL33sVzL80fsncQ6MhRHoJfQ1kPl28jkz3co0531TtU0Ix6C6B
 f8Ai09k9C1W7dLmoyV8iWp2Wsmw2n6aY48Vvhnerx9qSFjPZBo2TKT+vZpXWCEpG1PNL
 Sriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oKps2kj8vyioDRFfnDtXuYlVJybPlQiLeu0C1JmglC0=;
 b=l3Ua7aJYI2fj0J7plHXeERgtnd1pVpMOQfK/yHZoTxN4xSsoC4Tu28UDRkX1j3Z2jJ
 vLO+Ctr5nOMh6SDgY7UvbBJBhGEPvP9fTMClKQD7Xak7Btow/1xfsCxm9wm3NqVFXE5A
 bhsSC4+1Ar2Y6FmleTih/QBZ/kGu1HT8huB2O2n0V5nD9p8qGfJWEClYBsFWBPczDnlJ
 /qOXrwtUZgJbJi2EV3jcEQZVwxNqcO3giaFE5toepO8LX22uNs+NqatNgUHwEZdP1+m5
 3Z1Lx6QKn8D6Zyz6fjyZrFDEJlWAYyDK97Ono3Y/GwA3y8DmBvug3Ei7NsOnwL/amzA8
 m80g==
X-Gm-Message-State: ANoB5pnUCycQamWQp2NLAHITblARqYFge6tEc5SB2fA2QRv8pj8SOoU9
 rogTs/iJ8Y27wnd7YAeUVElSAg==
X-Google-Smtp-Source: AA0mqf51Os+HnRrnHg9xxz4KBwdAm2B2vV6ky4H0rkIvKUTHbBLN4yaPF9EoABdMDFxnSPz+8qWbnA==
X-Received: by 2002:a05:651c:1592:b0:277:b9f:cdbd with SMTP id
 h18-20020a05651c159200b002770b9fcdbdmr1561707ljq.0.1668707343815; 
 Thu, 17 Nov 2022 09:49:03 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j8-20020ac253a8000000b004946a1e045fsm247258lfh.197.2022.11.17.09.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 09:49:03 -0800 (PST)
Message-ID: <2b0463c1-7fee-b7f0-5cf7-0448a6aab4a7@linaro.org>
Date: Thu, 17 Nov 2022 18:49:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1] dt-bindings: display: Convert fsl,imx-fb.txt to
 dt-schema
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
 <20221116174921.GA25509@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116174921.GA25509@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2022 18:49, Philipp Zabel wrote:
> On Thu, Nov 10, 2022 at 10:49:45AM +0100, Uwe Kleine-König wrote:
> [...]
>> new file mode 100644
>> index 000000000000..c3cf6f92a766
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx-lcdc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX LCD Controller, found on i.MX1, i.MX21, i.MX25 and i.MX27
>> +
>> +maintainers:
>> +  - Sascha Hauer <s.hauer@pengutronix.de>
>> +  - Pengutronix Kernel Team <kernel@pengutronix.de>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - fsl,imx1-fb
>> +              - fsl,imx21-fb
> 
> Are the items/enum keywords superfluous here? Couldn't this just be two
> 
>          - const: fsl,imx1-fb
>          - const: fsl,imx21-fb
> 
> entries?

Only "items" is, so should be dropped.

Best regards,
Krzysztof

