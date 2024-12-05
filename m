Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C29E4E43
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 08:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA8310E159;
	Thu,  5 Dec 2024 07:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M5t80+72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B021410E159
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 07:27:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7568BA420C4;
 Thu,  5 Dec 2024 07:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E161EC4CED1;
 Thu,  5 Dec 2024 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733383640;
 bh=SuJc6mzm5VsH730y7QpEg/itX9dQOpdmKNjQ5iekAEc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M5t80+72qrafHWqFAajm0rw62IqA0kCmRHbuEeFgDKgb7NzLNU+ZFygAdw36lJ2HN
 izmCMVJxN58ymkwAM4bmE0WEe8URuFA7696Z+R06mQBreOwGJKclSRxiUVJPRAyC/N
 w8vCIM4ZQDN9jM1QjL+ZNKlv225yri3B2UuHd0eGImvsUnDGhbtKhZrRKZ3v47cqBk
 FC540Tyhq7Df7JOxguYxR95MAY/kO6TysgQksysPC/MUY/v5X2mC/sOp3xEiAOQufx
 AlHo/BR77b7UX3EkZ2IDPMJyfOScZV/zRTAUZ9LMvWJVKAYClolkG2SxJMinrZTyzY
 CE+QRhiLlgb9A==
Message-ID: <9c6d9a42-78e8-4cf0-9591-c3d009fee582@kernel.org>
Date: Thu, 5 Dec 2024 08:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 05/14] dt-bindings: clock: thead,th1520: Add
 support for Video Output subsystem
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com>
 <20241203134137.2114847-6-m.wilczynski@samsung.com>
 <f21ffd12-167b-4d10-9017-33041ec322b0@kernel.org>
 <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2024 11:11, Michal Wilczynski wrote:
> 
> 
> On 12/3/24 16:45, Krzysztof Kozlowski wrote:
>> On 03/12/2024 14:41, Michal Wilczynski wrote:
>>> The device tree bindings for the T-Head TH1520 SoC clocks currently
>>> support only the Application Processor (AP) subsystem. This commit
>>> extends the bindings to include the Video Output (VO) subsystem clocks.
>>>
>>> Update the YAML schema to define the VO subsystem clocks, allowing the
>>> clock driver to configure and manage these clocks appropriately. This
>>> addition is necessary to enable the proper operation of the video output
>>> features on the TH1520 SoC.
>>>
>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>> ---
>>>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 31 +++++++++++++++----
>>>  1 file changed, 25 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>>> index 4a0806af2bf9..5a8f1041f766 100644
>>> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>>> @@ -4,11 +4,13 @@
>>>  $id: https://protect2.fireeye.com/v1/url?k=f595e769-941ef222-f5946c26-74fe485fb305-6d0b73471bbfc1a2&q=1&e=6b918e4d-d81f-4b44-8516-776d7b4f9dae&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fthead%2Cth1520-clk-ap.yaml%23
>>>  $schema: https://protect2.fireeye.com/v1/url?k=5b94114b-3a1f0400-5b959a04-74fe485fb305-0e2c50f5c24cf3e9&q=1&e=6b918e4d-d81f-4b44-8516-776d7b4f9dae&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>>>  
>>> -title: T-HEAD TH1520 AP sub-system clock controller
>>> +title: T-HEAD TH1520 sub-systems clock controller
>>>  
>>>  description: |
>>> -  The T-HEAD TH1520 AP sub-system clock controller configures the
>>> -  CPU, DPU, GMAC and TEE PLLs.
>>> +  The T-HEAD TH1520 sub-systems clock controller configures the
>>> +  CPU, DPU, GMAC and TEE PLLs for the AP subsystem. For the VO
>>> +  subsystem clock gates can be configured for the HDMI, MIPI and
>>> +  the GPU.
>>>  
>>>    SoC reference manual
>>>    https://protect2.fireeye.com/v1/url?k=cceb6120-ad60746b-cceaea6f-74fe485fb305-b294b70f1b52a5ab&q=1&e=6b918e4d-d81f-4b44-8516-776d7b4f9dae&u=https%3A%2F%2Fopenbeagle.org%2Fbeaglev-ahead%2Fbeaglev-ahead%2F-%2Fblob%2Fmain%2Fdocs%2FTH1520%2520System%2520User%2520Manual.pdf
>>> @@ -20,7 +22,9 @@ maintainers:
>>>  
>>>  properties:
>>>    compatible:
>>> -    const: thead,th1520-clk-ap
>>> +    enum:
>>> +      - thead,th1520-clk-ap
>>> +      - thead,th1520-clk-vo
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -29,6 +33,17 @@ properties:
>>>      items:
>>>        - description: main oscillator (24MHz)
>>>  
>>> +  thead,vosys-regmap:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: |
>>> +      Phandle to a syscon node representing the shared register
>>> +      space of the VO (Video Output) subsystem. This register space
>>> +      includes both clock control registers and other control
>>> +      registers used for operations like resetting the GPU. Since
>>
>>
>> It seems you wanted to implement reset controller...
> 
> Thank you for your feedback.
> 
> I understand your concern about the reset controller. In the TH1520 SoC,
> the GPU doesn't have its own reset controller. Instead, its reset is
> managed through the power domain's registers as part of the power-up
> sequence.
> 
> According to the Video Image Processing Manual 1.4.1 [1], the GPU
> requires the following steps to power up:
> 
> 1) Enable the GPU clock gate.
> 2) After 32 core clock cycles, release the GPU soft reset
> 
> Since these steps are closely tied to power management, I implemented
> the reset functionality within the power-domain driver.
> 
> Because the GPU doesn't support the resets property, introducing a reset
> controller wouldn't align with the existing device tree well.

So add resets to GPU. You said here that VO has reset registers, so it
should be a reset controller.

> 
> [1] - https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20Video%20Image%20Processing%20User%20Manual.pdf
>>
>>> +      these registers reside in the same address space, access to
>>> +      them is coordinated through a shared syscon regmap provided by
>>> +      the specified syscon node.
>>
>> Drop last sentence. syscon regmap is a Linux term, not hardware one.
>>
>> Anyway, this needs to be constrained per variant.
>>
>>> +
>>>    "#clock-cells":
>>>      const: 1
>>>      description:
>>> @@ -36,8 +51,6 @@ properties:
>>>  
>>>  required:
>>>    - compatible
>>> -  - reg
>>
>> No, that's a clear NAK. You claim you have no address space but in the
>> same time you have address space via regmap.
> 
> I see your concern. The VOSYS subsystem's address space includes
> registers for various components, such as clock gates and reset
> controls, which are scattered throughout the address space as specified
> in the manual 4.4.1 [2]. Initially, I attempted to use a shared syscon
> regmap for access, but I realize this might not be the best approach.

No, you miss the point of how device nodes are supposed to look like.
Don't bring your driver architecture here.

You cannot have regmap/syscon if you do not have reg. Your VOSYS is a
clock, reset and whatever-provider. Your power domain - if it does not
have reg - just does not exist. There is no such device and we do not
care if you have such device DRIVER.

> 
> To address this, I'll specify the 'reg' property in each node to define
> the address ranges explicitly fragmenting the address space for the VOSYS
> manually.
> 
> vosys_clk: clock-controller@ffef528050 {
> 	compatible = "thead,th1520-clk-vo";
> 	reg = <0xff 0xef528050 0x0 0x8>;
> 	#clock-cells = <1>;
> };
> 
> pd: power-domain@ffef528000 {
> 	compatible = "thead,th1520-pd";
> 	reg = <0xff 0xef528000 0x0 0x8>;
> 	#power-domain-cells = <1>;
> };

I don't think you really get the point here. Clock controllers and power
domains per one clock or domain are also a no-go.

Best regards,
Krzysztof
