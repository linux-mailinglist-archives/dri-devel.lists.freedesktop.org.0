Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7A012A756
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB996E211;
	Wed, 25 Dec 2019 10:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DEA89FD7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMZ5ZAVYsnUfr4geYMTE6cLOip6KXPRJVQif8VdxATE=;
 b=STXn+/plckZ+d8m1SpxSJbNO4vAI3tZb5dDqMYbbJZ9wtheewScEb3je71CCMPscuX+obW9WExWdDbpZMoGgaYaAcqcUXvWOL6t3+UvlhZSHHE6/e5v9SoQEz252JCNavhsy+k3BsIZzVtlQY3/92FBLT4qX4KBZtJ4V5vZ+CJE=
Received: from VI1PR0801CA0067.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::11) by DB7PR08MB3305.eurprd08.prod.outlook.com
 (2603:10a6:5:1c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:36 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR0801CA0067.outlook.office365.com
 (2603:10a6:800:7d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:35 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:35 +0000
Received: ("Tessian outbound 28955e0c1ca8:v40");
 Tue, 24 Dec 2019 17:34:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d032c781cee466d
X-CR-MTA-TID: 64aa7808
Received: from 588b9162f539.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8507C905-0511-4637-8B57-E3A3B8C7BB31.1; 
 Tue, 24 Dec 2019 17:34:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 588b9162f539.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu19ORQEbGPAGzKjXlVzuw3JQj9NhL4IKRfZPlAQh8WSWqHMDGUfjDQ9xVEgXShvMrLoHEBP10fpx2spF4CMhvrWqemiUlVcBcziSPAWjEcFt4yKadi0SCOe4nwxJc9aBu3kNm0TmTbf0i/ie5Q19AGvK3YXAnmuosBBmzgCgZwjh908lDY9yWsEPXZ+Toz19PjC3K9+8y/p8f66DkVbOogdoeYCqaSibvH0zQN9GwHBo1AdYT0/O/bMEOm9Ovmu5Tcbow5rrPNyAXOHg3piDYfBVIxw8xteHRLd8rwB8E5yexbqPdaVwbB/wJeuV4TcSIiGs88A9k5mD5FZj9hVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMZ5ZAVYsnUfr4geYMTE6cLOip6KXPRJVQif8VdxATE=;
 b=fB/NM5WNNkAp11UQHpleUDGWyR/xLDMkgaIFm6lsZlomFFMiHuC8jljjSIgi/m4hxUwhQRCIpxc/9DQMD38Ekh602PccXHsyZY5UPQSOrW/8Sz1xbJK/zwhmFNOovjPexrFtcsUEhfvLhEjaUPl3uWFi5leYW/Iv7FJ0kEbhSCIMKmUiYDVsUvYjVHNLibKoCwULkLylGEcvygrc4NywEniU1MinwQlq5xgK69RTKHJJsEY+VyP3MZV7YdWYxE6qGN4mT2t/T4WWrGzqWHDxOceNhnjXgKWeXo0GTIN9FaxvdjdKaFC+PauPIyPA8rYwgjXL2+e9S8zzNyuyv285qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMZ5ZAVYsnUfr4geYMTE6cLOip6KXPRJVQif8VdxATE=;
 b=STXn+/plckZ+d8m1SpxSJbNO4vAI3tZb5dDqMYbbJZ9wtheewScEb3je71CCMPscuX+obW9WExWdDbpZMoGgaYaAcqcUXvWOL6t3+UvlhZSHHE6/e5v9SoQEz252JCNavhsy+k3BsIZzVtlQY3/92FBLT4qX4KBZtJ4V5vZ+CJE=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:28 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:28 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 09/35] drm: Introduce drm_bridge_init()
Thread-Topic: [PATCH v3 09/35] drm: Introduce drm_bridge_init()
Thread-Index: AQHVuoBk/kdoLcRc2kWafO/PUjf5nQ==
Date: Tue, 24 Dec 2019 17:34:28 +0000
Message-ID: <20191224173408.25624-10-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a910a71-8da7-4cfe-05d4-08d788978b88
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|DB7PR08MB3305:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3305C50C38F90B8E86E404918F290@DB7PR08MB3305.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:513;OLM:513;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(186003)(44832011)(6506007)(2616005)(81166006)(71200400001)(316002)(2906002)(1076003)(6512007)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2702;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3pUuxD/eaFpLIPQa5bNvaZXYZ0pxtwXbc57wYiWxRJ8YLWhSSgQ/pdpI9H1NbTMyx9P4UJEGslrxJSv2yK8SEjBk8E/OEV9GOHnc0buTfhEoFBQxUfONxq+UolRc7y8i0QEzxNEab4o75GB0RP9GfVmNj4Zkm32TIgJ+LrqRZTddxFkvfwhJLkSTZF/HeC1w3Na7hlPrj9yUKP9yMUG1i3m2LQ6YMbA9jHd0zSbAjjF4fLZpWiLWjOfhUAM4ssv1hEWxQWAfY5mTJXvcpDW46qi+Cy0m1oUArdj5PAuvltetEOHeYboj9jN4lLRtcl8g8g62OEVcYOmZtgOA8ccrOjVdhma9NjW9FTcR0jW9M6ItgjEalfihzYmCogsq1K2S03QFIwFp+u6XnRfrG5YwmE2S4o+beoK2a7QXzCaOsEuTUduTPN9ZRp0mPxUxaHs8
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(81156014)(107886003)(8676002)(8936002)(356004)(70206006)(186003)(26005)(336012)(2616005)(478600001)(36756003)(4326008)(6506007)(81166006)(26826003)(2906002)(1076003)(6512007)(54906003)(70586007)(316002)(36906005)(6486002)(86362001)(5660300002)(6916009)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3305;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b9bc5126-9083-475c-7f3a-08d7889786ec
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFW45IDMq8fpWmWjVTZyI5ZGTLOqH75Lu7O5TjUozDsV+8pT5gx98bLooGCBWFjCKIGnA6IlsQplr3AYfFiNcsAGIFmiy5fq0c3yylggvNBfWMiXdBRve4fbPcbJx8AvdzfM7RI+b9y3NonHvZc54DGMfDMwDk0OE+JeQzius6sdA+3DWIeyO8VSsDM0HGitZsccJOTT2fGc0Qq8PprGzyfFXySnppeOSclUwtMEKDJqY6Xsah/cqw6BFQ/rF4OLMgR3LOxwWTJ7PZ7eVPkJ0PK9lQuOq5swNZBMn00yvG0DJTMSVglNNnnsFRzUb/ptR5XYJlTkp1CS4rZ1SI/sba6+eRIFMWNd3iWVpFVreBHRQ8uDgQ9zkKrrXYGRbr9Jb42QHeLiR9iYMwaYgb1GdvtnGgG5frNRJYDj9mNiCQ6FwR1jeEZ1PCIX3eLITlyo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:35.7530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a910a71-8da7-4cfe-05d4-08d788978b88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3305
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A simple convenience function to initialize the struct drm_bridge. The
goal is to standardize initialization for any bridge registered with
drm_bridge_add() so that we can later add device links for consumers of
those bridges.

v3:
 - drop driver_private parameter (Laurent)
 - spelling & style updates to docs (Laurent)
 - don't set drm_bridge->dev (field removed)
v2:
 - s/WARN_ON(!funcs)/WARN_ON(!funcs || !dev)/ as suggested by Daniel
 - expand on some kerneldoc comments as suggested by Daniel
 - update commit message as suggested by Daniel

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 12 ++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 258094169706..d6b64e9aec7c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -67,6 +67,11 @@ static LIST_HEAD(bridge_list);
  * drm_bridge_add - add the given bridge to the global bridge list
  *
  * @bridge: bridge control structure
+ *
+ * Drivers shall call drm_bridge_init() prior to adding the bridge to the list.
+ * Before deleting a bridge (usually when the driver is unbound from the
+ * device), drivers shall call drm_bridge_remove() to remove it from the global
+ * list.
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
@@ -89,6 +94,31 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
+/**
+ * drm_bridge_init - initialize a drm_bridge structure
+ *
+ * @bridge: bridge control structure
+ * @dev: device associated with this drm_bridge
+ * @funcs: control functions
+ * @timings: timing specification for the bridge; optional (may be NULL)
+ */
+void drm_bridge_init(struct drm_bridge *bridge, struct device *dev,
+		     const struct drm_bridge_funcs *funcs,
+		     const struct drm_bridge_timings *timings)
+{
+	WARN_ON(!funcs || !dev);
+
+	bridge->encoder = NULL;
+	INIT_LIST_HEAD(&bridge->chain_node);
+
+#ifdef CONFIG_OF
+	bridge->of_node = dev->of_node;
+#endif
+	bridge->timings = timings;
+	bridge->funcs = funcs;
+}
+EXPORT_SYMBOL(drm_bridge_init);
+
 /**
  * drm_bridge_attach - attach the bridge to an encoder's chain
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ee175a2f95e6..955d9bd13805 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -378,6 +378,15 @@ struct drm_bridge_timings {
 
 /**
  * struct drm_bridge - central DRM bridge control structure
+ *
+ * Bridge drivers shall call drm_bridge_init() to initialize a drm_bridge
+ * structure, and then register it with drm_bridge_add().
+ *
+ * Users of bridges link a bridge driver into their overall display output
+ * pipeline by calling drm_bridge_attach().
+ *
+ * Modular drivers in OF systems can query the list of registered bridges
+ * with of_drm_find_bridge().
  */
 struct drm_bridge {
 	/** @encoder: encoder to which this bridge is connected */
@@ -402,6 +411,9 @@ struct drm_bridge {
 
 void drm_bridge_add(struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
+void drm_bridge_init(struct drm_bridge *bridge, struct device *dev,
+		     const struct drm_bridge_funcs *funcs,
+		     const struct drm_bridge_timings *timings);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
