Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1828579F5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD36510EAC0;
	Fri, 16 Feb 2024 10:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="ZjBW+oCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741810EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:10:52 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so2838362a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1708078251; x=1708683051; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMRql7L8hsqbp6cXp+TzNFFLmZVefcT65u0H9tbQLBo=;
 b=ZjBW+oCHpXnR11L+6be/HtZnDjafxeeyptgC/DHWa/pavnhtQ4Rl2HrKwcCV6eiK46
 WXb5Fp3D5M/vFE/oP3ag7dczUFLhfP3Zk7jbgdmiOQ/01CItMf6HFVuFReQkNXB1Hujr
 GNUWt4UBtU5mKFx+V5EBkEYjureP6cVpBBQ9gRw7i8MKn3Hd40KwpYdIBB9xnqgMP0gS
 xOcQ0bLhCqmwMqqrkVlknxFaYXxi84RFrC00Inkeoi8SZNYH5NG/4sCFY5M7y0XYMu0k
 xHMjHd8gxVLzq5S33kGVQCQI7QCMidiyQJbWzepKtRvypeNApRfHu+kx1FhyTjt52zI7
 nd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708078251; x=1708683051;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZMRql7L8hsqbp6cXp+TzNFFLmZVefcT65u0H9tbQLBo=;
 b=f4SPAqitMl0YaoZd0LuVYZzclQ+pEEb2olCVNshpObBv4zNt+OJ0OYR66gu1b5+qd5
 pIoJQ2ayl80uQ8Mv2Zb36Iza9mGbSnkzvLCDKe1dp8byNUCQ3WM2de9LNIHtPGx96raN
 u5v5mGKGo75b7fmLEQ+S8ZeQHroq2EDIibX7/CtLJaTk+QfBfeDK0oqQrAGmnpf5shj1
 cOQyArxYHkXjseujNuOKQk9vIAsSWtYUSkEtersm1Ys6U5An54D8f6103L7lpktjtZ52
 OmxO2NgXiTD1fAG/RbmlCOTlvFyzTzqVuGt/h0hg9xaFDd4yi4aoDpxutAXTJNyW2MAE
 zAuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeo2102DyEyZR1TpKn/l4WQep2vcxH9yya+pxS1fvkKURoon4kNElyTvYS2RxPtDKIA80GSz6xaweou3ljNSrnXeuMm3pKqd+xAQB9TZ4I
X-Gm-Message-State: AOJu0YyPFFmFsin3e4Ou1UVrH7jPOKKzcMpXrAe2pC6g8uXnBCQvIWYp
 PnFgBrHkOFYs5x4dOXIjfK7Y68dfHDvXTc8tB4/c7l7JaWUh/J1yaHPQoAKjAczgZ9gFA9IxWeJ
 P
X-Google-Smtp-Source: AGHT+IGrFTfr1Ah+H+VEMxSBiGjCEBAP5CJc6Ef5z0y9q4E2tBIqwXWKDxCN1lwogTQUbwXHelSW8g==
X-Received: by 2002:a17:906:b847:b0:a3d:6f46:ac3a with SMTP id
 ga7-20020a170906b84700b00a3d6f46ac3amr2958890ejb.11.1708078251164; 
 Fri, 16 Feb 2024 02:10:51 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170906169200b00a3d1897ab68sm1398019ejd.113.2024.02.16.02.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:10:50 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Add display support for Fairphone 4
Date: Fri, 16 Feb 2024 11:10:47 +0100
Message-Id: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKc0z2UC/22MwQ6DIBAFf8VwLs0uipqe/I+mh0WhkrRAoCFtj
 P9e9GSaHuflzSws6Wh1YpdqYVFnm6x3BepTxcaZ3F1zOxVmAkQDCJKb0PBATj+4BFLUy7olIFb
 +IWpj33vreis82/Ty8bOnM27rv0pGDhzJKFKjlKJrB0M2htk7fR79k22lLA42wtEWxe5pQsSuM
 a1Uv/a6rl8cd01w5AAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the bindings and panel driver for the LCD panel with the model
number 9A-3R063-1102B from DJN which is using the HX83112A driver IC. It
is used on the Fairphone 4 smartphone.

Then we can add the panel to the device dts and also enable the GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Update compatible to djn,9a-3r063-1102b
- Add defines for manufacturer-specific DSI commands
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com

Changes in v2:
- Driver:
  - Drop "bool prepared" from driver (Dmitry)
  - Use drm_connector_helper_get_modes_fixed (Dmitry)
  - Use dev_err_probe in error path (Dmitry)
  - Fix width/height variables (myself)
- Dts:
  - Don't drop simple-framebuffer (Konrad)
  - Drop disablement of gmu in dtsi (Konrad)
  - Set zap shader path (myself)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Himax HX83112A
      drm/panel: Add driver for DJN HX83112A LCD panel
      arm64: dts: qcom: sm6350: Remove "disabled" state of GMU
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU

 .../bindings/display/panel/himax,hx83112a.yaml     |  74 ++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  53 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 372 +++++++++++++++++++++
 6 files changed, 511 insertions(+), 3 deletions(-)
---
base-commit: 91f11e5814cfbad83ee22fbcf96b0eb41302d889
change-id: 20240105-fp4-panel-50aba8536a0a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

