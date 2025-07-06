Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF9AFA6D0
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 19:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B6910E2D0;
	Sun,  6 Jul 2025 17:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="hNFbB9uc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E4510E2D0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 17:30:03 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id A90C225CC7;
 Sun,  6 Jul 2025 19:30:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G03BX57gX3CC; Sun,  6 Jul 2025 19:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751823000; bh=4QixqbGy0XLMGNdgyiJE46+isoTboBCUR/vHxQlDSuw=;
 h=From:Subject:Date:To:Cc;
 b=hNFbB9ucboIruz1f9JcTIwVizc0IImZWxPrJPY5e7p3VRNiQ6KwEoFlGVlW3CZAMo
 pHQM/Ql2kuU+nBqkl/Y0ODugYT6fY+gu474Ybl2Aa/8Mf2ONOFrE/Y5sRUC9ZbXaxR
 DG4rdyn6q6XpxC0TSQoaH2T63zfgeVIPcV2QLZKWmCbZCmA+/KU47Exv8qFnkaPQeE
 2PMVdK6oaFja4fgjKeprdWoHPPoNIBaVrnuzo0gAOHxvECyzc/1iUvHxgknSVWqu/t
 8S+4X4QwwZdKWh6rhK12VCZC8hLitokiiCCjnXLl1EFUnZcSq+XY0TAUZJ8Tasi7ec
 LCLYbgP5TnZug==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/2] Samsung Exynos 7870 DECON driver support
Date: Sun, 06 Jul 2025 22:59:44 +0530
Message-Id: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIiyamgC/2XPQQ6DIBAF0Ks0rEsDIyB21Xs0XeiAyqLSgCEa4
 92LJiZtXP5J5v2ZhUQbnI3kfllIsMlF54ccxPVCsK+HzlJncibAQLCKl9RO8+CjCW9qLPqBCgT
 QxnADTUvy1ifY1k27+Hzl3Ls4+jDvBYlv08OqTlbilFGFUiuOHBsmHsbF4P1486Ejm5bgECRTH
 M4CZMEozOdw1EyWZ6H4EeD8TyqyIBshVas1trb+F9Z1/QLJohzdNAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751822991; l=1775;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=4QixqbGy0XLMGNdgyiJE46+isoTboBCUR/vHxQlDSuw=;
 b=AHwu7q2UAAhZXbmj/8AYRvdQoa71glMdtoigvUtfOTaJ5nuJl/G+qwdu7tXKHV6miyJeLd8cX
 1gsE+Zl8ld+AChxIZ4FzfrY556CKa5EjtE4jwIg/V+nZOPDbKjiwQ6Q
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
Changes in v4:
- Drop applied patch [v2 3/3].
- Correct documentation of port dt property.
- Add documentation of memory-region.
- Remove redundant ctx->suspended completely.
- Link to v3: https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org

Changes in v3:
- Add a new commit documenting iommus and ports dt properties.
- Link to v2: https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org

Changes in v2:
- Add a new commit to prevent an occasional panic under circumstances.
- Rewrite and redo [v1 2/6] to be a more sensible commit.
- Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: samsung,exynos7-decon: document iommus, memory-region, and ports
      drm/exynos: exynos7_drm_decon: remove ctx->suspended

 .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------------
 2 files changed, 21 insertions(+), 36 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20240917-exynosdrm-decon-4c228dd1d2bf

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

