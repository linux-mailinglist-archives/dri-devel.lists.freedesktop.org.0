Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47309F23CA
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 13:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7271210E04A;
	Sun, 15 Dec 2024 12:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CkWtZCK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE5310E167
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 12:40:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-540215984f0so3677214e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 04:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734266422; x=1734871222; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0v+ql97l8D44LGjcV7SZRS15NuWmWYhnQwY5KtcOkq8=;
 b=CkWtZCK/Bvn2QwtGJ6Hect6jxS5aurjYqgEoDyXuC8uPYG+YERWZsT9PDVPHVIoOW8
 bcZGfE64PO/pAaTs0ygQViYkf6+XSwpfZSe6myPiFssUuUtYXIpvsf/vFkmiPSnNGm2d
 O2Ovo/qKojhneYtqfPCGVYVSuDhYbA9NfzibPmqQBy7ES2NId/msHaWyU3HogQGcU1jU
 3s7bg7454U03UyfkY42uZBmwsCQw7EiM3WvuXUCLImbxR4dfqIQV4FEJCrw8Q05f7xKq
 nVAkWXgP2Z7dsIaLWDbZ1S83RvotQLQJAD/RHBxC6OoVGJQbAln1T4WUXAwni1XfJzAM
 oqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734266422; x=1734871222;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0v+ql97l8D44LGjcV7SZRS15NuWmWYhnQwY5KtcOkq8=;
 b=J4tSJwyGqZLGhxf5JGbXgEXE83Tcc3D43nJ0DMVcbPHF1uO2C635mIirOH1gCHKKxK
 aq5JHedmRAU1hpQIMemOgOd8L1wdU79XmznhVDVAEBCv9+go6a4GeE8uURvAtrS5ew8F
 sOxpDYCBHp6EcoDqugYheUJHz/RGsR89LX/2lcnpnwgWwveVv+1q7xasAAZuI6HKWmIL
 CALB1UwgjDTLMge5q7KFH4OEehwdcYS/evJbhLlYJimheScnVSOCLtJX+jgqJu/PBXw8
 zerMmIwwboIP2q6CjxXoYypwbM7gXACHK3CsNoSjIJJiVFiesw4JV5eGJjo7Q3EpfAao
 nTnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOqJeWdzCodIL06xBlTG3SG/BmDGRwpr/Ir8lvx6qkvRthLGpx28t4D5Fa4lkeNSC4T95fy0EyWGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8HPuuuFh0CYhIBoOrIMbBGfgqashC5arIEdNjKkPV3Kfz+Rsy
 MpNDZQEXMZ7H22nKifQjkgDw6e7hmPwhDIWUAWlG16P6OqYUGVy5udEowTFtsUg=
X-Gm-Gg: ASbGncu07RrPzyvaek7YzENxwF0QijEXfh3zD4nMquh4Ua7CQM3kFecDOP6+zNCjkDW
 nS0/KQf/LaQoQwIYfmyt3X7mify2ivU1YNIrVOS/L8fio0NhXlmpxqXzYw1VZ15a8RLEAndB+8v
 sXhTCwuuVRA5mmMadWXqwo8GnGlHmjm6p/9iQTtnOD0ovxdJd9Pmc69csxJ0tdtXATSQV/1cUpT
 +tXtOg7tXjqFKE3fUGK8dWZTlcIqjD0B3mQ0ToT6IKsujq8cgvczF4z6svrwjoz
X-Google-Smtp-Source: AGHT+IGW+6gJLxZY+Aax02ZMZPpaXkEE56Wt69IxPrHWrUaaSKL2/RkoKDbB3hhhE41N86vLyXBdRA==
X-Received: by 2002:a05:6512:6cb:b0:540:2160:1f79 with SMTP id
 2adb3069b0e04-54099b69b26mr3212609e87.51.1734266422335; 
 Sun, 15 Dec 2024 04:40:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13be2sm491481e87.195.2024.12.15.04.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:40:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v8 0/3] drm/msm/dpu: support virtual wide planes
Date: Sun, 15 Dec 2024 14:40:15 +0200
Message-Id: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/OXmcC/23O0W7CIBiG4VsxHI/mBwqIR7uPxQNowZJpMT8V1
 5je+6jJ5hY9/A6+J++NZI/RZ7Lb3Aj6EnNMYx3btw3pBjsePI193YQDb0FxRfvzhZaI08Ue6TX
 2njrvg9OtsgaA1NsZfYhfd/JjX3fAdKLTgN4+IMFaAOBMNcJw2RrKaH+KE86Nszjn4TOV92McL
 aYm4WFVh5inhPO9s8jV/knSz0lFUqCyZhnonNs6/xdbm4r6FRhw+UJQVaiZEHrJjFbySdAPgQl
 4IegqGMNAitAFJbp/wrIs38Eb0WB7AQAA
X-Change-ID: 20240626-dpu-virtual-wide-beefb746a900
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3900;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o3CAU1EODTzcKPocc/8+D8oMugooV1iRvnhbu/Q4A3A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXs4znUjPnubBnxjQjArJ6OVPt2jb33UT1Y/v+
 in8RGD+WOmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ17OMwAKCRCLPIo+Aiko
 1cxYB/0fQEURTCrrdI1BswgvVa69d9grQ3HArczMwM8UTrv8gRsGLimIkwX0VDG6j+JEJxWV0fb
 YTlQ5fMlspASVWbwvtfml0HfML56jvQMd5wPtOvckP+/hs6I1rZmNOGlIj6rxqpR6Qh4jRbfZmQ
 BY6UB+fT9HzRoupLwxxcRs8TBRSubpR8ZtGs94VZ5Dv6vKvM/pl2n/KVKtttLstZr8znQPeDAoc
 BSBse4WL3GSqLyJ6zv5Y8T2AHrab646+Rv8lw1I+04N2TEEEBOZ7oeVB3vqSfvh2Hy4++Vmk0Zl
 Ma3h7iu7kmpM0nsZLxjRDok2cx6FcectR4Lh8N72jESCvWSZ
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

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Unlike v1 and v2 this series finally includes support for
additional planes - having more planes than the number of SSPP blocks.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

IGT tests were manually exectuted at [2].

[1] https://patchwork.freedesktop.org/series/99909/
[2] https://gitlab.freedesktop.org/drm/msm/-/merge_requests/142/pipelines

---
Changes in v8:
- Fixed missing argument description in dpu_rm_release_all_sspp()
- Link to v7: https://lore.kernel.org/r/20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org

Changes in v7:
- Unify code between dpu_plane_atomic_check() and
  dpu_plane_virtual_assign_resources() (Abhinav)
- Link to v6: https://lore.kernel.org/r/20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org

Changes in v6:
- Renamed dpu_plane_atomic_check_nopipe() ->
  dpu_plane_atomic_check_nosspp() and dpu_plane_atomic_check_pipes() ->
  dpu_plane_atomic_check_sspp() (Abhinav)
- In dpu_rm_reserve_sspp() replaced hweight usage with explicit type
  allocation (Abhinav)
- In dpu_plane_atomic_check() set r_pipe->sspp (Jun Nie)
- In dpu_rm_reserve_sspp() check hw_sspp->ops.setup_scaler to rule out
  SSPP blocks with unsupported scaler blocks (RGB, QSEED2)
- Link to v5: https://lore.kernel.org/r/20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org

Changes in v5:
- Dropped extra dpu_kms instance from dpu_plane_atomic_check() (Abhinav)
- Use DRM_PLANE_NO_SCALING instead of (1 << 16) (Abhinav)
- Dropped excess returns documentation for dpu_rm_reserve_sspp() (Sui
  Jingfeng, Abhinav)
- best_weght -> best_weight (Abhinav)
- Moved drm_rect_width() call back to the the patch "split
  dpu_plane_atomic_check()" (Abhinav)
- Got rid of saved_fmt / saved dimensions (Abhinav)
- Expanded the commit message to describe SSPP allocation per CRTC id
  (Abhinav)
- Added comment on why the size change also causes resource reallocation
  (Abhinav)
- Dropeed several last "feature" patches, leaving only SSPP reallocation
  and using 2 SSPPs per plane for now. The rest will be submitted
  separately.

Changes since v3:
- Dropped the drm_atomic_helper_check_plane_noscale (Ville)
- Reworked the scaling factor according to global value and then check
  if SSPP has scaler_blk later on.
- Split drm_rect_fp_to_int from the rotation-related fix (Abhinav)

Changes since v2:
- Dropped the encoder-related parts, leave all resource allocation as is
  (Abhinav)
- Significantly reworked the SSPP allocation code
- Added debugging code to dump RM state in dri/N/state

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

---
Dmitry Baryshkov (3):
      drm/msm/dpu: add support for virtual planes
      drm/msm/dpu: allow using two SSPP blocks for a single plane
      drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 396 ++++++++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  89 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  14 ++
 7 files changed, 498 insertions(+), 78 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240626-dpu-virtual-wide-beefb746a900

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

