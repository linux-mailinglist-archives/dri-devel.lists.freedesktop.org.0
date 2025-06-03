Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54085ACCCD5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 20:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D020E10E941;
	Tue,  3 Jun 2025 18:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="iA4GzKnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B71610E911
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250603182423euoutp013b13929f40c5723268596ad2c60265f1~Fm42wUvOa1737017370euoutp01W
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250603182423euoutp013b13929f40c5723268596ad2c60265f1~Fm42wUvOa1737017370euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748975063;
 bh=I9e3KbPtuQdRh0VtmLF9WESqN+R+XWureDH0vUnXmdY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=iA4GzKnxiptjW+b/gwD83/vaXDnS0BlmGhU25+HOeOiLKCxrlX8d1BxK9WER4GC3B
 6DPsPN2nPW5R2O9C1+1So29mPkgm22F51lh8gYNCuyiWZwsSapVdKPBvYcHHaSOmCz
 dwBmZEzawEh4QASOWQCko4G60TRSRYP5wZOiGLcg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250603182421eucas1p2351055ed90656b28b876b1c4a6dc94cb~Fm41kpyHs1113611136eucas1p2N;
 Tue,  3 Jun 2025 18:24:21 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250603182420eusmtip20472ecd551d9e7a1c5da71b8f1a864c1~Fm40lvNhj2610326103eusmtip2W;
 Tue,  3 Jun 2025 18:24:20 +0000 (GMT)
Message-ID: <05aa1fad-acf6-4cea-9a20-e54a2a4669b7@samsung.com>
Date: Tue, 3 Jun 2025 20:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
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
In-Reply-To: <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250603182421eucas1p2351055ed90656b28b876b1c4a6dc94cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
X-EPHeader: CA
X-CMS-RootMailID: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
 <20250603-cuddly-certain-mussel-4fbe96@kuoka>
 <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
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



On 6/3/25 15:35, Bartosz Golaszewski wrote:
> On Tue, Jun 3, 2025 at 3:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Mon, Jun 02, 2025 at 10:29:13PM GMT, Michal Wilczynski wrote:
>>>>> +description: |
>>>>> +  This binding describes the power sequencer for the T-HEAD TH1520 GPU.
>>>>> +  This sequencer handles the specific power-up and power-down sequences
>>>>> +  required by the GPU, including managing clocks and resets from both the
>>>>> +  sequencer and the GPU device itself.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: thead,th1520-gpu-pwrseq
>>>>> +
>>>>
>>>> Before I review the rest: is this actually a physical device that
>>>> takes care of the power sequencing? Some kind of a power management
>>>> unit for the GPU? If so, I bet it's not called "power sequencer" so
>>>> let's use its actual name as per the datasheet?
>>>
>>> Hi Bart,
>>> Thanks for your feedback.
>>>
>>> The hardware block responsible for powering up the components in the
>>> TH1520 SoC datasheet is called AON (Always On). However, we already have
>>> a DT node named aon that serves as a power domain provider
>>> (Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml).
>>
>> So no. One device, one device node (sometimes with cildren nodes). You
>> do not get another device node just because someone wrote incomplete
>> binding or because driver looks differently.

The child option could potentially be an option here, as it would make
some sense, at least for me - since the child pwrseq DT node would
describe part of the AON block.

>>
>>>
>>> Following the discussion [1] about needing a separate DT node for the
>>> power sequencing capabilities of this AON block, and thinking further
>>> about it, I think the binding should be more generic. The AON block can
>>> manage power sequences for more than just the GPU (e.g. NPU, AUDIO,
>>> DSP).
>>>
>>> The compatible string could be updated like so:
>>> "thead,th1520-aon-pwrseq"
>>
>> Should not be separate node, you already have one for AON.
>>
> 
> Agreed. And as far as implementation goes, you can have the same
> driver be a PM domain AND pwrseq provider. It just has to bind to the
> device node that represents an actual component, not a made-up
> "convenience" node.

Sure - this can be done using existing AON node.

To keep the pwrseq code organized in drivers/power/sequencing/, a
similar approach to our th1520-pd driver interfacing with the AON
firmware library (drivers/firmware/thead,th1520-aon.c) could work.

The idea would be to treat code like pwrseq-thead-aon.c (changed from a
current pwrseq-thead-gpu.c) as a library. It would export its necessary
functions (e.g., for specific sequence init/deinit steps) using
EXPORT_SYMBOL_GPL. The main AON driver would then call these to provide
the pwrseq functionality.

This will introduce a compile-time dependency, as expected.

An alternative would be to keep the driver in drivers/power/sequencing/
as a platform driver and start it up using, for example, an auxiliary
bus. This is similar to what the JH7110 clock driver
(drivers/clk/starfive/clk-starfive-jh7110-sys.c) is doing with a reset
driver. This could offer a cleaner separation of roles if that's
preferred.

Please let me know which way would be preferred.

> 
> Bartosz
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
