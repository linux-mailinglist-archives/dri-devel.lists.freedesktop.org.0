Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0AF6405E2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 12:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD8E10E576;
	Fri,  2 Dec 2022 11:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CD110E576
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 11:34:53 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so6939796lfb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 03:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DjU7gmeecy9X61DB+8CnNlr7X7DQnou4PN68yDZ7iyk=;
 b=xqC+4AXl8dQjgVXLH4YDTPUBgck4CaGtIFcFIIodspgqI6JcJCxLVhAHZPe1vUKrVU
 KfrFh0eDRyPvq9dCj+aiJWr0WPsIbRMZ+BxpCoCzz4gfxkzT5wMfxkC3sUqqUjVbAZFq
 Ra5tLu6Se62k9Txy16A7+RStF0Eb88H9j+tU8bOfD5g+wGqY++Zya42Y5/zL2oO2VGGL
 jmJJ7ZN9AVIuFmyPEmMv5CHS66NytjOSfylxmQMrHOfSaYAxP6Ym+xvMGNhtLD1FtkOm
 kaD3lO/rprhWd51PwYq6hId/45whAZsU++aApjIxItcaUau3/5izl2rTjCalX6639HC6
 Ev+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DjU7gmeecy9X61DB+8CnNlr7X7DQnou4PN68yDZ7iyk=;
 b=EUNGkgut0Qlock8Upl1w90TTPrDOdO/JkO1T5fBrvcvsxQZNy77G9K/UGoaeNE8kzi
 FHhMSJSn1bHjLWRIIVMMlAF9a9QZNjL9c1fKp68YZknzt5BddjW18V0ewb4AtlNjHxVm
 kGp/BzLtcPViUnCqg2y5HLmdxbktZ/g+SeIU3eHKX+zwsGaFLm7FOkUQB8Ri99K67dla
 HAIJozQv2kL7gXZyR1C0RUJN3c4kdDtJbK4o+R6eDZTkXWtthjJ5zR/DcSjUsdb4HIFW
 X0vwIW+Bvumx8T1qCJGt6/Se8K8PtL2A9+pUmB+7wBR4UPNOTWfHtKIwUg/yoLQoK+9R
 dyUA==
X-Gm-Message-State: ANoB5pm0od2CMFamfHOf93Ql+oIK1ehnv+vYiN3jOLalfQO8Ew0mVeT9
 mRK+ZRUXqE1Ym5o4NdW8meJfkw==
X-Google-Smtp-Source: AA0mqf7Pu/NQeIo3r9+lq4/ieJWfM9TAq2n5oJUUrQKDBvMVWk362OTbtxfdjbZaH+0tV6uJgkQsdA==
X-Received: by 2002:a05:6512:260f:b0:4b4:caeb:c9b1 with SMTP id
 bt15-20020a056512260f00b004b4caebc9b1mr16910934lfb.500.1669980891389; 
 Fri, 02 Dec 2022 03:34:51 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bp25-20020a056512159900b00497a0ea92desm986276lfb.135.2022.12.02.03.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 03:34:51 -0800 (PST)
Message-ID: <dda27c55-0d95-1407-f5a0-94123298e50a@linaro.org>
Date: Fri, 2 Dec 2022 12:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-3-luca.ceresoli@bootlin.com>
 <20221201231636.GA1660613-robh@kernel.org> <20221202091117.52a9a8f0@booty>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202091117.52a9a8f0@booty>
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/12/2022 09:11, Luca Ceresoli wrote:
> Hello Rob,
> 
> On Thu, 1 Dec 2022 17:16:36 -0600
> Rob Herring <robh@kernel.org> wrote:
> 
>> On Mon, Nov 28, 2022 at 04:23:17PM +0100, Luca Ceresoli wrote:
>>> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
>>> input module. Add it to the allowed properties and augment the existing
>>> nvidia,tegra20-vi example to show a 'vip' property.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>
>>> ---
>>>
>>> Changed in v2 (suggested by Krzysztof Kozlowski):
>>> - rename "i2c3" -> "ic2"
>>> - add review tag
>>> ---
>>>  .../display/tegra/nvidia,tegra20-vi.yaml      | 68 +++++++++++++++++++
>>>  MAINTAINERS                                   |  1 +
>>>  2 files changed, 69 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>>> index 782a4b10150a..5b5583c2b562 100644
>>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>>> @@ -74,6 +74,22 @@ properties:
>>>    avdd-dsi-csi-supply:
>>>      description: DSI/CSI power supply. Must supply 1.2 V.
>>>  
>>> +  vip:
>>> +    $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description:
>>> +          Input from the VIP (parallel input capture) module
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/graph.yaml#/properties/endpoint  
>>
>> You can drop 'endpoint'. You only need port nodes if there's no extra 
>> properties in the endpoints.
> 
> Oh, nice, will remove in v3.
> 
> Krzysztof, can I keep your Reviewed-by after this change?

Yes.

Best regards,
Krzysztof

