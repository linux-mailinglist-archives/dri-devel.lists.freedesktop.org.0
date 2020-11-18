Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EEE2B8D1E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A7B6E511;
	Thu, 19 Nov 2020 08:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D186E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 14:03:59 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AIE0pVX027578; Wed, 18 Nov 2020 06:03:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=HGkZyTQN5KO5I+ROK7uE63kLANw1VTA2FCtBxKornvQ=;
 b=sKfJOU42KL54ITfQzXGpzgFaUtaoWEj6oU68U1Jd8iLau8JJXdKM92Fd92eN6FvUCAXX
 u8qG1jHkmtsI1I/K1VMRjzhZ5nCLc1nYi1lbBTalR6YpxZsGJV5xxvZucQdalrCeRvHD
 NNxq5nDrsYEHUva//HNPLyH6SqFxTSX/P5pjM5wcQdFFrRCrFmfziaYAfSIHneuav5D8
 qgZy+7QVIYPaN6mdu185s+jcJ8hhSyCjWGk+shuqkqYSfLbQAiNhfHsy0r7esovK6Iwb
 g9tBd5cAcLDcy1hBZ8zIeb08kFg7jIHLFEWhh3GxSv2RbznSijOGxjEutHclczj3t4XL MA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by mx0b-0014ca01.pphosted.com with ESMTP id 34tbq2yv9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 06:03:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAogeLdKaRj1uhebhqKluNJZRnz0YHCBqCitAPuOVqfoG4GexWnl6Uvzm33ymg9/46brU5oAAo5sU6ZA0yZrxu3MXtDkJI57LmtmIwgqMTc1GrUXJ1Yoo7OyyXLWnL0jWuQ5PV33HN5IQuV3zVOIlAj116wnoO9+G8YLFxvXrcu60f8DQ69vyGRwKDynt5+ElE3B+uMkaVGoEag3EGb5Wn0hK+XYTyraOnfoWcdXBaST0VlIfcUyDYpzpdoKuAf3rbgtRtCWtkIikOQ5yuBAfG/QJ05cB6GwZwe1NTX/cOMUVpTTYOSEKY0WXgmjRyI53Yj4YbofV9ss7AhTGR+tJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGkZyTQN5KO5I+ROK7uE63kLANw1VTA2FCtBxKornvQ=;
 b=f4jCWRf6mcux+4TFZZzEqr95G16QOUlClwLrvYL0SFaahrbymWoB+uXAYNqsjGSCWzQxqJKqwLCeq3jS3mgxwSU+dG2Y62YxyX+RKtVECOwBBMkwj1Zb0mBJh85sjN6EYp1YYL2erQ8bptZVLcRlpBBiaZiHhgumPAwOu95elaYrC6vvLkzI0lbreTc8YHcuYF8El8bLFIa4TNgCmqDRUYBhpmYngPzo4H67CLWB8KfmivyWWPZaC6jlXPm2I3Q6CA3YddEo5eeTynzAVqZOXyHzO70kWQlzDMrPx4LCLvk/OkKUk0+rWWzPNHgF36fOfeaVVYwmTm5a4piXVZjBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGkZyTQN5KO5I+ROK7uE63kLANw1VTA2FCtBxKornvQ=;
 b=Y0Bf/MVCY208SZviXvIL+Q8oCcnKDreoulDVDEIM09uWhIu04g6BT2yzMwXhwe7HGlWMMs5PuAbHMo56TOdIF0O1OB/1s5shLj2U5TJh/ngF7iLkux156kb9fZ6if6Nu3S6pO0QwmZHCvSrKwCHAbSk+RRiEgmynk90cPafmI/Q=
Received: from CO2PR18CA0065.namprd18.prod.outlook.com (2603:10b6:104:2::33)
 by BY5PR07MB7187.namprd07.prod.outlook.com (2603:10b6:a03:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 14:03:46 +0000
Received: from MW2NAM12FT008.eop-nam12.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::1a) by CO2PR18CA0065.outlook.office365.com
 (2603:10b6:104:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 MW2NAM12FT008.mail.protection.outlook.com (10.13.180.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.12 via Frontend Transport; Wed, 18 Nov 2020 14:03:46 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AIE3dUr007561
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
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AIE3cWF003747;
 Wed, 18 Nov 2020 15:03:38 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AIE3c0K003746;
 Wed, 18 Nov 2020 15:03:38 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v2 2/3] drm: bridge: cdns-mhdp8546: Remove setting of bus
 format using connector info
Date: Wed, 18 Nov 2020 15:03:27 +0100
Message-ID: <1605708208-3692-3-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1605708208-3692-1-git-send-email-yamonkar@cadence.com>
References: <1605708208-3692-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00dcb229-203a-45fe-6328-08d88bcac406
X-MS-TrafficTypeDiagnostic: BY5PR07MB7187:
X-Microsoft-Antispam-PRVS: <BY5PR07MB71876FB17DBFB3A9EDAF302DD2E10@BY5PR07MB7187.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lKOEZY6JYpjJY36Ij5tHZ76ZS5iNbohFpMH9gbN0RAwEL97p9fOC8XyNu5emgzC7MCeiXh7xgJoZgR7JdUMT+O/iZTlYjuVPc/U5j+pAeRm6isjn+TYyL+RujxspSZfFE8gBh2VoP3A16MQ6BV5rDOKN0ILM4fVAbz3z73pPngE9Qr2K6V0R8zZbRlryROCkv9zLXIyBfBv0PEfJlA0Tfw9w+5RUb3/R5La/+xZ4N4sUuspZehTAYYFewrZ+kxAQfhQpMg0sYXlcXcyysegHzjhNnJQ64Zd0O5S2HOTo65Bb55k8ydfGAJr4E1SEWL4Aax+AJ68KwdFDw3hMbGT/w7CanHqTxQJYSousCWgTmqXzrqBXACg3BaWtJztQiwqjZkdazRzsI7tfzzWK/ObLWWV1ceHh4bf2GBz1NsIVWL/qP+nbym8jWSzP0EdoXq4XwYa1hUkcjkRiejNIqn4CDWmIB0Vo7K53vfP+3XK1nT4=
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36092001)(46966005)(107886003)(83380400001)(82310400003)(4326008)(47076004)(8676002)(110136005)(26005)(426003)(2616005)(921005)(336012)(356005)(86362001)(7636003)(36756003)(8936002)(6666004)(5660300002)(186003)(82740400003)(2906002)(478600001)(70206006)(42186006)(316002)(70586007)(36906005)(54906003)(7416002)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 14:03:46.0713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dcb229-203a-45fe-6328-08d88bcac406
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT008.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB7187
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

As we are using bus negotiations for selecting bus format
remove the setting of bus format using the connector info
structure.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 7c80555ab4ab..d5e94bd74df1 100644
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
