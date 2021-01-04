Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E203C2E9208
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CEF89EA9;
	Mon,  4 Jan 2021 08:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 577668936E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 05:57:30 +0000 (UTC)
X-UUID: 95011aea59774b22a6e9bf7e135df9d1-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=QCHz3/xaCDIL21iydEhVWPDFe6T2A74wm/k7ncOkQ2s=; 
 b=tI9gLUCbvthOatbvvw4qJyzGRXi2r/wjliPxikRn3ktx5mB2tdkwTpr0JBpThrVkMdmqK1OPUGcB9mJsHbfhLBjm7tQMLFuL2fEEkhckSHS5EP6YVuifugIE8LQdNpQCnwHedX1GQP59hc9Ni3Mk/IpkK7ntLEwQs4mMr82MP1w=;
X-UUID: 95011aea59774b22a6e9bf7e135df9d1-20210104
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1804244745; Mon, 04 Jan 2021 13:57:26 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 4 Jan 2021 13:57:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Jan 2021 13:57:23 +0800
Message-ID: <1609739844.1574.2.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 1/8] soc: mediatek: mmsys: create mmsys folder
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 4 Jan 2021 13:57:24 +0800
In-Reply-To: <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-2-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-12-31 at 09:21 +0800, Nicolas Boichat wrote:
> On Mon, Dec 28, 2020 at 4:38 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > the mmsys will more and more complicated after support
> > more and more SoCs, add an independent folder will be
> > more clear
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/Makefile          |   2 +-
> >  drivers/soc/mediatek/mmsys/Makefile    |   2 +
> >  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 380 +++++++++++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       | 380 ---------------------------------
> 
> I wonder why this doesn't get detected as a rename?
> 

git commit --amend
[detached HEAD 1f10c05] soc: mediatek: mmsys: create mmsys folder
 3 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 rename drivers/soc/mediatek/{ => mmsys}/mtk-mmsys.c (100%)


> >  4 files changed, 383 insertions(+), 381 deletions(-)
> >  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
> >  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
> >  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c
> >
> > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > index 01f9f87..b5987ca 100644
> > --- a/drivers/soc/mediatek/Makefile
> > +++ b/drivers/soc/mediatek/Makefile
> > @@ -3,4 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> >  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> >  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> >  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> > -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> > diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> > new file mode 100644
> > index 0000000..5d976d7
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mmsys/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > \ No newline at end of file
> 
> Nit: newline at end of file please.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
