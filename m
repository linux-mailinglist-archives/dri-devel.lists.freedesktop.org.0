Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C277047FB
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C982110E32A;
	Tue, 16 May 2023 08:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87C610E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:37:18 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 2A67C6004411;
 Tue, 16 May 2023 09:28:39 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id 7ryfeNSuBZrZ; Tue, 16 May 2023 09:28:36 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B8EDE6004412;
 Tue, 16 May 2023 09:28:36 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1684225716;
 bh=bL0KNlmoW6VUoAG7LAfPoCLBx/vGsSzvpVBmifOS6No=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=Gr2tH9wVZjPnRjZqV3xxDRmTXu8WP3X58SoKn47kZbTiQ1Y0G5Air+7sKfeqDocDr
 LxLyakIGTKj3hzuBM9CYAyBhwR3O6ATzHUAfnuo3GvGK56SWoCF4jHUT03VOk85Hm8
 xUXunSpeU0eLM8qojI5XI3b5iiedM0tIiYwmOjzs=
Received: from wslaptop.Home (unknown
 [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 662FE360076;
 Tue, 16 May 2023 09:28:36 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: tegra: smaug: add GPU node
Date: Tue, 16 May 2023 09:28:29 +0100
Message-Id: <20230516082829.15326-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
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

Enable the GPU on the Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 929372f24339..db25f3ae8e0b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -67,6 +67,11 @@ dpaux: dpaux@545c0000 {
 		};
 	};
 
+	gpu@57000000 {
+		vdd-supply = <&max77621_gpu>;
+		status = "okay";
+	};
+
 	pinmux: pinmux@700008d4 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
-- 
2.40.1

