Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A81995724E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2026B10E337;
	Mon, 19 Aug 2024 17:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l/+eIxfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262010E334;
 Mon, 19 Aug 2024 17:44:56 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-454b12cc82cso15131111cf.1; 
 Mon, 19 Aug 2024 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724089495; x=1724694295; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wgl1BIT1Iozvq+rn/hswreZzgz/VlUWJ1e7JlV7+eKs=;
 b=l/+eIxfSdCc8t9DrQLdjeqAYYvwQlKAPuakSmhMQfsG3ZDjvCkJCYbGfgqGhvYtCga
 vkSqtSF2gmSIiJ2QgW1M8lMShpGEWKEywG7K342i++1Om/D4z630K2ikmFOxLoM64a03
 9PT9MDl2KOCgHVitRu+Hp+CXznm/1l0VjxlkZqHT1Hde2Jwo1k5YcU8F5CsK82Cy8l5V
 hK1mCnBoMmY+R13INIDOvrkFpEA+fEYD4nBrf1FGTIlV3mnr8rXuGtjiD/o10FnQh7QJ
 YS+rHS1DTjrCIK6+fLb/qHRJ5SeH5H5ZmQ97DXqvIaSZe859+tA0TSRSGuRgA7t7ZW2Q
 oCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724089495; x=1724694295;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wgl1BIT1Iozvq+rn/hswreZzgz/VlUWJ1e7JlV7+eKs=;
 b=G0UyKVCzvpeVGy5HFAM0+LlEWH9RZM5CZyNOEinnWagA/RlWqsFBxLqcaRQZA08Jet
 a7nDBGIjp8/+kCC+9bYmFM4DZkiu55u49vozhJvrDAMPah7y3DrePWrLl62FijKOmg3T
 GDMo83NdnfWxhetJkDNlg06T//tfuah5nTzt42XuCA2PORyj3QbWdMO42yV5TvLnZQgs
 soMbcESdzsDS15V23m0PbtKqojHpddp76xfJ7ZhDUxIxPlzbv0qltOamkpg8C1uBwVmK
 OCYhs7vIRzWmxx9eSgXd+W4vXd7r8TilaufIwHfXx06db4D1JL5XXz8NxN6OTDoO5rFt
 kG7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAzekAXmbNg5wzINUXGraz03hkXmRvwFPOBBfcAgkgEwg8addFwafyRbQVEEV+5U1gcByP/pj1Zkh+LrjBkR6PxOGpTiYr3NhF27hTHPBW
X-Gm-Message-State: AOJu0YwPxL7Y7FzePGRbyaUVVTx8wKGpkDRJZ3tmVPaMhVXksqhz6By8
 aRSAh4Ffx3KweICJ8hctphgmdrpwtY7bH+f4BGXdT3+Hc+JLxhsCVNM1kKPr/hf9RtDj8C+WpDe
 DRV0i1ek/59TvbZXh0uXSWOLBugQ=
X-Google-Smtp-Source: AGHT+IHUDWyeHAWncFwmJ3gO/XndoAN8ewNPeGsyFPpfqXOgHze3iG++N1bdhT8TIQWKdZvcy9tcj394w7QRjDtw8nQ=
X-Received: by 2002:a05:622a:2486:b0:451:c93a:5aa5 with SMTP id
 d75a77b69052e-453743ac25bmr164309471cf.56.1724089495295; Mon, 19 Aug 2024
 10:44:55 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 Aug 2024 10:44:42 -0700
Message-ID: <CAF6AEGvxF2p3-AsjUydmSYrA0Vb+Ea7nh3VtNX0pT0Ae_Me-Kw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-08-19 for v6.11-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Dave,

A few fixes for v6.11, see description below.

The following changes since commit fe34394ecdad459d2d7b1f30e4a39ac27fcd77f8:

  dt-bindings: display/msm: dsi-controller-main: Add SM7150
(2024-07-03 05:57:35 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-08-19

for you to fetch changes up to 624ab9cde26a9f150b4fd268b0f3dae3184dc40c:

  drm/msm/adreno: Fix error return if missing firmware-name
(2024-08-15 10:12:07 -0700)

----------------------------------------------------------------
Fixes for v6.11-rc5

1) Fixes from the virtual plane series, namely
   - fix the list of formats for QCM2290 since it has no YUV support
   - minor fix in dpu_plane_atomic_check_pipe() to check only for csc and
     not csc and scaler while allowing yuv formats
   - take rotation into account while allocating virtual planes

2) Fix to cleanup FB if dpu_format_populate_layout() fails. This fixes the
   warning splat during DRM file closure

3) Fix to reset the phy link params before re-starting link training. This
   fixes the 100% link training failure when someone starts modetest while
   cable is connected

4) Long pending fix to fix a visual corruption seen for 4k modes. Root-cause
   was we cannot support 4k@30 with 30bpp with 2 lanes so this is a critical
   fix to use 24bpp for such cases

5) Fix to move dpu encoder's connector assignment to atomic_enable(). This
   fixes the NULL ptr crash for cases when there is an atomic_enable()
   without atomic_modeset() after atomic_disable() . This happens for
   connectors_changed case of crtc. It fixes a NULL ptr crash reported
   during hotplug.

6) Fix to simplify DPU's debug macros without which dynamic debug does not
   work as expected

7) Fix the highest bank bit setting for sc7180

8) adreno: fix error return if missing firmware-name

----------------------------------------------------------------
Abhinav Kumar (4):
      drm/msm/dp: fix the max supported bpp logic
      drm/msm/dpu: move dpu_encoder's connector assignment to atomic_enable()
      drm/msm/dp: reset the link phy params before link training
      drm/msm: fix the highest_bank_bit for sc7180

Dmitry Baryshkov (5):
      drm/msm/dpu: don't play tricks with debug macros
      drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
      drm/msm/dpu: limit QCM2290 to RGB formats only
      drm/msm/dpu: relax YUV requirements
      drm/msm/dpu: take plane rotation into account for wide planes

Rob Clark (1):
      drm/msm/adreno: Fix error return if missing firmware-name

 drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        | 14 ++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 20 +++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c               |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c              | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_mdss.c                 |  2 +-
 8 files changed, 37 insertions(+), 30 deletions(-)
