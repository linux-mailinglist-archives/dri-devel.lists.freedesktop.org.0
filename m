Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADA63E5895
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4189FE3;
	Tue, 10 Aug 2021 10:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qq.com (smtpbg480.qq.com [59.36.132.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DBB89FEA;
 Tue, 10 Aug 2021 10:50:05 +0000 (UTC)
X-QQ-mid: bizesmtp38t1628592561t3i6idy1
Received: from localhost.localdomain (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 10 Aug 2021 18:49:19 +0800 (CST)
X-QQ-SSF: 0140000000200030C000B00A0000000
X-QQ-FEAT: G6zDt5+RCFLACr9ra9b07AMSF+tXSXWxZrOY4hjm3B28zxywUvx8NsQnG5OWs
 arJeiUYfiB8F1y7m9rXI2FI12dJ1oW2uwMY98Y8uySq6oXO/RrPUU4STU1t0lqoYV5JM7v3
 uF4NsBhglssNWYGsjF0wuUPSytdW9qm7F998ZNraV2LYxbuI49Dr3bj+iYyZ6h25AU7kiPm
 CLG1HziyT8gdVONkKAN1p8ekk7vn5JQW47zhepzL2Vd011/LOHx+BGGuaoGPADQ/v//Ef1h
 rCzp2356lhx1wOJhCXcrjPDBT0c+6b4Xbitmbf1V3jgbxOLSJbR2D0FS1eZ1Ot9e3bLTfrO
 1SgR1/wJgcItukMLDhwz4T0anV8qw==
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH v3] drm/msm: Remove initialization of static variables
Date: Tue, 10 Aug 2021 18:49:14 +0800
Message-Id: <20210810104914.29419-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
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

Address the following checkpatch errors:
ERROR: do not initialise statics to false

FILE: :drivers/gpu/drm/msm/msm_drv.c:21:
-static bool reglog = false;

FILE: :drivers/gpu/drm/msm/msm_drv.c:31:
-bool dumpstate = false;

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
v3: Subject should start out with drm/msm, not drm/drv 
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..d9ca4bc9620b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 };
 
 #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
-static bool reglog = false;
+static bool reglog;
 MODULE_PARM_DESC(reglog, "Enable register read/write logging");
 module_param(reglog, bool, 0600);
 #else
@@ -76,7 +76,7 @@ static char *vram = "16m";
 MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
 module_param(vram, charp, 0);
 
-bool dumpstate = false;
+bool dumpstate;
 MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
 module_param(dumpstate, bool, 0600);
 
-- 
2.20.1



