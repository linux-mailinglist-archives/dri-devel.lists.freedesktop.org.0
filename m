Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0734F5BC3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7010E2B2;
	Wed,  6 Apr 2022 10:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7758710E2B2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:48:53 +0000 (UTC)
X-UUID: fd052d13cf3b4bf3a48b595c441a8d01-20220406
X-UUID: fd052d13cf3b4bf3a48b595c441a8d01-20220406
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 352717976; Wed, 06 Apr 2022 18:48:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 18:48:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 18:48:45 +0800
Message-ID: <4ed2dc24d600fa73b91bb411391c98a5bf4f8d8b.camel@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Date: Wed, 6 Apr 2022 18:48:45 +0800
In-Reply-To: <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
 <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?=
 <yongqiang.niu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Allen-KH Cheng =?UTF-8?Q?=28=E7=A8=8B=E5=86=A0=E5=8B=B3=29?=
 <Allen-KH.Cheng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-04-06 at 18:40 +0800, AngeloGioacchino Del Regno wrote:
> Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> > The driver data for MT8192 is the same with MT8183. Therefore, we
> > correct it.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> ...though, from what I know, you should also move MT8195 down there!

Hello Angelo,

Thanks for your review.
But for MT8195, disp_aal is using the same compatible with MT8173.

From the MT8195 project DTS is using:

aal0: disp_aal@1c005000 {
	compatible = "mediatek,mt8195-disp-aal",
		     "mediatek,mt8173-disp-aal";
	reg = <0 0x1c005000 0 0x1000>;
	interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
	clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
	mediatek,gce-client-reg =
		 <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
};

BRs,
Rex

