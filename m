Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4FEA3D7F0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183AB10E93F;
	Thu, 20 Feb 2025 11:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FgJ+Fqc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575010E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:14:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso658109e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050095; x=1740654895; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8LyXwrLGK4GdaCCWLeIZs0AErC/jYbMsOGckx5Nm6AE=;
 b=FgJ+Fqc5f1wuarFixOmBlN9hrj11PHVrW4KDXvBFUAx8hfvhs8edMe5QNh/zwO4tPF
 ibSAqswboT1Z8KIo4oCQqbHP8ZrBpMoMyEgwVw6vAjrZs8GmOILInh+D0PbmBN6h3OWK
 xq2ZRnF0D+AwHzR99UMhFNmnvLvzwnjQReq4DKTrbThAzBC/dbgIfyR/6n7VTuU7Zb8/
 0x5sAN9Y9brJZZTK8wzFA88NHT3cAXRvu0fqJh1yfLXnykcjTdxbvDBEtMQ53reHOLCo
 9fkJw9pQj1dq+aT5ePUv8YrKe4h3YOGwjsxdzJML1fe8lB4Db2IqFfmtAR9O7E+RI0qG
 /7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050095; x=1740654895;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LyXwrLGK4GdaCCWLeIZs0AErC/jYbMsOGckx5Nm6AE=;
 b=nW0Nf8sYJdiK4k65d6GNHo1N6Vzh8+NVoiJlAtdCISEgOLRGnjBnMjb+Z5v+G9YQEl
 tn5XlBzVy6XGvnezQPVzGDwTtZfycPB+bbox2Ph0OCHF/0CBi/plpb9Ipbvgrbzqt3J3
 WM4D27N5yzx+qa+22zRdoqhY4MBqymcgTwqUXLDB2NcKq6XCbIR0oczTDUf03qnTq8qb
 Zs8IdcWG12tzMJIcNhJXJKNFlt/lU8q176GRkhuidhklMXIBZMQrRwcgZO6AGnSYA0Ag
 bw9Bria4zwZJg+7OdrG9BTEIcJsVkTqqAtzLB5k5xcYc2dC6MHjy1CpE6yIh75Lm96Qf
 CsJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq/9LQ6gb2WiXNVmoKPzzs1NiVLYWI7YOG/TFXIr0ebP0pu2xI44wt0jVmjd6CW2va+9P2azKJ0rM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRQMgk3seOJ8rOGeWIInFrLVS92Q+B69H6bcJRY9M+HfKCJRGP
 L1F3bZBMV4tBrvrOZHUQXWbujVEs8r5rWcWDco8PfSXO4N3hdLopwa1ZjptxGL4=
X-Gm-Gg: ASbGncuQnZW19evhyLVoTwb9ao6fPN1hLAt+d68iaZwhKjLrE1fO7Jt75vHTNXfhqdo
 2385iwlEok/WiWbupWC8cw+wdpkME8aMZwPRpvVuSNUnSt61ZDlPdyq6T51QqE1oR+DOKTvs0TD
 ApO1GXEKVvmQzqZ4cveU/duzef9EfKOZAS5CWVsTyHVwVXqF5y2Jolkcp1yXmsjeHNtWQIjNeoy
 MRisw1KeUapS4Nrfa6xUchXM6+/XqkUftDYD2uPEFcEuloR9JSqlnhPBOP37pNXlI7VeGvUaKlT
 giqbdsMm6UGIgvS1dlff8PQ=
X-Google-Smtp-Source: AGHT+IGG9LP6CikwQQLLPJWH6HucdxpA0EQEAovfivAAnbKN4plM1f13MThC8AcAbBz05v8+AbVAlQ==
X-Received: by 2002:a05:6512:b1f:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-5462eeda30fmr2764753e87.10.1740050094711; 
 Thu, 20 Feb 2025 03:14:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:14:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Thu, 20 Feb 2025 13:14:42 +0200
Message-Id: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIOt2cC/53OTQqDMBCG4atI1o3kD9t01XsUF6lJzFA1MpFQE
 e/eKPQCXb4fzMNsJDkEl8i92gi6DAniVEJcKtIFM/WOgi1NBBOKSX6l3tLRzooO2SbqyuJvjbd
 ad6SczOg8fE7u2Zb2GEe6BHTmhwjW8IZpJgWvlZRCacqpHWHBtX4ZXFN4x/wYYDIY64j9oQZIS
 8T1/DGLw/5Lavd9/wJwxaVe8AAAAA==
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fJB6L5AnL5J+S+1HzyLzt2yON/RIJwdvkGfbsOOWwmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6qU4dq9Ooc3myWYJP8jGjhialgsGg3QNcOT
 GjxIqpl/luJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqgAKCRCLPIo+Aiko
 1WvCB/9A/koJ46Wd+4RE/e5z//3JgIwbLhFGDMEWzicgUR4oY1y7WUCLZE+7BLtC/LZR6A+7CSj
 +jdz+l/5AQMthKplWcUa8iLlh8ului3i6ynQi7D59MvEBhM5m4fWYIdATHMY7QDldKsjRyb5swD
 Uoa4bz98CR6wxmVNHhV9mbviGyZUw4KYTiaNJuP4hKLnGb7LMCSQSz0UkzkeTHN/uCMgMY5I68P
 regBLW0wZrjTNFDVWZmyTc+EIud38qQidP+Lh4eb3tFRTNdatHDq0LF3g5LnLWdSZ05n3NVrDF8
 3WuUEZJUz9xe/Ng30GqmRPVcXRYnIqkz3OGSwYRNttTG9f1x
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
base-commit: 402fdf7dbdc47d0186c4ad4fb1467a05f017bc0f
change-id: 20240317-fd-mdp4-lvds-e317f86fd99c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

