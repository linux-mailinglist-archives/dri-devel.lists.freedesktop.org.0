Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C074B9E79
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 12:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146EF10E7AA;
	Thu, 17 Feb 2022 11:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7174710E70F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:21:36 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:59904.1315278447
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 60DFA1002A9;
 Thu, 17 Feb 2022 19:21:33 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 45689aa60f704e2f9cd7547de120f433 for krzk@kernel.org; 
 Thu, 17 Feb 2022 19:21:35 CST
X-Transaction-ID: 45689aa60f704e2f9cd7547de120f433
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <f75be7e3-bf14-77f5-4885-df9786951348@189.cn>
Date: Thu, 17 Feb 2022 19:21:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 3/4] Documentation/dt: Add descriptions for loongson
 display controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220217105523.1525122-1-15330273260@189.cn>
 <20220217105523.1525122-4-15330273260@189.cn>
 <0ed34852-990d-af07-afd7-1d8ce3a2baf9@kernel.org>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <0ed34852-990d-af07-afd7-1d8ce3a2baf9@kernel.org>
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


On 2022/2/17 18:57, Krzysztof Kozlowski wrote:
> On 17/02/2022 11:55, Sui Jingfeng wrote:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> Add DT documentation for loongson display controller found in
>> LS2K1000, LS2K0500, LS7A1000 and LS7A2000.
>>
>> v2: DT binding docs and includes should be a separate patch,
>>      fix a warnning because of that.
>>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>   .../loongson/loongson,display-controller.yaml | 114 ++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> new file mode 100644
>> index 000000000000..94229519022a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> @@ -0,0 +1,114 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/loongson,display-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson LS7A2000/LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
>> +
>> +maintainers:
>> +  - Sui Jingfeng <suijingfeng@loongson.cn>
>> +
>> +description: |+
>> +
>> +  Loongson display controllers are simple which require scanout buffers
>> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
>> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
>> +  with a dedicated video ram which is 64MB or more.
>> +
>> +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
>> +  located at the DC register space. They are used to emulate two way i2c,
>> +  One for DVO0, another for DVO1.
>> +
>> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
>> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
>> +
>> +  LSDC has two display pipes, each way has a DVO interface which provide
>> +  RGB888 signals, vertical & horizontal synchronisations, data enable and
>> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
>> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
>> +
>> +  LSDC's display pipeline have several components as below description,
>> +
>> +  The display controller in LS7A1000:
>> +    ___________________                                     _________
>> +    |            -------|                                   |         |
>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monotor |
>> +    |  _   _     -------|        ^             ^            |_________|
>> +    | | | | |    -------|        |             |
>> +    | |_| |_|    | i2c0 <--------+-------------+
>> +    |            -------|
>> +    |   DC IN LS7A1000  |
>> +    |  _   _     -------|
>> +    | | | | |    | i2c1 <--------+-------------+
>> +    | |_| |_|    -------|        |             |             _________
>> +    |            -------|        |             |            |         |
>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>> +    |            -------|                                   |_________|
>> +    |___________________|
>> +
>> +  Simple usage of LS7A1000 with LS3A4000 CPU:
>> +
>> +    +------+            +-----------------------------------+
>> +    | DDR4 |            |  +-------------------+            |
>> +    +------+            |  | PCIe Root complex |   LS7A1000 |
>> +       || MC0           |  +--++---------++----+            |
>> +  +----------+  HT 3.0  |     ||         ||                 |
>> +  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
>> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
>> +  +----------+          | +--------+  +-+--+-+    +---------+   +------+
>> +       || MC1           +---------------|--|----------------+
>> +    +------+                            |  |
>> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
>> +                      +-------+                      +------+
>> +
>> +  The display controller in LS2K1000/LS2K0500:
>> +     ___________________                                     _________
>> +    |            -------|                                   |         |
>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monotor |
>> +    |  _   _     -------|        ^              ^           |_________|
>> +    | | | | |           |        |              |
>> +    | |_| |_|           |     +------+          |
>> +    |                   <---->| i2c0 |<---------+
>> +    |   DC IN LS2K1000  |     +------+
>> +    |  _   _            |     +------+
>> +    | | | | |           <---->| i2c1 |----------+
>> +    | |_| |_|           |     +------+          |            _________
>> +    |            -------|        |              |           |         |
>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>> +    |            -------|                                   |_________|
>> +    |___________________|
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - loongson,ls7a2000-dc
>> +      - loongson,ls7a1000-dc
>> +      - loongson,ls2k1000-dc
>> +      - loongson,ls2k0500-dc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
> No need for minItems, if you have maxItems:1.
>
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    lsdc: display-controller@6,1 {
>> +        compatible = "loongson,ls7a1000-dc";
>> +        reg = <0x3100 0x0 0x0 0x0 0x0>;
>> +        interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-parent = <&pic>;
>> +    };
> I still do not think you actually tested it with dt_bindings_check...
>
>
> Best regards,
> Krzysztof

I'm hurry to fix a few error in the v8 of this patch set, to avoid
reviewers get angry about those mistake in my patch.
   
I come cross a few problems when running make dt_bindings_check,
i am confusing about that, writing DT discpription of PCI display
controller is not as easy as platform one. I will fix it at next version,
thanks you.

