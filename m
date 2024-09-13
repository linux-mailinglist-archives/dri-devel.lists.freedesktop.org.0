Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D697837A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA8510ED2E;
	Fri, 13 Sep 2024 15:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rch2qx4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D1810ED2E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:01 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f760f7e25bso24329631fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240139; x=1726844939; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+MogS/GsWGussElbxSTITWgB14U3ovrKNCk5uQtTkgQ=;
 b=Rch2qx4wZXocnM5iKXI1uu3kxCaozG/nZGYqo5sipwvvbwdzmnwsfvZKE4TdQMVgwF
 yBqIMahzfxk2rYSTyv9zuSfw6YL6RCqQA5ZB04gTUUq0WQtsHS344zF4E782VVDSjITj
 rxSUd7hfyM7epGtdjSqzK5cRURN8jlphNX6M3qNxHHYCE/3Pygc23sM7EmPcg7UnkjE1
 c2e2W+vGMrXgGSHKc9TdlfvGMn2kogVu151Nue5VftR0JFzl8oQ7tz9VbfEonSKCH8et
 tRV0K0LOXTOSlangx0RKG9qoRqfFAOP+w+bAYOfg4v3xfBy3hTdPb51kxPg1iedbl/5X
 T77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240139; x=1726844939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MogS/GsWGussElbxSTITWgB14U3ovrKNCk5uQtTkgQ=;
 b=p32P1lghPUyohEFmyC/zAhLilpIpy6IoSns4Is5wLsrDGkjuxyOdAfoeIeUPhNnwFn
 7Ku8Syxcu6IEqwdG0G84qSdrO1AyO9Fvmf+R4hh2U0nMfwhShP60IpR/Bu/4DC8k4WJA
 FRYDix2nRpx9vMp5mrAY4fZkDQL0+31kwzeyBqWK8+f3aiZsItNgj0RDnQFElHy9ryRd
 1dAq4b6S/wMeBLKxsMqrYBRH/rbZFZ3EhBLcgYmunl70/ddV9JdidveiyED5C9jOQl6q
 snNVOQIMpdYe0L9/R2iZM6gvcHdxCsjGzGcGb3N1eTU5Ipqc+KAdXiATGnpf6BZXezFl
 Y+WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAA81P+v44AebRSNG1we8888xMzNHmeX6nxNaDkmdDeUHWSCWAXe4HOW8pk4L+eEKm+aQQjKe4jn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoXwegw69gbFQ0nYM2LkXCOq7fusEp9XcZI8ms8+SU7N9B43No
 7Pc0MHjnzFC1EZyk3eNeNJpSGXBTM89iNwL0yeB7/QTXhrYQtYdY
X-Google-Smtp-Source: AGHT+IG15UZQPWFKTrEWMJoYpOjTZRs1/pybTllYbPk3ZUCPtTA6NrMHeSupfUSZWg7LhFQUdQrI6A==
X-Received: by 2002:a2e:a9a6:0:b0:2f7:7f76:992b with SMTP id
 38308e7fff4ca-2f787f4484dmr38107941fa.37.1726240139396; 
 Fri, 13 Sep 2024 08:08:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:58 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:00 +0300
Subject: [PATCH v4 17/27] arm64: dts: qcom: starqltechn: remove wifi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-17-2d2efd5c5877@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=1053;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=Eph7e0S45r0MTRyCXF3ejlfGwAhuMntaPM1lDGhJahM=;
 b=vALQnYl3+w5MCg7sDPNqQFdT/NtoYAqeD+ucytbEKKHkbRr5ArqYw4dNgJg++Oy86E0lACe3V
 f9aB8bebsZhDs8mQDd098TOeyreaGhbxS6kdp6OHR7eJJBg8bLkG6CV
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

Starqltechn has broadcom chip for wifi, so sdm845 wifi part
can be disabled.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..6fc30fd1262b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,14 +418,6 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
-&wifi {
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 

-- 
2.39.2

