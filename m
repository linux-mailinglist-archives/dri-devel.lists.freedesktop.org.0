Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D62B3B09
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EC189DB7;
	Mon, 16 Nov 2020 01:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1446E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:09:13 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD9SA9x004370; Fri, 13 Nov 2020 01:46:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=x73cj+PJZTn1c7M9ZT5330vfh62+VjQbve88qauoaFM=;
 b=YZhJHijum7CbbUujDODlBIsEPbPAqF/d5sT2rbmw64A6yySFXLcWfjvmV35stNEkDOxT
 92BLmgTNI62DMpX3xOJEcZp5NEiUJ+d4eee+3yeozWgRWZu66xfA+IIgJiPwJVca5nDC
 x/IKutBBMM2xv9LOWk8I+JSHX0ChdbcEAnv4/NgFqzJgbEsFSTBwEgwupMjaT12DSIL9
 Z/snnX8xWGK6pk2RiK2hZZZY/xFVTBXOt+7rtRibi0kFnE0yv2xv9ddFO3dQaqogMp/5
 O2ZFG+JBxVn/7E8zdJ8V+diCDfRuQv+kgTRjjVb7MeLJJkQQ+OiC5s8YorrkOSg40uE1 XQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by mx0a-0014ca01.pphosted.com with ESMTP id 34ns14rw42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 01:46:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flB2eNRi5thqVOEWpj0PwkhXUCcXIdwsZ07uRRUgerXUm4Y0DA1BYd3T2ADENuQN7Hs/EbvhrvyZbX+gszqcF/Ro1cvupWatFsAxFMm6NeSZn20aNUy+rXaDezWHJLaHyueYuNWF8l1K+zik00cCz6rPL4KWfJu65fPon8rGRdapt1+wc5I1zFXW9gfINe9ryGGG1EskjNqCzsXF8dVYPdyPPz10YyvNWtaPP0h2Nlc2ftNJ0HicpepDPcIMva4VQ/pksF7upDKxzfruXQ2+2eSzORv6Fs9Q+ACFeJqeWCY2LUtr764S8nNuEpTDTOOCrOA08Z9dJiMj68SFjIppoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x73cj+PJZTn1c7M9ZT5330vfh62+VjQbve88qauoaFM=;
 b=K4YtBJkUzC8MWpB0pU7/ldp4hvO/Yb/Z10LIWKFAeSlldHZBsDZqSRFCkMbMXeTWDKJiiIie2kArFtiU4UABpDndBghZQxD3GQfkbgCOWrKr0qMBSVcRzUScUk27+iOmNvwEVvF6uHpv/njU8GgK43kWDTjMHYXU7qQMi8882CNA+0+aao+YWg0eJajKIc2z1KWg1sQeTRdWxtzGGCypkld8zt2SOM0Rm27s0NHw6ZKf4ytxG4GpCSXqzI/cS8gxoSWkd26PZHtS9Kb4G39+zTyG5nxDwodAvrftv21142sm8CqUaMc0YBBvRMI2J7R34vByE3vIgSwi7CixFwSDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x73cj+PJZTn1c7M9ZT5330vfh62+VjQbve88qauoaFM=;
 b=tfs4HStpxQOj7i5MbWMiQWfqg2iSomILUyzyRfYgCWfMSDCt2JBdk+rwJ9n7TDmK30LdipfNji/D0p8ovLVH1e/GLdAYZYdTCF8WApBoom1HTdKymVLIOGcpv3TiZ29EXPFCORup6KQDYamb0QRFkixzSRpL8HMMByuhv4HWI84=
Received: from DM6PR06CA0090.namprd06.prod.outlook.com (2603:10b6:5:336::23)
 by DM6PR07MB8026.namprd07.prod.outlook.com (2603:10b6:5:32::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Fri, 13 Nov
 2020 09:46:53 +0000
Received: from DM6NAM12FT005.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::1f) by DM6PR06CA0090.outlook.office365.com
 (2603:10b6:5:336::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 09:46:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT005.mail.protection.outlook.com (10.13.178.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.12 via Frontend Transport; Fri, 13 Nov 2020 09:46:52 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AD9kgJL009933
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 13 Nov 2020 04:46:51 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 13 Nov 2020 10:46:42 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 13 Nov 2020 10:46:42 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AD9kgqt029864;
 Fri, 13 Nov 2020 10:46:42 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AD9kgx8029863;
 Fri, 13 Nov 2020 10:46:42 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v1 4/4] drm: bridge: cdns-mhdp8546: Retrieve the pixel format
 and bpc based on bus format
Date: Fri, 13 Nov 2020 10:46:34 +0100
Message-ID: <1605260794-29806-5-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
References: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be7c91f0-4579-4f4f-a240-08d887b90ce8
X-MS-TrafficTypeDiagnostic: DM6PR07MB8026:
X-Microsoft-Antispam-PRVS: <DM6PR07MB8026F1E5BA7E14657F7886F7D2E60@DM6PR07MB8026.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdZDj0y9TWSqVKIrafR5pjiqvs0S6x3QDcPru8uTblUg5NkU4yU2eRPzlH0eBo6+9YXDujP4Hoa3lPWwT7DO+dMzeF+brkYmdW77z/F2MYex0od32lDNIWJwPIiwxRWYALJnAJy3FQUrkUTFMgqeMBGMSIduUQ/b2URSfZz0X+IeF4mcZwH8W/uQeSKZralbbUBKrURYJtVq9QdeG9xeoYvf9zE9Zpknrzh3YEonwxxljeT5UadqsTnS849CS1pwvaXlEUuMj52JG80xazoC1dvVyy8nZfNjLGmr/IBEIS00ae4vVhM3/RE/DEo9bYDb8h8yf2zu93c/67OaXVR/89ajTabpPuA2SPwQf9cLhZdDDEmFNQvjJZDFKUSFYup5sR5vRCrOJLH7YQdbdObqSElIETrCfNR8E2rV16+UNFrYJVxaYRMS96INnYaaBtnwT1y6lOHmTFGnaCLPrJ4oHlsDdoGtK2VYuIAUiuQqqneCyqnJc7lC2ogvMHEymfws2LF7OVzSQmSgp/FUL68YwQ==
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36092001)(46966005)(36756003)(356005)(26005)(36906005)(81166007)(70206006)(82310400003)(7416002)(86362001)(42186006)(2906002)(6666004)(70586007)(316002)(478600001)(83380400001)(110136005)(8936002)(54906003)(82740400003)(426003)(5660300002)(2616005)(8676002)(4326008)(336012)(186003)(107886003)(47076004)(921005)(83996005)(2101003)(358055004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 09:46:52.7197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7c91f0-4579-4f4f-a240-08d887b90ce8
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT005.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB8026
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_07:2020-11-12,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130057
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

Get the pixel format and bpc based on the output bus format
negotiated instead of hardcoding the values.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 82 +++++++++++++++----
 1 file changed, 64 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 6f900bceb50c..44d79b0bd6d2 100644
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
@@ -2211,6 +2255,8 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
+	cdns_mhdp_get_display_fmt(mhdp, bridge_state);
+
 	mutex_lock(&mhdp->link_mutex);
 
 	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
@@ -2539,7 +2585,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
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
