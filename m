Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E948F2BC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 00:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB9A10E329;
	Fri, 14 Jan 2022 23:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F0F10E2F2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 23:02:28 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id i17so4052044pfk.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 15:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2h9cZxYJ3emYpUIj++uO1rilt4TStZ87q6578VwqZA=;
 b=htS6cflFJn1ZL5Y0EPBeN6hbyK7QvRLQG6rL5+hf+Wyp/p/OwvwAl+Evj2ZQ1THw8U
 UC6WEz/EhH69UAKuS4Z7gffz1k2LATR0EJgozsv2LnARXXrqxKBBQ4ABYZcLLxPDoo6k
 9jAJ1rcvLoaJTprwBOkTnDB9oHf7Sk8iuKDJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2h9cZxYJ3emYpUIj++uO1rilt4TStZ87q6578VwqZA=;
 b=BWXhY8lMZL/4Pngzpv3uKLsIbluygrZ+ZZRd+p1gDsiI4TUdpCU6gmvynNt7BqdTKq
 PFe7bmTrik5udjP2WMoHJOLGTJ8Hiup6skMjMCpPCrG0qKLWmNFUymSzy61UofaH31wL
 f7XteinBJfLrHRtei5r+uy3LmceXgW/JX8KdRn+Xp292D9hiAh2DEeLPCuettwvfpkRP
 HzD1G2Hyu2frOtOqGR8Er9zK/hXJAaOqxGkIAaRIoidXcuUZeQuv4WsICfX4JjejHUus
 fj0EthCXtTg6C4E3cb2wneHapNGIWXkIpBAZRr3+v+DBKsZgNNG4yeB9mzD6J5Fjd3tK
 ffSQ==
X-Gm-Message-State: AOAM533dsNRUr0lM1fzrTSxc++PRnYk0zF7rI8txKXHQTVfn4pLtMBud
 TjPlqf/LwtuNOMJXrpwdfq6M1g==
X-Google-Smtp-Source: ABdhPJyUUCEgb915ys8+J2HAqJSVrMJLFjTcoRKHgsU+KV+w14oykK1ZzYgHLlzxpYzPiETOK+okYA==
X-Received: by 2002:a05:6a00:2408:b0:4c1:e1a1:770 with SMTP id
 z8-20020a056a00240800b004c1e1a10770mr10548879pfh.70.1642201348060; 
 Fri, 14 Jan 2022 15:02:28 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id h11sm6161656pjs.10.2022.01.14.15.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 15:02:27 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF
 output
Date: Fri, 14 Jan 2022 15:02:07 -0800
Message-Id: <20220114150129.v2.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114230209.4091727-1-briannorris@chromium.org>
References: <20220114230209.4091727-1-briannorris@chromium.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
switched the platform to SPDIF, but we didn't fix up the device tree.

Drop the pinctrl settings, because the 'spdif_bus' pins are either:
 * unused (on kevin, bob), so the settings is ~harmless
 * used by a different function (on scarlet), which causes probe
   failures (!!)

Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 - (Un)set pinctrl, because the default assumes we're routing out to
   external pins

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 45a5ae5d2027..162f08bca0d4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -286,7 +286,7 @@ max98357a: max98357a {
 
 	sound: sound {
 		compatible = "rockchip,rk3399-gru-sound";
-		rockchip,cpu = <&i2s0 &i2s2>;
+		rockchip,cpu = <&i2s0 &spdif>;
 	};
 };
 
@@ -437,10 +437,6 @@ &i2s0 {
 	status = "okay";
 };
 
-&i2s2 {
-	status = "okay";
-};
-
 &io_domains {
 	status = "okay";
 
@@ -537,6 +533,17 @@ &sdmmc {
 	vqmmc-supply = <&ppvar_sd_card_io>;
 };
 
+&spdif {
+	status = "okay";
+
+	/*
+	 * SPDIF is routed internally to DP; we either don't use these pins, or
+	 * mux them to something else.
+	 */
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+};
+
 &spi1 {
 	status = "okay";
 
-- 
2.34.1.703.g22d0c6ccf7-goog

