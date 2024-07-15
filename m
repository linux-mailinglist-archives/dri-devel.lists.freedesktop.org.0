Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A4D9313D8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5975710E36A;
	Mon, 15 Jul 2024 12:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kZO+TNso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DBF10E36F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:16:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4267300145eso32505835e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721045765; x=1721650565; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Vr1Igs6Grx1TdlXBKwpA/hLnY4uL3rKsZy+M8J+TL0=;
 b=kZO+TNsou/kQDrHT35JkfMVMZme8Ilsz4gK/gUetdX5fY/yNBM1n0Y18pSBE9bGWEN
 YkEProdlz0j4uXuobgOiF3YQZe5o7Rf6/fayRIoHFJaQEjUIEScUF1Jyl4egPno7XC5e
 3dtlD4jZzZMjGpDJnDJoMUZDu8PH8mPcIAxpxJ88Z8qNgBEvIxficuXr6A9XQjepQXH2
 FyqbrReVyt9dHwoidhxOWI+TdmRrrMMIsFdmiP8ivABF3Dy9eF+oGKryDf8rBgPDR5Mu
 49GUvxPQyUj6gdl9jK/gbdhUWWSRyZU7Nyw1wSWFmBJqMUo1Mj38kipRStVmer4IfUlV
 DU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721045765; x=1721650565;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Vr1Igs6Grx1TdlXBKwpA/hLnY4uL3rKsZy+M8J+TL0=;
 b=tBd+zS4YxAj/n1inGourEFoEmT3sJYMia6SLUdkot0kbkUFBcfTkJVPA7FY/DQJme0
 HrmXddEUDL36PHGUgkWouX/e/SFbENqVTgiVFZy1kOcwGPjHnjsvvPnpKaZ+2FBnq6UK
 yXOBLTRWB9tAaz2Y//jWMBBjefkA16VtVCd+U1rHaSbBz1+9CbVhK30NUWAY/eIP7Bkw
 Tm7NUMrIOk3DvjU3iKjyfFSZGy+z+5QAGV/DdoDT+tTbe+/oCpTB/6tyCA1XBNsHOWb8
 da71a/5ePTCjdX58mQGxoZaAnGIismrFQsLdZWDhygHjzsOQYag2FJu3evHW6dXBRCnN
 2Jjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgMTw4iTObq5NTGSIDxK6hYcOxiSTud2xMyxi3ojo0d429VVd8pXCM/gdmajcoa9LiSlfC0uiGNGRyuFt2o6Z27q0ubiWWFJ4oGQ7+avnp
X-Gm-Message-State: AOJu0Yw8yUdylWm8POYFHMXhHT8TmsNIo/n6xg+tw8bwMryoQT2DM5fm
 r6vZ37KXuKtxOgkuYhVJH+scHl+Bb9gpjNK4v/J0aCstL1YpXht5YXBYS1sVxWp0Shcgaw8q5zw
 K+PuxdBiY
X-Google-Smtp-Source: AGHT+IF1eIglBUYPcY54eeaj425QXF1pkXmSnnMaa3Z7nS7TIbwkFjDf7kr7CW/lZQwMQMB2loSrag==
X-Received: by 2002:a7b:c052:0:b0:426:5c81:2538 with SMTP id
 5b1f17b1804b1-426707cf827mr140078155e9.14.1721045765216; 
 Mon, 15 Jul 2024 05:16:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:886b:1a3a:7569:3d95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680d9771aasm6369201f8f.0.2024.07.15.05.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 05:16:04 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/4] drm/panel: atna33xc20: Fix the Samsung ATNA45AF01 panel
Date: Mon, 15 Jul 2024 14:15:36 +0200
Message-Id: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgSlWYC/4WNQQ6CMBBFr2K6tmZmSlBceQ/DosAUJhJqpoRgC
 He3cgGX7yX//c0kVuFk7qfNKC+SJE4Z6Hwy7eCnnq10mQ0BFXBFsCvyDRDAttrZxrevUfphtqW
 jUDWhciUHk8dv5SDrEX7WmQdJc9TP8bPgz/5NLmjBckMFOURPjh+jTF7jJWpv6n3fvzY3h9C9A
 AAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0
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

The backlight of the Samsung ATNA45AF01 panel used in the Qualcomm X1E80100
CRD does not work correctly with the current display panel configuration
and drivers: It works after boot, but once the display gets disabled it is
not possible to get it back on. It turns out that the ATNA45AF01 panel
needs exactly the same non-standard power sequence as implemented for
ATNA33XC20 in the panel-samsung-atna33xc20 driver.

Move the ATNA45AF01 panel from the generic panel-edp driver to the
panel-samsung-atna33xc20 driver and fix the panel configuration in the
x1e80100-crd device tree to make the panel work correctly.

The panel and DT changes can be picked up independently. Since v2 uses the
existing "samsung,atna33xc20" compatible as fallback, the DT changes work
even without the driver changes.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Use fallback compatible to avoid changes in driver (Doug)
- ... this allows applying the DT change as fix, so add Fixes: tag there
- Add review tags (except Krzysztof's, since the binding changed quite a bit)
- Link to v1: https://lore.kernel.org/r/20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org

---
Stephan Gerhold (4):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01
      Revert "drm/panel-edp: Add SDC ATNA45AF01"
      arm64: dts: qcom: x1e80100-crd: Fix backlight
      arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20

 .../bindings/display/panel/samsung,atna33xc20.yaml      |  8 +++++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts               | 17 +++++++++++++++--
 arch/arm64/configs/defconfig                            |  1 +
 drivers/gpu/drm/panel/panel-edp.c                       |  2 --
 4 files changed, 23 insertions(+), 5 deletions(-)
---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240710-x1e80100-crd-backlight-632f9bf936ef

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

