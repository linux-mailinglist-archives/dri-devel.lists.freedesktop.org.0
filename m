Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7E0BD18A2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 07:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632D010E37B;
	Mon, 13 Oct 2025 05:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TCCU5pn5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F1D10E378
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:56:17 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6394938e0ecso6171861a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760334976; x=1760939776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=TCCU5pn5xhPzieLwU35LKSoDGDmOgJ9BPefuVOwZCDezCdpfS7jIm8ZO8jymGcpj9g
 oPweVN3/VooXNN/LS1aIpZUSwuWnQxwC1fk1GTsQnVxQaOcp5Orsl5BaoE1qmbeHh3aF
 jfQVOIy4UWKQkeYlMHgUuxVhooqBbFupIezOEWr0zQOMD2utQRHLTr8SqnIYOK4TZrNV
 rBzSoRNs/dodTXVi5sVmcWOR6GyvYRmbuQgwYKqs+34MxfZqpZ066+vb4L27YyfTu7X0
 r0lrkHUq2T8zpHASkXsDTD/JPUjfx2OPvgXMFpErmS0pb97Fo87DA3aOABYahxcspZ3j
 qDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760334976; x=1760939776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=S8frsGt6I2HMQWVU8xC6pobROfayMXKIii7L+YCJjsHrIGrdrC/8A37VBKQ8ldNKPv
 9/g4fgQkvBR+ugXnkLjyNoHKBcQmRK4FJ1ncZFB4ZJRExj2bR0Xele668jzsMJ+4ZUed
 QmMIauurZjPEsiG4m/tnCJ0tnwqcyvvhmvpTieIZqrWLxONev/gDGKlS9E1mqh0vBRMn
 LSNekJj+aJvk2U1pgbzrUv2SqICt6cqIglxx+9767QMTHlqhyuzdQ2nSo8Hm5ejSe2cj
 25Y1yRc2ouKtcer+A4MCwZct5VI4DerQ+5E3URDYLJ+CFsBGNbAvsYnyMbYCNB+EQ4sK
 w3TQ==
X-Gm-Message-State: AOJu0YzuQKWV5DNqDHk9nsZVacIXdhYbjFJ8gHw/3LFzJ3fLAO2pWvL7
 eNHL7XtsrdpAUHvtx1bcAqUNi1p3dFJjM6JPt93WG6MyiX0m66I1z1JY
X-Gm-Gg: ASbGncuyK2onznlYjJAPuQsXJgXjQGzKH33mkjfyAGZUpdcJKEO7CKUgo7C+nv38OpE
 0hHsMaTaF+daFMdpdaRG4BWPDc3otW4jhyYQhCV5xNiV9VIvUEg98Vabv4ndaWUPtV5b/bD9Qvh
 5Ylpt49kE/ektF3rw5rKFLLBlCMw9Vu7r/tGa9xQvhjgAir9XahfyMrjlbJl7kSi1OYSpYhDwTB
 l2tvvkNoxkk0rYZ05XAnP1gzafWcb5hXGyqsESQ+cbJM5ba9vwKL/Qccll3Sziber5+Y8tdw0U/
 V3ZtllF+ArtGKxPesqGJ29QAnspWxpF2xrzIEmgh+/cR++IFn39PvI3v+4LyURzd30JtX0ooviY
 C8XEkr3dER/lTZ1KPXwXvy13THCK5WldkthoYKulXh0U=
X-Google-Smtp-Source: AGHT+IFXa8F9X+NAFTriZ5+fmvjgs8tTGl0KStDHQpx5xiYIKYYvA73do/5d5TYquynvGTa1Mbv2pg==
X-Received: by 2002:a17:906:7313:b0:b40:8deb:9cbe with SMTP id
 a640c23a62f3a-b50aa793004mr2095378166b.2.1760334976145; 
 Sun, 12 Oct 2025 22:56:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 22:56:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/7] ARM: tn7: adjust panel node
Date: Mon, 13 Oct 2025 08:55:38 +0300
Message-ID: <20251013055543.43185-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013055543.43185-1-clamor95@gmail.com>
References: <20251013055543.43185-1-clamor95@gmail.com>
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

Adjust panel node in Tegra Note 7 according to the updated schema.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
index bfbdb345575a..75fbafb4a872 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
@@ -43,7 +43,9 @@ panel@0 {
 				compatible = "lg,ld070wx3-sl01";
 				reg = <0>;
 
-				power-supply = <&vdd_lcd>;
+				vdd-supply = <&avdd_lcd>;
+				vcc-supply = <&dvdd_lcd>;
+
 				backlight = <&backlight>;
 			};
 		};
@@ -101,11 +103,10 @@ smps45 {
 						regulator-boot-on;
 					};
 
-					smps6 {
+					avdd_lcd: smps6 {
 						regulator-name = "va-lcd-hv";
-						regulator-min-microvolt = <3000000>;
-						regulator-max-microvolt = <3000000>;
-						regulator-always-on;
+						regulator-min-microvolt = <3160000>;
+						regulator-max-microvolt = <3160000>;
 						regulator-boot-on;
 					};
 
@@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
 		regulator-boot-on;
 	};
 
-	vdd_lcd: regulator-lcd {
+	dvdd_lcd: regulator-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "VD_LCD_1V8";
 		regulator-min-microvolt = <1800000>;
-- 
2.48.1

