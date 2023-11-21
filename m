Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD8B7F3A1F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913810E5A0;
	Tue, 21 Nov 2023 23:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CF410E2D5;
 Tue, 21 Nov 2023 23:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeRjvFuQ9FOkFemN8RjlXk9YS6awxXP1NM9vTc4QGnA7HLqscE/UDgQqV1JlgwHUtjFJho4GYsssxjWZqOdsW2nE5oOSCQg73urkPeUsvMl11TxcaaN61Nc9N8hW5NOCXWftcF804LLgCtrbb6403/Y01SUauHruB1iTjwtAC2pFi0kFPPT1yNN4YNPE1PhMZtevnCcYvHjJ21rvcWnwTC7f655zAHwguGQvMc7eTCm292kQOqdQCY4V0YQslMlAK//ZnhyLF3AundKImv4kMVtYhd8hyE+YVlypp7uQb1MnaUV68Av1B8NkSO9ByljwFl7F99OKgrDc90Je/lfX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6RUTn7k26le8slHS9LlgTldfLCBOm/bn3TMrj0N8is=;
 b=nDm+gp2U38Mz6i3TlW3+WylbMySd04SpusdoilxevQneAnG53RvlMj/Zf9uPHSJ+YR5yKDWoHES61N+idf+vyIpYL9D6ocZ3JJvFTXfTF6HayL3xWTmm8peWNmxTGIomRr/gqxSdJyjcJRrj4itvSGpuWaM1nvN4hN1tHoX0BzyFHEkTYEEeRPTgMt+CDCMz8UnrL6vXnvKqkbY5Rm2OznB3I36ykPsQjvCBr0lCnIAN8QeIYCLPgAv8AnMHDhWmCSxEGAWhEffrmr0FbIRaCd9OWjAxJMZiWPw4VDwGqNjBXU5M103HDhgwxQ+8JX01AMe0XPQl04WOmhMxdYGX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6RUTn7k26le8slHS9LlgTldfLCBOm/bn3TMrj0N8is=;
 b=ymB8bGJFvQj+03i3JK8IxMZKPUXi2ggKfzlTuys0snBQbNqwxQeb7ITNcITP59pOSAlh/Orm/Dvwhb/ugKkLjnoLzmwfxJRPWuRpla4rI8SpjvnSHl6ihxPvAyIuZ45gMtvGRze0Bq78UObEWU9m1ktdojOvDtMgmVPIAZ3X8z4=
Received: from CH0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:610:e5::14)
 by CY8PR12MB7588.namprd12.prod.outlook.com (2603:10b6:930:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 23:11:38 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::5c) by CH0PR03CA0249.outlook.office365.com
 (2603:10b6:610:e5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 23:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 23:11:38 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 17:11:37 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/4] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Date: Tue, 21 Nov 2023 18:11:11 -0500
Message-ID: <20231121231114.703478-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CY8PR12MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: b436f8f1-84ad-42b3-a0b0-08dbeae73725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpZDHanYcbcb3v1IqmDjEU/jEJzInBtPJVpoJxPiZrxPtfVyC4FAwBVTXFdfpWrtlQanmSyc5Lg2iWh4odgOqD+fzk3150FX8rzDyLLPu7l5pdg/zf6suniaMazBGFAfvb1WtGDhgw4vnTVluovcphAU9hdJeejaa32gSK06iJPlz8QO28bO8eDP8DJit0vlNweCEfKMhqBvhLu8i25AfQgSk3HAc97KMWYe9v7z/iSznmB99oeMXfsyUdlU85kA5eBgvpx1kFygByaMU2WBw8e21sbUmZhcS/O/T4Y9rGODJQ92WI3PAWU8QkP1BAow7EHwvm3vXx/50p+WG0ASLOGcuKktd0N/cfdAeAIpaewTWTRM2t1K0GRsJvE+5zEGEECn/eyveGuFCNA0/wXxQ3Fb2KJn7PZqbsf3r2x+Uqz87Gyfl7quQVlyeVHCxqhSKGRPnyPVLZG/4bn16KwLvFN4RSjbwZdrZ6deOTREsQIA+aZIXUpAoY8+8EZCV1Ckp873gfkk0PFD+/XM2JAYoQ3CrYadzfJwCqUJIK+b3jucaAv3ci6IKomieNByrwv4ogWh0Spb9uxxZQftZUzRrpSc6tHztrXos7ZTjQY1UK1LsTjvhv3h/7bf8VuLbjsycItRlB1x/WminPftkqlXFymXDrNn2h0VxfS+xnOhh40lccFW+wcJF46fBb5znXekkGpf1eEr5v0vYtrXR0+D5FxrFU2Zcx5ES02S/+yFcU71ZQSYKKt0Wi4vXNPeGrDubtB81s+/nNT06tg+HswRhw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40480700001)(83380400001)(82740400003)(66574015)(426003)(336012)(1076003)(2616005)(16526019)(26005)(4326008)(8676002)(8936002)(36860700001)(7696005)(47076005)(356005)(81166007)(40460700003)(6666004)(478600001)(54906003)(70586007)(110136005)(70206006)(316002)(41300700001)(36756003)(2906002)(86362001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 23:11:38.5833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b436f8f1-84ad-42b3-a0b0-08dbeae73725
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7588
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
Cc: christian.koenig@amd.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.

These helper functions are needed for KFD to export and import DMABufs
the right way without duplicating the tracking of DMABufs associated with
GEM objects while ensuring that move notifier callbacks are working as
intended.

CC: Christian König <christian.koenig@amd.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
 include/drm/drm_prime.h     |  7 +++++++
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 63b709a67471..834a5e28abbe 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_release);
 
-/*
+/**
  * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
  * @dev: drm_device to import into
  * @file_priv: drm file-private structure
@@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
  *
  * Returns 0 on success or a negative error code on failure.
  */
-static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
-				      struct drm_file *file_priv, int prime_fd,
-				      uint32_t *handle)
+int drm_gem_prime_fd_to_handle(struct drm_device *dev,
+			       struct drm_file *file_priv, int prime_fd,
+			       uint32_t *handle)
 {
 	struct dma_buf *dma_buf;
 	struct drm_gem_object *obj;
@@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 	dma_buf_put(dma_buf);
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
 
 int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
@@ -408,7 +409,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 	return dmabuf;
 }
 
-/*
+/**
  * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
  * @dev: dev to export the buffer from
  * @file_priv: drm file-private structure
@@ -421,10 +422,10 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
  * The actual exporting from GEM object to a dma-buf is done through the
  * &drm_gem_object_funcs.export callback.
  */
-static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
-				      struct drm_file *file_priv, uint32_t handle,
-				      uint32_t flags,
-				      int *prime_fd)
+int drm_gem_prime_handle_to_fd(struct drm_device *dev,
+			       struct drm_file *file_priv, uint32_t handle,
+			       uint32_t flags,
+			       int *prime_fd)
 {
 	struct drm_gem_object *obj;
 	int ret = 0;
@@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
 
 int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
@@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
  * @obj: GEM object to export
  * @flags: flags like DRM_CLOEXEC and DRM_RDWR
  *
- * This is the implementation of the &drm_gem_object_funcs.export functions
- * for GEM drivers using the PRIME helpers. It is used as the default for
- * drivers that do not set their own.
+ * This is the implementation of the &drm_gem_object_funcs.export functions for GEM drivers
+ * using the PRIME helpers. It is used as the default in
+ * drm_gem_prime_handle_to_fd().
  */
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags)
@@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
  * @dev: drm_device to import into
  * @dma_buf: dma-buf object to import
  *
- * This is the implementation of the gem_prime_import functions for GEM
- * drivers using the PRIME helpers. It is the default for drivers that do
- * not set their own &drm_driver.gem_prime_import.
+ * This is the implementation of the gem_prime_import functions for GEM drivers
+ * using the PRIME helpers. Drivers can use this as their
+ * &drm_driver.gem_prime_import implementation. It is used as the default
+ * implementation in drm_gem_prime_fd_to_handle().
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
  * &drm_gem_object_funcs.free hook when using this function.
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index a7abf9f3e697..2a1d01e5b56b 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -60,12 +60,19 @@ enum dma_data_direction;
 
 struct drm_device;
 struct drm_gem_object;
+struct drm_file;
 
 /* core prime functions */
 struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
 				      struct dma_buf_export_info *exp_info);
 void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
 
+int drm_gem_prime_fd_to_handle(struct drm_device *dev,
+			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
+int drm_gem_prime_handle_to_fd(struct drm_device *dev,
+			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
+			       int *prime_fd);
+
 /* helper functions for exporting */
 int drm_gem_map_attach(struct dma_buf *dma_buf,
 		       struct dma_buf_attachment *attach);
-- 
2.34.1

