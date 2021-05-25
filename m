Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1C93900D2
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 14:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3366EA0B;
	Tue, 25 May 2021 12:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307D96EA04;
 Tue, 25 May 2021 12:22:17 +0000 (UTC)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FqCnk6tmSzmXr7;
 Tue, 25 May 2021 20:19:54 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 20:22:15 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 20:22:14 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dp: remove the repeated declaration
Date: Tue, 25 May 2021 20:22:07 +0800
Message-ID: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function 'dp_catalog_audio_enable' is declared twice, remove the
repeated declaration.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 176a9020a520..f12468dcbb56 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -124,7 +124,6 @@ void dp_catalog_audio_get_header(struct dp_catalog *catalog);
 void dp_catalog_audio_set_header(struct dp_catalog *catalog);
 void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
 void dp_catalog_audio_enable(struct dp_catalog *catalog);
-void dp_catalog_audio_enable(struct dp_catalog *catalog);
 void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
 void dp_catalog_audio_init(struct dp_catalog *catalog);
 void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
-- 
2.7.4

