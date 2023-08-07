Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AC7727EE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8839710E29E;
	Mon,  7 Aug 2023 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B6510E296
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:35:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-991c786369cso625508966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691418932; x=1692023732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ha6FI2rVxbfPVkhF/ZknZxX9q1C2VljgFJVBNarUleo=;
 b=Z3LvtDp4zP8VkyIlt0D/cF+eA5Bl9AT+QeI/m/ZZteXaPqeHZFq0OkV1glWPgDsZTE
 mjtb3bmoqbygcexNngQqiuZVRC5yB4ROtd1tR2wSG/LTTu4fXIPoWRg3kbgm5iM51vpq
 YhE/MRsCR6K0SuxNjZFpL2drPflHGDKj5nSQlrZ3l/gMZhz67K2269tP9iyyDUucnXdw
 vLBepkg/M8xt9khLcbtZ3EUU3y+tQKmkEkZjF+KwyCsvEcf86WqQi2gxunTVoxubERHu
 SJU7ihM+Km2unWvvOvexi/JrkPk2sZYku4rVz7SFtef61GQrt5OBJknVQc99bcLSiJWe
 KEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691418932; x=1692023732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ha6FI2rVxbfPVkhF/ZknZxX9q1C2VljgFJVBNarUleo=;
 b=Us5elDMtAMqhxX7A9G4bSH0iihmQZH1pcCOo6rzzJnZLt6WjelPFF1EG6WGD5jcq0B
 Lir1ixfXjBBCm8Z/x+O6wJzSRES2pQbY7EBrYiS4kaS2Xn17xFtTbhFOCSjrE0Mzdsuq
 p3N/h7kN35Wsu73sVrzKByfgeF2h4qJp3myu25DQ2tGzzmw4rOOglk8fEzS8B+LXmYSX
 Nf+RbAIYs8MT5QaK6ExlHjX3Jhd8m0FP7UfVWB4qo3STSaN2Frkc2XElbnby05NwsIrn
 f+GEklTo43wgvtuTzOUMRNjNYfCMH6j+DXc6J3OHllGPLXwgm2OUNUYGZBwm9dwNSmdM
 4wIg==
X-Gm-Message-State: AOJu0Yzdqr0L0GJcmrc+n+Xsp611OO2E8qd225i9+Fxv/L9GXl+cun2L
 mbBSh+RxGyCwZ4FJYqQCaxw=
X-Google-Smtp-Source: AGHT+IGZtGya0s5IHu2LCfaHpasZEmG+74SNEfbKrRDRkKBBWkQxhuFnQequ3Lj0qk7pzQtKV3Up7Q==
X-Received: by 2002:a17:906:3295:b0:992:a85d:278b with SMTP id
 21-20020a170906329500b00992a85d278bmr7524417ejw.59.1691418932420; 
 Mon, 07 Aug 2023 07:35:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906504300b0099329b3ab67sm5323292ejk.71.2023.08.07.07.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:35:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 1/5] ARM: dts: tegra: Drop unit-address from parallel RGB
 output port
Date: Mon,  7 Aug 2023 17:35:11 +0300
Message-Id: <20230807143515.7882-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807143515.7882-1-clamor95@gmail.com>
References: <20230807143515.7882-1-clamor95@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Fix the following W=1 build warning:
"Warning (unit_address_vs_reg): /host1x@50000000/dc@54200000/rgb/port@0:
 node has a unit name, but no reg or ranges property"

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts  | 2 +-
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts         | 2 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi | 2 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
index 486fd244291e..a619ea83ed3b 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
@@ -65,7 +65,7 @@ dc@54200000 {
 			rgb {
 				status = "okay";
 
-				port@0 {
+				port {
 					lcd_output: endpoint {
 						remote-endpoint = <&lvds_encoder_input>;
 						bus-width = <18>;
diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index a3757b7daeda..e118809dc6d9 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -66,7 +66,7 @@ dc@54200000 {
 			rgb {
 				status = "okay";
 
-				port@0 {
+				port {
 					lcd_output: endpoint {
 						remote-endpoint = <&lvds_encoder_input>;
 						bus-width = <18>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi
index bae09d82594d..680edff0f26f 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi
@@ -10,7 +10,7 @@ lcd: dc@54200000 {
 			rgb {
 				status = "okay";
 
-				port@0 {
+				port {
 					dpi_output: endpoint {
 						remote-endpoint = <&bridge_input>;
 						bus-width = <24>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts
index efde7dad718a..9c480fde2e76 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts
@@ -15,7 +15,7 @@ lcd: dc@54200000 {
 			rgb {
 				status = "okay";
 
-				port@0 {
+				port {
 					dpi_output: endpoint {
 						remote-endpoint = <&bridge_input>;
 						bus-width = <24>;
-- 
2.39.2

