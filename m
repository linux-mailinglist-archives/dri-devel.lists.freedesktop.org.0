Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1543265FD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 18:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFC46EE1A;
	Fri, 26 Feb 2021 17:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2129E6EE1A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 17:00:00 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QG8tEB008830; Fri, 26 Feb 2021 08:15:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=wUwUkDRnE48Iw66w8qaiKC4Sn1m0uGaY9K9qGOkz5Zc=;
 b=te3qZzVvDDxbdo+Pnl9qqnvhpOwJ9XpM/eIK+v/WESfs1z99KSG5y9DHLyf9iD8F5KRM
 KNVoq3Esq7FDdAkA+0NDucn8adQrQDY8vp0mFCdeY09HASwRvakG0w0r+VndQ6SKiqc7
 N23VaWZ0P2ym7b+bwXEJHjXUNU4GWdLCBoi9Pk/lKwPeEcODyVkwJmXwW+RKX15a3FSv
 3Gma6qFDrf6A0QQWFY1UX/+yYA4Np+59TvMYVXpdDCUm4jD0yyY8529j+K4gY70j3oKC
 x6o1TeTKharigXylOCVxsjL0M1rNf/7sjJBu829xK3ZqTGiAEoRqwbO1Jy3VchsT/POj VQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by mx0b-0014ca01.pphosted.com with ESMTP id 36txw3p9v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 08:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRDS3M3At/CxoNypo2atx/BgVdvMjKL2ekPAVcd4JiKSWZtaSQpLUG+dcHATKI7cPpeWhLhmbRZEEizdGPelOsI7qrpTH5m7FYdIQHWPHfAvHh26QQzWJexl/Fb6dxckvfUPetOV2HhV+BVmjD4BUXQ+bXLXEu9Pf7jJ6Hl7npuwXuLcKz5KQCJYR+OB2P42l88LqYOP+9uhV9+HzbRrOplPQD6ZVQsQHC4IR8YGO30o25Hr1YxQEqi9hODfrUCACz91N3PgnRsLT4PtasvSUJRuWqMamQ0Rv1ItVShiN7dy7tA1ThfM0vO10HpnvF7kFm/DzREEaF7MIJd9VqNXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUwUkDRnE48Iw66w8qaiKC4Sn1m0uGaY9K9qGOkz5Zc=;
 b=i/jkxVPSH++9CwJoXsXki/gc1ymWI4f/vojTJ3I8eXCm8mt7pOyfg3RQconY6ZTTzqICkOXQRUH/mbF894sCmL2tDfxLbU/iGbfeWyoOlqMQ726tx+1eSmI9c3vSA20OAaEiOgRKhJikXba1uJYx5tPu0NQ9B42/4PiAYq48n88YtJnVB7sTaKclY1SJ/JOkJXMxm9JyG3yu5L6zk5FUTryXzFIAcWWrWqBG8nyoLNx/WE1ohDkD6pLYFHRZKlqtpU4Nz/lQidazn5b6lXT7BKolJuCKBsCcepfjKu+UC/rZT8jT+hOWakJkpLDC10Qnu/eKLcglJrnjXcs4m3eWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUwUkDRnE48Iw66w8qaiKC4Sn1m0uGaY9K9qGOkz5Zc=;
 b=XAaQrg8HrRFLC2gPpefBeBJv7oDgjQb51+gjMlF6WRBeiQbLPyDD6s9DjcS92A+pXLkrAT0ATz6+VIW3uVGjpKiV0IJXEsZFX/1Z/TmAFAwzakbTK8NE6IisSdLzDL1/OP2Eero1wK5eu0ijrU+fe3RH873Uoj8BORaHXA9MrQs=
Received: from DS7PR03CA0210.namprd03.prod.outlook.com (2603:10b6:5:3b6::35)
 by BYAPR07MB4997.namprd07.prod.outlook.com (2603:10b6:a03:13::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Fri, 26 Feb
 2021 16:15:33 +0000
Received: from DM6NAM12FT031.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::da) by DS7PR03CA0210.outlook.office365.com
 (2603:10b6:5:3b6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Fri, 26 Feb 2021 16:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 DM6NAM12FT031.mail.protection.outlook.com (10.13.179.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Fri, 26 Feb 2021 16:15:31 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 11QGFSVt118111
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 08:15:29 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 26 Feb 2021 17:15:27 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 26 Feb 2021 17:15:27 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 11QGFRlP021572;
 Fri, 26 Feb 2021 17:15:27 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 11QGFRxT021570;
 Fri, 26 Feb 2021 17:15:27 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robh+dt@kernel.org>, <laurent.pinchart@ideasonboard.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm: bridge: cdns-mhdp8546: Enable HDCP
Date: Fri, 26 Feb 2021 17:15:26 +0100
Message-ID: <1614356126-21519-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1614356086-19745-1-git-send-email-pthombar@cadence.com>
References: <1614356086-19745-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a506425f-e549-413b-c9a4-08d8da71bd8b
X-MS-TrafficTypeDiagnostic: BYAPR07MB4997:
X-Microsoft-Antispam-PRVS: <BYAPR07MB4997D622E023B6B21528D553C19D9@BYAPR07MB4997.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:209;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwMl53pR5NleTYNPR5LcfciH9wV5Kg1am7DHJYXikxi/M/uxRWgbVlxeulzv5sxVy1kPxgt6kuqLeLx7QbkkOxLLCSsZb/BhwirApyYxvEEnRFyMvbEmWu2LmrFQXoUf4AimsNWWpNwP9eQ/Mkygh2d01iegBsreltpKYWKvnYQ3ptUmH9fvApx1dprOgOeFtQ5V55TnRrz1cUlXjIwTp5VOrDpTDzHz5/aCG1/ANYSJMN2+NWV/05PHFCAfmLh9sV8GiSqzYmiUWDUdoKsHVn5Hu7h/dIEUDlsyvsn6PMcz91riMSNOPbLZ0PyOhGd248bTtfVFORjTDQeLChAH0PSwecGN+xfrrHXrB1cuthhu2+wkCpGmRg1ycCyqjiqQy68eFgniU2u1qQ8TpcbuIusEy/rybtzFBvFkmvVw6wiaFiiZUuUkOSY7wOngmQUY8g/qkoIDuza8z8s6ciDEd30PruMAhMVtBMd6u67smqgzOwI3eprl6t1HRefy8KJxa8MMMkJFs6DKS4IUuAiroPVrkCFtn3uMgasfTEWWY9fsBjWbWqgD0xw6vjLiTxrPjMi2YJvlVs+n3RJfpBHWU9Jv3VePrzIKmfc4ieSAV6c8dUUKZZ0CgYcUbc7e1pd/JurtI5q85zoCG9mOzodP/kbvGOdFeO2gjTDrYRtJ58Qmyxy3O5gQiUnCQ6lwm1SIyHpI+K+hpEamRqOnz4bQ3g==
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(36092001)(36840700001)(46966006)(82740400003)(81166007)(5660300002)(8936002)(2616005)(70586007)(478600001)(36860700001)(82310400003)(30864003)(356005)(47076005)(107886003)(426003)(8676002)(4326008)(110136005)(2906002)(336012)(7416002)(42186006)(70206006)(186003)(83380400001)(316002)(36906005)(86362001)(36756003)(26005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 16:15:31.6891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a506425f-e549-413b-c9a4-08d8da71bd8b
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT031.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4997
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_05:2021-02-26,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102260122
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
---
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 105 +++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  21 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 578 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  89 +++
 5 files changed, 782 insertions(+), 13 deletions(-)
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
index d0c65610ebb5..e2d75fc596f6 100644
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
@@ -1614,10 +1615,40 @@ enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
 	return MODE_OK;
 }
 
+static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_state, *new_state;
+	struct drm_crtc_state *crtc_state;
+	u64 old_cp, new_cp;
+
+	old_state = drm_atomic_get_old_connector_state(state, conn);
+	new_state = drm_atomic_get_new_connector_state(state, conn);
+	old_cp = old_state->content_protection;
+	new_cp = new_state->content_protection;
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
@@ -1662,7 +1693,7 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
-	return 0;
+	return drm_connector_attach_content_protection_property(conn, true);
 }
 
 static int cdns_mhdp_attach(struct drm_bridge *bridge,
@@ -1956,6 +1987,13 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	if (WARN_ON(!conn_state))
 		goto out;
+	if (conn_state->content_protection ==
+	    DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	    mhdp->hw_state == MHDP_HW_READY) {
+		mutex_unlock(&mhdp->link_mutex);
+		cdns_mhdp_hdcp_enable(mhdp);
+		mutex_lock(&mhdp->link_mutex);
+	}
 
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	if (WARN_ON(!crtc_state))
@@ -2000,6 +2038,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 
 	mutex_lock(&mhdp->link_mutex);
 
+	cdns_mhdp_hdcp_disable(mhdp);
 	mhdp->bridge_enabled = false;
 	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	resp &= ~CDNS_DP_FRAMER_EN;
@@ -2288,7 +2327,6 @@ static irqreturn_t cdns_mhdp_irq_handler(int irq, void *data)
 	struct cdns_mhdp_device *mhdp = data;
 	u32 apb_stat, sw_ev0;
 	bool bridge_attached;
-	int ret;
 
 	apb_stat = readl(mhdp->regs + CDNS_APB_INT_STATUS);
 	if (!(apb_stat & CDNS_APB_INT_MASK_SW_EVENT_INT))
@@ -2307,20 +2345,54 @@ static irqreturn_t cdns_mhdp_irq_handler(int irq, void *data)
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
@@ -2356,6 +2428,12 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 		return PTR_ERR(mhdp->regs);
 	}
 
+	mhdp->sapb_regs = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(mhdp->sapb_regs)) {
+		dev_err(dev, "Failed to get SAPB memory resource\n");
+		return PTR_ERR(mhdp->sapb_regs);
+	}
+
 	mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node, 0);
 	if (IS_ERR(mhdp->phy)) {
 		dev_err(dev, "no PHY configured\n");
@@ -2430,13 +2508,16 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	/* Initialize the work for modeset in case of link train failure */
 	INIT_WORK(&mhdp->modeset_retry_work, cdns_mhdp_modeset_retry_fn);
+	INIT_WORK(&mhdp->hpd_work, cdns_mhdp_hpd_work);
 
 	init_waitqueue_head(&mhdp->fw_load_wq);
+	init_waitqueue_head(&mhdp->sw_events_wq);
 
 	ret = cdns_mhdp_load_firmware(mhdp);
 	if (ret)
 		goto phy_exit;
 
+	cdns_mhdp_hdcp_init(mhdp, pdev->dev.of_node);
 	drm_bridge_add(&mhdp->bridge);
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index 5897a85e3159..0d652569e487 100644
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
+	u8 config;
+};
+
 struct cdns_mhdp_device {
 	void __iomem *regs;
+	void __iomem *sapb_regs;
 	void __iomem *j721e_regs;
 
 	struct device *dev;
@@ -392,9 +405,17 @@ struct cdns_mhdp_device {
 
 	/* Work struct to schedule a uevent on link train failure */
 	struct work_struct modeset_retry_work;
+	struct work_struct hpd_work;
+
+	wait_queue_head_t sw_events_wq;
+	u32 sw_events;
+
+	struct cdns_mhdp_hdcp hdcp;
 };
 
 #define connector_to_mhdp(x) container_of(x, struct cdns_mhdp_device, connector)
 #define bridge_to_mhdp(x) container_of(x, struct cdns_mhdp_device, bridge)
 
+u32 cdns_mhdp_wait_for_sw_event(struct cdns_mhdp_device *mhdp, uint32_t event);
+
 #endif
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
new file mode 100644
index 000000000000..c0ee8235ffa9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -0,0 +1,578 @@
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
+static int _cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp)
+{
+	int ret, tries = 3;
+	u32 i;
+
+	for (i = 0; i < tries; i++) {
+		if (mhdp->hdcp.config & HDCP_CONFIG_2_2) {
+			ret = cdns_mhdp_hdcp_auth(mhdp, HDCP_TX_2);
+			if (!ret)
+				return 0;
+		}
+		_cdns_mhdp_hdcp_disable(mhdp);
+
+		if (mhdp->hdcp.config & HDCP_CONFIG_1_4) {
+			ret = cdns_mhdp_hdcp_auth(mhdp, HDCP_TX_1);
+			if (!ret)
+				return 0;
+		}
+		_cdns_mhdp_hdcp_disable(mhdp);
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
+	ret = _cdns_mhdp_hdcp_enable(mhdp);
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
+cdns_mhdp_hdcp_set_public_key_params(struct cdns_mhdp_device *mhdp,
+				     struct cdns_hdcp_tx_public_key_param *val)
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
+int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp)
+{
+	int ret;
+
+	mutex_lock(&mhdp->hdcp.mutex);
+	ret = _cdns_mhdp_hdcp_enable(mhdp);
+	if (ret)
+		goto out;
+
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
+int cdns_mhdp_hdcp_init(struct cdns_mhdp_device *mhdp,
+			struct device_node *of_node)
+{
+	u32 config;
+	int ret;
+
+	ret = of_property_read_u32(of_node, "hdcp-config", &config);
+	if (ret)
+		mhdp->hdcp.config = HDCP_CONFIG_ALL;
+	else
+		mhdp->hdcp.config = config;
+
+	INIT_DELAYED_WORK(&mhdp->hdcp.check_work, cdns_mhdp_hdcp_check_work);
+	INIT_WORK(&mhdp->hdcp.prop_work, cdns_mhdp_hdcp_prop_work);
+	mutex_init(&mhdp->hdcp.mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
new file mode 100644
index 000000000000..fc694a9e4c04
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
@@ -0,0 +1,89 @@
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
+int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp);
+int cdns_mhdp_hdcp_init(struct cdns_mhdp_device *mhdp, struct device_node *of_node);
+
+#endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
