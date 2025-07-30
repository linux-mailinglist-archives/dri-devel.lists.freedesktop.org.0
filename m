Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB354B16549
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 19:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E59210E37E;
	Wed, 30 Jul 2025 17:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f7GHXv1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3372210E372
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 17:17:34 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id C0203583DBE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 17:02:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17D92442A8;
 Wed, 30 Jul 2025 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1753894976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkEcz9Od8lumPLGSI2mDm7zd90f2J6ysx2IIFyeMJqI=;
 b=f7GHXv1lkyC5Z5PHrKkyeT6qbn/8ObZkq64MuI3kVq6v9CyV1NhYlJVFLHHtSITgx+Xlse
 pAtAm8R27EtjZxv5oceulWPucQ7w+ki+9KS88kW9zdAYQCbA/fG3I/oep1o+Ju4MGZQB9d
 moZqJVWvw5DbMycog67ggCgSpQbRgsjluKNYyiiihkDKZfIoiNTGLrlYYCOYtzqBZgewqf
 cZqN9Ehm9Kfo0FT5Sl5QlcnKZhli2bhXS7j9T2Q/ZcFyZNZ67LlTRZNVtbkYOJ2TpKBrcL
 /I+LSeg+q029Lk569x4SPkI2E6yoTWQPrKcoskHC8cfmDP30FJKcLQFaRxthDA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 30 Jul 2025 19:02:46 +0200
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-fix-edge-handling-v1-3-1bdfb3fe7922@bootlin.com>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
In-Reply-To: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: thomas.petazzoni@bootlin.com, Jyri Sarha <jsarha@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HLG5xT1A8odfzcfiuinlcthJrJAa5lkuCncAANUHOzY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoilA3fOPjwvG0cZmE1+t6tNyHTDM5v1j5X4MXI
 s7lieBu5JGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIpQNwAKCRAgrS7GWxAs
 4kN5D/4kRrkpCIavS2bJuKWAbgwtv9Mn70in9EJNplGfJRxKJK6SIYrOELlRzPDRiDfqJFWMxLw
 On3QBUHIUvAfhBBG19FOYinL8DTawFHeCUqgkSPD3KzvTUfzqA0uJLcrJoE9ifGPyK1YjXPrHx0
 KKmeiQHNrqBvA14SVQgXhrgnPCY82Gtm8A345ffpvnkDRH8f+qhiToeRd/xnLctCIT1ZC+yRNRk
 fAzce1tW3zki5RzgumyzJYdJKorbep1zGd8bKNwZxA7+LtNfQI3VzuHZ31FBqQsM8q6aeuco3Pp
 O24GeniP37W6GzFsOT3rz9Z0k+66zDU8MaLWEGCf8av7oG5Of1n1qtlLKm/NgLIERIRviM1ojjr
 xMzPZyRhLQz+Fy/pOUXxxFFGaLjZgP5NhTc0nuLEyNlm1Z4wUxAD4cUP5L2r9wOOzI1HufQRBtA
 9UNsTiiuv76Y2dVR+FCwIYFsobp8/Ax5cIdp3/nJTfYxaH2Y5o3mnv+oVWyAv9SsiKXZwotbSOJ
 QLayqbrCTaaZ4xTwnA1o06WnH1dOvF4qCWttQobHkL0BUpvuq+kkCyNAS6N6JTj1Gjc/cemHOJF
 lpkxhaz/gh4NAHmJKMBft7eTAkC2px5FdDnHjSZeNAfy2a4Ggppek3VkiUAs38bW06SHvO0BD4c
 FKK2cXZHMELwtQw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehjhihrihdrshgrrhhhrgesihhkihdrfhhipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheps
 hhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnmhesthhirdgtohhm
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

For am62 processors, we need to use the newly created clk-ctrl property to
properly handle data edge sampling configuration. Add them in the main
device tree.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---

Cc: stable@vger.kernel.org
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..d3131e6da8e70fde035d3c44716f939e8167795a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
 			assigned-clock-parents = <&k3_clks 157 18>;
 			#clock-cells = <0>;
 		};
+
+		dss_clk_ctrl: dss_clk_ctrl@8300 {
+			compatible = "ti,am625-dss-clk-ctrl", "syscon";
+			reg = <0x8300 0x4>;
+		};
 	};
 
 	dmss: bus@48000000 {
@@ -787,6 +792,7 @@ dss: dss@30200000 {
 			 <&k3_clks 186 2>;
 		clock-names = "fck", "vp1", "vp2";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,clk-ctrl = <&dss_clk_ctrl>;
 		status = "disabled";
 
 		dss_ports: ports {

-- 
2.50.1

