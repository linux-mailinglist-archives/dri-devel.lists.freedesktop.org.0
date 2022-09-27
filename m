Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE85ECAC6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A1D10E085;
	Tue, 27 Sep 2022 17:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC34C10E085
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 17:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxr9IbDJQHaoLV3TDk88fJ9imxDEQepA7SaNtoUMUTRGJ4kZ63RqIU8n8G6cVSSu//62oSeeRNpzqmn9xLg3afa/RWTm84BdXmj8B5xvdUzf6Ro7ccyeQZCGOWrBmauKLhoprKDIkIUuEVyLF1nMvukB8peXxgD8WZvT7fK4Rx0dFGHQzdYB4SIDV/97nyhc1d10TeRnrrd0+JwWcR3GvdhPHYPJzw+oNEthh7E5n7kUZfDH4/6gmdYFmp560Sh8iasgpdhRRp5U+hj2Ax4Rb/JxtKR/LjRUwhRIAGR+Bve5Fa4rqTvfwUXXP+saUCFWzd0O1ipe+MIHOSlIuNYESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh/re6H4qm1SfGhVgvtaUd2q5kotF2nVKNU02OX4tfY=;
 b=iHRqCt29XVW5yZ9glPBpGMzN5VVTFajAaPviyBUsxbggLJt1NphxeE58XJ6dYghh8q+xStT9TV0chnxL9O4mgMyxHbaRloPo+r48ZRtecvhEBxXwn1NvVV3wVpzkGEHep2XTMsAW/IGj4UFjtAHQFe7JUg3Dx1hhI8EQUI65SYshusxJSVo0Q+fWD79A4YLaNwtpbRpy02BLUrX21iNnglVOiIEyyERJJko/iNU7/TilqdiO6Zfy6HHcBmZ3HoSEgs3FgFmI7dk9InQJdflTmcbtvNORSC5GYv0k/cKVekUyYjTMHMjyS6ZA21NkVwX/7o/jWwReYMi5L1FDIeJ9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hh/re6H4qm1SfGhVgvtaUd2q5kotF2nVKNU02OX4tfY=;
 b=xbFnrNn8/Te97U9lqga/45FGcdR+MoIlfMTNzY38FH3At6FPNNFCkZoV33hxTvE+4GkzioKZ/FF9/5lapYrAlN/wcQieln8RxgD2+O6oCdXN4feVbe5aIzHfqjmaFQUk6M09gDZf9UvXOfmDsLB/eHmzWQjlPBaXllI+EB/4C8M=
Received: from MW4PR03CA0181.namprd03.prod.outlook.com (2603:10b6:303:b8::6)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Tue, 27 Sep
 2022 17:24:50 +0000
Received: from CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::42) by MW4PR03CA0181.outlook.office365.com
 (2603:10b6:303:b8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Tue, 27 Sep 2022 17:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT082.mail.protection.outlook.com (10.13.175.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 17:24:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 12:24:45 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] dma-buf: Enable signaling on fence for sw_sync
Date: Tue, 27 Sep 2022 22:54:08 +0530
Message-ID: <20220927172409.484061-3-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927172409.484061-1-Arvind.Yadav@amd.com>
References: <20220927172409.484061-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT082:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: 81454cc2-772e-4915-e1c8-08daa0ad2ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FhhksBhOXcnTXFy00pLGNnM0eW4sSb7lLOP4UM7mT7lkJcZebHsOoA0z1qcyQhk7KdK6N1llhPg8RMRT0aiJVBBK0r1buKWMKWsjccOmW0bzNi4JD40ZRBNnu5AFVWSX3cs0BJwOhTykIxRSgBfwMJMA/Eqe2bKb3f+Jlxgz+FObxOQPP+x9aew4T8EokpW156lD978GnLovH0rj5xu4od4NELFAaLofSKDnwJZWYUjG/pWKZ81sbKKzQjgfFe2CfEQuiJf/4kVeorOiacC58ILb914JdN2SMXh0zQ+m86p1yaC53d0RyyZWOQls05uk6emw6haXZn11ZoOZt8LZYnVXMy47ttMeHyQ51zMjGSL7ZhhukII/sR482ZCXQofWMtTzDELqIlYsoLt5KptMEYkdaaq6mjgGCEa6dixBVfzp4Y0WwSwpUTSaO16BAj3f24jENVWavQfzpAH0hGlUri93f7G3JDg+jjns8jY7UxFx6ZHCqbzVhT6ekcVZsCFcvsFWySDMZPym3DBC0+QX6bOlXBZYbAV81wtvQa5eb4SVE5xA/jC7OSDm8U0t/XHlNDRjOak25CRbvoCWGqojzkrDcjlnXkFEV1u+qwXIANStZ82HhqSMlTnjrsyW4mujm9/wSEm9bst6/1ovxaH76m1h1seimFY8tupZKHaUsPkCw1KqYYId6pYpPir1Ky5OHcaIfQRo+rLsbcyVhaFW4BX3Z1IDb06Cxd9LA2SF4uMSdUEyCsPBmcWoIsrvYz0DR/ti2MHZQBP115F6667DY6MYz/4G72juDc6Ra39kr0enTTtIvojIGtFNn2QXxJe0JkufgzbK97tLcZl/5whDIPHo+kazZQWO82JeqCpXUxQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(4744005)(40460700003)(478600001)(921005)(6666004)(356005)(5660300002)(2616005)(36860700001)(26005)(86362001)(8936002)(316002)(336012)(36756003)(7696005)(16526019)(110136005)(186003)(1076003)(82740400003)(70206006)(70586007)(4326008)(81166007)(41300700001)(40480700001)(2906002)(8676002)(47076005)(426003)(83380400001)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 17:24:50.2164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81454cc2-772e-4915-e1c8-08daa0ad2ef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's enabling software signaling on fence for sw_sync.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/dma-buf/sw_sync.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..d2a52ceac14e 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -244,6 +244,8 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 		       obj->context, value);
 	INIT_LIST_HEAD(&pt->link);
 
+	dma_fence_enable_sw_signaling(&pt->base);
+
 	spin_lock_irq(&obj->lock);
 	if (!dma_fence_is_signaled_locked(&pt->base)) {
 		struct rb_node **p = &obj->pt_tree.rb_node;
-- 
2.25.1

