Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248BA451232
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F064B6E98A;
	Mon, 15 Nov 2021 19:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65F36E8D4;
 Mon, 15 Nov 2021 19:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL85+ZHNMk1DdnobQndBP0Lwz4wFBxyVVLsvFRUHuUVCCnCGZIygfsmEwlJOxagP15/lmFikZEVbjTiG9oYZYPky+/qJJ4Hok/tQmdXuZRFgQrY/aT4ELtHzJV9PX6daQEQhtwV0V+ALCZNpmADjEvhriRmajzx4un17bXHxQWO2cHpVGJJHxgKu3rgE7HR8taXaZfs50cNVj9G21B0/Oq9lyNtTTETUP9I/dB9hhMxXtPykqs0Zv6gILyzLeqtassn+EW6P3XAlqKj+RuqSIDCx19lBw+R+UvysgHnhi9cyr/jgOvbFHQO1mdJ0yAzovp95BLyQ6Z+QOdkBJyV76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoF5vUwnxHzDBHOUgK/JW2PW62ECMDHd2RT/snK7HU0=;
 b=hOibv/7rUKvLRlza+JeWOizEqoW4TPpN3SX8APjS5PM5ffuaN/e/16hPQQkKNGpMK1UzZWWU7lQKoMveiEAG+pnhyboSZgJxG94I2UMi5BrfLQK394aCmLJR972yNUX6Zn/JUoFuI204sQQkzitcbgI9OqGgkiB1D5oBrewPxuBru879MjuZ8g9b1FA+xaEX8aZRl+Mlclk/bYjelx21lkExiQ4FY3jp3Frd6jjiC9PuaebkWCsdbbHkJydFGYSLf6wB4m6G3GpvBvqjk/OORbu49eqKZHC8Fuu9xhKETr0oNdunC147kUi3O6ZNsSE2Pq1KRgS7DaYGPcCahjplVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoF5vUwnxHzDBHOUgK/JW2PW62ECMDHd2RT/snK7HU0=;
 b=2Ab9CcmSMvl31VlV7fKbg9hl6Ni45ZeZie4D2/yPN17aJEInhfGrBC67wVwXi66pMtF9K/aUu9wTt2Zj7QwKQq+NuZ9UAXVzTzlYMGqO8JOcurjxEJzhMJvov2drO0sExH0NtLv/zMYY8UDY3jfGsPlNZf/mb6kCDuk5dJo4LS0=
Received: from MWHPR04CA0058.namprd04.prod.outlook.com (2603:10b6:300:6c::20)
 by CY4PR12MB1607.namprd12.prod.outlook.com (2603:10b6:910:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 19:30:51 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::4c) by MWHPR04CA0058.outlook.office365.com
 (2603:10b6:300:6c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:51 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:42 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 8/9] tools: update hmm-test to support device coherent type
Date: Mon, 15 Nov 2021 13:30:25 -0600
Message-ID: <20211115193026.27568-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193026.27568-1-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56978124-c451-4270-9e42-08d9a86e6f3e
X-MS-TrafficTypeDiagnostic: CY4PR12MB1607:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1607EFF8A210CAB73777F46EFD989@CY4PR12MB1607.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6g6XybqXHDC5aw229sIMw0gzVtjCSYcOJxtNkUjIU4BiKbb0513lQtLvMTJDimegg1CIigAVqEANmIBcIn0pKyJtKM/YFNvHURXMUm6gfH7FQrMKYaASUPEiSUhJj38E2Im+XclI/1PBKpvrIlUM8+CZYu25rFspxLrGaATCycD0pcAOnnIQljBNynbti6jY2QVT9M6wYzlRSfFCYVBAn+XUHBgt0dGuv8kr1TVbXDwlltNmXuCfEebfLXji9r00kuFAmr4mQ7D29EYRJLX3sLV4nb9pqQzGa2/rJsbdGsJqTAa/FdoG8vs0+qOAE7aQmYqGsZkxaH2PyIDpeZeMMyj9ceic60jV51YbVeqq4GHdHWsRWwjR7MfQi1scPuoC/649Y732H86Z0qJW7r94EvKxLoLCNZzn9bE4iatXgXPlLFcPK5FO4fPClx04Og4cy5x4kSCv9rQghy3Fk28NRRmO8xvUHsP36VfAoHbpV77baxl4D+k/UvjWhX+XnVNoEr0rTdONF/rWE2TfnMu+cb8Wnqm85EemHgZA0+lRgArTaN8b8mAWI+sAOMCeQHKFYXLz4qvI4KaQbqA9OOjKvFwMbMOLYMHyh/caNfKADMxIfTBtzhH74VLUJ5N/eFc1Jf3l6oeLguYEsgii/YFIha91zFNQ3LQ8tkF+paTYt0MSuzI9h9Vw/mxAA9Xf038B3DIZtudOEF0mMNsUszAI/xjV3jG/nAUf4C8+IOHmOOQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(336012)(15650500001)(2616005)(81166007)(6666004)(83380400001)(5660300002)(86362001)(356005)(44832011)(7696005)(8676002)(47076005)(82310400003)(8936002)(508600001)(426003)(70586007)(70206006)(2906002)(316002)(1076003)(30864003)(54906003)(110136005)(26005)(4326008)(186003)(7416002)(16526019)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:51.4210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56978124-c451-4270-9e42-08d9a86e6f3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1607
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test cases such as migrate_fault and migrate_multiple,
were modified to explicit migrate from device to sys memory
without the need of page faults, when using device coherent
type.

Snapshot test case updated to read memory device type
first and based on that, get the proper returned results
migrate_ping_pong test case added to test explicit migration
from device to sys memory for both private and coherent zone
types.

Helpers to migrate from device to sys memory and vicerversa
were also added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 156 ++++++++++++++++++++++---
 1 file changed, 138 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 864f126ffd78..6091e30636d5 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -44,6 +44,7 @@ struct hmm_buffer {
 	int		fd;
 	uint64_t	cpages;
 	uint64_t	faults;
+	int		zone_device_type;
 };
 
 #define TWOMEG		(1 << 21)
@@ -144,6 +145,7 @@ static int hmm_dmirror_cmd(int fd,
 	}
 	buffer->cpages = cmd.cpages;
 	buffer->faults = cmd.faults;
+	buffer->zone_device_type = cmd.zone_device_type;
 
 	return 0;
 }
@@ -211,6 +213,32 @@ static void hmm_nanosleep(unsigned int n)
 	nanosleep(&t, NULL);
 }
 
+static int hmm_migrate_sys_to_dev(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_DEV, buffer, npages);
+}
+
+static int hmm_migrate_dev_to_sys(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_SYS, buffer, npages);
+}
+
+static int hmm_is_private_device(int fd, bool *res)
+{
+	struct hmm_buffer buffer;
+	int ret;
+
+	buffer.ptr = 0;
+	ret = hmm_dmirror_cmd(fd, HMM_DMIRROR_GET_MEM_DEV_TYPE, &buffer, 1);
+	*res = (buffer.zone_device_type == HMM_DMIRROR_MEMORY_DEVICE_PRIVATE);
+
+	return ret;
+}
+
 /*
  * Simple NULL test of device open/close.
  */
@@ -875,7 +903,7 @@ TEST_F(hmm, migrate)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -923,7 +951,7 @@ TEST_F(hmm, migrate_fault)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -936,7 +964,7 @@ TEST_F(hmm, migrate_fault)
 		ASSERT_EQ(ptr[i], i);
 
 	/* Migrate memory to the device again. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -976,7 +1004,7 @@ TEST_F(hmm, migrate_shared)
 	ASSERT_NE(buffer->ptr, MAP_FAILED);
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, -ENOENT);
 
 	hmm_buffer_free(buffer);
@@ -1015,7 +1043,7 @@ TEST_F(hmm2, migrate_mixed)
 	p = buffer->ptr;
 
 	/* Migrating a protected area should be an error. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Punch a hole after the first page address. */
@@ -1023,7 +1051,7 @@ TEST_F(hmm2, migrate_mixed)
 	ASSERT_EQ(ret, 0);
 
 	/* We expect an error if the vma doesn't cover the range. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Page 2 will be a read-only zero page. */
@@ -1055,13 +1083,13 @@ TEST_F(hmm2, migrate_mixed)
 
 	/* Now try to migrate pages 2-5 to device 1. */
 	buffer->ptr = p + 2 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 4);
 
 	/* Page 5 won't be migrated to device 0 because it's on device 1. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, -ENOENT);
 	buffer->ptr = p;
 
@@ -1070,8 +1098,12 @@ TEST_F(hmm2, migrate_mixed)
 }
 
 /*
- * Migrate anonymous memory to device private memory and fault it back to system
- * memory multiple times.
+ * Migrate anonymous memory to device memory and back to system memory
+ * multiple times. In case of private zone configuration, this is done
+ * through fault pages accessed by CPU. In case of coherent zone configuration,
+ * the pages from the device should be explicitly migrated back to system memory.
+ * The reason is Coherent device zone has coherent access to CPU, therefore
+ * it will not generate any page fault.
  */
 TEST_F(hmm, migrate_multiple)
 {
@@ -1082,7 +1114,9 @@ TEST_F(hmm, migrate_multiple)
 	unsigned long c;
 	int *ptr;
 	int ret;
+	bool is_private;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd, &is_private), 0);
 	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
 	ASSERT_NE(npages, 0);
 	size = npages << self->page_shift;
@@ -1107,8 +1141,7 @@ TEST_F(hmm, migrate_multiple)
 			ptr[i] = i;
 
 		/* Migrate memory to device. */
-		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
-				      npages);
+		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 		ASSERT_EQ(ret, 0);
 		ASSERT_EQ(buffer->cpages, npages);
 
@@ -1116,7 +1149,12 @@ TEST_F(hmm, migrate_multiple)
 		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
-		/* Fault pages back to system memory and check them. */
+		/* Migrate back to system memory and check them. */
+		if (!is_private) {
+			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+			ASSERT_EQ(ret, 0);
+		}
+
 		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
@@ -1261,10 +1299,12 @@ TEST_F(hmm2, snapshot)
 	unsigned char *m;
 	int ret;
 	int val;
+	bool is_private;
 
 	npages = 7;
 	size = npages << self->page_shift;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd0, &is_private), 0);
 	buffer = malloc(sizeof(*buffer));
 	ASSERT_NE(buffer, NULL);
 
@@ -1312,13 +1352,13 @@ TEST_F(hmm2, snapshot)
 
 	/* Page 5 will be migrated to device 0. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
 	/* Page 6 will be migrated to device 1. */
 	buffer->ptr = p + 6 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
@@ -1335,9 +1375,16 @@ TEST_F(hmm2, snapshot)
 	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
-			HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	if (is_private) {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	} else {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_COHERENT |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_COHERENT |
+				HMM_DMIRROR_PROT_WRITE);
+	}
 
 	hmm_buffer_free(buffer);
 }
@@ -1496,7 +1543,13 @@ TEST_F(hmm, exclusive)
 	unsigned long i;
 	int *ptr;
 	int ret;
+	bool is_private;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd, &is_private), 0);
+	if (!is_private) {
+		printf("Skipping test as memory device type is not private\n");
+		return;
+	}
 	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
 	ASSERT_NE(npages, 0);
 	size = npages << self->page_shift;
@@ -1550,7 +1603,13 @@ TEST_F(hmm, exclusive_mprotect)
 	unsigned long i;
 	int *ptr;
 	int ret;
+	bool is_private;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd, &is_private), 0);
+	if (!is_private) {
+		printf("Skipping test as memory device type is not private\n");
+		return;
+	}
 	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
 	ASSERT_NE(npages, 0);
 	size = npages << self->page_shift;
@@ -1603,7 +1662,13 @@ TEST_F(hmm, exclusive_cow)
 	unsigned long i;
 	int *ptr;
 	int ret;
+	bool is_private;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd, &is_private), 0);
+	if (!is_private) {
+		printf("Skipping test as memory device type is not private\n");
+		return;
+	}
 	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
 	ASSERT_NE(npages, 0);
 	size = npages << self->page_shift;
@@ -1643,4 +1708,59 @@ TEST_F(hmm, exclusive_cow)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Migrate anonymous memory to device memory and migrate back to system memory
+ * explicitly, without generating a page fault.
+ */
+TEST_F(hmm, migrate_ping_pong)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+
+	/* Migrate memory back to system mem. */
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	/* Check the buffer migrated back to system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 TEST_HARNESS_MAIN
-- 
2.32.0

