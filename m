Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3889E1E07E4
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130D89DA2;
	Mon, 25 May 2020 07:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEF9689B83
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:39:31 +0000 (UTC)
X-UUID: bd043902c5a64ada902523b1c0ac946b-20200525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Budt1Q/YKyyHz1LfMtaltAftGMWuXZGR8k5sFbQgD9I=; 
 b=uVtaZAO0ztm5vjRXLPBVsHPSqkJDUZIT8Nku1f1uGLGcCikpf2MC6DJ/gmfZeJ0MeCFEAy7xDlaiL0bmnyCP0fgET1W/KvHNQHdIklTni3sMIPiLSHhAbNoH4R2GDlr7qdRcAW8vI+P1bdK98QyCkiNNdtt+8u4E6X3ufujFITo=;
X-UUID: bd043902c5a64ada902523b1c0ac946b-20200525
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 303714022; Mon, 25 May 2020 01:39:27 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 01:39:22 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 01:39:22 +0800
Message-ID: <1590341965.31286.27.camel@mtkswgap22>
Subject: Re: [PATCH v5 13/13] soc: mediatek: cmdq: add set event function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 25 May 2020 01:39:25 +0800
In-Reply-To: <d00dd874-edda-701a-2acc-540ed19d1300@gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-14-git-send-email-dennis-yc.hsieh@mediatek.com>
 <d00dd874-edda-701a-2acc-540ed19d1300@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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

Hi Matthias,

Thanks for your comment.


On Sat, 2020-05-16 at 20:32 +0200, Matthias Brugger wrote:
> 
> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
> > Add set event function in cmdq helper functions to set specific event.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 15 +++++++++++++++
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
> >  include/linux/soc/mediatek/mtk-cmdq.h    |  9 +++++++++
> >  3 files changed, 25 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index ec5637d43254..3294c9285994 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -327,6 +327,21 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_clear_event);
> >  
> > +int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> > +
> > +	if (event >= CMDQ_MAX_EVENT)
> > +		return -EINVAL;
> > +
> > +	inst.op = CMDQ_CODE_WFE;
> > +	inst.value = CMDQ_WFE_UPDATE | CMDQ_WFE_UPDATE_VALUE;
> > +	inst.event = event;
> > +
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_set_event);
> > +
> >  int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
> >  		  u16 offset, u32 value)
> >  {
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index 42d2a30e6a70..ba2d811183a9 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -17,6 +17,7 @@
> >  #define CMDQ_JUMP_PASS			CMDQ_INST_SIZE
> >  
> >  #define CMDQ_WFE_UPDATE			BIT(31)
> > +#define CMDQ_WFE_UPDATE_VALUE		BIT(16)
> >  #define CMDQ_WFE_WAIT			BIT(15)
> >  #define CMDQ_WFE_WAIT_VALUE		0x1
> >  
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index d63749440697..ca70296ae120 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -168,6 +168,15 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
> >   */
> >  int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event);
> >  
> > +/**
> > + * cmdq_pkt_set_event() - append set event command to the CMDQ packet
> > + * @pkt:	the CMDQ packet
> > + * @event:	the desired event to be set
> 
> Can we add the events and their code, so that later on, when a consumer calls
> cmdq_pkt_set_event() we don't have any magic values that are hard to understand?

Please see patch 02/13:
http://lists.infradead.org/pipermail/linux-mediatek/2020-March/027801.html

Definitions begin with CMDQ_EVENT_ is the event id to this function.
Since the event id is different between platform, client must parse it
from device tree. So no magic values require when call this function.


Regard,
Dennis


> 
> Regards,
> Matthias
> 
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event);
> > +
> >  /**
> >   * cmdq_pkt_poll() - Append polling command to the CMDQ packet, ask GCE to
> >   *		     execute an instruction that wait for a specified
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
