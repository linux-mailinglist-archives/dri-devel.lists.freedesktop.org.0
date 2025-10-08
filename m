Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA7BC394A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A5910E769;
	Wed,  8 Oct 2025 07:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j8p2yP6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172FF10E76E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:39 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-57f1b88354eso7113074e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908697; x=1760513497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
 b=j8p2yP6zEuzKkKUUku7nWj3jF55EvY/7mlSYrg44AZMuC37ntiuazwNvn0Q5VBGgGJ
 3tOd62RzqVuaJAWsiXCX9kme7oSF7df+AEDqOfDAsAYmWImyRauuOZGHbZb/i8DZoHhr
 y2fuu4fZL2xYX0XvHaxm7p1bBVunk/1Vs8CTZYmpqFSwfgKQyEvwDl4j/fdy69SsAyfh
 icJIlK4LyO7EnaQ0j1xciRWT9/cwA2VSXZCQJD8pXxmOBhngAEb/QzgBIf41Fctso8Bf
 keAnTJYjQr5ZyQosFaHDRUAhSF+crvHxz7SoXqic02okCSpLGZS2DELSXr55G2p8+n3p
 65Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908697; x=1760513497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
 b=XHSzPIFSgNDkZMl0ETEJG2tzODCXzjh3hCQHTnHttiQY9qta3eDkqJIYozwfacZDb4
 AEVy0tQO26jL8S2oEZ1Nu5ohHgFDLTybtgpiG+DP6hulzvOZPl6W1KA0/TP1cFXEUXsn
 7M7z/1n7QBf5/AI0x4kloFEnwi05KMLnSp8fuZzOu5nPVUA3zU0XNfhSzt5hQWpeXCwf
 4fOyn8nnAuGq3wLVyi4dtXzU2UFzRgPgCHQUcuwfRa+2t0ipu0hQxlMi3i9Gt4Zixpl6
 8s00gi+dD9bXeOdxSCPzuxJ7c2mlOpT+PdOa70yLPe4m6xnwK1DkBXToNzhi666+seBL
 QYpA==
X-Gm-Message-State: AOJu0YxnzIl0Y/pV+sdkanS6SLRxdNzmKUx6W9bDMIZSa2/xPqKlPZ79
 nKpaXVXRGSthpEAgx1TZS5ZoxY/W4hgULdoDELkiAxtOZrxKIZAvzRr6
X-Gm-Gg: ASbGnctG4MMpOPNAKUMA6ISLdFGchSoj9juh5CEIlYuGwGFJJ2MwD/LE0rZZRf6Dr57
 /LLThiIZXVSVHMetq/Qzl7TESiKqcFMTtud2ELMAaZviFdWjrAW8JpAwuGfhogCZaa2bLZSa92z
 EZhWhkQrjbQZAa0WWhzi6dkP5P0AeesXajTzFLdRNo9rlbt4TvBpNFOsIHzhk0pX+VUVnQgu760
 +GNExRZkHdU94ubw4xmiw2qdNRExvcM1BH8wtt9tfzC8MXTsNk6COuiz3CwO05LGtYZSGxtg7r9
 +63AwEnhBdBVgxN6QzJRBW7+2UBE0kWp23WOtw/ckAtzSTHMgXLyYBQIa3C3oGMRnvljyCzNsfQ
 TQxY51hkUipoyiSJoKykON4ysln7nYJrMOz0WSg==
X-Google-Smtp-Source: AGHT+IEjBzSywNMkFOAbwPQ/jDGY7x/5cVSXXn3BDGuPeQ0omEve1y2ZqSoYQ22QYGSRP1UJUPETlA==
X-Received: by 2002:a05:6512:230c:b0:58b:5f:d97 with SMTP id
 2adb3069b0e04-5906d896c1dmr693727e87.2.1759908697218; 
 Wed, 08 Oct 2025 00:31:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v4 14/24] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed,  8 Oct 2025 10:30:36 +0300
Message-ID: <20251008073046.23231-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

