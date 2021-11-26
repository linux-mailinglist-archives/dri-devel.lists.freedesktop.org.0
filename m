Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7045E990
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 09:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88E16EADA;
	Fri, 26 Nov 2021 08:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EDD6EAE2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:46:25 +0000 (UTC)
X-UUID: 822df59ebeb342519baa26e6fdd5906b-20211126
X-UUID: 822df59ebeb342519baa26e6fdd5906b-20211126
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1057212732; Fri, 26 Nov 2021 16:46:19 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 16:46:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Nov 2021 16:46:19 +0800
Message-ID: <0e8aef6a448cdb068133bf4c29c67da2547063a7.camel@mediatek.com>
Subject: Re: [RFC 12/13] arm64: dts: mt8192: Add apu tinysys
From: Flora.Fu <flora.fu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 26 Nov 2021 16:46:19 +0800
In-Reply-To: <314442f7-0c89-8696-05c9-871bfddf1821@collabora.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-13-flora.fu@mediatek.com>
 <314442f7-0c89-8696-05c9-871bfddf1821@collabora.com>
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
Cc: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-10-26 at 17:18 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/10/21 13:14, Flora Fu ha scritto:
> > Add node for APU tinysys.
> > 
> > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36
> > ++++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index c505c6926839..8108084a3f6f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -925,6 +925,42 @@
> >   			#iommu-cells = <1>;
> >   		};
> >   
> > +		apusys_rv@19001000 {
> > +			compatible = "mediatek,mt8192-apusys-rv";
> > +			reg = <0 0x19000000 0 0x1000>,
> > +			      <0 0x19001000 0 0x1000>,
> > +			      <0 0x19002000 0 0x10>;
> > +			reg-names = "apu_mbox",
> > +				    "md32_sysctrl",
> > +				    "apu_wdt";
> > +			mediatek,apusys-power = <&apusys_power>;
> 
> As said on the IOMMU commit, I think that apusys-power can be passed
> as a
> power domain here as well... also keeping in mind that the apuspm
> power
> domain is being used in both the IOMMU and in apusys-power already,
> so you
> could even pass only the apusys-power pd here, because apuspm would
> be
> already being turned on by the former...
> 
> ...unless there's any possibility to have some functionality with
> apuspm up
> but apusys-power down? From how it looks right now, that's not a
> thing.
> 
OK, we will check it.

> > +			power-domains = <&apuspm 0>;
> > +			iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
> > +			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH
> > 0>,
> > +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			interrupt-names = "apu_wdt",
> > +					  "mbox0_irq";
> > +			apu_ctrl {
> > +				compatible = "mediatek,apu-ctrl-rpmsg";
> > +				mtk,rpmsg-name = "apu-ctrl-rpmsg";
> 
> This is supposed to be "mediatek,rpmsg-name" instead... or it won't
> work.
> 
The latest kernel uses "mediatek,rpmsg-name" and I will update the
string in the next submission.

> > +			};
> > +
> > +			apu_pwr_tx {
> > +				compatible = "mediatek,apupwr-tx-
> > rpmsg";
> > +				mtk,rpmsg-name = "apupwr-tx-rpmsg";
> > +			};
> > +
> > +			apu_pwr_rx {
> > +				compatible = "mediatek,apupwr-rx-
> > rpmsg";
> > +				mtk,rpmsg-name = "apupwr-rx-rpmsg";
> > +			};
> > +
> > +			apu_mdw_rpmsg {
> > +				compatible = "mediatek,apu-mdw-rpmsg";
> > +				mtk,rpmsg-name = "apu-mdw-rpmsg";
> > +			};
> > +		};
> > +
> >   		apu_conn: apu_conn@19020000 {
> >   			compatible = "mediatek,mt8192-apu-conn",
> > "syscon";
> >   			reg = <0 0x19020000 0 0x1000>;
> > 

