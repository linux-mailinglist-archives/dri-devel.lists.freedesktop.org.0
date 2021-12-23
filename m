Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6AE47DC24
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2402810E176;
	Thu, 23 Dec 2021 00:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A2010E154;
 Thu, 23 Dec 2021 00:37:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM77djvMhJhbhp7xPPna/eGao2xjQk/zKlL8G8iIYJCATIufDfcLrEJ4E1ytZha6VjOpp4CsMM85gXzuznoIbl2mb9CqhywdIJaK0gO82XigQRNBHjvXAqWhenn5ktUX1srTRDHY+Hh8Z9yS4Eute+dC01WGkQ0B7gq5SS4oKjHOV7RiiBgPrVRAab/Y99bLHVK+0mFFwt3ja5dkVwacZWM5UnHrjUlutBHYE3ugcPOsmxsIuL4iUK6uFWLPX5zyPsVsrssRQRH5LNsn+C5Lx8YAo0s+x5Yfidze5fwsiZx17+L2Apxj7gIu2eD0bxYhFFKRUdUolOoTOjt9jwEgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLuHzO1IP2iIC/F4s0BYKftBD6+ATEoNHCBApcVWmeI=;
 b=UfPrUezZO521E7/ThwGpJhuclIEHi3FZ7f27hkoA60JROBFc0OvFI9UlSbcJ2330/KCz2vEeZjNlVtj6Hv9pIubw+qWCTiEJd2PzEyWS0wsqEHOKS6DaVswO+eysGSGmb1rk6k7CnnIFt9rUEcJoiCF2ZyyXSmztfPF2v6FwuCcXX0+ZBDetQcmlRcoh7yoU3v/vSCnqmE7ZvKvPAzRapJgaQuM861mzilyWnL+BvXrP8yyN7ZeGJkaMnjgqaaVqzFYPGqig/81e3crVs+B++y35kbl255PMSWVpzdS2H+XYqTPNpcxz9xpGsQfUCNRwdhNOUzbC0sA5XTkgNrdtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLuHzO1IP2iIC/F4s0BYKftBD6+ATEoNHCBApcVWmeI=;
 b=UousU1F0SIRdq+huVC1HLs7oPuXnZy/RZ351WpjT1+jp0ZeMjat5zUtungCdE+CItb3N4Knj/XoP4RSfxtmEhyL93cl+impAf01PdIPjgwWXzMx+izLbk3Q1WEliZT9lRVNno7X7nfF75+CorG37TqRya02s6CUQAoeM7mPD7p8=
Received: from BN0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:408:e8::24)
 by BN6PR12MB1602.namprd12.prod.outlook.com (2603:10b6:405:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Thu, 23 Dec
 2021 00:37:28 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::a1) by BN0PR04CA0049.outlook.office365.com
 (2603:10b6:408:e8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:27 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:26 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 04/24] drm/amdkfd: CRIU Implement KFD process_info ioctl
Date: Wed, 22 Dec 2021 19:36:51 -0500
Message-ID: <20211223003711.13064-5-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9f4799f-b4a6-4ac4-bff4-08d9c5ac6587
X-MS-TrafficTypeDiagnostic: BN6PR12MB1602:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB16023CD0D1A1777A4B2512D6FE7E9@BN6PR12MB1602.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fDRO7THouYXoksTcp5fCcTbh/ztwPJCk+tnVFs4HL7oJZrP+5QzaLq5jgwInAcDLTJR66gCYNFHcCi29PCybpPg3NyLAJUnKCXOS6gxRU0K585bxa0HLtzTWZ+ICGNG+Izgz3UTGHKAnNcmxI7OAcDLz5sIL6lJI+lTinMdXFg1WRgibZfsWK3h0OUKB8EGXUWzuHguNwhsI2SwaPDELv7eo7FAq7+hEALPq4kiSF9CfL0e6irHvaSHwbZ8qiMsH6SKI+42eiFJs41faXTuqA6z86azNhGn019cM5gi/TSYmDZcql/+ZdX6UUO7SmXu5Zd5I/15V40bVI2xhttlUyYs6oxmicgbmmalxPxqM+SIml2mZhk6xEkqFE+/yKbnR9m4YeRIGx/YTA6hDKIuOeRB7o3ag5tqmI/Nhze9y/8aI9OpyVgTlzhb6ILieM7Y7LEmR4QjpPR3y+8HLbK3Pg8L0DuhFw955hGuCwm8RTS6s5i+24KS072yyQ7m1XUEoXAv8PvX76c3V2R9ecd+12BrEYlF/xkv2uJ/FVoa3lT/WqlMk+ovlV/BKLofnD0qCiG5uznX+7sSzohuRtsHhwSOerDY13xl2dK+Q2fwaSZEcH4FotF9z5kkaKL7uXLkQr728I0MWwpTAWRbmoiZDzEeWstXe3m2yNsEw4ffS4cyysY4+eZWazydHXoFkhPnfOzCJn9BVBf+5jadgFKOpKQf1Ef+e1gX20a8gNqDU6QkWyu72P8waJXHqWfdHSu30ZgMkYgB8TDpTbEx+1T9cYEFwSmWoK3+J0HPIx+On0o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(4326008)(7696005)(36756003)(356005)(5660300002)(110136005)(36860700001)(70206006)(81166007)(26005)(44832011)(86362001)(1076003)(40460700001)(426003)(8936002)(336012)(508600001)(8676002)(186003)(83380400001)(47076005)(316002)(16526019)(6666004)(70586007)(2906002)(54906003)(82310400004)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:27.7609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f4799f-b4a6-4ac4-bff4-08d9c5ac6587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1602
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This IOCTL is expected to be called as a precursor to the actual
Checkpoint operation. This does the basic discovery into the target
process seized by CRIU and relays the information to the userspace that
utilizes it to start the Checkpoint operation via another dedicated
IOCTL.

The process_info IOCTL determines the number of GPUs, buffer objects
that are associated with the target process, its process id in
caller's namespace since /proc/pid/mem interface maybe used to drain
the contents of the discovered buffer objects in userspace and getpid
returns the pid of CRIU dumper process. Also the pid of a process
inside a container might be different than its global pid so return
the ns pid.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 55 +++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 14 ++++++
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1b863bd84c96..53d7a20e3c06 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1857,6 +1857,41 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 }
 #endif
 
+uint64_t get_process_num_bos(struct kfd_process *p)
+{
+	uint64_t num_of_bos = 0, i;
+
+	/* Run over all PDDs of the process */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		void *mem;
+		int id;
+
+		idr_for_each_entry(&pdd->alloc_idr, mem, id) {
+			struct kgd_mem *kgd_mem = (struct kgd_mem *)mem;
+
+			if ((uint64_t)kgd_mem->va > pdd->gpuvm_base)
+				num_of_bos++;
+		}
+	}
+	return num_of_bos;
+}
+
+static void criu_get_process_object_info(struct kfd_process *p,
+					 uint32_t *num_bos,
+					 uint64_t *objs_priv_size)
+{
+	uint64_t priv_size;
+
+	*num_bos = get_process_num_bos(p);
+
+	if (objs_priv_size) {
+		priv_size = sizeof(struct kfd_criu_process_priv_data);
+		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
+		*objs_priv_size = priv_size;
+	}
+}
+
 static int criu_checkpoint(struct file *filep,
 			   struct kfd_process *p,
 			   struct kfd_ioctl_criu_args *args)
@@ -1889,7 +1924,25 @@ static int criu_process_info(struct file *filep,
 				struct kfd_process *p,
 				struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	int ret = 0;
+
+	mutex_lock(&p->mutex);
+
+	if (!kfd_has_process_device_data(p)) {
+		pr_err("No pdd for given process\n");
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	args->pid = task_pid_nr_ns(p->lead_thread,
+					task_active_pid_ns(p->lead_thread));
+
+	criu_get_process_object_info(p, &args->num_bos, &args->priv_data_size);
+
+	dev_dbg(kfd_device, "Num of bos:%u\n", args->num_bos);
+err_unlock:
+	mutex_unlock(&p->mutex);
+	return ret;
 }
 
 static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index e68f692362bb..4d9bc7af03af 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -950,6 +950,8 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 					int handle);
 
+bool kfd_has_process_device_data(struct kfd_process *p);
+
 /* PASIDs */
 int kfd_pasid_init(void);
 void kfd_pasid_exit(void);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4c8a6948a9f..f77d556ca0fc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1456,6 +1456,20 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
 	return 0;
 }
 
+bool kfd_has_process_device_data(struct kfd_process *p)
+{
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		if (pdd)
+			return true;
+	}
+
+	return false;
+}
+
 struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p)
 {
-- 
2.17.1

