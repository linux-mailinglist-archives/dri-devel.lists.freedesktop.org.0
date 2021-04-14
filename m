Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE10535EF1E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0A06E47E;
	Wed, 14 Apr 2021 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6763A6E47E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 08:14:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so9920841wrt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AzOeHUL5hWREqhzcyblXs0nwBc2sByyKR9pZRnAp0AI=;
 b=0FmOSwJTluFKGhZXB4mnmPu/678q4lQVbHX5xKkleebC4yuu2Roe12fLkCO4z4yT0w
 9zQnJRSNRxWV7DsOe/mDJfw6sCW6yvcK5nYcIaYEikqylBLKWTu9WezbOY6XfpeUvmGk
 ijGprdgw8ZPAAa3PNPNMzFtK3LmpzC8QnGoQTVjxDFD+9Kfh8pGdZu2HqsG7FU0xK3Az
 ADi19P7BqgzRRJRkrTO9rUEiO/VFiUTfRPduRqqoK6zKyUtDPFEZjmgWKod/zNgNXhOm
 C6vAj/2HUQp4/3ro+DWNtg1dL2U35wOqw1bPMFoaSwWDKqdqC2RTXXD/w0fy6+iKziKk
 TWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=AzOeHUL5hWREqhzcyblXs0nwBc2sByyKR9pZRnAp0AI=;
 b=hYZaep4G+Cz3KW7XFyyB/PIfA8gMEiFi6cLObix1G0gbIBeCXkrwID6hq+jAOHK0dG
 VcTjPlvabPFmDNh6XO5Gfyz8TGjw9YdvFpaKe1A75ObT7zl5uDmJwoiHISPmsaqjlegG
 2Q6zq4j906o0JutX4QfweWKaIsSYQ+mSc3OTqE5/221yvKiYyLcWAf3Plmc/jzO90h0g
 c2yeBnVMmm7TZea4I3wp0hFbgxIdl8fwiB9elfe5E6A4uGkdqHObVGGlLNnEHnbqen2P
 HVPdptwomyQDX4KmqqIf1qtraeRbPHYozdbCjEjgcmeFnO+b5TNrpsmfrDZIeqsbuvRP
 e8VQ==
X-Gm-Message-State: AOAM533A3BAnHzhBkhy3cTNvfKZNT2WiyeogeeENU6rBfHf9FzeMeWjz
 0p0j2NekenP9OPPjOR2dVlU5qQ==
X-Google-Smtp-Source: ABdhPJzv2P3PwzGpjC5Oyj4tupZbVhAGn5ScmnavLeXSMF+c6aZxXfPaA4hgLXQ1YSsw26NNBLO+hw==
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr14291716wrw.270.1618388077948; 
 Wed, 14 Apr 2021 01:14:37 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:49d:95f:49d5:fff7?
 ([2a01:e0a:90c:e290:49d:95f:49d5:fff7])
 by smtp.gmail.com with ESMTPSA id d5sm27606092wrx.0.2021.04.14.01.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 01:14:37 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] dt-bindings: display: bridge: add it66121 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-2-narmstrong@baylibre.com>
 <YHXA0KFylvC7FDbK@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7111ccdf-ff64-f959-a652-623fa89ffe87@baylibre.com>
Date: Wed, 14 Apr 2021 10:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHXA0KFylvC7FDbK@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, paul@crapouillou.net,
 a.hajda@samsung.com, dri-devel@lists.freedesktop.org,
 Phong LE <ple@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2021 18:03, Laurent Pinchart wrote:
> Hi Neil,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 05:46:46PM +0200, Neil Armstrong wrote:
>> From: Phong LE <ple@baylibre.com>
>>
>> Add the ITE bridge HDMI it66121 bindings.
>>
>> Signed-off-by: Phong LE <ple@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../bindings/display/bridge/ite,it66121.yaml  | 123 ++++++++++++++++++
>>  1 file changed, 123 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>> new file mode 100644
>> index 000000000000..61ed6dc7740b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>> @@ -0,0 +1,123 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ITE it66121 HDMI bridge Device Tree Bindings
>> +
>> +maintainers:
>> +  - Phong LE <ple@baylibre.com>
>> +  - Neil Armstrong <narmstrong@baylibre.com>
>> +
>> +description: |
>> +  The IT66121 is a high-performance and low-power single channel HDMI
>> +  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward compatible
>> +  to DVI 1.0 specifications.
>> +
>> +properties:
>> +  compatible:
>> +    const: ite,it66121
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: base I2C address of the device
> 
> You can drop the description.

Done

> 
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description: GPIO connected to active low reset
>> +
>> +  vrf12-supply:
>> +    description: Regulator for 1.2V analog core power.
>> +
>> +  vcn33-supply:
>> +    description: Regulator for 3.3V digital core power.
>> +
>> +  vcn18-supply:
>> +    description: Regulator for 1.8V IO core power.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: DPI input port.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              bus-width:
>> +                description:
>> +                  Endpoint bus width.
>> +                enum:
>> +                  - 12  # 12 data lines connected and dual-edge mode
>> +                  - 24  # 24 data lines connected and single-edge mode
>> +                default: 24
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: HDMI Connector port.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - vrf12-supply
>> +  - vcn33-supply
>> +  - vcn18-supply
>> +  - interrupts
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
> 
> It's customary to indent DT examples with 4 spaces.

Done

> 
>> +
>> +      it66121hdmitx: it66121hdmitx@4c {
>> +        compatible = "ite,it66121";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&ite_pins_default>;
>> +        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
>> +        vcn18-supply = <&mt6358_vcn18_reg>;
>> +        vrf12-supply = <&mt6358_vrf12_reg>;
>> +        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
> 
> You can #include the necessary headers at the top of the example, and
> use GPIO_ACTIVE_LOW and IRQ_TYPE_LEVEL_LOW to replace the numerical
> values.

Done

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,
Neil

> 
>> +        interrupt-parent = <&pio>;
>> +        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
>> +        reg = <0x4c>;
>> +
>> +        ports {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          port@0 {
>> +            reg = <0>;
>> +            it66121_in: endpoint {
>> +              bus-width = <12>;
>> +              remote-endpoint = <&display_out>;
>> +            };
>> +          };
>> +
>> +          port@1 {
>> +            reg = <1>;
>> +            hdmi_conn_out: endpoint {
>> +              remote-endpoint = <&hdmi_conn_in>;
>> +            };
>> +          };
>> +        };
>> +      };
>> +    };
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
