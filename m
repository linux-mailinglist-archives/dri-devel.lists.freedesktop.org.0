Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA161B56477
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 05:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FD010E033;
	Sun, 14 Sep 2025 03:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lmb13uTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B4410E033
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 03:15:31 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-32b863ed6b6so2613939a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757819731; x=1758424531; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sQXmggUMrwrIw1M8m1vWWqZXk8fIFrk0CiERl2VfUlI=;
 b=lmb13uTJo3xwI+LSAYevMbK1biv4e+Ljzmpe4Jkx1Vc7c+ptWuQPHRuPKKAVaoJDFI
 04f4qWtz3b8reDcutBqG7mYGyZji8tgVFZv/F7UXJMES5BaSAnndE81lmHZOWgBz7nox
 KXX0VccGJX7Wtzhpe7VTqEX8U09MKZtHYRXYvjwkoj+ceg+q4BF3QE2PjKm1IfTBcVBX
 C/77ro5eQ/j1bL1TRxdBS9bP9JWBho8nNIwAK4CS6Zk5eeDmc6yrECtV7u1hM5+qJeoe
 zAjXzRsZ9K2GWOaDzypJcOXhrbKeYyWpQxaPPvWbalZ2TeQsMYSAvt2vXn9NF/TUexpE
 vlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757819731; x=1758424531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQXmggUMrwrIw1M8m1vWWqZXk8fIFrk0CiERl2VfUlI=;
 b=p+IPvxNsUKgOC9dFLfMN6OnNjvi0r+twblAj8p+PTtbARaBtCMxz4Q/59xZl/mc6JU
 YYeRbgPCiDaGbiIOmFtrXLTVaey2uFfcBuCh+bvD2xYBjD2Rc2+09p4NwutB2FUpvtcG
 DZzG9ORQVwmJYmSuwNvJDu7j7I98IkmqYz4tkSyQOWBg0uBebB+mwOO/7vxMLmtzYSuO
 SicIpxijAJ89Z2UtgliP/OjDaSre1i+/is+uTEFYHBvdiiXSYzkuWka3foE6AC7Zky9H
 tt74mXuR3XTeX1vdD//LLTPkO/og7uCTC/THA+H0qjuS5hqvEcZswNflgiLL5uc1TH5J
 aTKQ==
X-Gm-Message-State: AOJu0YxAAXUcM+0A1oSpuM3zD6ujKXm7vEzawbMbfpUFR6bx9jFrJqBh
 nruyyktgEBQRTd7XRvRWMlS2Niexsz9dUdYXnX00DeiQAoQFxV1DH/1k
X-Gm-Gg: ASbGncvlXlGNweHmE8VHvBcAitchJh+Zc9Edmbfgy45R9oMDvA+fcjnPcUC3cTPodNH
 WN7RhzU18m41eA+BNMUSjw4bBUd1vINipjnSmayX6RAaLBnOKCJNexzPSLl/ETjIVh8hAyluU8f
 2l64n9hk3j/gIjia++5+R7tywcOZAwu8frqUOSXA7ytloMGLglrzEsIwIRn3xPn3nORDzgHlr3G
 LFQdKKgpZwd7fX33F23WmuCL56L/h6pFzARvRuy5bV/B6ozPz6hinkYIJQtS41+1OVDlKRi8M25
 eiUanKZxnu5V60UrQIOQd1CEJ+RxHa/nxRd4JHqAdN5U2yWvF/zSQMyfSYpTQxEV+T0jlC+7Nfc
 uWVFCRu56yv7/C6wVd3Ra9CH31YV+7eqDqRENcpnxywIj3rlxE/kAtpCpxT69vz4GDd6pPz5wTC
 sfgw==
X-Google-Smtp-Source: AGHT+IFWi3pcyz9EQVpfY6v2lw/9p7EFzqoSsTbbivP4Gpcr3MjF+VaPc8eCawrX7FuIYTVBOeLlVA==
X-Received: by 2002:a17:90b:2785:b0:32b:51ab:5d3e with SMTP id
 98e67ed59e1d1-32de4e7f4c7mr9393697a91.6.1757819731089; 
 Sat, 13 Sep 2025 20:15:31 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd990e44esm10206805a91.28.2025.09.13.20.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 20:15:30 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] drm-misc-next
Date: Sun, 14 Sep 2025 12:15:22 +0900
Message-Id: <20250914031522.33155-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
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

Hi Dave and Daniel,

   Add DSIM bridge drvier support for Exynos7870 SoC.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit c08c931060c7e44452e635e115913dd88214848c:

  drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_free() (2025-09-12 19:04:37 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18

for you to fetch changes up to 17308ab685acba947fb35e52fada2b97f346b8cd:

  drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-14 11:53:09 +0900)

----------------------------------------------------------------
New feature
Add DSIM bridge driver support for Exynos7870
. Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridge driver.
Document Exynos7870 DSIM compatible in dt-bindings
. Adds exynos7870 compatible string and required clocks in device tree schema.

----------------------------------------------------------------
Kaustabh Chakraborty (12):
      drm/bridge: samsung-dsim: support separate LINK and DPHY status registers
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      drm/bridge: samsung-dsim: add ability to define clock names for every variant
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
 drivers/gpu/drm/bridge/samsung-dsim.c              | 353 ++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h                  |  16 +-
 3 files changed, 308 insertions(+), 88 deletions(-)
