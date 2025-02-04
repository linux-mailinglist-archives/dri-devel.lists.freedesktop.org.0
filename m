Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8AA271EE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475A810E607;
	Tue,  4 Feb 2025 12:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SDRz9mNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02A310E607
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738672818;
 bh=fwoOPfxtLFJ4fVTrja/ABWK9UK3wUv/NKNwiIh28t0g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SDRz9mNTtjcmQVzJyaumGKp5SACJoZughm8o/TVpYCptdrFz+SV9+qTkWP67hL9je
 sbHy5e5o2SE3ZRsupnyT+ptU+95iqOpQVtZCo18C6Pr2zvDlX8d7zsrIpXujFYRYRl
 1MLhnxlsFD6gW0VmfHkVRT5MA/dVgwmLQxGWVRchpss+JFKEzSnnoWa9oLg6CmMa1J
 u2ndYhdW5KKWLIXKKxx56QzmgiC7qzYzd+RKwfZBoRlIPp66l6ssJKG3GPv04u1myJ
 sougejvkxO7dCa43gW9EPtFKgAZRLgRxxxclD2NHfTscGxCzgfNhIK+aGIvhvpuLL2
 f41CVz21W0Gug==
Received: from localhost (unknown [188.27.43.189])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 579D617E1531;
 Tue,  4 Feb 2025 13:40:18 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Feb 2025 14:40:08 +0200
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Add HDMI0 PHY PLL clock
 source to VOP2 on RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-vop2-hdmi0-disp-modes-v3-5-d71c6a196e58@collabora.com>
References: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
In-Reply-To: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 FUKAUMI Naoki <naoki@radxa.com>
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VOP2 on RK3588 is able to use the HDMI PHY PLL as an alternative and
more accurate pixel clock source to improve handling of display modes up
to 4K@60Hz on video ports 0, 1 and 2.

For now only HDMI0 output is supported, hence add the related PLL clock.

Tested-by: FUKAUMI Naoki <naoki@radxa.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index c2d1f08e55d4cb4b4d2b6a89f26542fdc99fd604..13146793188c466faabe6a88e6230ba09f36770c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1261,14 +1261,16 @@ vop: vop@fdd90000 {
 			 <&cru DCLK_VOP1>,
 			 <&cru DCLK_VOP2>,
 			 <&cru DCLK_VOP3>,
-			 <&cru PCLK_VOP_ROOT>;
+			 <&cru PCLK_VOP_ROOT>,
+			 <&hdptxphy_hdmi0>;
 		clock-names = "aclk",
 			      "hclk",
 			      "dclk_vp0",
 			      "dclk_vp1",
 			      "dclk_vp2",
 			      "dclk_vp3",
-			      "pclk_vop";
+			      "pclk_vop",
+			      "pll_hdmiphy0";
 		iommus = <&vop_mmu>;
 		power-domains = <&power RK3588_PD_VOP>;
 		rockchip,grf = <&sys_grf>;

-- 
2.48.1

