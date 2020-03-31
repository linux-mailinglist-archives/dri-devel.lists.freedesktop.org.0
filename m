Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A81F198CC6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF25A6E264;
	Tue, 31 Mar 2020 07:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D4BD6E264
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:15:32 +0000 (UTC)
X-UUID: 72369b837d594f6ba68a801989bb2769-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tjPRKJwv3JpOCljaRUaL4xSBagZpOnRqSFRVswzw7Gs=; 
 b=pl3sFafDlzdqzPr2tiyYdnfDuM8e2VR5yyrpb56+s6YCZInYGQz7eFVwID0N/vWNuiQfSKrJ16r2al4CpLWqtCbiNnMbhtayoyFDENSBlRIOj8n088F93u2WgR7jJ774noNjnV32YfBnGiZbOJFLeJ9X+2IurBI/yb5Et7QgAoA=;
X-UUID: 72369b837d594f6ba68a801989bb2769-20200331
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 224437747; Tue, 31 Mar 2020 15:10:23 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 31 Mar 2020 15:10:21 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Mar 2020 15:10:19 +0800
Message-ID: <1585638593.31955.5.camel@mszsdaap41>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 31 Mar 2020 15:09:53 +0800
In-Reply-To: <20200323220033.GA29463@bogus>
References: <20200311074032.119481-1-jitao.shi@mediatek.com>
 <20200311074032.119481-2-jitao.shi@mediatek.com>
 <20200323220033.GA29463@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 518E88426F51400BDCEE41B35C4881984A15EE42DB8BBE274CDC847E3BBA18762000:8
X-MTK: N
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 2020-03-23 at 16:00 -0600, Rob Herring wrote:
> On Wed, Mar 11, 2020 at 03:40:29PM +0800, Jitao Shi wrote:
> > Add a property to control mipi tx drive current:
> > "drive-strength-microamp"
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > index a19a6cc375ed..d501f9ff4b1f 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > @@ -33,6 +33,9 @@ Required properties:
> >  - #clock-cells: must be <0>;
> >  - #phy-cells: must be <0>.
> >  
> > +Optional properties:
> > +- drive-strength-microamp: adjust driving current, should be 1 ~ 0xF
> 
> TBC, 1-0xf is in units of microamps? So a max drive strength of 15uA? 
> Seems a bit low.
> 

The minimum amp is 3000 macroamps,  step is 200macroamps.
So the drive current is 3000 + 200 * drive-strength-microamp amps.

I will update "drive-strength-microamp" define next version.

BR
Jitao
> > +
> >  Example:
> >  
> >  mipi_tx0: mipi-dphy@10215000 {
> > @@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
> >  	clock-output-names = "mipi_tx0_pll";
> >  	#clock-cells = <0>;
> >  	#phy-cells = <0>;
> > +	drive-strength-microamp = <0x8>;
> >  };
> >  
> >  dsi0: dsi@1401b000 {
> > -- 
> > 2.21.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
