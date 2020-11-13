Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFB2B3B15
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B277B89F49;
	Mon, 16 Nov 2020 01:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1813 seconds by postgrey-1.36 at gabe;
 Fri, 13 Nov 2020 10:17:24 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC70F6E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:17:24 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD9irPw031412; Fri, 13 Nov 2020 01:46:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=dvy7oOeWTApdmN31Sh7i8eEvCwPGKvOEGV8qKKbDcAM=;
 b=cKqwHK3Fvi/DlZbWahOGzaZAD5DdgE5DwzdEEdQESRFmMJaq3jUDE4pp7S6vYWx5UULt
 HUvKSdadUnayxITUL4bXuwgeqwYYJM0ZAtQRv5cYzUUV5SQWKJkRNUgPmx25veBSBb3v
 4M9zCfTkFNg0b6mTiH0nAyAqU9uPTu+fR4M4n4PY+Ec5G2joMbM15dds2If8FcG4YFsT
 HJdUB7qt7akkQ442jB2IH+YSz6FtdMFPjeXKYam5dobG5XYFHnfeM+ADZFVmI4Um2yTa
 VFFoPdyOXqCt7H3AqlGqo1Yo2ch5MvfG/IzxnPoMfmitmz4RUJhvlT/+VJsGxjzPp6Cp dQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0b-0014ca01.pphosted.com with ESMTP id 34nr239ehd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 01:46:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D11OTKXJZLdV/clkhxHR3pIgh40p6k+U3NecMlETFJMGi/jbaiCDoUJBrzCwk4Yz7fk/s0y43xw5VDS9gGvCg7zZFTYk7EgX+INBlKFh+A5wCRbssPScTmHYmpEpAki974FlEduM3XsreYKxPWPest6tgW6BKto5yXPecf1oAOlntp2ouENDiZE+AVcgXMbe+pC7NdmJOf1g5DynL7xWPdm5+UJrzikrjqrXausROdYZmynG4z2ITJwJBEttJU50mB+792qK2PnDR+Hp7Riaywxtf8gNqDNmd3d9TPjeaKu0Yj4w+njPCBpPhSJSOOnKJCXnApgcNnsMJdKut7/35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvy7oOeWTApdmN31Sh7i8eEvCwPGKvOEGV8qKKbDcAM=;
 b=cV3DmIwIM73rBi6H2F3TXHHs54M7ukFkQ1FRYNH7GkVs4pEwGbrAHfz8Z2mcrcM/LAz1/ckP3UcQ3SNBJR+8zqXI0ZAhkNyayZipYa8raUA5e/RmA0vgI7mmfC9zZc/aQHi/nuzFadb4Uf7vC2kwiZjsm5DfqT6E6K5JqMqkQgHrAx5SF/iB4eVYlXlaorYUF/HGkTdsXJgtuFUX3KrGJq98fYf4pXqrEDBm/VKukcvBp0qr8OUnCROg7VUkFbxfMqzxxXDOMkjOaz2xO3TMYQeJ1xpfjZ0b1rO7iWcWllD+56AjFbbDSy2Q0HYxJNt7AbKonFiuV8hmRxjDlZRC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvy7oOeWTApdmN31Sh7i8eEvCwPGKvOEGV8qKKbDcAM=;
 b=PnM5vrilJBz1kzUeLQ8jok1c8Zmnsv8VY+ZQlzGb8kBv6OTmL0DKt9MnIbxIVcARWUbG99MtlbZRM8vOvqpBNtYRkEJ6Wg2kb6G0fdeum7x5MrOOW1KXQ+vQFwm4C/TqIOHqOtm/uqZ8Lu+24xvPbKS+uK5cXtq8hQayqR0S5sQ=
Received: from DM6PR17CA0001.namprd17.prod.outlook.com (2603:10b6:5:1b3::14)
 by CY4PR07MB3590.namprd07.prod.outlook.com (2603:10b6:910:7b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 09:46:51 +0000
Received: from DM6NAM12FT057.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::54) by DM6PR17CA0001.outlook.office365.com
 (2603:10b6:5:1b3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 09:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT057.mail.protection.outlook.com (10.13.178.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.11 via Frontend Transport; Fri, 13 Nov 2020 09:46:51 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AD9kgJJ009933
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 13 Nov 2020 04:46:50 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 13 Nov 2020 10:46:42 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 13 Nov 2020 10:46:42 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AD9kfw4029856;
 Fri, 13 Nov 2020 10:46:41 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AD9kf0t029855;
 Fri, 13 Nov 2020 10:46:41 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v1 2/4] drm: bridge: cdns-mhdp8546: Modify
 atomic_get_input_bus_format bridge function
Date: Fri, 13 Nov 2020 10:46:32 +0100
Message-ID: <1605260794-29806-3-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
References: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea250c4-3c31-4bed-e7c1-08d887b90c41
X-MS-TrafficTypeDiagnostic: CY4PR07MB3590:
X-Microsoft-Antispam-PRVS: <CY4PR07MB35902CCEB2AC3C1EF46EFC3CD2E60@CY4PR07MB3590.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ECytX1fRzW4qyjoVPgGXJ7J1KqV4INdzDJz7iCu/c73A5JgSvaASIILtvDXIzpApNo9xgOybXvNGnkZFx2SUzdLEiPvVLqbqVA7Xy8SCmgLz3yv64CdoYNvjXQjw9ztPOSjnD2J+y931rcLn6rMYDRgejAakXjB0ZL1uqmlsrHYeYTmKKwvUdaEFKDthxsHYGVxwpqwHTpCtzEFffWY0IgMljNT8d/ZXxLQ6FgPA74zO+w0h6YQH/6PrNBfZHj+UOrhuug3JQpba/r6oBp40f5pJXBSse2no3WsZzDjRlbBDLickAzigKj0OjhdOVhU6f6QvCpu8JISorpUepW+z7b5dCiNqxKoOReX0Xsy7bGYgOJ4yxU9MuNO+56BkuDr2SORswrKmq67BNW6uLg/Lye2zQOvxSQxUCD1dq2CIrF6/tnZNKDR7OO+9qd33CD91D3U0Vhc350/AQZKOdwBSC5yDFRcsG9UEiBMCgYWQrc=
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(36092001)(46966005)(4326008)(36756003)(83380400001)(6666004)(8676002)(7416002)(82310400003)(2906002)(5660300002)(86362001)(478600001)(336012)(356005)(426003)(42186006)(186003)(70586007)(70206006)(81166007)(26005)(54906003)(316002)(2616005)(36906005)(47076004)(82740400003)(110136005)(107886003)(921005)(8936002)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 09:46:51.6271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea250c4-3c31-4bed-e7c1-08d887b90c41
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT057.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3590
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_07:2020-11-12,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011130058
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
based on the output format instead of using hardcoded value.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 110 ++++++++++++++++--
 1 file changed, 100 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index bdb0d95aa412..623eadb8948f 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2078,27 +2078,117 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
 	return &cdns_mhdp_state->base;
 }
 
+static const u32 cdns_mhdp_bus_fmts[] = {
+	MEDIA_BUS_FMT_YUV16_1X48,
+	MEDIA_BUS_FMT_RGB161616_1X48,
+	MEDIA_BUS_FMT_UYVY12_1X24,
+	MEDIA_BUS_FMT_YUV12_1X36,
+	MEDIA_BUS_FMT_RGB121212_1X36,
+	MEDIA_BUS_FMT_UYVY10_1X20,
+	MEDIA_BUS_FMT_YUV10_1X30,
+	MEDIA_BUS_FMT_RGB101010_1X30,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_RGB888_1X24
+};
+
+static bool cdns_mhdp_format_supported(u32 output_fmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cdns_mhdp_bus_fmts); i++) {
+		if (output_fmt == cdns_mhdp_bus_fmts[i])
+			return true;
+	}
+
+	return false;
+}
+
+#define MAX_INPUT_FORMAT 4
+
 static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
-				      struct drm_bridge_state *bridge_state,
-				      struct drm_crtc_state *crtc_state,
-				      struct drm_connector_state *conn_state,
-				      u32 output_fmt,
-				      unsigned int *num_input_fmts)
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 u32 output_fmt,
+					 unsigned int *num_input_fmts)
 {
 	u32 *input_fmts;
-	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
+	unsigned int i = 0;
 
 	*num_input_fmts = 0;
 
-	if (output_fmt != MEDIA_BUS_FMT_FIXED)
+	if (!cdns_mhdp_format_supported(output_fmt) &&
+	    output_fmt != MEDIA_BUS_FMT_FIXED)
 		return NULL;
 
-	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	input_fmts = kcalloc(MAX_INPUT_FORMAT,
+			     sizeof(*input_fmts), GFP_KERNEL);
 	if (!input_fmts)
 		return NULL;
 
-	*num_input_fmts = 1;
-	input_fmts[0] = default_bus_format;
+	switch (output_fmt) {
+	/* RGB */
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+
+	/* YUV444 */
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		break;
+	case MEDIA_BUS_FMT_YUV12_1X36:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		break;
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		break;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		break;
+
+	/* YUV422 */
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		break;
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		break;
+
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		break;
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
