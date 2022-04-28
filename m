Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84951342B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F48B10EE3D;
	Thu, 28 Apr 2022 12:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423EC10EE3D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+3pC0Ddf64ZzrQ1dx14AfeMAS2sT1C5DXXJ2NGu9BSTsZURxoSA2I7nEkmRDab8S4ZWFOqjxIMkVBmcfaL923Bj7jTgut180yWpXgxXB7FzrJv0bF0OBGawEpKYf8fnPDLgscOYwfObE8+K2Rav4HutKJyqXtSIreP+RlFx8r8P8InnZMa6egBZm5X+XyppoXrfvQPMhlGCXSUhtFYNRwXiWNEqjxRcCwcJXItcbefEuP5hGtTQHm6kfFKz8U2WH3E0Av5kdoBMiyE4gkmAT2sxVErxUloPPPaSI+P4SyFSZRqcDISHk8ORtTDOWrjVG4ylpWtwCz+BJ6JZPQAnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2rQINKGfsDqh6RywSQb0KwxaJ6kH5C+Rb9Y5S5H2EY=;
 b=elRbySqYkKlSLE05YQqGisxrQYdeKhqNRWtD0boWilPC2HW8Ed/pHIrLPd89LpWjNtmVLObJqPtV48RN1UwvOGTdkjJ9phJ1GFvPRbdalkBpLNKxRhIvZSXa523UGd9B4r+NupnNoIZQ3bYvj1tU4T8qoOge079wf54k4mnMgFO1EpEFUXT2ftod/amkf09SANhp18jb5tHQ70OOANEDB/C+PnQosNvpuN54bkOmYn1M5ARA0Cd7UbYvnMgswlVMae8HidrVCPtp0YjRpEY/F2B4z6L/LV/Vd+zfLE/a7ycjepz0iifSnhXL7vsFqsaeuWi8YXwskY5vlkPO83zfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2rQINKGfsDqh6RywSQb0KwxaJ6kH5C+Rb9Y5S5H2EY=;
 b=W99vjK3qQElGqD4Z9zhx/Xd13iHp8i7wB4HS3ZC6rPeoXIAMszo+HokUBaGp7cD4lqU1SY0/9O7GfAcpi5Qf6csC25bwHk3I+56uAT3X0JXtu9Aclmvwu2UrxpUU1LGLFMl4yNuIbSa2+3s+sM3xo4AAAjM7TfdFwIfTD2nujKc=
Received: from BN7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:408:34::19)
 by MN2PR12MB3069.namprd12.prod.outlook.com (2603:10b6:208:c4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 12:49:48 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::b1) by BN7PR06CA0042.outlook.office365.com
 (2603:10b6:408:34::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Thu, 28 Apr 2022 12:49:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 12:49:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 07:49:47 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Thu, 28 Apr 2022 07:49:45 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Lower down debug info level when receive NAK
Date: Thu, 28 Apr 2022 20:49:44 +0800
Message-ID: <20220428124944.1683680-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30eab8fa-3b37-4449-66ec-08da2915940c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3069:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3069ED7E0F079E2E2182AFADFCFD9@MN2PR12MB3069.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XNG7e2z60zkv71ztKwnuf+8HE0R5b26OOa8qASvnsWAG2xxamX354Gk16J0nEFivDTPnxD2+h49yX0aOVQOS5MMDl/+/t7ga/1IXFmFSHL1Z3Pr7v+ODNMILeRcDASa3Jlup0rV84TojKJh7mjVQDurYad858EX5FsaaTg8G8Bk/xn1EgNj5wW7lse9YT7zzgruhUjtea8dHwyBuaPkRILUMX9Yf6qvscno+72P/QL8E9eqvVOHe8bBHEXJeJ9ItdytAdCpQT1Yh8hFTH1tAnuD7rR72P5PsMFL/vw03XCrgFPqCVgzCL6R8SsqgQbRNMvKTMlzc5nFuHaHTkmHmvx6iRpPixCeXizCYCC2kOLn839VSefWCL9kjxJcmUXbDcuMW+wbN6UyBBk3H9XyMxUt2QITMmoyrtAtrLBKk63SaQAI1eUcD/y1sC3//uC7Be/fY9EoTVCh5RgLFcs5WcLHs6NL+XNR42g3HYglJxerTBpcydliy8lYhxJSvV1gnFONtffCR3hzvjsJf8TxM/8NObZwWNg6f7nypj19jLS4d5KeAArmJvGKMQSsnQ5rl6Ci2KwVvICVg1HFcAodmmvRE4co06yQDrnR2idFADtcWTZu+lufPW1OhT5EavQsuQ6TBj3NROu9FmSOkKYWvZ/XgeBnLVquwet2fDUTqHMsehiMJmE4twGbgVgsuG9k0pbH59MAOXv11as3utHRYA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(5660300002)(36860700001)(7696005)(26005)(81166007)(40460700003)(2906002)(8936002)(83380400001)(8676002)(4326008)(70586007)(508600001)(36756003)(82310400005)(86362001)(2616005)(47076005)(426003)(186003)(356005)(336012)(1076003)(6916009)(316002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 12:49:48.0614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30eab8fa-3b37-4449-66ec-08da2915940c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3069
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
Cc: rodrigo.siqueira@amd.com, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
It's reasonable that we receive NAK while doing DP_REMOTE_DPCD_READ.
Downstream device might reply NAK with the reason and source should
react accordingly.

e.g.
1. When downstream device can't handle corresponding message in time,
it then replies NAK as reason been set as DEFER.
2. When multi-function branch-sink device doesn't enumerate virtual
DP peer devices for those multi-function down facing ports. Without
virtual DPCD, branch device might reply NAK with reason as BAD_PARAM
indicating this port can't do aux DPCD read.

It's expected result. Not an error.

[How]
Use drm_dbg_kms() to replace drm_err() when receive NAK.

Changes since v1:
* drm_dp_mst_topology.c file path changed. Folder was rename from
 'dp' to 'display'

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8526aae75c6d..f27aa0b95bea 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3557,9 +3557,8 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 	if (ret < 0)
 		goto fail_free;
 
-	/* DPCD read should never be NACKed */
 	if (txmsg->reply.reply_type == 1) {
-		drm_err(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
+		drm_dbg_kms(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
 			mstb, port->port_num, offset, size);
 		ret = -EIO;
 		goto fail_free;
-- 
2.36.0

