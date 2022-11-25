Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2404B638DC8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 16:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F141010E0DC;
	Fri, 25 Nov 2022 15:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C86410E0DC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 15:52:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id cl5so7356011wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 07:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YP68R/k8Fcse46vkA5Nb2wZsKQ3HMzBXo31FZlWmkHQ=;
 b=PXIDmChUgOSL3k5LwIZkXcMe0jwdZM0Ig3PY//dzcdKsd7z7wtEr/SKeEYfCcU190t
 cz0irXorOOsOpGeY49HWYibDZa0OXrrcqLzO4XeNtsa6kDlhf29DhXTasTC4jtKLK1Jn
 aTHqo/UUpbHJy3GbumuNLmOThIlnEdTvVLMrGPNjA7LGLAEj725FC88LmkR41k/LpqRb
 hOebpcavynI0X6sfrYil+eAyJPU3QKTZS1uUDGg/ArjMeSYU+OjH5054xysm3sfEDQvl
 0q6TVUqrOhBw8Ixhcs+BXGjS7XHkagS2mKWhhzPJgPBTAzxAtk61434Tt4+gdFUZaVtW
 0hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YP68R/k8Fcse46vkA5Nb2wZsKQ3HMzBXo31FZlWmkHQ=;
 b=HcrDmc+ClO00/4r9vIili9bpk7+5WZ4hEezpI39VB1KaiDXHdmX7KF5n4xLx+VqE8B
 2hFUkIlPlUjuNuQIkjzL5JBUArZF2tbXqa997wckFG9Bd1qgGSw2KUtRMXAKE9A1fTzR
 pSfpOqdfiQA77bHZPT/7TGq6TD4wYTUQqlwScE+VG0MGC/8GX1uA5KNsLu6DJ+olUq8+
 47Dy7dZV36zFBiEF08MockiILOyg9MvX3HFqOdw2A/WKowyqGvnYvspk3m7IwfAP2OMy
 J05v7PeAgRK8R3rzriBws6mbfLVFcWf11xqXc9YQKHvyr/rgnJb0bIic27Kmaha4BoFf
 s1YA==
X-Gm-Message-State: ANoB5pnYvprPx8vaYxGqvmSW43EaUup2FiTH5zC5Dr6YgZGwHGA+v2LV
 u4TwbG1Ej1IzrHxTZXjllRVZlKtHCvg=
X-Google-Smtp-Source: AA0mqf6b4yiXqxXVbaM4w7vbJVScQTZEYxOmTjQo+QxKTXqjg4TNdfbfTHmlMerJ55kWlqVyTYnYlQ==
X-Received: by 2002:a05:6000:1c1a:b0:241:d8d8:91fd with SMTP id
 ba26-20020a0560001c1a00b00241d8d891fdmr15351281wrb.452.1669391543554; 
 Fri, 25 Nov 2022 07:52:23 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfeb86000000b00241e5b917d0sm4729955wrn.36.2022.11.25.07.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 07:52:23 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL v2] drm/tegra: Changes for v6.2-rc1
Date: Fri, 25 Nov 2022 16:52:19 +0100
Message-Id: <20221125155219.3352952-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit c2418f911a31a266af4fbaca998dc73d3676475a:

  gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-18 09:33:20 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.2-rc1

for you to fetch changes up to 08fef75f5e17c80cdb9ab56d65685cb43c8e44d3:

  gpu: host1x: Staticize host1x_syncpt_fence_ops (2022-11-25 16:14:59 +0100)

I was a bit confused by the mismatching SHA1 at first, but turns out
that the commit being fixed was originally meant to go into v6.1-rc1
but didn't. So when I rolled forward the for-next branch it got a
different SHA1. Given that there's really nothing to fix here, I've
just squashed the fix into the buggy commit.

I've now also installed a pre-push script that should catch these
kinds of mistakes.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v6.2-rc1

This contains a bunch of cleanups across the board as well as support
for the NVDEC hardware found on the Tegra234 SoC.

----------------------------------------------------------------
Dmitry Torokhov (1):
      drm/tegra: Switch to using devm_fwnode_gpiod_get()

Jani Nikula (1):
      drm/tegra: Convert to using is_hdmi from display info

Liu Shixin (1):
      gpu: host1x: Use DEFINE_SHOW_ATTRIBUTE to simplify debugfs code

Mikko Perttunen (6):
      gpu: host1x: Select context device based on attached IOMMU
      memory: tegra: Add API for retrieving carveout bounds
      gpu: host1x: Add stream ID register data for NVDEC on Tegra234
      drm/tegra: nvdec: Support multiple clocks
      drm/tegra: Add code for booting RISC-V based engines
      drm/tegra: Add Tegra234 support to NVDEC driver

Qing Wang (1):
      drm/tegra: Switch over to vmemdup_user()

Thierry Reding (1):
      gpu: host1x: Staticize host1x_syncpt_fence_ops

Zhang Zekun (1):
      drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()

ruanjinjie (1):
      drm/tegra: Make gather_bo_ops static

 drivers/gpu/drm/tegra/Makefile  |   3 +-
 drivers/gpu/drm/tegra/dc.c      |   4 +-
 drivers/gpu/drm/tegra/drm.c     |   1 +
 drivers/gpu/drm/tegra/hdmi.c    |   9 +--
 drivers/gpu/drm/tegra/nvdec.c   | 171 ++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/tegra/output.c  |  10 +--
 drivers/gpu/drm/tegra/riscv.c   | 106 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/riscv.h   |  30 +++++++
 drivers/gpu/drm/tegra/submit.c  |  13 +--
 drivers/gpu/drm/tegra/uapi.c    |   2 +-
 drivers/gpu/host1x/context.c    |   4 +
 drivers/gpu/host1x/debug.c      |  28 +------
 drivers/gpu/host1x/dev.c        |  12 +++
 drivers/gpu/host1x/fence.c      |   2 +-
 drivers/memory/tegra/mc.c       |  25 ++++++
 drivers/memory/tegra/tegra234.c |   5 ++
 include/linux/host1x.h          |   2 +
 include/soc/tegra/mc.h          |  11 +++
 18 files changed, 362 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/riscv.c
 create mode 100644 drivers/gpu/drm/tegra/riscv.h
