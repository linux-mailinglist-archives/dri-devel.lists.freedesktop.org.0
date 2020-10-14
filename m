Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FCB28ED63
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144486E062;
	Thu, 15 Oct 2020 07:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 14 Oct 2020 07:12:48 UTC
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B85F6E9FF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 07:12:48 +0000 (UTC)
X-UUID: 597ff07714d449a18eed34164f43ca0d-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=liqqNPZ7bhnTmHQkiIXmgSnZuggaH0is3HAOFrjhmfI=; 
 b=rJ47ziMLdbDOQz4WrNOmGUq+hrZ/ysAxMX2mxZGu1FikYksj9EtRVM+/pNzT6Lsn0OYVrvm+jySBPKJPYnhlVIQ5fv0TCz0g7DD6k29OSMWQVDSfWz4SdfVJmtqJjJsc6wpwm8QWZZe2spDEwvIo7C8tv4P7MEje4TzBUwDAU5o=;
X-UUID: 597ff07714d449a18eed34164f43ca0d-20201014
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1753992200; Wed, 14 Oct 2020 15:07:36 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Oct 2020 15:07:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 15:07:32 +0800
Message-ID: <1602659253.29336.79.camel@mhfsdcap03>
Subject: Re: [PATCH v2 4/8] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Wed, 14 Oct 2020 15:07:33 +0800
In-Reply-To: <1602650671.27998.2.camel@mtksdaap41>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-4-chunfeng.yun@mediatek.com>
 <1602650671.27998.2.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D3A8E0BF2FC977AE7986068420E20580FCD3FFE574376E72318CF014D5E6D432000:8
X-MTK: N
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-10-14 at 12:44 +0800, CK Hu wrote:
> Hi, Chunfeng:
> 
> On Tue, 2020-10-13 at 16:52 +0800, Chunfeng Yun wrote:
> > Convert HDMI PHY binding to YAML schema mediatek,ufs-phy.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: fix binding check warning of reg in example
> > ---
> >  .../display/mediatek/mediatek,hdmi.txt        | 17 +---
> >  .../bindings/phy/mediatek,hdmi-phy.yaml       | 90 +++++++++++++++++++
> >  2 files changed, 91 insertions(+), 16 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> > index 7b124242b0c5..edac18951a75 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> > @@ -50,22 +50,7 @@ Required properties:
> >  
> >  HDMI PHY
> >  ========
> > -
> > -The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
> > -output and drives the HDMI pads.
> > -
> > -Required properties:
> > -- compatible: "mediatek,<chip>-hdmi-phy"
> > -- reg: Physical base address and length of the module's registers
> > -- clocks: PLL reference clock
> > -- clock-names: must contain "pll_ref"
> > -- clock-output-names: must be "hdmitx_dig_cts" on mt8173
> > -- #phy-cells: must be <0>
> > -- #clock-cells: must be <0>
> > -
> > -Optional properties:
> > -- mediatek,ibias: TX DRV bias current for <1.65Gbps, defaults to 0xa
> > -- mediatek,ibias_up: TX DRV bias current for >1.65Gbps, defaults to 0x1c
> > +See phy/mediatek,hdmi-phy.yaml
> >  
> >  Example:
> >  
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> > new file mode 100644
> > index 000000000000..77df50204606
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> > @@ -0,0 +1,90 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek High Definition Multimedia Interface (HDMI) PHY binding
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> 
> I think you should remove "CK Hu <ck.hu@mediatek.com>" and add latest
> mediatek drm maintainer:
Ok, will do it, thanks

> 
> DRM DRIVERS FOR MEDIATEK
> M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
> M:	Philipp Zabel <p.zabel@pengutronix.de>
> L:	dri-devel@lists.freedesktop.org
> S:	Supported
> F:	Documentation/devicetree/bindings/display/mediatek/
> F:	drivers/gpu/drm/mediatek/
> 
> Regards,
> CK

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
