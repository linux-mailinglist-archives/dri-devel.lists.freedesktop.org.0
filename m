Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F03BA0317
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379F710E968;
	Thu, 25 Sep 2025 15:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FgoQLfqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D75510E967
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:34 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5818de29d15so1401118e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813453; x=1759418253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3BqohOGg+vh6fUFPn6hdSt72tlOBF+v0LkjnbZ1rhI=;
 b=FgoQLfqxLgZp+ccpxOyKr8LnoVALQQdfMB6uVqBSGf8YPy9X5QdCVqwVxNP4AiyKaD
 1W7jDyry4Hw3M9hkW/E5ztXittZDH93Ew9ra7NutFms6MeEx5nT466kCi4LuyeR4L2FH
 Ik0/QRCugejDzv3TeiSROpZ+SEGF6p9TizxHqWC6l7i0FLnaNgEM+UjbgUG2pO8Wne+w
 dhxuyXmUsKf4pVWC+vk3p9GjBcIhgd3QFZD28E5M085+6VnmS/UyyO8lF4Bpr9wk0wsU
 Qk/FyyO7EFnkyDd/EonXr9Ko4UbKOpNFMUhyPCS1MUT/wo+USZ7POVkd55yLxzlbTtd8
 86IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813453; x=1759418253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3BqohOGg+vh6fUFPn6hdSt72tlOBF+v0LkjnbZ1rhI=;
 b=COU8Bt+X1VS2zr2FahRExscbEYAl6ptWb5aTnjE1YOykEpY0LwoNh8OR0HbNoPD5fR
 e7l5v5uRIZostU3OHDk7PD11oaaD3cuP8axjaLjSZ9+/XqfdLxVE3VvsOp6aw1LVmHfK
 C0O4N56NkIPS/l1J15lswwBC+gvVeE0E5uKP6gBE4IyyhewpmfCn6Nk4vD9w8vVCNFgI
 zqB7mZIRF1gaODfy/AXKGSIL7s71UL/shFESKlnh2sztioPHWPUGECvef5wB2C+/usGm
 vPh+MkFHeOgpxLpIbT2DwZRhpH4kruYDsS8WWovXe2yZTnT3dT83nf4qSqPmPSWvjnGi
 kCkw==
X-Gm-Message-State: AOJu0YwtYbOT8gpv/Ktph3WGl182FFcbHd63TSfLCXeDD+Heyt03RZV/
 Iq0nx5DWbdAvyOK10/gaAYQu4bq2rXqGVDI9fgVS/Bvc6Oz6Niuv1Qk1
X-Gm-Gg: ASbGncvcG5cGQMqDTjRj3RhUFMjrImcjONh9rcFlW09TelCwX8uS/WUMDMGGn/NpD3p
 g3NJZPayj1k8WtJhCJuRT/qf91nkS0J3hbq8RIl9aN9goUuwXR6wwndnV2l1kCFrcIfdG3Dr484
 xnAOl3pPxMEEV/N2FZDxV8I6jNNU6RCbJ2HWlPPhjoQtcY6juaiFb0OVNJggQoqtZ5BOZnt9RMx
 WFMJey6FtgfaHA25J1GRnMvFkOZYQd6fsaTN01PRNCJtxewBX2I2CrCGMd4qM5vO70iYV/djxNI
 8Q6FF+9mqVnq+QZtk9t8FCbg4HDnkuwu818BHNkE3RZsWFcb2rtwCok9h+1x8diYpgRG/M81j0k
 3cIVsQ4cxObFHxA==
X-Google-Smtp-Source: AGHT+IGK++i2dbsoBub16rSwg8Y61Fa1WoKo+NmQGOT7b2HQy8IsigN1Ldy/HuzqUEX4JSs3hgUwJw==
X-Received: by 2002:a05:6512:6188:b0:55f:49ab:884a with SMTP id
 2adb3069b0e04-582d12fde4dmr1009677e87.21.1758813452520; 
 Thu, 25 Sep 2025 08:17:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 12/22] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Thu, 25 Sep 2025 18:16:38 +0300
Message-ID: <20250925151648.79510-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

avdd-dsi-csi-supply belongs in CSI node, not VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 584461f3a619..4a64fe510f03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -20,10 +20,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_dsi_csi>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef..f1d2606d9808 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -64,10 +64,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_sys_1v2>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_sys_1v2>;
 			};
 		};
 
-- 
2.48.1

