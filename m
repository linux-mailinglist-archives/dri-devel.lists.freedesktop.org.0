Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F159F13B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 04:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90335113283;
	Wed, 24 Aug 2022 02:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09797113283
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 02:07:07 +0000 (UTC)
X-UUID: 9a30841eba024f35a035e53e83a8a295-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=170kvgtp+PuxY3dCeidNg7sb0rnWVpuKLSPJmcle+pA=; 
 b=Taa89SeLQSulChF66A/7Md95Aw76+ZWzk1DNliE6tIEMmEWUHfcsFqJ7b0mxVpnXOw6UP3gIV7tFHaMYf3O37qA2ihNJO0XUreB2Q9Kz1RUyNX8yfwP0d3kdAOIjrwunPWmyNhJjp7AzX/5yFuOj8RpvcbAurh2k4ZkJXy+WbRo=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:0d588c1d-54cd-4f09-87ea-7c9c271055c6, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:28,RULE:Releas
 e_Ham,ACTION:release,TS:82
X-CID-INFO: VERSION:1.1.10, REQID:0d588c1d-54cd-4f09-87ea-7c9c271055c6, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:28,RULE:Spam_GS9
 81B3D,ACTION:quarantine,TS:82
X-CID-META: VersionHash:84eae18, CLOUDID:3e4d98c9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:53e717a7c5c0,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: 9a30841eba024f35a035e53e83a8a295-20220824
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1284974133; Wed, 24 Aug 2022 10:07:01 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 10:07:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 10:07:00 +0800
Message-ID: <055d433d0b076af2e27e89c8576d39d2e4adc237.camel@mediatek.com>
Subject: Re: [PATCH 3/3] arm64: dts: Modify gamma compatible for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 24 Aug 2022 10:06:58 +0800
In-Reply-To: <39f63588-bc88-a716-bc66-7f93c4aabc56@linaro.org>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
 <20220822091945.21343-4-zheng-yan.chen@mediatek.com>
 <39f63588-bc88-a716-bc66-7f93c4aabc56@linaro.org>
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

On Tue, 2022-08-23 at 11:40 +0300, Krzysztof Kozlowski wrote:
> On 22/08/2022 12:19, zheng-yan.chen wrote:
> > Modify gamma compatible for mt8195.
> > 
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > 
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index a50ebb5d145f..8504d01b103a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -2021,8 +2021,8 @@
> >  			mediatek,gce-client-reg = <&gce0
> > SUBSYS_1c00XXXX 0x5000 0x1000>;
> >  		};
> >  
> > -		gamma0: gamma@1c006000 {
> > -			compatible = "mediatek,mt8195-disp-gamma",
> > "mediatek,mt8183-disp-gamma";
> > +		gamma0: disp_gamma@1c006000 {
> 
> No, really, no.
> 
> Not explained in commit msg, violates naming convention, violates
> coding
> style, not related to the patch at all.
> 
> Best regards,
> Krzysztof

Sorry about that, I will change this "disp_gamma" back to "gamma".


Best Regards,
Zheng-Yan Chen

