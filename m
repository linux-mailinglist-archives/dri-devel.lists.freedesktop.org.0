Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF089B8DC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97D11121E0;
	Mon,  8 Apr 2024 07:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1022 seconds by postgrey-1.36 at gabe;
 Sun, 07 Apr 2024 09:20:34 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C9110F0F6;
 Sun,  7 Apr 2024 09:20:34 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VC5mK5xgtztRtG;
 Sun,  7 Apr 2024 17:00:49 +0800 (CST)
Received: from canpemm500010.china.huawei.com (unknown [7.192.105.118])
 by mail.maildlp.com (Postfix) with ESMTPS id 4B09414010C;
 Sun,  7 Apr 2024 17:03:29 +0800 (CST)
Received: from canpemm500004.china.huawei.com (7.192.104.92) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Apr 2024 17:03:29 +0800
Received: from huawei.com (10.67.174.111) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 17:03:28 +0800
From: Xiang Yang <xiangyang3@huawei.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>, <swapnil.patel@amd.com>,
 <wayne.lin@amd.com>, <xi.liu@amd.com>, <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <xiangyang3@huawei.com>
Subject: [PATCH -next] drm/amd/display: delete the redundant initialization in
 dcn3_51_soc
Date: Sun, 7 Apr 2024 17:01:31 +0800
Message-ID: <20240407090131.269287-2-xiangyang3@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407090131.269287-1-xiangyang3@huawei.com>
References: <20240407090131.269287-1-xiangyang3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.111]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-Mailman-Approved-At: Mon, 08 Apr 2024 07:45:41 +0000
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

the dram_clock_change_latency_us in dcn3_51_soc is initialized twice, so
delete one of them.

Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
index b3ffab77cf88..f1c0d5b77f1b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
@@ -237,7 +237,6 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_51_soc = {
 	.urgent_latency_adjustment_fabric_clock_component_us = 0,
 	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
 	.num_chans = 4,
-	.dram_clock_change_latency_us = 11.72,
 	.dispclk_dppclk_vco_speed_mhz = 2400.0,
 };
 
-- 
2.34.1

