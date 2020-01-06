Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963CE1320E6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8B8989A;
	Tue,  7 Jan 2020 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8656E203
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 12:22:55 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006CEP5c015732; Mon, 6 Jan 2020 04:22:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=dreuNFyyPGoIqZ9wWAmtdcpUFGbyg/Cv6WY27Ea8wnU=;
 b=NGgKOYtYYs6Pub3yqAukmTXVV+n9e1xHDVmA5D3mj5RzFrB9uJqdDJSMCGKV7otx9SKN
 +9M3dBpbdNWBdWJzUR5WjeqR2IGczRQfehXV9VGiiHWpQrrgOJazsfMFFeGdlnQTIxZs
 tidoOML5HHXAlphZQzqnJOfaXRhWTfMe+nNmwIglhn5kSuvsKhYVLjheKMoFH3iuaXSZ
 mw1zPmuJaK+mFlKk0CmiNpSjkuuSXzQIZ+M/F2D93QXOkNstwz5Q2Akvmw1WS0bXSRm8
 cJDpO3CEo5Pd0nxkMvyjaWnPWkZ8wTfrZKMC2MfVvOIvN/2AdMAnl59E9rgdtJVNsoys HQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2xaq61n0y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 04:22:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/RCD8+/Ynj+u6XUwEKDFUDECKC9RhfL8GDZWao7dzhGy1C5oaX8p0ew2vGDinuMbRXqiqMLdOrela/pfZ0vd9LlBoIs0J3N7SLVh9DSMNHS6mlKIvyxHp64dijTU0d6mMR4lBbaKGyUJQoG994bp8dx2O9EwQyeH3VP9+AWXaw/2TVPAQQruoVB4eac7jB0/8JJNkPvtR7Lj+T2ZsdnubA6xCFFvibHuTIbyFJeyBTnbPMl3tq4rJKyPteRSYvXlyYoJ0TY1ylrztUMBUzLaHpSz2ztJYZw/5l57BQUzs8+5FESNZHYoDfiYWlXzrct/CwirIoOPd8MJ4J9xxDHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dreuNFyyPGoIqZ9wWAmtdcpUFGbyg/Cv6WY27Ea8wnU=;
 b=lBsSbj+eh4afHXYeQpKobEeGGQNoPQbbYKMvu3h2VDrkLlk+Oa5a2QtmsSJCg7PFtQXsJpAcpbttGguSmDXwDGZTMopcvP1PFJ8b0mOjBEX9YvM7/eOZ+jLlHkhpUiWMTDqyBHkf4xS+SHJFWMb/HeVZZ6s0weu6TtupI3IJR4Va/SBWy+drvFHWQSUs+pw3OG3uJqU1EH/xOFxgnaIx/luH6eT+J1VxTN8Qk0FgUCH/vJwjEECRFaziLIqUwLrEGBy97uXCOUrJeJTiA8aqtEnS8k8PWfXFWfP4A3FmeWRa6YdjyG2wQY/x59GtB/gLADjUiwlRhcuKHJAqCfO1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dreuNFyyPGoIqZ9wWAmtdcpUFGbyg/Cv6WY27Ea8wnU=;
 b=v+OUyxw7fRjk1ApGQDyGxeZZZPGziTi9AdGPxXQogI2eq1A/A1wj5fLEkRbnwrjo6uK8BF+wW3oplcV31B2rVIO4iQngWKDo57gMIHdAyyynFyprgy9+jLm5GCbcG70flYUn6D+qUvTnnvVPg29LaI0ffxBB+uRpsE0iAExni5s=
Received: from CH2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:610:20::34)
 by BY5PR07MB6740.namprd07.prod.outlook.com (2603:10b6:a03:1af::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12; Mon, 6 Jan
 2020 12:22:49 +0000
Received: from MW2NAM12FT037.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::209) by CH2PR07CA0021.outlook.office365.com
 (2603:10b6:610:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11 via Frontend
 Transport; Mon, 6 Jan 2020 12:22:49 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT037.mail.protection.outlook.com (10.13.180.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.4 via Frontend Transport; Mon, 6 Jan 2020 12:22:48 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 006CMhLo003052
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 6 Jan 2020 07:22:44 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 6 Jan 2020 13:22:42 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 6 Jan 2020 13:22:42 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 006CMgqM018168;
 Mon, 6 Jan 2020 13:22:42 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 006CMeaN018163;
 Mon, 6 Jan 2020 13:22:40 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <kishon@ti.com>, <maxime@cerno.tech>
Subject: [PATCH v3] phy: Add DisplayPort configuration options
Date: Mon, 6 Jan 2020 13:22:40 +0100
Message-ID: <1578313360-18124-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(199004)(189003)(36092001)(26005)(2616005)(42186006)(336012)(426003)(316002)(186003)(8676002)(5660300002)(81166006)(8936002)(81156014)(356004)(110136005)(54906003)(2906002)(966005)(36756003)(86362001)(107886003)(4326008)(70586007)(70206006)(478600001)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR07MB6740; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb911198-d569-40be-0f48-08d792a324ac
X-MS-TrafficTypeDiagnostic: BY5PR07MB6740:
X-Microsoft-Antispam-PRVS: <BY5PR07MB674004CABBFB536A58066838D23C0@BY5PR07MB6740.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-Forefront-PRVS: 0274272F87
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfVqn7HLpiFkGrrd2hmuQcpeg4MeQcbouGNcPGrSE10PA77UmliS1QYtJiOShTLLI1uZUcSsRGpDLZbW+gwc5lZho2Zbo8UL9NWyCVJfsOMcDHnm4aAvGc/PtA1qbmRfjjl6QW9nwRx8XUpdbsG0l9u5HhmEaGiBJznf/Y2MjEkqm/3quuEvtXIaFc5L6PKzwrtROsTRBp4zSMETzg0MPVYbEmgr/pTXjIUO8do+vvWgmP8cDr4X5j8zRj6tlPmxI+KQZUSdCAJuuCkan8a3tPJyczm00lLq22Ue5K8wdJl0rZYqpWidCj5d5PkfPlDgfzPQcGVIM1pdF9mDWpHEasdrlLIqKQgTJfc2IfoYgOhDX0N80SwLkc3S0ZmtvZYFDZYXvucba9SIO9CK59mMaDvJ5iUtTvhCsmeUtPXTUGT55Nn7mN961/Ig2UNuOCcHjw6V2gxABDdRyYR4f95DAJTGn1wZhS3wo8+N5h1hfHltn1WwZodtUyEZpD8xrTEwwLj4gLrlI7OBjMb2MtLvLpdL8266BfRENni84THiMiA=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2020 12:22:48.7333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb911198-d569-40be-0f48-08d792a324ac
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB6740
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060113
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow DisplayPort PHYs to be configured through the generic
functions through a custom structure added to the generic union.
The configuration structure is used for reconfiguration of
DisplayPort PHYs during link training operation.

The parameters added here are the ones defined in the DisplayPort
spec v1.4 which include link rate, number of lanes, voltage swing
and pre-emphasis.

Add the DisplayPort phy mode to the generic phy_mode enum.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---

Version History:
v3:
     Add DisplayPort mode to the generic phy_mode enum.

v2:
     Update DisplayPort spec version in the commit message.

This patch was a part of [1] series earlier but we think that it needs
to have a separate attention of the reviewers. Also as both [1] & [2] are
dependent on this patch, our sincere request to reviewers to have a
faster review of this patch.

[1]

https://lkml.org/lkml/2019/12/23/392

[2]

https://lkml.org/lkml/2019/12/23/394

 include/linux/phy/phy-dp.h | 95 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h    |  7 +++-
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-dp.h

diff --git a/include/linux/phy/phy-dp.h b/include/linux/phy/phy-dp.h
new file mode 100644
index 0000000..18cad23
--- /dev/null
+++ b/include/linux/phy/phy-dp.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Cadence Design Systems Inc.
+ */
+
+#ifndef __PHY_DP_H_
+#define __PHY_DP_H_
+
+#include <linux/types.h>
+
+/**
+ * struct phy_configure_opts_dp - DisplayPort PHY configuration set
+ *
+ * This structure is used to represent the configuration state of a
+ * DisplayPort phy.
+ */
+struct phy_configure_opts_dp {
+	/**
+	 * @link_rate:
+	 *
+	 * Link Rate, in Mb/s, of the main link.
+	 *
+	 * Allowed values: 1620, 2160, 2430, 2700, 3240, 4320, 5400, 8100 Mb/s
+	 */
+	unsigned int link_rate;
+
+	/**
+	 * @lanes:
+	 *
+	 * Number of active, consecutive, data lanes, starting from
+	 * lane 0, used for the transmissions on main link.
+	 *
+	 * Allowed values: 1, 2, 4
+	 */
+	unsigned int lanes;
+
+	/**
+	 * @voltage:
+	 *
+	 * Voltage swing levels, as specified by DisplayPort specification,
+	 * to be used by particular lanes. One value per lane.
+	 * voltage[0] is for lane 0, voltage[1] is for lane 1, etc.
+	 *
+	 * Maximum value: 3
+	 */
+	unsigned int voltage[4];
+
+	/**
+	 * @pre:
+	 *
+	 * Pre-emphasis levels, as specified by DisplayPort specification, to be
+	 * used by particular lanes. One value per lane.
+	 *
+	 * Maximum value: 3
+	 */
+	unsigned int pre[4];
+
+	/**
+	 * @ssc:
+	 *
+	 * Flag indicating, whether or not to enable spread-spectrum clocking.
+	 *
+	 */
+	u8 ssc : 1;
+
+	/**
+	 * @set_rate:
+	 *
+	 * Flag indicating, whether or not reconfigure link rate and SSC to
+	 * requested values.
+	 *
+	 */
+	u8 set_rate : 1;
+
+	/**
+	 * @set_lanes:
+	 *
+	 * Flag indicating, whether or not reconfigure lane count to
+	 * requested value.
+	 *
+	 */
+	u8 set_lanes : 1;
+
+	/**
+	 * @set_voltages:
+	 *
+	 * Flag indicating, whether or not reconfigure voltage swing
+	 * and pre-emphasis to requested values. Only lanes specified
+	 * by "lanes" parameter will be affected.
+	 *
+	 */
+	u8 set_voltages : 1;
+};
+
+#endif /* __PHY_DP_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 15032f14..962a469 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <linux/phy/phy-dp.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
 struct phy;
@@ -38,7 +39,8 @@ enum phy_mode {
 	PHY_MODE_PCIE,
 	PHY_MODE_ETHERNET,
 	PHY_MODE_MIPI_DPHY,
-	PHY_MODE_SATA
+	PHY_MODE_SATA,
+	PHY_MODE_DP
 };
 
 /**
@@ -46,9 +48,12 @@ enum phy_mode {
  *
  * @mipi_dphy:	Configuration set applicable for phys supporting
  *		the MIPI_DPHY phy mode.
+ * @dp:		Configuration set applicable for phys supporting
+ *		the DisplayPort protocol.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
+	struct phy_configure_opts_dp		dp;
 };
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
