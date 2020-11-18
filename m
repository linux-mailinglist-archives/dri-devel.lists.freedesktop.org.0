Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C42B8D22
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485686E51B;
	Thu, 19 Nov 2020 08:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569126E3D0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 14:04:00 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AIE0pVY027578; Wed, 18 Nov 2020 06:03:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=lPwf5/zU9UTw71hGTKzYrSmfvpQfDZAyRZbrhKFC70s=;
 b=BQnyTCLBfVTW1o2tAMvsVa8PKFxpCbwqJ8aYmxQTmM+kuGZTgNp0cVEBKJwY6fNyoDk2
 k5KsjcCdLlkq/Sp7WOVL2yWxLU5gZXl1A9wxhLhKvd8eyCT1N9mtJND3HcHm8I6dC9W0
 f7DttKIi46u5CyS6oY3gih3IPMJLzYBrxktNwTIcpdBoXQrHuFf6NeTvhA8Qkh50iZKK
 Zs3FRQc8e2sngG9g0bQfNaud4eIn61k7xAf/L+rJSYEA8cBaV/PR1aq6UUBN7UQp7dBP
 kKpoBBpQ93Wen+xM2lMjhNDbwkDK9PTRvkvPLl2Q5udXOAnONDMA4Qw9Z77s4V2N6oiz Tw== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2050.outbound.protection.outlook.com [104.47.38.50])
 by mx0b-0014ca01.pphosted.com with ESMTP id 34tbq2yv9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 06:03:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0K71dt8WE3RnfMctiUR/egwFQclsn/AG0+H77lAOAeXhM1XMjtllZiilif6KvwlWfP8FG5cA9sByF4RhsIjvHGm1xXSbN2kSZE/kULD12NOVZ3+ZVLdO8hLdVFhbcKjqlCUhup/vk8rojMdBeThMqwA0xd4jASKaxpFAyeVwfou72ZoRMhmmAnfTWy8deEpTT4JtSqPXz7GPLh2YdyJOiH9Ecgja7OavCz81vIELmk4e3I1RfFiv0i8avWjdlJY+tXG+dyrfNku3VF+Jv9fdQ73TBi5RFkOwjaCnOKlXW2jU3iydH2rP4i+QauocSFjW9kosGbfITS7exisu8qqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPwf5/zU9UTw71hGTKzYrSmfvpQfDZAyRZbrhKFC70s=;
 b=Mqys6qYW+T/iZqCds0/RpAAc9xXqnZeuy2QrO8thEQ/rG9sa+UXKpF/b09Kb37xXDD8BrBoINXd7eH2LpLA2AV13GvBRsH3QaZamQySFquvSl43vW3+1MCeMf8z9piriD+h3uaZCxDQYhpMuD+aP/4P9lsJhhIPMxqPieHZT6CEbMCZXSMJ/YyG6rgTVompLCNehGl45OH1OHo1+1yo/kLVOfL8t/jyqTyjvfdoAl5x56WGSPyFzPGs7m2RVqJ+JOg960yd5lfKThI4BGyZvAaFv6eLxjMsxBma5ekMA3WMrsBWE2PFAXoez8tLRRMZ5428/bgnqvzhizOywaJKs6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPwf5/zU9UTw71hGTKzYrSmfvpQfDZAyRZbrhKFC70s=;
 b=DYPmZcAZYG7ITrbDIiXNStG3qtmMnaN6Uu1IAZQtUK9eXC9cRHCi+RDyJz97eh7sV70H9MlvsjzGckoB38UUoMVsrp2rvpYAORcts8Ffh7ro/9YpSiEM7cDeRxrapPuh6ikXqxs13DgMLXEmajCP16NHpGgqlQ63YufHYm3ucXU=
Received: from DM5PR2201CA0013.namprd22.prod.outlook.com (2603:10b6:4:14::23)
 by SN6PR07MB8208.namprd07.prod.outlook.com (2603:10b6:805:e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 14:03:46 +0000
Received: from DM6NAM12FT064.eop-nam12.prod.protection.outlook.com
 (2603:10b6:4:14:cafe::98) by DM5PR2201CA0013.outlook.office365.com
 (2603:10b6:4:14::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 DM6NAM12FT064.mail.protection.outlook.com (10.13.178.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.11 via Frontend Transport; Wed, 18 Nov 2020 14:03:46 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AIE3dUs007561
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 18 Nov 2020 06:03:45 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 18 Nov 2020 15:03:39 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 18 Nov 2020 15:03:39 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AIE3dms003751;
 Wed, 18 Nov 2020 15:03:39 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AIE3cft003750;
 Wed, 18 Nov 2020 15:03:38 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v2 3/3] drm: bridge: cdns-mhdp8546: Retrieve the pixel format
 and bpc based on bus format
Date: Wed, 18 Nov 2020 15:03:28 +0100
Message-ID: <1605708208-3692-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1605708208-3692-1-git-send-email-yamonkar@cadence.com>
References: <1605708208-3692-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4279eca-da06-4c0b-ed2d-08d88bcac445
X-MS-TrafficTypeDiagnostic: SN6PR07MB8208:
X-Microsoft-Antispam-PRVS: <SN6PR07MB8208B4F5DA69A01CAB6CCE5AD2E10@SN6PR07MB8208.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cvm90xGuAhBfKI1Lt2tPBe+KIMpmAd+egrzubP9iUoldghBv5npDLZZtXvmZysgPC4/G4h0Nir0qs+9BWyoWLpnlVqgOlmce/5zcOIs6zA4J1LLwRTAgWUbAapUhcZJS5peZMIbjtpc/+i2xjf7Kq7R8rNgSsy7Sinb0WBPgK5slLYgpbMRACjJlEgX8HfrL5YOpYgrLpqcgpKzj4c3T3Dg9NIDkWQtr3U1CORXVcST+Ah9rP+UlsoBzLhj2JIqwe0SEzJDL/S6kn3oJxeCrDGkm0Wi8spN6vjVw/9zODMh5E6X9x3FMMoYzQxhAuj+Tk3D838k6PJ1d8ZThD1WS9VcGxEioAT7NpIHmugQmorKC6u54fGP0tjVb2GtOx/1PK+YYGM2wveTqtIC1d3CIwYZQiOQuz/6IMPfauVoRXs4DEvsJc9sQ6H3c/7PbFW/d/VkCsn6dSYMMZ7n4SZCeFo/kJSMElNUcC/p0gwbpWw3/VklMmNqpyweS3d8NGnI8zOFQ0YkOJ0Wn/cvZ7T8XXQ==
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36092001)(46966005)(2616005)(5660300002)(336012)(47076004)(82740400003)(36756003)(6666004)(8936002)(7416002)(82310400003)(86362001)(356005)(7636003)(8676002)(426003)(110136005)(54906003)(26005)(186003)(478600001)(42186006)(4326008)(107886003)(36906005)(2906002)(83380400001)(70586007)(70206006)(921005)(316002)(2101003)(83996005)(358055004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 14:03:46.4497 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4279eca-da06-4c0b-ed2d-08d88bcac445
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT064.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB8208
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_04:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180099
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
index d5e94bd74df1..e1f4bbd09816 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1512,24 +1512,8 @@ static int cdns_mhdp_get_modes(struct drm_connector *connector)
 
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
@@ -1689,6 +1673,66 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
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
@@ -2129,6 +2173,8 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
+	cdns_mhdp_get_display_fmt(mhdp, bridge_state);
+
 	mutex_lock(&mhdp->link_mutex);
 
 	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
@@ -2456,7 +2502,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
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
