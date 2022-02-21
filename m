Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C24BDA07
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC60C10E702;
	Mon, 21 Feb 2022 13:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A20110E703
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:53:37 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:49386.1635481058
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 247AB100135;
 Mon, 21 Feb 2022 21:53:29 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 8927a885023a44a3b0b45b301e09b9e3 for sergei.shtylyov@gmail.com; 
 Mon, 21 Feb 2022 21:53:33 CST
X-Transaction-ID: 8927a885023a44a3b0b45b301e09b9e3
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <f7782013-6a4a-e333-369c-e8caf13997b7@189.cn>
Date: Mon, 21 Feb 2022 21:53:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 1/4] MIPS: Loongson64: dts: update the display
 controller device node
Content-Language: en-US
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-2-15330273260@189.cn>
 <08abcb14-f1f6-8be5-6309-cd16e0578c05@gmail.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <08abcb14-f1f6-8be5-6309-cd16e0578c05@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/21 17:19, Sergei Shtylyov wrote:
> On 2/20/22 5:55 PM, Sui Jingfeng wrote:
>
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> The display controller is a pci device, its PCI vendor id is 0x0014
>> its PCI device id is 0x7a06.
>>
>> 1) In order to let the driver to know which chip the DC is contained
>>     in, the compatible string of the display controller is updated
>>     according to the chip's name.
>>
>> 2) Add display controller device node for ls2k1000 SoC
>>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 8 ++++++++
>>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 7 ++-----
>>   2 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> index 768cf2abcea3..af9cda540f9e 100644
>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> @@ -209,6 +209,14 @@ gpu@5,0 {
>>   				interrupt-parent = <&liointc0>;
>>   			};
>>   
>> +			lsdc: display-controller@6,0 {
>     Shouldn't the node name just be "display", according to the section 2.2.2
> of the DT spec?
>
> [...]
>> diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
>> index 2f45fce2cdc4..ec35ea9b2fe8 100644
>> --- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
>> +++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
>> @@ -160,11 +160,8 @@ gpu@6,0 {
>>   				interrupt-parent = <&pic>;
>>   			};
>>   
>> -			dc@6,1 {
>> -				compatible = "pci0014,7a06.0",
>> -						   "pci0014,7a06",
>> -						   "pciclass030000",
>> -						   "pciclass0300";
>> +			lsdc: display-controller@6,1 {
>     Same here...
>
> [...]
>
> MBR, Sergey

Display sounds like a panel or monitor, while we are the device that driven the display device.

Running find . -name "*.dtsi" -type f | xargs grep "display-controller"
at drm-tip/arch/ directory show that there are a number of vendors using
display controller as theirnode name, for example Atmel and STM32.


./arm/boot/dts/pxa3xx.dtsi:		gcu: display-controller@54000000 {
./arm/boot/dts/at91sam9n12.dtsi:				hlcdc-display-controller {
./arm/boot/dts/at91sam9n12.dtsi:					compatible = "atmel,hlcdc-display-controller";
./arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi:	hlcdc-display-controller {
./arm/boot/dts/stm32h743.dtsi:		ltdc: display-controller@50001000 {
./arm/boot/dts/stm32mp151.dtsi:		ltdc: display-controller@5a001000 {
./arm/boot/dts/at91sam9x5dm.dtsi:	hlcdc-display-controller {
./arm/boot/dts/gemini.dtsi:		display-controller@6a000000 {
./arm/boot/dts/stm32f429.dtsi:		ltdc: display-controller@40016800 {
./arm/boot/dts/at91sam9x5_lcd.dtsi:				hlcdc-display-controller {
./arm/boot/dts/at91sam9x5_lcd.dtsi:					compatible = "atmel,hlcdc-display-controller";
./arm/boot/dts/sama5d2.dtsi:				hlcdc-display-controller {
./arm/boot/dts/sama5d2.dtsi:					compatible = "atmel,hlcdc-display-controller";
./arm/boot/dts/sama5d4.dtsi:				hlcdc-display-controller {
./arm/boot/dts/sama5d4.dtsi:					compatible = "atmel,hlcdc-display-controller";
./arm/boot/dts/sama5d3_lcd.dtsi:				hlcdc-display-controller {
./arm/boot/dts/sama5d3_lcd.dtsi:					compatible = "atmel,hlcdc-display-controller";
./arm/boot/dts/sam9x60.dtsi:				hlcdc-display-controller {
./arm/boot/dts/sam9x60.dtsi:					compatible = "atmel,hlcdc-display-controller";

./arm/boot/dts/at91-sama5d4_ma5d4evk.dts:				hlcdc-display-controller {
./arm/boot/dts/at91sam9n12ek.dts:				hlcdc-display-controller {
./arm/boot/dts/am335x-pdu001.dts:	display-controller@0 {
./arm/boot/dts/at91-nattis-2-natte-2.dts:	hlcdc-display-controller {
./arm/boot/dts/gemini-dlink-dir-685.dts:		display-controller@6a000000 {

