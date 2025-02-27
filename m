Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71934A47268
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36DD10E066;
	Thu, 27 Feb 2025 02:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IgZ863SC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188F710E066
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:16 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5461cb12e39so392052e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623114; x=1741227914; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eUWtdB14jnh2w/XRiviqZD62FhazLUs+EUPGvTKghf8=;
 b=IgZ863SCXvs8utRkku72mW6bJNRshmL9KzTkUBxYadXd6CP+txhu82M9IjsjXO8zXk
 g9Ychht9PTq7Mgz8i3pTPGxDfCgBRvCPRG20TcgPsZFm+GrSu0PJ99cXMSs3T9fN1SZF
 1/ycVrCyH7iTHyCIttcpG61gsDXVOaqC1ecGyzsegsJX7Ff4bu9wce2UaqTEKrCv7pae
 fwRPzXuPujhbrMRrfDf2jgyNj2i6QcA2PYc+W7ivr7XdN0+4GvNsiDGiNgOtyhG6rCbJ
 ywAX8GhEd6LIPPfvkZNnOUAHzCBqsfgn2VKfqJCROAyOSm2cQKYqAIvWhzmcV2mvKwEC
 ELHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623114; x=1741227914;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eUWtdB14jnh2w/XRiviqZD62FhazLUs+EUPGvTKghf8=;
 b=t80n6hkD7Xmr4LZ2KRssgBKCIuk3nd0xDYtBfOKhkknebqVUclncl4QpFtRDnSP7b9
 AKzWpMg1XjdQRWAKRmNDgPl93gZrHjVQuw3B32dbjjft/m9WUp5KZdsGYGdB6Ql8BC1x
 pbI+Z1dpBntCJdssshbK6H1mNNxYC4cWOqPoJ2X4MiKEEBmEKIahYwaZLaXTqyt1SBL+
 bnMVXTnbh/qnlrfL9M454DeBId+zquLuM66fY39Pk7YOKsLjY6L46XuVKTXhuKk0r8xY
 khUb9I2xGFmEf5VjMWEGDUZRvzfIr6LqKgWW/NGBpCHo/pu9KU2FX8PcMuXEVji4PsDu
 hOhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlAeOfE2V+pYyYM2cYHv3c72fMlaTFrisatd0Gl5S1N52UXWf0kZpfqSqCYVygIEitEvNxEAoTQjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFGdEIh/7osllE6nBaPy1i7O6guQOgzy/2EotmkT4yIpwxxYNB
 hBd4Jea9UtizlcPWZvseu2GLXlIBhJubWMf6bp5HEp8pvqddeFzMojsKJtMMl6s=
X-Gm-Gg: ASbGncusp3p42CpTFnOm24vtx4aY0sXVi7Mlcn0q4pNBo2gTwJ8DXcGpmChuXCB5Vz3
 EoQGl72MsAl7QNmCsVzo0SBbKCHraJOZUZk2IRDm27kRh1CaK6WjVc8tEWh6ndMfEgvTJsFmllx
 8UWq7tq0haQ6G4wow9xqcUPEelkFOybieeSO8SmS5HmfY/w41rHfpVmIycQLLrCD2mesHZWfx95
 FKl+rLfvPVkw3XWv1p1y4YItHHORMjRiTb5iLOPVmfejNmwdTe7rLrD3T+lrVZ64Mx/oN/pkc+S
 scsgqvkhUU3KUpzoFAynCTkEYsMnIJJUww==
X-Google-Smtp-Source: AGHT+IEcp3eou/4dlv37w4mxvS1t+d8IRoUwVQH8cDzzQZ+M5zz+OASkfl03BF8A1+GTRYY3AwRSGA==
X-Received: by 2002:a05:6512:200e:b0:548:794f:f9dd with SMTP id
 2adb3069b0e04-548794ffb8cmr4463067e87.10.1740623114210; 
 Wed, 26 Feb 2025 18:25:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Thu, 27 Feb 2025 04:25:08 +0200
Message-Id: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATNv2cC/52PywqDMBBFf0Wy7kgePrvqfxQXqUk0VI1MJFTEf
 28UCu22yzNwDnc24jVa7ck12QjqYL11UwRxSUjby6nTYFVkwinPqGAlGAWjmjMYgvKg48VUhVF
 13ZKozKiNfZ25exPZoBth6VHLT4TTghW0poKzNBOCZzUwUKNdcE0fElffP124DXaS6FKH3VHtr
 V8crufGwI/2v6Wo5Yf5+0XgQIHl0ug8Lysp2LfV7Pv+BvFbrbUmAQAA
X-Change-ID: 20240317-fd-mdp4-lvds-e317f86fd99c
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GI+BVzpsla5S77ixF6zzScQlWVEkGguh/pXHwFaIqGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80GTG9htKZS4aIoUdR9qZ1oXGU6qMNP2/w7D
 +V0XH1DRe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1X7kB/9IV/ZQTS+2xw+LYlJXcF50/7JBHGVTDk3fEUr5Vr4SUe7EC6Kz2ybH5fXb6pA6a+MkHtl
 E4GfYnPdt86zcBggSdP4MAZUmk7mY0y6zumQLZW1rA86bd8adZuPhmfYrYZf8jVphdUtyVxH+Zf
 t5MmFFV7ejM8FDsVVanMkElZlfNJhkKsO3vonUgGGGJU4wxEzeBZzTu5Qte70Y7FLSIK/PpndyO
 UCYZHEu/uILCvTkRMc9NO+rXCv9MwIuL4hX/25Z+nxp1TeXspRNPW7iBzkabv+zkKM/VKWfFO8d
 u8zuoo+vca87hzCm8ChPPROf1gJbyibdmMlS4SERUXzPVP4V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The LCDC controller uses pixel clock provided by the multimedia clock
controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
clocks properly, taking MMCC into account.

MDP4 uses custom code to handle LVDS panel. It predates handling
EPROBE_DEFER, it tries to work when the panel device is not available,
etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
to follow contemporary DRM practices.

---
Changes in v3:
- Fixed commit message to explain that DT name is used in addition to
  the global system table lookup (Konrad).
- Link to v2: https://lore.kernel.org/r/20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org

Changes in v2:
- Rebase on top of msm-next.
- Upgrade LVDS clock code to use clock providers and parent_data
- Use LVDS clock from the MMCC instead of using LVDS PHY directly
- Link to v1: https://lore.kernel.org/r/20220616090321.433249-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (7):
      dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      drm/msm/mdp4: register the LVDS PLL as a clock provider
      drm/msm/mdp4: use parent_data for LVDS PLL
      drm/msm/mdp4: move move_valid callback to lcdc_encoder
      drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      arm: dts: qcom: apq8064: link LVDS clocks

 .../devicetree/bindings/display/msm/mdp4.yaml      |   9 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  16 ++-
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 ++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  16 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  55 +++++-----
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 121 ---------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |  28 ++---
 8 files changed, 86 insertions(+), 194 deletions(-)
---
base-commit: 66054467b223f366fc463bb69aa7dcd050986e62
change-id: 20240317-fd-mdp4-lvds-e317f86fd99c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

