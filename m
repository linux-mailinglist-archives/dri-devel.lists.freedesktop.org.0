Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B923463A4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1F26EA79;
	Tue, 23 Mar 2021 15:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C43E6EB2B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jy13so27899392ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOUSgKbb+tmQ6BrVeKX3GQ/KKdKuR8BaRfZ6V+0QOT4=;
 b=PdNm6zM8dkCzDqL3k4NIqcGauz36a1hvKs0EcVaQqVfRO0r6OkTXUIfiKm6c3R+N/4
 4QCL/TJjW/ehjsj2A2AMSeiIZOdB5BBeMjAD9emf5rKD0wVzJ+c5eA2GgFA9gkBT/kcs
 OuXGZXe3Mv41RX4IvKbaS5A6fhF9FBILwUy7eaGELt2wVjchs7JkHOYQ0RkYHqF3LKDK
 +hWG7RUnqVx+lPk5/yU0GxVniXz0Taz3ysubj8DuDgLE6t8ekF/o/thMPGswLts4rsjy
 yMGj2qfd9Fz+RDVawAP0aD0lwUL4U93SjjT8/hc8uZ+GrkprwAfpIO7FLsm+NTcQ1Rzc
 QCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOUSgKbb+tmQ6BrVeKX3GQ/KKdKuR8BaRfZ6V+0QOT4=;
 b=nCgrrYlTJ4jLOlidD1/UkUDbXcSySP133fxC2Fu9e8QcyPhOeg5vysarfBZ1JUdFwn
 5NTanrTF56dOz682pC5YTlgCuUCJ7Ak2gofDOvjOBco3k/xN60KSImu157MBSqjPvaKA
 3Jw7PGceGFcty1qpIuubTvZZ39Ml07yLwBuxC2YWskN8xaQfJYQddB3N/xnXDUTP/j+p
 5SSjpT0dD2I3GBH47K6dF3rwXJlTn3fKcaJgeDCAUZ9AcuvjqfAQCG0X2hb/w9JGfr02
 SbzYrP6K17e7nCRXO3+2+gUv8Ua6sZyd1Pj4A+bVTXC8OcZk8GwQjOxsb8Szu0Uzv43p
 VNhw==
X-Gm-Message-State: AOAM530n4Vv888DKCOj78iow4VyARxsTxsfIEOEP87IaCKkKRRm0tYSW
 1/4CznAfvYHFSpqVbMifcuI=
X-Google-Smtp-Source: ABdhPJzue6N2LpPyzl3guDAdUNcg5kxuK19d7aYM/Y2bGxBU8KIujBuzZgBTweoetJBGMtGtvXH4tA==
X-Received: by 2002:a17:906:c45a:: with SMTP id
 ck26mr5468014ejb.125.1616514861376; 
 Tue, 23 Mar 2021 08:54:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r17sm11535164ejz.109.2021.03.23.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/9] drm/tegra: Various improvements
Date: Tue, 23 Mar 2021 16:54:28 +0100
Message-Id: <20210323155437.513497-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

this fixes a couple of oddities like slightly off DMA masks and add
support for hardware cursors on newer chips as well as support for the
sector layout bit in NVIDIA framebuffer modifiers.

The first patch in this set is a small helper that I think might be
useful to other drivers eventually, but if it isn't it's easily
something I can carry in the Tegra driver. It'd be great to get an
Acked-by on it from one of the drm-misc maintainers so that I can take
it through the Tegra tree.

James, I've added you on Cc on this one because it makes use of the
extended framebuffer modifiers that you introduced a while back to
support the sector layout mux on Tegra194. It'd be great to get your
thoughts on this just so this is used as expected.

Thanks,
Thierry

Thierry Reding (9):
  drm/fourcc: Add macro to check for the modifier vendor
  drm/tegra: dc: Inherit DMA mask
  drm/tegra: dc: Parameterize maximum resolution
  drm/tegra: dc: Implement hardware cursor on Tegra186 and later
  drm/tegra: fb: Add diagnostics for framebuffer modifiers
  drm/tegra: gem: Add a clarifying comment
  gpu: host1x: Add early init and late exit callbacks
  drm/tegra: Count number of display controllers at runtime
  drm/tegra: Support sector layout on Tegra194

 drivers/gpu/drm/tegra/dc.c    | 104 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/dc.h    |   6 ++
 drivers/gpu/drm/tegra/drm.c   |  13 ++++-
 drivers/gpu/drm/tegra/drm.h   |   5 ++
 drivers/gpu/drm/tegra/fb.c    |  10 ++++
 drivers/gpu/drm/tegra/gem.h   |   6 ++
 drivers/gpu/drm/tegra/hub.c   |  41 +++++++++++++-
 drivers/gpu/drm/tegra/plane.c |  32 +++++++++++
 drivers/gpu/host1x/bus.c      |  31 ++++++++++
 include/linux/host1x.h        |   2 +
 include/uapi/drm/drm_fourcc.h |   3 +
 11 files changed, 240 insertions(+), 13 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
