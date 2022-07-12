Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E478C5727B2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 22:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC4C96093;
	Tue, 12 Jul 2022 20:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C9094880
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 20:50:29 +0000 (UTC)
Received: from [192.168.1.101] (abxj14.neoplus.adsl.tpnet.pl [83.9.3.14])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2C52A3F219;
 Tue, 12 Jul 2022 22:50:27 +0200 (CEST)
Message-ID: <9b535332-838d-6662-d0eb-feab075b2915@somainline.org>
Date: Tue, 12 Jul 2022 22:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Sony Tama TD4353 JDI
 display panel
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220712200244.960018-1-konrad.dybcio@somainline.org>
 <68b8da6a-03e2-9da7-795d-f028bc0ed05b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <68b8da6a-03e2-9da7-795d-f028bc0ed05b@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.07.2022 22:47, Krzysztof Kozlowski wrote:
> On 12/07/2022 22:02, Konrad Dybcio wrote:
>> Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
>> Compact smartphones.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>>  .../display/panel/sony,td4353-jdi.yaml        | 84 +++++++++++++++++++
>>  1 file changed, 84 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
>> new file mode 100644
>> index 000000000000..d75abc72ad1b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
>> @@ -0,0 +1,84 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/sony,td4353-jdi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sony TD4353 JDI 5 / 5.7" 2160x1080 MIPI-DSI Panel
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>> +
>> +description: |
>> +  The Sony TD4353 JDI is a 5 (XZ2c) / 5.7 (XZ2) inch 2160x1080
>> +  MIPI-DSI panel, used in Xperia XZ2 and XZ2 Compact smartphones.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - sony,td4353-jdi-akari
>> +      - sony,td4353-jdi-apollo
> 
> Shouldn't the properties of panel like width and height be specified by
> dedicated properties, instead of customizing compatible? The device is
> "td4353-jdi", the same in both cases, isn't it?
Not sure if it should, but in this case it probably could, the panels are
software-compatible, yes.

> 
>> +
>> +  reg: true
>> +
>> +  backlight: true
>> +
>> +  vddio-supply:
>> +    description: VDDIO 1.8V supply
>> +
>> +  vsp-supply:
>> +    description: Positive 5.5V supply
>> +
>> +  vsn-supply:
>> +    description: Negative 5.5V supply
>> +
>> +  preset-gpios:
>> +    description: Display panel reset pin
>> +
>> +  treset-gpios:
>> +    description: Touch panel reset pin
>> +
>> +  port: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - vddio-supply
>> +  - vsp-supply
>> +  - vsn-supply
>> +  - preset-gpios
>> +  - treset-gpios
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        panel: panel@0 {
>> +            compatible = "sony,td4353-jdi-akari";
>> +            reg = <0>;
>> +
>> +            backlight = <&pmi8998_wled>;
>> +            vddio-supply = <&vreg_l14a_1p8>;
>> +            vsp-supply = <&lab>;
>> +            vsn-supply = <&ibb>;
>> +            preset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
>> +            treset-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
>> +
>> +            port {
>> +                    panel_in: endpoint {
> 
> Inconsistent indentation.
Will fix.

Konrad
> 
>> +                            remote-endpoint = <&dsi0_out>;
>> +                    };
>> +            };
>> +        };
>> +    };
>> +...
> 
> 
> Best regards,
> Krzysztof
