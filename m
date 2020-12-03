Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2A2CE9C0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5256D6EC6F;
	Fri,  4 Dec 2020 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AA86EB79
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:03:41 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B3DwWIk003669; Thu, 3 Dec 2020 06:03:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=DFD2mXuKBLfiv0NH3LXJphzI1/8xr9KjpK3+eGBRbLQ=;
 b=tBy3J1zx1gFv4t2Mq+2+TxYnzZKiAusmAKL1OMJxCBe1c3FbdXuS+jYJHHpU2S/IE7nJ
 8rA/cqlfZsiLnCyMEn0Gq5TOPo+41w9cm0e3ukBS4GwQLL3njMSyOBFDkhLUra8q5VuY
 P65U09o2e8TOZYYP7fgRKAsUvLFwir50iFFJbF6V9xTUcApV5SiM9wDcP+K2hyOd1aWb
 0W2LHYhLFdmlEwmARiM+h9/3MhrGjMJEdLPDPcDyg7Zs0dkQwGteIn5yDZ+VyNG7t+bV
 g4hykPg6Ih90aSsJJbEMYmF2xLJSjPUZ5A9iMt2Xw2rrWJII1y6HqfbDsNl5AdDoQkmm IA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0a-0014ca01.pphosted.com with ESMTP id 355vn4pv1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 06:03:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZqQ+LiOk7QadBMyMPbu10y9C7cUbKGUDDs90nPlDla3bWZBaHNILF3j0KpwezJLYdRl9TucWkoHnSThEW1S2QT0qOY5AIPqMrPLt/mhQC0LLr9VWzglhuvhZMsRc+L6Vzf0iR7he6QeD+X6/RwIrLChWwf54hiK8a/zyKTd8b/ksWXHtc3RGwmnAS9iobhsnGwqehaNQ1IIjZrRyj8gKn5rH0Q/f4rrl7hRBi5jgUoyzrX6V3ClS9Ev6UvOhyp9WxsEbAJyzkMXSC7jSud5yCp4uvSt2RO5TflKpJVlUpgDwAxRvzfOqg+WfIposSXaR/FFai71LUv8q7H9mKvbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFD2mXuKBLfiv0NH3LXJphzI1/8xr9KjpK3+eGBRbLQ=;
 b=eZc6GWqiicAlpsL4G+5MuvoWtGr9B2/+BIfQE2t7/4Bq1pXGb4Ved5mVlHtM8AHE428l6/PmglLVVvFHNPS4/hgcHWLjeLiAbDwKTyurjvF1WWqtDcBmQl+70KKngZFUYVM66IlVNO0UqLvTfK8L1G6LN6fpiv7K9XDCPhmzHbLyPSovfAo2R1H9SKTcXFzoW8PykOxioTQXvr/SPoucyMXD2Rp9If9csotMnAAHuNWvd00hdh4GcCUH9QMCsCwdmUCYwVD3EtahInOqcqLoxXPZ3DgPX98wPJjYIWtseVYAJHffdsQUawiqV8kyEojRch/yWBGOnSW/LdInWN/W/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFD2mXuKBLfiv0NH3LXJphzI1/8xr9KjpK3+eGBRbLQ=;
 b=RwkZHAeEVeluYFYz9aAJktnWdFcaB/04N7JAgyafLeZf/y3HogILxHQA2eitzx+ICv3B1jKMZ4H5puvhSs28qiUK0Ew9cv3itfus9GLD/qR5fWQN5w/XzxpocLq+WScNUfWvJ3uzQ1QN0aQmuM68OEvX7R8FpjguidUrG8WA3zw=
Received: from BN6PR17CA0053.namprd17.prod.outlook.com (2603:10b6:405:75::42)
 by SN6PR07MB4269.namprd07.prod.outlook.com (2603:10b6:805:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Thu, 3 Dec
 2020 14:03:23 +0000
Received: from BN8NAM12FT029.eop-nam12.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::e) by BN6PR17CA0053.outlook.office365.com
 (2603:10b6:405:75::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 14:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT029.mail.protection.outlook.com (10.13.183.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Thu, 3 Dec 2020 14:03:22 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0B3E3FRL020918
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
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0B3E3Eev022345;
 Thu, 3 Dec 2020 15:03:14 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0B3E3EqM022344;
 Thu, 3 Dec 2020 15:03:14 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v3 2/3] drm: bridge: cdns-mhdp8546: Remove setting of bus
 format using connector info
Date: Thu, 3 Dec 2020 15:03:10 +0100
Message-ID: <1607004191-22294-3-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1607004191-22294-1-git-send-email-yamonkar@cadence.com>
References: <1607004191-22294-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6258205c-6ee7-45ef-4166-08d89794326a
X-MS-TrafficTypeDiagnostic: SN6PR07MB4269:
X-Microsoft-Antispam-PRVS: <SN6PR07MB4269E01552B55C454E06E30ED2F20@SN6PR07MB4269.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJ3Aol+5rhTiUE23pBryDM6fZXIwfezDfT4i5MzvFWsaq8Eb3lCXUdddYecqGkCm4z7dEy9FtAK3e/2mMoxyXox8a1A+1W5OfthdwSJyAMnHqA73jK/zkBxrNcHFg7V6/cejw6VdYul3e/pH7v3JxS4VN6C34BjQjX6uQ9XGSBPVW4v/8l5CY/GpCjKeMIGOraVzT3RXFhOa7ioufbQ5bN63z4DDlA+radrYuXzVGdeLjX5dX6hADjgwbxHPj6jNEf4RHZZrtzddoOIMOio9VkfpNcZJ5RKsnwefcqNJvuJ6sG6nac9w+Hpgcr8JGwWMGNXXuyUKQ6R77pl9EfnskKUK29yr7e5qqDlKPUzYiY/fLfkoKoLrwNVpAWIyVXrOIvvROXh2MQRC1DxMbxXWgcbS+kjXczZZrVvpMmXj8tw82Uao6Xa5weBOOKLVkwEcK2FG/sBpL0We2sXx02oHAIWGtctCy4CEMPjuUUt96KU=
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(36092001)(46966005)(36756003)(478600001)(110136005)(26005)(54906003)(82740400003)(36906005)(8936002)(5660300002)(81166007)(8676002)(82310400003)(6666004)(2906002)(356005)(86362001)(83380400001)(107886003)(42186006)(47076004)(336012)(921005)(7416002)(2616005)(316002)(186003)(426003)(70206006)(70586007)(4326008)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 14:03:22.9393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6258205c-6ee7-45ef-4166-08d89794326a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT029.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4269
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_07:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
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

As we are using bus negotiations for selecting bus format
remove the setting of bus format using the connector info
structure.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 5ef6adb8bc82..d9f7eb8249e8 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1648,7 +1648,6 @@ static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
 
 static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 {
-	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
 	struct drm_connector *conn = &mhdp->connector;
 	struct drm_bridge *bridge = &mhdp->bridge;
 	int ret;
@@ -1669,11 +1668,6 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 
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
