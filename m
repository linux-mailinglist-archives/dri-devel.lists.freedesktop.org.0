Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7837A93B9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8909810E5BA;
	Thu, 21 Sep 2023 10:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFBA10E5B7;
 Thu, 21 Sep 2023 10:57:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F2ADB81D2D;
 Thu, 21 Sep 2023 10:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3167DC116A6;
 Thu, 21 Sep 2023 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695293868;
 bh=D4CJzvXGDbUYSM2SUe0zO0nRz+N5sMZBQz4rRqjlLLY=;
 h=From:To:Cc:Subject:Date:From;
 b=ovyCAQunUD8FAaXg9OtUqXZhsrTYi1dn5KtiZMZH/U/3JXJVk4BzPUIQfGjILVryM
 PAltff/R3xr3GdI8B2rcpK+Z1SJ+2YFnH1uS8QZyQfrmtFk7Dar8+1iLruMuxMIGF7
 FECBrYYe4iUw9jKTSyvJIGMUXLaQlp4xE7M8Chg5OjVmmz3t6GZiMd8PaewRSV1Gl1
 MJHlMkDZ7PkbJzKZrrfl85+7hLMj8YBJDlAgTx+tGh4PFAysYBiW5VK5ujJ2T8XWVl
 FZDOJrP45soBmrVYcG1eUSEcmS3wwdCHXknnLO7dO5s56Z/S9eYq1c9lUvDtp0Vu4t
 dkeKkkqt7HFAQ==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2] MAINTAINERS: Update drm-misc entry to match all drivers
Date: Thu, 21 Sep 2023 12:57:43 +0200
Message-ID: <20230921105743.2611263-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Edmund Dea <edmund.j.dea@intel.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 etnaviv@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had a number of times when a patch slipped through and we couldn't
pick them up either because our MAINTAINERS entry only covers the
framework and thus we weren't Cc'd.

Let's take another approach where we match everything, and remove all
the drivers that are not maintained through drm-misc.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Edmund Dea <edmund.j.dea@intel.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org

Changes from v1:
- Remove ingenic and gma500 from the excluded list
---
 MAINTAINERS | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..1012402dada5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6860,12 +6860,27 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
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
+X:	drivers/gpu/drm/i915/
+X:	drivers/gpu/drm/imx/
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

