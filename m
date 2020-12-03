Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CE42CE9DC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AEC6EC7E;
	Fri,  4 Dec 2020 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D346EB78
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:03:40 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B3DwZsh003675; Thu, 3 Dec 2020 06:03:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=cE8xu4v6OzdM3ML4SY7oMnxgU3rb01DJbVO5lC8n+wE=;
 b=PahMtpZFVOQ4T302UEJVpOisVdtTItaf6VKI5AjEFa2E6u2515nT9ptjo4b3HDtAaeuD
 z6eyUr5oy4m2Wmia0h1521GYqYLiv0Th2cRPQ6D8XyrSd/qgFHbWCc0IzMZI1VHbLgVC
 tNBWwg/05jeCUArIok1OUWC+7WY9jnKaLBB1aRdNq2MR3E9OBFeioFCh1kAmdoRr7fMO
 RBIEFoRlhsl9RnXxkxzl+yHFR1Ng2WffGbrvIwGTcBLHxtsQfROhU1CqKC998NnXVuAK
 EJXVlid6oqSAY6ft3s+qVIq4jPEtDgNFwAHTZU3cPn/62BNwRRl4uy+/9obDBdX241Y5 gQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-0014ca01.pphosted.com with ESMTP id 355vn4pv1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 06:03:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtoRalOgpKaNheXD2JjLtxsH3JRyjIlcLxayxayY6IZVl8dQnNlfMpe+HyvJv8+bkOp38aMlf7NvTMB+kN6jlhI/XqslrWMAnpuKrpXbTgn0i7F3XWuuLVCi1ARVtIp6Ej512I/VhwSLsI8fadIp8o8hy04XxunTIyLpgFFrbwCKvMzlPONSdcnZ76EgJamtgjZ7cjnrMkHF190NW43mezXSk5lbY+HjjQXbX+BzLCMPU1yupqG5IJKW6f7++x/K0kCTrIBrM4VoAkykYdUoWYbmtEdOnc8YguDQct2fXZQnNK6QWtixzWoMSf/cf0oru/tR4PcpbcNU6ByX/zMOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE8xu4v6OzdM3ML4SY7oMnxgU3rb01DJbVO5lC8n+wE=;
 b=b0vjBhWUxamuf2QEsxv4Jqbcev+7RK/WiBxKaCXLPyI3+jK51lTx7Z7Uh5bx0KshO7U7CbQxd65qDKcsyOLJ9FnYHPpkRn1DNEIVbSTBbYuGiG54h+3oWHVzlyhGSTGdaaNk6MhZVNciesMiEQVYzxZjekhF3E44VYfAt3d7BowNdgJ7lq36j8IprfmpeBOozZcif7+EisO5FOu+s67uGXCvJxZaY8kMAKKtfR5hht2nrVbKaN2V5ChsY1du2nnagRuak11l8R4dAL07asVDeAhtYwscVieImx9JkuXdU9v7K2930dUCMizmp8TsESQVfwHKzoD9pXoDNlkF8dg+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE8xu4v6OzdM3ML4SY7oMnxgU3rb01DJbVO5lC8n+wE=;
 b=0cE/lSFQBG8xGGoBSrwkCo3nq8/PbRS/0o/+etT5sE1CIe4JZYuNlNcLZx1OWAYvybWpec5fjVrhjXdKAxbrB/VmZyZolwDIM8dAyhk6tq4N5OjgL+zlA7hqJ1yzz74fTS7k8u9Lqz3Zbc3YPEO/CKmsd3H9yd9PfjvgYgYUM00=
Received: from BN1PR14CA0016.namprd14.prod.outlook.com (2603:10b6:408:e3::21)
 by DM5PR07MB4136.namprd07.prod.outlook.com (2603:10b6:4:b6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Thu, 3 Dec
 2020 14:03:24 +0000
Received: from BN8NAM12FT009.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::1b) by BN1PR14CA0016.outlook.office365.com
 (2603:10b6:408:e3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 14:03:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT009.mail.protection.outlook.com (10.13.182.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Thu, 3 Dec 2020 14:03:23 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0B3E3FRM020918
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 3 Dec 2020 09:03:22 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 3 Dec 2020 15:03:14 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 3 Dec 2020 15:03:14 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0B3E3Fxv022350;
 Thu, 3 Dec 2020 15:03:15 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0B3E3EEv022349;
 Thu, 3 Dec 2020 15:03:14 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v3 3/3] drm: bridge: cdns-mhdp8546: Retrieve the pixel format
 and bpc based on bus format
Date: Thu, 3 Dec 2020 15:03:11 +0100
Message-ID: <1607004191-22294-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1607004191-22294-1-git-send-email-yamonkar@cadence.com>
References: <1607004191-22294-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5e8bf0b-d02e-44b3-6072-08d89794330a
X-MS-TrafficTypeDiagnostic: DM5PR07MB4136:
X-Microsoft-Antispam-PRVS: <DM5PR07MB4136C39F31BAC759F1A7B514D2F20@DM5PR07MB4136.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B6zSfg7pNCl3xgLKec8tBpQXyEBmxKkmNuclEc9yTaTMC9HEM4Atvbw2Ii+B1HtK0rm5lq9+/RAA2Z0Py8rJksKHqW11fO+CWDCku05TksU0vlcAKy7zSmnhxMI8J4R49XS2JtJ6etYkL7Duw6qQd5wipFeW8LFzymx9gTP6V9Xkshz407zr5JzjndNfHX/EBrVFOUsV69gRwNmHMKursYMTen57zhKcErfRF40aH8zm/JJRRKOWg3ljikKrVD+gJR2H+63SFzz5wpe9tauaHgntxVwGYxlbmeOeTJDwo9TJrEZu8DQbiGkoHASdXcnEmMSGR0wv+2vh0OdQ1w9GoLaA72P3E84Zol4YrX7QY7gP82X1Fu1UouA55JpkjCmNqI2xbPyjOOL5/iAmsxbwHzePfL/qPYyb4E9za47pX4wZK/IJpr2u7RQNDxnGcb6DPN/ZSobC2YAFMEjAlCTRnZARgfYC/d+RFLwrunEonA9BEAS/RLfBFc5rqt+f1HxN
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(36092001)(46966005)(107886003)(2906002)(70206006)(2616005)(47076004)(83380400001)(42186006)(426003)(7416002)(54906003)(336012)(36906005)(36756003)(110136005)(316002)(921005)(6666004)(5660300002)(186003)(478600001)(8676002)(82310400003)(81166007)(26005)(8936002)(4326008)(356005)(70586007)(82740400003)(86362001)(83996005)(2101003)(358055004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 14:03:23.9867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e8bf0b-d02e-44b3-6072-08d89794330a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT009.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB4136
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_07:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012030085
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, nsekhar@ti.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, sjakhade@cadence.com, nikhil.nd@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the pixel format and bpc based on the output bus format
negotiated instead of hardcoding the values.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 82 +++++++++++++++----
 1 file changed, 64 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d9f7eb8249e8..2ad5cad46599 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1530,24 +1530,8 @@ static int cdns_mhdp_get_modes(struct drm_connector *connector)
 
 	drm_connector_update_edid_property(connector, edid);
 	num_modes = drm_add_edid_modes(connector, edid);
-	kfree(edid);
 
-	/*
-	 * HACK: Warn about unsupported display formats until we deal
-	 *       with them correctly.
-	 */
-	if (connector->display_info.color_formats &&
-	    !(connector->display_info.color_formats &
-	      mhdp->display_fmt.color_format))
-		dev_warn(mhdp->dev,
-			 "%s: No supported color_format found (0x%08x)\n",
-			__func__, connector->display_info.color_formats);
-
-	if (connector->display_info.bpc &&
-	    connector->display_info.bpc < mhdp->display_fmt.bpc)
-		dev_warn(mhdp->dev, "%s: Display bpc only %d < %d\n",
-			 __func__, connector->display_info.bpc,
-			 mhdp->display_fmt.bpc);
+	kfree(edid);
 
 	return num_modes;
 }
@@ -1706,6 +1690,66 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void cdns_mhdp_get_display_fmt(struct cdns_mhdp_device *mhdp,
+				      struct drm_bridge_state *state)
+{
+	u32 bus_fmt, bpc, pxlfmt;
+
+	bus_fmt = state->output_bus_cfg.format;
+	switch (bus_fmt) {
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		pxlfmt = DRM_COLOR_FORMAT_RGB444;
+		bpc = 16;
+		break;
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		pxlfmt = DRM_COLOR_FORMAT_YCRCB444;
+		bpc = 16;
+		break;
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+		pxlfmt = DRM_COLOR_FORMAT_RGB444;
+		bpc = 12;
+		break;
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+		pxlfmt = DRM_COLOR_FORMAT_YCRCB422;
+		bpc = 12;
+		break;
+	case MEDIA_BUS_FMT_YUV12_1X36:
+		pxlfmt = DRM_COLOR_FORMAT_YCRCB444;
+		bpc = 12;
+		break;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		pxlfmt = DRM_COLOR_FORMAT_RGB444;
+		bpc = 10;
+		break;
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		pxlfmt = DRM_COLOR_FORMAT_YCRCB422;
+		bpc = 10;
+		break;
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		pxlfmt = DRM_COLOR_FORMAT_YCRCB444;
+		bpc = 10;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		pxlfmt = DRM_COLOR_FORMAT_RGB444;
+		bpc = 8;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		pxlfmt = DRM_COLOR_FORMAT_YCRCB422;
+		bpc = 8;
+		break;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+		pxlfmt = DRM_COLOR_FORMAT_YCRCB444;
+		bpc = 8;
+		break;
+	default:
+		pxlfmt = DRM_COLOR_FORMAT_RGB444;
+		bpc = 8;
+	}
+
+	mhdp->display_fmt.color_format = pxlfmt;
+	mhdp->display_fmt.bpc = bpc;
+}
+
 static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 				      const struct drm_display_mode *mode)
 {
@@ -2186,6 +2230,8 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
+	cdns_mhdp_get_display_fmt(mhdp, bridge_state);
+
 	mutex_lock(&mhdp->link_mutex);
 
 	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
@@ -2499,7 +2545,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->link.rate = mhdp->host.link_rate;
 	mhdp->link.num_lanes = mhdp->host.lanes_cnt;
 
-	/* The only currently supported format */
+	/* Initialize color format bpc and y_only to default values*/
 	mhdp->display_fmt.y_only = false;
 	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
 	mhdp->display_fmt.bpc = 8;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
