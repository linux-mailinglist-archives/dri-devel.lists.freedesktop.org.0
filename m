Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AADD7A6488
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 15:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8358210E065;
	Tue, 19 Sep 2023 13:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFFD10E065
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 13:12:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 06D15CE10D9;
 Tue, 19 Sep 2023 13:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB33C433C8;
 Tue, 19 Sep 2023 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695129159;
 bh=h2d40gRRDg+4w6KTalAckJrE456R7ViRjsltuKRGOwM=;
 h=From:To:Cc:Subject:Date:From;
 b=hxXeO9SBBqE3U+tBGC5eNZW+uRTmcZPplV2nMDgH1zmBKS8rCuQNhrPOq8rMhC+jy
 wyGWIZlGi4nteUJwzUirA86SF6vz9syRGDqanrM3xty2Sv/kXpBnSM+XigqtyVVLxh
 Ww5Wb8IAOlTNiVqukT915c7xk05y9VfSpLfzYomKH/2LqOF89xyUxVxiP1w3dZleo/
 r64kCkgwRMoH1lthkNnbRjKE9guDBSLlZKOE694mYM2Ak6r56mFBzNeFu/PbONUTK9
 R/f0MVe5HQOaHO/YgTS+r74IFExoItKrrpsUpHdFnkjey+A8pPHg7OtXqv7IJtmIua
 pyo+Z4mM5wy7Q==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] MAINTAINERS: Update drm-misc entry to match all drivers
Date: Tue, 19 Sep 2023 15:12:35 +0200
Message-ID: <20230919131235.759959-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had a number of times when a patch slipped through and we couldn't
pick them up either because our MAINTAINERS entry only covers the
framework and thus we weren't Cc'd.

Let's take another approach where we match everything, and remove all
the drivers that are not maintained through drm-misc.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..757d4f33e158 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
 S:	Maintained
 W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/
+F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
-F:	drivers/gpu/drm/*
+F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
-F:	include/drm/drm*
+F:	include/drm/drm
 F:	include/linux/vga*
-F:	include/uapi/drm/drm*
+F:	include/uapi/drm/
+X:	drivers/gpu/drm/amd/
+X:	drivers/gpu/drm/armada/
+X:	drivers/gpu/drm/etnaviv/
+X:	drivers/gpu/drm/exynos/
+X:	drivers/gpu/drm/gma500/
+X:	drivers/gpu/drm/i915/
+X:	drivers/gpu/drm/imx/
+X:	drivers/gpu/drm/ingenic/
+X:	drivers/gpu/drm/kmb/
+X:	drivers/gpu/drm/mediatek/
+X:	drivers/gpu/drm/msm/
+X:	drivers/gpu/drm/nouveau/
+X:	drivers/gpu/drm/radeon/
+X:	drivers/gpu/drm/renesas/
+X:	drivers/gpu/drm/tegra/
 
 DRM DRIVERS FOR ALLWINNER A10
 M:	Maxime Ripard <mripard@kernel.org>
-- 
2.41.0

