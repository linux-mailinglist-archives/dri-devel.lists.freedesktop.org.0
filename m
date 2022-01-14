Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010B48F0CE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 21:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3734210E1B5;
	Fri, 14 Jan 2022 20:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91F410E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:17:12 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id o1so2317264pjr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NHI4YdJkg3blWqPelJAYTO4ml6hVxIePrSWCG1B/xFA=;
 b=EEigY38b1fTu+aiEP3SmQ0r0AcAMPN99i8wrAOaTvKy4ytD/0GOOBLLlpl+WXnajij
 X3Nu9yfWhzPIYpKmaOpgO0vwkP1Y7RDErmL2kBD1EAZt9n3wXWYMtNw602JoVR5bLHN4
 vUF+EV32uGddQTHPmX5WBu3o20sB8//KqZoXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHI4YdJkg3blWqPelJAYTO4ml6hVxIePrSWCG1B/xFA=;
 b=mngWiyXXYB02Md65KlVLk3x6+fG9dHmO8CW4LIbWI1ZddPi1YMFPWTDS2Hik4roXr/
 sYbp0GeqbXh/OdqsYr0SRl4DffP80qkGQtGX6zQwfVw4p6a3H6MePw43D3+msvtgc3mH
 3u4RDowF3tP3IwW4IqzxXn/gxMKDQvzTFE5K0bF8n+B3Gd9ZonWx6MpOhYmlgrUgwso+
 QmSqDFkce2hRHPfo/HQxl0aQV/L3xOQMfl6gS1flJtHwBci9TuI0H+PvPkBN9MQ4GMKj
 M+8rIctB4ucCs91cTaOUrHMTCZJJu4EoxpPJwNJlvMpXAH09vAGuJiqEOEEW2eAvsq7R
 QAuw==
X-Gm-Message-State: AOAM530Op5tD3447SGc/TQuHYPtx8U38PZopcUIgjYDzBZW5kBlURwb8
 0hTMqCbdcGkUOAPJ9hBSsyh/xw==
X-Google-Smtp-Source: ABdhPJyANqLFSMw/ah46py8E9k5uIE2DiLUf4ryo5wQMT8muBxJU4jdXvlE8Hx0LhnJYKQTgOC1SiQ==
X-Received: by 2002:a17:90b:4a92:: with SMTP id
 lp18mr12273149pjb.123.1642191432492; 
 Fri, 14 Jan 2022 12:17:12 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id l13sm5300187pgq.34.2022.01.14.12.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 12:17:12 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
Date: Fri, 14 Jan 2022 12:16:50 -0800
Message-Id: <20220114121515.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114201652.3875838-1-briannorris@chromium.org>
References: <20220114201652.3875838-1-briannorris@chromium.org>
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

Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 45a5ae5d2027..21ec073f4d51 100644
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
 
@@ -537,6 +533,10 @@ &sdmmc {
 	vqmmc-supply = <&ppvar_sd_card_io>;
 };
 
+&spdif {
+	status = "okay";
+};
+
 &spi1 {
 	status = "okay";
 
-- 
2.34.1.703.g22d0c6ccf7-goog

