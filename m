Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D251BB60
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 11:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0DC10F957;
	Thu,  5 May 2022 09:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEF710F957
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 09:05:45 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nmXQe-0001Q4-00; Thu, 05 May 2022 11:05:44 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nmXQb-0007lM-D7; Thu, 05 May 2022 11:05:41 +0200
Date: Thu, 5 May 2022 11:05:41 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v11 17/24] arm64: dts: rockchip: rk356x: Add HDMI nodes
Message-ID: <20220505090541.GN4012@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-18-s.hauer@pengutronix.de>
 <trinity-bfbffcba-d1ed-40f7-8f37-0c8ad9245e3c-1651740303894@3c-app-gmx-bs47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-bfbffcba-d1ed-40f7-8f37-0c8ad9245e3c-1651740303894@3c-app-gmx-bs47>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:03:13 up 35 days, 21:32, 83 users,  load average: 0.45, 0.31, 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 10:45:03AM +0200, Frank Wunderlich wrote:
> Hi,
> 
> > Gesendet: Freitag, 22. April 2022 um 09:28 Uhr
> > Von: "Sascha Hauer" <s.hauer@pengutronix.de>
> > Betreff: [PATCH v11 17/24] arm64: dts: rockchip: rk356x: Add HDMI nodes
> >
> > Add support for the HDMI port found on RK3568.
> >
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >
> > Notes:
> >     Changes since v7:
> >     - Rename hclk to niu
> 
> clock-name no more present since v9, see below
> 
> >     Changes since v5:
> >     - Drop unnecessary #size-cells/#address-cells from nodes with only single endpoint
> >
> ...
> > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > @@ -620,6 +620,38 @@ vop_mmu: iommu@fe043e00 {
> >  		status = "disabled";
> >  	};
> >
> > +	hdmi: hdmi@fe0a0000 {
> > +		compatible = "rockchip,rk3568-dw-hdmi";
> > +		reg = <0x0 0xfe0a0000 0x0 0x20000>;
> > +		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&cru PCLK_HDMI_HOST>,
> > +			 <&cru CLK_HDMI_SFR>,
> > +			 <&cru CLK_HDMI_CEC>,
> > +			 <&pmucru CLK_HDMI_REF>,
> > +			 <&cru HCLK_VO>;
> > +		clock-names = "iahb", "isfr", "cec", "ref";
> 
> noticed there are still 5 clocks, but only 4 clock-names. So i added "niu" after ref.
> maybe missing clock-name was causing my iommu page-faults...on a quick test i have not got it,
> but they came not every time.

The clock is not handled by the HDMI driver, so it shouldn't be the
cause for any failure. It should be dropped here.

Heiko, could you apply the below patch or squash it into the original
one?

Sascha

-------------------------------8<---------------------------

From 8e5f90273401d98b2202676aafd49a350c9c4abd Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 5 May 2022 10:59:48 +0200
Subject: [PATCH] arm64: dts: rockchip: rk356x: remove extra hdmi clock

HCLK_VO is not handled by the HDMI driver. This is a leftover from
earlier VOP2 series. Remove it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 1a359bbf65300..49eb45e23f8c9 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -627,8 +627,7 @@ hdmi: hdmi@fe0a0000 {
 		clocks = <&cru PCLK_HDMI_HOST>,
 			 <&cru CLK_HDMI_SFR>,
 			 <&cru CLK_HDMI_CEC>,
-			 <&pmucru CLK_HDMI_REF>,
-			 <&cru HCLK_VO>;
+			 <&pmucru CLK_HDMI_REF>;
 		clock-names = "iahb", "isfr", "cec", "ref";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;
-- 
2.30.2

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
