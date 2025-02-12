Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192BBA31FA9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F7D10E7BF;
	Wed, 12 Feb 2025 07:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Wed, 12 Feb 2025 07:09:44 UTC
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828DF10E13E;
 Wed, 12 Feb 2025 07:09:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-01 (Coremail) with SMTP id qwCowAAXHW24R6xnvvadDA--.50898S2;
 Wed, 12 Feb 2025 15:03:25 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, YiPeng.Chai@amd.com, tao.zhou1@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Remove redundant return value checks for
 amdgpu_ras_error_data_init
Date: Wed, 12 Feb 2025 15:03:02 +0800
Message-ID: <20250212070302.806-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXHW24R6xnvvadDA--.50898S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw17Xw4UZrW7Xw4fXrW3Awb_yoWxJrW7pF
 WrJw1DZryUZFnrJrykAFyDuasIyw1SvFy8KF40ya4I93W5CrW5XF1rtw40q3ZrKr4DCwsI
 vrWDW3yUWF1qvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeJ5rDUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ8LA2esAO-aZgAAsW
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

The function amdgpu_ras_error_data_init() always returns 0, making its
return value checks redundant. This patch changes its return type to
void and removes all unnecessary checks in the callers.

This simplifies the code and avoids confusion about the function's
behavior. Additionally, this change keeps the usage consistent with
amdgpu_ras_do_page_retirement(), which also does not check the return
value.

Fixes: 5b1270beb380 ("drm/amdgpu: add ras_err_info to identify RAS error source")
Cc: stable@vger.kernel.org # 6.7+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 19 +++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c |  8 ++------
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c  |  3 +--
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c  |  3 +--
 5 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 4c9fa24dd972..aef1b2b713a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -182,9 +182,7 @@ static int amdgpu_reserve_page_direct(struct amdgpu_device *adev, uint64_t addre
 		return 0;
 	}
 
-	ret = amdgpu_ras_error_data_init(&err_data);
-	if (ret)
-		return ret;
+	amdgpu_ras_error_data_init(&err_data);
 
 	memset(&err_rec, 0x0, sizeof(struct eeprom_table_record));
 	err_data.err_addr = &err_rec;
@@ -687,8 +685,7 @@ static struct ras_manager *amdgpu_ras_create_obj(struct amdgpu_device *adev,
 	if (alive_obj(obj))
 		return NULL;
 
-	if (amdgpu_ras_error_data_init(&obj->err_data))
-		return NULL;
+	amdgpu_ras_error_data_init(&obj->err_data)
 
 	obj->head = *head;
 	obj->adev = adev;
@@ -1428,9 +1425,7 @@ static int amdgpu_ras_query_error_status_with_event(struct amdgpu_device *adev,
 	if (!obj)
 		return -EINVAL;
 
-	ret = amdgpu_ras_error_data_init(&err_data);
-	if (ret)
-		return ret;
+	amdgpu_ras_error_data_init(&err_data);
 
 	if (!amdgpu_ras_get_error_query_mode(adev, &error_query_mode))
 		return -EINVAL;
@@ -2255,9 +2250,7 @@ static void amdgpu_ras_interrupt_umc_handler(struct ras_manager *obj,
 	if (!data->cb)
 		return;
 
-	ret = amdgpu_ras_error_data_init(&err_data);
-	if (ret)
-		return;
+	amdgpu_ras_error_data_init(&err_data);
 
 	/* Let IP handle its data, maybe we need get the output
 	 * from the callback to update the error type/count, etc
@@ -4623,13 +4616,11 @@ void amdgpu_ras_inst_reset_ras_error_count(struct amdgpu_device *adev,
 	}
 }
 
-int amdgpu_ras_error_data_init(struct ras_err_data *err_data)
+void amdgpu_ras_error_data_init(struct ras_err_data *err_data)
 {
 	memset(err_data, 0, sizeof(*err_data));
 
 	INIT_LIST_HEAD(&err_data->err_node_list);
-
-	return 0;
 }
 
 static void amdgpu_ras_error_node_release(struct ras_err_node *err_node)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index 6db772ecfee4..5f88e70fbf5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -931,7 +931,7 @@ void amdgpu_ras_inst_reset_ras_error_count(struct amdgpu_device *adev,
 					   uint32_t reg_list_size,
 					   uint32_t instance);
 
-int amdgpu_ras_error_data_init(struct ras_err_data *err_data);
+void amdgpu_ras_error_data_init(struct ras_err_data *err_data);
 void amdgpu_ras_error_data_fini(struct ras_err_data *err_data);
 int amdgpu_ras_error_statistic_ce_count(struct ras_err_data *err_data,
 					struct amdgpu_smuio_mcm_config_info *mcm_info,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index 896f3609b0ee..5de6e332c2cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -52,9 +52,7 @@ int amdgpu_umc_page_retirement_mca(struct amdgpu_device *adev,
 	struct ras_err_data err_data;
 	int ret;
 
-	ret = amdgpu_ras_error_data_init(&err_data);
-	if (ret)
-		return ret;
+	amdgpu_ras_error_data_init(&err_data);
 
 	err_data.err_addr =
 		kcalloc(adev->umc.max_ras_err_cnt_per_query,
@@ -230,9 +228,7 @@ int amdgpu_umc_pasid_poison_handler(struct amdgpu_device *adev,
 			};
 			struct ras_manager *obj = amdgpu_ras_find_obj(adev, &head);
 
-			ret = amdgpu_ras_error_data_init(&err_data);
-			if (ret)
-				return ret;
+			amdgpu_ras_error_data_init(&err_data);
 
 			ret = amdgpu_umc_do_page_retirement(adev, &err_data, NULL, reset);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
index a26a9be58eac..d4bdfe280c88 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -364,8 +364,7 @@ static void nbio_v7_4_handle_ras_controller_intr_no_bifring(struct amdgpu_device
 	struct ras_err_data err_data;
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
-	if (amdgpu_ras_error_data_init(&err_data))
-		return;
+	amdgpu_ras_error_data_init(&err_data);
 
 	if (adev->asic_type == CHIP_ALDEBARAN)
 		bif_doorbell_intr_cntl = RREG32_SOC15(NBIO, 0, mmBIF_DOORBELL_INT_CNTL_ALDE);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
index 8a0a63ac88d2..c79ed1adf681 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
@@ -537,8 +537,7 @@ static void nbio_v7_9_handle_ras_controller_intr_no_bifring(struct amdgpu_device
 	struct ras_err_data err_data;
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
-	if (amdgpu_ras_error_data_init(&err_data))
-		return;
+	amdgpu_ras_error_data_init(&err_data);
 
 	bif_doorbell_intr_cntl = RREG32_SOC15(NBIO, 0, regBIF_BX0_BIF_DOORBELL_INT_CNTL);
 
-- 
2.42.0.windows.2

