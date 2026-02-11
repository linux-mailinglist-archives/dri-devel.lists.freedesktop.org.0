Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJcyEOxZjGm9lQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC7123546
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB24510E36F;
	Wed, 11 Feb 2026 10:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Plfuf5be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507B910E36D;
 Wed, 11 Feb 2026 10:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcQOuDnfsxADxTGyaDvamv9n/+z8/dQ1UihpDjyxe2nsaccmJPnHCOHuTzbjY0t6j7PG0wwH5lySIvt2J7IrzUCroqmRNZyUeh+sTwNuph2k3beMsh5LixVamqoWjEqib199N/i2HZWlUjrliJ4zTh1AVQYvmpM90zL3OQXPhTch2eIeB/Ka1Ctdh9e+7I2cLywQEINF+0HSczsNjGa7ALPpii0EC3bBUFQKFwMuac31GX6oJ9lZhiBdop0yN+mPPjMBoP0djCw4/h5W/+QSv54cxSN8QKVOOYpThjCYhMrgSJegaFHwlJS7x13KnbgzdL0TuEEsfhOmDptJJ5PD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ppGABh8memK70+ji2icT00M0ReoaLvaw7MH8eJIoM0=;
 b=e69NQuik5i4Q0iMPbXSGzP3Yi6UGTsQ03W3jtucdgCZNvCKoEIfr571Bor7OH8QSVk5sKSYEvOSzI1+buVpj89iSMJybMat8bKVLVCu++i1zFpbW/YEJqrlRFslY/Gtpv6iB/zMFqqcLX3oXeUBIhVBn43IsdFcJGounaaCFYXeT21iBMDfBi2/Tv/2+puE9PB1ExJjz0obFCiN2a1W0vGr97fGs6nV9gx2EgGUrDi3+C+u0iTr13mao2KOOADqRw3N/bNNzuslwevZL+EtNJIzqxTTcxaD0lLGdoid8G2stWv+heZ+F/ZiFOyyArP3+SNT2kucpi/4AT7OTX2Nbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ppGABh8memK70+ji2icT00M0ReoaLvaw7MH8eJIoM0=;
 b=Plfuf5beWmn21RHvjpiXjsy0SumC4dgZ+5jdjSxl9BBCZxiuU4KtictN2MTrU/fFLOCRJxAu4BFoedPWDkv36/RAyoj88s0f8ygDMmJ+r2ohitZYNb0qerCfaOJuy47YF0zSB1uWLSZ04c+PXVXTgV5cqbwNyfvo0hng5G+nBw0=
Received: from SN6PR04CA0107.namprd04.prod.outlook.com (2603:10b6:805:f2::48)
 by DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Wed, 11 Feb
 2026 10:28:51 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:805:f2:cafe::40) by SN6PR04CA0107.outlook.office365.com
 (2603:10b6:805:f2::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 10:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 10:28:50 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 11 Feb 2026 04:28:49 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/6] drm/amdgpu: move devcoredump generation to a worker
Date: Wed, 11 Feb 2026 11:26:49 +0100
Message-ID: <20260211102657.4180-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 5520833f-fca7-472d-e78c-08de6958595a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HlTYueU4/9dq94kxXfTXzrXl1ntL2ZH03PjD61Rl62wXbgKZJ/KFm/jQSqdR?=
 =?us-ascii?Q?64knarAPt4gNoVJYxXCmfV36XehlR8si8CjFt7fRHKM6Ie2w6BqjdS23sFBa?=
 =?us-ascii?Q?k6Z25yPdeMRzfkyqX9nBIVsMFGt7U7N4jqvaswjIDm+Q1Q1FPSSCY7WcwaJM?=
 =?us-ascii?Q?sC/wBlnscFCuVT4PiV9urUjwxVbtsdfhts2bqm2S96F5lLon1ed5eBLM33zX?=
 =?us-ascii?Q?5hfZOUawUrBjxIHRR7uPXLGyc8CfVmygWMvs+7cbOSll0JvQy4rRL5tnFi/Y?=
 =?us-ascii?Q?oj+FVApDLQu4abrOhiydxAC1ZFMRTf8OMIXFhLG0h3Jlzn6Nh0sw7CaDhd+N?=
 =?us-ascii?Q?wpLjlNefTjr1GbhnhnCLthfi4TEsw2P6pTX1QlxzbTtrMJ77mMWxi6lPmp+i?=
 =?us-ascii?Q?gx4cDawAtPUTHpIalMeMR8bEK10riMp5+pcC3uaf0MJy62Hbj+yHP/BFOt2Q?=
 =?us-ascii?Q?BrloWica9149Zn+USm3Fn8K3/m+mx6tCCCfQRloPgBq+V/hY8ft6TtFQ199t?=
 =?us-ascii?Q?qL0+npgqcO1SgzMyDWIBZOKmkNlRzLHGjKiGdS4PHvjShJAe20fxLrWE6yiD?=
 =?us-ascii?Q?Tqv/gsWFoEs7969x7v8LYvSZaHIXB9InnDDf23fONq8+J+mPu/zP9prShaI8?=
 =?us-ascii?Q?Jyk4FcsvChJm7EjlRQ0YqILJsaiBGqArmBEdoJAi7ulpqUY4+Te0MsLaxc4A?=
 =?us-ascii?Q?vYrfgO9vrqvJVU6A0kis3c0L0vpoqBsu58TXfhhU8l+rgdx5i9c0d0Qdzs+H?=
 =?us-ascii?Q?/oz+be8YnEdnG4nJi0xaYgoc7Gq5lFxymAsbOdL+VmQ6ileqNtxKZdkPmwmU?=
 =?us-ascii?Q?eFNCkeJksg5CVtB0Wy0EJSWKch99sDYmntFrv13N1l/79LLHha6MYT3jiqYj?=
 =?us-ascii?Q?nhUAcLCKZO3AmRPPgED9opBKGN+A5c18twFeW4b8Yo12Qvj2t8q+jAX1unv4?=
 =?us-ascii?Q?UR8PMnqLEwEjMfS1W4w6XNxteE3zqoItak7teqIzBsrhjrftIKq4w2IcYd4t?=
 =?us-ascii?Q?K+CW4vXgmSDw3uW8dmmnpVVt5VQ2O7iD8SziApGt6W5Z/J6rmstiHCTYoRmA?=
 =?us-ascii?Q?BOrAV9nMjFqMG7oJa9ovVOkahujhx6xV+4mzM/Z29dyV6fkrJ+GgZMghR0wr?=
 =?us-ascii?Q?Hk2WOCHAU1nx3pB/xC/Pe3mhzmOzdWud3/RbpKi0tqJBICSv/FhuQU1J6ZYr?=
 =?us-ascii?Q?hIhLVCtdT7JJEdZIk6NmI4yswGzFrBvGZnDrVdLDzf5UkNhEwwNLGx8Xst3j?=
 =?us-ascii?Q?Zg+GK/Xxrq9+po/n1uZ090caEFJPpMdatueuI0D+su6/ctIZcV2ZyydfbwDh?=
 =?us-ascii?Q?vgWk7C6igfE/jNNos4/rrys15P8g1an4y+8sDIw/eorTo/EDrQ4/u7ORv7Yh?=
 =?us-ascii?Q?H2ZBalqbPVHS1LqqVL+6hUkVcN1z1y86SDBuMJTrATp5HhzI60v78PV3PG9m?=
 =?us-ascii?Q?lTn9p9k0jGLi/20yZmfs60KSC+K6eKmwOTCVy557qb9ad3Wqhfb4LXu9ChsD?=
 =?us-ascii?Q?VWHprEbxzEXoHDKn/TI0izE6DEU3tPdaC63SqqnuhuhTDIOfsF9C3KTfv8gs?=
 =?us-ascii?Q?U6sUEQ6MJgUaDxOsybpUWyshbp5EgO5MOzjELjDvU1jIzfpF9PP04hmCVmXD?=
 =?us-ascii?Q?FMaIfTKFlacVvhLkO27EqKMbqLZctou+VhuGcZcYxW3eCmoNjZxN+/8LYAK9?=
 =?us-ascii?Q?qfZiLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /a5NuuaZzmeL+Jv5mLJ4Ozn5Y0VysJ+DBUysnxQl1fkf3sRO7XcJCSq3boCmgrxBHAbRTViF42umdgEq2bIe9/ipypbjPXytwlZ9yItaybBxQ+In0HPCr3zQ/blqkQXy9iYPZDD/qw8sPBd0KPQXaAUw8lTYhzEInzsEvGmTIQiPJAeGzVf0NbrGZ01SowkVnXjpGObFNhF2kJ33pErJuph6+kq4zTKzzFcTS4slHjMPUrC1911WvUyO/EsIxkvW6uW5t/XvZ201YvzqUdkUltGVwGGd8pnDK+c6gd4Vr6eqLfi28xbmHj5sRO8TtmOGku5DWRXRD5Gc0Iu3rV8jmR3/gM4XniOp7kzCb9XnqyTlAC0MOf6ZP7sleDT+Iwr/vPLViFsJu9Ih83o98C+T4WuvvxjOV0I0ckwqghkPUpgZRDuuDhRgrZ4ftlbUDjv3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:28:50.9945 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5520833f-fca7-472d-e78c-08de6958595a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D0EC7123546
X-Rspamd-Action: no action

Update the way drm_coredump_printer is used based on its documentation
and Xe's code: the main idea is to generate the final version in one go
and then use memcpy to return the chunks requested by the caller of
amdgpu_devcoredump_read.

The generation is moved to a separate worker thread.

This cuts the time to copy the dump from 40s to ~0s on my machine.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  5 ++
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 66 +++++++++++++++++--
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  9 +++
 3 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 057c8bd2ad89..ae81a428cfb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1200,6 +1200,11 @@ struct amdgpu_device {
 
 	struct amdgpu_reset_domain	*reset_domain;
 
+#ifdef CONFIG_DEV_COREDUMP
+	/* If a coredump state capture is in progress don't start a new one. */
+	bool coredump_in_progress;
+#endif
+
 	struct mutex			benchmark_mutex;
 
 	bool                            scpm_enabled;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 42a969512dcc..0808ca98ccd9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -34,6 +34,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 }
 #else
 
+#define AMDGPU_CORE_DUMP_SIZE_MAX (256 * 1024 * 1024)
+
 const char *hw_ip_names[MAX_HWIP] = {
 	[GC_HWIP]		= "GC",
 	[HDP_HWIP]		= "HDP",
@@ -196,11 +198,9 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
 }
 
 static ssize_t
-amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
-			void *data, size_t datalen)
+amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
 {
 	struct drm_printer p;
-	struct amdgpu_coredump_info *coredump = data;
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
 	struct amdgpu_ip_block *ip_block;
@@ -208,7 +208,6 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 
 	iter.data = buffer;
 	iter.offset = 0;
-	iter.start = offset;
 	iter.remain = count;
 
 	p = drm_coredump_printer(&iter);
@@ -323,11 +322,60 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 	return count - iter.remain;
 }
 
+static ssize_t
+amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
+			void *data, size_t datalen)
+{
+	struct amdgpu_coredump_info *coredump = data;
+	ssize_t byte_copied;
+
+	if (!coredump)
+		return -ENODEV;
+
+	flush_work(&coredump->work);
+
+	if (!coredump->formatted)
+		return -ENODEV;
+
+	if (offset >= coredump->formatted_size)
+		return 0;
+
+	byte_copied = count < coredump->formatted_size - offset ? count :
+		coredump->formatted_size - offset;
+	memcpy(buffer, coredump->formatted + offset, byte_copied);
+
+	return byte_copied;
+}
+
 static void amdgpu_devcoredump_free(void *data)
 {
+	struct amdgpu_coredump_info *coredump = data;
+
+	cancel_work_sync(&coredump->work);
+	coredump->adev->coredump_in_progress = false;
+	kfree(coredump->formatted);
 	kfree(data);
 }
 
+static void amdgpu_devcoredump_deferred_work(struct work_struct *work)
+{
+	struct amdgpu_coredump_info *coredump = container_of(work, typeof(*coredump), work);
+
+	dev_coredumpm(coredump->adev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
+		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+
+	/* Do a one-time preparation of the coredump output because
+	 * repeatingly calling drm_coredump_printer is very slow.
+	 */
+	coredump->formatted_size =
+		amdgpu_devcoredump_format(NULL, AMDGPU_CORE_DUMP_SIZE_MAX, coredump);
+	coredump->formatted = kvzalloc(coredump->formatted_size, GFP_KERNEL);
+	if (!coredump->formatted)
+		return;
+	amdgpu_devcoredump_format(coredump->formatted, coredump->formatted_size, coredump);
+	coredump->adev->coredump_in_progress = false;
+}
+
 void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 		     bool vram_lost, struct amdgpu_job *job)
 {
@@ -335,10 +383,15 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	struct amdgpu_coredump_info *coredump;
 	struct drm_sched_job *s_job;
 
+	if (adev->coredump_in_progress)
+		return;
+
 	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
 	if (!coredump)
 		return;
 
+	adev->coredump_in_progress = true;
+
 	coredump->skip_vram_check = skip_vram_check;
 	coredump->reset_vram_lost = vram_lost;
 
@@ -361,8 +414,9 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 
 	ktime_get_ts64(&coredump->reset_time);
 
-	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
-		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+	/* Kick off coredump formatting to a worker thread. */
+	INIT_WORK(&coredump->work, amdgpu_devcoredump_deferred_work);
+	queue_work(system_unbound_wq, &coredump->work);
 
 	drm_info(dev, "AMDGPU device coredump file has been created\n");
 	drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index ef9772c6bcc9..4c37a852b74a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -35,9 +35,18 @@ struct amdgpu_coredump_info {
 	struct amdgpu_device            *adev;
 	struct amdgpu_task_info         reset_task_info;
 	struct timespec64               reset_time;
+
+	struct work_struct work;
+
 	bool                            skip_vram_check;
 	bool                            reset_vram_lost;
 	struct amdgpu_ring              *ring;
+	/* Readable form of coredevdump, generate once to speed up
+	 * reading it (see drm_coredump_printer's documentation).
+	 */
+	ssize_t				formatted_size;
+	char				*formatted;
+
 };
 #endif
 
-- 
2.43.0

