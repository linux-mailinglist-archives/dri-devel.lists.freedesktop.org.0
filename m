Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC066DF384
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22F510E786;
	Wed, 12 Apr 2023 11:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F85510E794
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:28:24 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B916660324D;
 Wed, 12 Apr 2023 12:28:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298903;
 bh=FrZ0bhYSUc3f/6EFDPkgRvN3ofxA9mQ25dTr2lufmAQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H8J6WREJiSELQuQdZAUz06U2x3wIhPE+Q73DAEJDcHAcSc9VSJDn3cW93Gr96UhOP
 cDi5DV6unFsMDzilzcl3hZLFPCTwx3Pukl2mFwU71JHaBzJ2yyXe3Z7KA+s/JC7jho
 y4DZuZ/BblFZ2xonu/ZK+OUKSyeyZPQdRQHXyq87SORhUaosLkUSNPmhb/gnmvwnY/
 2di2KwWct0SxcrpIrPd9Bc6FCCLRBHerlNBBM84qKxMEIk+ZlJJhWcrxJJqhEtNGl+
 1tiwyeWlhwQkAdiHk8G+xC5NTgFQd86wKoDDajqup5ztiKjP/29yuHs9/1tB6gIyp3
 3SJCSlOfuWxBg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 27/27] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch
 BMM050 Magnetometer
Date: Wed, 12 Apr 2023 13:27:39 +0200
Message-Id: <20230412112739.160376-28-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, kishon@kernel.org,
 phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This smartphone features a Bosch BMM050 Magnetometer on I2C3: enable
it with the BMM150 binding, as that driver supports BMM050 as well.
For this sensor, there is no interrupt pin;
readings were validated in sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 0b0519f6b2f1..b5746e6d0b15 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -75,6 +75,11 @@ accelerometer@10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&accel_pins>;
 	};
+
+	magnetometer@12 {
+		compatible = "bosch,bmm150";
+		reg = <0x12>;
+	};
 };
 
 &i2c2 {
-- 
2.40.0

