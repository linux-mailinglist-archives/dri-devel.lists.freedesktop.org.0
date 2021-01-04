Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A052A2E9057
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 07:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D389B49;
	Mon,  4 Jan 2021 06:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C500899BE;
 Mon,  4 Jan 2021 06:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4lJ+1LR9uYAsa/3KcdfKpznFunrpPd5axsqOQ2NoGktawqGxAeM93zWw4718T8zS6VYeRHiVz1dMsXNH87q45sNcvOyg04/jY8RLeiBQNE6TrJ4FiixQlTgLyBFaZNNTbqheTXal3TKHP9JWnI2JAFvDyFPFAZ+L5PAU/5875bNxQd1ARzGTnPWXKDesgJISsJ7e71TiDrvGhC6DNzw0lPjn4JrOQi53wLOvsTHfyiGD/f76utQw9h7bIsymibAZzFgqDlcbZVzYK+oYTkWT5fTO8is3FVnO0OGGWh/40HZOHs5WA4ibtLquRu1OWpDMGs3CUAyX9BED2+oz8UmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5O7BPc1ti1h1zOvxCnJOOo/t1PwpuEFQt8sYq3qG9w=;
 b=T8VJC1bEAxQ6xV2cRs7ul6NV/GWUAuhl+amKJTCkaR2Aky/SARNubX6EiEtEy3v0lkArMShP2KcYSFslEMR+1pWSEm665N3t3x5kP/Ql+FODwskhfrEKsGfBxBwQyPFLWz6oTdRjBrtzoJlZRVu4n8fuw2+zVLgvitchU4ozJgd6+UezktTgfSrsoHIHXWfD3SjmM6Ap2/o4Tcqp+MracQ+scFmGaPh4BrEERufWbg1T6SocDULCH4CGvcvOwBze98mTJUvJ7bfLT7jf/ISWMJJevRK0Dt5yiT+nQHocXusrHaP+h6Jg127M8JZOjbUwR86yomZu8y4j4IO0Scv+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5O7BPc1ti1h1zOvxCnJOOo/t1PwpuEFQt8sYq3qG9w=;
 b=zIHCM/9QlWBdgU05/X/T8g9lSTHtNffJFZzwrHEK1lrrhJ4ZpaeGP+LdAyZfmki/+gx3g3ugt8wAFAIT+aYmekSjISeJO5SWtEDVcLyf/o2YKn7cencShmD+YaGwdewW5lZTVzECQkXIQSd8drm56Vzvaj2bq3lfMMYs4V6pjEk=
Received: from MW4PR03CA0140.namprd03.prod.outlook.com (2603:10b6:303:8c::25)
 by BYAPR12MB2728.namprd12.prod.outlook.com (2603:10b6:a03:61::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 06:02:47 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::38) by MW4PR03CA0140.outlook.office365.com
 (2603:10b6:303:8c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 06:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.23 via Frontend Transport; Mon, 4 Jan 2021 06:02:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 4 Jan 2021
 00:02:45 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 4 Jan 2021
 00:02:45 -0600
Received: from XChen-BuildServer.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Mon, 4 Jan 2021 00:02:45 -0600
From: Xiaogang.Chen <xiaogang.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <dri-devel@lists.freedesktop.org>, <airlied@linux.ie>
Subject: [PATCH 1/2] drm: distinguish return value of
 drm_dp_check_and_send_link_address.
Date: Mon, 4 Jan 2021 00:01:37 -0600
Message-ID: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d39dd9b1-d0d3-4d0b-81ba-08d8b0765c18
X-MS-TrafficTypeDiagnostic: BYAPR12MB2728:
X-Microsoft-Antispam-PRVS: <BYAPR12MB272859E6BFEE10548D8E4BF1E3D20@BYAPR12MB2728.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3u9MrHmKx0fp/3DM5LzaKC4Bow7AePxSotzo60CKj7pXOelmTYnMDwV8iEGETaEasRTZwGEvDDw3MOMOnsf5BeiSYCf8qThyzg+Du20b+iEC5BtvKuyZF72iyGMbxn3FdMdTr3QXUfvk5uTeVBdijsF7WXdiitFxj82vRKN/o/W1YNfCaXq2Xun1IAbmZfPp5syztLrbLQrVpFChxjEJdK7L6oJ9zdOZMAXaRztN7kwq8LpAFAs6B+1N3c8lYkIp8OgzR2IIEsFA3ffM2hsDv/8fAwPmKZWxOUze7/wkukpXWoP60jaEHQ9YsDZSf0pPPoNgKNmzi9LYBomgIUDNZ0VnyrQ5nuRF04q3+OiDrAEcV+fJ3vTX69v+AIG/vg/DYMe24E3U4EKgH4K3cx5NHsKMtTxzOLz2qSK9dChxnsiRes4rHS1GxBiXFYVQl9ndLn2ic/2op2QMYA6VN7yjg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(2906002)(7696005)(478600001)(6666004)(83380400001)(5660300002)(82310400003)(316002)(8676002)(81166007)(36756003)(26005)(356005)(47076005)(86362001)(186003)(426003)(110136005)(2616005)(4326008)(336012)(8936002)(82740400003)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 06:02:46.8136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d39dd9b1-d0d3-4d0b-81ba-08d8b0765c18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2728
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
Cc: xiaogang.chen@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaogang Chen <xiaogang.chen@amd.com>

drm_dp_check_and_send_link_address discovers MST device topology.
It can return both positive and negative values. When it returns positive
values there is no error found. If it returns negative values there is error
found, such as get NAK , timeout, etc. Following drm_kms_helper_hotplug_event
should be called when drm_dp_check_and_send_link_address returns positive value.

Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 17dbed0..3ef5206 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2650,7 +2650,7 @@ static void drm_dp_mst_link_probe_work(struct work_struct *work)
 	drm_dp_mst_topology_put_mstb(mstb);
 
 	mutex_unlock(&mgr->probe_lock);
-	if (ret)
+	if (ret > 0)
 		drm_kms_helper_hotplug_event(dev);
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
