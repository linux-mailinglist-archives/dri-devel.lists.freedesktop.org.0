Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C95A4FE32
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 13:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDBD10E758;
	Wed,  5 Mar 2025 12:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eGm0NuZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597D510E758
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741176343;
 bh=cv01yWXXEehfnSZMHFpdXl+PqwR5Uk2g28SbDbVbfLA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eGm0NuZpMU0xchw2NZFx8AQArBzYrTRyAKk/tGXp1vW22wICZT5d2zir9X+JoXtnk
 u4OIF62gaTJwPG22KEuy8r/fbdqWMKBmS/lBvo6H4K0dPzvzCsDD4KvNzhuWitP2E4
 k2y8snNwLWUTlRLsoC/4w3DDK085UxvwyHrBAQmBuUpuZOABGsrebctvCUrjJnIyYw
 sho1rA5CSxZLFwElco10AekgBsDUa5Dv+flCQGOYwwu0z8dLIqQ8hx/qAaAzBsN9++
 QYE2n7YSw2gGnAG9bXRsz/KYBiB2K/jn7HezVoGztl8Z5PqAI8CH1Gl2YQkLT3o5To
 FjStWjMhEYOHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E3E017E0343;
 Wed,  5 Mar 2025 13:05:42 +0100 (CET)
Message-ID: <9d383fc5-8c64-478c-8aab-6c56bf5b45be@collabora.com>
Date: Wed, 5 Mar 2025 13:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
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
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
 <652e435c-563b-496a-a4c3-c2e2b665abcf@collabora.com>
 <5aa04ff5fa567468f32921d4014bbae696c6470f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5aa04ff5fa567468f32921d4014bbae696c6470f.camel@mediatek.com>
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

Il 05/03/25 09:36, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo,
> 
> Thanks for the reviews.
> 
> On Tue, 2025-03-04 at 10:32 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 18/02/25 06:41, Jason-JH Lin ha scritto:
>>> MT8196 has 3 new hardware configuration compared with the previous
>>> SoC,
>>> which correspond to the 3 new driver data:
>>>
>>> 1. mminfra_offset: For GCE data plane control
>>>      Since GCE has been moved into mminfra, GCE needs to append the
>>>      mminfra offset to the DRAM address when accessing the DRAM.
>>>
>>> 2. gce_vm: For GCE hardware virtualization
>>>      Currently, the first version of the mt8196 mailbox controller
>>> only
>>>      requires setting the VM-related registers to enable the
>>> permissions
>>>      of a host VM.
>>
>> I think that the GCE VM changes should go to a different commit, as
>> that
>> looks like being something not critical for basic functionality of
>> the
>> MMINFRA GCE.
>>
>> I really like seeing support for that, but please split the basic
>> stuff
>> from the extra functionality :-)
>>
> 
> The VM configuration is the basic configuration for MT8196, so I put it
> together with other configurations in one patch.
> But I can understand you want the new function as a independent patch.
> So I will split the VM related part, mminfra_offset part and dma_mask
> part to 3 single pathes. Then add them as a driver data for MT8196 in
> this patch.
> 

Yeah, thanks, the log simply gets more readable like that.

>>>
>>> 3. dma_mask_bit: For dma address bit control
>>>      In order to avoid the hardware limitations of MT8196 accessing
>>> DRAM,
>>>      GCE needs to configure the DMA address to be less than 35 bits.
>>>
>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>> ---
>>>    drivers/mailbox/mtk-cmdq-mailbox.c       | 90
>>> +++++++++++++++++++++---
>>>    include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
>>>    2 files changed, 84 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> index d186865b8dce..0abe10a7fef9 100644
>>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>>> @@ -43,6 +43,17 @@
>>>    #define GCE_CTRL_BY_SW                              GENMASK(2, 0)
>>>    #define GCE_DDR_EN                          GENMASK(18, 16)
>>>
>>> +#define GCE_VM_ID_MAP0                       0x5018
>>> +#define GCE_VM_MAP0_ALL_HOST                 GENMASK(29, 0)
>>> +#define GCE_VM_ID_MAP1                       0x501c
>>> +#define GCE_VM_MAP1_ALL_HOST                 GENMASK(29, 0)
>>> +#define GCE_VM_ID_MAP2                       0x5020
>>> +#define GCE_VM_MAP2_ALL_HOST                 GENMASK(29, 0)
>>> +#define GCE_VM_ID_MAP3                       0x5024
>>> +#define GCE_VM_MAP3_ALL_HOST                 GENMASK(5, 0)
>>> +#define GCE_VM_CPR_GSIZE             0x50c4
>>> +#define GCE_VM_CPR_GSIZE_HSOT                        GENMASK(3, 0)
>>
>> typo: GSIZE_HOST....
>>
> 
> Thanks, I'll fix it.
> 
>> ...but also, if you could add some brief description of what the
>> VMIDs are used for
>> and what the GSIZE is... that'd be very much appreciated from whoever
>> is reading
>> this.
>>
> VMID_MAP configuration is in the previous reply mail for CK.

Oh, sorry, too many emails - sometimes I lose some :-)

> CPR_GSIZE is the setting for allocating the CPR SRAM size to each VM.

Would be awesome if you could then clarify the comment that you have later in
the code here, from...

/* config cpr size for host vm */

to

/* Set the amount of CPR SRAM to allocate to each VM */

...that could be a way of more properly describing what the writel there is doing.

> 
>> The GCE stuff isn't even properly described in datasheets - I do
>> (probably!)
>> understand what those are for, but asking people to get years of
>> experience on
>> MediaTek to understand what's going on would be a bit rude, wouldn't
>> it? :-D
>>
> 
> I agree with you :-)
> I'll put them in the VM patch and add some brief description for them.
> 

Thanks, much appreciated!

>>> +
>>>    #define CMDQ_THR_ACTIVE_SLOT_CYCLES 0x3200
>>>    #define CMDQ_THR_ENABLED            0x1
>>>    #define CMDQ_THR_DISABLED           0x0
>>> @@ -87,11 +98,24 @@ struct cmdq {
>>>    struct gce_plat {
>>>        u32 thread_nr;
>>>        u8 shift;
>>> +     dma_addr_t mminfra_offset;
>>
>> It looks like this is exactly the DRAM's iostart... at least, I can
>> see that in the
>> downstream devicetree that's where it starts.
>>
>>          memory: memory@80000000 {
>>                  device_type = "memory";
>>                  reg = <0 0x80000000 0 0x40000000>;
>>          };
>>
>> It doesn't really look like being a coincidence, but, for the sake of
>> asking:
>> is this just a coincidence? :-)
>>
> 
> As the confirmation with the hardware designer in previous reply mail
> for CK:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250218054405.2017918-4-jason-jh.lin@mediatek.com/#26258463
> 

That explanation was simply wonderful.

> Since the MMINFRA remap subtracting 2G is done in the hardware circuit
> and cannot be configured by software, the address +2G adjustment is
> necessary to implement in the CMDQ driver.
> 
> So that might not be a coincidence.
> But even if DRAM start address changes, this mminfra_offset is still
> subtracting 2G, so I think it is a better choice to define it as the
> driver data for MT8196.
> 

....so, this makes me think the following:

1. The DRAM start address cannot *ever* be less than 2G, because otherwise the
    MMINFRA HW would have a hole in the usable address range;
    1a. If the start address changes to less than 2G, then also the IOMMU would
        get limitations, not only the mminfra..!
    2b. This makes it very very very unlikely for the start address to be changed
        to less than 0x80000000

2. If the DRAM start address changes to be ABOVE 2G (so more than 0x80000000),
    there would be no point for MMINFRA to start a "config path" write (or read)
    in the SMMU DRAM block, would it? ;-)

I get it - if the DRAM moves up, MMINFRA is still at 2G because that's hard baked
into the hardware, but I foresee that it'll be unlikely to see a platform changing
the DRAM start address arbitrarily, getting out-of-sync with MMINFRA.

I propose to just get the address from the memory node for now, and to add a nice
comment in the code that explains that "In at least MT8196, the MMINFRA hardware
subtracts xyz etc etc" (and that explanation from the previous email is again
wonderful and shall not be lost: either use that in the comment, or add it to
the commit description, because it's really that good).

Should a new SoC appear in the future requiring an offset from the DRAM start
address, we will think about how to make that work in the best possible way: in
that case we could either reference something else to get the right address or
we can just change this driver to just use the 2G offset statically for all.

What I'm trying to do here is to reduce the amount of changes that we'd need for
adding new SoCs: since that 2G MMINFRA offset -> 2G DRAM start is not a coincidence
I think that, should the DRAM start vary on new SoCs, the MMINFRA offset will
follow the trend and vary with it.

So what I think is:
1. If I'm right, adding a new SoC (with different MMINFRA + DRAM offset) will be
    as easy as adding a compatible string in the bindings, no effort in changing
    this driver with new pdata offsets;
2. If I'm wrong, adding a new SoC means adding compat string and adding pdata and
    one variable in the cmdq struct.

Where N.2 is what we would do anyway if we don't go with my proposed solution...

All this is just to give you my considerations about this topic - you're left
completely free to disagree with me.
If you disagree, I will trust your judgement, no problem here.

>>>        bool control_by_sw;
>>>        bool sw_ddr_en;
>>> +     bool gce_vm;
>>> +     u32 dma_mask_bit;
>>>        u32 gce_num;
>>>    };
>>>
>>> +static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const
>>> struct gce_plat *pdata)
>>> +{
>>> +     return ((addr + pdata->mminfra_offset) >> pdata->shift);
>>> +}
>>> +
>>> +static inline u32 cmdq_reg_revert_addr(dma_addr_t addr, const
>>> struct gce_plat *pdata)
>>> +{
>>> +     return ((addr << pdata->shift) - pdata->mminfra_offset);
>>> +}
>>
>> I'm not sure that you really need those two functions... probably
>> it's simply
>> cleaner and easier to just write that single line every time... and
>> I'm
>> saying that especially for how you're using those functions, with
>> some readl()
>> passed directly as param, decreasing human readability by "a whole
>> lot" :-)
>>
> 
> The reason why I use API wrapper instead of writing it directly in
> readl() is to avoid missing the shift or mminfra_offset conversion in
> some places.
> This problem is not easy to debug, and I have encountered it at least
> twice...
> 
> I think the advantage of using function is that it can be uniformly
> modified to all places that need to handle DRAM address conversion.
> What do you think? :-)
> 

Eh, if you put it like that... it makes sense, so.. yeah, okay :-)

Still, please cleanup those instances of

`cmdq_reg_revert_addr(readl(something), pdata)`

those might be hard to read, so please just do something like:

regval = readl(something);
curr_pa = cmdq_revert_addr(regval, pdata);

...reword to your own liking, of course.

>>> +
>>>    static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
>>>    {
>>>        WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
>>> @@ -112,6 +136,30 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
>>>    }
>>>    EXPORT_SYMBOL(cmdq_get_shift_pa);
>>>
>>> +dma_addr_t cmdq_get_offset_pa(struct mbox_chan *chan)
>>> +{
>>> +     struct cmdq *cmdq = container_of(chan->mbox, struct cmdq,
>>> mbox);
>>> +
>>> +     return cmdq->pdata->mminfra_offset;
>>> +}
>>> +EXPORT_SYMBOL(cmdq_get_offset_pa);
>>
>> I think I remember this get_offset_pa from the old times, then CK
>> removed it (and I
>> was really happy about that disappearing), or am I confusing this
>> with something
>> else?
>>
>> (of course, this wasn't used for mminfra, but for something else!)
>>
> 
> I can't find any remove history in mtk-cmdq-mailbox.c.
> 
> Maybe you mean the patch in this series?
> https://lore.kernel.org/all/171213938049.123698.15573779837703602591.b4-ty@collabora.com/
> 

Uhm, I think I may have confused something here, but yes I was remembering the
patch series that you pointed out, definitely.

At the end, that series is doing something else, so nevermind, was just confusion.

>>> +
>>> +bool cmdq_addr_need_offset(struct mbox_chan *chan, dma_addr_t
>>> addr)
>>> +{
>>> +     struct cmdq *cmdq = container_of(chan->mbox, struct cmdq,
>>> mbox);
>>> +
>>> +     if (cmdq->pdata->mminfra_offset == 0)
>>> +             return false;
>>> +
>>> +     /*
>>> +      * mminfra will recognize the addr that greater than the
>>> mminfra_offset
>>> +      * as a transaction to DRAM.
>>> +      * So the caller needs to append mminfra_offset for the true
>>> case.
>>> +      */
>>> +     return (addr >= cmdq->pdata->mminfra_offset);
>>
>>
>> /**
>>    * cmdq_is_mminfra_gce() - Brief description
>>    * @args.....
>>    *
>>    * The MMINFRA GCE will recognize an address greater than DRAM
>> iostart as a
>>    * DRAM transaction instead of ....xyz
>>    *
>>    * In order for callers to perform (xyz) transactions through the
>> CMDQ, those
>>    * need to know if they are using a GCE located in MMINFRA.
>>    */
>> bool cmdq_is_mminfra_gce(...)
>> {
>>          return cmdq->pdata->mminfra_offset &&
>>                 (addr >= cmdq->pdata->mminfra_offset)
>>
>>> +}
>>> +EXPORT_SYMBOL(cmdq_addr_need_offset);
>>> +
>>
> 
> OK, I'll modify the API like this.
> 
>> ...but then, is there really no way of just handling the GCE being in
>> MMINFRA
>> transparently from the callers? Do the callers really *need* to know
>> that they're
>> using a new GCE?!
>>
> 
> Since the address subtracting is done in MMINFRA hardware, I think GCE
> users really need to handle it in driver.
> 

Since the users of this infrastructure are multimedia related (disp/MDP3),
I'd also like to get an opinion from MediaTek engineers familiar with that.

CK, Moudy, any opinion on that, please?

>> Another way of saying: can't we just handle the address translation
>> in here instead
>> of instructing each and every driver about how to communicate with
>> the new GCE?!
>>
> 
> The DRAM address may not only be the command buffer to GCE, but also
> the working buffer provided by CMDQ users and being a part of GCE
> instruction, so we need to handle the address translation in CMDQ
> helper driver for the instruction generation.
> E.g. ISP drivers may use GCE to write a hardware settings to a DRAM as
> backup buffer. The GCE write instruction will be:
> WRITE the value of ISP register to DRAM address + mminfra_offset.
> 
> But most of the CMDQ users only need to use GCE to write hardware
> register, so I only keep the translation in cmdq_pkt_mem_move(),
> cmdq_pkt_poll_addr() and cmdq_pkt_jump_abs() at the latest series.

Yeah you're choosing the best of both worlds in that case, I do agree, but
still - if there's a way to avoid drivers to have different handling for
mminfra vs no-mminfra, that'd still be preferred.

Having the handling for something *centralized* somewhere, instead of it
being sparse here and there, would make maintenance way easier...

...and that's why I'm asking for CK and Moudy's opinion, nothing else :-)

Cheers!
Angelo

