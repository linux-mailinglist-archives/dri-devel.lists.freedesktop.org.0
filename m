Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC3A54B8A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9285710E252;
	Thu,  6 Mar 2025 13:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DhJjecco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD18110E252
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741266489;
 bh=4VH2tK+QU3YhYZw7s4V3IaHAhAPl5z7BMEjep4f94Hw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DhJjeccorupWWnlH1MUXiZk9Lw59escc4DFZbf19Ksm61faHl/ImsrS+Ir0zq6+FP
 c8hOGcpR7U/HnkM3d63ObvE1y7ud8OZPqeIYsa3fWYWCuybM/Nf3bRQlwibtsmY5RP
 PEWJ6PmGmwJZFCkx2cAcqwRcyCz06QP5V81+XRw4ek7wirt2M28bmzffJ7HN5hxiWt
 /4nqVHaSQ6BohWGTW87I6q1hu8xBZtHv4ijr3qvK8TtvxO5G9QrHlqEtfTZZ1kP7yt
 FOTvLCrKJAvhY99RqSukK+TFhqfkCCUHQDCX3AacPFpExrN1K6H0hM6C18YW5jQfvt
 LYqIwvdMjczqg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B70E17E0599;
 Thu,  6 Mar 2025 14:08:08 +0100 (CET)
Message-ID: <1f9007ed-c978-431d-aab2-c04237d5d117@collabora.com>
Date: Thu, 6 Mar 2025 14:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
 <652e435c-563b-496a-a4c3-c2e2b665abcf@collabora.com>
 <5aa04ff5fa567468f32921d4014bbae696c6470f.camel@mediatek.com>
 <9d383fc5-8c64-478c-8aab-6c56bf5b45be@collabora.com>
 <0efe42427be4eb619b6ea7db18687b0211d1ec9f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0efe42427be4eb619b6ea7db18687b0211d1ec9f.camel@mediatek.com>
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

Il 06/03/25 12:00, Jason-JH Lin (林睿祥) ha scritto:
> [snip]
>>
>>> CPR_GSIZE is the setting for allocating the CPR SRAM size to each
>>> VM.
>>
>> Would be awesome if you could then clarify the comment that you have
>> later in
>> the code here, from...
>>
>> /* config cpr size for host vm */
>>
>> to
>>
>> /* Set the amount of CPR SRAM to allocate to each VM */
>>
>> ...that could be a way of more properly describing what the writel
>> there is doing.
>>
> 
> OK, I'll change it.
> 
>>>
>>>> The GCE stuff isn't even properly described in datasheets - I do
>>>> (probably!)
>>>> understand what those are for, but asking people to get years of
>>>> experience on
>>>> MediaTek to understand what's going on would be a bit rude,
>>>> wouldn't
>>>> it? :-D
>>>>
>>>
>>> I agree with you :-)
>>> I'll put them in the VM patch and add some brief description for
>>> them.
>>>
>>
>> Thanks, much appreciated!
>>
>>>>> +
>>>>>     #define CMDQ_THR_ACTIVE_SLOT_CYCLES 0x3200
>>>>>     #define CMDQ_THR_ENABLED            0x1
>>>>>     #define CMDQ_THR_DISABLED           0x0
>>>>> @@ -87,11 +98,24 @@ struct cmdq {
>>>>>     struct gce_plat {
>>>>>         u32 thread_nr;
>>>>>         u8 shift;
>>>>> +     dma_addr_t mminfra_offset;
>>>>
>>>> It looks like this is exactly the DRAM's iostart... at least, I
>>>> can
>>>> see that in the
>>>> downstream devicetree that's where it starts.
>>>>
>>>>           memory: memory@80000000 {
>>>>                   device_type = "memory";
>>>>                   reg = <0 0x80000000 0 0x40000000>;
>>>>           };
>>>>
>>>> It doesn't really look like being a coincidence, but, for the
>>>> sake of
>>>> asking:
>>>> is this just a coincidence? :-)
>>>>
>>>
>>> As the confirmation with the hardware designer in previous reply
>>> mail
>>> for CK:
>>> https://patchwork.kernel.org/project/linux-mediatek/patch/20250218054405.2017918-4-jason-jh.lin@mediatek.com/*26258463
>>>
>>
>> That explanation was simply wonderful.
>>
>>> Since the MMINFRA remap subtracting 2G is done in the hardware
>>> circuit
>>> and cannot be configured by software, the address +2G adjustment is
>>> necessary to implement in the CMDQ driver.
>>>
>>> So that might not be a coincidence.
>>> But even if DRAM start address changes, this mminfra_offset is
>>> still
>>> subtracting 2G, so I think it is a better choice to define it as
>>> the
>>> driver data for MT8196.
>>>
>>
>> ....so, this makes me think the following:
>>
>> 1. The DRAM start address cannot *ever* be less than 2G, because
>> otherwise the
>>      MMINFRA HW would have a hole in the usable address range;
>>      1a. If the start address changes to less than 2G, then also the
>> IOMMU would
>>          get limitations, not only the mminfra..!
>>      2b. This makes it very very very unlikely for the start address
>> to be changed
>>          to less than 0x80000000
>>
>> 2. If the DRAM start address changes to be ABOVE 2G (so more than
>> 0x80000000),
>>      there would be no point for MMINFRA to start a "config path"
>> write (or read)
>>      in the SMMU DRAM block, would it? ;-)
>>
> 
> GCE is using IOMMU in MT8196, so all the address put into the GCE
> instruction or GCE register for GCE access should be IOVA.
> 
> The DRAM start address is 2G(PA=0x80000000, IOVA=0x0) currently, so
> when GCE want to access the IOVA=0x0, it will need to +2G into the
> instruction, then the MMINFRA will see it as data path(IOVA > 2G) and
> subtract 2G for that IOVA, so GCE can finally access the IOVA=0x0.
> 
> I'm not sure if I've misunderstood what you mean by ABOVE 2G. :-)
> If DRAM start address is changed to 3G(PA=0xc0000000) the IOVA is still
> 0x0, so GCE still need to + 2G to make MMINFRA go to the data path.
> 
> But if you mean PA=0x80000000 and IOVA start address is 3G(0xc0000000),
> then MMINFRA will go to the data path without GCE +2G.
> However, MMINFRA will -2G when going to the data path and that will
> cause GCE access the wrong IOVA.
> So GCE still need to +2G no matter IOVA start address is already can
> make MMINFRA go to the data path(IOVA > 2G).
> 
> We have already complained to our hardware designer that MMINFRA -2G
> con not be changed, which will make software operation very
> troublesome.
> So in the next few generations of SoC will change this MMINFRA -2G to
> software configurable. Then we can just make IOVA start address to 2G
> without adding the mminfra_offset to the IOVA for GCE.
> 

Okay now I got it, the reality is way worse than I was thinking... eww... :-(

>> I get it - if the DRAM moves up, MMINFRA is still at 2G because
>> that's hard baked
>> into the hardware, but I foresee that it'll be unlikely to see a
>> platform changing
>> the DRAM start address arbitrarily, getting out-of-sync with MMINFRA.
>>
>> I propose to just get the address from the memory node for now, and
>> to add a nice
>> comment in the code that explains that "In at least MT8196, the
>> MMINFRA hardware
>> subtracts xyz etc etc" (and that explanation from the previous email
>> is again
>> wonderful and shall not be lost: either use that in the comment, or
>> add it to
>> the commit description, because it's really that good).
>>
>> Should a new SoC appear in the future requiring an offset from the
>> DRAM start
>> address, we will think about how to make that work in the best
>> possible way: in
>> that case we could either reference something else to get the right
>> address or
>> we can just change this driver to just use the 2G offset statically
>> for all.
>>
>> What I'm trying to do here is to reduce the amount of changes that
>> we'd need for
>> adding new SoCs: since that 2G MMINFRA offset -> 2G DRAM start is not
>> a coincidence
>> I think that, should the DRAM start vary on new SoCs, the MMINFRA
>> offset will
>> follow the trend and vary with it.
>>
>> So what I think is:
>> 1. If I'm right, adding a new SoC (with different MMINFRA + DRAM
>> offset) will be
>>      as easy as adding a compatible string in the bindings, no effort
>> in changing
>>      this driver with new pdata offsets;
>> 2. If I'm wrong, adding a new SoC means adding compat string and
>> adding pdata and
>>      one variable in the cmdq struct.
>>
>> Where N.2 is what we would do anyway if we don't go with my proposed
>> solution...
>>
>> All this is just to give you my considerations about this topic -
>> you're left
>> completely free to disagree with me.
>> If you disagree, I will trust your judgement, no problem here.
>>
> 
> Yes, I think your are right. No matter the IOVA start address changing,
> MMINFRA will still -2G(the start address of DRAM PA).
> Do you mean we can get the mminfra_offset from the start address of
> memory in DTS, rather than defining it in pdata?
> 

After the last explanation... no, it would be wrong to get the start from
memory in DTS, because then this will still need hacks.
I was somehow convinced that the DRAM start address and the MMINFRA offset
were directly related and that it would've been hard to change the DRAM
start address with the MMINFRA offset being -2G, but it's not, so doing it
my way will eventually backfire on us.

So my way is not good, as it's not showing the reality of things.

Just go with your current way, as it's really tied to the hardware and it's
not restricted to that dram start coincidence in the end. That's a pity.

Just instead of writing 0x80000000, use " SZ_2G " instead... and please
add a comment in the code that explains in brief that there's this strange
behavior for which we.. need that, and that's a static subtraction, and is
tied to the MMINFRA hardware, and cannot be changed :-(

btw, being clear..

#include <linux/sizes.h>

.mminfra_offset = SZ_2G,

..that way you don't even need a comment saying /* 2GB */ ....

Cheers!

>>>>>         bool control_by_sw;
>>>>>         bool sw_ddr_en;
>>>>> +     bool gce_vm;
>>>>> +     u32 dma_mask_bit;
>>>>>         u32 gce_num;
>>>>>     };
>>>>>
>>>>> +static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const
>>>>> struct gce_plat *pdata)
>>>>> +{
>>>>> +     return ((addr + pdata->mminfra_offset) >> pdata->shift);
>>>>> +}
>>>>> +
>>>>> +static inline u32 cmdq_reg_revert_addr(dma_addr_t addr, const
>>>>> struct gce_plat *pdata)
>>>>> +{
>>>>> +     return ((addr << pdata->shift) - pdata->mminfra_offset);
>>>>> +}
>>>>
>>>> I'm not sure that you really need those two functions... probably
>>>> it's simply
>>>> cleaner and easier to just write that single line every time...
>>>> and
>>>> I'm
>>>> saying that especially for how you're using those functions, with
>>>> some readl()
>>>> passed directly as param, decreasing human readability by "a
>>>> whole
>>>> lot" :-)
>>>>
>>>
>>> The reason why I use API wrapper instead of writing it directly in
>>> readl() is to avoid missing the shift or mminfra_offset conversion
>>> in
>>> some places.
>>> This problem is not easy to debug, and I have encountered it at
>>> least
>>> twice...
>>>
>>> I think the advantage of using function is that it can be uniformly
>>> modified to all places that need to handle DRAM address conversion.
>>> What do you think? :-)
>>>
>>
>> Eh, if you put it like that... it makes sense, so.. yeah, okay :-)
>>
>> Still, please cleanup those instances of
>>
>> `cmdq_reg_revert_addr(readl(something), pdata)`
>>
>> those might be hard to read, so please just do something like:
>>
>> regval = readl(something);
>> curr_pa = cmdq_revert_addr(regval, pdata);
>>
>> ...reword to your own liking, of course.
>>
> 
> OK, I'll refine that. Thanks.
> 
>>>>> +
>>>>>     static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool
>>>>> enable)
>>>>>     {
>>>>>         WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq-
>>>>>> clocks));
>>>>> @@ -112,6 +136,30 @@ u8 cmdq_get_shift_pa(struct mbox_chan
>>>>> *chan)
>>>>>     }
>>>>>     EXPORT_SYMBOL(cmdq_get_shift_pa);
>>>>>
>>>>> +dma_addr_t cmdq_get_offset_pa(struct mbox_chan *chan)
>>>>> +{
>>>>> +     struct cmdq *cmdq = container_of(chan->mbox, struct cmdq,
>>>>> mbox);
>>>>> +
>>>>> +     return cmdq->pdata->mminfra_offset;
>>>>> +}
>>>>> +EXPORT_SYMBOL(cmdq_get_offset_pa);
>>>>
>>>> I think I remember this get_offset_pa from the old times, then CK
>>>> removed it (and I
>>>> was really happy about that disappearing), or am I confusing this
>>>> with something
>>>> else?
>>>>
>>>> (of course, this wasn't used for mminfra, but for something
>>>> else!)
>>>>
>>>
>>> I can't find any remove history in mtk-cmdq-mailbox.c.
>>>
>>> Maybe you mean the patch in this series?
>>> https://lore.kernel.org/all/171213938049.123698.15573779837703602591.b4-ty@collabora.com/
>>>
>>
>> Uhm, I think I may have confused something here, but yes I was
>> remembering the
>> patch series that you pointed out, definitely.
>>
>> At the end, that series is doing something else, so nevermind, was
>> just confusion.
>>
> 
> OK, no problem.
> 
>>>>> +
>>>>> +bool cmdq_addr_need_offset(struct mbox_chan *chan, dma_addr_t
>>>>> addr)
>>>>> +{
>>>>> +     struct cmdq *cmdq = container_of(chan->mbox, struct cmdq,
>>>>> mbox);
>>>>> +
>>>>> +     if (cmdq->pdata->mminfra_offset == 0)
>>>>> +             return false;
>>>>> +
>>>>> +     /*
>>>>> +      * mminfra will recognize the addr that greater than the
>>>>> mminfra_offset
>>>>> +      * as a transaction to DRAM.
>>>>> +      * So the caller needs to append mminfra_offset for the
>>>>> true
>>>>> case.
>>>>> +      */
>>>>> +     return (addr >= cmdq->pdata->mminfra_offset);
>>>>
>>>>
>>>> /**
>>>>     * cmdq_is_mminfra_gce() - Brief description
>>>>     * @args.....
>>>>     *
>>>>     * The MMINFRA GCE will recognize an address greater than DRAM
>>>> iostart as a
>>>>     * DRAM transaction instead of ....xyz
>>>>     *
>>>>     * In order for callers to perform (xyz) transactions through
>>>> the
>>>> CMDQ, those
>>>>     * need to know if they are using a GCE located in MMINFRA.
>>>>     */
>>>> bool cmdq_is_mminfra_gce(...)
>>>> {
>>>>           return cmdq->pdata->mminfra_offset &&
>>>>                  (addr >= cmdq->pdata->mminfra_offset)
>>>>
>>>>> +}
>>>>> +EXPORT_SYMBOL(cmdq_addr_need_offset);
>>>>> +
>>>>
>>>
>>> OK, I'll modify the API like this.
>>>
>>>> ...but then, is there really no way of just handling the GCE
>>>> being in
>>>> MMINFRA
>>>> transparently from the callers? Do the callers really *need* to
>>>> know
>>>> that they're
>>>> using a new GCE?!
>>>>
>>>
>>> Since the address subtracting is done in MMINFRA hardware, I think
>>> GCE
>>> users really need to handle it in driver.
>>>
>>
>> Since the users of this infrastructure are multimedia related
>> (disp/MDP3),
>> I'd also like to get an opinion from MediaTek engineers familiar with
>> that.
>>
>> CK, Moudy, any opinion on that, please?
>>
>>>> Another way of saying: can't we just handle the address
>>>> translation
>>>> in here instead
>>>> of instructing each and every driver about how to communicate
>>>> with
>>>> the new GCE?!
>>>>
>>>
>>> The DRAM address may not only be the command buffer to GCE, but
>>> also
>>> the working buffer provided by CMDQ users and being a part of GCE
>>> instruction, so we need to handle the address translation in CMDQ
>>> helper driver for the instruction generation.
>>> E.g. ISP drivers may use GCE to write a hardware settings to a DRAM
>>> as
>>> backup buffer. The GCE write instruction will be:
>>> WRITE the value of ISP register to DRAM address + mminfra_offset.
>>>
>>> But most of the CMDQ users only need to use GCE to write hardware
>>> register, so I only keep the translation in cmdq_pkt_mem_move(),
>>> cmdq_pkt_poll_addr() and cmdq_pkt_jump_abs() at the latest series.
>>
>> Yeah you're choosing the best of both worlds in that case, I do
>> agree, but
>> still - if there's a way to avoid drivers to have different handling
>> for
>> mminfra vs no-mminfra, that'd still be preferred.
>>
>> Having the handling for something *centralized* somewhere, instead of
>> it
>> being sparse here and there, would make maintenance way easier...
>>
>> ...and that's why I'm asking for CK and Moudy's opinion, nothing else
>> :-)
>>
> 
> Yes, I totally agree with you. Thanks for the asking!
> 
> Regards,
> Jason-JH.Lin
> 
>> Cheers!
>> Angelo
>>
> 



