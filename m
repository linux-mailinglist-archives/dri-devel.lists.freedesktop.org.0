Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C6144D64
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280E16FAE3;
	Wed, 22 Jan 2020 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3710C6F3A2;
 Wed, 22 Jan 2020 07:46:07 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3B4837DF36E01906D82C;
 Wed, 22 Jan 2020 15:46:03 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 15:45:53 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: use true,
 false for bool variable in smu7_hwmgr.c
Date: Wed, 22 Jan 2020 15:53:11 +0800
Message-ID: <1579679591-116290-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

Fixes coccicheck warning:

drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c:723:2-50: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c:733:3-52: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c:747:3-51: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index d70abad..bf04cfe 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -720,7 +720,7 @@ static int smu7_setup_dpm_tables_v0(struct pp_hwmgr *hwmgr)
 		data->dpm_table.vddc_table.dpm_levels[i].value = allowed_vdd_mclk_table->entries[i].v;
 		data->dpm_table.vddc_table.dpm_levels[i].param1 = std_voltage_table->entries[i].Leakage;
 		/* param1 is for corresponding std voltage */
-		data->dpm_table.vddc_table.dpm_levels[i].enabled = 1;
+		data->dpm_table.vddc_table.dpm_levels[i].enabled = true;
 	}

 	data->dpm_table.vddc_table.count = allowed_vdd_sclk_table->count;
@@ -730,7 +730,7 @@ static int smu7_setup_dpm_tables_v0(struct pp_hwmgr *hwmgr)
 		/* Initialize Vddci DPM table based on allow Mclk values */
 		for (i = 0; i < allowed_vdd_mclk_table->count; i++) {
 			data->dpm_table.vddci_table.dpm_levels[i].value = allowed_vdd_mclk_table->entries[i].v;
-			data->dpm_table.vddci_table.dpm_levels[i].enabled = 1;
+			data->dpm_table.vddci_table.dpm_levels[i].enabled = true;
 		}
 		data->dpm_table.vddci_table.count = allowed_vdd_mclk_table->count;
 	}
@@ -744,7 +744,7 @@ static int smu7_setup_dpm_tables_v0(struct pp_hwmgr *hwmgr)
 		 */
 		for (i = 0; i < allowed_vdd_mclk_table->count; i++) {
 			data->dpm_table.mvdd_table.dpm_levels[i].value = allowed_vdd_mclk_table->entries[i].v;
-			data->dpm_table.mvdd_table.dpm_levels[i].enabled = 1;
+			data->dpm_table.mvdd_table.dpm_levels[i].enabled = true;
 		}
 		data->dpm_table.mvdd_table.count = allowed_vdd_mclk_table->count;
 	}
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
