Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617971A1105
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 18:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4AF6E044;
	Tue,  7 Apr 2020 16:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DA26E044;
 Tue,  7 Apr 2020 16:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+xR0RgQR9Lv2Q0lGVhAfb6CXlOH99cU2QFKKQlgYmtN53MnJly4DiEkTKcah/Ge3jaLHfN99L28LuQN4fbICflavoQDFy2vU/kboEBL76ABa6TGq6LcJna5sCyzEhySpdGapnb9GJYR7mpsXbFFg4hqKhdv6okUm/U/9KLmMY4rD2C4psHc6m38wxw9+YS/qOk/49Vb9motFM9Bskp38G1Ff74IiV3a9U+tBgeiws5NIKf0wrGY6MfdeUWSXRsUcfH0Qtb9N2511v5wCYWpDOxfOY3rWpl+i8ElQYIfyP+R/wjUHLlrCCUfWsESBHcaEVtrsvJUz38rrd1k81syTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oes81vBT9H4q5sd6RMyHphDhAEnivdn1V6yanqL+Uu0=;
 b=hlfRjrRENzT3/wrTVv1OQH3El7mr5I8eIg9OcRH16GvnbM3MpmWCC85tDFMQ/gmItpSeqKNYRCXuC32Vwxy9iR72EbTJ0gDb4/IQNq22V2aYThV1V2CJtPZd/dO9bqhhEa1ho5Xce3njown3X/rA/dcSEufUJ2McZ8asY8tkTOjMshNNg1h0uxEOOnozVNR35NMfJ3UCzmQKdUlSi0ZO10ukaXFC2NKb7lHx2ttD0WNa7MjQNV/ZEBubhpkx3Az98/E3XmvvPgyFNn4lEeIz0A6/U/+DF2c2fDfuyh9I2tHe87Ry6Jv61S7E7X96aTB377cEOjai46mT2J0El7rXlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oes81vBT9H4q5sd6RMyHphDhAEnivdn1V6yanqL+Uu0=;
 b=xOMJ6UNuGVwymy3RPNq3RCrPbLk59PgeKliuYMYo3dQQ1EF0HLT9eJBPypCCl5gCNz0OY23PwUSKnRcg3nug+gPhOQNWGTeJGlQKBh86obnD01KmPaZEy+BxQRt6g2zxiuTFfpDnWQIzUPfqUwY0EozNLmhIfTqh682LpWDeWX0=
Received: from MN2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:208:134::41)
 by DM5PR12MB2488.namprd12.prod.outlook.com (2603:10b6:4:b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Tue, 7 Apr
 2020 16:07:25 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::7) by MN2PR16CA0028.outlook.office365.com
 (2603:10b6:208:134::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend
 Transport; Tue, 7 Apr 2020 16:07:25 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2878.15 via Frontend Transport; Tue, 7 Apr 2020 16:07:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 Apr 2020
 11:07:25 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 Apr 2020
 11:07:24 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 7 Apr 2020 11:07:24 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Zero assigned PBN when releasing VCPI slots
Date: Tue, 7 Apr 2020 12:07:17 -0400
Message-ID: <20200407160717.27976-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(428003)(46966005)(70586007)(2616005)(1076003)(336012)(54906003)(478600001)(110136005)(81156014)(8676002)(36756003)(81166006)(86362001)(316002)(26005)(8936002)(2906002)(2876002)(7696005)(186003)(356004)(426003)(6666004)(4744005)(47076004)(70206006)(5660300002)(4326008)(82740400003)(16060500001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b23ba6c-b6d6-424a-73bd-08d7db0dc367
X-MS-TrafficTypeDiagnostic: DM5PR12MB2488:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2488CCC7341E164B8AD82703E4C30@DM5PR12MB2488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 036614DD9C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3ZdqQkqIlEnLVFLojMuyKkV9YtJm7rKaDLmutv39+lculUZhH/T8DCcMW1vGPAV5qz294v8wQBBCTLyptNQAMhgBBrXk8jmyInfc/c0yDmybsFEKxzmHo4Tvg6t/Ia43+jnXMU1ZMe9aVDYy//g4iGcfIPSPQoZr1+A7s4nPihzue6Hqr7xbNj9Z+TkANLVh7a4Cp049tDITZHzrmz3lOD5VL+v0+esu1i0MmYDt/y7lqh9zG/L/J38/8BpXRSi0ia0Ujs6V0c+IKGmICL96/WiHTnth2l3OrOFRpZqrW7kWBRKxDh9dK2tE3g2ACbvYLdrz0Do9K2blRSpCFWvHy5KdC9mszW2lkLBrgXqCWa46VgcQZ6/sTc1CNSOoKCX6ykGwCzGCu20HUG6tROqefQTfqEiKrPt+5OCmE7am2eePpvvDZt3DQf0l9bnkXK5gOJQSD+ig9EhLRtuV+zhDCgIGtsjtIc22ThYqKY/KxKfA34h0iC1yMkHGLQp5G7WaOm22bKKG5VbKyeYSGs4pkmNsj//qqbeHVLv5j6Wrvc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 16:07:25.5179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b23ba6c-b6d6-424a-73bd-08d7db0dc367
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2488
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
Cc: Alexander.Deucher@amd.com, Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

Zero Port's PBN together with VCPI slots when releasing
allocated VCPI slots. That way when disabling the connector
it will not cause issues in drm_dp_mst_atomic_check verifying
branch bw limit.

Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 38bf111e5f9b..ed109dd15df6 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4276,6 +4276,7 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 	if (pos->vcpi) {
 		drm_dp_mst_put_port_malloc(port);
 		pos->vcpi = 0;
+		pos->pbn = 0;
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
