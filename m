Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2D145D7B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151BE6F8E2;
	Wed, 22 Jan 2020 21:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028636F8E2;
 Wed, 22 Jan 2020 21:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLh6ZlQTuk7R3L4pGbG+iltJV/TJanwRpgR1YzBdGxmLoMCNvjM32U+Z/18OKELPS7q5azrKMaLg7p4h0CKSMAqcn71fp1SBi9EhGMXVBdFP3XRspcgaEoRIES5CVmfhXBfe0AcYIDN3mlk7Wx/2YzNN5itKuggkcDXNgmboEPDWoyUczF68Q8O8d8GHXICf8p3U7LV3xUHFuDBO3HJLVlAAkZN14PEA/znm0ALufO4s+93jAPeDQrOyQA2w98PPjwH38Ou4SkUhQxP6RY4EibXnUdYKyWyDLue0tLwKR36OYrKpD3n69tOW9nK7MnnMgypPV34fgd6Ck4tal15YAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhTaG1oItGNeiUWXUYTRH1zJ21ELNeFJwUYswiaVPLA=;
 b=mSHykVgj7MSVU1Dd21eAcVZR1GjMhWCzckQBYuwLmTqXrdWykDbTck+JG8FsnvZdE8mn3HFCBXsP4PVDTScoA8RV+3uQu6dMmjuSI6I08dMipgwZAIZLpezyucpP2FwuXEhtKM3LpxjqkfA8BSXuGIg0D9RsIKSKTRnj4mujlEWtEunntQMVIbXsQ7AqpkuQ0iOl5lDgtEEb9PDsoSIoWE88Oydu5pPlApJf4NpPBmfj06NkYmGnjvf9pmvEWvrXvencCZnsH+EEBdoJKXeV9B25RtFiq3MHV54FMHwx3ByOFC0wRUiA6O/WgPn+cyyENKOoyolD7GXg7yIdCJebFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhTaG1oItGNeiUWXUYTRH1zJ21ELNeFJwUYswiaVPLA=;
 b=PZuzbjiUqMkA9j9DZpC1OXb7oysh/zyfQCxI2hlBUISP2SsjGwNAIDB5yR7bjatssFI4VNtkz643NhOXHUXvEi93LVYT6EjGBqiotGU8NHl52zBg3W+/1r8aVDTBSxtYTbT0wmG74/IpLLpCohmzjevUMMgZ5UKJdgYYPUVEiPo=
Received: from DM3PR12CA0092.namprd12.prod.outlook.com (2603:10b6:0:55::12) by
 SN1PR12MB2399.namprd12.prod.outlook.com (2603:10b6:802:2b::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 22 Jan 2020 21:06:01 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by DM3PR12CA0092.outlook.office365.com
 (2603:10b6:0:55::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Wed, 22 Jan 2020 21:06:01 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 21:06:00 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Jan
 2020 15:05:58 -0600
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Jan 2020 15:05:58 -0600
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <Alexander.Deucher@amd.com>
Subject: [PATCH 3/6] drm/amd/display: Add sysfs interface for set/get srm
Date: Wed, 22 Jan 2020 16:05:45 -0500
Message-ID: <20200122210548.2647-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
References: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(428003)(189003)(199004)(450100002)(70206006)(70586007)(2906002)(426003)(6666004)(356004)(4326008)(81166006)(186003)(2616005)(81156014)(110136005)(8936002)(336012)(86362001)(5660300002)(478600001)(6636002)(26005)(7696005)(1076003)(316002)(36756003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2399; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72107de3-aeeb-40d6-cd36-08d79f7ee284
X-MS-TrafficTypeDiagnostic: SN1PR12MB2399:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2399F001A59E59935CFAFE54F90C0@SN1PR12MB2399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-Forefront-PRVS: 029097202E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjqrA7filgK47TMxA3aoG6eZK8a7KTDYZiN9kMHUVm9LtAlvjAXfPfMmhpJRcyu3+u9KUYPjrAFRlb7bfY0DKKN8YWvb8A0mQPDkfUMpLGOi4naWg6KMgucSHjPvlOSF25/PzZMWIf7N3Gl8tnTTPnFp6T6zyuPMZlU6sr8ruyBMA/wiJq7TEmgy7oZO1KTU4mgLTgG+5jT/LjhfS/Lvz0xql576S3rsuDJSVk/sAgCgb6GLuLpspBRejFcL39kexsrupGN+WjHbh3PTpYbSZfobMACobUaF4m5w6bvosWAB534ciWUzEFdTkO4T+wbOkmyTIIupsVZ+fiSxWd+5Lz+SZlXCZXwnQ2iFlzxBFRR0X/bGplIesi4DYj3ytBK262biekULfb+dcyceu5Fhs2TnvHMRobWFulnE/lR5vYRhMEwknAwhFvSE2l+M3a9s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 21:06:00.9683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72107de3-aeeb-40d6-cd36-08d79f7ee284
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2399
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
PSP doesn't have the ability to store SRM in a non-volatile memory.  And since
the kernel cannot write to the storage directly, we need usermode to facilitate
this

As per spec the SRM needs to be persistent so this interface is to be
called by the usermode anytime the system goes down/powers on

*boot/resume: load from storage
*shutdown/suspend: save to storage

[How]
Provide a sysfs interface so that the usermode can set/get srm at the right times

save to storage: call "cat /sys/class/drm/card0/device/hdcp_srm > file" after boot and resume
	-driver calls psp_get_srm() to get the stored srm and outputs it

load from storage: call "cat file > /sys/class/drm/card0/device/hdcp_srm" before shutdown and suspend
	-driver reads the file from sysfs and calls psp_set_srm() to send the SRM to PSP

v2:
-update commit description
-add comment about sysfs file handling in the code

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    | 179 +++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.h    |   6 +
 2 files changed, 183 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index a269916f7dd6..074243a2f808 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -28,6 +28,8 @@
 #include "amdgpu_dm.h"
 #include "dm_helpers.h"
 #include <drm/drm_hdcp.h>
+#include "hdcp_psp.h"
+
 
 static bool
 lp_write_i2c(void *handle, uint32_t address, const uint8_t *data, uint32_t size)
@@ -67,6 +69,16 @@ lp_read_dpcd(void *handle, uint32_t address, uint8_t *data, uint32_t size)
 	return dm_helpers_dp_read_dpcd(link->ctx, link, address, data, size);
 }
 
+static uint8_t *psp_get_srm(struct psp_context *psp, uint32_t *srm_version, uint32_t *srm_size)
+{
+	return NULL;
+}
+
+static int psp_set_srm(struct psp_context *psp, uint8_t *srm, uint32_t srm_size, uint32_t *srm_version)
+{
+	return 0;
+}
+
 static void process_output(struct hdcp_workqueue *hdcp_work)
 {
 	struct mod_hdcp_output output = hdcp_work->output;
@@ -88,6 +100,18 @@ static void process_output(struct hdcp_workqueue *hdcp_work)
 	schedule_delayed_work(&hdcp_work->property_validate_dwork, msecs_to_jiffies(0));
 }
 
+static void link_lock(struct hdcp_workqueue *work, bool lock)
+{
+
+	int i = 0;
+
+	for (i = 0; i < work->max_link; i++) {
+		if (lock)
+			mutex_lock(&work[i].mutex);
+		else
+			mutex_unlock(&work[i].mutex);
+	}
+}
 void hdcp_update_display(struct hdcp_workqueue *hdcp_work,
 			 unsigned int link_index,
 			 struct amdgpu_dm_connector *aconnector,
@@ -302,7 +326,8 @@ void hdcp_destroy(struct hdcp_workqueue *hdcp_work)
 	}
 
 	kfree(hdcp_work);
-
+	kfree(hdcp_work->srm);
+	kfree(hdcp_work->srm_temp);
 }
 
 static void update_config(void *handle, struct cp_psp_stream_config *config)
@@ -338,6 +363,139 @@ static void update_config(void *handle, struct cp_psp_stream_config *config)
 	hdcp_update_display(hdcp_work, link_index, aconnector, DRM_MODE_HDCP_CONTENT_TYPE0, false);
 }
 
+
+/* NOTE: From the usermodes prospective you only need to call write *ONCE*, the kernel
+ *      will automatically call once or twice depending on the size
+ *
+ * call: "cat file > /sys/class/drm/card0/device/hdcp_srm" from usermode no matter what the size is
+ *
+ * The kernel can only send PAGE_SIZE at once and since MAX_SRM_FILE(5120) > PAGE_SIZE(4096),
+ * srm_data_write can be called multiple times.
+ *
+ * sysfs interface doesn't tell us the size we will get so we are sending partial SRMs to psp and on
+ * the last call we will send the full SRM. PSP will fail on every call before the last.
+ *
+ * This means we don't know if the SRM is good until the last call. And because of this limitation we
+ * cannot throw errors early as it will stop the kernel from writing to sysfs
+ *
+ * Example 1:
+ * 	Good SRM size = 5096
+ * 	first call to write 4096 -> PSP fails
+ * 	Second call to write 1000 -> PSP Pass -> SRM is set
+ *
+ * Example 2:
+ * 	Bad SRM size = 4096
+ * 	first call to write 4096 -> PSP fails (This is the same as above, but we don't know if this
+ * 	is the last call)
+ *
+ * Solution?:
+ * 	1: Parse the SRM? -> It is signed so we don't know the EOF
+ * 	2: We can have another sysfs that passes the size before calling set. -> simpler solution
+ * 	below
+ *
+ * Easy Solution:
+ * Always call get after Set to verify if set was successful.
+ * +----------------------+
+ * |   Why it works:      |
+ * +----------------------+
+ * PSP will only update its srm if its older than the one we are trying to load.
+ * Always do set first than get.
+ * 	-if we try to "1. SET" a older version PSP will reject it and we can "2. GET" the newer
+ * 	version and save it
+ *
+ * 	-if we try to "1. SET" a newer version PSP will accept it and we can "2. GET" the
+ * 	same(newer) version back and save it
+ *
+ * 	-if we try to "1. SET" a newer version and PSP rejects it. That means the format is
+ * 	incorrect/corrupted and we should correct our SRM by getting it from PSP
+ */
+static ssize_t srm_data_write(struct file *filp, struct kobject *kobj, struct bin_attribute *bin_attr, char *buffer,
+			      loff_t pos, size_t count)
+{
+	struct hdcp_workqueue *work;
+	uint32_t srm_version = 0;
+
+	work = container_of(bin_attr, struct hdcp_workqueue, attr);
+	link_lock(work, true);
+
+	memcpy(work->srm_temp + pos, buffer, count);
+
+	if (!psp_set_srm(work->hdcp.config.psp.handle, work->srm_temp, pos + count, &srm_version)) {
+		DRM_DEBUG_DRIVER("HDCP SRM SET version 0x%X", srm_version);
+		memcpy(work->srm, work->srm_temp, pos + count);
+		work->srm_size = pos + count;
+		work->srm_version = srm_version;
+	}
+
+
+	link_lock(work, false);
+
+	return count;
+}
+
+static ssize_t srm_data_read(struct file *filp, struct kobject *kobj, struct bin_attribute *bin_attr, char *buffer,
+			     loff_t pos, size_t count)
+{
+	struct hdcp_workqueue *work;
+	uint8_t *srm = NULL;
+	uint32_t srm_version;
+	uint32_t srm_size;
+	size_t ret = count;
+
+	work = container_of(bin_attr, struct hdcp_workqueue, attr);
+
+	link_lock(work, true);
+
+	srm = psp_get_srm(work->hdcp.config.psp.handle, &srm_version, &srm_size);
+
+	if (!srm)
+		return -EINVAL;
+
+	if (pos >= srm_size)
+		ret = 0;
+
+	if (srm_size - pos < count) {
+		memcpy(buffer, srm + pos, srm_size - pos);
+		ret = srm_size - pos;
+		goto ret;
+	}
+
+	memcpy(buffer, srm + pos, count);
+
+ret:
+	link_lock(work, false);
+	return ret;
+}
+
+/* From the hdcp spec (5.Renewability) SRM needs to be stored in a non-volatile memory.
+ *
+ * For example,
+ * 	if Application "A" sets the SRM (ver 2) and we reboot/suspend and later when Application "B"
+ * 	needs to use HDCP, the version in PSP should be SRM(ver 2). So SRM should be persistent
+ * 	across boot/reboots/suspend/resume/shutdown
+ *
+ * Currently when the system goes down (suspend/shutdown) the SRM is cleared from PSP. For HDCP we need
+ * to make the SRM persistent.
+ *
+ * -PSP owns the checking of SRM but doesn't have the ability to store it in a non-volatile memory.
+ * -The kernel cannot write to the file systems.
+ * -So we need usermode to do this for us, which is why an interface for usermode is needed
+ *
+ *
+ *
+ * Usermode can read/write to/from PSP using the sysfs interface
+ * For example:
+ * 	to save SRM from PSP to storage : cat /sys/class/drm/card0/device/hdcp_srm > srmfile
+ * 	to load from storage to PSP: cat srmfile > /sys/class/drm/card0/device/hdcp_srm
+ */
+static const struct bin_attribute data_attr = {
+	.attr = {.name = "hdcp_srm", .mode = 0664},
+	.size = PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, /* Limit SRM size */
+	.write = srm_data_write,
+	.read = srm_data_read,
+};
+
+
 struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct cp_psp *cp_psp, struct dc *dc)
 {
 
@@ -348,10 +506,19 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
 	if (hdcp_work == NULL)
 		goto fail_alloc_context;
 
+	hdcp_work->srm = kcalloc(PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, sizeof(*hdcp_work->srm), GFP_KERNEL);
+
+	if (hdcp_work->srm == NULL)
+		goto fail_alloc_context;
+
+	hdcp_work->srm_temp = kcalloc(PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, sizeof(*hdcp_work->srm_temp), GFP_KERNEL);
+
+	if (hdcp_work->srm_temp == NULL)
+		goto fail_alloc_context;
+
 	hdcp_work->max_link = max_caps;
 
 	for (i = 0; i < max_caps; i++) {
-
 		mutex_init(&hdcp_work[i].mutex);
 
 		INIT_WORK(&hdcp_work[i].cpirq_work, event_cpirq);
@@ -371,10 +538,18 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
 	cp_psp->funcs.update_stream_config = update_config;
 	cp_psp->handle = hdcp_work;
 
+	/* File created at /sys/class/drm/card0/device/hdcp_srm*/
+	hdcp_work[0].attr = data_attr;
+
+	if (sysfs_create_bin_file(&adev->dev->kobj, &hdcp_work[0].attr))
+		DRM_WARN("Failed to create device file hdcp_srm");
+
 	return hdcp_work;
 
 fail_alloc_context:
 	kfree(hdcp_work);
+	kfree(hdcp_work->srm);
+	kfree(hdcp_work->srm_temp);
 
 	return NULL;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
index 331b50825510..5159b3a5e5b0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
@@ -53,6 +53,12 @@ struct hdcp_workqueue {
 
 	enum mod_hdcp_encryption_status encryption_status;
 	uint8_t max_link;
+
+	uint8_t *srm;
+	uint8_t *srm_temp;
+	uint32_t srm_version;
+	uint32_t srm_size;
+	struct bin_attribute attr;
 };
 
 void hdcp_update_display(struct hdcp_workqueue *hdcp_work,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
