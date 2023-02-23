Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130656A03B7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530D110E4AF;
	Thu, 23 Feb 2023 08:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31F9110E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 08:21:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8DxE0wiIvdj5wsEAA--.2607S3;
 Thu, 23 Feb 2023 16:21:54 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxK74gIvdjK4I5AA--.39097S3; 
 Thu, 23 Feb 2023 16:21:52 +0800 (CST)
Message-ID: <61df255c-1637-ed60-7542-4b00e41597e6@loongson.cn>
Date: Thu, 23 Feb 2023 16:21:52 +0800
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
 <9e890c83-495b-87d5-68bf-838c7cf0c003@kernel.org>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <9e890c83-495b-87d5-68bf-838c7cf0c003@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxK74gIvdjK4I5AA--.39097S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXrW8ur47JF1DKrWfArWDurg_yoW5Xr4DpF
 1UAa1DKr40yF17Xr4Sq34UJrnIvFWFyF1DWrsrGr1UJ3sIv3W2vr1fJr1rGry8Xry3Aayj
 v3W8CF42gFn8AaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
 C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8yrW7UUUUU==
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


On 2023/2/23 16:05, Krzysztof Kozlowski wrote:
> On 23/02/2023 08:58, Krzysztof Kozlowski wrote:
>> On 23/02/2023 04:19, Sui jingfeng wrote:
>>> Hi,
>>>
>>> On 2023/2/23 02:32, Krzysztof Kozlowski wrote:
>>>> On 22/02/2023 17:55, suijingfeng wrote:
>>>>> The display controller is a pci device, it's pci vendor id is
>>>>> 0x0014, it's pci device id is 0x7a06.
>>>>>
>>>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>>>> ---
>>>>>    .../boot/dts/loongson/loongson64-2k1000.dtsi  | 21 +++++++++++++++++++
>>>>>    1 file changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>>> index 8143a61111e3..a528af3977d9 100644
>>>>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>>>>> @@ -31,6 +31,18 @@ memory@200000 {
>>>>>    			<0x00000001 0x10000000 0x00000001 0xb0000000>; /* 6912 MB at 4352MB */
>>>>>    	};
>>>>>    
>>>>> +	reserved-memory {
>>>>> +		#address-cells = <2>;
>>>>> +		#size-cells = <2>;
>>>>> +		ranges;
>>>>> +
>>>>> +		display_reserved: framebuffer@30000000 {
>>>>> +			compatible = "shared-dma-pool";
>>>>> +			reg = <0x0 0x30000000 0x0 0x04000000>; /* 64M */
>>>>> +			linux,cma-default;
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>>    	cpu_clk: cpu_clk {
>>>>>    		#clock-cells = <0>;
>>>>>    		compatible = "fixed-clock";
>>>>> @@ -198,6 +210,15 @@ sata@8,0 {
>>>>>    				interrupt-parent = <&liointc0>;
>>>>>    			};
>>>>>    
>>>>> +			display-controller@6,0 {
>>>>> +				compatible = "loongson,ls2k1000-dc";
>>>>> +
>>>>> +				reg = <0x3000 0x0 0x0 0x0 0x0>;
>>>>> +				interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
>>>>> +				interrupt-parent = <&liointc0>;
>>>>> +				memory-region = <&display_reserved>;
>>>> NAK.
>>> Err :(,  please give me a chance to explain
>>>> Test your code against the bindings you send.
>>> I can guarantee to you that I test may code more than twice. The code
>>> used to testing is listed at link [1].
>> I wrote - test against the bindings. I don't believe that it was tested.
>> Please paste the output of the testing (dtbs_check).
> OTOH, dtschema has some hickups on loongsoon DTS, so I doubt you could
> even test it. Anyway, where is above property memory-region described in
> the bindings?

Yes, you are right. I forget to write memory-region property.

but the code provided in  loongson64-2k1000.dtsi is correct.

I do run dt_binding_check, the results seems good.

there are some problem when make dtbs_check, but it seems not relevant 
to me.

please give me more time to figure it out, i will reply to you later.

> Best regards,
> Krzysztof

