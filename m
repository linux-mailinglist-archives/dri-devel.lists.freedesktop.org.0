Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54322204BAA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4945B6E975;
	Tue, 23 Jun 2020 07:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 188CA6E84A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:36:27 +0000 (UTC)
X-UUID: 953dfad5722f44c9a217319518176f26-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qdItIghJblrh+db3nUEdEkdirsZuBwUJohdvjwiFA2g=; 
 b=Kh07k9mIL6TjTltkdT1EqxEwMOXT7Lz3joV7xWNrJ3KwrfRNiPQW6KUIPeynAHRzEBxEyOeZDiR0admpp+yqpKqRdTGJCaZaoBJsXLkwi8Ax1GQZQp/uFrYOpqKwBoc+pE2eTdn6xQ74iOtpp2blVbcFizKdDxecHZwiX0ETk+E=;
X-UUID: 953dfad5722f44c9a217319518176f26-20200622
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2018445330; Mon, 22 Jun 2020 23:36:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Jun 2020 23:36:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 23:36:19 +0800
Message-ID: <1592840183.1307.12.camel@mtkswgap22>
Subject: Re: [PATCH v1 03/11] soc: mediatek: cmdq: add write_s function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 22 Jun 2020 23:36:23 +0800
In-Reply-To: <a9c6f28a-94d1-f92b-a017-935e80d0ec26@gmail.com>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1592749115-24158-4-git-send-email-dennis-yc.hsieh@mediatek.com>
 <a9c6f28a-94d1-f92b-a017-935e80d0ec26@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

thanks for your comment.

On Mon, 2020-06-22 at 13:07 +0200, Matthias Brugger wrote:
> 
> On 21/06/2020 16:18, Dennis YC Hsieh wrote:
> > add write_s function in cmdq helper functions which
> > writes value contains in internal register to address
> > with large dma access support.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   |   19 +++++++++++++++++++
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
> >  include/linux/soc/mediatek/mtk-cmdq.h    |   19 +++++++++++++++++++
> >  3 files changed, 39 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index bf32e3b2ca6c..817a5a97dbe5 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -18,6 +18,10 @@ struct cmdq_instruction {
> >  	union {
> >  		u32 value;
> >  		u32 mask;
> > +		struct {
> > +			u16 arg_c;
> > +			u16 src_reg;
> > +		};
> >  	};
> >  	union {
> >  		u16 offset;
> > @@ -222,6 +226,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_write_mask);
> >  
> > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> > +		     u16 addr_low, u16 src_reg_idx)
> > +{
> 
> Do I understand correctly that we use CMDQ_ADDR_HIGH(addr) and
> CMDQ_ADDR_LOW(addr) to calculate in the client high_addr_reg_idx and addr_low
> respectively?
> 
> In that case I think a better interface would be to pass the address and do the
> high/low calculation in the cmdq_pkt_write_s

Not exactly. The high_addr_reg_idx parameter is index of internal
register (which store address bit[47:16]), not result of
CMDQ_ADDR_HIGH(addr). 

The CMDQ_ADDR_HIGH macro use in patch 02/11 cmdq_pkt_assign() api. This
api helps assign address bit[47:16] into one of internal register by
index. And same index could be use in cmdq_pkt_write_s(). The gce
combine bit[47:16] in internal register and bit[15:0] in addr_low
parameter to final address. So it is better to keep interface in this
way.


Regards,
Dennis

> 
> Regards,
> Matthias
> 
> > +	struct cmdq_instruction inst = {};
> > +
> > +	inst.op = CMDQ_CODE_WRITE_S;
> > +	inst.src_t = CMDQ_REG_TYPE;
> > +	inst.sop = high_addr_reg_idx;
> > +	inst.offset = addr_low;
> > +	inst.src_reg = src_reg_idx;
> > +
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_write_s);
> > +
> >  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index 121c3bb6d3de..ee67dd3b86f5 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -59,6 +59,7 @@ enum cmdq_code {
> >  	CMDQ_CODE_JUMP = 0x10,
> >  	CMDQ_CODE_WFE = 0x20,
> >  	CMDQ_CODE_EOC = 0x40,
> > +	CMDQ_CODE_WRITE_S = 0x90,
> >  	CMDQ_CODE_LOGIC = 0xa0,
> >  };
> >  
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 83340211e1d3..e1c5a7549b4f 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -12,6 +12,8 @@
> >  #include <linux/timer.h>
> >  
> >  #define CMDQ_NO_TIMEOUT		0xffffffffu
> > +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> > +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
> >  
> >  struct cmdq_pkt;
> >  
> > @@ -103,6 +105,23 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  			u16 offset, u32 value, u32 mask);
> >  
> >  /**
> > + * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
> > + * @pkt:	the CMDQ packet
> > + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> > + * @addr_low:	low address of pa
> > + * @src_reg_idx:	the CMDQ internal register ID which cache source value
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + *
> > + * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
> > + * to get high address and call cmdq_pkt_assign() to assign value into internal
> > + * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
> > + * call to this function.
> > + */
> > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> > +		     u16 addr_low, u16 src_reg_idx);
> > +
> > +/**
> >   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >   * @pkt:	the CMDQ packet
> >   * @event:	the desired event type to "wait and CLEAR"
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
