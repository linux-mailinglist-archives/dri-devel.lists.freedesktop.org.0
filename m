Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A91B671F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7A76EA4A;
	Thu, 23 Apr 2020 22:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403756E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 21:10:22 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h26so5897742qtu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hGEfF7JznP06It+jkOfAQDQc1pJd8JmwvNQgGMabKeI=;
 b=ea0jbfinBVFNiW+VjkmQJcHsJy7+egIybfZNyTsemPXQ7TiuqAkvL6sMrIqM+HBEXz
 17psvgvhDDKqJV8MpbzxEBunSze8Up13OSimKrC0ARAVcsu3qWZLWIHAIZc0+5qrjaQn
 HWOHZ7K5LuiOoQBbc0Bl89x8C9QtWMAiArLKyU1aSiDWNARfspKasO9uaQ2RsocUk9jE
 jbtJTPkfrrXbiKwZcs+3nJiCLd/a9UrycrS/IsPCdre28p4TEG7rTHIPBff1QLiL2Qrd
 dtSsw77LbnE4YZ6WR54jZ29vnWHcMEWoP2MrjeUiTJZLcyN/Ec78MBvB1NDJt6EXARhD
 UFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hGEfF7JznP06It+jkOfAQDQc1pJd8JmwvNQgGMabKeI=;
 b=ZcIrSyRFpksfNXhwKr5EUNMYKM5ncJZc8MPDpOnKulydHcHTdYgvNhUiOMVHufTH/g
 Sh9r2acEoiymhBQOy9CSCWOOhQ9N6FH8ACpNmRK7kKADx+40ALTNKI61uV1SnZbZHstW
 qR17/c+pHDlTLrjyzBiEN7umUYP37ZtbPD+N2EizxFTdsIS/ss7CBeouqRSciArBAbA+
 UNKLXU/bUjeNKjeLUI6G4mN8+xCrZl596+3n2WiV+KNFou64BtoW4Vr3bLpdxUX/JHEH
 umE4SE/pZQWuzu1uM7e2kGBUiAMbuOUWNsZByxH/5YGpuravIGscXmME94PRX5EKxOql
 ty/g==
X-Gm-Message-State: AGi0PuaFs5ZYV1KH19ltCWe5W0sp4KFO8HBQwfA9xoBYexs/qadQNKv+
 RnvLKCUnn2qLxkmuSxNlag5SfbGBlDFngw==
X-Google-Smtp-Source: APiQypIbsUjeczD5kx3I0NgkeV/HdDQwfnk0rn2ZtWZm19J5oyVSkXK/8Ss3zEV9Gpc4MxOe0BduJw==
X-Received: by 2002:aed:249c:: with SMTP id t28mr6130659qtc.169.1587676221224; 
 Thu, 23 Apr 2020 14:10:21 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 14:10:20 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/9] Add support for A640 and A650
Date: Thu, 23 Apr 2020 17:09:12 -0400
Message-Id: <20200423210946.28867-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for A640 and A650 GPUs.

Missing bus scaling, hwcg, and UBWC config, but GPU works without those.

Changes in V2:
Use msm_gem for allocations (first 3 patches are new)
Squashed pdc/rscc patches together
Removed unnecessary "WARN_ON"s in "HFI v2 for A640 and A650"

Changes in V3:
Updated patches 6 and 7 (see commit logs for details)

Jonathan Marek (9):
  drm/msm: add msm_gem_get_and_pin_iova_range
  drm/msm: add internal MSM_BO_MAP_PRIV flag
  drm/msm/a6xx: use msm_gem for GMU memory objects
  drm/msm/a6xx: add A640/A650 to gpulist
  drm/msm/a6xx: HFI v2 for A640 and A650
  drm/msm/a6xx: A640/A650 GMU firmware path
  drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650
  drm/msm/a6xx: enable GMU log
  drm/msm/a6xx: update a6xx_hw_init for A640 and A650

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |  14 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 412 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  37 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h  |  48 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  62 +++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 123 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h      |  50 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  24 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  10 +
 drivers/gpu/drm/msm/msm_drv.h              |   6 +-
 drivers/gpu/drm/msm/msm_gem.c              |  31 +-
 drivers/gpu/drm/msm/msm_gem.h              |   1 +
 drivers/gpu/drm/msm/msm_gem_vma.c          |   6 +-
 14 files changed, 677 insertions(+), 149 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
