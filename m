Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525ACA2F6A8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB30C10E5E2;
	Mon, 10 Feb 2025 18:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="l8tUsGxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B7F10E5DD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:17:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250210181724euoutp021db6bbbf71d30fa1e3379fa559d58075~i65gdr8XE0233302333euoutp02V
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:17:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250210181724euoutp021db6bbbf71d30fa1e3379fa559d58075~i65gdr8XE0233302333euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739211444;
 bh=eoM94/u449x42q6cf/40YSz4wflR55B4E76Sjb/7dTY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=l8tUsGxUu/Vn0/u6PzTR+tqT6Ivupe5fgdztvNdy0J/c3tqf215jyFsEzXt60lBgj
 s2u0XXQ1yHh1AmpIqPOkWP9cnCWSuFNX3F4JkyeOdFnQjE80XaI18wrcoBClBz0kyQ
 uuEEXA0EcoMT3vEK5k/KWOoE2681CXXob1mzCRso=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250210181723eucas1p25abb824449c578f42deb26c45f4dd664~i65fdA6XO3048030480eucas1p2I;
 Mon, 10 Feb 2025 18:17:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 6F.65.20397.3B24AA76; Mon, 10
 Feb 2025 18:17:23 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250210181722eucas1p2b15d633fa8c141efec2d6e4b2ca80a42~i65eg_ZQP2654726547eucas1p2V;
 Mon, 10 Feb 2025 18:17:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250210181722eusmtrp277a1cc907790040346300d53d97ae68b~i65egAD9x0172601726eusmtrp2G;
 Mon, 10 Feb 2025 18:17:22 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-cd-67aa42b3b35f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 44.84.19654.2B24AA76; Mon, 10
 Feb 2025 18:17:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250210181721eusmtip2f628aba259a8f1d60f68c1d4648cbde6~i65dO1fME1001410014eusmtip2S;
 Mon, 10 Feb 2025 18:17:21 +0000 (GMT)
Message-ID: <7d8a3f8d-f369-47dd-8c5f-dcff8d692ea8@samsung.com>
Date: Mon, 10 Feb 2025 19:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>, Matt Coster
 <Matt.Coster@imgtec.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "jszhang@kernel.org" <jszhang@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <48261cdfab6e0bc16e5327664b06728e1894422a.camel@pengutronix.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1RTZRjHe+/u7t12zvAyUF5whu0EJ+uIQmbvMeEoheea/ZCTnZ38p3bk
 nqGOH22MyIyh8mPahCHzVMMYIsGcgKGMBoIUEgO0wVwi8WNgZ54ARaAhESUGu1r893me5/s8
 3+d5z8vjiJqJEN7+5DRGmSxTSAgBXt/+V/f6y7EW+Uab+1nUcbsMQ9a/jSSqanZgyNTm4CL3
 zToM/fJwkkA1d3tINNp8BEe95m9IdKz9IoHGjG4CTevcXORqPEMg78k2gOq92QSqbhsi0dlp
 K47KbY0A5R6v4CJnVxwacnfgaMyl46Bc4wr0uMlGooXeWhwVP2ghUd39Qi6yV0tRdosB37aG
 nuzLIen7Y2M4fU07Q9LNs6U43WAcImldww1AX7IcJ+jB3iaCLumMp4e/sGP05XINnV3djtEF
 jzbSk1dvEXR+nQXQN4/dJneL9gq2JjCK/emMckPMR4LEI9VHuakdmzNappRZwPnSCcDnQWoT
 vHXBRp4AAp6IMgOYN+PB2GAGwPy5qxw28AJYU2vAn7YY9CVctlAJoOPna4ANJgD8razEpxJS
 MdDx4z9giXEqDJboigGb94edX3t8mpVUKBzu/4pc4gBqN3TNlfrsAqkqHhw/Pe8rcKgsDtTq
 M1kOgv0eE7bEBBUFRypN3CXmU2/B/HtuwGpC4fcTZ3yDIOUUwI5zVg679xvQOfEnwXIAHLfX
 kSyL4eMGdiikUuCI9Y8n+sOwQWd/wq/BQcf8Yi9v0WAdvNi4gU1vh1PmcXwpDSk/2Dfhz67g
 B0/Vf8lh00KozRWx6nB4WnfyP1OHuR7TA4lx2asYlx1pXHaM8X/fUoBbQBCjViXJGdXLycwn
 ESpZkkqdLI/Yl5J0CSz+8OsL9oc2YB6fjmgFGA+0AsjjSAKFm86a5SJhguzTQ4wy5UOlWsGo
 WsFqHi4JEpa15MhFlFyWxhxkmFRG+bSK8fghWVhMfEHAZz8dZICM32Rt/mGq4k7w+4cOR+V4
 396TXvlt1JrQiYW1A7HvFFZs1/rN9eXims1hbxYWXVC8UqY20ecHwgcCX9AV9ThGDOK4BOng
 6gdH089N2wu8W6yvzhrC6yJTn3m+2yh2u/o/X9+69gBeUJQzI8l/z7IqLCajc9WuPZopzwFT
 D3El71GUX3Hix+JgfVdX9BV8W1qsRtw78N2o/we79moaaaqI2Rl6I9ZPshI8FyLdMhp3PTPa
 bJRW6flV3c7id9Wvl8/vaBxWKmrSa5Ars29Wu69mOMsRPRK5AoQMr/PclXZyvXfu7cxoqh2K
 z/tVv7Xy9/PUqTYip0ETLMFVibLIFzlKlexfy8v93FAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbdRTH/fXe3luIze4Kk18QAqm6RZd1tCv1xwREo+ZGDHNzTqOZWOFS
 Kn3MtizbNFK2jjiKDCIiFNZSxZV1YzjsGI92nYg85qzjVRYYnVFIbIF1lUEyx1C6xsh/3/P4
 fM/JyeFgPA87niNX6RiNSqrgE9H4z6sDvm3tL9plKV/0JaDBia9Z6OJ9E4nOuTwsZOnzsJFv
 xMFCY0tBAp2fvU6iP12lOPK2nCLRsf42AvlNPgKFKnxsNNrdSKDFz/sA6lg0EKi1b5pE1tBF
 HDV3dgNUduI0Gw1ffRlN+wZx5B+twFCZaQP6x9lJolXvBRw13HaTyDFfzUYDrW8hg7sGz0qk
 gzeOk/S834/TP352l6Rdy0043WWaJumKrmuAbrefIOibXidBm4d207eMAyz6++YS2tDaz6JP
 Pkihg5fHCbrSYQf0yLEJ8nXeO4J0jbpYxyQXqrW6DP67QiQSCNOQQCROEwh3PLt/pyiVvz0z
 PZ9RyA8ymu2Z7wsKS1uPsg8MSg6572j0YHhrOYjiQEoMa6rM7HIQzeFR3wK4fG8FRAoJ0Gv0
 4xEdA1e85USkaQ5Al/soK1zgUpnQ80MEwKmnoLmiAUTyG+FQ/cxDeBOVBG9N1pHlgMOJoXKg
 2Z4S9oml2jlwpdRAhgOM0mPQ3nADCwM8aokFzZ6MsMaoODg5Y3k4jKBE8DebhR3WUdRrsHLO
 B8KmGLUFtpl5kfYkeGmhEasCPNO6NUzrnEz/E6Z1RBPA7SCWKdYqZUqtSKCVKrXFKpkgT61s
 B2uP1dF/z9EJzgRCgl7A4oBeADkYP5YrtrbIeNx86eEjjEadqylWMNpekLp2imosflOeeu0z
 VbpcoSQlVSiWpKWkpkl28OO4xNivBTxKJtUxRQxzgNH8x7E4UfF6Vtuw/j32ndDC1FZe3AuG
 J/4SNnW45YNn76cnBDact3zU8JUt85Kv0J4Nl99YeLLl49PObQprrLVIdy7q+vgV2ytf7l0N
 GG9mzHMP/6H4ZnSswFn3SeeeyiFjDZ5bf9X13YTd2OgJis2f5vccFFo6omvLzpbkvJp1qsaq
 WYze5XjTG5i9+3Ze7Z7fJb8o5bf3kxd26wOOqdEjj+YUnKGDoTrcrnQ2DSbPbUnKLkkc3/cY
 aKzOgrj8sltdcs1o/rCXzI6ZZJuzEw/19CR31ecsK6Yole25lgfd4o0jM1Xk43t3cvfVGD8o
 Oj5i23WlV/7SzE9Ls1P2wPNPSx4Z+ru2eXPcZj6uLZQKn8E0Wum/gIMQU+EDAAA=
X-CMS-MailID: 20250210181722eucas1p2b15d633fa8c141efec2d6e4b2ca80a42
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
 <20250128194816.2185326-10-m.wilczynski@samsung.com>
 <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
 <e83ea320-23f0-41ed-934c-2f1687b55ec1@samsung.com>
 <48261cdfab6e0bc16e5327664b06728e1894422a.camel@pengutronix.de>
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



On 2/4/25 18:18, Philipp Zabel wrote:
> On Mo, 2025-02-03 at 19:15 +0100, Michal Wilczynski wrote:
>>
>> On 1/31/25 16:39, Matt Coster wrote:
>>> On 28/01/2025 19:48, Michal Wilczynski wrote:
>>>> Add reset controller driver for the T-HEAD TH1520 SoC that manages
>>>> hardware reset lines for various subsystems. The driver currently
>>>> implements support for GPU reset control, with infrastructure in place
>>>> to extend support for NPU and Watchdog Timer resets in future updates.
>>>>
>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>> ---
>>>>  MAINTAINERS                  |   1 +
>>>>  drivers/reset/Kconfig        |  10 ++
>>>>  drivers/reset/Makefile       |   1 +
>>>>  drivers/reset/reset-th1520.c | 178 +++++++++++++++++++++++++++++++++++
>>>>  4 files changed, 190 insertions(+)
>>>>  create mode 100644 drivers/reset/reset-th1520.c
>>>>
> [...]
>>>> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
>>>> new file mode 100644
>>>> index 000000000000..48afbc9f1cdd
>>>> --- /dev/null
>>>> +++ b/drivers/reset/reset-th1520.c
>>>> @@ -0,0 +1,178 @@
> [...]
>>>> +static void th1520_rst_gpu_enable(struct regmap *reg,
>>>> +				  struct mutex *gpu_seq_lock)
>>>> +{
>>>> +	int val;
>>>> +
>>>> +	mutex_lock(gpu_seq_lock);
>>>> +
>>>> +	/* if the GPU is not in a reset state it, put it into one */
>>>> +	regmap_read(reg, TH1520_GPU_RST_CFG, &val);
>>>> +	if (val)
>>>> +		regmap_update_bits(reg, TH1520_GPU_RST_CFG,
>>>> +				   TH1520_GPU_RST_CFG_MASK, 0x0);
> 
> BIT(2) is not documented, but cleared here.

Yeah shouldn't be cleared, thanks !

> 
>>>> +
>>>> +	/* rst gpu clkgen */
>>>> +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_CLKGEN_RST);
>>>
>>> Do you know what this resets? From our side, the GPU only has a single
>>> reset line (which I assume to be GPU_RESET).
>>
>> This is clock generator reset, as described in the manual 5.4.2.6.1
>> GPU_RST_CFG. It does reside in the same register as the GPU reset line.
>>
>> I think this is required because the MEM clock gate is somehow broken
>> and marked as 'reserved' in manual, so instead as a workaround, since we
>> can't reliably enable the 'mem' clock it's a good idea to reset the
>> whole CLKGEN of the GPU.
> 
> If this is a workaround for broken gating of the "mem" clock, would it
> be possible (and reasonable) to make this a separate reset control that
> is handled by the clock driver? ...

Thank you for the detailed feedback, Philipp.

After further consideration, I believe keeping the current reset driver
implementation would be preferable to moving the CLKGEN reset handling
to the clock driver. While it's technically possible to implement this
in the clock driver, I have concerns about the added complexity:

1. We'd need to expose the CLKGEN reset separately in the reset driver
2. The clock driver's dt-bindings would need modification to add an
   optional resets property
3. We'd need custom clk_ops for all three clock gates (including a dummy
   'mem' gate)
4. Each clock gate's .enable operation would need to handle CLKGEN reset
   deassertion

While the clock framework could theoretically handle this, there's no
clean way to express the requirement that the CLKGEN reset should only
be deasserted after all clocks in the group are enabled. We could
implement this explicitly, but it would make the code more complex and
harder to understand.

The current solution in the reset driver is simpler and clearer - it
treats this as what it really is: a TH1520-specific reset sequence.
Looking at other similar SoCs like the BPI-F3, we can see this is truly
THEAD-specific - the BPI-F3 has just a single reset line with no CLKGEN
bit to manage. When you assert/deassert the GPU reset line on the
TH1520, it handles everything needed for a clean reset on this specific
SoC. This keeps the implementation contained and straightforward.

Regarding the delay between clock enable and reset deassert - for SoCs
like BPI-F3 with a single reset line, implementing this in the GPU
consumer driver makes perfect sense. However, for the T-HEAD SoC, moving
the delay there would actually complicate things since we need to manage
both the CLKGEN and GPU reset lines in a specific sequence. Having this
handled entirely within the reset driver keeps the implementation
cleaner.

Does this reasoning align with your thoughts? I'm happy to explore the
clock driver approach further if you still see significant advantages to
that solution.

> 
>>>> +
>>>> +	/*
>>>> +	 * According to the hardware manual, a delay of at least 32 clock
>>>> +	 * cycles is required between de-asserting the clkgen reset and
>>>> +	 * de-asserting the GPU reset. Assuming a worst-case scenario with
>>>> +	 * a very high GPU clock frequency, a delay of 1 microsecond is
>>>> +	 * sufficient to ensure this requirement is met across all
>>>> +	 * feasible GPU clock speeds.
>>>> +	 */
>>>> +	udelay(1);
>>>
>>> I don't love that this procedure appears in the platform reset driver.
>>> I appreciate it may not be clear from the SoC TRM, but this is the
>>> standard reset procedure for all IMG Rogue GPUs. The currently
>>> supported TI SoC handles this in silicon, when power up/down requests
>>> are sent so we never needed to encode it in the driver before.
>>>
>>> Strictly speaking, the 32 cycle delay is required between power and
>>> clocks being enabled and the reset line being deasserted. If nothing
>>> here touches power or clocks (which I don't think it should), the delay
>>> could potentially be lifted to the GPU driver.
> 
> ... This could be expressed as a delay between clk_prepare_enable() and
> reset_control_deassert() in the GPU driver then.
> 
>> Yeah you're making excellent points here, I think it would be a good    
>> idea to place the delay in the GPU driver, since this is specific to the
>> whole family of the GPU's not the SoC itself.
>>
>>> Is it expected that if a device exposes a reset in devicetree that it
>>> can be cleanly reset without interaction with the device driver itself?
>>> I.E. in this case, is it required that the reset driver alone can cleanly
>>> reset the GPU?
> 
> No, the "resets" property should just describe the physical
> connection(s) between reset controller and the device.
> 
> It is fine for the device driver to manually assert the reset, enable
> clocks and power, delay, and then deassert the reset, if that is the
> device specific reset procedure.
> 
>> I'm not sure what the community as a whole thinks about that, so maybe
>> someone else can answer this, but I would code SoC specific stuff in the
>> reset driver for the SoC, and the GPU specific stuff (like the delay) in
>> the GPU driver code. I wasn't sure whether the delay was specific to the
>> SoC or the GPU so I've put it here.
> 
> I agree.
> 
> regards
> Philipp
> 
