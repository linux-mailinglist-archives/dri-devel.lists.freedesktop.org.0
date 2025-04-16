Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05FA8B78B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 13:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF510E25B;
	Wed, 16 Apr 2025 11:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="AxZYzZ9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABA910E25B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 11:22:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250416112234euoutp02f60747d86316ba0bcdcca2a35073cfbe~2yK3c7G1A1616716167euoutp02P
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 11:22:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250416112234euoutp02f60747d86316ba0bcdcca2a35073cfbe~2yK3c7G1A1616716167euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744802554;
 bh=o/JZlQdMxe3Mo96yx/aJSrBGKnbJT9wWiAHIxzblxxQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=AxZYzZ9YXRriyj+u6GV4T3daSjhmA0EkHr+2pGi+tfWsfBsq2pZhGIK/ULw+DhMq6
 WelXZ4Yw6GGYMWhiB+3LytLiq05iA/y9IQNJkbmT8/ZuYC+azzKxiU8uE+Ivy5ZqM/
 Z50NBO+4FcKoxg26bq8P2y3ZX0/8RqwKEIy7s9Dc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250416112234eucas1p208c7db55a031e7309e207c39b3fd2822~2yK2-DgQC2586025860eucas1p2f;
 Wed, 16 Apr 2025 11:22:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F4.96.20821.AF29FF76; Wed, 16
 Apr 2025 12:22:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250416112233eucas1p10bb8e43a0c391392501d48c7dace23b6~2yK2YMxp11951519515eucas1p1y;
 Wed, 16 Apr 2025 11:22:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250416112233eusmtrp10af3df9bf1f76b1c37a2f539cc012007~2yK2XMO-p2331123311eusmtrp1F;
 Wed, 16 Apr 2025 11:22:33 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-43-67ff92fa36dd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E0.19.19920.9F29FF76; Wed, 16
 Apr 2025 12:22:33 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250416112232eusmtip2f05b1e8bb84da2e08f38a19a071633bc~2yK1D-LF52910429104eusmtip2i;
 Wed, 16 Apr 2025 11:22:32 +0000 (GMT)
Message-ID: <02e21251-5c02-420d-81f2-d6f241e0212d@samsung.com>
Date: Wed, 16 Apr 2025 13:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain
 nodes with aon firmware
To: Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <Z/6p6MQDS8ZlQv5r@x1>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHOffe3luaFa7F0TOHkVwdiW4DBBNOtsXANrJrTDaIkiUmTBu5
 KQYKrhVRgwECdODKUB5xa+d4zEnHBgRWKq08HFTKa50C41EeugQXS3jIq51s0tFet/Hf5/s7
 3/N75RwhLmkjdwnPpJ3jlGmyVIYUEcaeZ7Y3N0rd8nDXHRL1jtVgqOUvLYV+bLdhqNJiE6CZ
 IQOGRtaXSNTw+D6FnrTnEmhUf4NCeT2NJHJoZ0i0rJkRoGHz1yRaLbYAZFzNJ1G9ZZpC1cst
 BLrZagZIXXRLgB70x6LpmV4COYY1OFJr/ZG7rZVCm6NNBNItdlLIMH9NgKz1H6P8znIieje7
 NF5AsfMOB8F2F65RbLuzimBN2mmK1ZgGAdtcV0SyU6NtJPtNXzz78HMrxv50M5vNr+/B2JLn
 4exSx28k+4WhDrBDeWNUnOSE6J0kLvXMeU4ZdviUKHmu4Hf8bI30woIrOQc0BVwBQiGkD0HL
 vb1XgEgoofUA6tXrJC/WAJyf68B5sQrgqDpvS/h6b2wOfUfwB7UAfrtupXixAKDLfg/zuMT0
 Ydi7VEp5mKBfg39OVgn4+A7Y99Us4eGX6T3wof1LryeAlsEJg4n08E46GNr0Q5gnKU7/IICW
 u6vepDgthfbZSi+TdAR8VFvpTepLM/CXTTfJe/bAvBadt29I94mgursI4/t+H9YuLJA8B8A5
 q4HiOQgOlGkIntPho5aVF3NmQZPG+oLfhlO2DdKzMZzeDxvNYXw4Bo4NPCb4RfrB8YUdfAt+
 sNR4HefDYliolvDuEFihKf6vqE1vxK4CRrttK9ptQ2q3DaP9v24VIOqAlMtQKeSc6mAalxmq
 kilUGWny0NPpimaw9cAHNq0rreDG3HJoF8CEoAtAIc7sFNuiNuUScZLs4iVOmX5SmZHKqbrA
 q0KCkYprOgvkElouO8elcNxZTvnvKSb03ZWD7dtdduF0QnD0XZFuv2ImMFxbOYjr4sP8EtOY
 TyNDxvVqc4zoiN45uH75wfNjny0fr451RpX02liyIcZdPet71d2peK980hEi8LmYUozFJdzO
 ynMpExXR5pSJA1zy1leCU9mZ6r8DmWlpU8do1NGRjhMoN+kD86EPHR8FWqqC/hg2hV5/K9M/
 y9n/bqBPiU+b72JN+RP7MZ1fd9ea4RpTXTZZsXIprux25J37G8m/Vmh/jjipiMb2EgmvvNEo
 72WEOcEN3z81jlS5LrsI/2ehT4+IFhW1roSIyET7J68XCir7T0XFjsXPBzXlDkz0NQ/1hMe5
 fc47bXZ1Rja1cuslhlAlyw4ewJUq2T8MHt+WTwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsVy+t/xe7o/J/1PN7iyW9LixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
 xeVdc9gsPvceYbTY9rmFzWLtkbvsFgs/bmWxWLJjF6NFW+cyVouLp1wt7t47wWLx8nIPs0Xb
 LH6L/3t2sFv8u7aRxWL2u/3sFlveTGS1OL423KJl/xQWB1mP9zda2T3evHzJ4nG44wu7x95v
 C1g8ds66y+7Rs/MMo8emVZ1sHneu7WHzmHcy0ON+93Emj81L6j1a1h5j8uj/a+Dxft9VNo++
 LasYPS41X2cPEIrSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcks
 Sy3St0vQy3jV+pC5YJF4xdvvGQ2MG4W7GDk5JARMJP5dWsrSxcjFISSwlFHi4cHr7BAJGYlr
 3S9ZIGxhiT/Xutggil4zStyc+o0RJMErYCdx4v0ksAYWAVWJH7cXsELEBSVOznwC1iwqIC9x
 /9YMsBphgUSJaWsgFogIKEicW3GJCWQos8BqVonlX+8yQmz4wSixbMNFJpAqZgFxiVtP5oPZ
 bAJGEg+WzwfbwCmgJHH233+gkziAatQl1s8TgiiXl2jeOpt5AqPQLCR3zEIyaRZCxywkHQsY
 WVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIEpqxtx35u3sE479VHvUOMTByMhxglOJiVRHjP
 mf9LF+JNSaysSi3Kjy8qzUktPsRoCgyLicxSosn5wKSZVxJvaGZgamhiZmlgamlmrCTO63b5
 fJqQQHpiSWp2ampBahFMHxMHp1QDU0yFxBpPd1M2P87bZtd0FQ/M7J0y6WHS4T6e8DSV630v
 98e8v6f+cOWxs79Y7u1tWPBpcmVsXs2lhfIvzBtmbQm+EDLJMS+2+RV31qTLLc8uv2i8rjzH
 VjQydgrLWqlFb2cf2S0poHlBVuBtlO5PkR/nDzXZJax8vFdt2ZnzlgFaL8p/MGnFaj75z9Zo
 W/JBtjLk8T+Lk9+eLuP/GuKap1S17HT0G+bO0+1fuw9tKxcwm8JhMtlPR1rwE49uyppiG1nD
 I9GaAYmnTJsZnNZWf/ix+cR6hi270tbHd6i3/WOeIhq3USb/yJc9rcnSbFXzNykeM9Nme9no
 b13ZO7t0to7eUqZVbWV7ZK2XSOelKbEUZyQaajEXFScCAHoYScPiAwAA
X-CMS-MailID: 20250416112233eucas1p10bb8e43a0c391392501d48c7dace23b6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
 <20250219140239.1378758-20-m.wilczynski@samsung.com> <Z/2+rbhsaBP0DQop@x1>
 <Z/6p6MQDS8ZlQv5r@x1>
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



On 4/15/25 20:48, Drew Fustini wrote:
> On Mon, Apr 14, 2025 at 07:04:29PM -0700, Drew Fustini wrote:
>> On Wed, Feb 19, 2025 at 03:02:37PM +0100, Michal Wilczynski wrote:
>>> The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
>>> TH1520 SoC implements power management capabilities through the E902
>>> core, which can be communicated with through the mailbox, using firmware
>>> protocol.
>>>
>>> Add AON node, which servers as a power-domain controller.
>>>
>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>> ---
>>>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
>>> index 197df1f32b25..474f31576a1b 100644
>>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>>> @@ -6,6 +6,7 @@
>>>  
>>>  #include <dt-bindings/interrupt-controller/irq.h>
>>>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>>> +#include <dt-bindings/power/thead,th1520-power.h>
>>>  
>>>  / {
>>>  	compatible = "thead,th1520";
>>> @@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
>>>  		snps,blen = <0 0 64 32 0 0 0>;
>>>  	};
>>>  
>>> +	aon: aon {
>>> +		compatible = "thead,th1520-aon";
>>> +		mboxes = <&mbox_910t 1>;
>>> +		mbox-names = "aon";
>>> +		#power-domain-cells = <1>;
>>> +	};
>>> +
>>>  	soc {
>>>  		compatible = "simple-bus";
>>>  		interrupt-parent = <&plic>;
>>> -- 
>>> 2.34.1
>>>
>>
>> Reviewed-by: Drew Fustini <drew@pdp7.com>
>>
>> I tested this on top of 6.15-rc1 and found no issues.
>>
>> -Drew
> 
> I've applied to thead-dt-for-next:
> https://protect2.fireeye.com/v1/url?k=2f3b741b-4eb0613b-2f3aff54-74fe485fb347-beeac007773a982c&q=1&e=eb6b4dda-c02a-4e0a-831a-a28d0489f6c3&u=https%3A%2F%2Fgithub.com%2Fpdp7%2Flinux%2Fcommit%2F2bae46e3de2a64fe3a619d61b16da0c01b8df2a1
> 
> Michal - are there any other dts patches that I should consider for 6.16
> PR?  I would probably send to Arnd around 6.15-rc3 or 6.15-rc4.

Thanks for the heads-up.

I think the reset DT node would be a good candidate for inclusion [1].
Depending on how the clock series evolves, we might also consider this
commit without the reset part [2]. Similarly, if the PM series lands in
time, we may want to update the aon node to include the reset [3].

To avoid any last-minute issues, I can send a separate DT-only series
that includes all relevant patches targeting the next release. Just give
me a heads-up a few days before your PR, and I’ll make sure everything
is ready.

Best regards,
Michał

[1] - https://lore.kernel.org/all/20250219140239.1378758-21-m.wilczynski@samsung.com/
[2] - https://lore.kernel.org/all/20250219140239.1378758-19-m.wilczynski@samsung.com/
[3] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com/

> 
> Thanks,
> Drew
> 
