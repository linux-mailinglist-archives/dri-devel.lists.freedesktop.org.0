Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD971E1C37
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543A789FD4;
	Tue, 26 May 2020 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id A245D89FAD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 10:38:49 +0000 (UTC)
X-UUID: 2973e26015f74616917f96fbd69d82c3-20200525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hP4MHL5rKzsU6+cwtk/2ybNDnctT2+yEC11C/Esk5/o=; 
 b=TFV31XXk0/x4ej3Ymtimxwcrrma9XVcGvxZz7avtFxr2/iH2tEeES+QIuID+MfsKKeiNzCmLdv5KLmXSNa/sCoWuR0hWAM/0de5El/Gpr/QlfSjJImfN/eGlNB8NexisAOeNIxltC0n1gsAvJx0rdeiI0YToMZEalf8Med1Sv+w=;
X-UUID: 2973e26015f74616917f96fbd69d82c3-20200525
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1601699790; Mon, 25 May 2020 18:38:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 18:38:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 18:38:44 +0800
Message-ID: <1590403125.11988.5.camel@mtkswgap22>
Subject: Re: [PATCH v5 09/13] soc: mediatek: cmdq: add write_s value function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 25 May 2020 18:38:45 +0800
In-Reply-To: <68535bf6-9824-5077-4811-374c893cdc03@gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <f9fd9ea8-f706-ed4a-4c83-c53ad092035c@gmail.com>
 <1590341462.31286.19.camel@mtkswgap22>
 <eb604637-28f0-fa8f-ce4b-3e87f6c944ad@gmail.com>
 <1590373621.31522.7.camel@mtkswgap22>
 <68535bf6-9824-5077-4811-374c893cdc03@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7C8ADAEBEC808D17B27E76EFF3A38C58E804BDAD7674469778D687D1892779672000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 2020-05-25 at 10:39 +0200, Matthias Brugger wrote:
> 
> On 25/05/2020 04:27, Dennis-YC Hsieh wrote:
> > 
> > On Sun, 2020-05-24 at 20:13 +0200, Matthias Brugger wrote:
> >>
> >> On 24/05/2020 19:31, Dennis-YC Hsieh wrote:
> >>> Hi Matthias,
> >>>
> >>> Thanks for your comment.
> >>>
> >>> On Sat, 2020-05-16 at 20:20 +0200, Matthias Brugger wrote:
> >>>>
> >>>> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
> >>>>> add write_s function in cmdq helper functions which
> >>>>> writes a constant value to address with large dma
> >>>>> access support.
> >>>>>
> >>>>> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> >>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >>>>> ---
> >>>>>  drivers/soc/mediatek/mtk-cmdq-helper.c | 26 ++++++++++++++++++++++++++
> >>>>>  include/linux/soc/mediatek/mtk-cmdq.h  | 14 ++++++++++++++
> >>>>>  2 files changed, 40 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> >>>>> index 03c129230cd7..a9ebbabb7439 100644
> >>>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> >>>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> >>>>> @@ -269,6 +269,32 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>>  }
> >>>>>  EXPORT_SYMBOL(cmdq_pkt_write_s);
> >>>>>  
> >>>>> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>> +			   u16 addr_low, u32 value, u32 mask)
> >>>>> +{
> >>>>> +	struct cmdq_instruction inst = { {0} };
> >>>>> +	int err;
> >>>>> +
> >>>>> +	if (mask != U32_MAX) {
> >>>>> +		inst.op = CMDQ_CODE_MASK;
> >>>>> +		inst.mask = ~mask;
> >>>>> +		err = cmdq_pkt_append_command(pkt, inst);
> >>>>> +		if (err < 0)
> >>>>> +			return err;
> >>>>> +
> >>>>> +		inst.op = CMDQ_CODE_WRITE_S_MASK;
> >>>>> +	} else {
> >>>>> +		inst.op = CMDQ_CODE_WRITE_S;
> >>>>> +	}
> >>>>> +
> >>>>> +	inst.sop = high_addr_reg_idx;
> >>>>
> >>>> Writing u16 value in a 5 bit wide variable?
> >>>
> >>> We need only 5 bits in this case. I'll change high_addr_reg_idx
> >>> parameter to u8.
> >>>
> >>
> >> Ok, please make sure to mask the value, so that it's explicit in the code that
> >> we only use the lowest 5 bits of high_addr_reg_idx.
> > 
> > Is it necessary to mask the value?
> > Since sop already defined as "u8 sop:5;", I thought it is explicit that
> > only use 5 bits and compiler should do the rest jobs.
> 
> Yes but it makes the code more explicit if we have a
> inst.sop = high_addr_reg_idx & 0x1f;
> 
> What do you think?

The value assign to sop will restrict by hardware spec. Clients call
this function will define constant value and use it as parameter. So I
think we don't worry about client call this api with wrong value.


Regards,
Dennis

> 
> Regards,
> Matthias
> 
> > 
> > 
> > Regards,
> > Dennis
> > 
> >>
> >> Regards,
> >> Matthias
> >>
> >>>>
> >>>>> +	inst.offset = addr_low;
> >>>>> +	inst.value = value;
> >>>>> +
> >>>>> +	return cmdq_pkt_append_command(pkt, inst);
> >>>>> +}
> >>>>> +EXPORT_SYMBOL(cmdq_pkt_write_s_value);
> >>>>> +
> >>>>>  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> >>>>>  {
> >>>>>  	struct cmdq_instruction inst = { {0} };
> >>>>> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> >>>>> index 01b4184af310..fec292aac83c 100644
> >>>>> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> >>>>> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> >>>>> @@ -135,6 +135,20 @@ int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> >>>>>  int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>>  		     u16 addr_low, u16 src_reg_idx, u32 mask);
> >>>>>  
> >>>>> +/**
> >>>>> + * cmdq_pkt_write_s_value() - append write_s command with mask to the CMDQ
> >>>>> + *			      packet which write value to a physical address
> >>>>> + * @pkt:	the CMDQ packet
> >>>>> + * @high_addr_reg_idx:	internal regisger ID which contains high address of pa
> >>>>
> >>>> register
> >>>
> >>> will fix
> >>>
> >>>
> >>> Regards,
> >>> Dennis
> >>>
> >>>>
> >>>>> + * @addr_low:	low address of pa
> >>>>> + * @value:	the specified target value
> >>>>> + * @mask:	the specified target mask
> >>>>> + *
> >>>>> + * Return: 0 for success; else the error code is returned
> >>>>> + */
> >>>>> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>> +			   u16 addr_low, u32 value, u32 mask);
> >>>>> +
> >>>>>  /**
> >>>>>   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >>>>>   * @pkt:	the CMDQ packet
> >>>>>
> >>>
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
