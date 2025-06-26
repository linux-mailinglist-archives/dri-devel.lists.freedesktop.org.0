Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A441AEA652
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA05910E2F0;
	Thu, 26 Jun 2025 19:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="cfgEGIK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB7F10E2F0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 19:20:53 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 43249260B3;
 Thu, 26 Jun 2025 21:20:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrQBf9LbrxWq; Thu, 26 Jun 2025 21:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750965645; bh=F5drME/H2x0yXDYGBijt8T+fC00BBnPVtIbKK7Wla90=;
 h=From:Subject:Date:To:Cc;
 b=cfgEGIK5oLeB3XE1aJRZiOc/topaDddu3H+5KwtYmrpCELXS+o9lcEtdVkU6YMAqw
 jwdsTKis6jw+tuuMRZtX4YWEww9nbuuLr9pq/fEGTysVxfkiDFcJj6bU3uNcG+H1uy
 zqhehyxyYkreANKoQgePjWbulMaPTN3/lKsYblC/M7W14OybtZpQymq/si99jNYFc3
 mepd4mnR+W4qQFnKDY59ZpuEDP6dRdW502NUBg0aariog0pccrZCMc2/M8LtJZkfuL
 zexhf8751JoCiJ5a4O4EXRPTFJQxKpHqSsC+qfhX9cXhle8EGSdZug2YiH9KVMq9Re
 Y5eBgvwPzzO6Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/3] Samsung Exynos 7870 DECON driver support
Date: Fri, 27 Jun 2025 00:50:27 +0530
Message-Id: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHudXWgC/2XOwQqDMAyA4VeRntfRZFp1p73H2GEmVXuYHa0UR
 Xz3VcHD8PgH8iWLCMZbE8Q9W4Q30QbrhhS3Syaofw+dkZZTC1SYqxpKaaZ5cIH9R7IhN8icECt
 mYGxakba+3rR22sXnK3Vvw+j8vB+IsE0Pqz5ZEaSSmopKAwE1Kn+wDd658ep8JzYt4iEUSgOeB
 UwCa0rvAFWqKP+FdV1/pr3Nw/IAAAA=
X-Change-ID: 20240917-exynosdrm-decon-4c228dd1d2bf
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750965633; l=1575;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=F5drME/H2x0yXDYGBijt8T+fC00BBnPVtIbKK7Wla90=;
 b=P19wZTZkJiUTW4xG+909e0UrW1ziOcHgEQAG5ZPLLi/lYtIXzLuRKoE+HKtBa5MAXUQqHSErB
 WKc/kO+8Q4uBXCdO9UHxPatIed3cuAkjsV/5rglvVwj2qEQmt9ZORY1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

This patch series aims at adding support for Exynos7870's DECON in the
Exynos7 DECON driver. It introduces a driver data struct so that support
for DECON on other SoCs can be added to it in the future.

It also fixes a few bugs in the driver, such as functions receiving bad
pointers.

Tested on Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2
Core (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Add a new commit documenting iommus and ports dt properties.
- Link to v2: https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org

Changes in v2:
- Add a new commit to prevent an occasional panic under circumstances.
- Rewrite and redo [v1 2/6] to be a more sensible commit.
- Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org

---
Kaustabh Chakraborty (3):
      dt-bindings: display: samsung,exynos7-decon: add properties for iommus and ports
      drm/exynos: exynos7_drm_decon: fix call of decon_commit()
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

 .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c                        | 8 ++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20240917-exynosdrm-decon-4c228dd1d2bf

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

