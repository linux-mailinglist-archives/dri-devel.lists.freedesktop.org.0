Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4BF1292A6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5355A6E1B4;
	Mon, 23 Dec 2019 08:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2AA6E132
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 06:54:40 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBN6s9WW016861; Sun, 22 Dec 2019 22:54:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=G3ZOysoNj1YzA2w8Gl32kvSKzSx7gT1C/D7qVq9YsJM=;
 b=UfrRnp+MZ+sdeig/AKE0iyTShYIu4MHAyQZELZHNqivF6RWsqOhNXNEdS7wJNzLmB9Jr
 OFiBS/u0WrzTYpTC3ExdcFOTWPKU5IG2I7ekkhNS7Cg+NJ/qhRnlHUexk7LTpXXmJJbI
 f6WDiAOxRrNH8JOEtIQgNLhtj9Yt0VZI6q677RamGwyCkH4vkVTZ0beg0n9d3HTLSyc5
 ig6QiKVF49DMUFQ6kxGSv8RWkLNRwQoAStpySDfRBZJ62Lt8xl1k19tjPL3/4syM7NLb
 cBBbGDjBkTcbqI6b4UsPBmNtNL/SVT5kjRJCj2lbEinORs4wVb27cfrIXquEZejrAWac bg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2x1fv3mdj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Dec 2019 22:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCP6s/hGc7b53Flff+gMDcnv5RK076JIPGvt8CStSgRH8Fk9DuVY0Rvht+ExpJfWSMuadOxObDQF3cytraSEUSqbqxD0ijGqkaeKuXyreHyAtetxHIXEg9cdRFUZpPvtc1LLEHq7STbbYjZ+UswFmil1notSywPXDKrT4Itx8/3Y8XqVfSvCzJXdEoZxUX4tyzJYx1R5T8qz4P0oSDBEuq2ync1HhuORrNRXD693zRPcq5F/SJahZOOshthm1qrVoL3BYa4xtFWpCHok+0oYi4mQnnPLRdDUtNEouAJNnbcrbHYwmp5U/isPpH9nToWIF2BXgyrd7Nwj8qy4s9z/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3ZOysoNj1YzA2w8Gl32kvSKzSx7gT1C/D7qVq9YsJM=;
 b=nGJmf2e7vb9hqU7LP6lObwrr2XldWhz8507wQf375iHLjXo4efG79GPiLObfh/9f07dURTQyPLMsMqVhnyHEOqGzfT/EM1dGXG78cEU1JFpr2mwGmna25Kp6z5lMsUe2Yc/zd8XRnQbupW5YpVw5g/tRxkpvCldHQ9An2nDv8v+f9jVYtu6d6BSr1wqAqBxS5ar0kg5qTGlfYyk9zfCv22NVPs67vJDhfOgs6eUzxKtcoDhByvCS5i+DJxr6FbPTL6AyzLtojE6jT8uIdwFDwzbTERP52OqlxF2kJthywxGzcr1ntGvBIQ+q0O5R67+qwW/rX5hGNWRXL6N2nCHFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3ZOysoNj1YzA2w8Gl32kvSKzSx7gT1C/D7qVq9YsJM=;
 b=Oqotrf2XTJybsESqNuRdHhmILuF8pnfBAqAphEXu7KT8GFRnxg9uhlIXgMEDrweE4otNBGNFhVHxyxu65sFpmz1dtbk4IhtAo/PuWFLlAuSMymz05nRph8NY54qiqczSNkRfnl1mJqLkakfuQJ7kpQqE8ralmU3DJujxjT2hRus=
Received: from DM5PR07CA0088.namprd07.prod.outlook.com (2603:10b6:4:ae::17) by
 BY5PR07MB7203.namprd07.prod.outlook.com (2603:10b6:a03:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16; Mon, 23 Dec
 2019 06:54:36 +0000
Received: from BN8NAM12FT059.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::202) by DM5PR07CA0088.outlook.office365.com
 (2603:10b6:4:ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Mon, 23 Dec 2019 06:54:36 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 BN8NAM12FT059.mail.protection.outlook.com (10.13.183.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16 via Frontend Transport; Mon, 23 Dec 2019 06:54:36 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 xBN6sWjV067998
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Sun, 22 Dec 2019 22:54:34 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 23 Dec 2019 07:54:32 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 23 Dec 2019 07:54:32 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBN6sWkB005457;
 Mon, 23 Dec 2019 07:54:32 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBN6sVQS005434;
 Mon, 23 Dec 2019 07:54:31 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <kishon@ti.com>
Subject: [PATCH v1] phy: Add DisplayPort configuration options
Date: Mon, 23 Dec 2019 07:54:31 +0100
Message-ID: <1577084071-5332-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(36092001)(199004)(189003)(36756003)(2906002)(86362001)(2616005)(70586007)(70206006)(478600001)(336012)(426003)(356004)(186003)(316002)(107886003)(54906003)(42186006)(110136005)(36906005)(26005)(4326008)(81166006)(8936002)(8676002)(81156014)(966005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR07MB7203; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:unused.mynethost.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a66fbb-2670-4421-06a2-08d78774f961
X-MS-TrafficTypeDiagnostic: BY5PR07MB7203:
X-Microsoft-Antispam-PRVS: <BY5PR07MB7203A2CCF3B110E42802AFB7D22E0@BY5PR07MB7203.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0260457E99
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1oZILF3Fn05+A71NCn4t+pW7uQmXBES1IPl7GiLe6PH46ge8AsdNsRieJB+KFnP16BSQEkwfDJv7RnmO/KjMg7oXpn73aK6q094+lyEVdUOdZiP9f4akiUT2lqK92vFeniBep2pQ0UbJoyweK4QwOr7dZOhRC6YVaQZA1cJv593aqExviwHt/C3ec5kpzS/52iC92Xig0wT1aeU8uSR5axzPMqwonts/dKP9LX4ms4oAyhuCrJggJGZFIVffrMrUd/uKDP3R/JxzOjjrgQwHwCJh6ktXBFBcBUpE4PsPJL2X0eR+b/VVTc1WNDEdSVQRzUDEGOBzUH25pOZCWLc9/OCN8uEbX9qPvdJhlE8bd2qDxUCWOdiGYrQOCjJsc5yLhH+9WOKiWuYvSZt7LsmXvGS+NYMf0Zz9uP/MdtzWYNOuBhWJLN41PZt3mDarngDhO8nAaLlzAYf4MCnTSeN1LN/EXqavCxWp3yrspwZNFKcRshNgt4lnYaUAQlHg2PGgCmj6CXSxna0Eox5QggIZrlr2uhaaZ5GQvssk3AhW2tc=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 06:54:36.4535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a66fbb-2670-4421-06a2-08d78774f961
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB7203
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-23_03:2019-12-17,2019-12-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912230059
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
spec which include link rate, number of lanes, voltage swing
and pre-emphasis.

This patch was a part of [1] series earlier but we think that it needs
to have a separate attention of the reviewers. Also as both [1] & [2] are
dependent on this patch, our sincere request to reviewers to have a
faster review of this patch.

[1]

https://lkml.org/lkml/2019/12/11/455

[2]

https://patchwork.kernel.org/cover/11271191/

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
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
