Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E587B585
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79410E337;
	Thu, 14 Mar 2024 00:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KcB7AdIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D87E10E100
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-513b1e1724bso458381e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374538; x=1710979338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FeiSzTwCi2+P1JIq2YaZveHxo9xBvRmuEUfbA8nH/hg=;
 b=KcB7AdIVltIvrjK2mx2ahqb39MLs4dMcy5VVZR8kjX92aBVpn7cn8bGPbqAT/uGykX
 E0xhddEya2Iv+CCtoMFRnv/ZWDVK9tEuRxdCopa8+BHkzxRaaX8BECm6JhPq/U6JyEGq
 TEtkYhXMEWiW7AR8pvCsFG7E4rCIIWi4uoT15aKzSjtttQEqHhERbfcDYOWPeX9s3efz
 d6IK12K0jJEXXnAOAuqEiFlMU1ZEV43h0LHsNu0aZREEjsYTTQRuwj5Ow8QDiok2tOjZ
 G/Nk0i0souYX2o3mF2nqb+DFTg6+eQyPKKyay6exhoCpfM9Yn2J919ICVA5JxPT/+VDI
 FILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374538; x=1710979338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FeiSzTwCi2+P1JIq2YaZveHxo9xBvRmuEUfbA8nH/hg=;
 b=ohauxy6y1yB0meH7WB6WPF1UTNvRmglCoaWKcTbinDEuBp0o5XmiLC+zxMZj1tDEvW
 LtBvtqCAIjClQNFHCOOeLQU9K6vjEap/ddIAszHT6LTKLKrAq7jGf/CXVq0v3kdKYzWi
 1unhXqOirL2sWNMhSW1U5L15f8QFi6FxZbfJVWS4reXWcDR+DldAvFFG0o0GfHBKHaw9
 oBjkJeHjVh67LDw5EGj27V4kEzx5PXUE/JCvbVtCcMGvNcWSRk4yaYBsPUdXGEtL2rOP
 b2RU7FLIp3j7WqHHOhOq0g2altd67xf7k2n/U6Nz1N45uH+CD6GFQbkScnQqIYkxwW2q
 qBKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWepWDWdTi4fD9jLlyoqxYG1vYtEaPSNiSKjkM+SlUvmERo84C+oog+sLQLBSyozDfzhxC+O9C4Elf/Rc9OwaYaYU4ZyLH6CPkoruUMYGDJ
X-Gm-Message-State: AOJu0YxSmK418kJA9KdkZqewU53qKRc4z/jKpFLcn1tv/1YJ12PUUMWB
 0iz8MkPgQK5vxDyvgC39BcuscfFnLNjsVqThZHBappI9OyEIcQEf9XYXgyJ/hrU=
X-Google-Smtp-Source: AGHT+IFtdclqN3OE7RqShWXdxrVC85SIqVaNFQ57TBoMNm0+PbjGlb49KMOWGCVgP1rVSceRnv/Emg==
X-Received: by 2002:a05:6512:525:b0:512:b2b0:89d with SMTP id
 o5-20020a056512052500b00512b2b0089dmr1615356lfc.28.1710374538324; 
 Wed, 13 Mar 2024 17:02:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 00/13] drm/msm/dpu: support virtual wide planes
Date: Thu, 14 Mar 2024 02:02:03 +0200
Message-Id: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

[1] https://patchwork.freedesktop.org/series/99909/

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

Dmitry Baryshkov (13):
  drm/msm/dpu: take plane rotation into account for wide planes
  drm/msm/dpu: use drm_rect_fp_to_int()
  drm/msm/dpu: move pstate->pipe initialization to
    dpu_plane_atomic_check
  drm/msm/dpu: drop virt_formats from SSPP subblock configuration
  drm/msm/dpu: move scaling limitations out of the hw_catalog
  drm/msm/dpu: split dpu_plane_atomic_check()
  drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
  drm/msm/dpu: add support for virtual planes
  drm/msm/dpu: allow using two SSPP blocks for a single plane
  drm/msm/dpu: allow sharing SSPP between planes
  drm/msm/dpu: create additional virtual planes
  drm/msm/dpu: allow sharing of blending stages
  drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  59 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  20 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 675 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  84 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  28 +
 10 files changed, 779 insertions(+), 152 deletions(-)

-- 
2.39.2

