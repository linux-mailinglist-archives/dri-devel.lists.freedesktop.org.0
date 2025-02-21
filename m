Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62071A4046D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 01:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BE910EB40;
	Sat, 22 Feb 2025 00:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="jzbgJ3N3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E30E10EAFB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OnPJY1YmRTCsjsI68pp1t+5Ummz4CbGGB5KW9cC+vdo=; b=jzbgJ3N3bGi56lsr6UvckXM0yt
 yZOXDH4GRVzsBSgeNrr3aBGqiQwQpnU+4IOO/q1NKQxN6McMD2th6RTZnA7fUQVEU7Rxrld3qW7vX
 ejKqNS26vNC8GtFfck9M2CYKWAsz2UOfunS4M2CANjzsXU70trqtOsAVu6un+D38bSdy82YXFAVQ3
 CkCGDCpkLZrkQJCaiVqGu77keQZ+QWdamB/o8fAurdj+gSQTNHqyQbNr1JBSAjXjdL1ievKPNltPF
 vee2wFsY616tA0+8+f9+zbWVlSvCCkOZsDqYjM3u1vBdB2yS0njabCEcgYeR1r8sfhX5vVManuZKd
 TW3xjTWQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
 by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96-58-g4e9ed49f8) (envelope-from <kuba@szczodrzynski.pl>)
 id 1tlViw-00AOLX-2K; Fri, 21 Feb 2025 17:17:58 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
Date: Fri, 21 Feb 2025 17:17:50 +0100
Message-Id: <20250221161751.1278049-5-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-Mailman-Approved-At: Sat, 22 Feb 2025 00:55:20 +0000
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

The sun4i TCON needs a reference to the D-PHY in order to support LVDS
on Allwinner D1s/T113.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb0..d241ba306 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -828,6 +828,8 @@ tcon_lcd0: lcd-controller@5461000 {
 			resets = <&ccu RST_BUS_TCON_LCD0>,
 				 <&ccu RST_BUS_LVDS0>;
 			reset-names = "lcd", "lvds";
+			phys = <&dphy>;
+			phy-names = "dphy";
 			#clock-cells = <0>;
 
 			ports {
-- 
2.25.1

