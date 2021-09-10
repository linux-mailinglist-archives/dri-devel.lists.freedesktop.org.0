Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FC240697E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70B6E9B5;
	Fri, 10 Sep 2021 10:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1213D6E9B2;
 Fri, 10 Sep 2021 10:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6Bgp9qde1VC2vk1pkOfrDaz1/2Z2pQ8Apq+k3up48O3hp/mny9rn1uZSwJMsNw9qotLy6Y4l6hCO9M/RDimDMWXhzoSeBtFouXY7XLLbv9kDMmahFNATWe/sPSZp/oLin7VPrSa1RHSIE85EFSzqwtC7Bpd3qTrvknAaG5S/eYxf6TamQ5aDSGHcSJ+Qe9g/ePWLXd2VBViqb0O1IiWm+foOoELYs/JSPCL8o0/zqGAgtSICCsgmnd35aFB+n8EcDm8ae4IVuvJ8F6ygEydC/vYFyBpSXZT8I+FtsiJBx/46YuhRCAaYcOO+Buqb6lfwvdI8+M5GI9KDjQHfNxRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=M/HQZQuM3Bnszs8FFD34x6cpqNzlLEjpzjh2KMOOerk=;
 b=lDsCyuDtySieX7Tx0drrUpvVsLvi+fIOJ90BpMU9XUWXE5XpI1O1TACV0olf4/SekHx0aNI5vwIrGDhH8sc6SfskWjGEhQpcQl4QWSGlSEEmSeE1HUiHLQSS0LnbWxGNYzXNqv2sqonYfyto33GZefyZtA436B2NOblvCfC2jyfJuLh+xzahSjZmr4/wxXCMIdYgW+WhfBVzW2DtgdXlpJ957KTJZ7odvGxQBJkVWeyg3HFw1ZE3s1ao+sLGQckTyJWB0sOcwMiWUHJk36ysH0RBEjRFNGSiNV3kkvyFlyde6Pz2/5iBVfb/iSiJOG3v4wmvozXPbbOPzJJhWM4uRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/HQZQuM3Bnszs8FFD34x6cpqNzlLEjpzjh2KMOOerk=;
 b=c0FfoMJAfKYZaXEykul4csc3aovRSKK3InSouGZaYVM+EJvAR1bljVcUspAoUgLR9IgUgtXaK06Jy1c0fJyfkC5rG0r6jPN68F8Lo+c3ZzLfUAcYjAxmZvjHzIPRy+MbQmWbWMOxHMfqLWt/dn9/DuS9tHTxofDxI5IhpVQjWD4=
Received: from BN0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:408:141::34)
 by MWHPR12MB1918.namprd12.prod.outlook.com (2603:10b6:300:114::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Fri, 10 Sep
 2021 10:09:42 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::b9) by BN0PR07CA0012.outlook.office365.com
 (2603:10b6:408:141::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 10:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 10:09:42 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 05:09:38 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <xinhui.pan@amd.com>, <alexander.deucher@amd.com>
CC: Guchun Chen <guchun.chen@amd.com>, Leslie Shi <Yuliang.Shi@amd.com>
Subject: [PATCH] drm/ttm: add a WARN_ON in ttm_set_driver_manager when array
 bounds (v2)
Date: Fri, 10 Sep 2021 18:09:22 +0800
Message-ID: <20210910100922.12097-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d2b57c4-5127-4e30-d5f3-08d974431ba0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1918:
X-Microsoft-Antispam-PRVS: <MWHPR12MB191880C2CDA47E94EF92BA88F1D69@MWHPR12MB1918.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8new74jwbw8kYJbPXPMIzZxzQANqgV5i6941CGmJbWghOG+24XXo8wHicmElvTVspAoesGaF/Fc/wv7xAqJD6+SxsvRJ/QA2WcmXuRyfKilZ48Kyezl+6R8g8Qd8UQBAFbn0dTKJxJOcmYoYbW+Yf+k7Z4aFrqPKKHr9u46OKtf+sU4mcFZGa/CbPSQIjiZrle71BeLS820jMrQoMO1nC+r4b5gyhiGeh/mrHctE3JdFoX8I8IIOZtR2mdp5eu2D7cukGA/M9BvPlIrkjh8/2Q+3gXFo2BAcBp9sJb/xkNo9ZvA4E8ezqXuxi5JE9XMp3yIafKIOXTUju9HQBkfwrskQl6FOdmlmVT45/eaW2HJzLcxNBDCXmIuLqoeYcjk7UrLwxF8ERgcqCD+0Qc276pUXS+ii1u0vPoYpjgRDiO5O2JjJ0fL+HBBddD1yNUTJupQjmr3oTaagwoisSjGdr7UwqJ4iBLLRhtr9hkkWxf5J7c9KLQy3PhsE8po+nPExft1WLeomkiYgXTLtnl+52F8v8Zw3szqd6d1u7cp6e1Ei9M7PeV6reRNZu6YIEklS5QXV7iziaT4+RK/7oN3JUnr3oP/lpKt3hVIfWfTU2S9zF8qVnQ2hTWOrw4cHJzVx2F9nDH/cClX1iJMHRWmCdICClA58GQCFLbO9uKihXrCBdF3ZBV3+pv7oZDiDaVXOrs73rFyeYx5ywY8zJpXxtXFdFh8B4zQ2behciMg3Dk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(81166007)(36860700001)(36756003)(6636002)(5660300002)(44832011)(7696005)(426003)(186003)(16526019)(82310400003)(26005)(86362001)(4326008)(4744005)(47076005)(110136005)(2906002)(508600001)(54906003)(316002)(2616005)(450100002)(8676002)(8936002)(70586007)(6666004)(1076003)(70206006)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 10:09:42.4372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2b57c4-5127-4e30-d5f3-08d974431ba0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1918
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

Vendor will define their own memory types on top of TTM_PL_PRIV,
but call ttm_set_driver_manager directly without checking mem_type
value when setting up memory manager. So add such check to aware
the case when array bounds.

v2: lower check level to WARN_ON

Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 include/drm/ttm/ttm_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 07d722950d5b..aa79953c807c 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -291,6 +291,7 @@ ttm_manager_type(struct ttm_device *bdev, int mem_type)
 static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 					  struct ttm_resource_manager *manager)
 {
+	WARN_ON(type >= TTM_NUM_MEM_TYPES);
 	bdev->man_drv[type] = manager;
 }
 
-- 
2.17.1

