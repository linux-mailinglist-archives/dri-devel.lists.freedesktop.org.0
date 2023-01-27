Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611C067DF26
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 09:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1188510E402;
	Fri, 27 Jan 2023 08:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A1B10E402
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:30:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b7so4259607wrt.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PzyY2wWF97kB5fX+uFjQpPzD5PWYjl7+jY/2KBj4KNA=;
 b=DAWwPyeoXoNs6zGt2dX8uWsU8bmo4t2KFPGN+I5gbkowFsMIJjrhKcTfe1zFgbpIOk
 j9v0hKnjIaEHvszWjYbd9Nwj3opWixjLE5G6cS4AIiGtjR6Th8ckg1r1d4mKtDqvl3AI
 JTFpMSbC7pUOH1N47z7Opsi9tiEMKVYAvQyOXvkzlXpooD2tMBoY8re8s0s+AdhyRz7h
 wINbLzeb7FJvPXu5mOwKX6MrGcTWEo9zqfVU9SE/ulD2B1aVGz8D9tkDTJdfIJi43MNi
 4dyKIyN6HBAfOaRa7MTn4/FhdJ/JpBZ9nEZdqPgB2u+2oaoVW9HuaIBS8nOCV+fMOR9h
 X7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PzyY2wWF97kB5fX+uFjQpPzD5PWYjl7+jY/2KBj4KNA=;
 b=jCYygUxdOLiF9siUscMn7vAu4fOSJ9vEiWjYdZScGjIClGsIdZPNuDFalMcF6kEkg8
 7NEoO6HyCapYF5eSmxSEMtJAx4+hBPI2PyyZhcrKl3sGDUe1Aet+em5ghCaQzJfCt9qs
 1GSb42tNULqE3j9CK25hQcnMaad8xIUIFVj+00iLMvyjKNTfW/skGLKoM5mhD95SAGii
 kVicX7JWOwT4jm6QVlZlGoEKly1rVh9qETiH9u0f9akEiVI3Cn9vufIZLTwkg4zsm7M4
 9frk1z30KHfRmnmOAkuQpW9/pCqYyvYQ50h3tL0gZ+vu8vzhrCskiOObh8Ccl4ScRz0V
 NPqg==
X-Gm-Message-State: AFqh2kqNHDAAEf2ehPKyyrb0F3VtRvrYbcKszhZ+jXhDl8AoQ2Z6MJWt
 Hps2FZm5O2/kiJZDZGujMwAoIg==
X-Google-Smtp-Source: AMrXdXv5pQRXWL1U0hR5Htkz83S8q7xOPVG51oWOAn3sMt+jlNLKgrMtv7/JNUCjzi+Ka3do1eNpCQ==
X-Received: by 2002:adf:f791:0:b0:29d:f817:42c1 with SMTP id
 q17-20020adff791000000b0029df81742c1mr34873932wrp.54.1674808233556; 
 Fri, 27 Jan 2023 00:30:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a056000019100b002bddaea7a0bsm3330890wrx.57.2023.01.27.00.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 00:30:33 -0800 (PST)
Message-ID: <2e183f7b-df8a-38c6-a041-d507fc32e894@linaro.org>
Date: Fri, 27 Jan 2023 09:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tfp410: Add tfp410 i2c
 example
Content-Language: en-US
To: Jon Cormier <jcormier@criticallink.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
 <906b693d-1e85-8c17-cdda-f09ea8f12e7f@linaro.org>
 <CADL8D3YUNnsZt8tc8x9CxH5Ug6kWJHb=a3N5VJFPSePWH3yWxg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADL8D3YUNnsZt8tc8x9CxH5Ug6kWJHb=a3N5VJFPSePWH3yWxg@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bob Duke <bduke@criticallink.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Williamson <michael.williamson@criticallink.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/01/2023 19:36, Jon Cormier wrote:
> On Thu, Jan 26, 2023 at 10:40 AM Krzysztof Kozlowski <
> krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 25/01/2023 22:09, Jonathan Cormier wrote:
>>> Add a i2c example with HDMI connector
>>
>> Why? It's the same - but more on this below.
>>
> The existing example is for the previous setup where it was configured as
> its own device.  It seemed necessary now that the driver is going to
> support being connected to an i2c bus to show it being used as such.
> 
>>
>>>
>>> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
>>
>> You need to test the bindings before sending and fix the errors.
>>
> Will do
> 
>>
>>> ---
>>>  .../bindings/display/bridge/ti,tfp410.yaml         | 42
>> ++++++++++++++++++++++
>>>  1 file changed, 42 insertions(+)
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
>> b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
>>> index 4c5dd8ec2951..456214f14b47 100644
>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
>>> @@ -116,4 +116,46 @@ examples:
>>>          };
>>>      };
>>>
>>> +  - |
>>> +    i2c {
>>> +      #address-cells = <1>;
>>> +      #size-cells = <0>;
>>> +
>>> +      hdmi_encoder: tfp410@38 {
>>
>> Node names should be generic.
>>
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>
>> Can do
> 
>>> +        compatible = "ti,tfp410";
>>> +        reg = <0x38>;
>>> +
>>> +        ports {
>>> +          address-cells = <1>;
>>> +          size-cells = <0>;
>>> +
>>> +          port@0 {
>>> +            reg = <0>;
>>> +            tfp410_in: endpoint {
>>> +              remote-endpoint = <&dpi1_out>;
>>> +            };
>>> +          };
>>> +
>>> +          port@1 {
>>> +            reg = <1>;
>>> +            tfp410_out: endpoint {
>>> +              remote-endpoint = <&hdmi_connector_in>;
>>> +            };
>>
>> That's the same example as existing one, so it looks useless. I don't
>> see benefits of this example.
>>
> It's mostly the same, except defined inside an i2c bus, with the reg value
> set. Without the powerdown-gpios or ti,deskew.
> And without the pclk-sample and bus-width (these are now read from i2c)
> And I included the hdmi_connector so it would be a more complete and useful
> example of how it could be used. 

hdmi_connector is being dropped because it is not related.


> The TFP410 doesn't handle the ddc i2c bus
> on its own so a separate connector node is needed.  I'll drop it if that's
> preferred.
> 

If you had here different ports, it would be different case. But as of
now the only important part is having reg and not having gpios, so
basically almost the same example. No need for it.

Best regards,
Krzysztof

