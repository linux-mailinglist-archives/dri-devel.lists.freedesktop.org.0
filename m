Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE044BDA0B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6A110E7BE;
	Mon, 21 Feb 2022 13:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 113CC10E7BB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:58:01 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:59254.195918271
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 563A2100135;
 Mon, 21 Feb 2022 21:57:58 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 790f91e6d89f49e2b448534c2e4e6940 for krzk@kernel.org; 
 Mon, 21 Feb 2022 21:58:00 CST
X-Transaction-ID: 790f91e6d89f49e2b448534c2e4e6940
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <50e3d6c3-93a4-c248-e6df-8ec1636f5da8@189.cn>
Date: Mon, 21 Feb 2022 21:57:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 1/4] MIPS: Loongson64: dts: update the display
 controller device node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
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
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-2-15330273260@189.cn>
 <08abcb14-f1f6-8be5-6309-cd16e0578c05@gmail.com>
 <acf6d02d-0e17-b84a-5bd8-9f5165f73915@kernel.org>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <acf6d02d-0e17-b84a-5bd8-9f5165f73915@kernel.org>
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


On 2022/2/21 18:01, Krzysztof Kozlowski wrote:
> On 21/02/2022 10:19, Sergei Shtylyov wrote:
>> On 2/20/22 5:55 PM, Sui Jingfeng wrote:
>>
>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>
>>> The display controller is a pci device, its PCI vendor id is 0x0014
>>> its PCI device id is 0x7a06.
>>>
>>> 1) In order to let the driver to know which chip the DC is contained
>>>     in, the compatible string of the display controller is updated
>>>     according to the chip's name.
>>>
>>> 2) Add display controller device node for ls2k1000 SoC
>>>
>>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>> ---
>>>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 8 ++++++++
>>>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 7 ++-----
>>>   2 files changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>> index 768cf2abcea3..af9cda540f9e 100644
>>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>> @@ -209,6 +209,14 @@ gpu@5,0 {
>>>   				interrupt-parent = <&liointc0>;
>>>   			};
>>>   
>>> +			lsdc: display-controller@6,0 {
>>     Shouldn't the node name just be "display", according to the section 2.2.2
>> of the DT spec?
> lcd-controller, led-controller. As I understood from the bindings, this
> is not physical device displaying something (like a panel) but rather a
> device controlling such panel. Therefore display-controller feels
> appropriate.
>
>
> Best regards,
> Krzysztof
Extremely correct.
