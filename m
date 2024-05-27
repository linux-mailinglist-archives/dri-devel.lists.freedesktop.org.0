Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE58D0355
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DA610E39C;
	Mon, 27 May 2024 14:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R336jv75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2AF10E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:23:25 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6f8edde1013so2627989b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819804; x=1717424604; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iAFaFyYmOhcqz6/0CsRDcA375GrElz4k011ZY6EWfEo=;
 b=R336jv75QM9TkRVtKoZSOa0Xn2W+Yl5Nc4VSMu6MiADA2vUk8fkKoIAx1l8xNh2sMa
 /Z+MyZK8ozTLEoypLwoAmboCf85ibSylHRw6GaeznYRBjDU9DYxC5mFNhWtMt7WL/wFH
 LkuLgElqFdk8oLcIWjv7tzsXx2a7C+xLZ2B1R5uzBheUlCe0Vzm5K50E45MZI3RwZg4H
 lMiiYcnb4FCSdW2oiVLTyQPXRBhrolRlGNHP/WhZ8F2WZxBQ4O1QyKKSsO1neFZrXNcQ
 sHMzJmo4SZyQXWBsO7kz6nfgCkES8G8+2UteiYYOlBHE9mI3RpVOksRvFnFE9c+u43Nt
 Jlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819804; x=1717424604;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iAFaFyYmOhcqz6/0CsRDcA375GrElz4k011ZY6EWfEo=;
 b=YBmQIkUlRDg60c3K8lDk35uQPc2k/S38YdWBD4uCsLG3VlgNrj8LOB/p8UdKGepDYx
 cjiBd2yUERdsbi24ISh3pL1aphg1v8lFwAbuNHGkgqFm4uuZwtm7qvuSaiXQJb/C+vy2
 xY6NBY202OQa6/4bkkQeb1E14LEPPYC7iUGBhXZ9Z5bT/wljq31W6Zq0mtPvVy/BCOia
 h6EqPCvEha/+yXmMwU4nV+Pt4YA246A807cs+DzIJN9xKsvUSvs8mySbfEA+XJh7Weqj
 AM0G33LFqcBCTEbL4CObTV6dbP/QGCfX7lTliri5vfQmayNmOqjUGOyy3JQ/DIDa2R6w
 kcsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrSXGuCyIPxCb9IFW3TqSTsZhjfDLqKVYNCQZVXbVh/7GURjnnNThlntxMOCt/Hk6NwamJsxALLJrnhcmQIpgkUK/tXRMXCjZlBbPBRgxb
X-Gm-Message-State: AOJu0YzS+8DY5lcArQ5aTb/jos+xOgjvTb92OmnGGCnG89+NbnUqqfJd
 Abtd7Jbs0mGkNLM1clUB36ZIQqk1Os9h2CjhjLH5spo91YaSWGhsG7h8StCDmeI=
X-Google-Smtp-Source: AGHT+IFc1iZS9wh9Is7k3xcIqgtRRQ9HCmO7nnfXJHnANhfsUFqEtGfj2zZjpZvOYRWLoYWyCsnRkg==
X-Received: by 2002:a05:6a21:788c:b0:1ad:746:b15a with SMTP id
 adf61e73a8af0-1b212dfe3c0mr10634192637.47.1716819804334; 
 Mon, 27 May 2024 07:23:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:23:23 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v5 0/6] Add DSC support to DSI video panel
Date: Mon, 27 May 2024 22:21:46 +0800
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqWVGYC/5WNQQ6CMBBFr0K6dkwdC1FX3sOwADrAJELJDDYa0
 rtbuYGLv3h/8d5mlIRJza3YjFBk5TBnKA+F6cZmHgjYZzZo0dkSHUw6gZc87fIYInsK8Fp0FWo
 mcIBIiFXVt3S5mqxZhHp+74lHnXlkXYN89mJ0v/cPeXRggapTZ8vW2bPv70+eGwnHIIOpU0pf3
 zrF6tEAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=1945;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sm44pjviolYcXIDxzIPWqNX7LR3G6mUIs56YucRNwwM=;
 b=Y7rs1ciLUI2OTmqboUiW7dxJf9Q6pb/KA0uo6G1fDAJQXyvhmaXXXIms5PqaUjuLCg25CbPC2
 EME/sYC6vdvANroYFAd+6OSoTIRc5PdTNpMDjVmlpTO0yp1OBddakzz
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

This is follow up update to Jonathan's patch set.

Changes vs V4:
- Polish width calculation with helper function
- Split cfg2 compression bit into another patch

Changes vs V3:
- Rebase to latest msm-next-lumag branch.
- Drop the slice_per_pkt change as it does impact basic DSC feature.
- Remove change in generated dsi header
- update DSC compressed width calculation with bpp and bpc
- split wide bus impact on width into another patch
- rename patch tile of VIDEO_COMPRESSION_MODE_CTRL_WC change
- Polish warning usage
- Add tags from reviewers

Changes vs V2:
- Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
latest mainline code.
- Drop the bonded DSI patch as I do not have device to test it.
- Address comments from version 2.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Changes in v5:
- Link to v4: https://lore.kernel.org/r/20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org

---
Jonathan Marek (4):
      drm/msm/dpu: fix video mode DSC for DSI
      drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      drm/msm/dsi: add a comment to explain pkt_per_line encoding

Jun Nie (2):
      drm/msm/dpu: adjust data width for widen bus case
      drm/msm/dpu: enable compression bit in cfg2 for DSC

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 13 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                   | 10 +++++++++-
 5 files changed, 49 insertions(+), 2 deletions(-)
---
base-commit: e6428bcb611f6c164856a41fc5a1ae8471a9b5a9
change-id: 20240524-msm-drm-dsc-dsi-video-upstream-4-22e2266fbe89

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

