Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3693722BEFC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0D76E92C;
	Fri, 24 Jul 2020 07:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F0136E89D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 10:05:17 +0000 (UTC)
X-UUID: 98bf441f4f364f28b43fc4dc64c536c7-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=nIqgvQpS3VAhbyseetbTsl4br2KGKeKt/w/IWi2RGrk=; 
 b=NU0SiGyAI4hlwm4enjiBB2qWC+KyXn1ijbG1UoqaD/M422CwQx/2VjE18vRsEKaXnKTgXnLWdLpSW3lZ1ihiWV1fm8nQT+kWpi+f220b6zszD9ph/VTKW28qmHft1Br2wdc6F8Dl7MDW8SMO0vbhs+g7wZFqs9bzS1nO3r7JLkM=;
X-UUID: 98bf441f4f364f28b43fc4dc64c536c7-20200723
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1215864354; Thu, 23 Jul 2020 18:05:13 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Jul 2020 18:05:11 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 18:05:12 +0800
Message-ID: <1595498644.13250.2.camel@mhfsdcap03>
Subject: Re: [v7, PATCH 1/7] drm/mediatek: move ddp component defint into
 mtk_mmsys.h
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 23 Jul 2020 18:04:04 +0800
In-Reply-To: <CAFqH_50=MkBLHJ23hJo--RG=4560ttOUOjHuEwpevghFZ59xQQ@mail.gmail.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAFqH_50=MkBLHJ23hJo--RG=4560ttOUOjHuEwpevghFZ59xQQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 24 Jul 2020 07:21:47 +0000
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-07-23 at 11:34 +0200, Enric Balletbo Serra wrote:
> Hi Yongqian Niu,
> 
> Thank you for your patch
> 
> Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 23
> de jul. 2020 a les 4:05:
> >
> > move ddp component defint into mtk_mmsys.h
> >
> 
> There is a typo, should be "defines". But why you should move these
> defines to mtk-mmsys?
> 

ck do not like this :
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"

after remove this, we need move the ddp component define

type error will fixed in next version.


> 
> 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 34 +----------------------------
> >  drivers/soc/mediatek/mtk-mmsys.c            |  4 +---
> >  include/linux/soc/mediatek/mtk-mmsys.h      | 33 ++++++++++++++++++++++++++++
> >  3 files changed, 35 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index debe363..161201f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -7,6 +7,7 @@
> >  #define MTK_DRM_DDP_COMP_H
> >
> >  #include <linux/io.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> >
> >  struct device;
> >  struct device_node;
> > @@ -35,39 +36,6 @@ enum mtk_ddp_comp_type {
> >         MTK_DDP_COMP_TYPE_MAX,
> >  };
> >
> > -enum mtk_ddp_comp_id {
> > -       DDP_COMPONENT_AAL0,
> > -       DDP_COMPONENT_AAL1,
> > -       DDP_COMPONENT_BLS,
> > -       DDP_COMPONENT_CCORR,
> > -       DDP_COMPONENT_COLOR0,
> > -       DDP_COMPONENT_COLOR1,
> > -       DDP_COMPONENT_DITHER,
> > -       DDP_COMPONENT_DPI0,
> > -       DDP_COMPONENT_DPI1,
> > -       DDP_COMPONENT_DSI0,
> > -       DDP_COMPONENT_DSI1,
> > -       DDP_COMPONENT_DSI2,
> > -       DDP_COMPONENT_DSI3,
> > -       DDP_COMPONENT_GAMMA,
> > -       DDP_COMPONENT_OD0,
> > -       DDP_COMPONENT_OD1,
> > -       DDP_COMPONENT_OVL0,
> > -       DDP_COMPONENT_OVL_2L0,
> > -       DDP_COMPONENT_OVL_2L1,
> > -       DDP_COMPONENT_OVL1,
> > -       DDP_COMPONENT_PWM0,
> > -       DDP_COMPONENT_PWM1,
> > -       DDP_COMPONENT_PWM2,
> > -       DDP_COMPONENT_RDMA0,
> > -       DDP_COMPONENT_RDMA1,
> > -       DDP_COMPONENT_RDMA2,
> > -       DDP_COMPONENT_UFOE,
> > -       DDP_COMPONENT_WDMA0,
> > -       DDP_COMPONENT_WDMA1,
> > -       DDP_COMPONENT_ID_MAX,
> > -};
> > -
> >  struct mtk_ddp_comp;
> >  struct cmdq_pkt;
> >  struct mtk_ddp_comp_funcs {
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > index a55f255..36ad66b 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -5,13 +5,11 @@
> >   */
> >
> >  #include <linux/device.h>
> > +#include <linux/io.h>
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/soc/mediatek/mtk-mmsys.h>
> >
> > -#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
> > -#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
> > -
> >  #define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> >  #define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> >  #define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 7bab5d9..2228bf6 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -9,6 +9,39 @@
> >  enum mtk_ddp_comp_id;
> >  struct device;
> >
> > +enum mtk_ddp_comp_id {
> > +       DDP_COMPONENT_AAL0,
> > +       DDP_COMPONENT_AAL1,
> > +       DDP_COMPONENT_BLS,
> > +       DDP_COMPONENT_CCORR,
> > +       DDP_COMPONENT_COLOR0,
> > +       DDP_COMPONENT_COLOR1,
> > +       DDP_COMPONENT_DITHER,
> > +       DDP_COMPONENT_DPI0,
> > +       DDP_COMPONENT_DPI1,
> > +       DDP_COMPONENT_DSI0,
> > +       DDP_COMPONENT_DSI1,
> > +       DDP_COMPONENT_DSI2,
> > +       DDP_COMPONENT_DSI3,
> > +       DDP_COMPONENT_GAMMA,
> > +       DDP_COMPONENT_OD0,
> > +       DDP_COMPONENT_OD1,
> > +       DDP_COMPONENT_OVL0,
> > +       DDP_COMPONENT_OVL_2L0,
> > +       DDP_COMPONENT_OVL_2L1,
> > +       DDP_COMPONENT_OVL1,
> > +       DDP_COMPONENT_PWM0,
> > +       DDP_COMPONENT_PWM1,
> > +       DDP_COMPONENT_PWM2,
> > +       DDP_COMPONENT_RDMA0,
> > +       DDP_COMPONENT_RDMA1,
> > +       DDP_COMPONENT_RDMA2,
> > +       DDP_COMPONENT_UFOE,
> > +       DDP_COMPONENT_WDMA0,
> > +       DDP_COMPONENT_WDMA1,
> > +       DDP_COMPONENT_ID_MAX,
> > +};
> > +
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >                            enum mtk_ddp_comp_id cur,
> >                            enum mtk_ddp_comp_id next);
> > --
> > 1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
