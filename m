Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA89B56538
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 05:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CC110E057;
	Sun, 14 Sep 2025 03:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wf+auA3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3199910E057
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 03:55:15 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-76e4f2e4c40so2707564b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 20:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757822114; x=1758426914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=eVZlx8kiBc10T/c0EsaVi7149K3UyKg/YmSpJ4DwS0o=;
 b=Wf+auA3fCqF9HQ1/0padurHGXvFkSsZ9PLbPWvnMg4LBuKBWiIIDL5m9xxxHrYpcqk
 LcTPKZZcb0hIv0DhmrKDGv45g+N0zDJD1NRnKM9CXK4Kup+HcsfJjxkuu/NkuKcPCRkX
 Ve3EaRRQghMY8kD9bp+x3fqHzpPvr6iIHdnCAoz0ChXIxd+8y8uEBUf0iZcMJWxL/lat
 3FgefQR9ncmlmnNfyh6l88fVWxJdQ4vxOvXb+ZeSoG8jMeAiGgSYFRNU4Z+ffKNgoIvr
 zVNeq96F9AhtG2XopetycHrRo4DB3tK+3JvsgS9SdZu9oZ6Q3JjVTRRPijbzBhMzgwu/
 7g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757822114; x=1758426914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVZlx8kiBc10T/c0EsaVi7149K3UyKg/YmSpJ4DwS0o=;
 b=ndBFVihpxQVA8osYalC9FWeaKTkRiXiz/KwYt9UJO3AmUtt0Um7a/485wu8wBepLsE
 trsNNltnlFzzcQhl+qAVqIAXfWLTkFIHn7UE9RdTa2+07nQ1TXRNIF9nfUpUYa+E3h65
 gIPHUKkmEgMGKiwvdzzLwfdYjaASB4GGtWQnhjnlUJ1X5kq3X6KN5P/2oh+1J50cTWYb
 ygqIfzJ+SElaZ2dmDKEM3KxJ2ck+PBDkSf/vc8VkjIzursYRxBqzxijbyjBUTek/VZn/
 Awaj4ohI8rmHXgvOqYslLKnbnGBEbFzTvZjwnHLz++IwiQpuVBnPZ9trdwdl/fJRZMJ3
 uo+Q==
X-Gm-Message-State: AOJu0YwEZ9lx4/BWrSZfplJahQxSonnCilggeXrhB3A6Ws1ktbNO1WvZ
 82dQAZllSRv0G8Qory53X4T0eeY7MJR8pnZlwGMt656IGv6/jm06HJL5
X-Gm-Gg: ASbGnctYbDFlac4BmU+C/EVUNSx2oxgp4IoMsX0is3oVvenztTbo3Vxyily0hHu3Ydh
 if9LzUzLSxhBdxgkWdwnekCi0JZskKI76n/JeKdYYIpACuNnbDN0B8VBB38lu+l1cO+GhPzh6ZO
 F1vjKl2RYalaG94UWc4hjYVLsGp3eSFt5cxqmhP0/Id3Jr0XPkWTZUH67Y2HO1+JuENX3RDsRGS
 SOE6hmrSTLmwElnR2Jq7jHtCJLI9eS/vYV4rZ/fuMxdjRLvyW0YRXAP00se+J+X+U2EiQdyphgy
 nvauEFiyYH89Sp7LgNCsgEJ8yq6rgdOYQ+EgKWIXPMuFwHbaneo6UqXYdAuo4siDvy3RGHpmtrK
 FRIiGccXXt7SA4k91BRAxZCUGZCCqZG0O7u/+Gs/qM+qIxkG5ovZEYYLD32yrPQueuAybSyRkv/
 KNyw==
X-Google-Smtp-Source: AGHT+IHKPmLqyKmaJOziOgkGnuRkSWBVPjF9DQcOeFHiHgnYMiPe6kA2dVUDq8LL+GQhOQ/52sYZ1A==
X-Received: by 2002:a05:6a21:9985:b0:24a:b9e:4a62 with SMTP id
 adf61e73a8af0-2602c04eb02mr10505362637.40.1757822114472; 
 Sat, 13 Sep 2025 20:55:14 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32e0c2863e6sm3704274a91.28.2025.09.13.20.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 20:55:14 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Sun, 14 Sep 2025 12:55:06 +0900
Message-Id: <20250914035506.63339-1-inki.dae@samsung.com>
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

   Add Exynos7870 SoC support to Exynos DSI driver and a bug fixup.

Please kindly let me know if there is any problem.

Ps. This PR depends on the following PR being merged first:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18


Thanks,
Inki Dae

The following changes since commit 7ebef12d0c9411c1362cb22c4449747893b7ed2c:

  Merge tag 'exynos-drm-misc-next-for-v6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next (2025-09-14 12:30:31 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.18

for you to fetch changes up to 6a3ac4a08be247d6ebd5da13237aec4898a2c4a4:

  drm/exynos: dsi: add support for exynos7870 (2025-09-14 12:31:47 +0900)

----------------------------------------------------------------
New feature
- Add glue layer support for Exynos7870 DSIM in Exynos DSI driver
  . Introduces Exynos7870 DSIM bridge integration at Exynos DRM DSI layer.

Bug fixups for exynos7_drm_decon.c module
- Remove redundant ctx->suspended state handling
  . Cleans up unused state check logic as call flow is now correctly managed.
  . Fixes an issue where decon_commit() was blocked from decon_atomic_enable() due to incorrect state setting.

----------------------------------------------------------------
Kaustabh Chakraborty (3):
      dt-bindings: display: samsung,exynos7-decon: document iommus, memory-region, and ports
      drm/exynos: exynos7_drm_decon: remove ctx->suspended
      drm/exynos: dsi: add support for exynos7870

 .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  9 ++++++
 3 files changed, 30 insertions(+), 36 deletions(-)
