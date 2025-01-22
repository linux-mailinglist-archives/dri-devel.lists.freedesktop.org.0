Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D5A19093
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 12:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2237310E6C2;
	Wed, 22 Jan 2025 11:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="DepA5Nlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B6F10E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 11:26:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250122112638euoutp01d8aa451fdcacaf6510a1088a9a97c26b~dACbyi6m41223112231euoutp01K
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 11:26:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250122112638euoutp01d8aa451fdcacaf6510a1088a9a97c26b~dACbyi6m41223112231euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737545198;
 bh=OzxWzg2x4Cwra8cOzJYDj90iXRfkcTkglD4PrGOpiHg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=DepA5NlqeUt02ysoT0EcLIYirtddGNlMSRjc67BsvcDGplQDsI1M7dCKFmH+oSFYF
 /jg6JFeP/oC2+lrwY7gWCmvWX3HXs48G7Z9huQwo+SxFtjBeonTmvo/ljhuBa93r00
 SmP5aTDLGAB9Y5Eat1EqBkaHkC4URyZ/p225y7ZA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250122112638eucas1p2f059d8a9c27573ee8c32779c005dfda6~dACbU8nb_2646526465eucas1p2Z;
 Wed, 22 Jan 2025 11:26:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 00.E9.20409.DE5D0976; Wed, 22
 Jan 2025 11:26:37 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250122112637eucas1p162414679b12de45b2ee26ba1e486012a~dACa1rwpX0353603536eucas1p1L;
 Wed, 22 Jan 2025 11:26:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250122112637eusmtrp1661b45e773e44a602e6c9802c17c36fb~dACa0lb0T1389913899eusmtrp1Z;
 Wed, 22 Jan 2025 11:26:37 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-22-6790d5edcf8d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7C.11.19920.DE5D0976; Wed, 22
 Jan 2025 11:26:37 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250122112636eusmtip23592639f5b607ab9234dcf41545997a5~dACZigDrR0994809948eusmtip2S;
 Wed, 22 Jan 2025 11:26:36 +0000 (GMT)
Message-ID: <9039d98b-ea3b-401a-804c-8c60ec714b99@samsung.com>
Date: Wed, 22 Jan 2025 12:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 05/18] pmdomain: thead: Add power-domain driver for TH1520
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <508d6120-53df-4db1-ab62-5f4c49358cbf@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUZRjG/facPWdZZ+mwwPBFJsWIE8wESDV9ZpEQ2rEpQ4yhTNKdPC64
 3NyFLpYTDJe4LLfCqI0NRG2JBcSV5RYLM7ixXHIxlEWJRbRlasEFV4gQFGI5WPz3m+d933me
 55uPhwl1hCcvNiGZkSaI4rwJPt7Ydd/4rG2wSByYrkGoe6iSg7SLChLV6IwcVK43ctHoQAMH
 Xft7mkB141dI9JcuDUemKiWJ0rvOE8iqGCVQf389iezyUS662lpGoJl8PUCNMxkEqtWbSXTa
 rsXR2eZWgLJyfuSi33p3IfNoN46sV+UYylI8hpbbmkm0ZLqAo++nOkjUcKeYiwy1USijowTf
 uZmevp5J0nesVpy+lD1L0rq5CpxuUZhJWt7yK6A11TkEPWJqI+gfevbRN/MMHPri2S/ojNou
 Dl34MJCebh8k6IKGakAPpA+R4cID/JePMHGxHzHSgODD/JgC3VNJp70+MXbfwlJBnmcucOJB
 6nlov5zPzQV8npCqArCgvgI4BkJqFkDL7B6WZwAsVTs/OlDWzmHsgQrA+fszHHbJBuCSws/B
 AioY6vUleC7g8XDKB96+8AYru8Ce7yy4g90pL3hz+FvSwa7UPni5Z2yV3ShfOPTwn9VAGNXG
 hd+U1HMdA4zygMOW8lUvggqCY6ryVd1pxWtIM0ewO16wyVaGsUEH+XDozGcsh0FL1SmSZVc4
 YWhY402w72s5znIiHNPeW7v9HLbIDWu8A44YFwhHF2wl3PnWAFYOgZcmlJhDhpQzvG5zYRM4
 w68aS9dkAczOErLbW+Epef5/psaqRk4R8FasexTFuo6KdV0U//tWALwaeDApsngxIwtKYD72
 l4niZSkJYv8PE+M1YOWH9y0ZZpuBasLu3wk4PNAJIA/zdhO435WLhYIjok9PMNLEQ9KUOEbW
 CZ7g4d4egsqOTLGQEouSGQnDJDHSR1MOz8kzlZN+Yzg08FBTDqZyC9s4cMxTMlmiezX6xbaj
 G9/UPki5slCnUSb1qiN3+c2fC5gXas9IYiJDorek4ScXu8zdU3urTkb57L9Vuqcv3+4xrnVx
 r3x3g9s49/2kB9WmylikyN9uM/W3Th1OzyyTWU/4HFyOqhuJyfDNC74Rp7W4vkSONM/GFds2
 b90eIXp6f41Mon9c6WoJey1hk9z6Xp/g3rnii5PhYcd3CH/uPRYRcXz59ZDUDdhOkST7z4Pq
 n1zvFi7sjT7wyxalxry7vWjM+nto/DtHn/zghYnwZ9SF7ZPdbbcj7aHXgpqmBWYgfLvmlT9U
 yaYo5q0vpYvqyNCQhW3P+arTJN64LEa0zQ+TykT/As9ATV5QBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsVy+t/xe7pvr05IN/h6Q9zixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZnH+/AZ2
 i48991gtLu+aw2bxufcIo8W2zy1sFmuP3GW3WPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
 l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
 X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
 +66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJeRt9ehYKF8hXnTjxkbmDslupi5OSQEDCRmLv2GzOILSSwlFHib386RFxG
 4lr3SxYIW1jiz7Uuti5GLqCa14wSnbdOgDXwCthJHDkyBaiIg4NFQFXi0UYviLCgxMmZT8B6
 RQXkJe7fmsEOYgsLBEqcPfkAzBYR0JS4/vc7K8hMZoE9rBKHN39mgzjiBZPE+bnSIDazgLjE
 rSfzmUBsNgEjiQfL57OC2JxAe69v+sYGspdZQF1i/TwhiHJ5ie1v5zBPYBSaheSMWUgmzULo
 mIWkYwEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAtLXt2M/NOxjnvfqod4iRiYPxEKME
 B7OSCK/oh550Id6UxMqq1KL8+KLSnNTiQ4ymwJCYyCwlmpwPTJx5JfGGZgamhiZmlgamlmbG
 SuK8bpfPpwkJpCeWpGanphakFsH0MXFwSjUwaVebRzd5u/z82cZ9v73A72d9WdicU3unRiff
 qvIQqb+pcu9qVu/TsuTXK/3SmVteTItzqc29/K1c68fRwoTMyzmm5wxeb7G9/M7Gc1+DYPb2
 /fNFwvr3NP1awST2ZUqu65UdfueffT7kYvh1zoapnxj4nas/C1oELznjPGHt5tNKOtmLP6q/
 m2U6/9v7NM9jC63rUxeeD/OQsmzNT/No673U5DrRcJXZk+DoTQX3bl1jv5nb/HiyE/dNrbsx
 B70zDTKXdt2+alaV9vW1H8st5kd5j3tYA36ovv+xo/hfk1bS5GtXui8ev+bhe5jL7Z7Wpa+P
 ngUyMP/h3LDx7auP8hduKq6ufjj12OaAN0+mnlBiKc5INNRiLipOBAA7w6co5AMAAA==
X-CMS-MailID: 20250122112637eucas1p162414679b12de45b2ee26ba1e486012a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0@eucas1p1.samsung.com>
 <20250120172111.3492708-6-m.wilczynski@samsung.com>
 <20250121-mature-marigold-ammonite-b379d2@krzk-bin>
 <ce69a49d-6221-458d-b0e5-0f3507f1aeac@samsung.com>
 <508d6120-53df-4db1-ab62-5f4c49358cbf@kernel.org>
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



On 1/22/25 08:46, Krzysztof Kozlowski wrote:
> On 21/01/2025 22:42, Michal Wilczynski wrote:
>>
>>
>> On 1/21/25 11:02, Krzysztof Kozlowski wrote:
>>> On Mon, Jan 20, 2025 at 06:20:58PM +0100, Michal Wilczynski wrote:
>>>> The T-Head TH1520 SoC contains multiple power islands that can be
>>>> programmatically turned on and off using the AON (Always-On) protocol
>>>> and a hardware mailbox [1]. The relevant mailbox driver has already been
>>>> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
>>>> Introduce support for T-head TH1520 Mailbox driver");
>>>>
>>>> This commit introduces a power-domain driver for the TH1520 SoC, which
>>>
>>> Please do not use "This commit/patch/change", but imperative mood. See
>>> longer explanation here:
>>> https://protect2.fireeye.com/v1/url?k=2123f702-40a8e22d-21227c4d-74fe485cbfe7-afb876722bdc8fc5&q=1&e=e5dabc89-5f0c-4819-9008-76faafc3c1bc&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.17.1%2Fsource%2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%23L95
>>>
>>>> is using AON firmware protocol to communicate with E902 core through the
>>>> hardware mailbox. This way it can send power on/off commands to the E902
>>>> core.
>>>
>>> ...
>>>
>>>> diff --git a/drivers/pmdomain/thead/Makefile b/drivers/pmdomain/thead/Makefile
>>>> new file mode 100644
>>>> index 000000000000..adfdf5479c68
>>>> --- /dev/null
>>>> +++ b/drivers/pmdomain/thead/Makefile
>>>> @@ -0,0 +1,2 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +obj-$(CONFIG_TH1520_PM_DOMAINS)		+= th1520-pm-domains.o
>>>> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
>>>> new file mode 100644
>>>> index 000000000000..d913ad40fb76
>>>> --- /dev/null
>>>> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
>>>> @@ -0,0 +1,174 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (C) 2021 Alibaba Group Holding Limited.
>>>> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
>>>> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>>>> + */
>>>> +
>>>> +#include <linux/firmware/thead/thead,th1520-aon.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/pm_domain.h>
>>>> +
>>>> +#include <dt-bindings/firmware/thead,th1520-aon.h>
>>>
>>> So here it is used... I don't understand why power domain is under
>>> firmware. Please move it to proper directory and name the file exactly
>>> the same as bindings doc which this belongs to.
>>
>> The power-domain driver has no bindings doc. It's a child driver of the AON
>> node.
> 
> OK, not changing my comment, though.
> 
>>
>>>
>>>
>>>> +
>>>> +struct th1520_power_domain {
>>>> +	struct th1520_aon_chan *aon_chan;
>>>> +	struct generic_pm_domain genpd;
>>>> +	u32 rsrc;
>>>> +};
>>>> +
>>>> +struct th1520_power_info {
>>>> +	const char *name;
>>>> +	u32 rsrc;
>>>> +};
>>>> +
>>>> +static const struct th1520_power_info th1520_pd_ranges[] = {
>>>> +	{ "vdec", TH1520_AON_VDEC_PD },
>>>
>>> Why TH1520_AON_XXX aren't the indices?
>>
>> These power-domain constants are defined by the AON firmware protocol,
>> which dictates the exact IDs (e.g., 1 for NPU). They are not just array
>> indices; we must use these specific values to communicate with the
>> firmware correctly. Using array indices starting with 1 would be
>> unusual.
> 
> Then that's a no. Binding constants do not represent values used by your
> hardware. The binding constant should start from 0.

Would it be a problem if those overlapped ? There is one more value that
I skipped for now TH_1520_AON_AUDIO, that is indeed a 0. I skipped it
cause trying to turn it on/off, caused a crash in the firmware, which
stopped responding for a while. With this extra constant I would be able
to use those values as an indices, but would need to add extra code in
the driver to work around the issue.

> 
> Best regards,
> Krzysztof
> 
