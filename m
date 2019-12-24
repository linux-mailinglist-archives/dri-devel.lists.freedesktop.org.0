Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA312A74C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7820F6E0AA;
	Wed, 25 Dec 2019 10:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C86E353
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQXNbyJJUA+kccB4NHiZM6Z8Dct9s1nfwVvcMcnYYrU=;
 b=kDjCuJwWWSwKVle/pG9449SCtb/2j5jgeOzH8EIaQ5GyAZ6KfU7W7F2hjQJ1uuT7ptdq1nJpsIjWuHVHb+rBSQlxzUKKOwIgE2XfHS7YdGRc1fCNSukb1npPdyLQV3Bea40HPyacR1L0pMHt+SwfgWARVNMuqDbarkXPf/VruiE=
Received: from VI1PR08CA0151.eurprd08.prod.outlook.com (2603:10a6:800:d5::29)
 by VI1PR0802MB2624.eurprd08.prod.outlook.com (2603:10a6:800:ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Tue, 24 Dec
 2019 17:34:53 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0151.outlook.office365.com
 (2603:10a6:800:d5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:53 +0000
Received: ("Tessian outbound 4f3bc9719026:v40");
 Tue, 24 Dec 2019 17:34:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d38e904be3fd0896
X-CR-MTA-TID: 64aa7808
Received: from bdd2edd0996c.11
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07E92312-9CCC-43B2-AE31-2E02211E93DA.1; 
 Tue, 24 Dec 2019 17:34:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bdd2edd0996c.11 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbfk5dnO8ov8aBQmxUFVsERzA/BdaAccgHdVuPM3QSjNlBri8ShI2S9cpLsBEH+dk9a+LG0xaXt3fjJxCWzdoFv1F900Ftlpd1/rdewQfzqoxEHDxh68qCjU5MrqfUfTMNHV4yxZsJHBXrWWoDyn7l3TQMS0Z4XR/aVojyJL28j+KvaPYlhN0FtdHO4L8Nf80jNsTrsOHwQ0k5JxrMR9NhWiaatDGeqKUPO/iq2qr6TFmv4AObTCwS42KRm2HtsB5rdfNLdDtLuNOqFjKTpZo+pJEPSfOLWbaLiCw10h9dcsXCtFwKFkcfCl+ttqSLv7eFOVI3bumZI7RE0hg8qbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQXNbyJJUA+kccB4NHiZM6Z8Dct9s1nfwVvcMcnYYrU=;
 b=HW7kJXx1izuTnOgw+4s1ruuLm8BAzT4EQe63+WPs0h5yPh52mjHfGQ2LmA++sBsD/c0ssU1dNWxjOjm3v5/g1j6hctwlSaGLoiHuUqbpTS+w7Bi7LN6qMpPbLho75Ev4k1MbmnDuvKxVpvYoidotyy8DnoTtNVhNKQ9wLQaEHPHemljr6H2oCBadWaZsQfNee2t1a4MaNim0LgtGR7QiNP6yxpz1rIDiJ5x4F5tDk+I/rvbzWhExQfAI8dr9/MHkOEPL1pWQ5cfqswzpa2acqZiLyKL2XY5OxKAzI4auHDRWsohaZAVRPwBrUf8jgimBvUvB/wXWQ2GxTSOSqBu6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQXNbyJJUA+kccB4NHiZM6Z8Dct9s1nfwVvcMcnYYrU=;
 b=kDjCuJwWWSwKVle/pG9449SCtb/2j5jgeOzH8EIaQ5GyAZ6KfU7W7F2hjQJ1uuT7ptdq1nJpsIjWuHVHb+rBSQlxzUKKOwIgE2XfHS7YdGRc1fCNSukb1npPdyLQV3Bea40HPyacR1L0pMHt+SwfgWARVNMuqDbarkXPf/VruiE=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:41 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:41 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 22/35] drm/bridge: dw-hdmi: Use drm_bridge_init()
Thread-Topic: [PATCH v3 22/35] drm/bridge: dw-hdmi: Use drm_bridge_init()
Thread-Index: AQHVuoBswUteUei9z06pJQdMSXVMkQ==
Date: Tue, 24 Dec 2019 17:34:41 +0000
Message-ID: <20191224173408.25624-23-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f78a220-d490-407b-294e-08d7889795db
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|VI1PR0802MB2624:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2624F92CEE42D84CED625F1F8F290@VI1PR0802MB2624.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(7416002)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(4744005)(5660300002)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: VO0a6uxjoyROXRiYT+fhB7vWYJl0Kx2xWNa2ea4FjZ9/TobFkHG9yA3ASmtFxVlir7UTeXHzeArDP0DjkEV3QwnNUEBl+sEgXFcGRqD83BVlUy2bAUeCgriy8f8G5hRCOZ1pT+j9OtiYFmiCDA3bI3EiO9j4T7P8c08/lKC6JpvSWOQ5EBlIVk4Yr0WEd3wUmMlR7mQxTcAsRFI90ZoRAJq1xNO3zZPxjfux4zBL+v3/4FcexPqFXuvzLCbBmZytAOsFnQkoVDCrgXR47IdSPXbBKX17ziLKp1Fzm25WuVQnsBWlpAvvKItpZg8p1zfcFxsOM/c+6zHsJLEnH22l/n5jon7X8TaiPX+JZjICWZ1TJwt+NQDZEhpE6832IubuX+RY5IY0QSRPY2EyxPv4bqmQkCznlHpRemitL9dX5j5HkGYAtt3MWS22DQCXuoZT
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(186003)(6916009)(86362001)(2616005)(6512007)(1076003)(336012)(70206006)(4744005)(36906005)(316002)(76130400001)(356004)(5660300002)(26005)(4326008)(2906002)(478600001)(8676002)(81166006)(8936002)(81156014)(6486002)(70586007)(54906003)(26826003)(6506007)(107886003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2624;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f263c7e3-133f-4396-34e3-08d788978e9e
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRO+EbBaWEUT0rHij83xmMNbk0na0nmGmqIY0jfffcSg+/1/I+UNcUQz5SCmHcgnuwA6kH62k3BIT8ljxmUxKe1JF3hnoxtqgyoCOdrgR1duMDcCdtLjQQy3BCrainvO4sA8F3zzsQTuyGRBvtSjleS3P0784j/V4Wrc2Tg5RkXaQAXw9AljdY6N2yiFUGETL3W0tHHNIe5I6c56wwxLQgFMRy0va4o/8leQS6kVZxkomm0hZyM+RCB1nC6WGjYI1TDIgjlMNb4j/gvLvH6NuS385lgE7Gy5B/youlA+3h2DSz2Il/Q2t9b16DNBy3XZdF3PiLohba5bizi6M3WC/bIF4GQlxN/DD0ozGJdIruzYmfCSOZdQCDnN+IFStBTGFfxD8RW2fysm5G5th8NzYZC/Zpjxi1Jom4jQcwTdDXA0mDf/U8UNLLUiYvfKsOmJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:53.1031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f78a220-d490-407b-294e-08d7889795db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2624
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 946aa1af8841..55a2a2f58783 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2900,10 +2900,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 			hdmi->ddc = NULL;
 	}
 
-	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
-#ifdef CONFIG_OF
-	hdmi->bridge.of_node = pdev->dev.of_node;
-#endif
+	drm_bridge_init(&hdmi->bridge, &pdev->dev, &dw_hdmi_bridge_funcs, NULL);
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
