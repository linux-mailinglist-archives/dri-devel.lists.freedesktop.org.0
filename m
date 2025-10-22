Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C65FBFC767
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F17A10E7CC;
	Wed, 22 Oct 2025 14:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LWEEdifr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6468410E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso3889017f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142907; x=1761747707; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
 b=LWEEdifr50WMT+AcW7Otll1firWhUbLSz7j5OXIpSB2XvjKeMyFSqPeBwqqMXqN8yc
 SEeMVJVuW7yMozwxM20dxG6MPGUC/WzTQ/+SdQWA4s37JJ8JUJS10V4bb1KpFxwjiAeu
 bCV0FUsh0su5Of3BJ5XQCq8bfZB6vJvGzFN7h7c//aiPLVEiaSBteMrUqRai1Yw/GtC0
 jYoFUfYJRwld5KdWqAd1FUU1R7F8RAwtF01gSS04MXdl5DgvYNSacTolTNTY22Y9mxx6
 Frwo/M5hhB8jTg+mdNwU9QLZJhbIgA5yaRpLKSavo4ceSspU3hMH+SDZRp/gBiOQSHUC
 3bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142907; x=1761747707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
 b=qMiYC6pozVgFP5kbMxmFIOGeqnzoF9GNbY9mU7H+qrUojetWbc4PJfYPA7wmtNNSTx
 rFWKuLAl/5bjA8uPGCQuzN02ZLHdrUC5NzEBHttRjYBVqHX4mU5T9L8M7fTLKyYyjgUK
 RrBxQS1y3xK5MPPsJZ8OOa3cVpc8VGA+X30fp+pVbnPtzVhuw7iwslc8aQGdESUgOsFF
 fbI7d1jQCA+5GhduqEs8fz/gsCFWFTyf7iUwJJaf6LV7R4EDSA7RrdlH0F32DClR9xQV
 DdAFFpNf9oMA1tGaW5ORMoKvD/AxjfOyNY4iu6blGapxtPQap3GKWUQOimPHtWdU71M7
 bUAQ==
X-Gm-Message-State: AOJu0Yy4BO7xfyKGejgsMQTHY7N7P5NaM/eYo/m+fasvVe7s0+LlI2bA
 sGteINfZBNPaTiMpaQghrMvTItdCEvYm2Il9DE/K01phk/yLmdcjZvN/
X-Gm-Gg: ASbGncut8BtlDjH5fyhHmvk/dyuAWsKXADy63nPJ1XT63tNEuwR8fgl9Rd6OK2SyPcR
 HgqD9jhbsb0aL71pC2bGL7dXQqTd0PfSIi4fYHRlNjZ5k6aOYK+YuKrXW9xRA/0sRYIjEfxV2oA
 7Ab9BjCrNyAGCn9vW4ZGKyHNWvGgbwQhrfJGtMvRSGVZymidM00B7SuNa0vs3oi5jTl86TMAFFG
 AVAS1nED1tW8uGTVp0/x7QmGlP5SdlChWCUIosrYfxQ62AFP8yiedWAtzuYN3/L2WQYSeqCpDYs
 gL8osYKnRo3xqehS6gaIAvGqkVlQsiRaQGzvIycjC6qJ7VHzGAVAIncj4r/I8O8ajOhWGOhYbpp
 jdX8hsX8Gd/39L4HIhMmZsXbs7sGKt0lDPgJGO2tan3OEnoLv5LZdrUOdDs7bNqnPIOc=
X-Google-Smtp-Source: AGHT+IFuKTY+6VlzlctM2Ho4Y6ooXPbr1OkVqVQk/ddAnkBtDFDjaUEYC7CuSZMpeeIzVLphs/KiOA==
X-Received: by 2002:a05:6000:1a8a:b0:428:3f7c:bcf8 with SMTP id
 ffacd0b85a97d-4283f7cbeefmr11118870f8f.29.1761142906649; 
 Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
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
 linux-staging@lists.linux.dev
Subject: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed, 22 Oct 2025 17:20:41 +0300
Message-ID: <20251022142051.70400-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

