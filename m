Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C236817B7DE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC7D6EC6B;
	Fri,  6 Mar 2020 08:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 180856EC50
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 02:34:20 +0000 (UTC)
X-UUID: 0bcd69818ec44aa19b87aa0671e71ffa-20200306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lw7Z2hh6lxCttqw2IBWx1RQ1VaA6UHtHaJjaKiScxsU=; 
 b=e6ayxYvJPghsOeTmMKrxd+rDVv0LvxracPf2u1WBaq49Z7bf7awGJRY7Z9RXTt8/QyLyOp6nBUPB/iuIuHDkxt80A9kyPZ9ZMmjB8bJs6tJlqhBxcfDfOxmyxMltr6TCrFy6XOwb04o6zTxdOMyGNUjxdVoXWcum5c0B1+qgdZg=;
X-UUID: 0bcd69818ec44aa19b87aa0671e71ffa-20200306
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <nick.fan@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1834358050; Fri, 06 Mar 2020 10:34:16 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Mar 2020 10:33:05 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Mar 2020 10:34:16 +0800
Message-ID: <1583462055.4947.6.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
From: Nick Fan <nick.fan@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 6 Mar 2020 10:34:15 +0800
In-Reply-To: <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org>
 <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>, David
 Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for my late reply.
I have checked internally.
The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
domain.

If the naming too confusing, we can change this name to
MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.

Thanks

Nick Fan

On Wed, 2020-02-26 at 08:55 +0800, Nicolas Boichat wrote:

> +Nick Fan +Sj Huang @ MTK
> 
> On Wed, Feb 26, 2020 at 1:16 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> > > Define a compatible string for the Mali Bifrost GPU found in
> > > Mediatek's MT8183 SoCs.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > ---
> > >
> > > v4:
> > >  - Add power-domain-names description
> > >    (kept Alyssa's reviewed-by as the change is minor)
> > > v3:
> > >  - No change
> > >
> > >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > index 4ea6a8789699709..0d93b3981445977 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > @@ -17,6 +17,7 @@ properties:
> > >      items:
> > >        - enum:
> > >            - amlogic,meson-g12a-mali
> > > +          - mediatek,mt8183-mali
> > >            - realtek,rtd1619-mali
> > >            - rockchip,px30-mali
> > >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > > @@ -62,6 +63,30 @@ allOf:
> > >            minItems: 2
> > >        required:
> > >          - resets
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: mediatek,mt8183-mali
> > > +    then:
> > > +      properties:
> > > +        sram-supply: true
> > > +        power-domains:
> > > +          description:
> > > +            List of phandle and PM domain specifier as documented in
> > > +            Documentation/devicetree/bindings/power/power_domain.txt
> > > +          minItems: 3
> > > +          maxItems: 3
> > > +        power-domain-names:
> > > +          items:
> > > +            - const: core0
> > > +            - const: core1
> > > +            - const: 2d
> >
> > AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each
> > core group is correct though.
> 
> Good question... Hopefully Nick/SJ@MTK can comment, the non-upstream DTS has:
> gpu: mali@13040000 {
> compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
> power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>;
> ...
> }
> 
> gpu_core1: mali_gpu_core1 {
> compatible = "mediatek,gpu_core1";
> power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>;
> };
> 
> gpu_core2: mali_gpu_core2 {
> compatible = "mediatek,gpu_core2";
> power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
> };
> 
> So I picked core0/core1/2d as names, but looking at this, it's likely
> core2 is more appropriate (and MT8183_POWER_DOMAIN_MFG_2D might just
> be a internal/legacy name, if there is no real 2d domain).
> 
> Thanks.
> 
> > Rob

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
