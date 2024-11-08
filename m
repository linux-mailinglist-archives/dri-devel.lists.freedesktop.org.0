Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41679C251F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 19:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B21110EA25;
	Fri,  8 Nov 2024 18:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H9gUnldh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5B810EA25
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731091953;
 bh=QMwL51PtNLaFD5FymlZLpqC/w7P9yhG3haRNd0uJ6JU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H9gUnldhr+w7YVYjAlsZmo8ahTArmkkEP1NNPjvPo11j+TSaB1pxhTsEmTZgl0uy/
 mIcfQUz0mKiurzWv/Lqgh206/t7dfcml0/kNossP+t4AqU+I3Oen5sQoJi7usguZeT
 Y3EcliMPBBDKvv1M0Iga8HRN1QPV6dZHZNcnMw5o9imetQbEfTvT9KrJS7nTDbgX79
 QOKkcJv8veIQpevfwqSzPOzSTBEBYd4SotMY7ot5k4m/5oPvH50SO3l8NXjnffhSqK
 kCir97ysPiR3h5JMidyCS47nmbTaM/4sGADKwDENMFwUvNaLb+liZv02ZWcK8ypg1C
 2NMflgAY3z4Ug==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 053A517E376E;
 Fri,  8 Nov 2024 19:52:30 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stubner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 2/3] arm64: dts: rockchip: Add VOP clock resets for rk3588s
Date: Fri,  8 Nov 2024 13:50:40 -0500
Message-ID: <20241108185212.198603-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108185212.198603-1-detlev.casanova@collabora.com>
References: <20241108185212.198603-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This adds the needed clock resets for all rk3588(s) based SOCs.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc67585b64b7..50064f39260c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1272,6 +1272,18 @@ vop: vop@fdd90000 {
 			      "pclk_vop";
 		iommus = <&vop_mmu>;
 		power-domains = <&power RK3588_PD_VOP>;
+		resets = <&cru SRST_A_VOP>,
+			 <&cru SRST_H_VOP>,
+			 <&cru SRST_D_VOP0>,
+			 <&cru SRST_D_VOP1>,
+			 <&cru SRST_D_VOP2>,
+			 <&cru SRST_D_VOP3>;
+		reset-names = "aclk",
+			      "hclk",
+			      "dclk_vp0",
+			      "dclk_vp1",
+			      "dclk_vp2",
+			      "dclk_vp3";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vop-grf = <&vop_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;
-- 
2.47.0

