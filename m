Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15F434D47
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 16:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBE46E9AA;
	Wed, 20 Oct 2021 14:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C896E9A9;
 Wed, 20 Oct 2021 14:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=babxJCKfNUYbICcnVyiCLUq2sbJc8IlqXXzD7sMuBEOCHo5U1WajZ7j4EK1+AXfi6Ct9grkY6GIjQ7EupY4l7HijB2iOwaC7BlD0POEqBaD6c72985yG3waFHwJMjhWmQDyYxTKvx8uGv4W74qfsplQIWv2vG+76H4Q7ovtn8xZXVFzHEZhvc/OKITIpkV/kWbOPy21CnAMAHylA5HsDOH3gxdgZE1Mgnwtu0cWWe0ttsA9nBmIWWOpvuWrM6hOqeEace6LmywBNG3RfeATyBIk3PXuvDiaWGyBU+7YJh/NQGj0ngL77OwQyLKr3hNv6o1suX1gTMe0Ym4pLXkkXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyTja/k7qUVtDq/5vY29r8M/tFRau84rVP2Wvk+cKzc=;
 b=HTCYVAWFYgslDTR0KQI764Huj936JvhcKSKEg3GWF3A2fsrZ1Nf0ja0zTA9jz8Jo9yS37gnbvBrPR6/3t5VbxF8U2e3ccbasCtVQFjjXWnzlRthw1jyx22SF7FBWGuYb6+jXOgeFPMxA+RmzQVB56Hcmga6FQ/AJ05PwGBuQlMdSlVNYoFaw3agPTZJdjgYYQvWmVjPhGW+Ok8mIjE9UUAP9dRbioEVLys04F5eK4EYVUVfcop134ZGkxMvRfouFkyCzmh/OxOc+b7JEgTLXNJL9UADssi/xiPwV1zAeDhS3TOBNjZqYcwNQ6jSLAbaKI5GKBPAumEcFoyUrhBTENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyTja/k7qUVtDq/5vY29r8M/tFRau84rVP2Wvk+cKzc=;
 b=u/UBbaKFfnw/ZiHrSQfYLUuPSmjfNMv8Q6mq2Omo+7cYf/Q1tXARJJoTpzwDKBFcWlPyC+vRD4glEA6fP3acHnA4INxmUJRjalsIi1vKJOh+XA2fXGDrZt+6yQ322oHJ89lYa3g4dOLSoD1WL+9vQdHIheU7nKOORhFPhyv1hEw=
Received: from BN9PR03CA0284.namprd03.prod.outlook.com (2603:10b6:408:f5::19)
 by MWHPR12MB1597.namprd12.prod.outlook.com (2603:10b6:301:e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 14:16:23 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::2b) by BN9PR03CA0284.outlook.office365.com
 (2603:10b6:408:f5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Wed, 20 Oct 2021 14:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 14:16:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 09:16:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 07:16:19 -0700
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Wed, 20 Oct 2021 09:16:19 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>,
 <intel-gfx@lists.freedesktop.org>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 1/4] drm: Remove slot checks in dp mst topology during commit
Date: Wed, 20 Oct 2021 10:16:00 -0400
Message-ID: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d75142e-6f91-4d95-8b77-08d993d4320d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1597:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15975E429605AB33C36970E0F9BE9@MWHPR12MB1597.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:195;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2MCKDnuYPXV/h99STLfL1t/utlNXjT4Tt+LKQKplNCT4dl6xDXFFs1pxH3NwVQbhe1BgYh5XZGbrVamreQkk3hKSNBVbSCAItg4cKYT8Vm9XkqrKs5Kup8TfYvd8K3G3KWx28APOHekIjP7tXmHpgPcgm79mMnEX3g7bjNpC+AgKOo3GGe/0Qs+QoHRLSxzhojxcHPQHQLs/jG9AnL+YVBM7Ev19e/iycHmA1yIIjq1V2IjrUmY80wKJzE5s3PA9Ux/joEncmUcgHt1eAUnSHYvEm3DbRJP1REHH2EihgKMVvAkTkp7iZztsqEjDCL1moa42qTLVJ0/z8v8YQMHrAcQ7OJ9JZFFVZy2dcOWA2wERqQd8+FbJmekXkj31GylrrWv99fq01AxYHdXiT249jfUgBlJAXN+92RvSm0XRupDxawwhMWNj/k27Rsf3oCRZKnWFZK9Z/wdegCOHXP30GYIrqBxQRvLhLITvB/tENxbTHGvqm1LQ0L/mt8EpfO0+MK9qOg1mTw0+gNxQvm25ElmDleVHsW3l8bSri48uS/nF4VsPYr4kaoDnVAQe7lN3BSInn2RNCg7tijvbE1CKnFHQ31rI+J1rGjl55PGeI29iXpVGJnM5VFubSZ73y/f5cu+lc9qHl873GjDi9ihEgVIaLR8lO6XRjKJCSJlE/5rMxTWHtEKZIB+gx/TmaKVTC326d0zuxJIvnCSAa9kVaqBpJrZ1Uc1cs8GFWRrkmQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(508600001)(70206006)(70586007)(8936002)(36756003)(4326008)(83380400001)(81166007)(82310400003)(186003)(356005)(316002)(47076005)(2906002)(86362001)(36860700001)(110136005)(1076003)(336012)(5660300002)(426003)(54906003)(8676002)(6666004)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 14:16:23.1274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d75142e-6f91-4d95-8b77-08d993d4320d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1597
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

This code path is used during commit, and we dont expect things to fail
during the commit stage, so remove this.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ad0795afc21c..5ab3b3a46e89 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4332,10 +4332,6 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 {
 	int ret;
 
-	/* max. time slots - one slot for MTP header */
-	if (slots > 63)
-		return -ENOSPC;
-
 	vcpi->pbn = pbn;
 	vcpi->aligned_pbn = slots * mgr->pbn_div;
 	vcpi->num_slots = slots;
@@ -4538,7 +4534,7 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
 	if (ret) {
-		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
+		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d ret=%d\n",
 			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
 		drm_dp_mst_topology_put_port(port);
 		goto out;
-- 
2.25.1

