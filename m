Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1DAA49004
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEE010E11F;
	Fri, 28 Feb 2025 04:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VgarCMf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242510E128
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:11 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5495177fcbcso94522e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716050; x=1741320850; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RYRf/zLltnVtwc/PiKXKoC5m7NP7923iyGmqrNy9Xgk=;
 b=VgarCMf5VNhZb8eqiyfV17KE+ID1ZCdjJPMUNhXgoLdfNpqg+3ovQ5urW25oUDgZK1
 22IRpatZDN5Pl7xK8o+b0hN3el7PFNkaSy1XldVEeqix55nkPkxToF1vtydq5pK0l5Nf
 G9tUVsYdlOvAifPfMdT9unntcaEc8p8A6fnbDz95/D5qFglgdwJ/dlwoKL0O7eWG04cB
 FIaF9gbbhQTTbpveoRdx5kWdYd4JNjykDaqikVREl/K5gVoF4I3kZuCRKeZQ9YIeI5xC
 BAOdxXCxnJSL2LO1Tsk4an6Br/P6m7/mo8j2gHShfDg5v3ZGwjgCKlTMHhzKeZ01Dr3e
 Xq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716050; x=1741320850;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RYRf/zLltnVtwc/PiKXKoC5m7NP7923iyGmqrNy9Xgk=;
 b=fiByXith2O1WIH2oRucMib7zqV3bZHPMVOAtBUHPrG5gpAFTQSKKubl/lQrc5N9dSd
 ne7OoMhiVOS2X1u4LK6J6v4yAxn9LNDfhoMzkhuNTd0IahYzmJ1gMTsuUXrAU9/NUpTN
 InWzEhv5WFZOQx8RIXQFS+TvrnLi42Ts02vmW28AAxueSlMlbs5mBymbbvpq7YbPGeZh
 V9T173KusgjtcGD1wlvhDdShnwuc/5oAUKtRfwwVRVJDI2WRyRU7Is1fJjZzRcOuX/V2
 N73tx0M6BazetyY4vi3M06K0M+Pb+QnRqQFAuAr1DB3yXtb2bl05HCfHw4RwGogQQp/A
 Y7Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjSO7rIHd2fDPXQeMcmpiL/xeQM+wJaDx+A8eixwNBbcot72riU9hd5JAO/J/ya7NY7sQdTEN7Pvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBUf15BtEzoBeP8rdvC0p4qgSgcidm9XDZC52bVWpXEjMQWpml
 w8kK84/afAFq95vSGz7deJzq7Sm7KruYU8fhs/1bS2/+etXSr/BF7brS5qI4ApY=
X-Gm-Gg: ASbGncv/iuYD9566xXxlGMbWzeFB/e3XAae9pv4TuvxWmLXl2XccrBlNF8GaAas87nc
 bwxIeECDMna/ZVSfe4WSOPTi009HX8uypVVedQsW8zXPu8nJvuDhoswAY615OiyDmmAEsiBbccP
 lCiAiKaoutXZvCNpKUIE7TdSgPFZkTdf7uJSiGDkFSCq5ANUDJmDG5MH1b7GRiJuJ3mU/hCMjcD
 tg9g9166so4l9rDXjTJt8PpGf4qCVrQmnDztnFxYtyV1MzMex6RUPYbZ6VMqB91uR5bc7fuJc/t
 rxIGLeRnu1tHOZ1tG2iJ7xeQfMFDEGEe9Q==
X-Google-Smtp-Source: AGHT+IFYyLhYNpfXaS4jL/HpsUJ0xZQOZjeZq/epaIkKokVqfkpm7Y0S22x7xD4qJ7NVJT8Sc5wjfg==
X-Received: by 2002:a05:6512:224d:b0:549:5138:cb20 with SMTP id
 2adb3069b0e04-5495138ce15mr116067e87.6.1740716050232; 
 Thu, 27 Feb 2025 20:14:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
Date: Fri, 28 Feb 2025 06:14:04 +0200
Message-Id: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAw4wWcC/13Myw6CMBCF4Vchs3bM0HCprnwPw2IsBSYhlLS10
 RDe3UpcufxPcr4NgvViA1yLDbxNEsQtOdSpADPxMlqUPjcoUjUpumC/PpFNlGTRxBlJG8NVrx+
 kGfJp9XaQ1wHeu9yThOj8+/BT+V1/lKJ/KpVI2JaGm5brphr0bZaFvTs7P0K37/sHX2ufra0AA
 AA=
X-Change-ID: 20250209-dpu-active-ctl-08cca4d8b08a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2682;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rjQbFJKt8uwfUV9oU3NunytfIZ/1Q7onP6jZfvGFvm4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgOUHIA7y+7bzE4ENr8zsm3pvkEKIXhJM6cH
 Z9EV2vc8AWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1QRFCACybyvscFVesJkPTMRs/ZXr5pCs1yvnCMHJbYGI1NefVYeyf9MHMpblGNfrqVdi3f1NxY4
 rZBYjlRRtYEGPhZiKR9XyK6LuITtfHuqgzUY/KbfjzDEIUWgXrBk1LRM0kuQTnez8OoPb17FCs2
 CDiOJIPgVmkLkRKl9UFBcBB06DROCHkFCBraZAgTmOtz6Jn3xzBaBvGKwMTYG/gykdsV28EkTZS
 BnoK5iMiSx1Kvqz11MrKaTxC/vjYvVuv+FuzGDlTEVHv1M91xGwqizCoXo9M7Mk8A0F4Vx490Mm
 lTOQ37kKL/7RXB+I3tFzA9b47dwiK4ekDFoNq8zObWKbkt4H
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

Since version 5.0 the DPU got an improved way of handling multi-output
configurations. It is now possible to program all pending changes
through a single CTL and flush everything at the same time.

Implement corresponding changes in the DPU driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Made CTL_MERGE_3D_ACTIVE writes unconditional (Marijn)
- Added CTL_INTF_MASTER clearing in dpu_hw_ctl_reset_intf_cfg_v1
  (Marijn)
- Added a patch to drop extra rm->has_legacy_ctls condition (and an
  explanation why it can not be folded in an earlier patch).
- Link to v1: https://lore.kernel.org/r/20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >= 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      drm/msm/dpu: drop now-unused condition for has_legacy_ctls

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           | 20 +++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               | 14 +++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h               |  2 ++
 18 files changed, 65 insertions(+), 39 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250209-dpu-active-ctl-08cca4d8b08a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

