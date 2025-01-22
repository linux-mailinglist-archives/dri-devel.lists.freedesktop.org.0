Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7EA18D00
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 08:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F387710E679;
	Wed, 22 Jan 2025 07:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bymbqyUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8FC10E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 07:47:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 936C65C408B;
 Wed, 22 Jan 2025 07:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E25C4CED6;
 Wed, 22 Jan 2025 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737532029;
 bh=IcJL7yEhgm8bDZ/wZh8pao68jVu2AZ38Uox2cispOiU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bymbqyUjslOFEZ78TvAJ7aFWrQcQTFlw/WU2mcXONUywpmg3hmW5MGtAorqsR9q5K
 rkhpIxaMzbW/TE3/IpDGcw2AS28vbl4wUGX0pzoXZTxwGRsOvEInV8d9akQGPDZY9w
 JGZSvJhlDwii1Y3ABWbBxofT1esRkkmaYpv0FhE/HGUMe8Lo2D/9JIycYv7Gy0Tt4s
 YlhIINHFSaw7fQSMJ5i/AigNlELjD/U58z7Hl8gZWcpei3y8AmpFNJGI0fZazqQyLX
 JV7/8XjWOC9oRHTMEfwmgCKJFHVmusyhmL/XIIkcl9seYgoQnZ++D6/Z/szbHCBr3z
 A7zjfC9KKkzAQ==
Message-ID: <508d6120-53df-4db1-ab62-5f4c49358cbf@kernel.org>
Date: Wed, 22 Jan 2025 08:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 05/18] pmdomain: thead: Add power-domain driver for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
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
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0@eucas1p1.samsung.com>
 <20250120172111.3492708-6-m.wilczynski@samsung.com>
 <20250121-mature-marigold-ammonite-b379d2@krzk-bin>
 <ce69a49d-6221-458d-b0e5-0f3507f1aeac@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ce69a49d-6221-458d-b0e5-0f3507f1aeac@samsung.com>
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

On 21/01/2025 22:42, Michal Wilczynski wrote:
> 
> 
> On 1/21/25 11:02, Krzysztof Kozlowski wrote:
>> On Mon, Jan 20, 2025 at 06:20:58PM +0100, Michal Wilczynski wrote:
>>> The T-Head TH1520 SoC contains multiple power islands that can be
>>> programmatically turned on and off using the AON (Always-On) protocol
>>> and a hardware mailbox [1]. The relevant mailbox driver has already been
>>> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
>>> Introduce support for T-head TH1520 Mailbox driver");
>>>
>>> This commit introduces a power-domain driver for the TH1520 SoC, which
>>
>> Please do not use "This commit/patch/change", but imperative mood. See
>> longer explanation here:
>> https://protect2.fireeye.com/v1/url?k=2123f702-40a8e22d-21227c4d-74fe485cbfe7-afb876722bdc8fc5&q=1&e=e5dabc89-5f0c-4819-9008-76faafc3c1bc&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.17.1%2Fsource%2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%23L95
>>
>>> is using AON firmware protocol to communicate with E902 core through the
>>> hardware mailbox. This way it can send power on/off commands to the E902
>>> core.
>>
>> ...
>>
>>> diff --git a/drivers/pmdomain/thead/Makefile b/drivers/pmdomain/thead/Makefile
>>> new file mode 100644
>>> index 000000000000..adfdf5479c68
>>> --- /dev/null
>>> +++ b/drivers/pmdomain/thead/Makefile
>>> @@ -0,0 +1,2 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +obj-$(CONFIG_TH1520_PM_DOMAINS)		+= th1520-pm-domains.o
>>> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
>>> new file mode 100644
>>> index 000000000000..d913ad40fb76
>>> --- /dev/null
>>> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
>>> @@ -0,0 +1,174 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2021 Alibaba Group Holding Limited.
>>> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
>>> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>>> + */
>>> +
>>> +#include <linux/firmware/thead/thead,th1520-aon.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_domain.h>
>>> +
>>> +#include <dt-bindings/firmware/thead,th1520-aon.h>
>>
>> So here it is used... I don't understand why power domain is under
>> firmware. Please move it to proper directory and name the file exactly
>> the same as bindings doc which this belongs to.
> 
> The power-domain driver has no bindings doc. It's a child driver of the AON
> node.

OK, not changing my comment, though.

> 
>>
>>
>>> +
>>> +struct th1520_power_domain {
>>> +	struct th1520_aon_chan *aon_chan;
>>> +	struct generic_pm_domain genpd;
>>> +	u32 rsrc;
>>> +};
>>> +
>>> +struct th1520_power_info {
>>> +	const char *name;
>>> +	u32 rsrc;
>>> +};
>>> +
>>> +static const struct th1520_power_info th1520_pd_ranges[] = {
>>> +	{ "vdec", TH1520_AON_VDEC_PD },
>>
>> Why TH1520_AON_XXX aren't the indices?
> 
> These power-domain constants are defined by the AON firmware protocol,
> which dictates the exact IDs (e.g., 1 for NPU). They are not just array
> indices; we must use these specific values to communicate with the
> firmware correctly. Using array indices starting with 1 would be
> unusual.

Then that's a no. Binding constants do not represent values used by your
hardware. The binding constant should start from 0.

Best regards,
Krzysztof
