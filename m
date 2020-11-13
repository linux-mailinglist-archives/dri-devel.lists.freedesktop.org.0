Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6542B3AF5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBED89F47;
	Mon, 16 Nov 2020 01:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061526E489
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:06:16 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD9SA9w004370; Fri, 13 Nov 2020 01:46:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=CGiKMp9Pks5QIObw//SAoNPnCYud2GIuuYEf9FFciKw=;
 b=j+F5hMIJsFdslYAVm0mKbpGMX23ADRYykAkkBselsc+caLPzGrkSP+XsxqTjpWxexUvP
 +jAqqMb1pPPsnotcNILD33mjrP02iUd/XiNYtgeIa0UzrqdVOD9P0cGPinchCUyAR/Hu
 +oHTin1eJjtaMIIF3XCiLUxB0NlZn5z/oDL5vEY4zhIse7fBuiZ2lwEhSvUfO9TaHU9j
 m5rTLdOw+V6vaML8CYqNv6PAHXCYL7/Z892RG1+ynNoKJFZQ06EtWfhIWlVssfU3sF6Z
 UFf0JMNHbbJpO1v+iSukzuDghdoZ5fM14LQIMeqJs3rjlJ8XNdQvUMnwrhs56pPQLey6 ow== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0a-0014ca01.pphosted.com with ESMTP id 34ns14rw3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 01:46:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8TbP1K622VlJF1FnmbO1gtaCGS6tSQXuieShls3BWfTa2TeEyegyMlwseHNsTsZ6d5j9JcogJF7hhdljnXQFd9TMAYkVKoQffx29fRblHibgc474AgLJgx6VITlh1Kpa0OkAqwpEkJPV+HLPSpFvjyNDHk55gP0hNSvvs9ub6oz1ZMIMEQHWUh/aYQtP2Da1H6vI9T3Z0OuurtXlVHF1obPRjqMsMvyBDlawauzlQbnhw1f4k//vhiHv4nxOjdxt/R5kpYo7sVPh+Sp9BOtTelh6E/xALiaavhGLW+uiWkEAPwdag1UlEWTU/FpGRA7/+Xo+KgY0vjc2nAuqu/R2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGiKMp9Pks5QIObw//SAoNPnCYud2GIuuYEf9FFciKw=;
 b=dUdFKKsYvwBHf18GDfcmp4KltmQFTBLkYYwcFaqOhek4uhYSUora4qrUC32aTYZRTRGlr4p3VeBZ5xDfIUuu76pOgqRtmYQxOjq6W5svjn+YJw15ar5maOFu03EDVRHbvTEhkICRrgET5hphhHByN9XSTzdd7wwcCGA39lR1cU2UnwzF3jYynoZYKVk3jWm5ejKu6uoeh1cbLooglqS7i+3MZNiZpCGQAEVFomZnpjGATCE4BN+NezjeBbXltyOPOxBdyOYx9Vg1evoy5QAQKC8MfTDSO8to1HcySWrx/QJfqwHYFKwy2NXAO0nMeZbzFjPGvtVoiO7e74nVCle8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGiKMp9Pks5QIObw//SAoNPnCYud2GIuuYEf9FFciKw=;
 b=O2+rzQqfIquFMyNJIjECRWMyHidzLQH/lOHkz46D1vlHMd1t8d8A9ZgTc4Oq/wQDuDijXnwtusUZBkbSCcMB6KRfQGwdThn6mjxa6zDc6WJY4dN/zy7o/PdAJbZW3yrUsWmUo7ubAzsig99nSxEOws6byFnh9UQi12mGQsxTeao=
Received: from BN6PR07CA0014.namprd07.prod.outlook.com (2603:10b6:404:8c::24)
 by DM6PR07MB6188.namprd07.prod.outlook.com (2603:10b6:5:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 09:46:51 +0000
Received: from BN8NAM12FT008.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:8c:cafe::6f) by BN6PR07CA0014.outlook.office365.com
 (2603:10b6:404:8c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25 via Frontend
 Transport; Fri, 13 Nov 2020 09:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT008.mail.protection.outlook.com (10.13.183.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.12 via Frontend Transport; Fri, 13 Nov 2020 09:46:50 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AD9kgJI009933
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 13 Nov 2020 04:46:50 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 13 Nov 2020 10:46:41 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 13 Nov 2020 10:46:41 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AD9kfbL029852;
 Fri, 13 Nov 2020 10:46:41 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AD9kfW5029851;
 Fri, 13 Nov 2020 10:46:41 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v1 1/4] drm: bridge: cdns-mhdp8546: Add output bus format
 negotiation
Date: Fri, 13 Nov 2020 10:46:31 +0100
Message-ID: <1605260794-29806-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
References: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51bbdf4f-6c0b-47ad-5083-08d887b90bc7
X-MS-TrafficTypeDiagnostic: DM6PR07MB6188:
X-Microsoft-Antispam-PRVS: <DM6PR07MB61882E320D49CC8BF232FD8AD2E60@DM6PR07MB6188.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbgAUWferHeHz/nxvQNWlk8CI6uDrSGdWB0QhZ9FzPK6Ie40JQKZpGheagwRJFo9WKpeSnP1vhvRtgQlJodK6I0luHyxhB/FLlsfha5zW335oVPQczCEiv/S2opDs8+Rgo0mbnOjhzYviGLpQhMMWOTezlqTF+wfIesB4ILbBGty8sMni94NRMMuQis2gcZFNmbJozyT0kMuUr9Qhe0wqmO0B0TnSwFQTlCglSmi1nkO9kFObsAkQjCF2w9yjJSZNoSfe9PlAu33dKIrwKDtve90jYzgdLI5uxiizgIU0pv99GscFUAbSVvXs6rkitJ+Q9RkxzIaFsRw/v9W3Y4L44AN6oPE8LJRV7XFA0tjs4Sd7lBnrUjdcmaZNHRP0tlH9p8An8VHr6Dt7BWCsvul4XJQPnxXyvA/bZZXIsTeOKbcVA2iDXSSqYh5gVZmI4MElz6ZzxSXCQcUgkBiKbwmpEzW7pzk4d30fsH+p7wU0XM=
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36092001)(46966005)(4326008)(8676002)(2906002)(5660300002)(81166007)(336012)(36756003)(47076004)(921005)(82740400003)(186003)(356005)(83380400001)(86362001)(26005)(478600001)(70586007)(70206006)(54906003)(107886003)(8936002)(7416002)(6666004)(2616005)(36906005)(426003)(42186006)(316002)(110136005)(82310400003)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 09:46:50.8926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bbdf4f-6c0b-47ad-5083-08d887b90bc7
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT008.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6188
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

This patch adds minimal output bus format negotiation support.
Currently we are adding support for only MEDIA_BUS_FMT_FIXED.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 6beccd2a408e..bdb0d95aa412 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2102,6 +2102,23 @@ static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static u32 *cdns_mhdp_get_output_bus_fmts(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state,
+					  unsigned int *num_output_fmts)
+{
+	u32 *output_fmts;
+
+	output_fmts = kzalloc(sizeof(*output_fmts), GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	*num_output_fmts = 1;
+	output_fmts[0] = MEDIA_BUS_FMT_FIXED;
+	return output_fmts;
+}
+
 static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state,
 				  struct drm_crtc_state *crtc_state,
@@ -2170,6 +2187,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_destroy_state = cdns_mhdp_bridge_atomic_destroy_state,
 	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
 	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts = cdns_mhdp_get_output_bus_fmts,
 	.detect = cdns_mhdp_bridge_detect,
 	.get_edid = cdns_mhdp_bridge_get_edid,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
