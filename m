Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61052B8D19
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D7B6E507;
	Thu, 19 Nov 2020 08:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174A26E3D0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 14:03:59 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AIE0qrj027668; Wed, 18 Nov 2020 06:03:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=JfXozPlWk+qjEIX6FDgORtm7drmZ/ONGmT4Pzl5cHK0=;
 b=JrB8GTb4yOrLwOv69Mhn5MGoegHVFj956TU/ADcRgeVQnciAHyfL05Rie025fNznpL5/
 s1DO3k5CISrSWWA4Pn8JsZhux2YgOWBsNxy+f5RScfT8Yczou+ZwP9TtElfePZoJrJWN
 PntxMogiyQthGbydyCWWZmwDD7X4sQAywhXdeBeMchcJYDhZVA+3+ayN8l157uVF/Hmd
 5HVJa+efLCm//Y6zwhl3o0jWbmE3AJXpaYR689nx1lyUXRFd2mO+HD1Du9HOUGdPEba8
 4dmVTbPKW7ZYvTiDxApegdCGs441wjZX7oHmUnOGDXeIMRvGKY1xXP0ZvmrfE20bNFx7 YA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0b-0014ca01.pphosted.com with ESMTP id 34tbq2yv9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 06:03:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm/fEOQOvXpfApOyCbvo794Kuxb7m37Yo0w3ugeIEBmEXC8OoS6vnXZhfcrsS2Ho31JXT/bfI4E0fU7OmYLbKvVYpK4rVh1+4KKKKpWzSKt4dz351UOhfkGRzMETVBmXrWY9uwLodtrRTrXS41zoEOYm1Hq/Ehts8cv+VPW02rrqqV2R4MZ93Mp9Lpef57gkhjv5DuytpZxsU+T6rdIuoNDwNzdF2M8jmqP+UspBuTLk9+EU7AfdyDqANJP8iMo3ifMnHaoijnnCcJUQAW+TWOthflWQi4QpdKGY9kqanUNfBsbhVCdZkEIGBJMCnZV6zNzwQydd3LhmVXk+Gd0BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfXozPlWk+qjEIX6FDgORtm7drmZ/ONGmT4Pzl5cHK0=;
 b=E0y+YEgldAWAhvHGO1WQvpi6nHRue/yFMPbO6jt7q3lrkJ/SGVv0bk3CC6RmGsh19ItB8ByhsgoqEW5MlSMCsTI31FWyX2VAcpkGpzB6s3+Guyy0i+4w+bifSW0/ZRjkLJvXMmaZRdilCU8bHiPmWR9EctU7SYpp3J+4h+OSFC5jMuQ3PW/4ZSg88NjM4f9szB6ZfearaAsqMl+h6sXfUcY3n0QUlMDsm5e63l5R/U1jN4PVEsmStNGhXO3F/hqPP5rwLkgnjVVsPuDpdXF6dUZ5g2HPM7UlLGe+4QfKa4CD9sttYU+QuvENmqUfNam6KMQlKXmy5lzR9htcMCH7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfXozPlWk+qjEIX6FDgORtm7drmZ/ONGmT4Pzl5cHK0=;
 b=lOclUZOUhVwIg5FcS8uIR9QAFlyE7LdZWayzv5uJBh70/0CFJw/sJaPHTT7KveSarAT23PZlTaPPvTnTMEt6IINYqr6Z/0TSc6ZTIYIeFxdTGLv4IWPAXRWfIGm3Uofnb2JTVONUjzzDFYBoAWtIfwihOzuUfXVrIP4ELqNr5lY=
Received: from DM6PR08CA0034.namprd08.prod.outlook.com (2603:10b6:5:80::47) by
 DM6PR07MB4700.namprd07.prod.outlook.com (2603:10b6:5:a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Wed, 18 Nov 2020 14:03:45 +0000
Received: from DM6NAM12FT034.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::4) by DM6PR08CA0034.outlook.office365.com
 (2603:10b6:5:80::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 DM6NAM12FT034.mail.protection.outlook.com (10.13.178.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.11 via Frontend Transport; Wed, 18 Nov 2020 14:03:45 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AIE3dUq007561
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 18 Nov 2020 06:03:44 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 18 Nov 2020 15:03:38 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 18 Nov 2020 15:03:38 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AIE3cXT003743;
 Wed, 18 Nov 2020 15:03:38 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AIE3cP6003742;
 Wed, 18 Nov 2020 15:03:38 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v2 1/3] drm: bridge: cdns-mhdp8546: Modify
 atomic_get_input_bus_format bridge function
Date: Wed, 18 Nov 2020 15:03:26 +0100
Message-ID: <1605708208-3692-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1605708208-3692-1-git-send-email-yamonkar@cadence.com>
References: <1605708208-3692-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0cbf313-cd9b-4b3e-32b2-08d88bcac38c
X-MS-TrafficTypeDiagnostic: DM6PR07MB4700:
X-Microsoft-Antispam-PRVS: <DM6PR07MB4700287CB6E92B4A81C2A94ED2E10@DM6PR07MB4700.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nd/s5T6rpZRaLEzKTL4RCZ4Jcek9knyGzCmKLmVAA24d+Js2y9Vjc8F12UNdG2WKIh78mS8bl/4Yt+xAKY3VktibJ12ggymD2pJ13nJHUGS8EOxSrwVMNnaU/IwRQHJKn5dnLWOboANTtWulUs3UWZdeQr3XAmftITJRMbehEz+kE6r2ArF8gANZRR3DjBVNAzGaALWtNR0B2S7BKKyfnyDtzSl0eeJ4XM3ob6n+PtWoGd5G1Ca+dBcAv1uOzvxy3h10sqSR8wTUPumQ/Pg76YgNx8aJ+E2to2JSR4QKorJIqFO4zFRivrY7WNreMC06kWTj5t3xQCNngUnTpMp++TeoWif4cC+9Nt1Ynye1Ja9avEV23Iu/O+QCDlvP35JU/HhzYcT9VVZ9SIwRHMOwukiSqAYYcQtfv8LS3myhl3vZW7GcUrzHzUHJ4u/Dn8vC8kj5AQamy+OS0FZcxIUKzdxi7Ic57MTwnGoZ8GC7C/0=
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(36092001)(46966005)(7416002)(70586007)(107886003)(186003)(316002)(36906005)(478600001)(42186006)(82310400003)(82740400003)(2616005)(7636003)(356005)(2906002)(47076004)(110136005)(8936002)(4326008)(70206006)(83380400001)(8676002)(54906003)(86362001)(426003)(921005)(336012)(36756003)(5660300002)(6666004)(26005)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 14:03:45.2075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cbf313-cd9b-4b3e-32b2-08d88bcac38c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT034.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4700
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

Modify atomic_get_input_bus_format function to return input formats
supported instead of using hardcoded value.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 45 ++++++++++++++-----
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 6beccd2a408e..7c80555ab4ab 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2078,27 +2078,52 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
 	return &cdns_mhdp_state->base;
 }
 
+#define MAX_INPUT_FORMAT 11
+
 static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
-				      struct drm_bridge_state *bridge_state,
-				      struct drm_crtc_state *crtc_state,
-				      struct drm_connector_state *conn_state,
-				      u32 output_fmt,
-				      unsigned int *num_input_fmts)
-{
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 u32 output_fmt,
+					 unsigned int *num_input_fmts)
+{
+	struct drm_connector *conn = conn_state->connector;
+	struct drm_display_info *info = &conn->display_info;
 	u32 *input_fmts;
-	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
+	unsigned int i = 0;
 
 	*num_input_fmts = 0;
 
 	if (output_fmt != MEDIA_BUS_FMT_FIXED)
 		return NULL;
 
-	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	input_fmts = kcalloc(MAX_INPUT_FORMAT,
+			     sizeof(*input_fmts), GFP_KERNEL);
 	if (!input_fmts)
 		return NULL;
 
-	*num_input_fmts = 1;
-	input_fmts[0] = default_bus_format;
+	if (info->color_formats & DRM_COLOR_FORMAT_RGB444) {
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422) {
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+	}
+
+	*num_input_fmts = i;
+
 	return input_fmts;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
