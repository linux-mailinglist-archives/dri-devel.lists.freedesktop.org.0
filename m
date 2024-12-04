Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170F9E4F18
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D719810EDC8;
	Thu,  5 Dec 2024 08:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="rdBYwhJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A570A10ECBA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:11:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241204101128euoutp02b6a65e71997c44677dac684f1220fbd3~N8Z0qzXDW1909919099euoutp02S
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:11:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241204101128euoutp02b6a65e71997c44677dac684f1220fbd3~N8Z0qzXDW1909919099euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1733307088;
 bh=EuqndAqdKmSf/8miGqIK4IlylxV/hAtKHgomM2ekQI8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=rdBYwhJRB8NfzkoOck8slotlY6vZFxyCmqFMkaMvyaO8zt7nE1C2pSNxQYVw/bzFx
 u1Cp5XU708WFTPM3wYq8R2Z7ITypzo1OjJnwp+d5Az3VgoeYrPuw7aXzWWWb1jfeOk
 28XPfP78SAa9FQ5VwddpNUJR5HPQPmvFDUmZX2GA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241204101128eucas1p25ef8b2a4716d2cb3bee6e1f1b8884e1b~N8Z0JlD4D0619706197eucas1p2v;
 Wed,  4 Dec 2024 10:11:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 82.E8.20397.0DA20576; Wed,  4
 Dec 2024 10:11:28 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241204101127eucas1p179dcc956b027a7b919043a4c65c04a71~N8ZzvXPbA1897018970eucas1p1-;
 Wed,  4 Dec 2024 10:11:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241204101127eusmtrp1e121421c025121a497c41359c15ff375~N8ZzueqwA2729527295eusmtrp1j;
 Wed,  4 Dec 2024 10:11:27 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-f6-67502ad0bd06
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E5.B6.19654.FCA20576; Wed,  4
 Dec 2024 10:11:27 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241204101126eusmtip2a89da49f3dc9db1702403a20dc33d885~N8Zyb6hBh1974719747eusmtip2t;
 Wed,  4 Dec 2024 10:11:26 +0000 (GMT)
Message-ID: <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
Date: Wed, 4 Dec 2024 11:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 05/14] dt-bindings: clock: thead,th1520: Add
 support for Video Output subsystem
To: Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
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
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <f21ffd12-167b-4d10-9017-33041ec322b0@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxzeub2999JavC06TpgLoXFugsNNxJxMQ+ZeuYlZBnMZGS7DZr0W
 x8u0wDaECdIRxGp0SJidAiKTBocMKOVRXitIKUVaYTwm5eEGhJIyZCApI7JRL278933f7/H9
 vpND8STNhB91MiGJVSbI4qSEADd0rthetQeGK15bbhejrqESDNWuakn0U3Mvhoo6evlorE+P
 oV8fzxPozpSdRDPNmTga1F0nUVZnJYGc2jEC2Ww/k2hBM8ZH/Y3XCLR4oQMgw6KaQBUdoyS6
 sVCLo9L6RoCyz93io/vd7yJnv4aHsrVb0T9N9SRaG6zC0Q9/tpJI77rMR+aKSKRuvYK/+SIz
 P/wtybicTpxpz1kimeblYpxp0I6SjKahBzDV5ecIxjHYRDCFlghm/LwZY2pKzzDqik6MmW8Z
 IJiL+nLA9GUNkUyN9XS4OEpwSM7GnUxhlXvDjgtisqbt+Km2kK/qa6v4GeBSYC7woiC9Hy5l
 DpO5QEBJaB2AroLCDbIE4MTZIowjiwCevTjAezbS/uPfBFcoA3DlyV3AkTkAF7vKgKdLRIfB
 343FuAfj9E5oHGnjcboYWq5OPtW30/5w/MH3pAf70HHwF9co7lm0jb6CQ3dJ89MBHl0HYFeP
 iMO+8MGk5yYviqD3wYmyIr4He62b1ebPAq7HH9bNXeN5FkHaIoDuhzfWHah18g60OQ9xEXzg
 rFlPcngHtOZpcA4nwonavzZipsEGjXkDH4SOXk9kan3/bljZuJeTD8Mus25juzccnhNzF3jD
 7wwFPE4WwZxsCde9C+ZrLvxn2qszYJeAVLvpUbSbMmo3ZdH+71sM8HLgyyar4hWsKiSB/TJY
 JYtXJScogj9PjK8G6z/cumZ+XA90swvBJoBRwAQgxZNuE0WUfqCQiOSyr1NZZWK0MjmOVZnA
 CxQu9RW9JPdnJbRClsTGsuwpVvmsilFefhnYpy8nNR3ufiXeaG7zTXFuXziin//M+/33hvIi
 R1SpX8TsUDe99caJOrZyfE0+ZSRZvFSxJ+25rGkiShPijj4TkGlUTOYIhEF+W3QR/eYnzzta
 9kdbRjJK7E3qkunIb65+VFghf9t1TOe4n71TEXrb5ZcSJAw4feKow+pzQBy69chq2prwetZI
 0L3qsYf5q5/MpEf+MWOuOX4719Rd128LNMFoiyLAfmyg0tJVmGEIe3SULmrfc15YYre7w5Me
 fVzQmmeo0t05cAs7aFjuaEmyzsTs/m2qLN2ZvhJap5zKDupQm/uGVnsCqA/FKNUWuyWANd7r
 dcndVNTdEeHNfbGXpbgqRvZ6IE+pkv0Ldt9DKVAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsVy+t/xe7rntQLSDV73G1qcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLM6f38Bu
 8bHnHqvF5V1z2Cw+9x5htNj2uYXNYu2Ru+wWCz9uZbFYsmMXo0Vb5zJWi4unXC1eXu5htmib
 xW/xf88Odot/1zayWMx+t5/dYsubiawWx9eGW7Tsn8LiIOvx/kYru8ebly9ZPA53fGH32Ptt
 AYvHzll32T16dp5h9Ni0qpPN4861PWwe804GetzvPs7ksXlJvUfL2mNMHu/3XWXz6NuyitHj
 UvN1do/Np6sDBKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
 Uov07RL0MpqfXWApOGBcsWPrRtYGxglaXYycHBICJhKHl/5iA7GFBJYySvS8zIaIy0hc637J
 AmELS/y51gVV85pR4tI+KRCbV8BO4tHuBWA1LAIqErtvH2CGiAtKnJz5BCwuKiAvcf/WDHYQ
 W1ggR+Lgm7tAcS4OEYEpLBKrH/1jBnGYBbYzSmyYOZURxBES+Mso8bR1Btg6ZgFxiVtP5jOB
 2GwCRhIPls9nBbE5gVZvnfoKqIEDqEZdYv08IYhyeYntb+cwT2AUmoXkkFlIJs1C6JiFpGMB
 I8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwJS17djPLTsYV776qHeIkYmD8RCjBAezkghv
 4BL/dCHelMTKqtSi/Pii0pzU4kOMpsDAmMgsJZqcD0yaeSXxhmYGpoYmZpYGppZmxkrivGxX
 zqcJCaQnlqRmp6YWpBbB9DFxcEo1MPFc+e8Xvi17e2vg2X9VbB/ykletedhqbrw5aLNl19Y4
 K7PM+tkreyWiYhjq74fs/OHE91y0cI7L5GitmCy2ojdPZk+dr9C2in/dTJGlNcKO+RymD5PD
 5780+MBybvsHjzeVaSfcytMPbZs0927DgSTxz4f3/Fp17Kg1262iyTzOa22FZjsppW6aYhrZ
 fYTTST4pLOP+p6743JQrH7IYMnbfnrTmwfFd97wkG2V3CURtXLesOOLPtD8xrddVdPrOBAau
 ki34Yym+bsfCGUsVMgy00+XfFa3T2y0k+SBl+yTjk32CFzlCE7kU3LJmnlmSKcedM+uzZbA4
 s3hOgMpjB/sSFpPvIcfY+66fDvzIoMRSnJFoqMVcVJwIADEy7ZviAwAA
X-CMS-MailID: 20241204101127eucas1p179dcc956b027a7b919043a4c65c04a71
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com>
 <20241203134137.2114847-6-m.wilczynski@samsung.com>
 <f21ffd12-167b-4d10-9017-33041ec322b0@kernel.org>
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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



On 12/3/24 16:45, Krzysztof Kozlowski wrote:
> On 03/12/2024 14:41, Michal Wilczynski wrote:
>> The device tree bindings for the T-Head TH1520 SoC clocks currently
>> support only the Application Processor (AP) subsystem. This commit
>> extends the bindings to include the Video Output (VO) subsystem clocks.
>>
>> Update the YAML schema to define the VO subsystem clocks, allowing the
>> clock driver to configure and manage these clocks appropriately. This
>> addition is necessary to enable the proper operation of the video output
>> features on the TH1520 SoC.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 31 +++++++++++++++----
>>  1 file changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>> index 4a0806af2bf9..5a8f1041f766 100644
>> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>> @@ -4,11 +4,13 @@
>>  $id: https://protect2.fireeye.com/v1/url?k=f595e769-941ef222-f5946c26-74fe485fb305-6d0b73471bbfc1a2&q=1&e=6b918e4d-d81f-4b44-8516-776d7b4f9dae&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fthead%2Cth1520-clk-ap.yaml%23
>>  $schema: https://protect2.fireeye.com/v1/url?k=5b94114b-3a1f0400-5b959a04-74fe485fb305-0e2c50f5c24cf3e9&q=1&e=6b918e4d-d81f-4b44-8516-776d7b4f9dae&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>>  
>> -title: T-HEAD TH1520 AP sub-system clock controller
>> +title: T-HEAD TH1520 sub-systems clock controller
>>  
>>  description: |
>> -  The T-HEAD TH1520 AP sub-system clock controller configures the
>> -  CPU, DPU, GMAC and TEE PLLs.
>> +  The T-HEAD TH1520 sub-systems clock controller configures the
>> +  CPU, DPU, GMAC and TEE PLLs for the AP subsystem. For the VO
>> +  subsystem clock gates can be configured for the HDMI, MIPI and
>> +  the GPU.
>>  
>>    SoC reference manual
>>    https://protect2.fireeye.com/v1/url?k=cceb6120-ad60746b-cceaea6f-74fe485fb305-b294b70f1b52a5ab&q=1&e=6b918e4d-d81f-4b44-8516-776d7b4f9dae&u=https%3A%2F%2Fopenbeagle.org%2Fbeaglev-ahead%2Fbeaglev-ahead%2F-%2Fblob%2Fmain%2Fdocs%2FTH1520%2520System%2520User%2520Manual.pdf
>> @@ -20,7 +22,9 @@ maintainers:
>>  
>>  properties:
>>    compatible:
>> -    const: thead,th1520-clk-ap
>> +    enum:
>> +      - thead,th1520-clk-ap
>> +      - thead,th1520-clk-vo
>>  
>>    reg:
>>      maxItems: 1
>> @@ -29,6 +33,17 @@ properties:
>>      items:
>>        - description: main oscillator (24MHz)
>>  
>> +  thead,vosys-regmap:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      Phandle to a syscon node representing the shared register
>> +      space of the VO (Video Output) subsystem. This register space
>> +      includes both clock control registers and other control
>> +      registers used for operations like resetting the GPU. Since
> 
> 
> It seems you wanted to implement reset controller...

Thank you for your feedback.

I understand your concern about the reset controller. In the TH1520 SoC,
the GPU doesn't have its own reset controller. Instead, its reset is
managed through the power domain's registers as part of the power-up
sequence.

According to the Video Image Processing Manual 1.4.1 [1], the GPU
requires the following steps to power up:

1) Enable the GPU clock gate.
2) After 32 core clock cycles, release the GPU soft reset

Since these steps are closely tied to power management, I implemented
the reset functionality within the power-domain driver.

Because the GPU doesn't support the resets property, introducing a reset
controller wouldn't align with the existing device tree well.

[1] - https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20Video%20Image%20Processing%20User%20Manual.pdf
> 
>> +      these registers reside in the same address space, access to
>> +      them is coordinated through a shared syscon regmap provided by
>> +      the specified syscon node.
> 
> Drop last sentence. syscon regmap is a Linux term, not hardware one.
> 
> Anyway, this needs to be constrained per variant.
> 
>> +
>>    "#clock-cells":
>>      const: 1
>>      description:
>> @@ -36,8 +51,6 @@ properties:
>>  
>>  required:
>>    - compatible
>> -  - reg
> 
> No, that's a clear NAK. You claim you have no address space but in the
> same time you have address space via regmap.

I see your concern. The VOSYS subsystem's address space includes
registers for various components, such as clock gates and reset
controls, which are scattered throughout the address space as specified
in the manual 4.4.1 [2]. Initially, I attempted to use a shared syscon
regmap for access, but I realize this might not be the best approach.

To address this, I'll specify the 'reg' property in each node to define
the address ranges explicitly fragmenting the address space for the VOSYS
manually.

vosys_clk: clock-controller@ffef528050 {
	compatible = "thead,th1520-clk-vo";
	reg = <0xff 0xef528050 0x0 0x8>;
	#clock-cells = <1>;
};

pd: power-domain@ffef528000 {
	compatible = "thead,th1520-pd";
	reg = <0xff 0xef528000 0x0 0x8>;
	#power-domain-cells = <1>;
};

I would be happy to proceed like this if that's okay.

[2] - https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

> 
>> -  - clocks
> 
> Nope, not explained, unless you wanted to make it different per variants.
> 
>>    - "#clock-cells"
>>  
>>  additionalProperties: false
>> @@ -51,3 +64,9 @@ examples:
>>          clocks = <&osc>;
>>          #clock-cells = <1>;
>>      };
>> +
>> +    clock-controller-vo {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://protect2.fireeye.com/v1/url?k=1e9cac96-7f17b9dd-1e9d27d9-74fe485fb305-f0538482114df941&q=1&e=6b918e4d-d81f-4b44-8516-776d7b4f9dae&u=https%3A%2F%2Fdevicetree-specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-basics.html%23generic-names-recommendation
> 
> 
>> +        compatible = "thead,th1520-clk-vo";
>> +        thead,vosys-regmap = <&vosys_regmap>;
> 
> That's a "reg" property. Do not encode address space as something else.
> 
> 
>> +        #clock-cells = <1>;
>> +    };
> 
> 
> Best regards,
> Krzysztof
> 
