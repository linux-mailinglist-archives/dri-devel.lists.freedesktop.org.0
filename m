Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC2232821
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 01:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE606E819;
	Wed, 29 Jul 2020 23:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6F76E819
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 23:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpsGXRhuCsvdCm/MBRveBj/jD/ql3Wx1WCxb92B/69P4rqAK1rE7ICtWLn/dcrX6T5JZMsgmV8kK8ELT7Rh+KGjXB1zrr/WffLGBDL8g5JfJfqGWHlV6ExzhKHcSbN2tWhhIdvPS8S1BwcQlc6Es9XkOX24wQxREI7PdAbb9qh44QFDueCzDCW8sLupJbc2vd05HAoM/TytdEiwxvFdXYoLYc/jvMhCvdl6QpVBigz3JQiS2WuKWux3/CyYrm7uWGFvPCrexUZkpILMu6bNlzEGfcql7bJtDhzmZ206DDxRzrm8QRVLomveoyg2+nWRZKeOTOSW5+joymQoV6ZPxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZOyLhdhPe+D1C1o42yaeEDF8fSdnHYilXgHrGXA2/g=;
 b=G2+MROVXbTzohDI6lOTu3Q+9z9rHvF8BwBwQPamyDyyWc9WqJChmzVZrAv1tUbXNiF1jL1umR4ojyNqffjxB7+JHf2ksJk1/2uFRP0z4PjBgLnEFFMYmBbgoUkcwPLmIybxzBmyGbkDUDkE3ihkhKRy6diS3GL6xAlWny9ZL8kgDEYobUXweFLEX1HxQnrclG9cUoyz8uQ0l8NwFj+U91a++SHX+B9h86egfr1fgwuq4K6F4v7a6UQ5GFMcB2mnX6bZNAKspL7MzPHsflvMIoqi1pRA3CfwgA/XX2RAxI4bfMfd8XKZohOvt4SxMc0KU75P+3uR4vPqvuStwxVSGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=oracle.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZOyLhdhPe+D1C1o42yaeEDF8fSdnHYilXgHrGXA2/g=;
 b=G8PgRFO9UQ6qixc/8GgXRkxmmAvmB/ye9V6q0HPMaLLTnkxrO02EIg+nvg44qHe2H2MaNd+64rvDzbSXd2r6yiz3bcNLHx8ImH9//ZlRFYfKWVB90/LAitetYaVgHAuGtiYWWmZnk5KFpP3So9Kw8Uvak38G8sqGV/0FV975hXI=
Received: from SA0PR11CA0003.namprd11.prod.outlook.com (2603:10b6:806:d3::8)
 by DM6PR02MB4188.namprd02.prod.outlook.com (2603:10b6:5:97::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 29 Jul
 2020 23:34:43 +0000
Received: from SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::ba) by SA0PR11CA0003.outlook.office365.com
 (2603:10b6:806:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Wed, 29 Jul 2020 23:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT031.mail.protection.outlook.com (10.152.72.116) with Microsoft SMTP
 Server id 15.20.3239.17 via Frontend Transport; Wed, 29 Jul 2020 23:34:42
 +0000
Received: from [149.199.38.66] (port=44823 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0vYt-0005vm-1v; Wed, 29 Jul 2020 16:32:39 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0vas-0002F5-3T; Wed, 29 Jul 2020 16:34:42 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06TNYf8d011966; 
 Wed, 29 Jul 2020 16:34:41 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyunk@smtp.xilinx.com>)
 id 1k0var-0002EN-34; Wed, 29 Jul 2020 16:34:41 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id F00F62C1BFF; Wed, 29 Jul 2020 16:30:48 -0700 (PDT)
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm: xlnx: zynqmp: Use switch - case for link rate
 downshift
Date: Wed, 29 Jul 2020 16:30:45 -0700
Message-Id: <1596065445-4630-1-git-send-email-hyun.kwon@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: cee61fdc-930a-4317-5976-08d83417f825
X-MS-TrafficTypeDiagnostic: DM6PR02MB4188:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4188DF28217C76DC617A8560D6700@DM6PR02MB4188.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLsXeuRuKU8AJqN8TfTtIsDafV9lZ6KFbjH3CWIxKeFVbxXYqiJdC92OXubMfQBFgDhGHvffhnnFrIxpYaOcDFuLq7cTPZGo4uebDwLr8O9XKlUXRp6Xaey4emy/GJyQp4kEG+4OFaKxN1TBn+oR/n3+eZfRH1baKv7ozccHtno8IKH1WBBH9lMq7yuo0v2uYML1W/VTrY/2QarmxsHUMKqZYKU2/JHI9GUfBQP3Cp40vDCIoRVvN49Ael5VMPt9X7CqyhJsPZQvDBf/+RBxS4IEtE7i0wku7Mdtd27djPFEt/9N7Z8tiRO1vE+Qjin2nId4G5QILo8JR4/akiyCGeZMgZmM9nR1gPc3aIOdR4o46CdAB8I5J4022vd3S47lbEXUgLQ/0i9HMdVU2SiIGA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(396003)(39860400002)(136003)(376002)(346002)(46966005)(70206006)(70586007)(82740400003)(336012)(426003)(81166007)(107886003)(2616005)(82310400002)(356005)(6266002)(54906003)(8936002)(316002)(110136005)(36756003)(47076004)(26005)(42186006)(5660300002)(186003)(8676002)(44832011)(2906002)(478600001)(6666004)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 23:34:42.4954 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cee61fdc-930a-4317-5976-08d83417f825
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4188
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use switch - case to downshift from the current link rate. It's a small
loop now, so fine to be replaced with switch - case. With a loop, it is
confusing and hard to follow as reported below.

The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
DisplayPort Subsystem" from Jul 7, 2018, leads to the following
static checker warning:

	drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
	error: iterator underflow 'bws' (-1)-2

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
v2
- Convert the for loop into switch - case
---
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index b735072..5d6adeaa 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -567,34 +567,37 @@ static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
 				    u8 current_bw)
 {
 	int max_rate = dp->link_config.max_rate;
-	u8 bws[3] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4 };
+	u8 bw_code;
 	u8 max_lanes = dp->link_config.max_lanes;
 	u8 max_link_rate_code = drm_dp_link_rate_to_bw_code(max_rate);
 	u8 bpp = dp->config.bpp;
 	u8 lane_cnt;
-	s8 i;
 
-	if (current_bw == DP_LINK_BW_1_62) {
+	/* Downshift from current one */
+	switch (current_bw) {
+	case DP_LINK_BW_5_4:
+		bw_code = DP_LINK_BW_2_7;
+		break;
+	case DP_LINK_BW_2_7:
+		bw_code = DP_LINK_BW_1_62;
+		break;
+	case DP_LINK_BW_1_62:
 		dev_err(dp->dev, "can't downshift. already lowest link rate\n");
 		return -EINVAL;
-	}
-
-	for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
-		if (current_bw && bws[i] >= current_bw)
-			continue;
-
-		if (bws[i] <= max_link_rate_code)
-			break;
+	default:
+		/* If not given, start with max supported */
+		bw_code = max_link_rate_code;
+		break;
 	}
 
 	for (lane_cnt = 1; lane_cnt <= max_lanes; lane_cnt <<= 1) {
 		int bw;
 		u32 rate;
 
-		bw = drm_dp_bw_code_to_link_rate(bws[i]);
+		bw = drm_dp_bw_code_to_link_rate(bw_code);
 		rate = zynqmp_dp_max_rate(bw, lane_cnt, bpp);
 		if (pclock <= rate) {
-			dp->mode.bw_code = bws[i];
+			dp->mode.bw_code = bw_code;
 			dp->mode.lane_cnt = lane_cnt;
 			dp->mode.pclock = pclock;
 			return dp->mode.bw_code;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
