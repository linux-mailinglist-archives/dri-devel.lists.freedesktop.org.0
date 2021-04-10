Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0935AF7F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 20:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2126EC94;
	Sat, 10 Apr 2021 18:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052DF6EC94
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 18:16:05 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13AIBqrD016711; Sat, 10 Apr 2021 11:15:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=wRbe+ccl3wc110IRynjB04CNV5mqiLBHH3osou304Qc=;
 b=rbXqgrZ1LvfmklcqEUf5jKcDqtT60lKmzYfJprmK1/q2S1UOK4xDpq+y2cDcqTkz+ZTv
 azxNUCOdmX4wBFX7Vg7bVDwmlbS5jicMnNpCmREAy6/c/hetwtPGjlgyaS8q86jdXtEV
 fP+R4J9fTzEQBTOGLSglm5oEVeVBH3Q9tDiNM79uVnBWrPdYT1Teo0vb/UEuPcEbxpvZ
 jPkft3fr4Do6vHLX3cun215yTLt1kXc+hwqkcBfOr1xVX8DynA2medZ+zSxlS00Pwl5r
 GZZz5S3029d3UBLX6dmJEJkqK6J8L1gFbSBwvXY4nmv0y9/IPGbDLGc/PHEqFDCJ5bYG GA== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
 by mx0a-0014ca01.pphosted.com with ESMTP id 37u8jyrwxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 11:15:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFg/i8drsOmEmbFvv81l4RRNBZjPs6XoKii2BtfaWZAJM3lpp+/vZfty+L3kFY/K0AfHuhRlJY13dIhaJ44FJZnR4JqN4GpPcKRHBJXqewWmQU4VO3pVN7vb1H7BCqtzUdj4T7CK/JAzqOUmVfhNz4Mch2jiSZAIRVVfE2HqDm2gGTwN1TvJsp4yZqxLndtnwg2lYYcexV2DxXa/wXFwYnQqEiQXCwJmI3YYgoT9tQ68Gh3659Dlx9cA8L7BB9TvSI3yx/5L0sCD144czUkJ0+C4C479Ouz/NbbLcJnsVcUKGZSqnMDlsfpIUXAoi503MC+S7BnzLeXZsTZSfqjXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRbe+ccl3wc110IRynjB04CNV5mqiLBHH3osou304Qc=;
 b=O87iT25p6gaT15WHfEBR3n6riLYfdLPWoQtPaHuFOdOWR/cn7B0zGGzDhn3dpcvEFR05eZV3FpuZ+XrbilIddOEM6Gv2yFQaPnoPPI9+LUhVNM0OVmiZprtiS/nh8n3sCMKB+zFeQtxB6MkZl+VdN2SAXc1r327WDBxlVHV04gNIH/MZ8TOg9HevMz3LL4I6XQSOLwUoBXyHqUr0Rz1Es2dLyhEvvcJ6E2PgTKoskG4L/a1jHCSoVeavYWH9IroG4QwOYMf5rSDJZiCTWCX8t2TJV1yfgQFrZTeUpHQzWCLuyVzzkGbfN1m6SgRr34jk9jyRmf8nGKWnuPo7+NRU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRbe+ccl3wc110IRynjB04CNV5mqiLBHH3osou304Qc=;
 b=6T7ahlrb0O4ru0tCcLCrJYwkuOaTqxMElviPYblQ1erUSglRbaLhqQbJf4mEuzSk0OgUxDzwov5Cd6QYYmsxweqmLfCEm88rjAPjkSVP/UuF1UCU1Eku3D4bqwIXk6H3kIfYyNrzfmvv4ucV/jnpY7Ay8J+ajcd4/7zn1odon6U=
Received: from MWHPR19CA0074.namprd19.prod.outlook.com (2603:10b6:320:1f::12)
 by MN2PR07MB6271.namprd07.prod.outlook.com (2603:10b6:208:119::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Sat, 10 Apr
 2021 18:15:51 +0000
Received: from MW2NAM12FT012.eop-nam12.prod.protection.outlook.com
 (2603:10b6:320:1f:cafe::7e) by MWHPR19CA0074.outlook.office365.com
 (2603:10b6:320:1f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Sat, 10 Apr 2021 18:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 MW2NAM12FT012.mail.protection.outlook.com (10.13.180.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Sat, 10 Apr 2021 18:15:49 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 13AIFkQp104989
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Sat, 10 Apr 2021 11:15:47 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 20:15:45 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Sat, 10 Apr 2021 20:15:45 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 13AIFjtq030735;
 Sat, 10 Apr 2021 20:15:45 +0200
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 13AIFi9I030734;
 Sat, 10 Apr 2021 20:15:44 +0200
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v6 2/2] drm: bridge: cdns-mhdp8546: Enable HDCP
Date: Sat, 10 Apr 2021 20:15:42 +0200
Message-ID: <1618078542-30679-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
References: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766abb6f-11e6-4e38-fa2f-08d8fc4cab15
X-MS-TrafficTypeDiagnostic: MN2PR07MB6271:
X-Microsoft-Antispam-PRVS: <MN2PR07MB6271FD4ECCC244945DC94BDAC1729@MN2PR07MB6271.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:230;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LBu6o+3dtztkaQ8fsfQwFiyD2A4C4dXCWKHVg4HdsQ3tIaRerYo+9U1M0mTJXvTaBgmN7IdXYZK0ugn42LkKRDGrFoqk0p7TmK1H5nFz/sLAceSgas1E62QnrJdSZ4mOujcVS4NK7KyM4kuP9XJzyQlO6lPV4Gc1Kfh879SHs5WR7Ubt1X0JsZadE9KwVFWzhs1Mh/WRSoU5cWY/aQkeg6J1wnakRo/rba+xT2/x5cDWiWD8RUs5YexNI8LRunyOgXKhW0ocqVM/bgM+zFkbaf+Zq1bkDAtqveSdqDOo0LxdQMMAJ/YCjnmfSDCAmQM4GGD+2fHZdnwPQZ8QjTlayp95C3y67LjMYt2fhhFztBou1sNKaPnf7DkaW5RBkoYf2VPhebsPyB6DtSce8W1wnJwbzSXj5F1T8yb1whv8xHMJWiJuIW7nLn0rNjJ2YjSOSjJDyySySRFp2kMwunWQHzE4u6EdDxqFDmL/Nw1yJVpnvDKqTywgMCJ5T2DMh7MJ/71V1eCOYCuwRTzIZ5r7NvXiwGBaT8mHvC+XCByln4lIn+YIGWvyyMhZsM59ZRzEEW8pqrPdkaqdz5DkFxz8g2xZnNcK0AEtB86mEBvyYZwtGovVmWk+Fv9zEURi0U8StxkJnyfcufJLwg96DIjkScLNIFf0fO1775hc3cLTO6r8fSura/nvcls4cOU8vO2tptssKAox/E1SSzVyoSwBZFklmC8tfVsFVsSJyjuMfHk=
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(36092001)(46966006)(36840700001)(54906003)(82310400003)(36906005)(336012)(478600001)(86362001)(70586007)(2616005)(70206006)(47076005)(8676002)(426003)(8936002)(36860700001)(7416002)(316002)(5660300002)(83380400001)(186003)(356005)(107886003)(4326008)(26005)(110136005)(42186006)(30864003)(82740400003)(36756003)(81166007)(2906002)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 18:15:49.0423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766abb6f-11e6-4e38-fa2f-08d8fc4cab15
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT012.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6271
X-Proofpoint-ORIG-GUID: p7QBaB6487D7XRXSnx1c041029ws62y9
X-Proofpoint-GUID: p7QBaB6487D7XRXSnx1c041029ws62y9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_07:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104100139
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Parshuram Thombare <pthombar@cadence.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 sjakhade@cadence.com, nikhil.nd@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch enable HDCP in MHDP driver.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 128 +++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  22 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 570 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  92 +++
 5 files changed, 801 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h

diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index 8f647991b374..4d2db8df1bc6 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
-cdns-mhdp8546-y := cdns-mhdp8546-core.o
+cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 989a05bc8197..01e95466502a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -42,6 +42,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_hdcp.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -49,7 +50,7 @@
 #include <asm/unaligned.h>
 
 #include "cdns-mhdp8546-core.h"
-
+#include "cdns-mhdp8546-hdcp.h"
 #include "cdns-mhdp8546-j721e.h"
 
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
@@ -1614,10 +1615,51 @@ enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
 	return MODE_OK;
 }
 
+static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
+					    struct drm_atomic_state *state)
+{
+	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
+	struct drm_connector_state *old_state, *new_state;
+	struct drm_crtc_state *crtc_state;
+	u64 old_cp, new_cp;
+
+	if (!mhdp->hdcp_supported)
+		return 0;
+
+	old_state = drm_atomic_get_old_connector_state(state, conn);
+	new_state = drm_atomic_get_new_connector_state(state, conn);
+	old_cp = old_state->content_protection;
+	new_cp = new_state->content_protection;
+
+	if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
+	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		goto mode_changed;
+	}
+
+	if (!new_state->crtc) {
+		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
+			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return 0;
+	}
+
+	if (old_cp == new_cp ||
+	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED))
+		return 0;
+
+mode_changed:
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
+	crtc_state->mode_changed = true;
+
+	return 0;
+}
+
 static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
 	.detect_ctx = cdns_mhdp_connector_detect,
 	.get_modes = cdns_mhdp_get_modes,
 	.mode_valid = cdns_mhdp_mode_valid,
+	.atomic_check = cdns_mhdp_connector_atomic_check,
 };
 
 static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
@@ -1662,7 +1704,10 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
-	return 0;
+	if (mhdp->hdcp_supported)
+		ret = drm_connector_attach_content_protection_property(conn, true);
+
+	return ret;
 }
 
 static int cdns_mhdp_attach(struct drm_bridge *bridge,
@@ -1957,6 +2002,15 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	if (WARN_ON(!conn_state))
 		goto out;
 
+	if (mhdp->hdcp_supported &&
+	    mhdp->hw_state == MHDP_HW_READY &&
+	    conn_state->content_protection ==
+	    DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		mutex_unlock(&mhdp->link_mutex);
+		cdns_mhdp_hdcp_enable(mhdp, conn_state->hdcp_content_type);
+		mutex_lock(&mhdp->link_mutex);
+	}
+
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	if (WARN_ON(!crtc_state))
 		goto out;
@@ -2000,6 +2054,9 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 
 	mutex_lock(&mhdp->link_mutex);
 
+	if (mhdp->hdcp_supported)
+		cdns_mhdp_hdcp_disable(mhdp);
+
 	mhdp->bridge_enabled = false;
 	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	resp &= ~CDNS_DP_FRAMER_EN;
@@ -2288,7 +2345,6 @@ static irqreturn_t cdns_mhdp_irq_handler(int irq, void *data)
 	struct cdns_mhdp_device *mhdp = data;
 	u32 apb_stat, sw_ev0;
 	bool bridge_attached;
-	int ret;
 
 	apb_stat = readl(mhdp->regs + CDNS_APB_INT_STATUS);
 	if (!(apb_stat & CDNS_APB_INT_MASK_SW_EVENT_INT))
@@ -2307,20 +2363,54 @@ static irqreturn_t cdns_mhdp_irq_handler(int irq, void *data)
 	spin_unlock(&mhdp->start_lock);
 
 	if (bridge_attached && (sw_ev0 & CDNS_DPTX_HPD)) {
-		ret = cdns_mhdp_update_link_status(mhdp);
-		if (mhdp->connector.dev) {
-			if (ret < 0)
-				schedule_work(&mhdp->modeset_retry_work);
-			else
-				drm_kms_helper_hotplug_event(mhdp->bridge.dev);
-		} else {
-			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
-		}
+		schedule_work(&mhdp->hpd_work);
+	}
+
+	if (sw_ev0 & ~CDNS_DPTX_HPD) {
+		mhdp->sw_events |= (sw_ev0 & ~CDNS_DPTX_HPD);
+		wake_up(&mhdp->sw_events_wq);
 	}
 
 	return IRQ_HANDLED;
 }
 
+u32 cdns_mhdp_wait_for_sw_event(struct cdns_mhdp_device *mhdp, u32 event)
+{
+	u32 ret;
+
+	ret = wait_event_timeout(mhdp->sw_events_wq,
+				 mhdp->sw_events & event,
+				 msecs_to_jiffies(500));
+	if (!ret) {
+		dev_dbg(mhdp->dev, "SW event 0x%x timeout\n", event);
+		goto sw_event_out;
+	}
+
+	ret = mhdp->sw_events;
+	mhdp->sw_events &= ~event;
+
+sw_event_out:
+	return ret;
+}
+
+static void cdns_mhdp_hpd_work(struct work_struct *work)
+{
+	struct cdns_mhdp_device *mhdp = container_of(work,
+						     struct cdns_mhdp_device,
+						     hpd_work);
+	int ret;
+
+	ret = cdns_mhdp_update_link_status(mhdp);
+	if (mhdp->connector.dev) {
+		if (ret < 0)
+			schedule_work(&mhdp->modeset_retry_work);
+		else
+			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
+	} else {
+		drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
+	}
+}
+
 static int cdns_mhdp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2356,6 +2446,15 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 		return PTR_ERR(mhdp->regs);
 	}
 
+	mhdp->sapb_regs = devm_platform_ioremap_resource_byname(pdev, "mhdptx-sapb");
+	if (IS_ERR(mhdp->sapb_regs)) {
+		mhdp->hdcp_supported = false;
+		dev_warn(dev,
+			 "Failed to get SAPB memory resource, HDCP not supported\n");
+	} else {
+		mhdp->hdcp_supported = true;
+	}
+
 	mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node, 0);
 	if (IS_ERR(mhdp->phy)) {
 		dev_err(dev, "no PHY configured\n");
@@ -2430,13 +2529,18 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	/* Initialize the work for modeset in case of link train failure */
 	INIT_WORK(&mhdp->modeset_retry_work, cdns_mhdp_modeset_retry_fn);
+	INIT_WORK(&mhdp->hpd_work, cdns_mhdp_hpd_work);
 
 	init_waitqueue_head(&mhdp->fw_load_wq);
+	init_waitqueue_head(&mhdp->sw_events_wq);
 
 	ret = cdns_mhdp_load_firmware(mhdp);
 	if (ret)
 		goto phy_exit;
 
+	if (mhdp->hdcp_supported)
+		cdns_mhdp_hdcp_init(mhdp);
+
 	drm_bridge_add(&mhdp->bridge);
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index 5897a85e3159..c74439d0b1a7 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -47,6 +47,10 @@ struct phy;
 
 #define CDNS_SW_EVENT0				0x00044
 #define CDNS_DPTX_HPD				BIT(0)
+#define CDNS_HDCP_TX_STATUS			BIT(4)
+#define CDNS_HDCP2_TX_IS_KM_STORED		BIT(5)
+#define CDNS_HDCP2_TX_STORE_KM			BIT(6)
+#define CDNS_HDCP_TX_IS_RCVR_ID_VALID		BIT(7)
 
 #define CDNS_SW_EVENT1				0x00048
 #define CDNS_SW_EVENT2				0x0004c
@@ -339,8 +343,17 @@ struct cdns_mhdp_platform_info {
 #define to_cdns_mhdp_bridge_state(s) \
 		container_of(s, struct cdns_mhdp_bridge_state, base)
 
+struct cdns_mhdp_hdcp {
+	struct delayed_work check_work;
+	struct work_struct prop_work;
+	struct mutex mutex; /* mutex to protect hdcp.value */
+	u32 value;
+	u8 hdcp_content_type;
+};
+
 struct cdns_mhdp_device {
 	void __iomem *regs;
+	void __iomem *sapb_regs;
 	void __iomem *j721e_regs;
 
 	struct device *dev;
@@ -392,9 +405,18 @@ struct cdns_mhdp_device {
 
 	/* Work struct to schedule a uevent on link train failure */
 	struct work_struct modeset_retry_work;
+	struct work_struct hpd_work;
+
+	wait_queue_head_t sw_events_wq;
+	u32 sw_events;
+
+	struct cdns_mhdp_hdcp hdcp;
+	bool hdcp_supported;
 };
 
 #define connector_to_mhdp(x) container_of(x, struct cdns_mhdp_device, connector)
 #define bridge_to_mhdp(x) container_of(x, struct cdns_mhdp_device, bridge)
 
+u32 cdns_mhdp_wait_for_sw_event(struct cdns_mhdp_device *mhdp, uint32_t event);
+
 #endif
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
new file mode 100644
index 000000000000..fccd6fbcc257
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -0,0 +1,570 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence MHDP8546 DP bridge driver.
+ *
+ * Copyright (C) 2020 Cadence Design Systems, Inc.
+ *
+ */
+
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include <asm/unaligned.h>
+
+#include <drm/drm_hdcp.h>
+
+#include "cdns-mhdp8546-hdcp.h"
+
+static int cdns_mhdp_secure_mailbox_read(struct cdns_mhdp_device *mhdp)
+{
+	int ret, empty;
+
+	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
+
+	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_EMPTY,
+				 empty, !empty, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	return readl(mhdp->sapb_regs + CDNS_MAILBOX_RX_DATA) & 0xff;
+}
+
+static int cdns_mhdp_secure_mailbox_write(struct cdns_mhdp_device *mhdp,
+					  u8 val)
+{
+	int ret, full;
+
+	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
+
+	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_FULL,
+				 full, !full, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	writel(val, mhdp->sapb_regs + CDNS_MAILBOX_TX_DATA);
+
+	return 0;
+}
+
+static int cdns_mhdp_secure_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
+						u8 module_id,
+						u8 opcode,
+						u16 req_size)
+{
+	u32 mbox_size, i;
+	u8 header[4];
+	int ret;
+
+	/* read the header of the message */
+	for (i = 0; i < sizeof(header); i++) {
+		ret = cdns_mhdp_secure_mailbox_read(mhdp);
+		if (ret < 0)
+			return ret;
+
+		header[i] = ret;
+	}
+
+	mbox_size = get_unaligned_be16(header + 2);
+
+	if (opcode != header[0] || module_id != header[1] ||
+	    (opcode != HDCP_TRAN_IS_REC_ID_VALID && req_size != mbox_size)) {
+		for (i = 0; i < mbox_size; i++)
+			if (cdns_mhdp_secure_mailbox_read(mhdp) < 0)
+				break;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cdns_mhdp_secure_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
+					      u8 *buff, u16 buff_size)
+{
+	int ret;
+	u32 i;
+
+	for (i = 0; i < buff_size; i++) {
+		ret = cdns_mhdp_secure_mailbox_read(mhdp);
+		if (ret < 0)
+			return ret;
+
+		buff[i] = ret;
+	}
+
+	return 0;
+}
+
+static int cdns_mhdp_secure_mailbox_send(struct cdns_mhdp_device *mhdp,
+					 u8 module_id,
+					 u8 opcode,
+					 u16 size,
+					 u8 *message)
+{
+	u8 header[4];
+	int ret;
+	u32 i;
+
+	header[0] = opcode;
+	header[1] = module_id;
+	put_unaligned_be16(size, header + 2);
+
+	for (i = 0; i < sizeof(header); i++) {
+		ret = cdns_mhdp_secure_mailbox_write(mhdp, header[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < size; i++) {
+		ret = cdns_mhdp_secure_mailbox_write(mhdp, message[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int cdns_mhdp_hdcp_get_status(struct cdns_mhdp_device *mhdp,
+				     u16 *hdcp_port_status)
+{
+	u8 hdcp_status[HDCP_STATUS_SIZE];
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+					    HDCP_TRAN_STATUS_CHANGE, 0, NULL);
+	if (ret)
+		goto err_get_hdcp_status;
+
+	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
+						   HDCP_TRAN_STATUS_CHANGE,
+						   sizeof(hdcp_status));
+	if (ret)
+		goto err_get_hdcp_status;
+
+	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, hdcp_status,
+						 sizeof(hdcp_status));
+	if (ret)
+		goto err_get_hdcp_status;
+
+	*hdcp_port_status = ((u16)(hdcp_status[0] << 8) | hdcp_status[1]);
+
+err_get_hdcp_status:
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static u8 cdns_mhdp_hdcp_handle_status(struct cdns_mhdp_device *mhdp,
+				       u16 status)
+{
+	u8 err = GET_HDCP_PORT_STS_LAST_ERR(status);
+
+	if (err)
+		dev_dbg(mhdp->dev, "HDCP Error = %d", err);
+
+	return err;
+}
+
+static int cdns_mhdp_hdcp_rx_id_valid_response(struct cdns_mhdp_device *mhdp,
+					       u8 valid)
+{
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+					    HDCP_TRAN_RESPOND_RECEIVER_ID_VALID,
+					    1, &valid);
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static int cdns_mhdp_hdcp_rx_id_valid(struct cdns_mhdp_device *mhdp,
+				      u8 *recv_num, u8 *hdcp_rx_id)
+{
+	u8 rec_id_hdr[2];
+	u8 status;
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+					    HDCP_TRAN_IS_REC_ID_VALID, 0, NULL);
+	if (ret)
+		goto err_rx_id_valid;
+
+	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
+						   HDCP_TRAN_IS_REC_ID_VALID,
+						   sizeof(status));
+	if (ret)
+		goto err_rx_id_valid;
+
+	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, rec_id_hdr, 2);
+	if (ret)
+		goto err_rx_id_valid;
+
+	*recv_num = rec_id_hdr[0];
+
+	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, hdcp_rx_id, 5 * *recv_num);
+
+err_rx_id_valid:
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static int cdns_mhdp_hdcp_km_stored_resp(struct cdns_mhdp_device *mhdp,
+					 u32 size, u8 *km)
+{
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+					    HDCP2X_TX_RESPOND_KM, size, km);
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static int cdns_mhdp_hdcp_tx_is_km_stored(struct cdns_mhdp_device *mhdp,
+					  u8 *resp, u32 size)
+{
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+					    HDCP2X_TX_IS_KM_STORED, 0, NULL);
+	if (ret)
+		goto err_is_km_stored;
+
+	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
+						   HDCP2X_TX_IS_KM_STORED,
+						   size);
+	if (ret)
+		goto err_is_km_stored;
+
+	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, resp, size);
+err_is_km_stored:
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static int cdns_mhdp_hdcp_tx_config(struct cdns_mhdp_device *mhdp,
+				    u8 hdcp_cfg)
+{
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+					    HDCP_TRAN_CONFIGURATION, 1, &hdcp_cfg);
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static int cdns_mhdp_hdcp_set_config(struct cdns_mhdp_device *mhdp,
+				     u8 hdcp_config, bool enable)
+{
+	u16 hdcp_port_status;
+	u32 ret_event;
+	u8 hdcp_cfg;
+	int ret;
+
+	hdcp_cfg = hdcp_config | (enable ? 0x04 : 0) |
+		   (HDCP_CONTENT_TYPE_0 << 3);
+	cdns_mhdp_hdcp_tx_config(mhdp, hdcp_cfg);
+	ret_event = cdns_mhdp_wait_for_sw_event(mhdp, CDNS_HDCP_TX_STATUS);
+	if (!ret_event)
+		return -1;
+
+	ret = cdns_mhdp_hdcp_get_status(mhdp, &hdcp_port_status);
+	if (ret || cdns_mhdp_hdcp_handle_status(mhdp, hdcp_port_status))
+		return -1;
+
+	return 0;
+}
+
+static int cdns_mhdp_hdcp_auth_check(struct cdns_mhdp_device *mhdp)
+{
+	u16 hdcp_port_status;
+	u32 ret_event;
+	int ret;
+
+	ret_event = cdns_mhdp_wait_for_sw_event(mhdp, CDNS_HDCP_TX_STATUS);
+	if (!ret_event)
+		return -1;
+
+	ret = cdns_mhdp_hdcp_get_status(mhdp, &hdcp_port_status);
+	if (ret || cdns_mhdp_hdcp_handle_status(mhdp, hdcp_port_status))
+		return -1;
+
+	if (hdcp_port_status & 1) {
+		dev_dbg(mhdp->dev, "Authentication completed successfully!\n");
+		return 0;
+	}
+
+	dev_dbg(mhdp->dev, "Authentication failed\n");
+
+	return -1;
+}
+
+static int cdns_mhdp_hdcp_check_receviers(struct cdns_mhdp_device *mhdp)
+{
+	u8 hdcp_rec_id[HDCP_MAX_RECEIVERS][HDCP_RECEIVER_ID_SIZE_BYTES];
+	u8 hdcp_num_rec;
+	u32 ret_event;
+
+	ret_event = cdns_mhdp_wait_for_sw_event(mhdp,
+						CDNS_HDCP_TX_IS_RCVR_ID_VALID);
+	if (!ret_event)
+		return -1;
+
+	hdcp_num_rec = 0;
+	memset(&hdcp_rec_id, 0, sizeof(hdcp_rec_id));
+	cdns_mhdp_hdcp_rx_id_valid(mhdp, &hdcp_num_rec, (u8 *)hdcp_rec_id);
+	cdns_mhdp_hdcp_rx_id_valid_response(mhdp, 1);
+
+	return 0;
+}
+
+static int cdns_mhdp_hdcp_auth_22(struct cdns_mhdp_device *mhdp)
+{
+	u8 resp[HDCP_STATUS_SIZE];
+	u16 hdcp_port_status;
+	u32 ret_event;
+	int ret;
+
+	dev_dbg(mhdp->dev, "HDCP: Start 2.2 Authentication\n");
+	ret_event = cdns_mhdp_wait_for_sw_event(mhdp,
+						CDNS_HDCP2_TX_IS_KM_STORED);
+	if (!ret_event)
+		return -1;
+
+	if (ret_event & CDNS_HDCP_TX_STATUS) {
+		mhdp->sw_events &= ~CDNS_HDCP_TX_STATUS;
+		ret = cdns_mhdp_hdcp_get_status(mhdp, &hdcp_port_status);
+		if (ret || cdns_mhdp_hdcp_handle_status(mhdp, hdcp_port_status))
+			return -1;
+	}
+
+	cdns_mhdp_hdcp_tx_is_km_stored(mhdp, resp, sizeof(resp));
+	cdns_mhdp_hdcp_km_stored_resp(mhdp, 0, NULL);
+
+	if (cdns_mhdp_hdcp_check_receviers(mhdp))
+		return -1;
+
+	return 0;
+}
+
+static inline int cdns_mhdp_hdcp_auth_14(struct cdns_mhdp_device *mhdp)
+{
+	dev_dbg(mhdp->dev, "HDCP: Starting 1.4 Authentication\n");
+	return cdns_mhdp_hdcp_check_receviers(mhdp);
+}
+
+static int cdns_mhdp_hdcp_auth(struct cdns_mhdp_device *mhdp,
+			       u8 hdcp_config)
+{
+	int ret;
+
+	ret = cdns_mhdp_hdcp_set_config(mhdp, hdcp_config, true);
+	if (ret)
+		goto auth_failed;
+
+	if (hdcp_config == HDCP_TX_1)
+		ret = cdns_mhdp_hdcp_auth_14(mhdp);
+	else
+		ret = cdns_mhdp_hdcp_auth_22(mhdp);
+
+	if (ret)
+		goto auth_failed;
+
+	ret = cdns_mhdp_hdcp_auth_check(mhdp);
+	if (ret)
+		ret = cdns_mhdp_hdcp_auth_check(mhdp);
+
+auth_failed:
+	return ret;
+}
+
+static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
+{
+	int ret;
+
+	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
+		mhdp->connector.name, mhdp->connector.base.id);
+
+	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
+
+	return ret;
+}
+
+static int _cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp, u8 content_type)
+{
+	int ret, tries = 3;
+	u32 i;
+
+	for (i = 0; i < tries; i++) {
+		if (content_type == DRM_MODE_HDCP_CONTENT_TYPE0 ||
+		    content_type == DRM_MODE_HDCP_CONTENT_TYPE1) {
+			ret = cdns_mhdp_hdcp_auth(mhdp, HDCP_TX_2);
+			if (!ret)
+				return 0;
+			_cdns_mhdp_hdcp_disable(mhdp);
+		}
+
+		if (content_type == DRM_MODE_HDCP_CONTENT_TYPE0) {
+			ret = cdns_mhdp_hdcp_auth(mhdp, HDCP_TX_1);
+			if (!ret)
+				return 0;
+			_cdns_mhdp_hdcp_disable(mhdp);
+		}
+	}
+
+	dev_err(mhdp->dev, "HDCP authentication failed (%d tries/%d)\n",
+		tries, ret);
+
+	return ret;
+}
+
+static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
+{
+	u16 hdcp_port_status;
+	int ret = 0;
+
+	mutex_lock(&mhdp->hdcp.mutex);
+	if (mhdp->hdcp.value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		goto out;
+
+	ret = cdns_mhdp_hdcp_get_status(mhdp, &hdcp_port_status);
+	if (!ret && hdcp_port_status & HDCP_PORT_STS_AUTH)
+		goto out;
+
+	dev_err(mhdp->dev,
+		"[%s:%d] HDCP link failed, retrying authentication\n",
+		mhdp->connector.name, mhdp->connector.base.id);
+
+	ret = _cdns_mhdp_hdcp_disable(mhdp);
+	if (ret) {
+		mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		schedule_work(&mhdp->hdcp.prop_work);
+		goto out;
+	}
+
+	ret = _cdns_mhdp_hdcp_enable(mhdp, mhdp->hdcp.hdcp_content_type);
+	if (ret) {
+		mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		schedule_work(&mhdp->hdcp.prop_work);
+	}
+out:
+	mutex_unlock(&mhdp->hdcp.mutex);
+	return ret;
+}
+
+static void cdns_mhdp_hdcp_check_work(struct work_struct *work)
+{
+	struct delayed_work *d_work = to_delayed_work(work);
+	struct cdns_mhdp_hdcp *hdcp = container_of(d_work,
+						   struct cdns_mhdp_hdcp,
+						   check_work);
+	struct cdns_mhdp_device *mhdp = container_of(hdcp,
+						     struct cdns_mhdp_device,
+						     hdcp);
+
+	if (!cdns_mhdp_hdcp_check_link(mhdp))
+		schedule_delayed_work(&hdcp->check_work,
+				      DRM_HDCP_CHECK_PERIOD_MS);
+}
+
+static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
+{
+	struct cdns_mhdp_hdcp *hdcp = container_of(work,
+						   struct cdns_mhdp_hdcp,
+						   prop_work);
+	struct cdns_mhdp_device *mhdp = container_of(hdcp,
+						     struct cdns_mhdp_device,
+						     hdcp);
+	struct drm_device *dev = mhdp->connector.dev;
+	struct drm_connector_state *state;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	mutex_lock(&mhdp->hdcp.mutex);
+	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		state = mhdp->connector.state;
+		state->content_protection = mhdp->hdcp.value;
+	}
+	mutex_unlock(&mhdp->hdcp.mutex);
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+}
+
+int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val)
+{
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_GENERAL,
+					    HDCP_GENERAL_SET_LC_128,
+					    16, val);
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+int
+cdns_mhdp_hdcp_set_public_key_param(struct cdns_mhdp_device *mhdp,
+				    struct cdns_hdcp_tx_public_key_param *val)
+{
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+					    HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
+					    sizeof(*val), (u8 *)val);
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp, u8 content_type)
+{
+	int ret;
+
+	mutex_lock(&mhdp->hdcp.mutex);
+	ret = _cdns_mhdp_hdcp_enable(mhdp, content_type);
+	if (ret)
+		goto out;
+
+	mhdp->hdcp.hdcp_content_type = content_type;
+	mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
+	schedule_work(&mhdp->hdcp.prop_work);
+	schedule_delayed_work(&mhdp->hdcp.check_work,
+			      DRM_HDCP_CHECK_PERIOD_MS);
+out:
+	mutex_unlock(&mhdp->hdcp.mutex);
+	return ret;
+}
+
+int cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
+{
+	int ret = 0;
+
+	mutex_lock(&mhdp->hdcp.mutex);
+	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		mhdp->hdcp.value = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+		schedule_work(&mhdp->hdcp.prop_work);
+		ret = _cdns_mhdp_hdcp_disable(mhdp);
+	}
+	mutex_unlock(&mhdp->hdcp.mutex);
+	cancel_delayed_work_sync(&mhdp->hdcp.check_work);
+
+	return ret;
+}
+
+void cdns_mhdp_hdcp_init(struct cdns_mhdp_device *mhdp)
+{
+	INIT_DELAYED_WORK(&mhdp->hdcp.check_work, cdns_mhdp_hdcp_check_work);
+	INIT_WORK(&mhdp->hdcp.prop_work, cdns_mhdp_hdcp_prop_work);
+	mutex_init(&mhdp->hdcp.mutex);
+}
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
new file mode 100644
index 000000000000..334c0b8b0d4f
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence MHDP8546 DP bridge driver.
+ *
+ * Copyright (C) 2020 Cadence Design Systems, Inc.
+ *
+ */
+
+#ifndef CDNS_MHDP8546_HDCP_H
+#define CDNS_MHDP8546_HDCP_H
+
+#include "cdns-mhdp8546-core.h"
+
+#define HDCP_MAX_RECEIVERS 32
+#define HDCP_RECEIVER_ID_SIZE_BYTES 5
+#define HDCP_STATUS_SIZE         0x5
+#define HDCP_PORT_STS_AUTH       0x1
+#define HDCP_PORT_STS_LAST_ERR_SHIFT 0x5
+#define HDCP_PORT_STS_LAST_ERR_MASK  (0x0F << 5)
+#define GET_HDCP_PORT_STS_LAST_ERR(__sts__) \
+	(((__sts__) & HDCP_PORT_STS_LAST_ERR_MASK) >> \
+	HDCP_PORT_STS_LAST_ERR_SHIFT)
+
+#define HDCP_CONFIG_1_4     BIT(0) /* use HDCP 1.4 only */
+#define HDCP_CONFIG_2_2     BIT(1) /* use HDCP 2.2 only */
+/* use All HDCP versions */
+#define HDCP_CONFIG_ALL     (BIT(0) | BIT(1))
+#define HDCP_CONFIG_NONE    0
+
+enum {
+	HDCP_GENERAL_SET_LC_128,
+	HDCP_SET_SEED,
+};
+
+enum {
+	HDCP_TRAN_CONFIGURATION,
+	HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
+	HDCP2X_TX_SET_DEBUG_RANDOM_NUMBERS,
+	HDCP2X_TX_RESPOND_KM,
+	HDCP1_TX_SEND_KEYS,
+	HDCP1_TX_SEND_RANDOM_AN,
+	HDCP_TRAN_STATUS_CHANGE,
+	HDCP2X_TX_IS_KM_STORED,
+	HDCP2X_TX_STORE_KM,
+	HDCP_TRAN_IS_REC_ID_VALID,
+	HDCP_TRAN_RESPOND_RECEIVER_ID_VALID,
+	HDCP_TRAN_TEST_KEYS,
+	HDCP2X_TX_SET_KM_KEY_PARAMS,
+	HDCP_NUM_OF_SUPPORTED_MESSAGES
+};
+
+enum {
+	HDCP_CONTENT_TYPE_0,
+	HDCP_CONTENT_TYPE_1,
+};
+
+#define DRM_HDCP_CHECK_PERIOD_MS (128 * 16)
+
+#define HDCP_PAIRING_R_ID 5
+#define HDCP_PAIRING_M_LEN 16
+#define HDCP_KM_LEN 16
+#define HDCP_PAIRING_M_EKH 16
+
+struct cdns_hdcp_pairing_data {
+	u8 receiver_id[HDCP_PAIRING_R_ID];
+	u8 m[HDCP_PAIRING_M_LEN];
+	u8 km[HDCP_KM_LEN];
+	u8 ekh[HDCP_PAIRING_M_EKH];
+};
+
+enum {
+	HDCP_TX_2,
+	HDCP_TX_1,
+	HDCP_TX_BOTH,
+};
+
+#define DLP_MODULUS_N 384
+#define DLP_E 3
+
+struct cdns_hdcp_tx_public_key_param {
+	u8 N[DLP_MODULUS_N];
+	u8 E[DLP_E];
+};
+
+int cdns_mhdp_hdcp_set_public_key_param(struct cdns_mhdp_device *mhdp,
+					struct cdns_hdcp_tx_public_key_param *val);
+int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val);
+int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp, u8 content_type);
+int cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp);
+void cdns_mhdp_hdcp_init(struct cdns_mhdp_device *mhdp);
+
+#endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
