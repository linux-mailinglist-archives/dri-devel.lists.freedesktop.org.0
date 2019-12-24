Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75E12A744
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A967689E41;
	Wed, 25 Dec 2019 10:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949B06E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxUQ3adGGyn1efzoEOhEUE/pg4kZSpiAI3N7A8/PO8U=;
 b=ELVIlYjcNKf90kRz0QtnWE0dkCZ84bhrE4aSPu2gJdcPaGAKeGVVcBpOyLWTobQx/HVaaZdLosz/IyaP3yFdsGI4ZRKlsDw52fVqurNkkvi8kOQ0qyOUmVuoHyy8FmZDUwXbJoXzejIn4WBfNLy7JfP6wW5NhBwkazp0KdHOB6Y=
Received: from VI1PR08CA0231.eurprd08.prod.outlook.com (2603:10a6:802:15::40)
 by VE1PR08MB5119.eurprd08.prod.outlook.com (2603:10a6:803:114::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:34:55 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VI1PR08CA0231.outlook.office365.com
 (2603:10a6:802:15::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:54 +0000
Received: ("Tessian outbound 121a58c8f9bf:v40");
 Tue, 24 Dec 2019 17:34:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3a6d45adc80bbb4
X-CR-MTA-TID: 64aa7808
Received: from c54502d9e00b.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ACB102B0-485E-4D8F-B75F-EEE2D9F61809.1; 
 Tue, 24 Dec 2019 17:34:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c54502d9e00b.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsIr140glYRP0hBlirGs0i8WrUAVm+HkTqRCSxorf2d9pWb7kHXJetzKX84R2YEmp0xbU6DJnxy9r1ixvCi9fGQSahErrObHs4xORQHaNeZ5jBaFbHo2e3isPnOAmIoSKzolqEEw876jrAEuXzj02H+1gtW32kU195XKV2WRZuVS8L/3GMDjff3HaB7LjQuWNDGKT78OmJDgiR09n5jLenm92ZQYwBUlpK4qMqkLAFKOa6xmASN9B+bIn54odLgVNAbwXPIM6yjSGUam3bQtPm9hKGgIdyt/1vsXiJooHRihbgmgjvUBZ6eMNg8aZTNbsH9CGFIqEclHtttXRBxv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxUQ3adGGyn1efzoEOhEUE/pg4kZSpiAI3N7A8/PO8U=;
 b=BxmhE59OXWEh8osLKtjI7lkJVY1WWjmVTIiWAHMfgFsDfJIFQgohUNVexalgBwydRw2gib4Y7sw3b4+JMXO5ik7XNp/PdEq3fSqaUeIv0/UBDt+TgkxrdZNjfqsZQPFkDDSI2vr0CdASRG1ZH0DpXiekKtHkFVnI7O/lXgwxCbUapUC8SZW34ie2AYs/e+msMFp10AOLYh1MDtmnMAHINywvLgC3ql5fJxLAFgnMQYnIsUt50AvQF/5zbS4P1sza2OnzhZ4LMdrWGPTTdpNS77deWwZ1sA+kJ5FwaX54Co+yzxTP/GkrAgYENggelE02MdMv2eSayscW3RJ3XYAG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxUQ3adGGyn1efzoEOhEUE/pg4kZSpiAI3N7A8/PO8U=;
 b=ELVIlYjcNKf90kRz0QtnWE0dkCZ84bhrE4aSPu2gJdcPaGAKeGVVcBpOyLWTobQx/HVaaZdLosz/IyaP3yFdsGI4ZRKlsDw52fVqurNkkvi8kOQ0qyOUmVuoHyy8FmZDUwXbJoXzejIn4WBfNLy7JfP6wW5NhBwkazp0KdHOB6Y=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:34:42 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:42 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 23/35] drm/bridge/synopsys: dsi: Use drm_bridge_init()
Thread-Topic: [PATCH v3 23/35] drm/bridge/synopsys: dsi: Use drm_bridge_init()
Thread-Index: AQHVuoBskCoEV+4xvkW/r7Tjf83qFQ==
Date: Tue, 24 Dec 2019 17:34:42 +0000
Message-ID: <20191224173408.25624-24-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 638a9c1e-d739-41c4-0dfb-08d788979732
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|VE1PR08MB5119:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5119C719D29C1BA910A8BEB48F290@VE1PR08MB5119.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: hKzgOSY8XjrYcvbZoHFvmGNtGNp+H5qaXwxT+D6jaTiTzOLbAz5pqz9mr8kzYn6T0+6oZFLccSDEK8xA7CvBEILjX2FKa/6ST1waN3BoJdmZ795TAEXJoLAbxKy+vPYvgVWF1TR4OxoVN7998gK7ufVDr7huMcBq8juDDw/bsco+JwGPUzgCmP9tHXUhIuwVJyOHieU8cvhP50pD6zpLmp0/q0LEDLlla1GoVrqnRUXlfRcEOshGX83dooZDQiUztTvsFl8XW8JEwk359w1TCHCmD+jcK9Mhjbw92HpvbMhBnHlmA1GApAxodjTegayxDtDpo88PhK7q/lni/bvHLeXAGsmV8jEvvJ/DViCgfl8GSNqhmJTbcJqIj6E3arv6qMUuKGl3ouFLqGZDYUQQOl7OAkfd3Ca1jWtliFS7ThwLk9MehSOE9pnNcrjnVsdq
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(199004)(189003)(54906003)(316002)(2906002)(5660300002)(36906005)(1076003)(70206006)(70586007)(336012)(107886003)(6916009)(76130400001)(26826003)(4744005)(478600001)(6486002)(26005)(4326008)(81156014)(36756003)(86362001)(356004)(81166006)(186003)(6506007)(6512007)(2616005)(8936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5119;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 99b24123-f882-4dd2-da53-08d788978f14
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5uzOYxq0gc071XgZ+QVdesL292xKorhjQEbnNj3XA9GpRvp4xkfgy02O1DxsJVOqecvj4ltNOiA91s4ANGqaDf1m4BJgC16etTD4Gl9WonHlO36mJDL/eNjy0olpoFbky1Rn2LUyAqpx83+HQPTISo+j4Fxhkl175Yvt9GPXAVap3j5ke6IGRcdj+DJFjfAqPwC8tmD05PihIzzN+/T+NtVonhpGf8jv0aCzgGTg+qle5SMwPh/B2N2VOUYgukvOXF5b1rk8VZvfzAvT1eDVtzTpaQfKnEccQMcGjgRaldr1p3M5oEpFFlxgj2S/8D16OjO/gz1nF7lEbVso+1iB+52ZSXfT+2Wo5PQQ/nFc7k1BAW2Unos1mwZU72sug6HYD0k+aXQEfyEXQsy7GjxyLFO+nbNHsaKB4qR2CAMC8EjsAun4Rai0JlckreOo+N3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:54.1875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 638a9c1e-d739-41c4-0dfb-08d788979732
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5119
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
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 3aa4f9289416..40530d0a037b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1064,10 +1064,8 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 		return ERR_PTR(ret);
 	}
 
-	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
-#ifdef CONFIG_OF
-	dsi->bridge.of_node = pdev->dev.of_node;
-#endif
+	drm_bridge_init(&dsi->bridge, &pdev->dev, &dw_mipi_dsi_bridge_funcs,
+			NULL);
 
 	return dsi;
 }
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
