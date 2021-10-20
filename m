Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93D435401
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF42A6E34B;
	Wed, 20 Oct 2021 19:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCDB6E30F;
 Wed, 20 Oct 2021 19:50:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJm36yJ41V6yJSrQ78IyqCBfsUhV8wk9mEPbQTjmQZXaWK9S25A51LcD4OKCPd9FaiOsfZNNUpL/pROlSDkcOUgZeYk3MFrvNniiu2B7PAD6HR/weUO0NBSHv83MFbIz+B6EB4bo7WyNT0f4J1nwIIOxnakb71Gy927P2qQ+G1Lu6TG77Qn9blOw+EL/XO7/g4DrNhHWHVsOguaT0culE70hf0tsKKFCR8cyUrCHEgI4t6T7K3tU6OHkf3PyTKRiimuggx+8bzqJaxoDUmViHN5YYEwevUF+wzLL42e2knx866RwFbk98y0So7hHmTbQmVuM3paUrOJFp8PzJddQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dga/Mh6GtBZYCDmHB69S69s7EZYRQtS1OZ50dLXsiQ=;
 b=f7odf85Eg0k2AepVuI0+TOc5dBqUPVhBbCnRFMoVantnjrwk14uU70HyFS5lqI2bAE2Y/fQqyQprcLoWV/rUV4YBNKherGDr7TAnVa1jHq61lhznfkh4RD9tmeektn0kpCNrY+m5Mtf1K1ENCxs5Ad+RxZbHnVeParKhqNRJONqTvPR3004vHhri+pOslF4z1ygs1ULHYZiALef4YMBZxwkB+3fQTYoqv6RF1Ev8UcEGFBaFhNTboKeLCFO4DTsydPZi7Am8MpziOX8gHFb8NwaFxzhLmI1mIP7ZSzTKIwx0QxaUfjbVHKN0R8KsTl9Vi5aX9g3pvyBAjYA46SBJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dga/Mh6GtBZYCDmHB69S69s7EZYRQtS1OZ50dLXsiQ=;
 b=lbl5Yxeepv918GyP6ADsE11wswqy2VPu442ijyrZqfMBxkgCeeIsXyVJ1GIE6/9kniqtnwg4m52gGxS/F+fLdv85iasYOUvReT/RIQ5Z6dJKaLDgTyME3zBKAwGbz4LJb9Bx7Y52TMqKxbhKekg2JRwACPGkCCpdUNNkCREK2qQ=
Received: from BN6PR13CA0008.namprd13.prod.outlook.com (2603:10b6:404:10a::18)
 by MN2PR12MB3342.namprd12.prod.outlook.com (2603:10b6:208:c3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 19:50:25 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::e6) by BN6PR13CA0008.outlook.office365.com
 (2603:10b6:404:10a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Wed, 20 Oct 2021 19:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 19:50:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 14:50:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 14:50:23 -0500
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Wed, 20 Oct 2021 14:50:23 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>,
 <intel-gfx@lists.freedesktop.org>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 1/4] drm: Remove slot checks in dp mst topology during commit
Date: Wed, 20 Oct 2021 15:47:12 -0400
Message-ID: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 325a97c3-b53e-4be7-7713-08d99402dbe0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3342:
X-Microsoft-Antispam-PRVS: <MN2PR12MB334202B7D9FCE982F9AB498DF9BE9@MN2PR12MB3342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:195;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYayGeiVrgQ4u0aOIyiUag2zbryKU2VxQlpHUAsXppgAF/7O5LrD20JZm0F8/JdvgdcfTRYBKuAP5rpsJwAj+FsslDdmPL5N0SMNa+H1j82GyrMgiDzDhmEZJ0DBdjtNutoMIWSwzGawbIebCm33hhEzO/qW6qkjQqxEM7+1YkVZ+UFXP78Ue/uDg+sl+zOBOivdl14dz0PluaIC6FL/QZzNkb4562TMInjh+ZUfYZkS3DAfGakRj+wUTB+tR/powX1F0l54Tk8DTSKLNfkDXe1m2rRxtXqRAfXfWoxAGorfesvtLSrGtdeUuYAvCTViHdk7jGpoUZcUcdQEuAbhU7IGqBYjUvkQX7HuTaEoG9SHz4eFY1YSQnZEmHctZ4kJ+Td6axPlXouhwEvcB4RSIGNgGMhPVivcVfvZd+39Z5QqWWLCTNhE71HEGLuxW9eDOT+rh+NK2C1dH2M1qVQWW0WODu3UeRzETskWDkmOPrJOhyojZRBAzBQzrxGX0D1erXEyXZ15Ymm93TPcK6CZdnL23eS7W1w8+M7GQ+7/IKOQ2hLaE7zNDnD5AuDi8loBGjig4EQDRMiuBX4+UtZAbLkxAEl6hzWKsUcDJSr7OC/O+ri6/f9rUyCbb3hQVIKop/1rwkhg/Ql3hK5LHscNvhaIZfDjyJYfSUlTV1mgO5uX2buTRUBnr3ufR3kQIZjj+FAu9YKM1YanYUtFrZzsb05QRm3eSNvW1/vrgpmhJxA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(316002)(6666004)(86362001)(2616005)(54906003)(4326008)(426003)(110136005)(2906002)(508600001)(36756003)(70586007)(26005)(336012)(83380400001)(82310400003)(81166007)(8936002)(1076003)(36860700001)(186003)(8676002)(356005)(70206006)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 19:50:24.8972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325a97c3-b53e-4be7-7713-08d99402dbe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3342
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

