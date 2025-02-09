Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB4A2DA7F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB9210E1FC;
	Sun,  9 Feb 2025 03:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ppbjKOGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D7110E1FC
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:26 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54505a75445so893736e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071284; x=1739676084; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lAjNA953tZUPp6VSyuChrIP+Zsr/R1tQauJo2e/D/xs=;
 b=ppbjKOGUuj4FjNAr/UtjUaJjdK2RlQd/yv657ziN9gMiJ8mxHkihux2jCymt0bE31k
 wFRrOPX4TJfKdGhNazTNORTIxSU3fRTmTyzRjV8cXtbpzlDzTTltHvcgkFIZyqFF2j9E
 EwULmaAd9RuzpMhr6/iAZqbMLkhFDB2TlLDbZCmM0/CHeXbto4PzzNmtgcKw+QQNaWQp
 669+b7kKECrHe2yZ2vBy36Lznb5UX/i9A0vkBByMEb4v51eEO7zkerlMAzJ4+LxXmgVW
 s6nSdrPQ1cPywqIhxictM3XqEbg+fha8RWFOX+CNIrUv9kYHooRA75hOuNHTw8fvRTR+
 xa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071284; x=1739676084;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lAjNA953tZUPp6VSyuChrIP+Zsr/R1tQauJo2e/D/xs=;
 b=wfj9igrohhIgnPM1nSgjboWg9q0ILoFgbHQtF1k9Hv2dBa2RvUlb9QzLvM9grkiPlj
 2kA9s9K8VZg8C6qd8MUfBD34Nc+fLpShRpU+wSv6b1U3VfMr2dTZQ7bJ1Me5hwzximnG
 hWqx315rzEPkAIqisAcb2io+ERt48x/CTH+PsSgAOUfPH1+U4bHp0/ntqMPU2X1rLIS8
 mA6U9DgaZ8O40imXH5xvH2wV7o4Ba0cTm13FmhM0SUPBhNzwTomWcP7o6DqZCdV8hM1q
 yWFAy5XZy0gDulUerbpMllJ2KuZUm8FJHB4so2Hw2MoE568NAKv1VWeqstQwvZwr86KL
 o/9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMNzuE3tjtnjJVrNOkj2evfIAgEq6oVtWxIp22aG+UMCzxGQynF+rt6Ohez2QAk/KCucFQaOpUfJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5d614uvk0H+41SPCZ6LybtJdo8LCpbrCO/97JwV7AJFeRO2Yh
 SgWohQq2yuTkyI/22v2Hai9yLBPm75qrCYJUDZTn1waD3R1FNxSqWpV/28H6+ps=
X-Gm-Gg: ASbGncsFIIz04mOaxG/h8lvbTAGnN8l4BD6wpH/QcL5WxLyFYN6Ca2ya727lhJPxBPK
 xnMo8xANNa/ZluYfy01KLeC7KNhche/LO+zdz3ccZua/7ed0k4o82EYeYGzvXkBpEiDJgac3bx2
 nhfbodk7BABAHvoDJ1IF7WUYhQO6u17VhiB2IwC6fkt56DITb8hfl7H63O4Z+xvcsZXtKMb/sQr
 2mPqDSZogbLMW0+QNJW++hsfnHZIF0aWoIHoJvHqYEa1hwAupqVyaIo1tvCfvqbMbfCmMfggqY0
 /Jt1AucCrCE8E4n5UYvn39A=
X-Google-Smtp-Source: AGHT+IHsxeWqnTeAqZtBc5A1b7LgJNE/n6mSsdvXC0Wcuj5manHlA1woFEwXNs89JFvUrGGGlgGgUQ==
X-Received: by 2002:a05:6512:a8f:b0:544:12df:8726 with SMTP id
 2adb3069b0e04-54414ab6a8bmr2765026e87.22.1739071284173; 
 Sat, 08 Feb 2025 19:21:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/8] drm/msm/dpu: rework debugfs interface of dpu_core_perf
Date: Sun, 09 Feb 2025 05:21:10 +0200
Message-Id: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcfqGcC/3XNQQ6CMBCF4auQrq2pdFqsK+9hXBSYQqOhZKpVQ
 7i7hcSFMS7/l8w3E4tIHiM7FBMjTD76MORQm4I1vR065L7NzUpRgpA74O145yOS44SPQBduKtd
 YYwzWoFm+Ggmdf67i6Zy79/EW6LU+SHJZ/1tJcsEr4yyg0EpVcLz6wVLYBurYgiX4AErshP4FI
 ANC1CXsJRio9Bcwz/MbwcFNXvAAAAA=
X-Change-ID: 20240314-dpu-perf-rework-97fca999eb46
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NTr02ouTwM6BMx0LotwmedBZCP4G07mywT7v8bHyyGg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wAtAgwlyeiUFSx8giTZ7sPZ7ZnTosJodpk
 W90Fh9WtTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1TeoCACDRUjHxkfP08uFblALxS6ihEF8m5IAQ4guKr2xl6aVUXmVEDt50W7PeiH5BQy7SC2DROX
 GWFIxTr3UcsxfAFKV+VqBkPrjTdrq2Vh4G72xZj7D6LQ74L6ng3luyMFHRTo22yqCU8yfee4Jv3
 vH6wTg2owfwtaYXHZ60SWvqwl02Id+RuR23wjlHc+ngEdzx/fapKf7WQfQ5/sGj7w2nWe2OIsLU
 Yagr4kOyq0IpTSqv7ePqkPDVxLHbGc+WUa2xhnpyKymZkS6QJLk84r1Nn3m9DnM/zNznZFkZfNb
 OHk1+jHccN0Gbn1PeI/iH0gktjGjvdWX1HX9hk6n3EgIyKWI
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

Bring back a set of patches extracted from [1] per Abhinav's suggestion.

Rework debugging overrides for the bandwidth and clock settings. Instead
of specifying the 'mode' and some values, allow one to set the affected
value directly.

[1] https://patchwork.freedesktop.org/series/119552/#rev2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Fixed bps -> KBps in the comments (Abhinav)
- Split the core_clk_rate changes into a separate commit (Abhinav)
- Expanded commit message to note that debugfs bandwidth settings are
  not a subject to catalog thresholds (Abhinav)
- Temporarily dropped the patches actually reworking the debugfs modes,
  they will be reposted separately.
- Link to v4: https://lore.kernel.org/r/20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org

Changes in v4:
- Dropped core_perf: from patch subject (Abhinav)
- Fixed indentation of _dpu_core_perf_crtc_update_bus() (Abhinav)
- Expanded commit messages to reflect different questions (Abhinav)
- Reworked existing files to specify max allowed average bandwidth
  (Abhinav)
- Fixed u32 vs u64 and KBps vs Bps values in debugfs interface
- Link to v3: https://lore.kernel.org/r/20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: extract bandwidth aggregation function
      drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      drm/msm/dpu: change ib values to u32
      drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      drm/msm/dpu: also use KBps for bw_ctl output
      drm/msm/dpu: rename average bandwidth-related debugfs files
      drm/msm/dpu: drop core_clk_rate overrides from _dpu_core_perf_calc_crtc
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 140 ++++++++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   5 +-
 3 files changed, 71 insertions(+), 84 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240314-dpu-perf-rework-97fca999eb46

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

