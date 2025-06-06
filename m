Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87262AD0113
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 13:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B81410E35F;
	Fri,  6 Jun 2025 11:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D76E10EA3D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 11:11:17 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5A3AD6002C18;
 Fri,  6 Jun 2025 11:45:57 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id DAvTjK_YH0C4; Fri,  6 Jun 2025 11:45:52 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 810AB6003C3B;
 Fri,  6 Jun 2025 11:45:51 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749206751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3RaW7nJDY4u0LgCaykCArI3bAHh2H+SVvOp/hfhgUg=;
 b=Xc9ZCPYrHFG5E5SkpLETHHz2Kkbzf5BzgsIeC7MhYq8dyOF4d8glxXhgu0rbb3jkMaDiHp
 8qUTrvEdB9rYPUSBg2WQ88eaDohmZegGtvakWR1o7C+PHYslhg4cONyvF034pdaYhFwc7w
 9r5nKQnYON05kBIiDk3NF6yInetiMpI=
Received: from [192.168.1.151] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 5B86336008B;
 Fri,  6 Jun 2025 11:45:51 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Fri, 06 Jun 2025 11:45:36 +0100
Subject: [PATCH 3/3] arm64: tegra: Add NVJPG node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-diogo-nvjpg-v1-3-5f2c36feeb39@tecnico.ulisboa.pt>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
In-Reply-To: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749206748; l=1018;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=+723/NY6KvxdN/NVCwc/Xg4at7iqHe19s5FcoIyfirg=;
 b=vLVZFQrZn4UcAC2DS79V2Tka/+rkbmSG2SzFuLdk4ZaguRvAfmXaJBG5imLAXrQZTN3HcBvjK
 2koOIxwEcb8CUFXkIxVk29ff3avixffo84Bk5LHkmdxtHFSMpUXoJBU
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
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

The Tegra X1 chip contains a NVJPG accelerator capable of
encoding/decoding JPEG files in hardware, so add its DT node.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 6f8cdf012f0f12a16716e9d479c46b330bbb7dda..087f38256fd40f57c4685e907f9682eb49ee31db 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -253,7 +253,13 @@ vic@54340000 {
 		nvjpg@54380000 {
 			compatible = "nvidia,tegra210-nvjpg";
 			reg = <0x0 0x54380000 0x0 0x00040000>;
-			status = "disabled";
+			clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
+			clock-names = "nvjpg";
+			resets = <&tegra_car 195>;
+			reset-names = "nvjpg";
+
+			iommus = <&mc TEGRA_SWGROUP_NVJPG>;
+			power-domains = <&pd_nvjpg>;
 		};
 
 		dsib: dsi@54400000 {

-- 
2.49.0

