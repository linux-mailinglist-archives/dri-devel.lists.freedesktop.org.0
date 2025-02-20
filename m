Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80807A3E294
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 18:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66F910E0C7;
	Thu, 20 Feb 2025 17:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQ5kZbJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552CC10E0C7;
 Thu, 20 Feb 2025 17:33:56 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-855a1f50a66so32898439f.3; 
 Thu, 20 Feb 2025 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740072835; x=1740677635; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gxER21wbdJEn1/DEOATqVDO/xV7ARnH3zJrJ/dHAsbw=;
 b=VQ5kZbJbvYwV/L9uAWcEG+dRWwCH3aEaxlM+sElLWhDxWpGQVj3N5TjSOTPbsEsfUl
 sKaZH3Y/a7ixnSIIASnPYln18I3w/NR220jKaDNSNZVBu6Bb624YcH2RzcLK40yXumAg
 23ednYFxR9/+MPKwVbfmJBm4uuMy9H68HoqV3S1KPmYxXQRHr0Bn7BUHHBNSO2TtjlPz
 M87RApbEFDzYkq+JKH2gFHU5km5BlsKomZWxgKgIisj744XocxcdPckOKj3hXhPJyuha
 gsJ1ZdFqXKYyk3Dl2pALZ4JR849wRxb8ImOoXlOn8p+NCzstj/wxrC7PHBx9ZyaXZdiW
 s0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740072835; x=1740677635;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gxER21wbdJEn1/DEOATqVDO/xV7ARnH3zJrJ/dHAsbw=;
 b=EOYbh5sMZ0AnwFOujQvrzK08pheFsXp6jrXUpqgcNAJgUMgFSjBjrpv52JuTBfkxzJ
 JFuINY/dmNeEma+L9h+vFC9WUR5cXefFagj5AGka+D2C3YahoQUEHR0e2r0ZY8Hjo/Tk
 0bwhKVAly4jyEQnkFWGeg2V7+DUXi+FtTqv3MfR2oo2yZDr6FW8iaIu7Z0AILidmY0BO
 kNN5oFAfRnb6Dq/TeGsfi1jLOWM4+BMD8JmFf9/2O2PeOWOfXofgqI9OjmxGSkSIJXTa
 DS83tUiNxbfHYScId7rC/KwM/bnLcy2Afd4AShCArAqLCjlLIAk9jfUfXccHZrNdIQ3Q
 0wXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBmyqhWM57HdT0NZNzTjqrcFs5HCipi4CiA1FFmgsGRXp7QCpwl+dH8p933BRR6y2FlvzUyI6vrqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoshtRv0s5P3CgcjOBy61qU7GXF7oKSPixZXaEVzACTF/I3I+E
 v5RZHpczgVTIfIQxevcB2KzFAu1MBQFGDPJw2SVdEacRqRDGI0UVO4P0ngfTcTlPslNp0roNI1C
 1Pl4HYQdGvYA8wc56/xA+bYRsPfm2BT1N
X-Gm-Gg: ASbGnctdf7EpUpYhEdVDboy1xtb2qfpwZW62cwPV6ChDqYRkzfzLKBaWciW+M22EKbA
 usitfo/2Lwwa1RGM+RsMDMKXZYHfvuviZk3481eFFYv1+xtJG3WGlou2OnlG2ruIlrxSy3FFQqN
 S0oliN/bAyjr5Rm1QoWlFhdpyvbgwX5yI=
X-Google-Smtp-Source: AGHT+IFGwYcN/vp7Fh4H9BvR8I/GiwEabeRWmMmgC/fwrMKjTrncLEvk4UQ9VaGd8Qep4/NNGtnRjtWCpYVEKHWNCPo=
X-Received: by 2002:a05:6e02:3882:b0:3d0:4a82:3f42 with SMTP id
 e9e14a558f8ab-3d2b536ef0amr84272825ab.16.1740072835191; Thu, 20 Feb 2025
 09:33:55 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Feb 2025 09:33:43 -0800
X-Gm-Features: AWEUYZlqKD1Gyp1C5EfK3AsCtFxqBumbtjfPAP1oJTHymGw-8iTynKVDWs30wtk
Message-ID: <CAF6AEGtt2AODBXdod8ULXcAygf_qYvwRDVeUVtODx=2jErp6cA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-02-20 for v6.14-rc4
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
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

Hi Dave, Simona,

A few fixes for v6.14, as described below.

The following changes since commit 866e43b945bf98f8e807dfa45eca92f931f3a032:

  drm/msm: UAPI error reporting (2025-01-03 07:20:28 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-02-20

for you to fetch changes up to 73f69c6be2a9f22c31c775ec03c6c286bfe12cfa:

  drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing
bitclk source (2025-02-15 11:46:42 -0800)

----------------------------------------------------------------
Fixes for v6.14-rc4

Display:
* More catalog fixes:
 - to skip watchdog programming through top block if its not present
 - fix the setting of WB mask to ensure the WB input control is programmed
   correctly through ping-pong
 - drop lm_pair for sm6150 as that chipset does not have any 3dmerge block
* Fix the mode validation logic for DP/eDP to account for widebus (2ppc)
  to allow high clock resolutions
* Fix to disable dither during encoder disable as otherwise this was
  causing kms_writeback failure due to resource sharing between
* WB and DSI paths as DSI uses dither but WB does not
* Fixes for virtual planes, namely to drop extraneous return and fix
  uninitialized variables
* Fix to avoid spill-over of DSC encoder block bits when programming
  the bits-per-component
* Fixes in the DSI PHY to protect against concurrent access of
  PHY_CMN_CLK_CFG regs between clock and display drivers

Core/GPU:
* Fix non-blocking fence wait incorrectly rounding up to 1 jiffy timeout
* Only print GMU fw version once, instead of each time the GPU resumes

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: account for widebus and yuv420 during mode validation

Dmitry Baryshkov (3):
      drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450
      drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
      drm/msm/dpu: correct LM pairing for SM6150

Ethan Carter Edwards (1):
      drm/msm/dpu: Fix uninitialized variable

Jessica Zhang (2):
      drm/msm/dpu: Disable dither in phys encoder cleanup
      drm/msm/dpu: Drop extraneous return in dpu_crtc_reassign_planes()

Konrad Dybcio (1):
      drm/msm/a6xx: Only print the GMU firmware version once

Krzysztof Kozlowski (3):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing
bitclk source

Marijn Suijten (1):
      drm/msm/dpu: Don't leak bits_per_component into random DSC_ENC fields

Rob Clark (1):
      drm/msm: Avoid rounding up to one jiffy

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  8 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  2 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  7 ++-
 drivers/gpu/drm/msm/dp/dp_display.c                | 11 +++--
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 53 +++++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                      | 11 ++---
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 11 ++++-
 15 files changed, 75 insertions(+), 49 deletions(-)
