Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02EC3D30DA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 02:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7FA6F887;
	Fri, 23 Jul 2021 00:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68FE6F884
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:22:20 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id my10so8409749pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbDiUWXywQuHvWbK5KgToA8hljAFXRAZ8RdP96k0ztI=;
 b=g+MMetn7ZgIZd9+ufiUGW8oAfNXo8QWuBLD1d0E7atOYLNbDLR2P/EyOZJg+zTuGzt
 ixFiHfFjiqbspkrMlWwGpnjph8L5idjm6M+seAPG76+1GWbz5PlywdoeySLA8X6W7gLm
 894t4F/EflgYTP7emt9lS3L4bauCmLnd29vTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbDiUWXywQuHvWbK5KgToA8hljAFXRAZ8RdP96k0ztI=;
 b=K7/7Vf+dlZ0d1V9sF4l5Yl7K5SX/xJJJ0O7Laa8D0yKWdaanxXF245fNatYZalZLGX
 tcClX/U+s8mn+7mkKKpjoJb80vlWFp4Tfvj3fxK2s9WTRxezGcw7r4xv9rxVt30KsCpH
 Ed8phe3A4/nS4FEdRwD74i+FNdUMvyj6eJP84CLZ0fqtzC8iL2txFNc1DE/3ckgxcrDf
 9tRI5DkOoYseLKyS4rNXDWWKvVUzvK/YvqmSBjLTxPpTiA1aYaSoOaAuDB1gH+TPMI90
 vwbdWN+ebU91dQ3P9Ws+iTdNbkrKNSUC3rVX1ijZ5Mluy5MUbCjf8BtUSDLOVgP9wgjA
 Pm8w==
X-Gm-Message-State: AOAM533ULNUgDp8vMIDjMlV6DKKc1yNNMXmmtN35KwHeT1XYsMydkHDI
 7b0AFSdpLZjFB+7BkNVE30i1yQ==
X-Google-Smtp-Source: ABdhPJzzG/Dkx5U9t15FY1dr/BrlYj0ipVj0xo+4dULJS5i2lgAmf8BOEZlDWJChZ2JPF9c9NUKVWQ==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr11251465pjh.173.1626999740346; 
 Thu, 22 Jul 2021 17:22:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
 by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 17:22:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 8/8] arm64: dts: qcom: sc7180: trogdor devices can use
 probable eDP panels
Date: Thu, 22 Jul 2021 17:21:46 -0700
Message-Id: <20210722172104.RFC.8.I038959fe65a202bd513cebeeffc7309114b5ffde@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change enables probable eDP panels for all sc7180-trogdor
variants, leaving the existing panel as a fallback.

Though this won't make any immediate change, it paves the way for
supporting more second source panels on trogdor devices. It also
removes a "little white lie" which is that some trogdor devices
already had second sources for their panels but the panels were
compatible enough that they could simply use the same delays across
the board.

NOTE that all trogdor devices currently supported by mainline have HPD
hooked up properly and so there is no need for the hpd-absent-delay on
any of these. One of the trogdor devices does have a glitchy HPD upon
first power on, though, so we need "hpd-reliable-delay" on lazor.

This also removes the "innolux,n116bge" fallback from one of the
limozeen models. The limozeen board never had this panel but the
"innolux,n116bge" panel timings / delays worked OK and having this as
a fallback compatible string helped until the "innolux,n116bca-ea1"
panel was supported.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi            | 2 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts     | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi             | 3 ++-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi            | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 4c6e433c8226..b2ff87769a7b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -74,7 +74,7 @@ &i2c9 {
 };
 
 &panel {
-	compatible = "boe,nv110wtm-n61";
+	compatible = "edp-panel", "boe,nv110wtm-n61";
 };
 
 &pp3300_dx_edp {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
index 0456c7e05d00..56bff28cdd9e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
@@ -18,7 +18,7 @@ / {
 /delete-node/&ap_ts;
 
 &panel {
-	compatible = "innolux,n116bca-ea1", "innolux,n116bge";
+	compatible = "edp-panel", "innolux,n116bca-ea1";
 };
 
 &sdhc_2 {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
index e6ad6dae4e60..892f6ff8f155 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
@@ -34,7 +34,7 @@ ap_ts: touchscreen@10 {
 };
 
 &panel {
-	compatible = "auo,b116xa01";
+	compatible = "edp-panel", "auo,b116xa01";
 };
 
 &sdhc_2 {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 6b10b96173e8..f31a8f54c855 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -42,7 +42,8 @@ ap_ts: touchscreen@10 {
 };
 
 &panel {
-	compatible = "boe,nv133fhm-n62";
+	compatible = "edp-panel", "boe,nv133fhm-n62";
+	hpd-reliable-delay = <15>;
 };
 
 &trackpad {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index 622b5f1b88a2..bf0d2a8a195b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -108,7 +108,7 @@ ap_ts: touchscreen@10 {
 };
 
 &panel {
-	compatible = "kingdisplay,kd116n21-30nv-a010";
+	compatible = "edp-panel", "kingdisplay,kd116n21-30nv-a010";
 };
 
 &pen_insert {
-- 
2.32.0.432.gabb21c7263-goog

