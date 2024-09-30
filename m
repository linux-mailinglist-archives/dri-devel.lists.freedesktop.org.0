Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDC98AC27
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 20:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3AF10E573;
	Mon, 30 Sep 2024 18:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="NLnINYUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F307410E131;
 Mon, 30 Sep 2024 18:36:01 +0000 (UTC)
Received: from [192.168.1.130] (51B6DC6E.dsl.pool.telekom.hu [81.182.220.110])
 by mail.mainlining.org (Postfix) with ESMTPSA id 9A650E451D;
 Mon, 30 Sep 2024 18:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1727721360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7f0TECQ0gRKG4FE+eX0Zs7r0JNAndVjKgypDK+kBGLo=;
 b=NLnINYUFWu4SRGGAUPcqF/TnhauwhPcmhMZKPAUvLwREMuK2znax1xcv9wklN9/MjrwIgm
 Ydr8Re9VdPuRMC/Y/2ydDF1tTH39JxiqGcilx5VwTR3ul7xkJHP948ZOA/5Ju0kC0r0ndQ
 qxYu37mpUZHq5lQP28oZbOCxZJkC+if/Fy2ddveKhzrE2IWLkHv/jZJKCfKK24sSlgh2H8
 uPbCmK7MPriQ/sTfHJGW5FIbKgH17+K9ReCndMUFyh8pZHKGMndTsILy0qdlEUNMFxBurM
 YS4zQiwhBW5VakwnTzVZAj1rVTkt6dmplLNACeYV8ZPpI2ph36Sk6A3u/sJDBg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/4] Add MSM8996/MSM8953/MSM8937/MSM8917 dpu catalog
Date: Mon, 30 Sep 2024 20:35:55 +0200
Message-Id: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIvv+mYC/3WNyw6DIBREf8XcdWkAH6Cr/kfjQgXxJgUMtKaN4
 d9Ldd3V5EwyZ3aIOqCO0BU7BL1hRO8y8EsB0zI4owmqzMApr2jNJVHri9hoZVuXZ7YNqRWdR6F
 LKUYJebkGPeP7sN77zAvGpw+f42Rjv/b0NX98GyOUDCWbhOCVVKO42QHdAx06c/XBQJ9S+gKrA
 b/+uwAAAA==
X-Change-ID: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727721359; l=2399;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=yA5cFMl8+ec5dJ+qtVHlQGI7o8LiFx+wlxEYVLtwrow=;
 b=4yFIpr04nUzMdDTT+LVLobgMzkxFp320Gxd6fO64UPMLTRhV66pgQQGrwDoX2ENSu9x5zI/nm
 +5DTiDMMUjDA/AeE+TdUCt4vyCpqsWi+L/gP3dSx6uaqwFG3lpC51o2
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

This patch series add dpu support for MSM8996/MSM8953/MSM8937/MSM8917 SoCs.

This parch series was tested on many devices:

- Xiaomi Redmi 5A (msm8917, video panel)
- Xiaomi Redmi Note 5A (msm8917, video panel)
- Xiaomi Redmi Note 5A Prime (msm8940, video panel)
- Motorola G5S (msm8937, video panel)
- Xiaomi Redmi 3S (msm8937, video panel)
- Xiaomi Redmi 4x (msm8940, video panel)
- Samsung A6+ LTE (sdm450, cmd panel)
- Xiaomi Redmi 7 (sdm632, video panel)
- Xiaomi Redmi 5 (sdm450, video panel)
- Xiaomi Redmi 5 Plus (msm8953, video panel)
- Xiaomi Redmi Note 4 (msm8953, video panel)
- Xiaomi Mi A1 (msm8953, video panel)
- Xiaomi Mi A2 Lite/Redmi 6 Pro (msm8953, video panel)
- Xiaomi Redmi S2 (msm8953, video panel)
- Motorola G5 Plus (msm8953, video panel)
- Xiaomi Mi Note 2 (msm8996, video panel)
- Xiaomi Mi 5s (msm8996, cmd panel)

All LMs and SSPPs was checked and works, except cmd panel related configs
(SSPP_DMA0) on MSM8917 and MSM8937.

Note, by default these platforms are still handled by the MDP5 driver
unless the `msm.prefer_mdp5=false' parameter is provided.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Add MSM8917 and MSM8937 from previous attempts.
- Remove LM_3 and LM_4 from msm8996.
- Link to v1: https://lore.kernel.org/r/20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org

---
Dmitry Baryshkov (3):
      drm/msm/dpu: Add support for MSM8953
      drm/msm/dpu: Add support for MSM8937
      drm/msm/dpu: Add support for MSM8917

Konrad Dybcio (1):
      drm/msm/dpu: Add support for MSM8996

 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   | 210 +++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   | 187 ++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 338 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 108 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +
 8 files changed, 1073 insertions(+)
---
base-commit: cea5425829f77e476b03702426f6b3701299b925
change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

