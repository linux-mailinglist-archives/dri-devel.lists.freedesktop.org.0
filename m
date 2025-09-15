Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60AB577E7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49F410E154;
	Mon, 15 Sep 2025 11:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LZ+FRRFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FDC10E154
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:18:08 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7723f0924a3so4977144b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757935088; x=1758539888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dPBCFvQjoGjl6M/UvssJba2gGE0hvdRSVyr7t5RZfoc=;
 b=LZ+FRRFyw1NZh6rsuv9fwsqovJqWklyEmiSAw4J0qo0urb+OG7jG/AxaYNB4rRMrtT
 Ro/pJy5Wm5vlKMtUZdLMYSwT5uzKdBcsaf58RMV1Rm15VR3CEiZTjSBjjKkTjN2Mxmj6
 QmIzcmzVm7aOrQNGx2X0gyGe6qaeE4Ms8yfcSxYe3g2ton/zICZQXK25ehL8yBDlgvq0
 124tR3Chphfz90Fkf0ninmdu81dLFyAJVDJjUxHgC+kn3Za5ybzMUQ12ZNhALZDcZdwD
 iDFRgYDk0tjQyjj9tf7+bGILIHwsF18E3GykSnj9RptjbQIHEOwfBCpn8FZsEh1BfRoR
 Co0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757935088; x=1758539888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPBCFvQjoGjl6M/UvssJba2gGE0hvdRSVyr7t5RZfoc=;
 b=gO8rvllxWW3eoA2usH7nn0y8a7uifCk6/wUSzYnlI4zhDXO745DE4VutTfp3y/YWsq
 mMvRRyeVUs8IgPTfOPL2du3zBYA07KaHde/w8LyT2miZpEGf2BbsczJYdycqQbAkVOz5
 dEawqLDmA0rgZyBTuoxTjsrL/pcE2IRp0b+8+3uDtUhNsdHCo19autuy6u2PNK1q12S5
 /yml1ZLgYrs1/xNReHwfWc23rINgelRJ5A5jLBtckuuOjPXR9P6GIB5ichNFN2/SVmT5
 CJRK21Z5ZG4D2MbXNhB7sv/xglQWDd5pdlyRqQjqUU6ZkzkPuaSrOl80omKUTHhWj/ON
 ZqNQ==
X-Gm-Message-State: AOJu0Yz6N6GudpLyPMS9aVIHsQWAQNy08UT7KLrLss+8JvjjZmfoMmkp
 mg38sI32UJ9vFe9ii2jXMCzgEh5DvErFULOOEpfpzYXAMlyETb9hY+RhvAwroQ==
X-Gm-Gg: ASbGncuqm5tQA+96uuVsumBY9wK0i6pWAS5DooGGFTqqobey8Z8W2x28FRmewiDjxGY
 D46qBrgJx4KszV1r04JRXi5JoGUOWkXbsViAoEjjg8ljixar933FzicBMCHoTYdenhxpbOtvxtL
 x3DtHGdjAhcP87PNuyFapS9k3y/Di4mgrDZ2WQ1J0GxcnSBsBh16IhmVV97bgM2HsdXjKWhNLzR
 C2tUVqOdGn69EDYN1PuDJHk/F9BsP4F548hDYoCgNqAqDpwPARoPuEQCqD012Zsfv+FRPVmhdgW
 9PMkXSVZOs/ZlEAzO6CK/7MmD2Fx8QgOHt+79MXm5PNKK+SAOveBD1TCV+sIx0WMlaPM6cgh+9D
 sN0QTqiXc0Cgydo0Kal0w8A0kFBxiY+KG++zZQdQO+To/tV7gj/fQsofN6DA8BKwfV90=
X-Google-Smtp-Source: AGHT+IFuA6DOo3xYNnBW2vLLVl6MswxV/SxmI2v41j0DSWY4Op7WYcCOaiCmbbeiiH1rdBQ0BeKksw==
X-Received: by 2002:a05:6a20:7f9e:b0:263:b547:d09c with SMTP id
 adf61e73a8af0-263b547d18amr4017400637.33.1757935088236; 
 Mon, 15 Sep 2025 04:18:08 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dff06dbc5sm7938947a91.17.2025.09.15.04.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 04:18:07 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL RESEND] drm-misc-next
Date: Mon, 15 Sep 2025 20:18:02 +0900
Message-Id: <20250915111802.28177-1-inki.dae@samsung.com>
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


The following changes since commit 0d9f0083f7a5a31d91d501467b499bb8c4b25bdf:

  Merge tag 'v6.17-rc6' into drm-next (2025-09-15 17:51:07 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18

for you to fetch changes up to 77169a11d4e9916f6c22587df396d6128505dbfb:

  drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-15 19:55:15 +0900)

----------------------------------------------------------------
New feature
- Add DSIM bridge driver support for Exynos7870
  . Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridge driver.
- Document Exynos7870 DSIM compatible in dt-bindings
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
