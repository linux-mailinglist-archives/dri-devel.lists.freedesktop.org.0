Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0387F9BAB1F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5261410E23B;
	Mon,  4 Nov 2024 03:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eo7uqwmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCAE10E23B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:13:46 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2e3686088c3so2712602a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Nov 2024 19:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730690026; x=1731294826; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=curM5JHWqTItwQpvFipVaydSvgK/Mn5omBdYFQcRouI=;
 b=eo7uqwmW5tnqnXhHzsSid+A6mKxJGyCmkPp0uw6QbqzMPPf4EOZM1fvA0BjT+Uypkm
 RGS+BAb4H/PJz7bjaTcgoVaMYXymGSL4WWKPHln+YQiYFj8E3HqkKtQfmSHVT/j18BOg
 UppxQ1Uz0PcmGuO5f/8sMleoXnMNkVHSvZVVC7Y7tw5LxFhAw6ne+XJiJ+ZT1n7/kFPQ
 eyDWJen2GSg9ZYKze/GjcjhZeNmdqNShGbDS3B9/dzemNggeN7z5Mf3qCX5PlXU/l6+I
 HhRjTMHyq41hn4G9GyQMJk3mhCEho2c9cjNjUPV0Jy3DWnk41GBctOHsJF3Ry+vRCRQB
 S17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730690026; x=1731294826;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=curM5JHWqTItwQpvFipVaydSvgK/Mn5omBdYFQcRouI=;
 b=tx/LCaK7CI2hOC0Y/MZWo8Y0IXaOu5Y59uz/5+uBF85bVciJkjqcJyQLfYsrugtb6x
 oT/sozQH0QDmChA8Kzagaqoemx9945msD/dnmfdMZTDERiQnLxA7ABJnrZKQnN3EZlHv
 TOnnBSxO7wOpmk6LX8IJI5KLh4KUKf4cXxpPSInu9WzmnAtWTOGxBKIA5drc9gKCyoQw
 V2lwDscs5nJzajk15r3xR265abtrFiFLMQ1f3K24Z9MUCgIddOlXBxPae10/ffKTGvS7
 hlFe8ScEfhDMBAxsKsruaqJtf0RBI/DdnNsD5djS2NYteYPIQMe3FLISe9geg48+KG69
 xRVw==
X-Gm-Message-State: AOJu0Yy6jqufkIRcn6e4C7xz50qig4K24CQrcR/1/xIur4Ora5mehsYE
 jcGXCKbUSg2KLjH34ZHxGbngq4Mof5jhPxdm9smKJesZE2tOJx/E
X-Google-Smtp-Source: AGHT+IFn83lnoK/EDpxaIBt/m8+SjryQFVCLNbxO0iVVPjdnvAIpUl7UK+AHchKjQELZWRaTXP9FsQ==
X-Received: by 2002:a17:90a:4811:b0:2e2:8349:239d with SMTP id
 98e67ed59e1d1-2e92cf2ce03mr20646493a91.28.1730690026083; 
 Sun, 03 Nov 2024 19:13:46 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fc0084asm8783053a91.51.2024.11.03.19.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 19:13:45 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Mon,  4 Nov 2024 12:13:41 +0900
Message-Id: <20241104031341.36549-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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

   Add Decon support for Exynos7870 SoC, several fixups and cleanup.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit bcfe43f0ea77c42c2154fb79b99b7d1d82ac3231:

  drm/imx/dcss: include drm/drm_bridge.h header (2024-11-01 13:46:25 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.13

for you to fetch changes up to 53f4b30b05b2a9db6988cb71a785837ee64d2524:

  drm/exynos: exynos7_drm_decon: add driver data and support for Exynos7870 (2024-11-04 10:50:46 +0900)

----------------------------------------------------------------
New feature
- Add Decon driver support for Exynos7870 SoC
  . This patch adds driver data and support for Exynos7870 SoC
    in the Exynos7 Decon driver

Bug fixups for exynos7_drm_decon.c module
- Properly clear channels during bind
  . This patch implements shadow protection/unprotection to clear
    DECON channels properly, preventing kernel panic
- Fix ideal_clk by converting it to HZ
  . This patch corrects the clkdiv values by converting ideal_clk to Hz
    for consistency
- Fix uninitialized crtc reference in functions
  . This patch modifies functions to accept a pointer to
    the decon_context struct to avoid uninitialized references

Cleanups
- Remove unused prototype for crtc
  . This patch removes unused prototypes
      exynos_drm_crtc_wait_pending_update
      exynos_drm_crtc_finish_update
- And just typo fixup

----------------------------------------------------------------
Kaustabh Chakraborty (4):
      drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference in functions
      drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to Hz
      drm/exynos: exynos7_drm_decon: properly clear channels during bind
      drm/exynos: exynos7_drm_decon: add driver data and support for Exynos7870

Kwanghoon Son (1):
      drm/exynos: remove unused prototype for crtc

Shen Lichuan (1):
      drm/exynos: gsc: Fix typo in comment

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 122 +++++++++++++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h   |   3 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    |   2 +-
 drivers/gpu/drm/exynos/regs-decon7.h       |  15 ++--
 4 files changed, 87 insertions(+), 55 deletions(-)
