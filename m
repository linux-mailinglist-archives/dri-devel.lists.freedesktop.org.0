Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E370329B
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 18:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958810E234;
	Mon, 15 May 2023 16:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9643B10E234
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:16:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so69448965e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684167359; x=1686759359;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1eFh76R1BbOhO7jbuJiT5KDrPf1DGlfPfXIlsfDDt+0=;
 b=Qv3cGYa1MY+UApUS2SSzI8upM2KLcv3RozBn7O9YHN7jVF9JvR6Xtzh/HsxdeeQ3yR
 muaB380CPeNT2SzmI+tdjxVBFzpD82fzmUKbwNM0On0PeinadnmlPDcenRkcwfWdUnUp
 UAkshoNmew207+QEZf4lCTKuxIz3KsgnE6rCmbfPaIra7sUcQzCvyh3yqG2/HL24/dME
 VFiqLCpzE83ceqYZ54ZRrVYANzujLXdqUJaqC+1HNEgJKMbWDc1LEVu2t69MHmabcnAm
 atsE3Got5Aq9sKrefAiOXern0fE4uwFPh5uMlKirIIBr6kx2kN0pzRQ+7HtB0D+Z/yBT
 Y3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684167359; x=1686759359;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1eFh76R1BbOhO7jbuJiT5KDrPf1DGlfPfXIlsfDDt+0=;
 b=cWkBkEA7s2nBgDbFTcqXNeOfOf+7hx7ghwgvGb9yTgxGoMMw6EGOx/VLg5YSwqv6/S
 55PdWvaO++f9glA7tivnV9kyBMiy94ZJfgSgvkn/B1PNcxo5UXsYXR260oCwN1HgwQtY
 qbjM7x+iYGppisgc3mvsPzCwwaTgcynVRyUE46YfpWOZAIHbjFRCNE6uXxdY7Ydl2SmH
 oRMYeIyXz7iawf71FenJfDOkYMMU8RoGBP0SGr9JnJ9MalRxt9HXJQ2r9gHxNhLll+WR
 h+QlLOWBQXE4fJyWYLm6vW+iG/TwjqxA9evxrjWFzC6a54CZ0MuxbGGUck8EcTgoyqu8
 Tq3g==
X-Gm-Message-State: AC+VfDxG2lsRASQUGqcI7l2J3iZSTLI8m4H49hMmNyXxa+ppO81kAZYL
 WSgApThIFh4BzW28rCiEvJuFhA==
X-Google-Smtp-Source: ACHHUZ5wgr21VVtcT7Q5D+SElbddLchkhKpg+bRM3EH8a2/Wwegv+h0BQcv4jrbuguVShjaWyjs2yw==
X-Received: by 2002:a1c:7412:0:b0:3f4:298f:4d01 with SMTP id
 p18-20020a1c7412000000b003f4298f4d01mr16772932wmc.26.1684167359358; 
 Mon, 15 May 2023 09:15:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ee7:a396:6195:bb56?
 ([2a01:e0a:982:cbb0:ee7:a396:6195:bb56])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm37288889wmb.25.2023.05.15.09.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 09:15:58 -0700 (PDT)
Message-ID: <eaa3ecd0-dcf0-01d8-b3ea-9dd900215839@linaro.org>
Date: Mon, 15 May 2023 18:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 04/13] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-4-2592c29ea263@linaro.org>
 <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/05/2023 20:32, Krzysztof Kozlowski wrote:
> On 12/05/2023 15:11, Neil Armstrong wrote:
>> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
>> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
>> on the same Amlogic SoCs.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

This message may be automatic, but context is always important when reviewing,
this commit message is a re-spin on v3 that was reviewed by rob but I decided to remove the review
tags since I added a new clock and did some other cleanups.

While the process describes "how the patch itself *should* be formatted", it's a best effort
and not a blocker.

I'll fix the wrapping since you pointed out, but referring to the submitting-patches.rst
file (from a very old v5.18-rc4 version) is kind of childish.

> 
> Subject: drop second/last, redundant "bindings". The "dt-bindings"
> prefix is already stating that these are bindings.
> 
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 117 +++++++++++++++++++++
>>   1 file changed, 117 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
>> new file mode 100644
>> index 000000000000..8169c7e93ff5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
>> @@ -0,0 +1,117 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2020 BayLibre, SAS
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/amlogic,meson-g12a-dw-mipi-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description: |
>> +  The Amlogic Meson Synopsys Designware Integration is composed of
>> +  - A Synopsys DesignWare MIPI DSI Host Controller IP
>> +  - A TOP control block controlling the Clocks & Resets of the IP
>> +
>> +allOf:
>> +  - $ref: dsi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,meson-g12a-dw-mipi-dsi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 3
> 
> Missing maxItems

Ack

> 
>> +
>> +  clock-names:
>> +    minItems: 3
>> +    items:
>> +      - const: pclk
>> +      - const: bit_clk
>> +      - const: px_clk
>> +      - const: meas_clk
> 
> Drop _clk suffixes. pclk can stay, it's a bit odd but recently Rob
> clarified that suffix with underscore should not be there.

Ack

> 
>> +
>> +  resets:
>> +    minItems: 1
> 
> maxItems instead

Ack

> 
>> +
>> +  reset-names:
>> +    items:
>> +      - const: top
>> +
>> +  phys:
>> +    minItems: 1
> 
> Ditto

Ack

> 
>> +
>> +  phy-names:
>> +    items:
>> +      - const: dphy
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input node to receive pixel data.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: DSI output node to panel.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - phys
>> +  - phy-names
>> +  - ports
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    dsi@7000 {
>> +          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
>> +          reg = <0x6000 0x400>;
> 
> Your reg does not match unit address. The dt_binding_check should
> actually complain about it.

Well, it doesn't, will fix

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 

