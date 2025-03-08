Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BDA57677
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 01:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F6810EBBB;
	Sat,  8 Mar 2025 00:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tmxc3X9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B4510EBBB;
 Sat,  8 Mar 2025 00:02:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4ECEA4562C;
 Fri,  7 Mar 2025 23:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C61C4CEE5;
 Sat,  8 Mar 2025 00:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741392156;
 bh=sv0z2i271sLcYXMwXuCh8oJoHQPmuOM3lbEjxtsEYSc=;
 h=From:Date:Subject:To:Cc:From;
 b=tmxc3X9QY1L548O/4YBVNDxEfnblVhiXvcUc5wYqvpcWvfRfqTukC0DYL1v1rGAtu
 cRcX4gDiaN7d4TIfkRZQ+EKn7IeM6k+19qnb00Egh+/bL4UWBAYzbGjZWakg8zT17Q
 s5hTfr+Gko3Lk/IT69/0Is9wzOUmfyPacedVdb+vKR7Ed16l74bq99goc4KIy5jpte
 /f67mcOB9jgRQWykMHulXJY3pYyP9tQQaQ4p+KeWMwa/QmB6c5bcG8Q7XQImY9lD/V
 dMqkE7gOt+pMXJreRTc50CiR6zfCamx7fK4kuEkIGUotLNrYVQph0xj89nIcPQrORd
 bi4XPvLrOORQg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 02:02:21 +0200
Subject: [PATCH] drm/msm/dpu: drop wb2_formats_rgb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-dpu-drop-wb2-rgb-v1-1-f5503fcd1bc2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAyJy2cC/x2MywqAIBAAf0X23IIaQvUr0SFzq72krPSA8N+TT
 sMcZl7IJEwZBvWC0MWZ41HFNAqWfT42Qg7VwWrrdKs7DOnEIDHh7S3K5pG63llN3lRCzZLQys+
 /HKdSPjfjJsJiAAAA
X-Change-ID: 20250308-dpu-drop-wb2-rgb-e89520eb1895
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EOtjiLQMv2fwvuf/Yb/mRhhdNPCaVvy3NMCUZU0syAs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny4kZmuKTVnAzQdUndCI36m92REaQw0uUC/NXU
 W8nSrWC/oOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8uJGQAKCRCLPIo+Aiko
 1VBMCACWKdyzWyJCgqqaZ+zr2EUMR3YhiBc80tZa5Qq0HhHvgA1pW5lPGbw8Knq+Y7WInPEqjZL
 2ZV+BU20rBvcyaBK0otgGHCMISL48MmqTqf9ki+k2N858VGGvLddJYyDlUbJ5ZH5rU9mS1XekeA
 tiEzaCc20VrkI9wF3IEmPeuQfv0Xxe0sF74r11EqnEOx+dchWIXKT5HuytObVWPGXacOfnPQSkl
 WuOw6gWGAQAORFePfiwRMfukEplVWQOaoHPmaHPse+icfC5DaVwBkzt9f0ul0OfMIdnPXnA1pIr
 OfoLSlVkybWFbYb+j1/J7RvLJepX1pAZpMMkSyFGzPCeyt3Q
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

After enabling YUV support for writeback on a variety of DPU hardware,
the wb2_formats_rgb is now unused. Drop it following the report of LKP.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503071857.oZbQsPaE-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 31 --------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a6bb46b201e907566e88abce945507d1bab51b3b..64265ca4656a04d8c5a1d9582d7124c7eb897099 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -232,37 +232,6 @@ static const u32 rotation_v2_formats[] = {
 	/* TODO add formats after validation */
 };
 
-static const u32 wb2_formats_rgb[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR565,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_RGBA8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_RGBX8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB1555,
-	DRM_FORMAT_RGBA5551,
-	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_RGBX5551,
-	DRM_FORMAT_ARGB4444,
-	DRM_FORMAT_RGBA4444,
-	DRM_FORMAT_RGBX4444,
-	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_ABGR1555,
-	DRM_FORMAT_BGRA5551,
-	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_BGRX5551,
-	DRM_FORMAT_ABGR4444,
-	DRM_FORMAT_BGRA4444,
-	DRM_FORMAT_BGRX4444,
-	DRM_FORMAT_XBGR4444,
-};
-
 static const u32 wb2_formats_rgb_yuv[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,

---
base-commit: 54143d20fce136123fa4d48487a71747f842bdc3
change-id: 20250308-dpu-drop-wb2-rgb-e89520eb1895

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

