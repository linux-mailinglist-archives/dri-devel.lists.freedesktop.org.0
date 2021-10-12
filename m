Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D245042AA7F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49BD6E5C5;
	Tue, 12 Oct 2021 17:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05BF6E558;
 Tue, 12 Oct 2021 17:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aM55t3HsFnBDOUfHT/Bw+1GieXwkZW+nh+AhsBJl+yY4oPd7WyoTR6mLRhoct89oZ1NxRfzgxhzJf1sicsjiOrfECMz7aI517uGSA4l+VmBETcLxZ7oJmdWouxlp69ks6PqXFqnkb0xQXz6DY5QNj6X0R+HsVrRFg4tOOrPQKWxJUrbxO3ukurXpKXtvSU9rGK/T3yaegBCAXWiIA6Dq7PNRU9Wy5hKgb+PWD4kJLaXKr7n/5ZBIbijAaor/v0ZuUyKet5x6soSAk+Pxr5uJaHx3AZD4CST0gVfiUnh2jxxPZ82/PrQJnCmzCjWxFUVVx4xgThuwQ70IwbfR+apR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0e5/2mK5mcvCb8srP5epOKMau+W+DCd3ch7Z+X/cOk=;
 b=V5sA5ApOkRwQAV5sybTQ63aiuTNko0by1NrlfZdkRCHkeVc3tDSkIjqnMgQkX4dB6DNH36qx6STQg/5lJZb7qB/yRd0CW5itW6MPuREvIw4j/q5oAV1w4vR0z3mBrx/J/QEBhu59JMGOy6k2aawRev7voKt7o3CRFukNPNA3jwaP9ULttmJPTWXZWKYdhdOlzSfp+tcFMkze/+SHav01OiUJfQ5bkpXHYhO8AU4U5+fJqVNqcIqJHr7mAsSDEhAkK0XMoo+OkS9La8fz596V6ENxlqtz7qPUkbw22TgW1NM8wM6FPLBN3Iu7I2eZ7cc7qIeh96sBpbRZU+MUqcNIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0e5/2mK5mcvCb8srP5epOKMau+W+DCd3ch7Z+X/cOk=;
 b=cbCscQzSerDSLk6XDk11y5KphJCBsfiZk+cXVBoYtcZzx5quDylo5AsemrPNyi1UlS324FzJU4bJjr+b1DD34TQJKVjwlon8ZpJu8daXA44A7xguhYUCFHI4QMuAFW4u+7ZGYp+a3QVYaZVwAFdUa4eJdDz2gldE3ka2goAuiSg=
Received: from MWHPR14CA0012.namprd14.prod.outlook.com (2603:10b6:300:ae::22)
 by BN7PR12MB2739.namprd12.prod.outlook.com (2603:10b6:408:31::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 17:13:07 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::a6) by MWHPR14CA0012.outlook.office365.com
 (2603:10b6:300:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:06 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:13:03 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 08/12] lib: test_hmm add ioctl to get zone device type
Date: Tue, 12 Oct 2021 12:12:43 -0500
Message-ID: <20211012171247.2861-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211012171247.2861-1-alex.sierra@amd.com>
References: <20211012171247.2861-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10ceba12-e2ed-4213-0baf-08d98da38ec9
X-MS-TrafficTypeDiagnostic: BN7PR12MB2739:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2739544F261770DB5366733BFDB69@BN7PR12MB2739.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HruBCQ5hDGDpR3lk82TA3JvvxiGPlz6rE3LSP4hXKBJ7PpDcOIwscjqr6alhpUwC3EzZFNgjwltk8qvxWjeivXLPp8peqXhl1J/HoNdrYZ+yilVb8cCZm+aYOImDKn7TD1UnRqOSv+e0UOwcVWzE7ESGMYFyuMjIRYJMvyh4YSxf5IWPII0fb+Q2bMQgffahuXX5ROjFgonDqKLHFaZM1v1FwKufAG2I8xMYuj/6Th3IEUAtRiUabaF4ZSRazuQx/hO8Aahske9US9aBtT/j3ngARhPFwWy6mIENrUyJ7r9Tvz+shJg9pz+gM/jwokK2zPS2zXKdTYLnNylqcf8ptHbYUEwfFqaU3tbdjwl9lIpf/PP9FHQ+rPXNwPqzX0ktI2a7lu9likjFBm7ms6ISg2Mo6cpgklaKrojwIAHmnVKS4/D1UgmLEgtXnUTfON5RSmvDQQ2pjpoZon914TnmqAtmBqJJQaFemR92VBGCMbrIF2GUaRShHMa9RhNK7LQJI68WwmTJmLJSIY/fCk/f2V0BubKo9pYQodXaKd9C8Fu89g56ADtTJxEzupFdK72m+9gYtJhxdQ7UO2sPo38+WK320fF2GbNujsDM8sdTk94ti6csaGm6J7rcq2+anmy8vU1RWsec/PA5TJPh5zPubq43ljc+4ATm6+1/EOhgiWryCiRJPgk4s9FGiVo4IU5Nzz7bo7BGHznQfStqgJxbT/z+SpZJBLstqSOuwVo01aw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(44832011)(81166007)(26005)(54906003)(36756003)(356005)(47076005)(508600001)(7696005)(82310400003)(2906002)(5660300002)(110136005)(36860700001)(8936002)(186003)(16526019)(6666004)(1076003)(8676002)(2616005)(83380400001)(7416002)(336012)(70206006)(86362001)(70586007)(4326008)(316002)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:06.2575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ceba12-e2ed-4213-0baf-08d98da38ec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2739
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

new ioctl cmd added to query zone device type. This will be
used once the test_hmm adds zone device coherent type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 15 ++++++++++++++-
 lib/test_hmm_uapi.h |  7 +++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6998f10350ea..3cd91ca31dd7 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -82,6 +82,7 @@ struct dmirror_chunk {
 struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
+	unsigned int            zone_device_type;
 
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
@@ -468,6 +469,7 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	if (IS_ERR(res))
 		goto err_devmem;
 
+	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.range.start = res->start;
 	devmem->pagemap.range.end = res->end;
@@ -912,6 +914,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 	return ret;
 }
 
+static int dmirror_get_device_type(struct dmirror *dmirror,
+			    struct hmm_dmirror_cmd *cmd)
+{
+	mutex_lock(&dmirror->mutex);
+	cmd->zone_device_type = dmirror->mdevice->zone_device_type;
+	mutex_unlock(&dmirror->mutex);
+
+	return 0;
+}
 static long dmirror_fops_unlocked_ioctl(struct file *filp,
 					unsigned int command,
 					unsigned long arg)
@@ -952,7 +963,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 	case HMM_DMIRROR_SNAPSHOT:
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
-
+	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
+		ret = dmirror_get_device_type(dmirror, &cmd);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 670b4ef2a5b6..ee88701793d5 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -26,6 +26,7 @@ struct hmm_dmirror_cmd {
 	__u64		npages;
 	__u64		cpages;
 	__u64		faults;
+	__u64		zone_device_type;
 };
 
 /* Expose the address space of the calling process through hmm device file */
@@ -33,6 +34,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
@@ -60,4 +62,9 @@ enum {
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
 };
 
+enum {
+	/* 0 is reserved to catch uninitialized type fields */
+	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+};
+
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

