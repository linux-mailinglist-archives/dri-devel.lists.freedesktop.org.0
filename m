Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E546A0450
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 09:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329C010E4B5;
	Thu, 23 Feb 2023 08:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1825A10E4B5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 08:59:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1921561627;
 Thu, 23 Feb 2023 08:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AA2C433EF;
 Thu, 23 Feb 2023 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677142785;
 bh=F0o0cKnSDpDn6p6gfaa0cgORZZdfAcpmNCptMtkWGMo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cWrCNgIUCWybMOAM65p3P8Ow7EW0oV6gLvfnfB/z7oHJ4WQlBpGYoPSjRDxs75i1S
 /y3xaaYRQMn2K71c0cuM61aUdMHwjWbPme53J95CMuedEHrUlaM3mr1jnQFAdlLqGF
 8V9TlH0NE9pOXcxb9J+90DFGde7JdY8JnkwV7R1PSD35KUKQKgLFjar5ohBDeR8H51
 fZvVOZPXID4zCgXjav67l1hONvzxcmwfIA7sDGupVrVYmOZU/c96qPn5VUbYsTcDZG
 mdVKWcKM2oDD5VN7LHxgfIFWscSc80S1GGrsa98kDfX0rbqfg+Ws/+VF+CmLrfd5IV
 JdWA6tfarKVKQ==
Message-ID: <53cc20a0-bc9d-a094-13bc-6a5ef78069d1@kernel.org>
Date: Thu, 23 Feb 2023 09:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] Mips: ls2k1000: dts: add the display controller
 device node
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230222165514.684729-1-suijingfeng@loongson.cn>
 <f153bb62-ec3c-c16d-5b43-f53b5319c2e6@kernel.org>
 <32a56a81-e9b5-138b-4dff-35c2525cc0b6@loongson.cn>
 <f1cb010c-be28-9b1b-da1f-93d5e2fb213f@kernel.org>
 <6662546a-2c83-71bd-7050-903331201bdc@loongson.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <6662546a-2c83-71bd-7050-903331201bdc@loongson.cn>
Content-Type: text/plain; charset=UTF-8
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

On 23/02/2023 09:40, suijingfeng wrote:
> 
> On 2023/2/23 15:58, Krzysztof Kozlowski wrote:
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

                                          ^^^^^^^^^^^^
Do you see this                       ----------^^^^?

But you pasted:

> 
> I *do* run the test against the bindings and the test result say nothing.
> 
> I reset my modify today made, then re-run the test again.
> 
> I'm telling the truth: the test result say nothing. I paste the log at 
> below:
> 
> make -j$(nproc) ARCH=loongarch 
> CROSS_COMPILE=loongarch64-unknown-linux-gnu- dt_binding_check 

This -------------------------------------------^^^^^^^^^^^^


Best regards,
Krzysztof

