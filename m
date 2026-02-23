Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBwCFmVinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC910183C87
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46F10E505;
	Tue, 24 Feb 2026 08:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jPqI0beQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58A410E46B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:24:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43622089851so4418848f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771856657; x=1772461457; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
 b=jPqI0beQGd5gyC4epq5HzI6eIOQCB/oX7Id9CZFDmhyRRO1048W3cy4fk+SQBpLbCE
 7JqhFT10ENrdVaYRe5lk8CH0hlQPoHmsTd+qtsTABqWkSByzRV+d0WRgZQo5PXaitQrR
 +YzMEGX2CfjE7/vHnMAAoL5HyIZaJLo/IHQAp0bPipD/MuWdwizvjeB0px+7WeJ5O31g
 opVu+SAkNM1Hu2+/Pn01iqKIPcNkKzhpSvfM4jVpSr5r+LreZbCz0KrjwfqLNieYnrRj
 D8fzftBFipCJGRhwD69xsowGDNpHXwvmIi1aSvJKMPPxsp40IyFFFLpbT7Ok6kdXg2ZN
 iJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771856657; x=1772461457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
 b=QGH5/jdElunPSDI25DWuoC1/gsHcR/4pW3/h/P9DuzLWrVB9FPYjqjrQP+tK/H+wVG
 Z5oD4WHqc4RD0R8iXFfgoxVHxSJqU1YqRJ1mWcw4PMGBLghXLdm5RtBAA4U0WOSLT6mQ
 fao9/kgLwVQ/UYurixsAlWQPCpMEwU1EpRVOuqB1s7cwFBMzR7gymGByMLJ+rKLEYjjJ
 7B3V9MRCEK+vCFM46WvQn3GYn+KgBwY+NbNjG5FDQvFxYa6vvbhyXcUF7r3s2HZsCbdL
 C+DRApb59nUURDLAeol8PhpSRX4WktEfsaZQBM/5pycBvystKTKEU597ucXahTjNvLbS
 ZwtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXokAL53RPgkRnQ/R27GFC+DyF2ifVQrSOM8qp86g0xDsZwyJsdjFMndpta6PFWEueQ7bq0AJvhEXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykc9bSxcmcSfA/4FDPBIyP18CWY/SI49GaC32hzyHrS2eYaMeH
 noOZd9h2YGKlsDcJ6bwnY38lnP5s6Y/HnrX5xmVTDKOhAVnEZ7ZdlX6H
X-Gm-Gg: ATEYQzwdojtdNcornY17AC1bWUwtoZ5db1apRZOtl8g4K+hm2juhKhfg+bR0hZAvH77
 U87XcEKpEHqNpvDFPYtTPRp6mh+yZWjbjt6fzjCi3Mh6GhmZkrpAf3PlZJlmFAj3eHQTx0kWVe3
 j1ngbQG4KwTMXTH7W/TCibolo5QAH5jobmKhlItHwv8kR7ZqXEBqgEDgZ2abXUWSVKX/4Q4nIiy
 LO6w6C77WpjtDKkjLHudSseDPRTb4iJ2gBC8uyHGxTiyyIeePOa1ibzBnLR14NUXWOdDFi3vogF
 CP/kNhXTpb/IQiVVJHVpms5bsWpZRhV03rEbQORzaISIIF5Hi8zgRyajks6YncZW5IBxlKfMgu2
 DaADx4qEC4bMW3dlhIeFmdx59bxlo/YRmW1v9JTzSJF7IzKEgUuwUQd1RxDLUzrMmpJhxJCsqz/
 x09xKWYOp91iqyMMPH57EOwypu2nYAegfEFGO+0t4rqLNB8xT5PgnGtjLCcFwqyg0=
X-Received: by 2002:a5d:588a:0:b0:432:dfea:1fa8 with SMTP id
 ffacd0b85a97d-4396f182684mr16248759f8f.45.1771856657191; 
 Mon, 23 Feb 2026 06:24:17 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il.
 [46.116.183.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bfa1bdsm18713233f8f.3.2026.02.23.06.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 06:24:16 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 16:24:04 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
In-Reply-To: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771856648; l=3240;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=CzJleqofENKnSdtHil5FSilRw3jXdV+MFbWEBQ/PF4k=;
 b=zUj0Qz+K/lwWYCkXuLWVaoqbWju0xnDdWN3TE6aNBKe+76amnI84XGVL73nBJ3j1iBB+P4Sgd
 NA0bUalaWdQDkR+kWvfXdu3ZX8Tr3YAU8o0GpOJfBlfU+IuPMCD47d3
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedaya.ka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:yedayaka@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: CC910183C87
X-Rspamd-Action: no action

Enable the MDSS nodes and add supplies and bindings for the Samsung
S6E8FCO panel.

The ldo and iovcc pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..10fd01143a644004b807fc455d2235f8e6a9737a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,32 @@ key-volume-up {
 		};
 	};
 
+	panel_ldo_supply: panel-ldo-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_ldo_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_ldo_en>;
+		pinctrl-names = "default";
+	};
+
+	panel_iovcc_supply: panel-iovcc-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_iovcc_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_iovcc_en>;
+		pinctrl-names = "default";
+	};
+
 	thermal-zones {
 		rf-pa0-thermal {
 			thermal-sensors = <&pm6125_adc_tm 0>;
@@ -128,6 +154,46 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l18a>;
+
+	pinctrl-0 = <&mdss_default>;
+	pinctrl-1 = <&mdss_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8fco";
+		reg = <0>;
+
+		vddio-supply = <&vreg_l9a>;
+		ldo-supply = <&panel_ldo_supply>;
+		iovcc-supply = <&panel_iovcc_supply>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
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
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm6125_adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
@@ -387,6 +453,34 @@ &sdhc_2 {
 
 &tlmm {
 	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	panel_ldo_en: panel-ldo-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdss_default: mdss-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdss_sleep: mdss-sleep-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_iovcc_en: panel-iovcc-default-state {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.53.0

