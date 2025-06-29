Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153E1AECBC1
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 10:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A66C10E009;
	Sun, 29 Jun 2025 08:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C3edcZf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A1410E009
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 08:35:59 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso3585032b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751186159; x=1751790959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=6i7vyzfe6J1oONSW9AQ3u4jZM9Km0aZbMXu3VqE5Z3M=;
 b=C3edcZf3qtURGwNBvYw63DNTFuXsJ29ase8jivrH4mgfthIdyjFwhwQDtWzpfnJJGi
 wO2B7+BDwelR1jrXAVUYWHosV2GGR2mKB/3m4l6ree5tfMK/IuLfSvB6+cnTyctHwXMS
 zy2QlHIaOjYSORSzDJKvIpFkTrZJEObgWPekJAIQJVto3DxRjcE09aqC+CMBIyIklxJM
 32pBphgT+94j0JL8AkLUlJBSw84cx6XBCSafIiOYsSSA9aUNYlknrWUbW4W7yXIBo2JW
 zWmDinwCFStqvPpdMIMAoONUJHh4NWVbZFl3NiBf9S+fo+4BjrhGg3VonYdjpdSus0QH
 fdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751186159; x=1751790959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6i7vyzfe6J1oONSW9AQ3u4jZM9Km0aZbMXu3VqE5Z3M=;
 b=DmxZLDz0fFxLf1UCaIUQEO9HA05FsAlL7s4ChYcMbM3lfKmvxsZeVyLmoguaYrq5ZY
 z3jvOjGtDVdEY4A4Mu3+U8RIOM7N1rempr+G6LGoIaDbSEEhnCsEjFez84O6qvATw2HP
 +5NTP8EEeO3g9lBP797zPlmS68g8BVrfVU0rwHY+T7rDMC5QxJv7Wgo5JClJkZlQHKhE
 F1uweycgKMAtxfTdqSxdH/vkF4gjfBRAHIkgftBDgGcsj+yAQ+M4dFAcZuMV4c/KAqPo
 sg5tkb1QOLuzaLDdSxeYJ1WMup4ggSpbc1FWdEXcOuz9LswAj4G73Okef9ir51RsqPJM
 pBUA==
X-Gm-Message-State: AOJu0YzKHxAm7h5CUiGPikQEwOvXPjIQ35epaeKRYpuVUcjD0pTXELlm
 p7XzIxFRHlKbOxHN/Dv7xTKAMhkGlcGs++irhY8IxmQg6AwX5+VZDyQC
X-Gm-Gg: ASbGncvSCO32eIy85rDtdP8e+3NuJ8hcTjKYgHnMEAemBPODWDdi8q7Bl/43ajIaJiI
 pmIcq0+e5UaBDhGVq7iJgWQfgBbFYWpoichh5Knwx4MMstCN7iMRH9jVF78rAlYCCCKYS8SRioX
 fOb9TM9SWAHE0DbFUuTlth+R5IcTM7Mq8eKMdJ60oOu74K8uNjdzimXmFkAtu5GyzqAHZheMI6r
 Kqwk3gD7aeJ43zOOnYlztxVe0FQ0QAXE6h+C1AKFGkcZfNgj5Fr0o5YET2sjhs6xNKwOzI5XKG2
 8Ondzx9uBur0/l0sYphSi7OfvqR4mIDBin0CIAA/ZiR1MOZpElws18oVE3fmSRcKJGuOtRBqwvW
 MXIdw+J27022Fx9CWXPntdx5AygPffeE=
X-Google-Smtp-Source: AGHT+IFjyC42XXzduAZv+zmTuwhrtDybQj1WQjSp+G8pnq0bYkMFkoPgRPCQXQgHMMG70KVVqYUCvA==
X-Received: by 2002:a05:6a00:17a8:b0:73d:fefb:325 with SMTP id
 d2e1a72fcca58-74af6e53e7cmr11215849b3a.5.1751186158792; 
 Sun, 29 Jun 2025 01:35:58 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af55786efsm6262177b3a.82.2025.06.29.01.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 01:35:58 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Sun, 29 Jun 2025 17:35:54 +0900
Message-Id: <20250629083554.28628-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

    Prevented pointer leakage in printk(), fixed kernel panic
    by ensuring DRM driver init and resolved Chromebook lockup
    with runtime PM guards.


Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 9fbceb37c95939182e1409211447a1d3f3db9274:

  Merge tag 'drm-misc-fixes-2025-06-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2025-06-28 06:53:00 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.16-rc4

for you to fetch changes up to 5d91394f236167ac624b823820faf4aa928b889e:

  drm/exynos: fimd: Guard display clock control with runtime PM calls (2025-06-29 16:58:16 +0900)

----------------------------------------------------------------
Fixups
- Fixed raw pointer leakage and unsafe behavior in printk()
  . Switch from %pK to %p for pointer formatting, as %p is now safer
    and prevents issues like raw pointer leakage and acquiring sleeping
    locks in atomic contexts.

- Fixed kernel panic during boot
  . A NULL pointer dereference issue occasionally occurred
    when the vblank interrupt handler was called before
    the DRM driver was fully initialized during boot.
    So this patch fixes the issue by adding a check in the interrupt handler
    to ensure the DRM driver is properly initialized.

- Fixed a lockup issue on Samsung Peach-Pit/Pi Chromebooks
  . The issue occurred after commit c9b1150a68d9 changed
    the call order of CRTC enable/disable and bridge pre_enable/post_disable
    methods, causing fimd_dp_clock_enable() to be called
    before the FIMD device was activated. To fix this,
    runtime PM guards were added to fimd_dp_clock_enable()
    to ensure proper operation even when CRTC is not enabled.

----------------------------------------------------------------
Kaustabh Chakraborty (1):
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

Marek Szyprowski (1):
      drm/exynos: fimd: Guard display clock control with runtime PM calls

Thomas Weißschuh (1):
      drm/exynos: Don't use %pK through printk

 drivers/gpu/drm/exynos/exynos7_drm_decon.c |  4 ++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 12 +++++++++++
 drivers/gpu/drm/exynos/exynos_drm_gem.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c    | 32 +++++++++++++++---------------
 4 files changed, 33 insertions(+), 17 deletions(-)
