Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A28F3F8D3A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 19:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905476E88F;
	Thu, 26 Aug 2021 17:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB9F6E88F;
 Thu, 26 Aug 2021 17:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqsSTHkDfHaNh1BHTJetXZfxpt6Dc4OeY6nWmFtwvHLmXkYYMU0pWra21VVWav6bCQ536JYPv1X9Oza1MkVXezBOf7RPH+q6UyG4tKVXApVYqWW9ZN/nMwjR4ctTDdcRzYHNOpaHShgikUmDEmlu1Gnh+aWeRVpd3P258IgsVZ5BPwJ2NwV5M9IOwB7zXqmjoxlzIGDqTuEbBsQZBHVmh5s2M/jak/UlRS4NubtRJagoPMD1FDMW8VerVAO26XkFlAylJDb4XDfVtjwy4NlWZEa+SZt0TkqSjmxdTHc5cMmDwsEY9fOx9NrS8mRv/ooJZB4xdX4+dzX3t/zZTSsCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=501Kfl0Xxkt8nbKVGVhKaOr4QxrkqapPJ2bjvVwUmQ0=;
 b=IhGKrjkBpbXDQjrCLEdcT2k1T7pMGdDCY47JaqMlBMSNbGdudPavV6CbieKWUKJRuQ5WoLUo5W+4wlhkEHEMCxF5J7TDSOrC44F4qk/obpQRD9QE+WF6sxHdAO/l3LW5zoH9GMdSxEmba4KIqmzVxB9Wvb2DxHRWvABnK+26X0A2Zq0/oFjaSsTbSEN7RqPHYbleOIarIOEJQ83uB8r/z/lXxWRA6IYZlbGX1m/hQhJRkfwirf+OZk+ZU1uHFI8hp/4HK9FsUEMTHVazHRz5jIOgYLLzT/+9Dvk58jENWSmGvH6ftAzDUga8BL4GNh0u4nnYLE6Uic8+wb+6dY7lkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=501Kfl0Xxkt8nbKVGVhKaOr4QxrkqapPJ2bjvVwUmQ0=;
 b=RJMCITUrqz9XM6MzMO7zWAHMBjlhckX7L5iMiPd/HbWxJCmUBlqAGEsGDOlyepztQscKubiUfNpQtG8xNvkoHxj3JIsppNj6uH4giNE5Qlh9D5MnUg6rMngURgKeEaXzgfHKNHFPn71zla5bZIOb5RK2oN6TXCUfVpS6161Uing=
Received: from BN8PR16CA0012.namprd16.prod.outlook.com (2603:10b6:408:4c::25)
 by BL0PR12MB4881.namprd12.prod.outlook.com (2603:10b6:208:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Thu, 26 Aug
 2021 17:27:44 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::12) by BN8PR16CA0012.outlook.office365.com
 (2603:10b6:408:4c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Thu, 26 Aug 2021 17:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 17:27:43 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 26 Aug 2021 12:27:42 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v2 2/4] drm/ttm: Clear all DMA mappings on demand
Date: Thu, 26 Aug 2021 13:27:06 -0400
Message-ID: <20210826172708.229134-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
References: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9391bd9a-0ee8-4817-dedd-08d968b6d028
X-MS-TrafficTypeDiagnostic: BL0PR12MB4881:
X-Microsoft-Antispam-PRVS: <BL0PR12MB488163DA454701D7EAA64C2DEAC79@BL0PR12MB4881.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLDCpqYnqE4QusT1pkhRbEoSRGCGkMgwx1HURH19pUrz81iereEcBPDPizDttJABIiDWlSctNq/FEO25Bdu1vXiIu6/57VgHeywtz0AQZny8v8eFdBR+SZ1EEAQMaj+e/mHylKiLZ8bTf/1KY+KL2N5zEpEiKgbH8hd3Dum6WDafQu5xrFhT2lQxYkpmzif25aXPJGt5qCMRCZPmi1FAosIvh5uqFan+zxKUB3zniknOC890+q/tiHrnRGgHddyq3F9axV0SiAkwg+KVrwh90AttnMq9hvc5PxyhuYg9laQGDpDAEQhsX+rou+miVbUbWb++723XfhS2+94FX6mCs4tBwL9U35xewNExPGuwoagZM+wwzgikSBET8lzxanAL1b+u+aCPyTPeD2SJJ4znmHjmtcSH1mj7WsZVdm5S0I4KZHJW0jq0W9Yi9adZ+okBrkXPi8/o4m2uJihMyGOc6X9yu4R8Eek4qzvKwK3D+0i4wj5R7qWt65HQMEaokdbR/qcCcWgG5UsAxCBdCDWkbKu//Pun7HgVp6z2HKo77lp8x+YKS51gY5w+Yz6sxHEsSjWfSwPGpHR/aHGVrsR1Vq2C09x2xjtkKviwH6vlMULz3LUeGDiEU1dfq30E4r/8+enWCuTnFAymLerLi8enB9WAEq1MYSO4+NlIf1FsgPCmucc61gFAAbrSvg6R7bxdFsZ2LvBIRcBWwpgF9NsLAifGi6+pU0FcyDXBg6zQkNE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(186003)(47076005)(70586007)(8936002)(508600001)(82310400003)(70206006)(2616005)(16526019)(36756003)(1076003)(7696005)(44832011)(83380400001)(4326008)(316002)(81166007)(36860700001)(356005)(6666004)(8676002)(336012)(110136005)(54906003)(426003)(2906002)(86362001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 17:27:43.4872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9391bd9a-0ee8-4817-dedd-08d968b6d028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4881
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

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 45 ++++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_device.h     |  1 +
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 5f31acec3ad7..ea50aba13743 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -245,3 +245,48 @@ void ttm_device_fini(struct ttm_device *bdev)
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
+	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
+		man = ttm_manager_type(bdev, i);
+		if (!man || !man->use_tt)
+			continue;
+
+		while (!list_empty(&man->pinned)) {
+			bo = list_first_entry(&man->pinned, struct ttm_buffer_object, lru);
+			/* Take ref against racing releases once lru_lock is unlocked */
+			ttm_bo_get(bo);
+			list_del_init(&bo->lru);
+			spin_unlock(&bdev->lru_lock);
+
+			if (bo->ttm)
+				ttm_tt_destroy_common(bo->bdev, bo->ttm);
+
+			ttm_bo_put(bo);
+			spin_lock(&bdev->lru_lock);
+		}
+
+		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
+			while (!list_empty(&man->lru[j])) {
+				bo = list_first_entry(&man->lru[j], struct ttm_buffer_object, lru);
+				ttm_bo_get(bo);
+				list_del_init(&bo->lru);
+				spin_unlock(&bdev->lru_lock);
+
+				if (bo->ttm)
+					ttm_tt_destroy_common(bo->bdev, bo->ttm);
+
+				ttm_bo_put(bo);
+				spin_lock(&bdev->lru_lock);
+			}
+		}
+	}
+	spin_unlock(&bdev->lru_lock);
+}
+EXPORT_SYMBOL(ttm_device_clear_dma_mappings);
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index cd592f8e941b..d2837decb49a 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -298,5 +298,6 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 		    struct drm_vma_offset_manager *vma_manager,
 		    bool use_dma_alloc, bool use_dma32);
 void ttm_device_fini(struct ttm_device *bdev);
+void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
 
 #endif
-- 
2.25.1

