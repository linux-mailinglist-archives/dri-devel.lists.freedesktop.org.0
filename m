Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DA23956D7
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 10:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA9289FD3;
	Mon, 31 May 2021 08:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D2489FD3;
 Mon, 31 May 2021 08:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRr7e4fUIE9aMfzzQZ+D7dibATYv8gKUNFtoKvowN7MuI5WOABwvJYqQ+2Ru55U0NFzDQ4fXl7rS0m8OnegpBrlAfQq6k0dZfcfaTjsfsL0qH7tTMD3c6+h8yHHhYF63gY/b1zux7pGLp3t6YXPZms6z3m6FKLnk6p1bGNsoJO0qvRhKjVZkWm8WrsvWcimak0eb5w/+uNet3K7k13XssZ1/3XBr09nnFvWFG2T8tJ/CsZtfy8bCfgxBMQ7VS00N3Kck4ckkQWyhmKJ/DRgRoRKnoikkW6DmMKn7p1MbkJljcqicCCf4wFhy1JjF9YkGE+ki0+LW8bgOHRhY5lhGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FthBQzATa8ZqgOusGg7xTNWopE+N1DNHO1iMM9r4cs0=;
 b=Tw5k6UkflrOWNxxeN9gYErxLxO36UrfvoEnsX20DHJKd3LmZj7pWWcWH8LEtruxTVa5gbliKEO5N++8+Argpqq1frYQdW2eifLmVE8DTF1n0b14ZlxJuuDEVALTEPxvlM3txsrzsxOF0eaJiP7SHne5d/B73gUcK8rRE/bUm3/S5wS1bgc9937GSmIHfWxDZxqgl0mPxgc1Y1pvswv0xrNOKRCNAc1zKWYVzKPdGoui51ujgiw+urxe3LlucrH3yZN49BWpQWEeSWZD6n2pYHOxXoOUJflk7nB+sv7xqPYmieY5eM0UNhZOgwcLLdPTWPKFOldldIbiKYNM9ZqTy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FthBQzATa8ZqgOusGg7xTNWopE+N1DNHO1iMM9r4cs0=;
 b=b6SSbov0+0+tbn+uRHQCN3HrLPHDjOC+Cd75b5gc5ICjrL+iJgT6Zd6Wxvf2ReFIJ0QmZAEqsQ8kVjJC9gk961Yl10cmEPWKhBvUE8i3e0jAOcJfazuX1IChPF5Iiv9ElnCdCjhmDF/H9pJVhvqc53Cetnepr3HuewtctYhW+0Q=
Received: from MWHPR14CA0018.namprd14.prod.outlook.com (2603:10b6:300:ae::28)
 by DM6PR12MB2714.namprd12.prod.outlook.com (2603:10b6:5:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 08:23:22 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::17) by MWHPR14CA0018.outlook.office365.com
 (2603:10b6:300:ae::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 08:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 08:23:21 +0000
Received: from lang-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 31 May
 2021 03:23:17 -0500
From: Lang Yu <Lang.Yu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/ttm: check with temporary GTT memory in BO validation
Date: Mon, 31 May 2021 16:22:40 +0800
Message-ID: <20210531082241.4254-2-Lang.Yu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531082241.4254-1-Lang.Yu@amd.com>
References: <20210531082241.4254-1-Lang.Yu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a1a90a-0df4-4f76-9b93-08d9240d5a57
X-MS-TrafficTypeDiagnostic: DM6PR12MB2714:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2714FE85E466B832A68D76D9FB3F9@DM6PR12MB2714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8TqDxvyRc0XwmRIQvil5D5wg4PJFKA2dYz74ffhYt015iv94DWS7+pzPbXsyxoLvtQaMJwv3IsiIl519i+8LCfCSBjTr2lrlL7rF+0iH4nZTaiXE2J8sjBod4UVir2k1YvPjrYK+iooE7AGpBQDiuCzQ6WqsVVUsA0XHoqc7kQKnCLljD7oPcPGtWrzomaUnWBsvyBhe9B7VTeOGXMH4f5Fryz/yCiGwONR/nvMiqHRImczgki9ynEMp//Y6xr5IHNEXckI097aGzhlKM4pCQ+ecBI7Ha843CbmrtzGaszhIX/TErXu3gbU/2z4N67qnW123YOYN7eyUDzXfn/xLT0aI22znlTCvK2Z9a41+a9DIC9+sDo4hTdYKVpD47e2SkMLWEmp2PZSCLKnB37cqZkbnpEVCZpdFT2np2fRD7V9UD3osp2GERk0M8cOKb4WV7QldmaJxqAlxtF9aAZLlscBtWJMfVaPJkmvZppW9om+xW9zPnKhr7ffrPd/YJdi+rnAfxOcIDEMq43zji+hnyECXo7JmsFHKv/OycUGjQ0zUKFuBy/xhxrSk37WqnSxWc18NpgjQLlVAqdCkshpC/Ich6im9NU8iIwQyGvwvDUFnWANnBM9NQeoy63Mussc+bjjn6bD6XOn3puJ4gBoC1btB9F1w8INZhBXneHwKf2+M15h692UN2+E+jFIm+80y
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(36840700001)(46966006)(47076005)(1076003)(36860700001)(82310400003)(82740400003)(36756003)(16526019)(186003)(2906002)(426003)(26005)(356005)(6666004)(70586007)(70206006)(86362001)(478600001)(54906003)(8676002)(7696005)(110136005)(4744005)(316002)(81166007)(8936002)(2616005)(336012)(4326008)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 08:23:21.6892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a1a90a-0df4-4f76-9b93-08d9240d5a57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2714
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
Cc: Marek Olsak <Marek.Olsak@amd.com>, Christian
 Koenig <Christian.Koenig@amd.com>, Huang
 Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6?= <thomas_os@shipmail.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a BO's backing store is temporary GTT memory, we should
move it in BO validation.

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c32a37d0a460..80c8cb2c3f31 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -944,6 +944,8 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
 		if ((mem->start < heap->fpfn ||
 		     (heap->lpfn != 0 && (mem->start + mem->num_pages) > heap->lpfn)))
 			continue;
+		if (mem->placement & TTM_PL_FLAG_TEMPORARY)
+			continue;
 
 		*new_flags = heap->flags;
 		if ((mem->mem_type == heap->mem_type) &&
-- 
2.25.1

