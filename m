Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD581533CA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 16:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4AD6F60D;
	Wed,  5 Feb 2020 15:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C806F60C;
 Wed,  5 Feb 2020 15:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLxrPpqnEor/kWrTb1j0mbQ476ujF57XmTKw66xyHnd+wmxLVLuwFgXP8Q6rNnbyQ8tUNhsxUEkKfQ6JperJ424MeuU+pqfpgvgKdpFJUWLKfTi/IPb9hK2zGfCtNjFXn9YUhIZIzcmdh0jYJ0ADfdrAnA3+XN8UqXn6uMCuqklz1gxBLRJkZ7pVzLDVchzfpxiEnw6Ck/AaMeV6tpnFxoAsTjC55H0kciJbrfAap1/3qmVgaMyXMa+ksMOGzCCu/Y1pxglfRvi2i1cPlntx3CrFPRWTCla/YJPm5P8ic2Og0PtZ0NCtimNZV7DC93VENIK/AVNjuMEQ7PGiPLDKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Y+s8rIkgHrDO9Sfh3CLYknUHMco2W7iG7I6zMmsWZM=;
 b=YAC27biSFtaA1Gf9kbvyShGn7l+7RP0x0Y96hqzLujUggIU6YhaPFQ04kYltOcLt7M8GkqB6jfXqvNulI2+/fusY+LQgslouEnD9ZIJnDqy/dz6TyyNng8dYiWDSYA8ghaFNoNmMBmSHjbMFyzcv/Jf/pp0gZINZqA5BRbAYoNDx9wJZQKdwjaJxpTQerr8+7VVbZAmMROHnCHs0OaT32W9OhdQWv3cGHYds1yfxJW1sC9bFhKrFhMSH+I77BIygGEdFSEshr7/M7UrCXHyNusdj2tL15O4Uv+E+bfaSsEqPvDqtHrONkAjCPbKt4YmHWXfSqIinMOsBrNZfU5J1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Y+s8rIkgHrDO9Sfh3CLYknUHMco2W7iG7I6zMmsWZM=;
 b=kEK8xJx+UKn3uczxpqz38ilsRw47PEoo2YKWdIJcaHrrA4pOz88rcCPLcncEz33UNxnpWAqrlpdnhyNW4Bqt39+UDTl7McJDhPIoiamK8wBKa+GUYAIBXdpjTYagzbhRNaf0x93uxWb7fneIYCypjRzSvzGWu8EDtaeUPZB7MBg=
Received: from DM5PR12CA0049.namprd12.prod.outlook.com (2603:10b6:3:103::11)
 by DM6PR12MB3001.namprd12.prod.outlook.com (2603:10b6:5:116::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21; Wed, 5 Feb
 2020 15:22:54 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::202) by DM5PR12CA0049.outlook.office365.com
 (2603:10b6:3:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Wed, 5 Feb 2020 15:22:54 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2707.21 via Frontend Transport; Wed, 5 Feb 2020 15:22:53 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 5 Feb 2020
 09:22:53 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 5 Feb 2020 09:22:52 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V6] drm: Add support for DP 1.4 Compliance edid corruption test
Date: Wed, 5 Feb 2020 10:22:48 -0500
Message-ID: <20200205152248.32419-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(428003)(199004)(189003)(81156014)(81166006)(426003)(2616005)(70206006)(478600001)(4326008)(186003)(8936002)(2906002)(8676002)(336012)(110136005)(7696005)(26005)(1076003)(356004)(5660300002)(316002)(6666004)(70586007)(86362001)(54906003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3001; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df973918-ffd1-41db-3a9b-08d7aa4f4562
X-MS-TrafficTypeDiagnostic: DM6PR12MB3001:
X-Microsoft-Antispam-PRVS: <DM6PR12MB30014F074F03746D49023F2BE5020@DM6PR12MB3001.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0304E36CA3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oU75onZnRueLoNCDBAADOTozDzn/JkPoVrHRy3RtS4ejKBN46cDhgSSslm8UTDECq1N4o7ziDEMyKw0H4Jp8paHPO6C+AFSgYYbkOml61Gw0FKYjT7U5sZSpT4eDmUhrfBFhOgtN98xR7d/w1jtXZFXuWBCG7SZwFSdmifteunDJUOdl8BvFFOvKugfoTvzDEXDk3qZtFBDez2z7bZwODGJcWs83+weyDBJ8WWrB8GfKUoeDfhVIDH9CcGPNCsBCLbadfGjwjny0pLg4w5AYfxtuEexoyluxJ5b3dhYR+ruhxxzdLQv/jfVPCrYT/r/lMYVfu1P1/QqIAwMTrBxcILCfVQ/s4578mxRt9bDBf7CW4Uy/9iQc74cnVJWYo7zB0ZHzM/7bG0gyk2Q8sgy6P+jOIzdZYrYyoZFasCTy3d0IUfmUz/Ce5JBQGPjC77yd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 15:22:53.8977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df973918-ffd1-41db-3a9b-08d7aa4f4562
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3001
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
Cc: rodrigo.siqueira@amd.com, manasi.d.navare@intel.com, Jerry.Zuo@amd.com,
 Alexander.Deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike DP 1.2 edid corruption test, DP 1.4 requires to calculate
real CRC value of the last edid data block, and write it back.
Current edid CRC calculates routine adds the last CRC byte,
and check if non-zero.

This behavior is not accurate; actually, we need to return
the actual CRC value when corruption is detected.
This commit changes this issue by returning the calculated CRC,
and initiate the required sequence.

Change since v6
- Add return check

Change since v5
- Obtain real CRC value before dumping bad edid

Change since v4
- Fix for CI.CHECKPATCH

Change since v3
- Fix a minor typo.

Change since v2
- Rewrite checksum computation routine to avoid duplicated code.
- Rename to avoid confusion.

Change since v1
- Have separate routine for returning real CRC.

Signed-off-by: Jerry (Fangzhi) Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 51 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_edid.c      | 23 ++++++++++++---
 include/drm/drm_connector.h     |  6 ++++
 include/drm/drm_dp_helper.h     |  3 ++
 4 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index f629fc5494a4..1efd609df402 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -351,6 +351,57 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
 
+/**
+ * drm_dp_send_real_edid_checksum() - send back real edid checksum value
+ * @aux: DisplayPort AUX channel
+ * @real_edid_checksum: real edid checksum for the last block
+ *
+ * Returns:
+ * True on success
+ */
+bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
+				    u8 real_edid_checksum)
+{
+	u8 link_edid_read = 0, auto_test_req = 0, test_resp = 0;
+
+	if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1) < 1) {
+		DRM_ERROR("DPCD failed read at register 0x%x\n", DP_DEVICE_SERVICE_IRQ_VECTOR);
+		return false;
+	}
+	auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
+
+	if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
+		DRM_ERROR("DPCD failed read at register 0x%x\n", DP_TEST_REQUEST);
+		return false;
+	}
+	link_edid_read &= DP_TEST_LINK_EDID_READ;
+
+	if (!auto_test_req || !link_edid_read) {
+		DRM_DEBUG_KMS("Source DUT does not support TEST_EDID_READ\n");
+		return false;
+	}
+
+	if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1) < 1) {
+		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_DEVICE_SERVICE_IRQ_VECTOR);
+		return false;
+	}
+
+	/* send back checksum for the last edid extension block data */
+	if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM, &real_edid_checksum, 1) < 1) {
+		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_TEST_EDID_CHECKSUM);
+		return false;
+	}
+
+	test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
+	if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
+		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_TEST_RESPONSE);
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
+
 /**
  * drm_dp_downstream_max_clock() - extract branch device max
  *                                 pixel rate for legacy VGA
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 99769d6c9f84..f064e75fb4c5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1590,11 +1590,22 @@ static int validate_displayid(u8 *displayid, int length, int idx);
 static int drm_edid_block_checksum(const u8 *raw_edid)
 {
 	int i;
-	u8 csum = 0;
-	for (i = 0; i < EDID_LENGTH; i++)
+	u8 csum = 0, crc = 0;
+
+	for (i = 0; i < EDID_LENGTH - 1; i++)
 		csum += raw_edid[i];
 
-	return csum;
+	crc = 0x100 - csum;
+
+	return crc;
+}
+
+static bool drm_edid_block_checksum_diff(const u8 *raw_edid, u8 real_checksum)
+{
+	if (raw_edid[EDID_LENGTH - 1] != real_checksum)
+		return true;
+	else
+		return false;
 }
 
 static bool drm_edid_is_zero(const u8 *in_edid, int length)
@@ -1652,7 +1663,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 	}
 
 	csum = drm_edid_block_checksum(raw_edid);
-	if (csum) {
+	if (drm_edid_block_checksum_diff(raw_edid, csum)) {
 		if (edid_corrupt)
 			*edid_corrupt = true;
 
@@ -1793,6 +1804,10 @@ static void connector_bad_edid(struct drm_connector *connector,
 			       u8 *edid, int num_blocks)
 {
 	int i;
+	u8 num_of_ext = edid[0x7e];
+
+	/* Calculate real checksum for the last edid extension block data */
+	connector->real_edid_checksum = drm_edid_block_checksum(edid + num_of_ext * EDID_LENGTH);
 
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2113500b4075..b3815371c271 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1357,6 +1357,12 @@ struct drm_connector {
 	 * rev1.1 4.2.2.6
 	 */
 	bool edid_corrupt;
+	/**
+	 * @real_edid_checksum: real edid checksum for corrupted edid block.
+	 * Required in Displayport 1.4 compliance testing
+	 * rev1.1 4.2.2.6
+	 */
+	u8 real_edid_checksum;
 
 	/** @debugfs_entry: debugfs directory for this connector */
 	struct dentry *debugfs_entry;
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 127d6e1d3338..957a3d00ee05 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1459,6 +1459,9 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);
 
+bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
+				    u8 real_edid_checksum);
+
 int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				const u8 port_cap[4]);
 int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
