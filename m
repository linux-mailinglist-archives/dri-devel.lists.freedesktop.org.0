Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5297837D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8769A10ED32;
	Fri, 13 Sep 2024 15:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RVBbDWRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A6D10ED32
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so548191666b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240145; x=1726844945; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hxV+xEnMJ80gLhFAUliu5RFc0rPgxSLDZdSiAt5SbDY=;
 b=RVBbDWRayN4pZgs3SLLo5McOLkVrFUyUKJBRr8kkuJJBoTGrwcCVYYKmKTmGmj+uC5
 d1TOCO7/dpYQZrL6DDKh18CTOQLXGAYXP9mw7nE+uMatC66DVzvla1/qhwXLdkrZKv9a
 fTNJZL/4r5ar37eg2w02ZjDRmFYDSPMEwpvOsghuKZ0TO7/AYLYbpqMjK44E6LLu0vPv
 3wjoaVx+f5Rcp5TdpKN5+SihLs/7Y3CQlRLNB2oI2vlTr+IflM+SsxGF2jc2R5PvFyzB
 v2btDx4s0X1Tdpbsac9QHSwbeTmr6TSw0rHCeEi001nnw0boS8xbSj9caVR+IWjEE6Zv
 QdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240145; x=1726844945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxV+xEnMJ80gLhFAUliu5RFc0rPgxSLDZdSiAt5SbDY=;
 b=UxUQDxywcaGF25y/htmbEYcDLr77dn7TMqMiEc5+tS1b8e72ik+fVEcFc3r9BB7Llt
 p6zRBAArUDYHsKmslGPZ8phJbYICkQ8+RhsM4103v6IaQegRuXkKXDe31BHiDGyfOOrF
 HIa9ZuexuTl1lQCn2W/wToEnQ4QT57bxIil1afX2mfmygu3LeILoNTWXDuV+mdxNFePM
 Gq1EapGwRjODI9sOkt9tDksrxBhFFtwEl3IJYo1JOXaT1XXNOnarAlNn/i3/l3uRZFgB
 hcscRREgUNyjVIb3xI6xqIhK+xQoJjhAvYQr741Urld/x8TzBLI3MIFqsh4v2VruNQ7y
 HamQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQWReKPUsJrQnwIX6ZePz7WF2VCAzwx8PlGsWlMIl4vE55/HDthlZXUxADMhIkaLd7ebUHd99HlFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4RK65E6tASkyxsdEdGV5heK4eCFuveDLyicxqlHqht8zafWJu
 0e/EzizKI7IwlWzUPGYpm3l2wFXeAKu76Niv60CsyOSN9+59tlh1
X-Google-Smtp-Source: AGHT+IE9SU2tpS2E9sl9JrjbS5UqYQlYYcA71JF3FE/gLt/fekYWBC22Y8MK+YXR/Dgfn1wLaGW9/Q==
X-Received: by 2002:a17:907:7fa9:b0:a8d:2281:94d9 with SMTP id
 a640c23a62f3a-a8ffae028c7mr1249506666b.23.1726240145089; 
 Fri, 13 Sep 2024 08:09:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:03 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:02 +0300
Subject: [PATCH v4 19/27] arm64: dts: qcom: starqltechn: refactor node
 order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-19-2d2efd5c5877@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=898;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=LXgqSMJKPpptWHRjG5sGV+9Z8Lxj5jA8H20WF+m2cbs=;
 b=ccx9XcsXSNXZtx3lf9Znb3XeO7LO64xR3paL5EbWRnSV/g9CK+fRNlh33SCZEmc/R6lgJx+Yv
 xyj90eigHrvDNDCg5PpJ/w03ex0PS4D+JyOJ025QSdAmZbS3+VaT2iI
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

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index f3f2b25883d8..8a0d63bd594b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -382,8 +382,8 @@ &ufs_mem_phy {
 };
 
 &sdhc_2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdc2_clk_state &sdc2_cmd_state &sdc2_data_state &sd_card_det_n_state>;
+	pinctrl-names = "default";
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;

-- 
2.39.2

