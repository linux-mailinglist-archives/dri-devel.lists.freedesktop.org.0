Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889736A0403
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 09:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5F310EAE3;
	Thu, 23 Feb 2023 08:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C950510EAE3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 08:40:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8AxJAyEJvdjYQ0EAA--.2580S3;
 Thu, 23 Feb 2023 16:40:36 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxX+SBJvdjAIQ5AA--.4780S3; 
 Thu, 23 Feb 2023 16:40:35 +0800 (CST)
Message-ID: <6662546a-2c83-71bd-7050-903331201bdc@loongson.cn>
Date: Thu, 23 Feb 2023 16:40:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] Mips: ls2k1000: dts: add the display controller
 device node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230222165514.684729-1-suijingfeng@loongson.cn>
 <f153bb62-ec3c-c16d-5b43-f53b5319c2e6@kernel.org>
 <32a56a81-e9b5-138b-4dff-35c2525cc0b6@loongson.cn>
 <f1cb010c-be28-9b1b-da1f-93d5e2fb213f@kernel.org>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <f1cb010c-be28-9b1b-da1f-93d5e2fb213f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxX+SBJvdjAIQ5AA--.4780S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGFyDtryUCrWDZF4rCr18AFb_yoWrJFW3pF
 nxAanrKr40yF17ZryFq348JrnIvFyrAF1DWFsrtw1UJ3sIva12vr4rJr1ruF48ZrW7Za4j
 vF1rKrWIgF1kAaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
 ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
 87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
 AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
 07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
 YxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=
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


On 2023/2/23 15:58, Krzysztof Kozlowski wrote:
> On 23/02/2023 04:19, Sui jingfeng wrote:
>> Hi,
>>
>> On 2023/2/23 02:32, Krzysztof Kozlowski wrote:
>>> On 22/02/2023 17:55, suijingfeng wrote:
>>>> The display controller is a pci device, it's pci vendor id is
>>>> 0x0014, it's pci device id is 0x7a06.
>>>>
>>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>>> ---
>>>>    .../boot/dts/loongson/loongson64-2k1000.dtsi  | 21 +++++++++++++++++++
>>>>    1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>> index 8143a61111e3..a528af3977d9 100644
>>>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>> @@ -31,6 +31,18 @@ memory@200000 {
>>>>    			<0x00000001 0x10000000 0x00000001 0xb0000000>; /* 6912 MB at 4352MB */
>>>>    	};
>>>>    
>>>> +	reserved-memory {
>>>> +		#address-cells = <2>;
>>>> +		#size-cells = <2>;
>>>> +		ranges;
>>>> +
>>>> +		display_reserved: framebuffer@30000000 {
>>>> +			compatible = "shared-dma-pool";
>>>> +			reg = <0x0 0x30000000 0x0 0x04000000>; /* 64M */
>>>> +			linux,cma-default;
>>>> +		};
>>>> +	};
>>>> +
>>>>    	cpu_clk: cpu_clk {
>>>>    		#clock-cells = <0>;
>>>>    		compatible = "fixed-clock";
>>>> @@ -198,6 +210,15 @@ sata@8,0 {
>>>>    				interrupt-parent = <&liointc0>;
>>>>    			};
>>>>    
>>>> +			display-controller@6,0 {
>>>> +				compatible = "loongson,ls2k1000-dc";
>>>> +
>>>> +				reg = <0x3000 0x0 0x0 0x0 0x0>;
>>>> +				interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
>>>> +				interrupt-parent = <&liointc0>;
>>>> +				memory-region = <&display_reserved>;
>>> NAK.
>> Err :(,  please give me a chance to explain
>>> Test your code against the bindings you send.
>> I can guarantee to you that I test may code more than twice. The code
>> used to testing is listed at link [1].
> I wrote - test against the bindings. I don't believe that it was tested.
> Please paste the output of the testing (dtbs_check).

I *do* run the test against the bindings and the test result say nothing.

I reset my modify today made, then re-run the test again.

I'm telling the truth: the test result say nothing. I paste the log at 
below:

make -j$(nproc) ARCH=loongarch 
CROSS_COMPILE=loongarch64-unknown-linux-gnu- dt_binding_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml 
dtbs_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml

   DTEX 
Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dts
   DTC_CHK 
Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dtb


I remember, if there anything wrong, rob's test robot will complain.

let's wait and witness.

>> This patchset  mainly used to illustrate how  we made the driver in [1]
>> usable on our SoC platform.
>>
>>> It's the same
>>> patchset. You basically send something which the same moment is incorrect.
>> Loongson display controller IP has been integrated in both Loongson
>> North Bridge chipset(ls7a1000 and ls7a2000) and Loongson SoCs(ls2k1000
>> and ls2k2000 etc), it even has been included in Loongson BMC(ls2k0500 bmc)
>> products.
> I don't understand how your reply here is relevant to incorrect bindings
> or incorrect DTS according to bindings.

Ok, now I know that you refer to the bindings.

I'm a newbie at DT bindings, but i will correct all of the problem you 
mentioned.

It takes a few time, thanks for  your valuable advice.

>
> Best regards,
> Krzysztof

