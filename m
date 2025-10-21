Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D299BF4F7A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FC510E574;
	Tue, 21 Oct 2025 07:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dW0gTjge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA19510E572
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761031908;
 bh=qr9XyEgoKDrOvlQ/a4EvmrD00l7EvEI7RmtYodAKgIY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dW0gTjgeOApqnGqmEI57D2DqO0dLmHAF2ruzdQQoe0xxt+dy4PLcasIdyPbR6HG0M
 Lv0N9El/lXwuwcdtP3baYFAASpLznKjJVFzGHzrrPddXI9d+GrifdBJQbgOWd84CnD
 tsHOVG1yVeJ/xvC8z/hKQgKS7jT6ZsP+OIlj+U7pAXZOHFZRVl+PehVydDi6yZPSOH
 6C2kEb9w8JrpQkWd1cznIflMWViMXLIleiCQvxdFWgRZbsTfJFoet1qAajhlcEOZ4t
 EbqWu00tZ+ZkOYHrGfaLS3nYoixj0yblyor/1v6rnjZGReJ9HcLYNmPen+TxPfZqra
 GXqqXZXkldPPg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AF99D17E1404;
 Tue, 21 Oct 2025 09:31:47 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 21 Oct 2025 09:30:53 +0200
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8365-evk: Enable GPU
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-mt8365-enable-gpu-v2-3-17e05cff2c86@collabora.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761031905; l=1137;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=qr9XyEgoKDrOvlQ/a4EvmrD00l7EvEI7RmtYodAKgIY=;
 b=BTk5evTjx76vWj0BG4kqs51CoKzKQA0I1u53jD7R8c+No3fzOaD/cj8PcW5jg7FGhngEcjNh5
 lfTS+ARGzmiB2mjtHq+TygszS/qCGstK24Iinm/XVo45JtYMCefdsmE
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

Enable for the Mediatek Genio 350-EVK board the support of the
Arm Mali G52 MC1 GPU integrated in the MT8365 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 3de04ae70cc5fcd203a9cb745dfb3575ace66801..92ecde96dfeb4bdbc85a8fd869b405ef6cc1cdc0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -284,6 +284,11 @@ eth_phy: ethernet-phy@0 {
 	};
 };
 
+&gpu {
+	mali-supply = <&mt6357_vcore_reg>;
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <100000>;
 	pinctrl-0 = <&i2c0_pins>;
@@ -354,6 +359,10 @@ touchscreen@5d {
 	};
 };
 
+&mfg {
+	domain-supply = <&mt6357_vsram_others_reg>;
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;

-- 
2.51.0

