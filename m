Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD682553C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 15:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860D410E628;
	Fri,  5 Jan 2024 14:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4391710E618
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 14:29:26 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55642663ac4so1874019a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704464964; x=1705069764; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LcIsCf9lD/knWhOV4w5QILuSqh1F/UU7FLo8OWJM7Io=;
 b=aMozO7B8Il3UXZYbUnD2FrYQVjX7dqYydYmetB88++aQ5BGFuzwZaADlKsgd+7rshm
 2EER0dMyJLaWOrP2J80lpUdR4czoIyK2S4z+874t9LxCxXkAeDJDGpuaiexvwusm7WeG
 Omof0A2M6McsXmcxvWE4Z1twNKxrPBpX15J7OOYgMxISrVPbXXnPQLMyaosScs/jOZhs
 1aFPEVA8SmzUC0FW088x40vNH2cCpkqFPK1PKLPj/hhmjWqpoue8w7pVlvqq0mgjAbLr
 p8P7geTjJy9cYGvOrz4ddpDa+YRcJCbIUOWVjV4XgqfwTfsBmMRi4ipGurfMEboUhGsv
 BLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704464964; x=1705069764;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LcIsCf9lD/knWhOV4w5QILuSqh1F/UU7FLo8OWJM7Io=;
 b=iFMUJGff44p8doH5UktUBXa5e5opHa4nj2OxEAn3SwioiCWkrIkFyZKqzqfm1jpEZQ
 92msEx60m+7BGQ1RlQBbxXaB9kxOtF6UVaO+QTbaUo85HdAQ2gXgPj++/IiE8lSmKgtE
 TKmpCe2oEiMvxb9goa6SUwneDvq5dp5Jv3J5B+YbS6hdoO2Uj1T0bXMZiJwVWn+cSI4+
 xvpQkEAuCs1l8uqPOaRWnq6jSkPd8Wvd1hHzozdWX+l0YlVbrmDAkdS8HJj/+jjpqdSq
 2Q+dpwmRUD0OWpvLx3QVb6pobCB/nobb1F4OUbhK8yUg16uKdeif2QFnxyXPvwKwoSVB
 rLKA==
X-Gm-Message-State: AOJu0Yw26cHnEaD2nkEGHfSd+bT1A6KYZqE+TMIuWOXRnisHAbppctsU
 NPfTtSvu8eQHuaKWe2F9573ILkyX6Mk68w==
X-Google-Smtp-Source: AGHT+IFG3RJXE6tYpwVAbEAn7QPS50WJ+2cJRim2jdSJpfqmulybpFQu+xxg4rk4FJSzZPs+mAwQag==
X-Received: by 2002:a17:906:6d3:b0:a28:be7f:3ef4 with SMTP id
 v19-20020a17090606d300b00a28be7f3ef4mr1170053ejb.24.1704464964761; 
 Fri, 05 Jan 2024 06:29:24 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a1709067d0700b00a26b057df46sm927006ejo.126.2024.01.05.06.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 06:29:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Jan 2024 15:29:14 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable display
 and GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
In-Reply-To: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the description for the display panel found on this phone and remove
the simple-framebuffer that was in place until now. Unfortunately the
LCDB module on PM6150L isn't yet supported upstream so we need to use a
dummy regulator-fixed in the meantime.

And with this done we can also enable the GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 62 +++++++++++++++++++----
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index ade619805519..8eb376f2db46 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -45,15 +45,6 @@ chosen {
 		ranges;
 
 		stdout-path = "serial0:115200n8";
-
-		framebuffer0: framebuffer@a000000 {
-			compatible = "simple-framebuffer";
-			reg = <0 0xa0000000 0 (2340 * 1080 * 4)>;
-			width = <1080>;
-			height = <2340>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-keys {
@@ -68,6 +59,14 @@ key-volume-up {
 		};
 	};
 
+	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
+	lcdb_dummy: regulator-lcdb-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "lcdb_dummy";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+	};
+
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -365,6 +364,10 @@ &cdsp {
 	status = "okay";
 };
 
+&gmu {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -373,6 +376,10 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -404,6 +411,43 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l22a>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "fairphone,fp4-hx83112a-djn", "himax,hx83112a";
+		reg = <0>;
+
+		backlight = <&pm6150l_wled>;
+		reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+		vdd1-supply = <&vreg_l1e>;
+		vsn-supply = <&lcdb_dummy>;
+		vsp-supply = <&lcdb_dummy>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l18a>;
+	status = "okay";
+};
+
 &mpss {
 	firmware-name = "qcom/sm7225/fairphone4/modem.mdt";
 	status = "okay";

-- 
2.43.0

