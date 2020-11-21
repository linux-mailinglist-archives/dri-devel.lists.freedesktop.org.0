Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3405D2BBD2F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD9C6E977;
	Sat, 21 Nov 2020 05:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6306E96D;
 Sat, 21 Nov 2020 05:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5XdZlvXMZjuY61dMz+1K4reHUNmJ0QAD9qcBMBgOV+k1EJZyUipO+z3FPkf4hzSE+6C009h9PHSvb3PUCyKf8RbSMpiQdFHLEvOZqlDDXS57hRSXZfzSILdqK187GX6y6ywuBzdB7lcm/RF7NHDOE8ctsB3mG74dNPX2ikyWCQ+7CDfZ8EYHR786ZlrXiHTUyvmC78WACPegSAu/1UQFiksQ0uTAdcz5T7LiB9+G8LMv7UQNE9hti5nztShh6dB53Jf6ZUgnhcg0+b+7vHOD1uJlIHCDvTS0DDtSbUVqgoGv2SQ6Si6UYFfechaVvYe40bBZRbJSvT7v9j1+Ccigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRfmHleFpu2ppDhY+aqpqxcLDIiMPfMYW1MsRlV9bCw=;
 b=D3KU/5tUoJQWp8CVt+XOnZffmpVdDu3+8F89EorzD7Ev+7dT9zc82+I8mX8Nf8n+Ns9ToDUcYuWRTep86X/hKw0fTk8dt7EOQIn0nBcA9nxxYv3ZQrMbAzqKzkaUPGU0pjXjPD/CL7SLboOzLY6mI25MR3Rl49HMh/5o4jZM7r/vukwEvXW9Mc3iG8cXuYEpPHNEPnk0d0sgpkclSpa4bHRuP770L9NtfhpUl2LMcDD9Mzi3ndehmOxR2A1eBIWTRGBAccViQAvy+b37HzzaS7qqHaaWBrmkPZ+SWhLmeNnriMLAUcFmoX298XxLVdYD+sMWqt8Xx3Ge8wiqH266kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRfmHleFpu2ppDhY+aqpqxcLDIiMPfMYW1MsRlV9bCw=;
 b=dk/NZ+7cAIYN9bftAe/YayGD7aNq2W2tHtc4+iH3OO7MHxGmgK3dwCopBEtTum3ghXWMRfRaKjAxmMp9iq1PSOuQL4lrvzXxmKjyJr5EVMv1ui6sUVvz46yXsaCwhnpgsSydi7AG7ruR31nkfXX3fm5Heajt5R6Dqvztbq/Lvds=
Received: from BN6PR2001CA0014.namprd20.prod.outlook.com
 (2603:10b6:404:b4::24) by DM6PR12MB3130.namprd12.prod.outlook.com
 (2603:10b6:5:11b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Sat, 21 Nov
 2020 05:21:36 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:b4:cafe::68) by BN6PR2001CA0014.outlook.office365.com
 (2603:10b6:404:b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:35 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:34 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:34 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 04/12] drm/ttm: Set dma addr to null after freee
Date: Sat, 21 Nov 2020 00:21:14 -0500
Message-ID: <1605936082-3099-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd688e1-307d-40c9-591b-08d88ddd50b4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3130:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3130CA602D8D527018E11481EAFE0@DM6PR12MB3130.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLVZSlqgTCluOLrK5pePv0UqK+R51gPx7AK67Py4KQAncsnMKcY5+/S2NFJweZg9Q6XX53Peg+sPktnbFCNHLrXfTAbXqAXropdgopq4eg/jXffjABPqYmIaJyL8LDjc6DEG/dLiT/643+STrLYblh4IWeUVcsqOzCvevVTfw3zTNbyfSHVXKoEJEVnHfC/rmGePufa0nTqh4daNcIYhQwkHx3bJ2EbiEuDS+odOov5ddKQtQ0bvTKozL6cHqlzoJ/6kHIOScmGL4R+xjZrEf7WLZMA+ejzBsYnWve+3wWtvzcFUOm3ZFLvNbDWLm3YSsgKT4wfhzntk83Fgya7NZPn/QD018rOM3gVyMJxHDUEXqIDOUpH3Z2ktnqY13NZfgSynBFC+P7+cI5zEbmW/OGoY3NjKVgxAl9z+1KL8W38=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(426003)(8676002)(336012)(4326008)(70206006)(5660300002)(2906002)(4744005)(6666004)(8936002)(2616005)(54906003)(44832011)(70586007)(186003)(86362001)(47076004)(82740400003)(316002)(110136005)(36756003)(7416002)(81166007)(7696005)(356005)(82310400003)(26005)(478600001)(127203001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:35.3760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd688e1-307d-40c9-591b-08d88ddd50b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3130
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

Fixes oops.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index b40a467..b0df328 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -1160,6 +1160,8 @@ void ttm_unmap_and_unpopulate_pages(struct device *dev, struct ttm_dma_tt *tt)
 		dma_unmap_page(dev, tt->dma_address[i], num_pages * PAGE_SIZE,
 			       DMA_BIDIRECTIONAL);
 
+		tt->dma_address[i] = 0;
+
 		i += num_pages;
 	}
 	ttm_pool_unpopulate(&tt->ttm);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
