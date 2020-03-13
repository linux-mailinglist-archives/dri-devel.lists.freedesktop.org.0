Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0971848E7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 15:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270F76E9CB;
	Fri, 13 Mar 2020 14:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADC26E9CB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 14:12:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b2so6044638wrj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GX086/HMOWdDofRDhz1LqzlG9hRPL1LSuI+OEKNRV6Y=;
 b=Sns2T2BmoItGwkxTWZW0iP66NPrJXLq7xTTGq97wG/ZVgl63a3k6G4kXb19OYSqYFz
 4wZnlQBcLtEmPI2S/01wHYYuL4UcD9xKyS7QEEA+Hc/rKJ0rSJj0VKILf2yfTo3VDKvC
 7/fF2oopas/iF7/RIKZduuTGc5J62OARCMStrpxBq6oiEgq/Edjst9p3k/LWXRUMjUY/
 5GsgwlyR5hGbAiMZFulVzWS79hVixyp+/YM3l2dwgdHj1RZG2tOjW9XT15LLnl/J29oA
 3Oz/DABrqS5MNrdLVcHuRxtK4yWGMreS8NczNk/YqmZBvGq4lGdZ2z3Q6JieLMT1oiIm
 4ZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GX086/HMOWdDofRDhz1LqzlG9hRPL1LSuI+OEKNRV6Y=;
 b=CNcz8pX3a1No+ikFox8b4GW9+Ki8YCcRffhf/TzOAx5SYUVibVHa7klozwem6yAbC2
 7+I016MLTCRop3IQGWHA4eZeUI0gWrI3/WZtEONdiDzJ4oxsDyVz8TFCbLLS57SVpL1+
 2+R32FePhSELzDemyAmrjS2FBdp1xXmSjpX5DkYFp2+ePpiZZpfD0hrfpU1kWXTRV9Gw
 nLRQk1gSvFPkmbVBeio+8YbcfGImA0enepHUsORlipJQZBNxFo2j/pn1o0/LdGx0TLiZ
 QAoD6yfQQdHetwnflo9TMwYuN6FvLQ6LoT8V0bnXTdashsmloPu9/xqLD8KQUcIRMss8
 XDLA==
X-Gm-Message-State: ANhLgQ0Ct2AeLVwng4zc6Q7CYGkdS3rDVVMWSsg1lPoTZ7GG8QuX3k4B
 c+mj4tDU4xn0hfBr9ZTzqV2f2w==
X-Google-Smtp-Source: ADFU+vusI2lcuGBqQdwYdZf2hMimR2k81T1SZfk+sUe5BmMhRYRULRK1LRuFfiRQH2e9bp48UoEhUw==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr17720920wrj.196.1584108735943; 
 Fri, 13 Mar 2020 07:12:15 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o26sm16161577wmc.33.2020.03.13.07.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 07:12:15 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: add it66121 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phong LE <ple@baylibre.com>
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-3-ple@baylibre.com>
 <20200313134013.GC4751@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <03d5bb7f-db1b-79df-bd46-3ac0f3b4feb1@baylibre.com>
Date: Fri, 13 Mar 2020 15:12:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313134013.GC4751@pendragon.ideasonboard.com>
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
Cc: mark.rutland@arm.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, mchehab+samsung@kernel.org, sam@ravnborg.org,
 heiko.stuebner@theobroma-systems.com, icenowy@aosc.io,
 devicetree@vger.kernel.org, stephan@gerhold.net, jonas@kwiboo.se,
 robh+dt@kernel.org, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, jernej.skrabec@siol.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/03/2020 14:40, Laurent Pinchart wrote:
> Hi Phong,
> 
> Thank you for the patch.
> 
> On Wed, Mar 11, 2020 at 01:51:33PM +0100, Phong LE wrote:
>> Add the ITE bridge HDMI it66121 bindings.
>>
>> Signed-off-by: Phong LE <ple@baylibre.com>
>> ---
>>  .../bindings/display/bridge/ite,it66121.yaml  | 98 +++++++++++++++++++
>>  1 file changed, 98 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>> new file mode 100644
>> index 000000000000..1717e880d130
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>> @@ -0,0 +1,98 @@
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
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description: GPIO connected to active low reset
>> +
>> +  vrf12-supply:
>> +    maxItems: 1
>> +    description: Regulator for 1.2V analog core power.
>> +
>> +  vcn33-supply:
>> +    maxItems: 1
>> +    description: Regulator for 3.3V digital core power.
>> +
>> +  vcn18-supply:
>> +    maxItems: 1
>> +    description: Regulator for 1.8V IO core power.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  pclk-dual-edge:
>> +    maxItems: 1
>> +    description: enable pclk dual edge mode.
> 
> I'm having a bit of trouble understanding how this operates. Looking at
> the driver code the property is only taken into account to calculate the
> maximum allowed frequency. How is the IT66121 configured for single vs.
> dual pixel clock edge mode ?


Dual edge mode is Dual-Data-Rate mode, the normal mode is MEDIA_BUS_FMT_RGB888_1X24 and dual edge is
MEDIA_BUS_FMT_RGB888_2X12_LE (or MEDIA_BUS_FMT_RGB888_2X12_BE, not sure) on a single clock period.

This should be negociated at runtime, but the bus width should be specified somewhere to select
one of the modes.

Neil

> 
>> +
>> +  port:
>> +    type: object
>> +
>> +    properties:
>> +      endpoint:
>> +        type: object
>> +        description: |
>> +          Input endpoints of the bridge.
>> +
>> +    required:
>> +      - endpoint
> 
> You should have two ports, one for the bridge input, and one for the
> bridge output.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - vrf12-supply
>> +  - vcn33-supply
>> +  - vcn18-supply
>> +  - interrupts
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c6 {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      it66121hdmitx: it66121hdmitx@4c {
>> +        compatible = "ite,it66121";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&ite_pins_default>;
>> +        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
>> +        vcn18-supply = <&mt6358_vcn18_reg>;
>> +        vrf12-supply = <&mt6358_vrf12_reg>;
>> +        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
>> +        interrupt-parent = <&pio>;
>> +        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
>> +        reg = <0x4c>;
>> +        pclk-dual-edge;
>> +
>> +        port {
>> +          it66121_in: endpoint {
>> +            remote-endpoint = <&display_out>;
>> +          };
>> +        };
>> +      };
>> +    };
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
