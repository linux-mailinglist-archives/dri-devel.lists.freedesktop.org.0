Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10B4E8BC7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 03:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2634110E0EB;
	Mon, 28 Mar 2022 01:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0570010E0EB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 01:53:20 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:53434.1335546779
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 6258A1002E0;
 Mon, 28 Mar 2022 09:52:31 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 99efaa0237f14c4d90846b278cc6f86f for jiaxun.yang@flygoat.com; 
 Mon, 28 Mar 2022 09:53:18 CST
X-Transaction-ID: 99efaa0237f14c4d90846b278cc6f86f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <30b8ee6e-d890-a76a-96fd-080042af1d7a@189.cn>
Date: Mon, 28 Mar 2022 09:52:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12 3/6] dt-bindings: display: Add Loongson display
 controller
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220327113846.2498146-1-15330273260@189.cn>
 <20220327113846.2498146-4-15330273260@189.cn>
 <169412ca-9167-b214-d613-4fe0e76ad36a@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <169412ca-9167-b214-d613-4fe0e76ad36a@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/27 20:54, Jiaxun Yang wrote:
>
>
> 在 2022/3/27 12:38, Sui Jingfeng 写道:
>> Add DT bindings and simple usages for Loongson display controller
>> found in LS7A1000 bridges chip and LS2k1000 SoC.
>>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> [...]
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    bus {
>> +
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        #interrupt-cells = <2>;
>> +
>> +        display-controller@6,1 {
>> +            compatible = "loongson,ls7a1000-dc";
>> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
>> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            i2c@6 {
>> +                compatible = "loongson,gpio-i2c";
>> +                reg = <0x00001650 0x00000020>;
> Hi Jingfeng,
>
> Thanks for your patch.
>
> Just curious about what is this "reg" for?

Hi, Jiaxun

Thanks for you take valuable time to review my patch.

Without it make dt_binding_check generate warnings:

Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dts:65.23-73.19: 
Warning (unit_address_vs_reg): 
/example-1/bus/display-controller@6,1/i2c@6: node has a unit name, but 
no reg or ranges property

reg are the control register offset and size of the dedicate GPIO, they 
are not get used by the driver currently,

put in there just for silence the warning .


>> +                loongson,nr = <6>;
> Why nr start from 6?


Bus number greater than 6 is safe  because ls7a1000 bridge have 6 hardware I2C controller integrated. but 
the driver for it is not upstream yet. To avoid potential conflict with the bus number of the hardware I2C driver.

In the future, if someone contribute the hardware I2C driver to upstream,
you don't need change it. Let me give you an example to show what it will be:

  	aliases {
		i2c0 = &i2c0;
		i2c1 = &i2c1;
		i2c2 = &i2c2;
		i2c3 = &i2c3;
		i2c4 = &i2c4;
		i2c5 = &i2c5;
		i2c6 = &i2c6;
		i2c7 = &i2c7;
	};

	i2c0: i2c@10090000 {
		compatible = "loongson,ls-i2c";
		reg = <0x10090000 0x8>;
		interrupts = <73>;
		interrupt-parent = <&platic>;
		#address-cells = <1>;
		#size-cells = <0>;
	};


	i2c1: i2c@10090100 {
		compatible = "loongson,ls-i2c";
		reg = <0x10090100 0x8>;
		interrupts = <73>;
		interrupt-parent = <&platic>;
		#address-cells = <1>;
		#size-cells = <0>;
	};

	i2c2: i2c@10090200 {
		compatible = "loongson,ls-i2c";
		reg = <0x10090200 0x8>;
		interrupts = <73>;
		interrupt-parent = <&platic>;
		#address-cells = <1>;
		#size-cells = <0>;
	};

	i2c3: i2c@10090300 {
		compatible = "loongson,ls-i2c";
		reg = <0x10090300 0x8>;
		interrupts = <73>;
		interrupt-parent = <&platic>;
		#address-cells = <1>;
		#size-cells = <0>;
	};

	i2c4: i2c@10090400 {
		compatible = "loongson,ls-i2c";
		reg = <0x10090400 0x8>;
		interrupts = <73>;
		interrupt-parent = <&platic>;
		#address-cells = <1>;
		#size-cells = <0>;
	};

	i2c5: i2c@10090500 {
		compatible = "loongson,ls-i2c";
		reg = <0x10090500 0x8>;
		interrupts = <73>;
		interrupt-parent = <&platic>;
		#address-cells = <1>;
		#size-cells = <0>;
	};

> The approach you are handling I2C seems to be wired..
>

It is not wired,  you can change it to 0 or 1 it you like currently,

you can even remove loongson,nr = <6> and loongson,nr = <7>,

then the i2c core driver will automatically  allocate one for you.

It is very flexible actually.

> Actually you can reference how network subsystem is handling
> MDIO controller built-in into Ethernet controller [1] in this case. It is
> basically the same problem.
>
> [1]: 
> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>
> Thanks.
> - Jiaxun
>
>> +                loongson,sda = <0>;
>> +                loongson,scl = <1>;
>> +                loongson,udelay = <5>;
>> +                loongson,timeout = <2200>;
>> +            };
>> +
>> +            i2c@7 {
>> +                compatible = "loongson,gpio-i2c";
>> +                reg = <0x00001650 0x00000020>;
>> +                loongson,nr = <7>;
>> +                loongson,sda = <2>;
>> +                loongson,scl = <3>;
>> +                loongson,udelay = <5>;
>> +                loongson,timeout = <2200>;
>> +            };
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +                    endpoint {
>> +                            remote-endpoint = <&vga_encoder_in>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    endpoint {
>> +                            remote-endpoint = <&dvi_encoder_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    bus {
>> +
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        #interrupt-cells = <2>;
>> +
>> +        display-controller@6,0 {
>> +            compatible = "loongson,ls2k1000-dc";
>> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
>> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +                    endpoint {
>> +                            remote-endpoint = <&panel_in>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    endpoint {
>> +                            remote-endpoint = <&hdmi_encoder_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>
