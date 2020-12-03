Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614222CE9DB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F6F6EC7D;
	Fri,  4 Dec 2020 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAEF6EB79
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:03:39 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B3E0joN031452; Thu, 3 Dec 2020 06:03:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=buYtU5jcisfDtmYDGcAm9iGBYG25F+WgL38x6RHz/xg=;
 b=RyaIr6HMhpO0DGhZE91YElZJSveUX1y0CcSE553KHQ9q77ROPyvVBzp8NSaI2oSyGHbG
 0K7uT9XzT63Eg+2jbaHE9aOqR3eX4lMSBRj7cBZAnfLGhbuU0OI2IO2gDzOJZurd3Ifs
 ZdNOYdyA0XVJVV5mdIH2qm/LA2DOWGEjZYDfU0P77xhAwoCPsdHBB4/ElzhG1czTtFTa
 XmXueGtuYhXOUEQ+WXf1GAOa2oBNuNuAWb4EqV5wfINAA4aarnrQqUJQL5O44JU1lcCH
 gKJy5RMoBcKzLBkEdPRK8VdanknfjkUD1R7aDDOL+waymqjBn8TW9gKTXf1nBH7cqihf 9Q== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by mx0b-0014ca01.pphosted.com with ESMTP id 355vn6f66e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 06:03:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBpufUhZp2s9CpXfcixlpkkPVy2K2jOA6OZg9aO9BGItTJlaRtzhR4KofSUT8AKLNbjP7aXFMDMUYuUNXTwHfA99zNPs/yzpGI3XAw++3RFeU8WL7Mx9exnErqBBqAobHf3YZ8zQ7LKnCWuGrpR0tfalQzNAqJ1Y7ndsVa2AcCvCX2X9/GAwcS12adisyjfqwRmivBNhbc+se6FWU8dREMNgdw+63e4Kmvrafga50p09tNLwCDlQ5j4s21xDCUrxcqh4+zOfAxvIa0HtcuG/Ifpecof7UD37Xz6wfXp7kUzLFzP9paE81cDVH9Ec+Rv8bnxRr15fBV4dZd1nG1e0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buYtU5jcisfDtmYDGcAm9iGBYG25F+WgL38x6RHz/xg=;
 b=QJ1MW9pv+v2moTvkEtl2BmrHVG5eQ+N2ClfqVFNEkSAtSnh4kDkpd6i+t13DRjacuVbYOS8ZFkJK1cfsv+gjsFRZbhwAAwFFXCJinPjSFNdutO0YW0lr5tjq34xmEvh5hfsNVo6fEpIbBzPEe1Yqwir+Bix6pOsP7+y1SvB0Vsf1zunR//2NRo5Vyg2QmppZ983Lh6TDxaEYSH3wX+aYlVBcp8zoAoqikH4A7kv2/VYQBzcLNudW+igWCboKyc0mUjFeMG0QDlYpNsh89OmYumo6n3Urds7ouFjKA02jIRet7A4ipZErCoPK8WEc8GUUfjVkEfHcy39H9cmRaZJxLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buYtU5jcisfDtmYDGcAm9iGBYG25F+WgL38x6RHz/xg=;
 b=7oVvzMAQzw+gHIPG8hGF8GK+NGsPTDlFFAZ4Cn7tasNU+KYZZbtT68BIftcnUrHJDTCCs+0lCv3koISyhFIRJrOJcE7pAP2Kp4/kHP/BfTFFZXDdLBDwGQh2FOoqtqm8V46Bo6HiAmtoRI9kb1QsMC4Qxl2yAwc1+yyW2MjVvns=
Received: from BN8PR15CA0014.namprd15.prod.outlook.com (2603:10b6:408:c0::27)
 by DM6PR07MB6476.namprd07.prod.outlook.com (2603:10b6:5:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 14:03:22 +0000
Received: from BN8NAM12FT040.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::e7) by BN8PR15CA0014.outlook.office365.com
 (2603:10b6:408:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 14:03:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT040.mail.protection.outlook.com (10.13.182.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Thu, 3 Dec 2020 14:03:22 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0B3E3FRJ020918
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 3 Dec 2020 09:03:17 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 3 Dec 2020 15:03:14 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 3 Dec 2020 15:03:14 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0B3E3E27022341;
 Thu, 3 Dec 2020 15:03:14 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0B3E3ECU022340;
 Thu, 3 Dec 2020 15:03:14 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v3 1/3] drm: bridge: cdns-mhdp8546: Modify
 atomic_get_input_bus_format bridge function
Date: Thu, 3 Dec 2020 15:03:09 +0100
Message-ID: <1607004191-22294-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1607004191-22294-1-git-send-email-yamonkar@cadence.com>
References: <1607004191-22294-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b3ee1fd-b965-4e89-866c-08d8979431e6
X-MS-TrafficTypeDiagnostic: DM6PR07MB6476:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6476643ABEF1D6549D761C39D2F20@DM6PR07MB6476.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewx51zdaieraCkE7sfktrHARvx0O0jknpVdNoCrUXdMj/jrP3oM2MzcT2UtI16klgs2mUB6edJgSad4FO95/xVAhkbpqdoHvceVn49QdvZLpkFzcQJZZr47GD4N2iwy5T2olhyz1HHpNMYGM/be2H8+9kI2nnNTz8A9Vf5mkIQPSeY9XFllfS1DHlfZOian6Nv7iM2xbpNqaK8v3BR4/NUJ5I/Kjeo5WuJEOSbjqlyK+FobSds8FEUbLeooZzFgzrAksOE0FD4pRhOLH4i0/aHBfPI3S3t/WwUopVQb2yw+tWWWUK+h06/+6FqE648mgHcEKmIlFdNryx8mOUG0kpixrOH0dRYwsGZr6aHg6uOvLCRPQm7znEqZFirrzDctb8SL3PaOmgJHaKS773cg3G8KX5dMdTImEV1FecQ4W7z6WiIQuLMmTYVg5FezqEGUUhdWfy8YJ2zsXtxiWL+pwmU2W3m9Coyk995AG+RtKksk=
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(36092001)(46966005)(107886003)(186003)(5660300002)(82310400003)(426003)(54906003)(356005)(7416002)(36756003)(26005)(6666004)(2616005)(110136005)(42186006)(316002)(36906005)(47076004)(81166007)(86362001)(478600001)(336012)(70586007)(70206006)(921005)(82740400003)(83380400001)(4326008)(8676002)(8936002)(2906002)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 14:03:22.0760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3ee1fd-b965-4e89-866c-08d8979431e6
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT040.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6476
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_07:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030085
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

Modify atomic_get_input_bus_format function to return input formats
supported instead of using hardcoded value.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 83 +++++++++++++++++--
 1 file changed, 74 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d0ed950f4f87..5ef6adb8bc82 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2095,27 +2095,92 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
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
 	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
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
+	input_fmts[i++] = default_bus_format;
+
+	if (info->color_formats & DRM_COLOR_FORMAT_RGB444) {
+		if (info->bpc == 16) {
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+
+		if (info->bpc == 12) {
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+
+		if (info->bpc == 10) {
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
+		if (info->bpc == 16) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		}
+
+		if (info->bpc == 12) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		}
+
+		if (info->bpc == 10) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		}
+
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422) {
+		if (info->bpc == 12) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		}
+
+		if (info->bpc == 10) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		}
+
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
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
