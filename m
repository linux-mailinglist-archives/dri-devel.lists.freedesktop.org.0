Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401D39FDA0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6816E40D;
	Tue,  8 Jun 2021 17:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F256A6E3F7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:29:58 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id u13so11220706qvt.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BWdUHYABGQBcW7qRBGmaQ5V1B5iD59ixtAUGymm7Ips=;
 b=mglUamcHTUrXGpi+HCG4/zPyEt9p5+jjSw5pKHrNurnvu3bcDgrxFYpXjKpGggjJx6
 6RPbSO9qTt4hBl8Ye2MyxoOuaimqaREYHCv37Q2Jt/ib859AAHLd7rrJdo80ASyeDVpc
 HfcLSx5eelQ2wIx4QjIgEuf311i8Y+V27Z9Mpx7oFtmMxnmArhSYFKA7IzVCh70pyHg7
 0lFZvEfQOTwhI0JuVf5kWIeKUI3DQogAWbyIS2EXPUbOOnnFrDgXbkbHvynIx38IW7uy
 nSXrwk9lJL+OIl3dv95Sp7NUZ3sxSODWklHH1vdxOzZzYZtuWxE+QDOynawVlLFxO7ZQ
 9Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BWdUHYABGQBcW7qRBGmaQ5V1B5iD59ixtAUGymm7Ips=;
 b=PkVyvuFMnphBvGhbTNi7Bzeq6Vzkx+Jmz1vJasHcgVOgMu71JpuQeq8LcAQ3Ojzyh4
 Qqk4uqvJUnDwRFbsqJLTHxRg8izzMGfkcFwaoY5SzJYpFN0n3BoTCf1MmxEdxZX7p2Yo
 /0jQ+z67+u4RBaKqtOu1o1jXdAFHI5vXtDEa0j2Tnrrebs7/9uVzZJG9yAej8MTJfwLn
 c7ICpICk/P2JXX4UnEUcnYWUrCyCxrTNI+/TciZc1BwAWtalngU0ss4sOp5ZWS40MmbV
 qhrPTZN8WqJ9u0Av8mshdpm8cHy+8IYgQhghJLKMpEYWF7JqRRpPQZXBXSPwzYJIi+2R
 eeew==
X-Gm-Message-State: AOAM532a45950P3cX0kJ/g+3Kp5xlMZ9bbcroVcaMp0JplnP9ieRiaBj
 ewahQn3u1zGNgUv6zMxDUTSgSJXsIOG2RwzjifxHeg==
X-Google-Smtp-Source: ABdhPJwPXyMpb5YGJUaGlRRkmOL/YvWlumWst7ROm74Bh2SYd/HotIbTV3dBNM9mXCb4dj9OoNzMQA==
X-Received: by 2002:a0c:d809:: with SMTP id h9mr1194440qvj.47.1623173398195;
 Tue, 08 Jun 2021 10:29:58 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:29:57 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/msm/a6xx: add support for Adreno 660 GPU
Date: Tue,  8 Jun 2021 13:27:43 -0400
Message-Id: <20210608172808.11803-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Adreno 660 to the drm/msm driver. Very similar to A650
on the kernel side.

v2:
 - added AOP PDC path for a650 and use it for a660 too
 - fix UBWC config for a650 (also affects a660)
 - add CP_PROTECT update, and corresponding a660 settings in A660 patch

v3:
 - removed patches already picked up by robclark
 - added patches for missing PC_DBG_ECO_CNTL/GMU_CX_FALNEXT_INTF settings
 - changed a660_protect to exclude CP_PERFCTR_CP_SEL
 - removed 635 id from adreno_is_a650_family
 - squashed a660 patches

Jonathan Marek (5):
  drm/msm: remove unused icc_path/ocmem_icc_path
  drm/msm/a6xx: use AOP-initialized PDC for a650
  drm/msm/a6xx: add GMU_CX_GMU_CX_FALNEXT_INTF write for a650
  drm/msm/a6xx: add missing PC_DBG_ECO_CNTL bit for a640/a650
  drm/msm/a6xx: add support for Adreno 660 GPU

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  53 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h  |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 172 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  33 ++++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  13 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  13 +-
 drivers/gpu/drm/msm/msm_gpu.h              |   9 --
 9 files changed, 248 insertions(+), 56 deletions(-)

-- 
2.26.1

