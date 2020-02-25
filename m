Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8A16BFD8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 12:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D646EAA2;
	Tue, 25 Feb 2020 11:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 25 Feb 2020 11:47:47 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C94A6EAA1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 11:47:47 +0000 (UTC)
X-UUID: 1d13f895af054860a7fe4af933ab3e22-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nGdrZKjnM8EU4Zzjz5/irGxbVBbkkCppjfrte/VkDbQ=; 
 b=o4wGMvp+wJqNB17X1swSo7WatDMYziF7fROkEFMefhIRP9nWLSrXVWYZkPoAj939wOOB4SOxaQjedp6aOHKvPBKd9VjeC2UmUZaUp1IPNyy3ZdZrBXOBTx++ld4jQuCErb6E22c3YYdycbByU88AmbZwVyWONk7EP8MfNsYbQZk=;
X-UUID: 1d13f895af054860a7fe4af933ab3e22-20200225
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1807707731; Tue, 25 Feb 2020 19:42:42 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 19:41:52 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 19:41:20 +0800
Message-ID: <1582630955.13085.2.camel@mszsdaap41>
Subject: Re: [PATCH 1/4] dt-binds: display: mediatek: add property to
 control mipi tx drive current
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Tue, 25 Feb 2020 19:42:35 +0800
In-Reply-To: <1576647693.15003.11.camel@mtksdaap41>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
 <20191216082937.119164-2-jitao.shi@mediatek.com>
 <1576647693.15003.11.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, "stonea168@163.com" <stonea168@163.com>,
 Cawa Cheng =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?=
 <cawa.cheng@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sj
 Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2019-12-18 at 13:41 +0800, CK Hu wrote:
> Hi, Jitao:
> 
> On Mon, 2019-12-16 at 16:29 +0800, Jitao Shi wrote:
> > Add a property to control mipi tx drive current:
> > "mipitx-current-drive"
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > index a19a6cc375ed..780201ddcd5c 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > @@ -33,6 +33,9 @@ Required properties:
> >  - #clock-cells: must be <0>;
> >  - #phy-cells: must be <0>.
> >  
> > +Optional properties:
> > +- mipitx-current-drive: adjust driving current, should be 1 ~ 0xF
> > +
> 
> In "[PATCH 3/4] drm/mediatek: add the mipitx driving control" [1], I see
> that you actually control a register its name is MIPITX_VOLTAGE_SEL, so
> I guess this control the voltage. If mipi_tx has the ability to control
> the voltage, could we just treat mipi_tx as a regulator? For a
> regulator, regulator-min-microvolt and regulator-max-microvolt would
> limit the volt range and you could get it by
> of_get_regulator_init_data(). If it actually control the current,
> regulator-min-microamp and regulator-max-microamp could be used. I'm not
> expert on this, so please give me more information on this.
> 
> [1]
> http://lists.infradead.org/pipermail/linux-mediatek/2019-December/025638.html
> 
> Regards,
> CK
> 

'MIPITX_VOLTAGE_SEL' is the whole 32bit name.
mipitx-current-drive is just bit[9:6] RG_DSI_HSTX_LDO_REF_SEL,

Not for voltage.

Best Regards
Jitao

> >  Example:
> >  
> >  mipi_tx0: mipi-dphy@10215000 {
> > @@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
> >  	clock-output-names = "mipi_tx0_pll";
> >  	#clock-cells = <0>;
> >  	#phy-cells = <0>;
> > +	mipitx-current-drive = <0x8>;
> >  };
> >  
> >  dsi0: dsi@1401b000 {
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
