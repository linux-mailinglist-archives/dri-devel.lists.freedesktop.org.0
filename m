Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89D216763
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4976E5BD;
	Tue,  7 Jul 2020 07:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D8CB6E428
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 14:21:18 +0000 (UTC)
X-UUID: ef53f8de7e3146d1b4dba97de3107d3a-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OXs1SySUuohRlkO/f7ZMQ1WQrymho9U6t0SKN8dmd0A=; 
 b=iDvNp8x5hX0ZvvrjeLDjd0lBU/8azwNDYfNE+Dpei8W/G+GY/nWS1Dqxho2/2Zf7k3lmB4ZPURCOLNkvhVZAVdUk2iP825BmmTZyJpZ/mfRIMasNvCN6EGtNsDhCuZngUJPmxYlXYw6fL0c2mvhp8XXYu0t2W04JB5NYQkTPAgM=;
X-UUID: ef53f8de7e3146d1b4dba97de3107d3a-20200706
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 763318562; Mon, 06 Jul 2020 22:21:13 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 22:21:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Jul 2020 22:21:07 +0800
Message-ID: <1594045270.19205.4.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/8] soc: mediatek: cmdq: add address shift in jump
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 6 Jul 2020 22:21:10 +0800
In-Reply-To: <31a41c40-10f5-260d-cebd-7cc2a432095d@gmail.com>
References: <1593931715-32761-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1593931715-32761-2-git-send-email-dennis-yc.hsieh@mediatek.com>
 <31a41c40-10f5-260d-cebd-7cc2a432095d@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D9D74A0864D11FB68CC9C721CD27F57DA020E8AE1AAB324BDCC36D49191540CF2000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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

thanks for your comment

On Mon, 2020-07-06 at 16:03 +0200, Matthias Brugger wrote:
> 
> On 05/07/2020 08:48, Dennis YC Hsieh wrote:
> > Add address shift when compose jump instruction
> > to compatible with 35bit format.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> 
> You are missing Bibby's Reviewed-by. Please honour the effort reviewers do by
> adding the appropriate tags.
> 
> Please double check the series and resend with all tags added.
> 
> Also, it would be good if you could provide a change log. That makes it easier
> for the maintainer to see which statements you addressed.

this patch changed since cmdq_mbox_shift() rename to cmdq_get_shift_pa()
by Bibby's comment [1], so I removed reviewed tags from this patch.

I'll provide change log to this patch and resend later, thanks.

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2020-June/013387.html


Regards,
Dennis

> 
> Thanks,
> Matthias
> 
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index dc644cfb6419..9faf78fbed3a 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -329,7 +329,8 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  
> >  	/* JUMP to end */
> >  	inst.op = CMDQ_CODE_JUMP;
> > -	inst.value = CMDQ_JUMP_PASS;
> > +	inst.value = CMDQ_JUMP_PASS >>
> > +		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
> >  	err = cmdq_pkt_append_command(pkt, inst);
> >  
> >  	return err;
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
