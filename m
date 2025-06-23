Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE6AE4BB4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 19:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6B310E1F0;
	Mon, 23 Jun 2025 17:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="B9Joi7Kz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD8E10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 17:20:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250623172056euoutp02f0ed4398a2ee8681a3b902d21ee89c4f~Lu7KuBal03135731357euoutp02N
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 17:20:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250623172056euoutp02f0ed4398a2ee8681a3b902d21ee89c4f~Lu7KuBal03135731357euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750699256;
 bh=8lEUjCtED9a5kJctvyEu/cj7uPsV5HrpplbBsVN6N5c=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=B9Joi7KzcXhbXkt7ESn9LBW17c8hZBnCUZW0dCLSSAX85xn9L37lTqPliprzJep18
 E4QvZWgjOqmYiY/etAalqUSNMiCq71X+FbeQ43lHiegdy1Rlaa4exbV76xK8DsGDlf
 9gz/MTRkf35DVXHIZOPJwKX854xtkgSPjraX3OLE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250623172055eucas1p18f485c150a28ebb6bc819962a527f652~Lu7KEXSux0826908269eucas1p1r;
 Mon, 23 Jun 2025 17:20:55 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250623172054eusmtip2b03dc4b23ebdde5b132e7ca2374fdf75~Lu7JD55kE0081800818eusmtip2R;
 Mon, 23 Jun 2025 17:20:54 +0000 (GMT)
Message-ID: <f41cd747-eb57-4e17-a3b1-8b30e0c6e84c@samsung.com>
Date: Mon, 23 Jun 2025 19:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAMRc=MfPLZ7oMVjLv+_GMoC8X+O=k+mMrQKxELho0=+Z7=HApQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250623172055eucas1p18f485c150a28ebb6bc819962a527f652
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2
X-EPHeader: CA
X-CMS-RootMailID: 20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2
References: <CGME20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2@eucas1p2.samsung.com>
 <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
 <CAMRc=MfPLZ7oMVjLv+_GMoC8X+O=k+mMrQKxELho0=+Z7=HApQ@mail.gmail.com>
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



On 6/23/25 16:32, Bartosz Golaszewski wrote:
> On Mon, Jun 23, 2025 at 1:44 PM Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
>> the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver
>> controls an auxiliary device instantiated by the AON power domain.
>>
>> The TH1520 GPU requires a specific sequence to correctly initialize and
>> power down its resources:
>>  - Enable GPU clocks (core and sys).
>>  - De-assert the GPU clock generator reset (clkgen_reset).
>>  - Introduce a short hardware-required delay.
>>  - De-assert the GPU core reset. The power-down sequence performs these
>>    steps in reverse.
>>
>> Implement this sequence via the pwrseq_power_on and pwrseq_power_off
>> callbacks.
>>
>> Crucially, the driver's match function is called when a consumer (the
>> Imagination GPU driver) requests the "gpu-power" target. During this
>> match, the sequencer uses clk_bulk_get() and
>> reset_control_get_exclusive() on the consumer's device to obtain handles
>> to the GPU's "core" and "sys" clocks, and the GPU core reset.  These,
>> along with clkgen_reset obtained from parent aon node, allow it to
>> perform the complete sequence.
>>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
> 
> [snip]
> 
>> +
>> +       /* Additionally verify consumer device has AON as power-domain */
>> +       if (pwr_spec.np != ctx->aon_node || pwr_spec.args[0] != TH1520_GPU_PD) {
>> +               of_node_put(pwr_spec.np);
>> +               return 0;
>> +       }
>> +
>> +       of_node_put(pwr_spec.np);
>> +
>> +       /* If a consumer is already bound, only allow a re-match from it */
>> +       if (ctx->consumer_node)
>> +               return ctx->consumer_node == dev->of_node;
>> +
> 
> That should be `!!(ctx->consumer_node == dev->of_node)` or preferably
> `ctx->consumer_node == dev->of_node ? 1 : 0`. I can amend it when
> applying if you have no objections. The rest looks good to me and I'd
> like to pick it up into pwrseq/for-next in the next two days.

Sure,
Thanks !

> 
> Bart
> 
> [snip]
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
