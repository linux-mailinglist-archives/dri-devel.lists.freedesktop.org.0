Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890FE139377
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 15:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B103B89E47;
	Mon, 13 Jan 2020 14:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA1F89E1B;
 Mon, 13 Jan 2020 14:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OckXqjnYdUvl+SPlvLp5A5nc8CAF85+cJP7XrzZ/+BbvSo6sM+gEQlk/BnH0ISi5O+Gu452ymscEujaIA0CxZaCf3mFgkJhDeHt3+vxHM5+JXt45jO04KOAZQxW4786SSeMBGA6JWMY5/WWF7b5HDgYt1FVncc0d7zbC+duq+i4Qjlr4/pYDhEyODiZJEhfMLMWwsrsfuhSj2EBtAKX0pKAanU9vYUTdvzmaL3t1Q6T9YUG3Nk200BGTSyXMGRfsVHUUu3a74LzezVzMrQLjdHJA3Aqz59E9GWMaDb/xqb2ixO02zw0viOJKQFHZJ7thGrrOXAt7eTlyjypBx0aXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FP0RSCyw9jm0NpnRdh+fxeRuIVqlLeuHAUGtHHQwiD8=;
 b=QEU4TL24nuuUPxCjBWV37BGhV83U+3Q1hGigkWlgI70a/RXE+Gm3mYzjX8okU/36zkMhZ0r9bIcTOefUT0hLrwQG+Wyu4RdS1bKyKxbmVVnZCuTUFRwb54cHT9fYGSx0M2qUpQUBm9K1Q+/o04xROYSipe/VF/ACVobj4HDEpF9mCV8XRPaf3ozX/Mw5qpfMB9wFDzGedQLjJATdTHxNJXmHJp36u94wfGUELpbb9hO2q46LUcOIffY6Aoak58/LhlvWEh5k8diIb9BFYLbFCqUM+DC0qb1IXOO0vPJvBq7zO+Q64bZHwgTcCl8a25+9DFwQfGh1XoxUz02h0PiPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FP0RSCyw9jm0NpnRdh+fxeRuIVqlLeuHAUGtHHQwiD8=;
 b=IAZroWamQTuWtOXm5G3d6QoJzf1tqVgYQu0Je0Tb5xl4clrn3f6FMcFswRvm44E1dtGTsFJXvtvDo7lvd134oYzGLuYGM+1AXpmreBWNH+AOhwaclc5nJrLPdNbW8sl5Hce7D1QR7SgcKoiEd5CrrSNkzhOCYmgBqWN9N3YUgHU=
Received: from BN4PR12CA0016.namprd12.prod.outlook.com (2603:10b6:403:2::26)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10; Mon, 13 Jan
 2020 14:16:37 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::207) by BN4PR12CA0016.outlook.office365.com
 (2603:10b6:403:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Mon, 13 Jan 2020 14:16:37 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=permerror action=none header.from=amd.com; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Mon, 13 Jan 2020 14:16:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jan
 2020 07:21:06 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jan
 2020 07:20:45 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 13 Jan 2020 07:20:44 -0600
From: <mikita.lipski@amd.com>
To: <rdunlap@infradead.org>, <Alexander.Deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/display: Use u64 divide macro for round up division
Date: Mon, 13 Jan 2020 08:20:42 -0500
Message-ID: <20200113132042.25717-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(428003)(199004)(189003)(86362001)(426003)(2616005)(5660300002)(7696005)(356004)(2876002)(1076003)(2906002)(36756003)(478600001)(26005)(186003)(336012)(70586007)(70206006)(54906003)(81166006)(8936002)(8676002)(81156014)(110136005)(4326008)(316002)(16060500001)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4210; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61c5ae77-dfe0-4a9a-ae92-08d79833338d
X-MS-TrafficTypeDiagnostic: BY5PR12MB4210:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4210E6E273B2EDB4B649170DE4350@BY5PR12MB4210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-Forefront-PRVS: 028166BF91
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KnlBn0g9bpZXx8PpQis9wUxqcVDyl50xnfljIlfvbGM+XfWRkRQ2MCOtpDaChKbevHeeYeulGPjDL0q8yS3/MQyOlVZFqxmxn9WM04g3aWuhVpZ33dViKGzmTMlD78cAloSMwYOwDU3lV9VB2mqPR24kPafZrTpIh2kaJsx59UJIpHlhNDNq6a0hVHtUSTdj0ezlEZupsr3rc6M5oZSd04cGdKn+ct7Y1JnPSe6BHegXiwHwfSmK0VBxc5poS51z0AFPEj/mxGrSCSueM8IVAdDRAm3gb+oZM5M9D3FU3ONTvxrfqjbILJ/lkMj6IOWXh6uAUChSxIFKQdzCRV+1P7tSCO0ufQPoiYd2/0+SVuuq4SyiQjeNsl6M/hZI2f88RKioso8RjacZSoecq6PFbj+vN0SWPvRwNVkVjpMcFtTkkacmpUrC1T/XqZoCjMu9Cw+2TFW+2NvRaoCrt/XwI/Jloio2jZphnlJplXomGhvZCbP7AzCCGyjmUB/24qPdbaXsmWgSQgIeYVP6+KP6TA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 14:16:37.0931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c5ae77-dfe0-4a9a-ae92-08d79833338d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[why]
Fix compilation warnings on i386 architecture:
undefined reference to `__udivdi3'
[how]
Switch DIV_ROUND_UP to DIV64_U64_ROUND_UP

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 52fb207393ef..96b391e4b3e7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -534,7 +534,7 @@ static int kbps_to_peak_pbn(int kbps)
 
 	peak_kbps *= 1006;
 	peak_kbps = div_u64(peak_kbps, 1000);
-	return (int) DIV_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
+	return (int) DIV64_U64_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
 }
 
 static void set_dsc_configs_from_fairness_vars(struct dsc_mst_fairness_params *params,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
