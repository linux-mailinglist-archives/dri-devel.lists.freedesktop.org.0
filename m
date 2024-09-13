Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED70697838B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664C210ED46;
	Fri, 13 Sep 2024 15:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kiU8oEBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BDB10ED3F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:33 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c413cf5de5so2845245a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240171; x=1726844971; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mXJIkSLw8SmFch9ZUCSaWYebLdfaycyre/4lwJqktRc=;
 b=kiU8oEBFJRjfBgaQI2BD4095AoTXBT21lM9VdtRzwIZ8SsySjn4VB0oHNRmGSkbLXu
 rvKdF/3rXo/ZYW4/gXtCurN/RUQ2pF+SSe92hxJX4hzrtaggZqMJRYC9sJd4YPwkRsJL
 wIBKWjY3IzWQGKxfbE1noepsqIDTIyYZpxGn/K8o0n7ZZjPEm5viAlG5869jXyiRb5ZU
 9GUKAuLizNEwuif+g/NuHBqEmxo1QwEKiP8p2UsEErZHNp+3DNgkmvv2WfbgDWuhiIn7
 ywY/wbehGoxFK8T5r3PCGWzQpKCJ+zb2/2lcfakTnHYgTdxeDTW3hiABTfnXbIuInKkI
 I7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240171; x=1726844971;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXJIkSLw8SmFch9ZUCSaWYebLdfaycyre/4lwJqktRc=;
 b=aMtQQ58xa7Ap7CHg8620aK8YRJ8+o3T4G4qpH86W+zWMnBgCUimby2ehp8kRV/3rkI
 U5Z4wgX4FIvRGZ1HvSt+hOerb+pQ4w80vElpgzhvh1USJD3fRUqRdtiOaVA0va7RAQQX
 7WDnVegdgrcyjOQrWLGzuFAPDY3MaGhodOVaczdch4kDQAA5M9lDjd74vG1TCZ1Nr9Jp
 vY1oyoxm1WhcuQBhGpvDDeCizyM/2BfAiJvrvXdIuVRrajElujFmvti8soKO7nPjhJWO
 Xf+6OjuXkL+qdu6RP2PWGhSZgTvruZzMxt6300XntvurTMm7ZU3RVMa4T6poJ12CfPZa
 h6kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuurvo46wERk0PaYZrQTOmk7sJqRyoKl8w+R3jL+aUSj0hhMLTDf3+T40NqfC1PvZcPzl7io8vbkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZSIMkaPTSZNkyMxVXF45DvrNfD0DL3Bm7kKVi0a/V3AfNN0ET
 nRIh1zh2wUQd4Ns9EZ/VLadfaf9+S2ZXqn18Z79H1BMn9ot+ryQs
X-Google-Smtp-Source: AGHT+IGyk1J+WrXxg3n6en6ZybXZ+SEJzAfSUZQA055wEMUefoWDRM5H6YgIPbZdZbXXjvmPnSljDQ==
X-Received: by 2002:a05:6402:35c1:b0:5c4:181a:6b0a with SMTP id
 4fb4d7f45d1cf-5c4181a6b7dmr4656181a12.10.1726240171482; 
 Fri, 13 Sep 2024 08:09:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:31 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:10 +0300
Subject: [PATCH v4 27/27] arm64: dts: qcom: starqltechn: add modem support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-27-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=2030;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=sotlZbQi5UxMTXTY9iQWeBGitc5Ct0BtuZ2yW6i8Nok=;
 b=2OY/1Wou8Los9DL2QaeQkDbKQavhO22dQvFX7va+9W+VFm6Zwxp1qTyqVIttAEcQn/XWN02FC
 mMW9IBedqIOB+8AWBDGbU1ksLCmuAtMW2nQ+hhGKetema4Hwj+gR7YU
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add support for modem and ipa(IP Accelerator).
Add spss reserved memory node.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 2710386a89e1..4614ec5f731f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -17,6 +17,8 @@
 #include "pm8998.dtsi"
 #include "sdm845-wcd9340.dtsi"
 
+/delete-node/ &rmtfs_mem;
+/delete-node/ &spss_mem;
 /delete-node/ &adsp_mem;
 /delete-node/ &slpi_mem;
 
@@ -91,15 +93,39 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 
+		/*
+		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
+		 * random crashes which are most likely modem related, more testing needed.
+		 */
+		removed_region: removed-region@88f00000 {
+			reg = <0 0x88f00000 0 0x1c00000>;
+			no-map;
+		};
+
 		slpi_mem: slpi@96700000 {
 			reg = <0 0x96700000 0 0xf00000>;
 			no-map;
 		};
 
+		spss_mem: spss@97700000 {
+			reg = <0 0x97700000 0 0x100000>;
+			no-map;
+		};
+
 		adsp_mem: memory@97800000 {
 			reg = <0 0x97800000 0 0x2000000>;
 			no-map;
 		};
+
+		rmtfs_mem: rmtfs-mem@fde00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xfde00000 0 0x202000>;
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
 	};
 
 	gpio_keys {
@@ -837,6 +863,19 @@ dai@5 {
 	};
 };
 
+&mss_pil {
+	firmware-name = "qcom/sdm845/starqltechn/mba.mbn",
+			"qcom/sdm845/starqltechn/modem.mbn";
+	status = "okay";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.39.2

