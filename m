Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C35E2432DA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 05:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8E36E02E;
	Thu, 13 Aug 2020 03:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71436E02E;
 Thu, 13 Aug 2020 03:36:20 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id e5so3337007qth.5;
 Wed, 12 Aug 2020 20:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3YsIH4LmQEWWazGHUZ0k7Mgfr21Zk+t0dzVe2tvcCI=;
 b=i57o7MNyY61UqvqfmUXJcEnocEWmqmChiWGq3/Ndl01G3s9mMLSu+Q+9YuJRTYC330
 YWa+pO08s0ne0pL2JTdiudNS1fOMKWWsSROLnR/QFyfrtaKMNlpQaOH89uwrU2sG9CI4
 d5SpMdXJjkOFeT3GU8GYeeFIyCpl6ePDzv8D4I4N1mk7Q1oRSJu7k5yLkGYOub2GYcKL
 ao3tWAZnKRU4dvBOCFbmcZDA97/zP0Xgnt9nn0flbMBNSmoqCkqcXMzonRrHC9bYuQo8
 NXL+5VsX3X5ZZxAluT16lcZVbj0fCXknvnELBOH4Nb4vbD+/rj/ShQ/5bPpMzEGq1cf0
 I02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3YsIH4LmQEWWazGHUZ0k7Mgfr21Zk+t0dzVe2tvcCI=;
 b=FjOviX6ZKClGONRY8tV/CXTRJeSGRapjjl7nd25WXoOJpkfbToNsaCf89g+Ezv5i3Y
 laukRK9s5wbNV6aNwjz1Ebjsu8fU9gY4sPX+vWozY8/w4hVElpoIE/2QpRg87q+KuKma
 EcN5AQVxNGPrZMl0jvAE5sLeUTvQ092JL6WJre+xjiZOTIEiuH4t/3c3HWMM3i4lSYSL
 WzVUiJDs55FNq6d+DZVG4rAg3SnXTrXKDk5/zJ7r0IjIhsOgXuzH/31jY77KSmLcE0nf
 ASBtIAO95nc/33kDOeZf9QNGL4tKgkzOAdIrAkqw2qtXJ7MfQCbR2nWwdFrlX9J93ezS
 fTTg==
X-Gm-Message-State: AOAM530QCdxThDjb9Vhxo7oeZylV2wd7sYczGsiKSHMHI0mThq5m8WO/
 oVxJeWrmK64CPqEFOFRkKrywlG9j
X-Google-Smtp-Source: ABdhPJwx9/w/+52eu1C9up6WJ4QZI0TP6/D9tPep5qdLVQ64+4+b8369au7UDu9MbojncDwldJkxIg==
X-Received: by 2002:ac8:4747:: with SMTP id k7mr3116481qtp.76.1597289779364;
 Wed, 12 Aug 2020 20:36:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id g4sm4814283qtp.89.2020.08.12.20.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 20:36:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.9
Date: Wed, 12 Aug 2020 23:36:10 -0400
Message-Id: <20200813033610.4008-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.9.

The following changes since commit f87812284172a9809820d10143b573d833cd3f75:

  drm/amdgpu: Fix bug where DPM is not enabled after hibernate and resume (2020-08-07 17:52:15 -0400)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.9-2020-08-12

for you to fetch changes up to f41ed88cbd6f025f7a683a11a74f901555fba11c:

  drm/amdgpu/display: use GFP_ATOMIC in dcn20_validate_bandwidth_internal (2020-08-10 18:09:46 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.9-2020-08-12:

amdgpu:
- Fix allocation size
- SR-IOV fixes
- Vega20 SMU feature state caching fix
- Fix custom pptable handling
- Arcturus golden settings update
- Several display fixes

----------------------------------------------------------------
Anthony Koo (2):
      drm/amd/display: Fix LFC multiplier changing erratically
      drm/amd/display: Switch to immediate mode for updating infopackets

Aric Cyr (1):
      drm/amd/display: Fix incorrect backlight register offset for DCN

Christophe JAILLET (1):
      drm: amdgpu: Use the correct size when allocating memory

Daniel Kolesa (1):
      drm/amdgpu/display: use GFP_ATOMIC in dcn20_validate_bandwidth_internal

Evan Quan (2):
      drm/amd/powerplay: correct Vega20 cached smu feature state
      drm/amd/powerplay: correct UVD/VCE PG state on custom pptable uploading

Jaehyun Chung (1):
      drm/amd/display: Blank stream before destroying HDCP session

Liu ChengZhe (1):
      drm/amdgpu: Skip some registers config for SRIOV

Stylon Wang (1):
      drm/amd/display: Fix EDID parsing after resume from suspend

shiwu.zhang (1):
      drm/amdgpu: update gc golden register for arcturus

 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           | 19 ++++++++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            | 19 ++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  1 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  3 +-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.h    |  2 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    | 16 ++++----
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    | 14 +++++++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  2 +-
 .../drm/amd/display/modules/freesync/freesync.c    | 36 ++++++++++++++----
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 44 ++++++++++------------
 12 files changed, 114 insertions(+), 45 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
