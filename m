Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310115A73DC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 04:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3261210E165;
	Wed, 31 Aug 2022 02:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C549010E165
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 02:25:54 +0000 (UTC)
X-UUID: da5646e681dd4cf9b557f919e41ca971-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3dKkz2EYJLGm1dUqQIb/V7Tm9tOnkhQDkTzS4AJbox4=; 
 b=aV7h4hg/l92+xffzFFLpFQWDCy4jMjdb5wDgEcCfkyq9EFeWsofd6wlZYgtVZy+qQ9Hn9ZRUXCqA9JlDJAW/6eq8H9mpDKsmYXBUg2dn++UKDfAstZpij7A5tK6+M/VipWTPFQ2xPg/9bmufVFX0VN03B1FUp2yCjdO7QeO2e4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:70619928-1a14-411a-bc75-9e4d447b7bf4, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:0fcc1ed0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: da5646e681dd4cf9b557f919e41ca971-20220831
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1535746754; Wed, 31 Aug 2022 10:25:38 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 31 Aug 2022 10:25:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 10:25:36 +0800
Message-ID: <dc2123839b4cae3f67d4aa9194160976a21b06c9.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 31 Aug 2022 10:25:36 +0800
In-Reply-To: <e668a86b-f47b-bc42-440a-a74591827ccb@linaro.org>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <e668a86b-f47b-bc42-440a-a74591827ccb@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-08-30 at 12:13 +0300, Krzysztof Kozlowski wrote:
> > 
> On 30/08/2022 09:39, zheng-yan.chen wrote:
> > Modify gamma compatible for mt8195.
> 
> Commit should explain why. "What" we all can easily see.
> > Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
> > vdosys0")
> 
Hello Krzysztof,
Thanks for the review, 

I will edit commit message below:

Modify gamma compatible for mt8195.

    This modification is because of that
    mt8183 gamma driver data is not compatible with mt8195 gamma.

    Thus, need to delete mt8183 gamma compatible from mt8195 gamma.

> Your patchset is not bisectable and might cause ABI break. I doubt
> that
> it matches the criteria of backports, especially that you did not
> describe here bug being fixed.
> 
> Drop the tag and explain reasons for ABI break.
> 

I will drop the tag and add based-on messages below. 
Base on [1]:
    [1] arm64: dts: mt8195: Add display node for vdosys0
    - 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220811025813.21492-21-tinghan.shen@mediatek.com/

Best Regards,
Zheng-Yan Chen.
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index a50ebb5d145f..d4110f6fac62 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -2022,7 +2022,7 @@
> >  		};
> >  
> >  		gamma0: gamma@1c006000 {
> > -			compatible = "mediatek,mt8195-disp-gamma",
> > "mediatek,mt8183-disp-gamma";
> > +			compatible = "mediatek,mt8195-disp-gamma";
> >  			reg = <0 0x1c006000 0 0x1000>;
> >  			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >  			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDOSYS0>;
> 
> 
> Best regards,
> Krzysztof

