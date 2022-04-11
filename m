Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC84FCF33
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 08:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6887A10FBA8;
	Tue, 12 Apr 2022 06:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5154 seconds by postgrey-1.36 at gabe;
 Mon, 11 Apr 2022 15:33:15 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614A710E346
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:33:15 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23BC8RCZ026133;
 Mon, 11 Apr 2022 07:07:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=UatKVkxkfCPI1eM6LsEzbQ6C4PnqXjiSiPAMUYXKzxg=;
 b=RLTJ0YvpTd7naAP1qYAfEkIufpl12gVBKpmB9mK3j4+gNh/+rzoIHjWMqkssblh0LfrQ
 koJ2wbFH43yZEjJQ1rC6nW5vtd3nrhJoABH5lG1YuQsvHgvbD2EtYWZrKbvAdtISq1J1
 ESFqrVvtoiZrhoqUeZJeKPj71Hu+Km8Md500gPyUwSQXUuUErB9EVq+2AV6ZUAUnB+eM
 RLYBISAVpLoTCcyM2m5ddmeox60DKTMmqbkyFI7ObOnVBBIr9VR/2W+Shj2cptzJQoay
 JgzbmYX5p87LtfQwTHzEl66gue/+biP8tEwJTp4ylD565gGM5IHbL1z5RXzcKYzfiEMf bA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 3fb6qvqkd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 07:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UghhPaFlOUI16P5rpZS7jB2FvuAO4VuU2W9ZqqujCxALOx643bInqTKBwCleDmPwHaNsaVsP97at9ppQ4bRI2lA78tLh3Tm6Ya8DGSK1yadHpgwrneynnh2IiQSNYRy3qlbMedz7jkaa0FGM24ADA/7cIGvK/HMiu0X3ROqIBe1QwP4kGbRNN30806Sn6DQnWYc7lwN+yXDEu/7CzVnuVPuTEME3k0U3ZlphAqCtK2OeZwbyXYEOt/5OtoW4RKS0gMKZ8YwqWNl00q/u7pwT0am9yGMHysh7tLJl73Z39yowa6yBTEACz3dtg7CnT6LczME7NNGoWhDVK4bfLdtaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UatKVkxkfCPI1eM6LsEzbQ6C4PnqXjiSiPAMUYXKzxg=;
 b=iktvMqmv5FOs3976GFbrk8R6CiDp9mD0tn9DjXQy12URi4f2YKCdM4UU3O6bwm25E6SMz5vUwG9dB4Lab2E8Cz65lgkc7FLBP9Q9QlzTuQAvISIsMyyMmE6CN1KOBvE8lZK0nIgz7ACqQkXa8BQg5yH68a6T3yzybOdl29HoRA1anZ6yHx69Z/0aouIiDR8WhwpGZKleU2ApHOX3oUYvT7BpArc4nIG/R9yEgvJ/362+Mjz/Ek3YNCw0RivFcTcwGvOOp18X8Nt8O7UtdBFTLqp/JhvOl1eOqdkFiOyhIS8xtAw+VXDGpsJLYyaZSbFh97yPpdEU86G/MdcbWJqOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=intel.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UatKVkxkfCPI1eM6LsEzbQ6C4PnqXjiSiPAMUYXKzxg=;
 b=UCsAW2clLk/4zRq64hlXjFuVphiDWrhkyrsJggZdCUC9+nJABkdgGEtrUxmfoMjj6HPtR4rGBioIMS6HA0EIv7Ay1fcdQEGM5viiatW0vJs49RVJMXAnwUXE21xz5Kbh9tMALYwmvTRWrcq3KHpavBVzDu1Heexyofbx61MSgmg=
Received: from BN1PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:e0::15)
 by MN2PR07MB7839.namprd07.prod.outlook.com (2603:10b6:208:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 14:07:06 +0000
Received: from BN8NAM12FT041.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::6c) by BN1PR10CA0010.outlook.office365.com
 (2603:10b6:408:e0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 14:07:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 BN8NAM12FT041.mail.protection.outlook.com (10.13.182.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.8 via Frontend Transport; Mon, 11 Apr 2022 14:07:06 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 23BE70aR032352
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 07:07:01 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu4.global.cadence.com (10.160.110.201) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 11 Apr 2022 16:06:54 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu4.global.cadence.com (10.160.110.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7
 via Frontend Transport; Mon, 11 Apr 2022 16:06:54 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 23BE6rEi015872;
 Mon, 11 Apr 2022 16:06:53 +0200
Received: (from jpawar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 23BE6qd7015869;
 Mon, 11 Apr 2022 16:06:52 +0200
From: Jayshri Pawar <jpawar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/bridge: cdns-dsi: Add support for pre_enable and
 post_enable control functions.
Date: Mon, 11 Apr 2022 16:06:06 +0200
Message-ID: <20220411140606.15654-1-jpawar@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08164740-3146-4c96-7251-08da1bc48fd7
X-MS-TrafficTypeDiagnostic: MN2PR07MB7839:EE_
X-Microsoft-Antispam-PRVS: <MN2PR07MB783937B5E45389D07DBCCF50C1EA9@MN2PR07MB7839.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/I/PfTMF2S4lOtdbdRpXzKUBGzkDtMnvTBjb+0RckTjKFdOIX/Y+681VxVChUK5Xfl6qQkfy1yIgugEoHN8OXQ7Wcr2jB4h70fyYt5XweIOOIZATrIKzEp5k9289p6lffN7EEIcGMXZwRDf7X5M5wfcbkEHdxVLdOfd24WxgEdRexW1Ai2cbhEwla6UlXgDhD9OO/Bik8tOMFf5IeVWRf7+yTaT3b/Yj80XQPana2H2LAOOiPw2Q1ix+1ApQ4x8BeP75emCnCKYfpAbBNdVj419VgiRq4SSM22NlUarXbZHRJCBcg7SxHRWMgxeuEIZplH/cy+YECIJcIPFLVlx6KvWrmGvINwXg0ZNItgrkqiy1fGeopRjQn91keQwctp/YhxOExhVEpyVORLtlrhb23Y4vghSN5lbCk/Tg3G33SZkf0TEtrpRpSIvTvdqsMKI9kYj78J4sV/WVtfr89dcoI1G7wGQHbh2ygWSbTgZrGEUHbRGmEHmTKx0aAqg21TtezBzn9kmBbEX78m8dCRKoTEmYZoS1IS3k3OIr/C57/4pCQ2e6lTG/DzBHemJF25D0NojSf+vp13jcNFW8ZJOKtd/+DXnnftUONZUW6RtkMOc5AzxyEFtOmOSgFSWdBBYYEagQzm4YWVhR7hwKahjqsfeAiptxiuFZYH9IpDFBUIauibBqWUfqeTFdb733mPq
X-Forefront-Antispam-Report: CIP:158.140.1.148; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx2.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(13230001)(4636009)(36092001)(36840700001)(40470700004)(46966006)(336012)(4326008)(47076005)(82310400005)(8676002)(426003)(36756003)(8936002)(186003)(36860700001)(7636003)(70586007)(83380400001)(70206006)(5660300002)(1076003)(2616005)(42186006)(7416002)(26005)(356005)(6916009)(54906003)(2906002)(6666004)(40460700003)(508600001)(86362001)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 14:07:06.5897 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08164740-3146-4c96-7251-08da1bc48fd7
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.148];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT041.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB7839
X-Proofpoint-GUID: 6BG7kzNuUxqNemMchu1gOn0haZTQrZCJ
X-Proofpoint-ORIG-GUID: 6BG7kzNuUxqNemMchu1gOn0haZTQrZCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_05,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110078
X-Mailman-Approved-At: Tue, 12 Apr 2022 06:00:17 +0000
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
Cc: nm@ti.com, mparab@cadence.com, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, jpawar@cadence.com, yogeshs@ti.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 kishon@ti.com, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sjakhade@cadence.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: jpawar <jpawar@cadence.com>

Add support for pre_enable and post_enable drm bridge control functions.
Making sure that host to be prepared before panel is powered up,
for the panels like TC358762.

Signed-off-by: jpawar <jpawar@cadence.com>
---
 drivers/gpu/drm/bridge/cdns-dsi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 829e1a144656..20bece84ff8c 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -462,6 +462,7 @@ struct cdns_dsi {
 	struct reset_control *dsi_p_rst;
 	struct clk *dsi_sys_clk;
 	bool link_initialized;
+	bool phy_initialized;
 	struct phy *dphy;
 };
 
@@ -711,11 +712,21 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
 	pm_runtime_put(dsi->base.dev);
 }
 
+static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
+	struct cdns_dsi *dsi = input_to_dsi(input);
+
+	pm_runtime_put(dsi->base.dev);
+}
+
 static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	u32 status;
 
+	if (dsi->phy_initialized)
+		return;
 	/*
 	 * Power all internal DPHY blocks down and maintain their reset line
 	 * asserted before changing the DPHY config.
@@ -739,6 +750,7 @@ static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 	writel(DPHY_CMN_PSO | DPHY_ALL_D_PDN | DPHY_C_PDN | DPHY_CMN_PDN |
 	       DPHY_D_RSTB(output->dev->lanes) | DPHY_C_RSTB,
 	       dsi->regs + MCTL_DPHY_CFG0);
+	dsi->phy_initialized = true;
 }
 
 static void cdns_dsi_init_link(struct cdns_dsi *dsi)
@@ -914,11 +926,25 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 	writel(tmp, dsi->regs + MCTL_MAIN_EN);
 }
 
+static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
+	struct cdns_dsi *dsi = input_to_dsi(input);
+
+	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
+		return;
+
+	cdns_dsi_init_link(dsi);
+	cdns_dsi_hs_init(dsi);
+}
+
 static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.attach = cdns_dsi_bridge_attach,
 	.mode_valid = cdns_dsi_bridge_mode_valid,
 	.disable = cdns_dsi_bridge_disable,
+	.pre_enable = cdns_dsi_bridge_pre_enable,
 	.enable = cdns_dsi_bridge_enable,
+	.post_disable = cdns_dsi_bridge_post_disable,
 };
 
 static int cdns_dsi_attach(struct mipi_dsi_host *host,
-- 
2.30.2

