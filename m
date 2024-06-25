Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE59916AFB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0740F10E69B;
	Tue, 25 Jun 2024 14:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lujlk8Zp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FBD10E69B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:50:35 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso6919366a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327034; x=1719931834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNAdTcacMLHiwcp3rwtVy5TsM3diOedzVRX0xlC3b4s=;
 b=lujlk8Zpk7ufSM+/tGTQa2+qiOeMgSES+oM6dF3Tr5mjsV6n2U2ThMitPXmhrBfzQY
 MNeYrO/PEqF7z3fsSteh09fYnOkdWQZTrJ9OEKL3WVy2iso9jhR6homVjT6uUrw8hD9O
 F/jRYBH8dC/HEnS+32vZEMxkRmqU4X7LsKDthLRhXhz3ryFlmIs0vE6aW3zTAlRpklbl
 ThkI/JhZJLwr5YNarEyVbGAMraAwvDJ5qv6PmizwdKbVSalRypzZFnpI7hxcEsNySbW0
 rovVMo++EDkHYy8PsI49jlPwD6XTLsv3eUin+x+Q5R5drGUD3WRzWKTpVuVl9ozsSWJR
 ofsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327034; x=1719931834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XNAdTcacMLHiwcp3rwtVy5TsM3diOedzVRX0xlC3b4s=;
 b=S8xtMR0P43mDDKi4jFCiPYcVepXPOLL1z8YYqIBHnkH5gLTC0U8lKRMjfiSbiKC9k7
 9YA3tndvtDhcQOIRNwJBbEFoRT3qKaiM5mmf/rmyhtjWawF6igPKauMCsoaGBO/z6imy
 PfEKIUjcsdef1HqGjSqAHgpwa+TY06vHZTwXfmgYyPmzN7ZTuP2TkNwFJjCxdP/XQXzR
 eRv63vlIiLz/a0Sh7sNPuf08vcpwyomLT8kQvnfuAPMRw6jbwlxx2pvnreaOBq6QxscP
 6mI9RLrZ+K8s8DafKLS5/caoKOiS8lLWxFLM60SurDbwXOPuMaLjRZ/slFnbFQktwK+i
 zKzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPikabuGW3qFjvm0YzHH5+G5gXhawLsL1N2voCq4+pYnr7jnyDwSBNBhsm8ibV1dhxMC8czroPjBp0w6r8utWYP05AOOb/73VT0Y+iUPbf
X-Gm-Message-State: AOJu0YzjDxx25GvMv3wXtKe10dBQlfLxLoYJ/bj29eAK8C4nCrpL9W9H
 wG7+FHQdQqnu6oS27E4yCVSSeC/4WZQVeQEzbmyS8o4d5EA4rUewB0yYLWixrr8=
X-Google-Smtp-Source: AGHT+IEAx+7PNBsfh1PecChpyxyxGCwBCHXZraE/xlVLiq1yJ87mv2cTQeKVv1iemDFLo464qB8MVw==
X-Received: by 2002:a17:907:a649:b0:a72:8135:2d4f with SMTP id
 a640c23a62f3a-a7281352e3cmr12762066b.48.1719327034140; 
 Tue, 25 Jun 2024 07:50:34 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a724162f037sm355945066b.194.2024.06.25.07.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:50:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] arm64: dts: amlogic: add power domain to hdmitx
Date: Tue, 25 Jun 2024 16:50:15 +0200
Message-ID: <20240625145017.1003346-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

HDMI Tx needs HDMI Tx memory power domain turned on. This power domain is
handled under the VPU power domain.

The HDMI Tx currently works because it is enabling the PD by directly
poking the power controller register. It is should not do that but properly
use the power domain controller.

Fix this by adding the power domain to HDMI Tx.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi  | 4 ++++
 4 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index e732df3f3114..664912d1beaa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -363,6 +363,10 @@ &ethmac {
 	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
 };
 
+&hdmi_tx {
+	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
+};
+
 &vpu {
 	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 12ef6e81c8bd..d8a386c31914 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -315,6 +315,7 @@ &hdmi_tx {
 		 <&clkc CLKID_CLK81>,
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
+	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 };
 
 &sysctrl {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 17bcfa4702e1..82386feb5177 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -327,6 +327,7 @@ &hdmi_tx {
 		 <&clkc CLKID_CLK81>,
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
+	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 };
 
 &sysctrl {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index cd0046c0fe72..c76dcb0158a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -514,6 +514,10 @@ &gpio_intc {
 		     "amlogic,meson-gpio-intc";
 };
 
+&hdmi_tx {
+	power-domains = <&pwrc PWRC_SM1_VPU_ID>;
+};
+
 &pcie {
 	power-domains = <&pwrc PWRC_SM1_PCIE_ID>;
 };
-- 
2.43.0

