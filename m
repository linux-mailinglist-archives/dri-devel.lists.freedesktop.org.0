Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C9293579
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 09:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B8B6F432;
	Tue, 20 Oct 2020 07:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21A026EBFE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 02:30:19 +0000 (UTC)
X-UUID: db9b1113f116439b854c52e598c87f49-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Meq6SMM9NCGXd0ezAvIYe7RYnC+ZkZUEfKlU7K9AvO0=; 
 b=Jk3PsQHlj1xArPyMeyfpnbKcv8E0Skq620YzqEKS9shjuBWWNJZWqErb2tm24GM+wS4C6G8/ukwDEe8ZVNSbxjmY5dFu9/aOllDD/Jt4gBV8GId/IksqGvsX39L3qbgzAxIKOxJf4PiuKEluxbRRrk3LDilcSIWnjKQ6af78HLc=;
X-UUID: db9b1113f116439b854c52e598c87f49-20201020
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1283119071; Tue, 20 Oct 2020 10:30:13 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Oct 2020 10:30:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 10:30:10 +0800
Message-ID: <1603161010.29336.138.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/8] dt-bindings: phy: convert phy-mtk-xsphy.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 10:30:10 +0800
In-Reply-To: <20201016170003.GA1562276@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201016170003.GA1562276@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBCCCD990EB25D087AF48EDB6BFB253E0AAAA7B568F8028A17DF86A16663C7DB2000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 20 Oct 2020 07:05:14 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-10-16 at 12:00 -0500, Rob Herring wrote:
> On Tue, Oct 13, 2020 at 04:52:00PM +0800, Chunfeng Yun wrote:
> > Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: modify description and compatible definition suggested by Rob
> > ---
> >  .../bindings/phy/mediatek,xsphy.yaml          | 200 ++++++++++++++++++
> >  .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
> >  2 files changed, 200 insertions(+), 109 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > new file mode 100644
> > index 000000000000..86511f19277a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > @@ -0,0 +1,200 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek XS-PHY Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +
> > +description: |
> > +  The XS-PHY controller supports physical layer functionality for USB3.1
> > +  GEN2 controller on MediaTek SoCs.
[...]
> > +
> > +  ranges: true
> > +
> > +  mediatek,src-ref-clk-mhz:
> > +    description:
> > +      Frequency of reference clock for slew rate calibrate
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Properties with a standard unit suffix don't need a type.
Ok, will remove it, and also do it for other patches, thanks

> > -- 
[...]
> > 2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
