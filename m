Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C9BBE571
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 16:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565210E410;
	Mon,  6 Oct 2025 14:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aTu5Azn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F4F10E408
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759760935;
 bh=moPhboMCqOcy7E35eV70b8p04uz19sEys49+po5lmDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aTu5Azn9EYNbHp0U0Frt4k7Z/yiKZqUrUW1Eb0f0yhAkipHb7gxuL3SRtmOLhh3Fk
 xGCmIUu0V8u50FF3ZploRlYW67Rz5TtuUQ4OyPGQMYm4dHWl8RvUNpZ/hQ0jXgLo98
 QzjwrTrUyMIWZmQvIIN2dCBKd8CAdggTwWLpAy527gxXKccjgIZNuzGRaYjzBRA7F3
 xhaBzlhq+Xtuy9ngFDjrpMEXUD7CRK/lk7w1OqqVvZprBiO/Q7LeHJMpsLWtbd9KcJ
 bAheJzOsUqRMX2aIjqttPfCoEzm373uR8hNwTQrBWWVPRxUXGs7tegPZbvGVD70orl
 hX3t2ma24MH5w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A9D1C17E0071;
 Mon,  6 Oct 2025 16:28:54 +0200 (CEST)
Message-ID: <97228670-1e68-4bd5-8ee7-3d87bdf3eaad@collabora.com>
Date: Mon, 6 Oct 2025 16:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <8586490.T7Z3S40VBb@workhorse>
 <94866bc6-0fdb-4e6c-ba78-5ebd7138f193@collabora.com>
 <4457422.ejJDZkT8p0@workhorse>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4457422.ejJDZkT8p0@workhorse>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/10/25 14:16, Nicolas Frattaroli ha scritto:
> On Monday, 6 October 2025 13:37:28 Central European Summer Time AngeloGioacchino Del Regno wrote:
>> Il 06/10/25 12:58, Nicolas Frattaroli ha scritto:
>>> On Friday, 3 October 2025 23:41:16 Central European Summer Time Chia-I Wu wrote:
>>>> On Fri, Oct 3, 2025 at 1:16 PM Nicolas Frattaroli
>>>> <nicolas.frattaroli@collabora.com> wrote:
>>>>>
>>>>> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
>>>>> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
>>>>> integration silicon is required to power on the GPU.
>>>>>
>>>>> This glue silicon is in the form of an embedded microcontroller running
>>>>> special-purpose firmware, which autonomously adjusts clocks and
>>>>> regulators.
>>>>>
>>>>> Implement a driver, modelled as a pmdomain driver with a
>>>>> set_performance_state operation, to support these SoCs.
>>>> I like this model a lot. Thanks!
>>>>
>>>> panthor might potentially need to interact with this driver beyond
>>>> what pmdomain provides. I am thinking about querying
>>>> GF_REG_SHADER_PRESENT. Not sure if we've heard back from the vendor.
>>>
>>> We did. The vendor confirmed this value is read by the EB firmware
>>> from an efuse, but considers the efuse address to be confidential.
>>> Consequently, we are not allowed to know the efuse address, or any
>>> of the other information required to read the efuse ourselves
>>> directly, such as what clocks and power domains it depends on.
>>>
>>> We therefore likely need to pass GF_REG_SHADER_PRESENT onward, but
>>> I do have an idea for that: struct generic_pm_domain has a member
>>> "cpumask_var_t cpus", which is there to communicate a mask of which
>>> CPUs are attached to a power domain if the power domain has the flag
>>> GENPD_FLAG_CPU_DOMAIN set. If the flag isn't set, the member is
>>> unused.
>>
>> cpumask_var_t is not going to be the right type for anything else that is
>> not a cpumask, as that is limited by NR_CPUS.
> 
> Hmmm, good point, I thought that would be done by the allocation
> but nope.
>   
>> You'd have to declare a new bitmap, suitable for generic devices, which may
>> get a little complicated on deciding how many bits would be enough... and
>> if we look at GPUs... AMD and nV have lots of cores, so that becomes a bit
>> unfeasible to put in a bitmap.
>>
>> Not sure then how generic that would be.
> 
> Yeah, at this point I'm rapidly approaching "shove stuff into pmdomain
> for no obvious pmdomain reason" territory, because we're not really
> communicating that this pmdomain is only tied to these cores, but
> rather that only these cores are present. Subtle difference that
> could come bite us in the rear once some other chip has several power
> domains that tie to different GPU shader cores.
> 

I think that the only thing that we might see at some point in the future is one
power domain per "set of shader cores", but not even sure that's really going to
ever be a thing, as it might just not be worth implementing from a firmware
perspective.

I am guessing here - we won't ever see one power domain per core.

Besides, also remember that many GPUs do have internal power management (as in,
per-core or per-core-set shutdown) so there already is such a power saving way.
That makes a vendor-specific implementation of that way less likely to see, even
though.. being cautious, never say never.

In any case, we can't predict the future, we can only guess - and evaluate things
that could or could not realistically make sense.

(anyway if you find a magic ball, please share, I need it for some other stuff :P)

>>
>>>
>>> This means we could overload its meaning, e.g. with a new flag, to
>>> communicate such masks for other purposes, since it's already the
>>> right type and all. This would be quite a generic way for hardware
>>> other than cpus to communicate such core masks. I was planning to
>>> develop and send out an RFC series for this, to gauge how much Ulf
>>> Hansson hates that approach.
>>>
>>> A different solution could be that mtk-mfg-pmdomain could act as an
>>> nvmem provider, and then we integrate generic "shader_present is
>>> stored in nvmem" support in panthor, and adjust the DT binding for
>>> this.
>>>
>>> This approach would again be generic across vendors from panthor's
>>> perspective. It would, however, leak into DT the fact that we have
>>> to implement this in the gpufreq device, rather than having the
>>> efuse read directly.
>>>
>>>> Have you considered moving this to drivers/soc/mediatek such that we
>>>> can provide include/linux/mtk-mfg.h to panthor?
>>>
>>> Having panthor read data structures from mtk-mfg-pmdomain would be a
>>> last resort for me if none of the other approaches work out, as I'm
>>> not super keen on adding vendor-specific code paths to panthor
>>> itself. A new generic code path in panthor that is only used by one
>>> vendor for now is different in that it has the potential to be used
>>> by a different vendor's integration logic in the future as well.
>>>
>>> So for now I'd like to keep it out of public includes and panthor as
>>> much as possible, unless the two other approaches don't work out for
>>> us.
>>>
>>
>> I don't really like seeing more and more vendor specific APIs: MediaTek does
>> suffer quite a lot from that, with cmdq being one of the examples - and the
>> fact that it's not just MediaTek having those, but also others like Qualcomm,
>> Rockchip, etc, is not an excuse to keep adding new ones when there are other
>> alternatives.
>>
>> Also another fact there is that I don't think that panthor should get any
>> vendor specific "things" added (I mean, that should be avoided as much as
>> possible).
> 
> The big issue to me is that vendors will always prefer to shoehorn
> more vendor specific hacks into panthor, because the alternative is
> to tell us how the hardware actually works. Which they all hate
> doing.

That's a bit too much pessimistic... I hope.

> I definitely agree that we should work from the assumption
> that panthor can support a Mali implementation without adding too
> much special code for it, because in 10 years there will still be
> new devices that use panthor as a driver, but few people will still
> be testing MT8196 codepaths within panthor, which makes refactoring
> prone to subtle breakage.

I had no doubt that you were thinking alike, but happy to see that confirmed.

> 
> Not to mention that we don't want to rewrite all the vendor specific
> code for Tyr.
> 
>> That said - what you will be trying to pass is really a value that is read
>> from eFuse, with the EB firmware being a wrapper over that: if we want, we
>> could see that yet-another-way of interfacing ourselves with reading nvmem
>> where, instead of a direct MMIO read, we're asking a firmware to give us a
>> readout.
>>
>> This leads me to think that one of the possible options could be to actually
>> register (perhaps as a new platform device, because I'm not sure that it could
>> be feasible to register a pmdomain driver as a nvmem provider, but ultimately
>> that is Ulf and Srinivas' call I guess) a nvmem driver that makes an IPI call
>> to GPUEB and gives back the value to panthor through generic bindings.
> 
> Lee Jones will probably tell me to use MFD instead and that I'm silly
> for not using MFD, so we might as well. Should I do that for v7 or
> should v7 be less disruptive? Also, would I fillet out the clock
> provider stuff into an MFD cell as well, or is that too much?
> 
> Also, nb: there is no IPI call for getting the SHADER_PRESENT value
> that we know of. It's a location in the reserved shared memory
> populated by the EB during the shared mem init, which ideally isn't
> done multiple times by multiple drivers because that's dumb.
> 
> On the other hand, I don't really know what we get out of splitting
> this up into several drivers, other than a more pleasing directory
> structure and get_maintainers picking up the right subsystem people.
> 

I'm not sure. A power controller being also a clock provider isn't entirely
uncommon (look at i.MX8 MP), but then think about it: if you add a MFD, you
are still introducing vendor APIs around... as you'd need a way to do your
piece of communication with the EB.

The benefit, then, is only what you just said.

There are literally too many alternatives to do the very same as what you're
doing here, including having a (firmware|soc)/mediatek-gpueb.c driver managing
only the communication part, and the rest all in small different drivers, or...

...you could share the reserved-memory between the two drivers, and have the efuse
driver getting a power domain from mtk-mfg-pmdomain (to check and call mfg power
on), then reading the byte(s) that you need from GF_REG_SHADER_PRESENT from there.

Not sure then what's the best option.

One thing I'm sure about is that you're setting how everything works *now*, and
changing that later is going to cause lots of pain and lots of suffering, so a
decision must be taken right now.

>>>>>
>>>>> The driver also exposes the actual achieved clock rate, as read back
>>>>> from the MCU, as common clock framework clocks, by acting as a clock
>>>>> provider as well.
>>>>>
>>>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>>>> ---
>>>>>    drivers/pmdomain/mediatek/Kconfig            |   16 +
>>>>>    drivers/pmdomain/mediatek/Makefile           |    1 +
>>>>>    drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 1027 ++++++++++++++++++++++++++
>>>>>    3 files changed, 1044 insertions(+)
>>>> [...]
>>>>> +static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
>>>>> +{
>>>>> +       struct device *dev = &mfg->pdev->dev;
>>>>> +       struct mtk_mfg_ipi_msg msg = {};
>>>>> +       int ret;
>>>>> +
>>>>> +       dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", mfg->shared_mem_size);
>>>>> +       memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
>>>>> +
>>>>> +       msg.cmd = CMD_INIT_SHARED_MEM;
>>>>> +       msg.u.shared_mem.base = mfg->shared_mem_phys;
>>>>> +       msg.u.shared_mem.size = mfg->shared_mem_size;
>>>>> +
>>>>> +       ret = mtk_mfg_send_ipi(mfg, &msg);
>>>>> +       if (ret)
>>>>> +               return ret;
>>>>> +
>>>>> +       if (readl(mfg->shared_mem) != GPUEB_MEM_MAGIC) {
>>>> Add the offset GF_REG_MAGIC, even though it is 0.
>>>
>>> Good catch, will do!
>>>
>>>>
>>>>> +               dev_err(dev, "EB did not initialise shared memory correctly\n");
>>>>> +               return -EIO;
>>>>> +       }
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>> [...]
>>>>> +static int mtk_mfg_mt8196_init(struct mtk_mfg *mfg)
>>>>> +{
>>>>> +       void __iomem *e2_base;
>>>>> +
>>>>> +       e2_base = devm_platform_ioremap_resource_byname(mfg->pdev, "hw-revision");
>>>>> +       if (IS_ERR(e2_base))
>>>>> +               return dev_err_probe(&mfg->pdev->dev, PTR_ERR(e2_base),
>>>>> +                                    "Couldn't get hw-revision register\n");
>>>>> +
>>>>> +       if (readl(e2_base) == MFG_MT8196_E2_ID)
>>>>> +               mfg->ghpm_en_reg = RPC_DUMMY_REG_2;
>>>>> +       else
>>>>> +               mfg->ghpm_en_reg = RPC_GHPM_CFG0_CON;
>>>>> +
>>>>> +       return 0;
>>>>> +};
>>>> Extraneous semicolon.
>>>
>>> Good catch, will fix!
>>>
>>>>
>>>>> +static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
>>>>> +{
>>>>> +       struct device *dev = &mfg->pdev->dev;
>>>>> +       struct mtk_mfg_mbox *gf;
>>>>> +       struct mtk_mfg_mbox *slp;
>>>>> +
>>>>> +       gf = devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
>>>>> +       if (!gf)
>>>>> +               return -ENOMEM;
>>>>> +
>>>>> +       gf->rx_data = devm_kzalloc(dev, GPUEB_MBOX_MAX_RX_SIZE, GFP_KERNEL);
>>>> It looks like gfx->rx_data can simply be "struct mtk_mfg_ipi_msg rx_data;".
>>>
>>> Hmmm, good point. I'll change it to that.
>>>
>>
>> Honestly, I prefer the current version. No strong opinions though.
> 
> And I just realised you're sorta right in that; struct mtk_mfg_mbox is
> a type used by both the gpufreq mbox and the sleep mbox. The struct
> mtk_mfg_ipi_msg type is only the right type to use for the gpufreq
> mbox. By making rx_data a `struct mtk_mfg_ipi_msg` type, we're
> allocating it for both channels, and in the case of the sleep mailbox,
> it's the wrong type to boot (though not like sleep replies).
> 
> So yeah I think I'll keep the current construct. If this driver grows
> another limb in the future that talks to yet another mailbox channel,
> we'll appreciate not having to untangle that.

...that was the implicit reasoning around my statement, yes.

Cheers,
Angelo

> 
>> [...]
> 
> Kind regards,
> Nicolas Frattaroli
> 
> 


