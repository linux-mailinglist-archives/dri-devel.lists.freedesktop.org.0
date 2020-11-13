Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664282B3AE4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947FA89CD4;
	Mon, 16 Nov 2020 01:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 968 seconds by postgrey-1.36 at gabe;
 Fri, 13 Nov 2020 10:03:19 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209036E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:03:18 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD9S7fj004361; Fri, 13 Nov 2020 01:47:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=K5YdFzL3jBwa64lMAo2QG6JDhtMFtn94mU111VTp6uc=;
 b=tyzMcckq3TwpnYpclQA7aEsZWO07HqYV3u1MtKpQakkHGCvg0/4r7GgH5594SwWT1CWW
 iR8f5ux1iC165YVx6n5S0bDZ90/pnkazNrX/k8TLFSSSIOU8IRc2x4KfYiZ1bRPonnsE
 ygyHGS3NELg5H8CjGINNVxTitGeKCW3kGeOFSKqt4OuFOKqW0wPEzM7+n3jOkvM28XAe
 jNybHtnhjEKR4QcLMO0ZfnJ3fENi1cfcC5cb1Sk1xrKawaioIgEW31ahMuh7F4puyZMc
 JUtfydJP7B0+C/Ku6SwmuSU6vVIYx097C6qLBXBOK0F1ZyjDCnRux1zwVyXspXU2KS7M sA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by mx0a-0014ca01.pphosted.com with ESMTP id 34ns14rw46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 01:47:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCOnpeB+KvBctcTyfViHaUgQ3E5IHOkiPLuQQdCg8xtbQn6lck65WYtuLyvYU/Qa7BSSv1U7i3O65kpThYk0FLNBd77LB3E6sGik+nU8ZFNLnZDT1T03X7pbYteinFwloUzfTTE3PpMAimmL9jamGqshjny3bPMksWxRt2n7HGgCCcZT4+bvajObf5NEeIxSUuk33MY2UagX0EjI/IgzyNdqwNlzM07KJkPwwE6UmAJp+FQwRYoiG3Pv6FJ5WSPBmDldmGTOOhtlZJFI4Pb9VO65soWszT7fTwmslJe/TIxP31+nwokpTv8UorIpFH0Qw+aS0+xy7D7M3hCMafIvpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5YdFzL3jBwa64lMAo2QG6JDhtMFtn94mU111VTp6uc=;
 b=dhTwDIy3yRcd9sxRSr0xmzmEpnAfLSstRTVOf1C2oIzDinz6PX76Aji/Kx978bG7BLJPu6OIDGIy0AUt0SAR7y5YuFQJEAe9vafgaT5tGR1WDyyntClKINwvqcsgsQNAjPxVFdKSqx6G43Ib3u31fN9JGlD78xZFeB99NPAjJsUo2jUOPh2rugje63tIXNwY9HQwUKPVsogKWv5VydueKJhNNarv4z56Dcp5B4zU/lvfU4hkYMzFshCiQBxoHFbKtvM9hJLBIPC5lwdLlVLP/23xPncb1++TGbJ1oZliTKb8dJ5zYNl7WtNynZTIK3yPU9OaUS6LyYArYlGxEw09KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5YdFzL3jBwa64lMAo2QG6JDhtMFtn94mU111VTp6uc=;
 b=w8SHzgtWVLMr7G8h4vTI91TnLgFxO9eNolpCxHUFVfaWj6uXUBCti+DQrgX1GU8n/px8+XtTpzbXFGMDTxAMGgnxCycQD06BVFYGj+BkwpeXohEmTeb9M90b4FU+4bioHlui0EwHUVrwi3zeXVvTQQZhuUjaKFERUihGjFp0tyc=
Received: from MWHPR11CA0012.namprd11.prod.outlook.com (2603:10b6:301:1::22)
 by DM5PR07MB3468.namprd07.prod.outlook.com (2603:10b6:4:67::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 09:46:53 +0000
Received: from MW2NAM12FT035.eop-nam12.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::b5) by MWHPR11CA0012.outlook.office365.com
 (2603:10b6:301:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25 via Frontend
 Transport; Fri, 13 Nov 2020 09:46:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 MW2NAM12FT035.mail.protection.outlook.com (10.13.181.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.11 via Frontend Transport; Fri, 13 Nov 2020 09:46:52 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AD9kgJK009933
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
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AD9kgLs029860;
 Fri, 13 Nov 2020 10:46:42 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AD9kgSt029859;
 Fri, 13 Nov 2020 10:46:42 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v1 3/4] drm: bridge: cdns-mhdp8546: Remove setting of bus
 format using connector info
Date: Fri, 13 Nov 2020 10:46:33 +0100
Message-ID: <1605260794-29806-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
References: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95266503-a0c9-46e8-35bc-08d887b90cb7
X-MS-TrafficTypeDiagnostic: DM5PR07MB3468:
X-Microsoft-Antispam-PRVS: <DM5PR07MB346899259BBB948257EE3FFDD2E60@DM5PR07MB3468.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CoS7yYk6d6yg2mxpFt2fPAZXaTfh8vi2ydw+YyD0D3/j5xykm9sKmWbofk5kTy1yIVL9wL+WtzCCbZ26gqnLWPP3oDOdR0f/z9HxtvmRpQ/VDWad2cByctn7Vi9wiFun33Pc2ZBtGOA/pBQUNuffi2ivw2kSok7q/cPuWv4GAGGP+GeLHEiM8s3ofXIbiu3GmGp2CImjtHQ989ZTONkVwh8rcpLhEGoH0+ifueRCJuVzgzMz+X9t9qcGWpnpBIo6c5iNm6y/nDpBvkPrR2XTFJnaa0ayYr25j2K3+EM3QGXzB72/6MiBtVKIMO1F5kJyoA8ZsKmopVOQK3GLCTNYLxc7hlTImVvqxOMG/ABp0vU6L3GpEGhWShlwNO+Vra6TqiGadUxaJ66y8ubPu8wyRXHNmB+dwfFRa1+Ua4zLmSxI4uza7EhI1utrSsm7ivr5iCfHATYXkBe2QpqRzWiYJ1XoJE6SHZi99Yr5n+/5ua4=
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(36092001)(46966005)(6666004)(4326008)(86362001)(316002)(426003)(356005)(81166007)(83380400001)(5660300002)(2616005)(36756003)(478600001)(2906002)(54906003)(47076004)(7416002)(110136005)(336012)(82740400003)(70586007)(107886003)(186003)(82310400003)(36906005)(8676002)(26005)(42186006)(8936002)(70206006)(921005)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 09:46:52.3449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95266503-a0c9-46e8-35bc-08d887b90cb7
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT035.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3468
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

As we are using bus negotiations for selecting bus format
remove the setting of bus format using the connector info
structure.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 623eadb8948f..6f900bceb50c 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1630,7 +1630,6 @@ static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
 
 static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 {
-	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
 	struct drm_connector *conn = &mhdp->connector;
 	struct drm_bridge *bridge = &mhdp->bridge;
 	int ret;
@@ -1651,11 +1650,6 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 
 	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
 
-	ret = drm_display_info_set_bus_formats(&conn->display_info,
-					       &bus_format, 1);
-	if (ret)
-		return ret;
-
 	ret = drm_connector_attach_encoder(conn, bridge->encoder);
 	if (ret) {
 		dev_err(mhdp->dev, "Failed to attach connector to encoder\n");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
