Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776CB0DF18
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5910E6CB;
	Tue, 22 Jul 2025 14:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A9A10E6BB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:41:47 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 2BDD61C233B;
 Tue, 22 Jul 2025 16:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdcb:3c00:ce39:8bff:5db4:1ef8])
 by srv01.abscue.de (Postfix) with ESMTPSA id 9DE371C07C3;
 Tue, 22 Jul 2025 16:41:41 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 22 Jul 2025 16:41:11 +0200
Subject: [PATCH v2 09/15] drm: sprd: select REGMAP in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-ums9230-drm-v2-9-054276ec213d@abscue.de>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
In-Reply-To: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
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

When compile-testing this driver with all other drivers disabled,
sprd_dsi.c fails to compile due to a missing definition of struct
regmap_bus. Ensure that this does not happen by declaring the
compile-time dependency on regmap in Kconfig.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
index 1afcdbf6f0ee3304f2297835241c9bb10d422154..828384d42c5aac4bf194558f22d9a77f7c693572 100644
--- a/drivers/gpu/drm/sprd/Kconfig
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -7,6 +7,7 @@ config DRM_SPRD
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
+	select REGMAP
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have a Unisoc chipset.

-- 
2.50.0
