Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E312244D3D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 19:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46B46EB84;
	Fri, 14 Aug 2020 17:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD46C6E174;
 Fri, 14 Aug 2020 17:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuPE/uJhCDeeW0CfWDJgPqdzQ1fja+FczMJuCV2ifpTsp5f5rI3oGYvfbGAXvmFqfuuBo03GO/8oamA9xJML/8yQvBhLNnL58vQ63IUUYlgvjlhBljwilCDNb9g4x8zIUlyzm/m1WWZ5J5GAIxjM4CfI04d+1lGG52tfKgnYvmH9hproOEq0uXP7WkG/2Im4b0jLiJ+EfKuxU7Y+tFKy32pbXhKnC+dP1vt4JuevG5dZOKWYswTnzhBZpMslrHc/HmKpt5kAb+dzvBHV6F1SEVBnsNk3iZdWCpTfcalFmWALVsxcfOyBPl8Wf+ZB8J7sBqtmtOJAaAHCTM0MS5MvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBGZ0NbshukLKSLL0IJ71POJ1VskJVI0rDwwwAVQ/GU=;
 b=l5IXQ9WmtArUWRTMQoynq8IQ80c7M+juo1rA7e0vCKgku3XrIagcsrdWausYN8pEt6HrIkLoXGBqmG5xHpfwysoAc6GOG2asQH5fN2NGimtljy2vXg3qgxd0ubfH15IOOTo1xO58gjtk+cpUXM5Ray1RNTbCH+Q4acVCQvm9gvs6rEj9mtBZRBhRTQTftlh2nf1WnoCziMeMSmx0u0WVauxPMoQSnenLpkPPpMaRd87mUUtK5uszw8ZyAq9Dhhh2k1mFrYZfJVebUjmtXj/QeFpA8q9qBK3Scyx8O64GsSu6kSiXFVdwYqCiUjwc4aCOXmZMoJbwBXoN7CJOvDJ0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBGZ0NbshukLKSLL0IJ71POJ1VskJVI0rDwwwAVQ/GU=;
 b=LpT9dHf0hUZOdBDAlpch74e27a+QXYVhq73qq1SZG4Oo0wMMM72O8o3swG8Tg2DAwVAEPzr+prJyBmm+m/DFwC5hhe0H7OEqy2hJrSfwwiEToue0LV8CJEi/mQhi6I6vN7TinaqpAjyuzCFu9YdNI+hJ2cAl6rLODdy0tgDDdcs=
Received: from CO2PR05CA0098.namprd05.prod.outlook.com (2603:10b6:104:1::24)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 17:01:51 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::a5) by CO2PR05CA0098.outlook.office365.com
 (2603:10b6:104:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.13 via Frontend
 Transport; Fri, 14 Aug 2020 17:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 17:01:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 14 Aug
 2020 12:01:50 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 14 Aug
 2020 12:01:49 -0500
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Fri, 14 Aug 2020 12:01:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <mikita.lipski@amd.com>, <nicholas.kazlauskas@amd.com>,
 <alexander.deucher@amd.com>
Subject: [PATCH] drm/dp_mst: Don't return error code when crtc is null
Date: Fri, 14 Aug 2020 13:01:40 -0400
Message-ID: <20200814170140.24917-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3342f5d-e3a7-40b3-ac35-08d84073bd02
X-MS-TrafficTypeDiagnostic: CH2PR12MB4152:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4152EE3C9DD43147DEAC1846F9400@CH2PR12MB4152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4RtYO/b1rMAUDdHQE+epv1oxu12oc0lHE5LtBZrdlRIsurwwGVgoN/o97CfO6C/go/GWkXLIYPzSAhNyaxasKaM5SUS7nLgqKQDoE9kh6x12De5tSCtyNwk5hYwiRp0GOIrNHgRodngnuPOq48hdXRxKSDXBEIrMsdiHPG2x1+fflTZDMhhLlEMwr0VGpNdf18bzaLfiWelmTi7zi/dJ+cTQXGIisajGbAKrE4QNpAjzedCcsG1rePuZpreskCHvmFhWQRcABShwgADJyW3ol1kZ9hEep9hwREsdf/xbIrEYvKk5xjvvYIKWZC+HG+S0AjqYR7h6C2aE7VuIGYIqmY0Fi6pY726uKxtl9/DblUVxwqnmYj5he3DtRXKXoh/rS37egAevAcoHAIVc3B+7w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(70586007)(336012)(2906002)(6666004)(478600001)(356005)(82740400003)(70206006)(8676002)(4744005)(83380400001)(7696005)(26005)(86362001)(81166007)(82310400002)(110136005)(47076004)(5660300002)(36756003)(8936002)(1076003)(186003)(316002)(54906003)(6636002)(2616005)(426003)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 17:01:50.7851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3342f5d-e3a7-40b3-ac35-08d84073bd02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
In certain cases the crtc can be NULL and returning -EINVAL causes
atomic check to fail when it shouln't. This leads to valid
configurations failing because atomic check fails.

[How]
Don't early return if crtc is null

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 70c4b7afed12..bc90a1485699 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5037,8 +5037,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm
 
 		crtc = conn_state->crtc;
 
-		if (WARN_ON(!crtc))
-			return -EINVAL;
+		if (!crtc)
+			continue;
 
 		if (!drm_dp_mst_dsc_aux_for_port(pos->port))
 			continue;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
