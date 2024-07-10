Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F392D708
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A1B10E838;
	Wed, 10 Jul 2024 17:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I3dvbHa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA8210E838
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:05:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso67645e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720631115; x=1721235915; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UO6/lK5/7C6XDmsvIs3cVH295usofusy4WKu+UT3LKI=;
 b=I3dvbHa5AZsoRURRPNO27C/4Z46cyvMAnWZiD+gP+YxBOIO5qzfiZtUrapITUy3hVr
 FrSmkkpQRt9fKm8G/DNaZMs9UBq2CmQEb3/2JfvJy7GjI77alszaaTzw2QKKMB92oTYo
 IZjfJLa+cWHmaOF2lDsDGBkj/NiJBOR1IBEDwo8L8KALeV87Ybbey2OH/Z74CupSJAqJ
 Pcyx3mSc+rsKH0bd74gUfOfEDKm68jvMOhShFqQrTJDCoVwu5T+2CLKIkBQTwW5pDDuo
 ujiZziBjRSrt1c666nlkzFTtP5wh5YjNhwTHPaASaBLNaA2p+dHiHW57/NNNZPJPXTiP
 sUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720631115; x=1721235915;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UO6/lK5/7C6XDmsvIs3cVH295usofusy4WKu+UT3LKI=;
 b=HsTw+/VBS5O7qqdQZ091EHsPH/3aVyFbVKmEzacwACn0Wov985sqfq31w4bFSlJRjR
 lYwkk8X3DiRMD5jUhwqZO2bhdQcTmvgMU/yCcT9OPzTmRUpJlPR4kT2q8eXFhkWrdCPy
 UhOygmYykDbx6RdLNrHfVnmFTE2vJUJ5mJ2Uyli9JFNXnZ4opVi3U+fkmzi8DosZ+9Kt
 mdBbdSYfq6KQiBDoBNyxNwhm/5ZKxZk4BP3HNSFiPum7RqOfPDLmIWgnhfbuuWieuqFz
 E969MUPsSDXI9JBOBx2pfGjorOe+vfmkgEHpK6HSqZR3v7HeG+br0E4XI53zGWARE0OV
 MKVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX1590Rzn8ThYlVMCgWsGdi231z+ny9eVUbbe28K4SztWi1KKFucTDlITEQyzDIRJRMLu2yJ4RVaeCwngRxtKiIoCPwk5+ynXafrfpPxrr
X-Gm-Message-State: AOJu0YxVME8Il9qKqweOwxdYBYvUzQ4W9+Z26j/ccEYMj/0gg0g0Z1Mi
 Bb9TEYPzdP64mwzEz0n+XfbHPImTeHulagPU5n2Lr75MVFkx97RcnPqiy9fDdbM=
X-Google-Smtp-Source: AGHT+IEZ/vduzwwhO5K4kQPX85w5VJ3dB+TYQDHXeHNJPj2YvvMVSizSFMwuGwYgtxvCPlkuMJjVQA==
X-Received: by 2002:a05:600c:5345:b0:426:602d:a243 with SMTP id
 5b1f17b1804b1-426707d8a90mr42891675e9.16.1720631115301; 
 Wed, 10 Jul 2024 10:05:15 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 10:05:14 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/5] drm/panel: atna33xc20: Fix the Samsung ATNA45AF01
 panel
Date: Wed, 10 Jul 2024 19:04:56 +0200
Message-Id: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADi/jmYC/x3MSwqAMAwA0atI1gbSKv6uIi60TTUoKq2IULy7x
 eVbzEQI7IUDdFkEz7cEOfYElWdglnGfGcUmgyZdUq0IH8UNKSI03uI0mnWTebmwKrRrJ9cWFTt
 I8enZyfOP++F9P56MXmJoAAAA
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

The DT changes are included here for reference and easier testing, I assume
Bjorn or Konrad will pick them up after the DRM panel changes were applied.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (5):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01
      drm/panel: samsung-atna33xc20: Add compatible for ATNA45AF01
      Revert "drm/panel-edp: Add SDC ATNA45AF01"
      arm64: dts: qcom: x1e80100-crd: Fix backlight
      arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20

 .../bindings/display/panel/samsung,atna33xc20.yaml      |  6 +++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts               | 17 +++++++++++++++--
 arch/arm64/configs/defconfig                            |  1 +
 drivers/gpu/drm/panel/panel-edp.c                       |  2 --
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c        |  1 +
 5 files changed, 22 insertions(+), 5 deletions(-)
---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
change-id: 20240710-x1e80100-crd-backlight-632f9bf936ef

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

