Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A02BBD2E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21F36E973;
	Sat, 21 Nov 2020 05:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802596E96E;
 Sat, 21 Nov 2020 05:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYdHVGhhGHaQ0Aln5NqYN9Ol5NUaWV6B7Lm9hwBglc4CRnc/4bm3YEf0fHMaC27drpA8xMv8E2svIVA05ZXcKW8f7rCXXrIvGYOMheUsYlm7cKcTg89EgUZRDWAiKSFWhBgsCxHjHh+X9Qi0KgxseIfyzJerRpp9T01ZASkhFj87+1XXew2+c3wEoEgNQn8SrjNTfvDCKTD3s9NBwtzMzwtpmpJp5Sy8ZBdoVi6j2EzwBknaFbaNwPNGXu9k0f5qVuUv2/RpvFPeF9ylE9o1yM1elLB67IfOLfxhwJpuxEDKMP52zwHIQlWbyUrUANKGiXQGiThxxA54H1j5gzM1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17NDhdriXC56m3GTpqqX/lPVFSaQt82E3Tw4hkDDTJk=;
 b=GqTNQIrkoxb13BpEV8SCJNO50U6OBHa8fIdRATxf7vtOgHI2zyTi7SQwGUL4yHxOZkvfyNLxcsSnY5IwkgKfGZFHNt9u/XJ4BCV5bgU7MAyDSmh32yvJpvQAkGHXCdXUyiPnDSL1xnLzZc3+pT3Mw+EDxz11b67XURcecC/lco5dP7TtaL1ffPZlUP/D9G7KlLnGMTXra2BGNsp3RaQIPzes6wBpi7gfw2SUX//HERpUGel4icUKhjmxWpRRt3tRhYwR9RDNJd6KyRzGyGq3EMdYVHFBo9tD9G3HiaVVswF21JsNGgqzV8oJtse2+WDHj/nFznTh1BansGhGsQcStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17NDhdriXC56m3GTpqqX/lPVFSaQt82E3Tw4hkDDTJk=;
 b=blS/lK109IKnvNv8AxoFxZjL6pn9SGyUrLVBprX4eMGSyP1SGjoR5oomwurBAbM/p4aC5t+iJtJ1KpaDSJnIDtS57iw6Ev2W2w+u026Zg2H/3C5M4FkoWPwNuZyvEPamCxXZYWhsCsD5aOukMSV/zX0YwhdmfjEKu1d5w/5OTHg=
Received: from DM5PR17CA0062.namprd17.prod.outlook.com (2603:10b6:3:13f::24)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Sat, 21 Nov
 2020 05:21:37 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::85) by DM5PR17CA0062.outlook.office365.com
 (2603:10b6:3:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:36 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:36 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:35 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Date: Sat, 21 Nov 2020 00:21:15 -0500
Message-ID: <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2784e4d7-d5d8-4490-8d5a-08d88ddd51cc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4333:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4333EC78775C47B5B34B572DEAFE0@MN2PR12MB4333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkfh1EO+pC5T1KE+ufhB1E2Yo4RgfmQnC+DtX8Q/nitD9tBKnvlJaUQ3B95C0XbZKUKZj+61NxmIgOrjGibXjmFxjaDrVwDou8ogLjByHxA4z9t/y6ww6FqUOfvuw3UgahMtrxNpK/Egx9UsJK07WtjDiU+D7h+rQC02HyE81yf7Qe5wf37494u8LxUsRpHtl5Kl2dZHKgRYmofsE0kg9v7sqIR1SxvCTTeWZY22KU/BeSUQEUafxYIil9b8wKNxnQtnm2CAedTTqPD1TVNLebvA3d5ZfHnXMtu6Azz07mL+xK6wyVpvGPiq6GoALz8SAIXXz5l3NRCdg1aoy+rrJ9pWmFFfXlcYwbJQMf0sSWXqngu0rhReacOeQQHGvyqzgYGx6cWxToe0r8UDTU5eQw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(2616005)(36756003)(478600001)(2906002)(86362001)(7416002)(6666004)(5660300002)(4326008)(4744005)(110136005)(7696005)(426003)(8676002)(82740400003)(54906003)(8936002)(44832011)(316002)(186003)(70586007)(26005)(356005)(47076004)(336012)(70206006)(82310400003)(81166007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:37.1644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2784e4d7-d5d8-4490-8d5a-08d88ddd51cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's needed to drop iommu backed pages on device unplug
before device's IOMMU group is released.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 1ccf1ef..29248a5 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -495,3 +495,4 @@ void ttm_tt_unpopulate(struct ttm_tt *ttm)
 	else
 		ttm_pool_unpopulate(ttm);
 }
+EXPORT_SYMBOL(ttm_tt_unpopulate);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
