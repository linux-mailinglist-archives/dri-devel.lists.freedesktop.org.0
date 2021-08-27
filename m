Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63C53FA0B1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 22:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD716E9C5;
	Fri, 27 Aug 2021 20:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE886E9C6;
 Fri, 27 Aug 2021 20:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2YIE6NIq86PSjZZgoMUjB9r6tSVjmsBRuIjqdfS/KLYXOADwkRwtoFyurQYB8ksMlzjo2VsptJc+M1pU97rhxZjpxc5IOVl1DMyOtkNj+tUKemwnHc4BJqKzHH08cRjX24ia+IEueVbxBmNVCSPKo2MaIzIy4c+M5IQGnjeh7dGfWRAxHL6ZC+JgH9RD4s9aFXywEkIRxxs+rKLFtj5wkRfF0hDy+/Vk7npQ5SItEaMOVO/8R7Q6KmHnUlHkQVAwZ/EvoDsCYdBs4kIDe3s2+TeBOKApgv9oYFHKue5R1xtJsKnxDA+ty1KHBUwRL4+71a6E0JAdRMVC66T7hsRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWtM4VO1lQ/H2d5FaEGOYYgYLyUwB2tjgw9djW6jUkY=;
 b=b+HsjbcK8IfttjxvzA16cbqglkgvhXKHGkMYvqFNhG3oNXY6g9k/Cej6CHErEixJ7jHT8MPTx0MkmJsMROj0GGmgubRreNiCtMi3uFNC3qC08uXd9FQ35eSnV+i5Gb7yiQlxRTAZxsvOBBh8y7k4/LK4EnkWmMfQYc+KvoQy6t/Eo+MlHsdQebgBeHKPhKRdYyuquqjbMlI7TGnoYD3TnHAzcndiI2hLsc64/m6VOHRKlxW23xSI4/ZYz8jbcSlKyPHMzx0GTnRxXFyHXmpcdMDi1GqwcU7fT1GZb0RcQvita3lQE/1j6JBiaIbsJ47HR7KfLZkI2TpCk1Pce9JE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWtM4VO1lQ/H2d5FaEGOYYgYLyUwB2tjgw9djW6jUkY=;
 b=kelX/GVbxzowfYy7qsm9EENfamAz82wyecY8W3Lb+DITb2yjTu9P3JBD8mOJRcdLhLuI3VcOXCR6FvPp8uto5DQ7MHAtX89qdR1HOOHSFQ/idE3OlatVuhGfS2w6CA0E6hQnZZSq8irZJiz0Q9L5zjhu5OBXh3in9JbnikBdIL8=
Received: from BN9PR03CA0924.namprd03.prod.outlook.com (2603:10b6:408:107::29)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 27 Aug
 2021 20:39:23 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::40) by BN9PR03CA0924.outlook.office365.com
 (2603:10b6:408:107::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend
 Transport; Fri, 27 Aug 2021 20:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:39:23 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 Aug 2021 15:39:22 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v3 2/4] drm/ttm: Clear all DMA mappings on demand
Date: Fri, 27 Aug 2021 16:39:08 -0400
Message-ID: <20210827203910.5565-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5542454-936e-437c-4338-08d9699ac116
X-MS-TrafficTypeDiagnostic: BL1PR12MB5189:
X-Microsoft-Antispam-PRVS: <BL1PR12MB51894CD1AFED5DFDFF4D00E4EAC89@BL1PR12MB5189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzCDtmbtf+gf6mzOkFJS/RSe0vutVa8fSKeMTMJiNCNh7jE06DrQhCINTCPf23AQR3Zsgb2nr9NP1yhX+KDXb/wp/loEJ+jv2pZyRscKtjRMB6TXakzUrBCpl0IHIOw6Q99piSczrGAZPVXToGOdJkvwuTMg9orQOljJcY+CNfc/pApbCjFtT3J9CGuGlClOp5WMHvRMf1MoDYUU4ltWe7DPzO0HASjqRkyCn2Mb1sWnd0eo44191vTWERw6FGQrnc/j3qYPP2osjSDRHrIHrJDEaCTq4zmDLEV88gg2O/pkJkQ963S4EYOAfWkcqsCROb/AP0Mjv4OO70nAI0kZiC8wZGY9ukTHYO4zUCQl4MyzSV+2atEd7P4LS9suiTnAsc7HOxrlNqpq79ItcKFGFAa/bv/fCk5k9dpV9BNZ8o25u2UyvD9AUCz1kDmmJp993mnObyZ+rakmUeMg3RIIjWL8DHwrK2gjbaZwJFsBktGlCJOwYoC2CWExQk/XfINE8zufyOJGDRA/DsCqIkKLhq21usSQn/3fla74TvDCqcg/HXktM2CywgFGvodWOe+qpr+95MCcam1oJVM+tROeiXIgWZwnzzeJz0TGGfNZq934ZnCrpTNWOKLsp7utkjOfqMQ3y1Sl24NHwDoayckjhzOGRM+cWFHx38AUC9QVzijCRmg+DdFXRxRpYRql755CK39JZt3PjFrqVCbEgktKz2ueh0A2dSGClotU6gn8INM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(36860700001)(2616005)(36756003)(26005)(82310400003)(1076003)(2906002)(16526019)(86362001)(186003)(316002)(83380400001)(8936002)(478600001)(110136005)(426003)(70586007)(6666004)(81166007)(54906003)(82740400003)(5660300002)(356005)(70206006)(336012)(8676002)(7696005)(47076005)(4326008)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:39:23.4557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5542454-936e-437c-4338-08d9699ac116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
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

Used by drivers supporting hot unplug to handle all
DMA IOMMU group related dependencies before the group
is removed during device removal and we try to access
it after free when last device pointer from user space
is dropped.

v3:
Switch to ttm_bo_get_unless_zerom
Iterate bdev for pinned list
Switch to ttm_tt_unpopulate

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 47 ++++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_device.h     |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 530a9c36be37..a691c89f5b20 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -246,3 +246,50 @@ void ttm_device_fini(struct ttm_device *bdev)
 	ttm_global_release();
 }
 EXPORT_SYMBOL(ttm_device_fini);
+
+void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
+{
+	struct ttm_resource_manager *man;
+	struct ttm_buffer_object *bo;
+	unsigned int i, j;
+
+	spin_lock(&bdev->lru_lock);
+	while (!list_empty(&bdev->pinned)) {
+		bo = list_first_entry(&bdev->pinned, struct ttm_buffer_object, lru);
+		/* Take ref against racing releases once lru_lock is unlocked */
+		if (ttm_bo_get_unless_zero(bo)) {
+			list_del_init(&bo->lru);
+			spin_unlock(&bdev->lru_lock);
+
+			if (bo->ttm)
+				ttm_tt_unpopulate(bo->bdev, bo->ttm);
+
+			ttm_bo_put(bo);
+			spin_lock(&bdev->lru_lock);
+		}
+	}
+
+	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
+		man = ttm_manager_type(bdev, i);
+		if (!man || !man->use_tt)
+			continue;
+
+		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
+			while (!list_empty(&man->lru[j])) {
+				bo = list_first_entry(&man->lru[j], struct ttm_buffer_object, lru);
+				if (ttm_bo_get_unless_zero(bo)) {
+					list_del_init(&bo->lru);
+					spin_unlock(&bdev->lru_lock);
+
+					if (bo->ttm)
+						ttm_tt_unpopulate(bo->bdev, bo->ttm);
+
+					ttm_bo_put(bo);
+					spin_lock(&bdev->lru_lock);
+				}
+			}
+		}
+	}
+	spin_unlock(&bdev->lru_lock);
+}
+EXPORT_SYMBOL(ttm_device_clear_dma_mappings);
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 03fb44d061e0..07d722950d5b 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -299,5 +299,6 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 		    struct drm_vma_offset_manager *vma_manager,
 		    bool use_dma_alloc, bool use_dma32);
 void ttm_device_fini(struct ttm_device *bdev);
+void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
 
 #endif
-- 
2.25.1

