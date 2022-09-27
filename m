Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5075EC4BB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE59010E93B;
	Tue, 27 Sep 2022 13:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E1E10E93B;
 Tue, 27 Sep 2022 13:41:48 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4McLMQ0fqhzHppR;
 Tue, 27 Sep 2022 21:39:30 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:41:45 +0800
From: Yuan Can <yuancan@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Jun.Lei@amd.com>, <Charlene.Liu@amd.com>,
 <jerry.zuo@amd.com>, <agustin.gutierrez@amd.com>, <Nevenko.Stupar@amd.com>,
 <sancchen@amd.com>, <tales.aparecida@gmail.com>,
 <chandan.vurdigerenataraj@amd.com>, <aurabindo.pillai@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Remove unused struct i2c_id_config_access
Date: Tue, 27 Sep 2022 13:39:08 +0000
Message-ID: <20220927133908.103658-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
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
Cc: yuancan@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 5a8132b9f606("drm/amd/display: remove dead dc vbios code"), no one
use struct i2c_id_config_access, so remove it.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 5d70f9901d13..d380cf98b844 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -50,13 +50,6 @@
 #define LAST_RECORD_TYPE 0xff
 #define SMU9_SYSPLL0_ID  0
 
-struct i2c_id_config_access {
-	uint8_t bfI2C_LineMux:4;
-	uint8_t bfHW_EngineID:3;
-	uint8_t bfHW_Capable:1;
-	uint8_t ucAccess;
-};
-
 static enum bp_result get_gpio_i2c_info(struct bios_parser *bp,
 	struct atom_i2c_record *record,
 	struct graphics_object_i2c_info *info);
-- 
2.17.1

