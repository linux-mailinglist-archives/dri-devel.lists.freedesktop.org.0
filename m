Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A72E1B38
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461236E926;
	Wed, 23 Dec 2020 10:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4AA26E86C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 01:41:23 +0000 (UTC)
X-UUID: 196055863cf8486b935c4e8cc7f87ff0-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=bCO1MdnugxBGFYFW+IFPDqIJhWdsGZS/W2S81orE9VU=; 
 b=igIWUGCuSIo6X6qExWvY69gTOyBvdiIJGiz30XNEQXCUi8PjAxjA/MwWjVHsmdS1SNap6MCa9STHwIkxZ8er/yGuN9rR9gyKAzBysFamABmu/1loGq2fUZaBr8xIHylcPXccGPygGg2mpKkYDRerUsIjeMh0H04J7FrRltK1rHo=;
X-UUID: 196055863cf8486b935c4e8cc7f87ff0-20201223
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 927312940; Wed, 23 Dec 2020 09:41:19 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:41:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:41:16 +0800
Message-ID: <1608687676.18252.11.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 14/17] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 23 Dec 2020 09:41:16 +0800
In-Reply-To: <CANMq1KBu4Ft49CUgGMxYdsv6ymWzVWK+eNBhn1t+oEN0ZwP0YA@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KBu4Ft49CUgGMxYdsv6ymWzVWK+eNBhn1t+oEN0ZwP0YA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-12-15 at 21:42 +0800, Nicolas Boichat wrote:
> On Sat, Dec 12, 2020 at 12:13 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > Use function call for setting mmsys ovl mout register
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 18 ++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-mmsys.h |  3 +++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > index cb76e64..2558b42 100644
> > --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > @@ -78,6 +78,15 @@ void mtk_mmsys_ddp_connect(struct device *dev,
> >                 reg = readl_relaxed(mmsys->regs + addr) | value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> >         }
> > +
> > +       if (!funcs->ovl_mout_en)
> > +               return;
> > +
> > +       value = funcs->ovl_mout_en(cur, next, &addr);
> > +       if (value) {
> > +               reg = readl_relaxed(mmsys->regs + addr) | value;
> > +               writel_relaxed(reg, mmsys->regs + addr);
> > +       }
> 
> This is technically correct, but I'm afraid this may become and issue
> later if we have another function like ovl_mout_en.
> 
> So maybe it's better to do:
> if (funcs->ovl_mout_en) {
>   value = funcs->ovl_mout_en(cur, next, &addr);
>   ...
> }

will be improved like this in next version
> 
> Or another option: Create a new function
> static unsigned int mtk_mmsys_ovl_mout_en(...) {
>    if (!funcs->ovl_mout_en)
>       return 0;
> }
> 
> and call that, following the same pattern as
> mtk_mmsys_ddp_mout_en/mtk_mmsys_ddp_sel_in?
> 
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> >
> > @@ -103,6 +112,15 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> >         }
> > +
> > +       if (!funcs->ovl_mout_en)
> > +               return;
> > +
> > +       value = funcs->ovl_mout_en(cur, next, &addr);
> > +       if (value) {
> > +               reg = readl_relaxed(mmsys->regs + addr) & ~value;
> > +               writel_relaxed(reg, mmsys->regs + addr);
> > +       }
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> > index aa4f60e..220203d 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -49,6 +49,9 @@ struct mtk_mmsys_conn_funcs {
> >         u32 (*mout_en)(enum mtk_ddp_comp_id cur,
> >                        enum mtk_ddp_comp_id next,
> >                        unsigned int *addr);
> > +       u32 (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
> > +                          enum mtk_ddp_comp_id next,
> > +                          unsigned int *addr);
> >         u32 (*sel_in)(enum mtk_ddp_comp_id cur,
> >                       enum mtk_ddp_comp_id next,
> >                       unsigned int *addr);
> > --
> > 1.8.1.1.dirty
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
