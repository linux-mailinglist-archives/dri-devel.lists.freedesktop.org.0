Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC912A230
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66A6E334;
	Tue, 24 Dec 2019 14:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24D589EB7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 13:41:26 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBNDUacP017789; Mon, 23 Dec 2019 05:41:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=n0wOZPK5yov29MIKF8CrpS1xEbKBaMfRcYASVE0nZ3M=;
 b=hfx6W6PiHSYXPAuGyNFL3wStCzPTJEaNhXKR7NmNHlmJP8gSfZt3wB4Yd4VIpb7dSx8z
 AN+j1PTuul/izjprrc9ZlCu2EaX7wsLfCcUF1pPvz4m5gaIKOZELO4EUKdu24QQfRZq8
 cfpIo3nBrTqk57Vs4E9RySIuI0FtvRkVDyhevInod8wdLyZehuOHpEtmdBvVkb+alr0U
 sQDeirZ+wCZT8ibHPXaH0uDEpuTkkQAFdIdcC2E++Nh3H+l4kDaP6Gc5sbIHsf4P+p//
 /ZaAFPYlaDmjtSrqWaQAwQuI9GhULGSSbOdebrOLeIQ7aAm4GJqmAy9sH3YNuTSvxvzp TA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2x1fv3nbk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2019 05:41:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoxDijMjLr8zu7/GIJd0+URntkYgUdiFUo+99atcLTguxsaTr5lpfpbIFiSWCAayD1o/LGXULa/o0NdBvEYw/8kzhopE/B8FZG3XSjdOJriSWyPE5OJ3i264VS53DrxdynQ/7X99UjCUlGWJPISRqyWTjlTFu7gz9sFHKbgHSgncyi0xNrZMeeXOl0IV8dYqw5rrJC1dRtYpGydUQwBrpSYcOjDiAWfdj46MWDClDbs+L815NLKpKgRkflAO+wLkQBGltjZ95uhcBCTCBGIzSI+cOAk72Fc40eC0vEF8yT4xcabfbHSuwrOmElfYZfBUU0Dcqa30K8wSbeJUQTr3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0wOZPK5yov29MIKF8CrpS1xEbKBaMfRcYASVE0nZ3M=;
 b=Qnl3dbGel9dv3OWcikVq0ltG/OleyoOwlekbIK4beC9b1LVI6KYJW3LiOe7waMIVGv0bTV+Lmlt8uSIyVH04cjzF8kwki2lm9f3x6c91LrSExTLzMNYLmmpyvU7mNk95MQ0/hlzs/uXj/5dA1qRm4H9FGpJg4NFP2va68jvzFR0hK1RNIad339DxS5EArpAfGVo7WX+NqSfJMFjT3XUY+u9FvBsj0RqTTWPg3Keek0VjTA00+cpsF+7ipr+PSi72VpqxAvv44/FUg0WzviY8rb9YpdIeJp8m8bg0Yf4Mm2cpluBGRbKP4TC6NjlOE3iVwrqnxpxqoOQPJhrhrZLZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=cerno.tech smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0wOZPK5yov29MIKF8CrpS1xEbKBaMfRcYASVE0nZ3M=;
 b=DGaEyFgbLAI3JzEf5JM+YQjY7592WJj0v/bqDpkeeA0fmvDi6JWhl96PoRl2gV3sYTjcRVMzOouRosJOQrn3zP1Bhw3aXWY7Sls5v+zie+w6rDbV754nBc1iHNOPvTqE0EeLC+R/V20rOvblznI8B2dQ79oSTMYA0pctAcJkLPY=
Received: from BYAPR07CA0002.namprd07.prod.outlook.com (2603:10b6:a02:bc::15)
 by BN8PR07MB6818.namprd07.prod.outlook.com (2603:10b6:408:ba::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16; Mon, 23 Dec
 2019 13:41:18 +0000
Received: from DM6NAM12FT051.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::209) by BYAPR07CA0002.outlook.office365.com
 (2603:10b6:a02:bc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.13 via Frontend
 Transport; Mon, 23 Dec 2019 13:41:18 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM6NAM12FT051.mail.protection.outlook.com (10.13.178.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16 via Frontend Transport; Mon, 23 Dec 2019 13:41:17 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBNDfEwI010802
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 23 Dec 2019 05:41:16 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 23 Dec 2019 14:41:14 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 23 Dec 2019 14:41:14 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBNDfEmb029401;
 Mon, 23 Dec 2019 14:41:14 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBNDfDiI029377;
 Mon, 23 Dec 2019 14:41:13 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>
Subject: [PATCH v2] phy: Add DisplayPort configuration options
Date: Mon, 23 Dec 2019 14:41:13 +0100
Message-ID: <1577108473-29294-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(199004)(36092001)(189003)(478600001)(107886003)(86362001)(966005)(36756003)(70586007)(26005)(26826003)(5660300002)(356004)(8676002)(186003)(70206006)(7636002)(8936002)(76130400001)(246002)(2616005)(2906002)(426003)(54906003)(4326008)(316002)(42186006)(336012)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB6818; H:sjmaillnx2.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb1a8b3-721f-4aae-9c8f-08d787adc9a6
X-MS-TrafficTypeDiagnostic: BN8PR07MB6818:
X-Microsoft-Antispam-PRVS: <BN8PR07MB6818A9F62013C0F315849770D22E0@BN8PR07MB6818.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0260457E99
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1edO1WtgS1UGdF9dMB4X/qUXT8sWceD86W93hYmGHAK37auBcoa8Ncc6WsmYs0IlJVow3vPrvjSegThBYvSNdFtI0zcA0xSqhBS4VVLf6tI+Rbym9D4SXpbSJ3jZ96nfIxY5jYmelBeKuUAnzKERepU9mt8lAe8wj+MBsEqrkFbEpteLheJIhGCYuNwCTVTzztbGBsgSWTLG6XpgHePCDbzJzpxCdWWsNkE/fPrms2fVbCZgkc3wnbp9dttp+S7KBAEA4miQ/kuMM7ZUPRjRJqxqgFcoydw04hIEXVaQ3kBXrCDXpk6LCO2cMLPuEhfcPmY6sQwyKkSexA7SOP/ETeUMo/RwdP9RqPZZAR6lX76pQoWtWyp/0kO5wLxXIwpoiT9PAyGTLAQxhHRaziBUwaF5709pG24MOValcoFUjy+U+P1jhoQGpgQcjlqwsaTEnKw8YfmzDVqKzZoLhG2sBdkATHQerEoo10A+hkB4KAvwWaT3+DFZFI1HzltRrol2sv9fAS/P5O/uTDUICZlcwAqUYVPeYIsS8nx1I2rooBs=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 13:41:17.7365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb1a8b3-721f-4aae-9c8f-08d787adc9a6
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6818
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-23_06:2019-12-23,2019-12-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912230118
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
spec 1.4 which include link rate, number of lanes, voltage swing
and pre-emphasis.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---

This patch was a part of [1] series earlier but we think that it needs
to have a separate attention of the reviewers. Also as both [1] & [2] are
dependent on this patch, our sincere request to reviewers to have a
faster review of this patch.

[1]

https://lkml.org/lkml/2019/12/11/455

[2]

https://patchwork.kernel.org/cover/11271191/

 include/linux/phy/phy-dp.h | 95 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h    |  4 ++
 2 files changed, 99 insertions(+)
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
index 15032f14..ba0aab5 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <linux/phy/phy-dp.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
 struct phy;
@@ -46,9 +47,12 @@ enum phy_mode {
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
