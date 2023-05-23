Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574D70E57C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209EC10E4AE;
	Tue, 23 May 2023 19:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CDD10E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:31 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ae3ed1b0d6so207415ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870290; x=1687462290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpsS8VkinDsLSpsgSW7KF2muDpJUwIny3CFZoqp4G90=;
 b=hWqq0Swswmd8lErnPiovBkcfxgY5fW5GYwu2zeT/+9HsYv9Eu/590YhsjkuNU9jXPj
 bnipsucMcvVDl6qyTBS/HmZh6aI87qQP4CRgijYcWWavqMcRbFDx/cCy1/wdYqJHTcoL
 sbjOQ0xEnE6uB5b/431ug5s/rTWOCZWGTZrvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870290; x=1687462290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpsS8VkinDsLSpsgSW7KF2muDpJUwIny3CFZoqp4G90=;
 b=YDL1dUlOiTKaJNNB8n1PAiVYZj1YQAibSeLx/pbWZQFkfWinbQyurBEn+dhWs5YWvp
 Ur9s0gdunQRI3YPapO20Ajwy1i/bGOVrsZINILewFlrdQagOMad8bX9azT/LVtFBBFi7
 JShF7/htxq1/flSAVa3kbixbyhNUega4uDLKNA5mq2HYpBKb1/v6cfBl500Xs5T/B53h
 91Wu263bicSbocergwlfC3MGkEjzkg3c+ha6sBt7l+Z7RmvS6HctO1aOs1hfgEcc/YdX
 yyu4Ae6HZKh1y4l04mlrdj45SJ2D/KjT8XwgE0V++udNEIhnyO125skE1RqzJQMuIh1m
 M+AA==
X-Gm-Message-State: AC+VfDwlOrCN33MOj/kdXpBfjArpbOakwQYHDPAB1H92YwRO7jk4dNOV
 VDS9+E8+bjuyQ6uUSZmYe6kQXhpwRxj/Hxe8u78=
X-Google-Smtp-Source: ACHHUZ4rktXX4DoIg0CPYD2PQ1xh+dmDzZ8tM/1YWsUwkTPU9OT6oPlM+OtWgc/sN0M65KgYmS5dHg==
X-Received: by 2002:a17:903:32c8:b0:1aa:e938:3ddf with SMTP id
 i8-20020a17090332c800b001aae9383ddfmr20632405plr.7.1684870290410; 
 Tue, 23 May 2023 12:31:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] arm64: dts: qcom: sc7180: Link trogdor touchscreens to
 the panels
Date: Tue, 23 May 2023 12:28:03 -0700
Message-ID: <20230523122802.9.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's provide the proper link from the touchscreen to the panel on
trogdor devices where the touchscreen support it. This allows the OS
to power sequence the touchscreen more properly.

For the most part, this is just expected to marginally improve power
consumption while the screen is off. However, in at least one trogdor
model (wormdingler) it's suspected that this will fix some behavorial
corner cases when the panel power cycles (like for a modeset) without
the touchscreen power cycling.

NOTE: some trogdor variants use touchscreens that don't (yet) support
linking the touchscreen and the panel. Those variants are left alone.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi        | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi      | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi         | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi        | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 8b8ea8af165d..b4f328d3e1f6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -104,6 +104,7 @@ ap_ts: touchscreen@5d {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 
 		vdd-supply = <&pp3300_ts>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index b3ba23a88a0b..88aeb415bd5b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -116,6 +116,7 @@ ap_ts: touchscreen@14 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 
 		vdd-supply = <&pp3300_touch>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 269007d73162..c65f18ea3e5c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -43,6 +43,7 @@ ap_ts: touchscreen@10 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <20>;
 		hid-descr-addr = <0x0001>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index 6c5287bd27d6..d2aafd1ea672 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -102,6 +102,7 @@ ap_ts: touchscreen@10 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <20>;
 		hid-descr-addr = <0x0001>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
index 8e7b42f843d4..0785873d1345 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -99,6 +99,7 @@ ap_ts: touchscreen@10 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <20>;
 		hid-descr-addr = <0x0001>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
index 262d6691abd9..f70f5b42c845 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
@@ -154,6 +154,7 @@ ap_ts: touchscreen@1 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <70>;
 		hid-descr-addr = <0x0001>;
 
-- 
2.40.1.698.g37aff9b760-goog

