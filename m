Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FA1DCB6B
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 12:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D83B6E1B9;
	Thu, 21 May 2020 10:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 21 May 2020 10:52:21 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E3856E1B9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 10:52:21 +0000 (UTC)
X-UUID: 0442f1a9833a4fc48a2a7f9fca92908c-20200521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vwJUCYOgb3bqVmIWxvK+TT8AtKtO3x/nNC/FL8RCFqU=; 
 b=Nl+kGqhGbrIvD93P5HGlyKFgjOI/QgG+6fvZkXUt/4hMYWEKw43HvEA9nP+EyWoDCkXm/TcDwwfn1+I36grZHX+6tP4aYIjFz+U93fO0+lTZqGXiBW65wroqXvNR/LoiapE9SKADN+IMj7XK46Of4iROySPyi5glGnnS4e+I7aI=;
X-UUID: 0442f1a9833a4fc48a2a7f9fca92908c-20200521
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1384281164; Thu, 21 May 2020 18:47:15 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 May 2020 18:47:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 May 2020 18:47:11 +0800
Message-ID: <1590058033.29894.2.camel@mtksdaap41>
Subject: Re: [PATCH 1/3] arm64: dts: mt8183: Add gce setting in display node
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 21 May 2020 18:47:13 +0800
In-Reply-To: <77a11bb2-83a1-07b8-e949-eb9e5b37549d@gmail.com>
References: <20200214044954.16923-1-bibby.hsieh@mediatek.com>
 <2369225e-2a92-c493-d089-e03f792df8cf@gmail.com>
 <77a11bb2-83a1-07b8-e949-eb9e5b37549d@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6A05536FA69D4ABBA47AC2218374DEC3C688214C640B5B6C4D594B6D953DC982000:8
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
Cc: drinkcat@chromium.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-05-21 at 12:10 +0200, Matthias Brugger wrote:
> On 14/02/2020 11:06, Matthias Brugger wrote:
> > 
> > 
> > On 14/02/2020 05:49, Bibby Hsieh wrote:
> >> In order to use GCE function, we need add some information
> >> into display node (mboxes, mediatek,gce-client-reg, mediatek,gce-events).
> >>
> >> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> >> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >> ---
> > 
> > For the next time please provide some context on which patches this are based
> > on. Bet below the '---' with a link.
> > 
> > For this time, on which patch/series is this based? :)
> 
> Bibby can you please help and rebase the patch against my for-next branch [1].
> I'm then happy to queue it. Not sure if we can make it for v5.8 as we are really
> late, but we could try :)

Hi, Matthias,

NP, but this patch[1] is depends on another patch [2].
Should I rebase them together into your for-next branch?

[1] https://patchwork.kernel.org/patch/11385863/
[2] https://patchwork.kernel.org/patch/11316277/

Bibby

> 
> Thanks!
> Matthias
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next
> 
> > 
> > Thanks,
> > Matthias
> > 
> >>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >> index be4428c92f35..8b522b039a37 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >> @@ -9,6 +9,7 @@
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >>  #include <dt-bindings/power/mt8183-power.h>
> >> +#include <dt-bindings/gce/mt8183-gce.h>
> >>  #include "mt8183-pinfunc.h"
> >>  
> >>  / {
> >> @@ -664,6 +665,9 @@
> >>  			reg = <0 0x14000000 0 0x1000>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			#clock-cells = <1>;
> >> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> >> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> >>  		};
> >>  
> >>  		ovl0: ovl@14008000 {
> >> @@ -672,6 +676,7 @@
> >>  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
> >>  		};
> >>  
> >>  		ovl_2l0: ovl@14009000 {
> >> @@ -680,6 +685,7 @@
> >>  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
> >>  		};
> >>  
> >>  		ovl_2l1: ovl@1400a000 {
> >> @@ -688,6 +694,7 @@
> >>  			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
> >>  		};
> >>  
> >>  		rdma0: rdma@1400b000 {
> >> @@ -697,6 +704,7 @@
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> >>  			mediatek,rdma_fifo_size = <5120>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
> >>  		};
> >>  
> >>  		rdma1: rdma@1400c000 {
> >> @@ -706,6 +714,7 @@
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> >>  			mediatek,rdma_fifo_size = <2048>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
> >>  		};
> >>  
> >>  		color0: color@1400e000 {
> >> @@ -715,6 +724,7 @@
> >>  			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> >>  		};
> >>  
> >>  		ccorr0: ccorr@1400f000 {
> >> @@ -723,6 +733,7 @@
> >>  			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
> >>  		};
> >>  
> >>  		aal0: aal@14010000 {
> >> @@ -732,6 +743,7 @@
> >>  			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
> >>  		};
> >>  
> >>  		gamma0: gamma@14011000 {
> >> @@ -741,6 +753,7 @@
> >>  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
> >>  		};
> >>  
> >>  		dither0: dither@14012000 {
> >> @@ -749,6 +762,7 @@
> >>  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >>  			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> >> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
> >>  		};
> >>  
> >>  		mutex: mutex@14016000 {
> >> @@ -756,6 +770,8 @@
> >>  			reg = <0 0x14016000 0 0x1000>;
> >>  			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> >>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >> +			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> >> +					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
> >>  		};
> >>  
> >>  		smi_common: smi@14019000 {
> >>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
