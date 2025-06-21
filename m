Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6485AE2736
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 05:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D4F10E036;
	Sat, 21 Jun 2025 03:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E66F10E036;
 Sat, 21 Jun 2025 03:26:13 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4bPKW31MYQz5Sfq;
 Sat, 21 Jun 2025 11:26:07 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4bPKVv4g7vz4xBTt;
 Sat, 21 Jun 2025 11:25:59 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bPKVk55gbz8R039;
 Sat, 21 Jun 2025 11:25:50 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
 by mse-fl2.zte.com.cn with SMTP id 55L3PmqI092905;
 Sat, 21 Jun 2025 11:25:48 +0800 (+08)
 (envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app03[null]) by mapi (Zmail) with MAPI id mid201;
 Sat, 21 Jun 2025 11:25:49 +0800 (CST)
Date: Sat, 21 Jun 2025 11:25:49 +0800 (CST)
X-Zmail-TransId: 2afb6856263d54d-d0810
X-Mailer: Zmail v1.0
Message-ID: <20250621112549751vVGpmB0y4iZLN_I_Dzik5@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <alexander.deucher@amd.com>
Cc: <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <hawking.zhang@amd.com>, <kevinyang.wang@amd.com>, <xiang.liu@amd.com>,
 <tao.zhou1@amd.com>, <yanzhen@vivo.com>, <fang.yumeng@zte.com.cn>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <xu.lifeng1@zte.com.cn>,
 <ouyang.maochun@zte.com.cn>, <mou.yi@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYW1kZ3B1OiBVc2Ugc3RyX29uX29mZigpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 55L3PmqI092905
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6856264D.001/4bPKW31MYQz5Sfq
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
index cbc40cad581b..c3c88d8e1ce2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -22,6 +22,7 @@
  */

 #include <linux/list.h>
+#include <linux/string_choices.h>
 #include "amdgpu.h"
 #include "amdgpu_aca.h"
 #include "amdgpu_ras.h"
@@ -873,7 +874,7 @@ static int amdgpu_aca_smu_debug_mode_set(void *data, u64 val)
 	if (ret)
 		return ret;

-	dev_info(adev->dev, "amdgpu set smu aca debug mode %s success\n", val ? "on" : "off");
+	dev_info(adev->dev, "amdgpu set smu aca debug mode %s success\n", str_on_off(val));

 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
index 3ca03b5e0f91..81dcc7ebac3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  *
  */
+#include <linux/string_choices.h>
 #include "amdgpu_ras.h"
 #include "amdgpu.h"
 #include "amdgpu_mca.h"
@@ -519,7 +520,7 @@ static int amdgpu_mca_smu_debug_mode_set(void *data, u64 val)
 	if (ret)
 		return ret;

-	dev_info(adev->dev, "amdgpu set smu mca debug mode %s success\n", val ? "on" : "off");
+	dev_info(adev->dev, "amdgpu set smu mca debug mode %s success\n", str_on_off(val));

 	return 0;
 }
-- 
2.25.1
