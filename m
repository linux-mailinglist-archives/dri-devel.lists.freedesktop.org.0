Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B59A49834D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A15610E530;
	Mon, 24 Jan 2022 15:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9293810E530
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:14:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26E436D;
 Mon, 24 Jan 2022 07:14:11 -0800 (PST)
Received: from e126387.arm.com (unknown [10.57.5.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1270D3F793;
 Mon, 24 Jan 2022 07:14:09 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/arm: arm hdlcd select DRM_GEM_CMA_HELPER
Date: Mon, 24 Jan 2022 15:13:57 +0000
Message-Id: <20220124151357.2467149-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carsten Haitzler <carsten.haitzler@arm.com>

Without DRM_GEM_CMA_HELPER HDLCD won't build. This needs to be there too.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 drivers/gpu/drm/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index 58a242871b28..6e3f1d600541 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -6,6 +6,7 @@ config DRM_HDLCD
 	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
 	help
 	  Choose this option if you have an ARM High Definition Colour LCD
 	  controller.
-- 
2.30.1

