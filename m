Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A22714F323
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 21:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7D66E243;
	Fri, 31 Jan 2020 20:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DA26E23D;
 Fri, 31 Jan 2020 20:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTwvQlUpkBvZ4gWCiYAS71hym+l9sqOgrzmea6UywJ5ec9Nb97ErzDqaKASQ7dtOh3L3GZ62bXdM3+pfz1tlDQvykyEnVJOJJBViKMm7cVREIAiydKmGpcGhD7zRd0+GoO534pSnufWEdv1ImHQW0Ux0cc0q7AlHfQGFmDpqM/4/+Br3kSDIR46N97ad814mZe9Vktt/NF1GLvCmDiIEEdNq/8B2oLFzZEB72Nj8yTiQa9Pa0ZyITD8aWVMM1H03Yk0NAXDU29K+bLF6WhKPPnaN1QEvSRbO5z/wE2ez/rDimrIW6zeMpv0bjnI+5Tj/X1cRSCRJxHFqr/1byjR9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PacQ0liBxEnuqspbDm+qjz52BplWu6gwKmxy7n8DjQ=;
 b=BjhPGPb3eSiLtkz07Ictb8G232QXe9DlyOdcF1s8U82VPB3LArifJ4dAgQy9vH95Sq/KynQEFD3e772nnUMZqe+jLGZ7sU9f/xx961aRMajYhj/XWTTzXCIFJzpKyYAUXhJX1udzdZRYMd6+ONo9SBFA2lqXfiga1ccYTcX9BXHoIyYC3m0AfRqd0m6iXotPs55K4l9lRIhEWnIx5ZVyM27aGc1unuh6Vm+s+Erw7ecxusLXwzcyky7KqP56/xLWJQcpSJAlgBfazUiWj3xQMAuLBCMa1jmAV/irHYg/2pVK2BEWLt1s5k+7fwB5+KvLnYtztbETi99OjtO8939OTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PacQ0liBxEnuqspbDm+qjz52BplWu6gwKmxy7n8DjQ=;
 b=drKcKg/4UkzluVmvYwcufmGphYQahvQABdoUajIru0vZhLweoNkMo3HWjgEXECLcVgenYbtzO4VTNTGL5+2RT2Wfs6PlpqXtX8yNqHp78AO69nSDCKwiQ4j0KtKku9uLMqE9VShNeuuSEjhdmKi85relRvwGG8cXWCc/xM+0Taw=
Received: from BN6PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:405:4c::32) by DM6PR12MB3196.namprd12.prod.outlook.com
 (2603:10b6:5:187::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.24; Fri, 31 Jan
 2020 20:24:58 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::200) by BN6PR1201CA0022.outlook.office365.com
 (2603:10b6:405:4c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.28 via Frontend
 Transport; Fri, 31 Jan 2020 20:24:58 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2686.25 via Frontend Transport; Fri, 31 Jan 2020 20:24:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 Jan
 2020 14:24:56 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 Jan
 2020 14:24:56 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 31 Jan 2020 14:24:56 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V5] drm: Add support for DP 1.4 Compliance edid corruption test
Date: Fri, 31 Jan 2020 15:24:51 -0500
Message-ID: <20200131202451.8994-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(428003)(189003)(199004)(81166006)(81156014)(70586007)(186003)(8936002)(26005)(70206006)(4326008)(36756003)(336012)(86362001)(6666004)(2616005)(5660300002)(54906003)(7696005)(1076003)(2906002)(110136005)(478600001)(356004)(316002)(426003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3196; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec4b3ba8-12a4-4e51-3a2e-08d7a68ba3eb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3196:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3196FB26868D63EA1D565CDEE5070@DM6PR12MB3196.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-Forefront-PRVS: 029976C540
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ov4CRJAc3m/rMj6uhyh7wOjlfJ63D5WozvIC65uDOWq/94X3+hcTawqRA82LD0LFpLYBBHb/bCBO7JCRMMpGlngGdzVEVfM/BIYgRsGvmUJP6ZTaiVZI96eldPbKT4y2HKqUqUKUowM2rkRmAc75ET04J6v88XL8EGmuxGLh+r7PM28Jk8RB6QzaC61bkQ3fnSr/7F5Ze8hTtb+skpv+CYeZ9RBmQkDeb1/4/nE8fAvihhQYyO5gLjNkVi3/CeG6KMt+AZ33CCiMH8SW7vh7j5oY3scyQQwrvRGMy+2Wm7rgLdNjjIHijCksAFrGFuaq8DC1qZdoV3+A6ll5fP7KACtvBfLMl+4iKIwPCLL2EJXY6BCVaN2RJR5f60Dpyq3AqNvrQ0n4ncEAOghQq9xfD1XSPJgD5JpC8qJckKO27VSQe92lfCa1Zkue3dLqgdaH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2020 20:24:57.6551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4b3ba8-12a4-4e51-3a2e-08d7a68ba3eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3196
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
 drivers/gpu/drm/drm_dp_helper.c | 35 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_edid.c      | 23 ++++++++++++++++++----
 include/drm/drm_connector.h     |  6 ++++++
 include/drm/drm_dp_helper.h     |  3 +++
 4 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index f629fc5494a4..18b285fa1a42 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -351,6 +351,41 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
 
+/**
+ * drm_dp_send_real_edid_checksum() - send back real edid checksum value
+ * @aux: DisplayPort AUX channel
+ * @real_edid_checksum: real edid checksum for the last block
+ *
+ * Returns true on success
+ */
+bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
+                                    u8 real_edid_checksum)
+{
+	u8 link_edid_read = 0, auto_test_req = 0, test_resp = 0;
+
+	drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1);
+	auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
+
+	drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1);
+	link_edid_read &= DP_TEST_LINK_EDID_READ;
+
+	if (!auto_test_req || !link_edid_read) {
+		DRM_DEBUG_KMS("Source DUT does not support TEST_EDID_READ\n");
+		return false;
+	}
+
+	drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1);
+
+	/* send back checksum for the last edid extension block data */
+	drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM, &real_edid_checksum, 1);
+
+	test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
+	drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1);
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
