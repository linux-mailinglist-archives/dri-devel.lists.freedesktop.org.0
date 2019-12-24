Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E695A12A74A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742636E08E;
	Wed, 25 Dec 2019 10:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130044.outbound.protection.outlook.com [40.107.13.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B86E358
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSDvBOZ3alE2evKaNIymyI/voICFfduJ2i2E7yDy8gA=;
 b=4JWDNwbNugC314EJbSe6rNva5Ds7K5LDHFdOk1o7CW+lZKWSvct/fnBGs1M6GcOwBrOhVv7+4Sba1foim9LLgkPGGYSkFoqUa+gdlM6+X3TY/6jB8AilmTApaXFN12KZXHWuNGjXRd+fVJq/8BypHuD6+16vgOzCbeSwnL+QHl4=
Received: from VI1PR08CA0165.eurprd08.prod.outlook.com (2603:10a6:800:d1::19)
 by DB6PR08MB2805.eurprd08.prod.outlook.com (2603:10a6:6:20::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16; Tue, 24 Dec
 2019 17:34:35 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR08CA0165.outlook.office365.com
 (2603:10a6:800:d1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:35 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:35 +0000
Received: ("Tessian outbound 28955e0c1ca8:v40");
 Tue, 24 Dec 2019 17:34:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6da4f48f9d6bff1
X-CR-MTA-TID: 64aa7808
Received: from 3bb695b41535.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6238562-0C3B-437C-9E06-3B289AF07FED.1; 
 Tue, 24 Dec 2019 17:34:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3bb695b41535.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwGEDvisY5rtr6yRja3+0onKQx5C6NLO+xWBRloanV7sYgM5qTm7rOn3fxDo8w8fIV2LCnCKC9UtuBZH55+Y01aLRXuFnJb5qa/xmanI9zUxwCiGNamJe33gahsf4RIYO15tT7napwElPptQvC4X3TFhocqzE8I/ZFli7ofQ7IO8nywnYFVfd88D6ytTliW6Kh7tYFqkN/NYMfy8k4bjn5gat3GLuO8B2jfgCTCGUOP1A5Gc5BddJF6N22xt/9/zcFK7kWDfXmvZKhEZ4CDhQt/b9jMEoaOcKzSJoOzCC4hMkAUdPszw+lIsshtjc0U3rIOr+ma6j0Gsw+AgSN/tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSDvBOZ3alE2evKaNIymyI/voICFfduJ2i2E7yDy8gA=;
 b=aMIwK0Abt0L/vdI6ADaK5WX/yFoUmdU0MQ7DshS70ihBcLmqOB8htQzSf73Dgsc1PslKdIVI6hDfQPnkmY92qbNzq4xgpfLj65bjzxttSu8Asdn//gjxiLS7zKNllR8bmWsqUd+01TeyCSvvutlJFkjc7/N74lGQyULJ0SPh8ttaZinZ7Z3/vOvZUwVzVk7junI6zmbnpOjyvFmK0+GvlcpkuWa2jlwnCMR0SjleSR52NFqdwcJm7X1wB/oHY8R5uYZLJwjVt5wN7Eyv/ywULkZEV/fOfrtL+gKJmb5jJNql1Rc4Fuzb9V/ibLe3pWW8O03M2Pv865lIA4JkqTgQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSDvBOZ3alE2evKaNIymyI/voICFfduJ2i2E7yDy8gA=;
 b=4JWDNwbNugC314EJbSe6rNva5Ds7K5LDHFdOk1o7CW+lZKWSvct/fnBGs1M6GcOwBrOhVv7+4Sba1foim9LLgkPGGYSkFoqUa+gdlM6+X3TY/6jB8AilmTApaXFN12KZXHWuNGjXRd+fVJq/8BypHuD6+16vgOzCbeSwnL+QHl4=
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
Subject: [PATCH v3 08/35] drm/bridge: Drop driver_private from struct
 drm_bridge
Thread-Topic: [PATCH v3 08/35] drm/bridge: Drop driver_private from struct
 drm_bridge
Thread-Index: AQHVuoBk+QcG1vdB702CoP8zCZJWpw==
Date: Tue, 24 Dec 2019 17:34:27 +0000
Message-ID: <20191224173408.25624-9-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5053616d-de8c-48c6-12f1-08d788978b11
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|DB6PR08MB2805:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB2805A878354A4BB22084681A8F290@DB6PR08MB2805.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1303;OLM:1303;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(186003)(44832011)(6506007)(2616005)(81166006)(71200400001)(316002)(2906002)(1076003)(6512007)(4744005)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2702;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gZXwvNI/YD84Xu9N21Kyldd5xsw3rntRy/yPOzrz49/O9zZWDrCTWzKXC3z4CpG4FitmKHXLZiW4ItCwJb03sn1J0etErcPOh88s36n4/tT4NCYC3guIpviPGA4qNItlEM6S7G5izhdOLwAr/wtl09zTSxS2vu8DbM35CGyqzFLEgpsjwhvq47YypFi4OZYXfkXZ9/dnAhN15wDWGLWRMsg1yh82oO0CdbQxRx4dcWgFMeo2elWtugxXodJxryxOZmi2Q6/bDbGgnB3M21ugnxtEVKRcgIh2DT0gJUnQHkOHLwu0juNm2voLhuxPG4AoUpeOml5Ro1/9q7jCR8dtGrS6Ntd2v3bVp/GGTRyepBXzjJkrIg/9Z6UAq6SfntinWkRybGjMlt37JnMRs66cqTlk6s6WHANk7I6PORhQBYojmscRERvCv4upkVouJAeQ
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(199004)(189003)(70206006)(186003)(70586007)(107886003)(26005)(2616005)(4326008)(2906002)(81156014)(81166006)(36756003)(478600001)(76130400001)(86362001)(336012)(6512007)(6506007)(6486002)(54906003)(1076003)(26826003)(8936002)(8676002)(5660300002)(356004)(316002)(4744005)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2805;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: da99b08b-483b-4ab0-c7bf-08d788978640
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hEf0pXBDSTmZA0yjsLQSMUAM5OOqaYPnCWAb0CWut3nJqQFp3ZCnWz83F2NiWZZW5TQmdo89effQudTHyR1j88Q2ItkRMMAngGdSDd5qkxJcBIV5StR+Kyt1dDXCcJkTNYPuK0qzz9TU9SYlqA3qm7j4T4qRhtqmDMbwBhSbSHJD+Z2Ss1ce4GSH00YSDbO50PBtj3aBwz1+dU7aTy+C5qtxUj9aw9WvEnfQ4WyrPlTJXLO78Ug6B3oaJI2H3KjFF4vlSpDJQnkMuAXUha7Bq7T1PqRuyvvsUsAz3Gq/3TO9hQfTKC85jcWl86Fclfj2au3hFxG7tJbPpshRB4g5FMEkgrfdEJl5Ilnn32qfJ9OwwOHzuvO3IKcH7NNY/tIn9c/3ldQ/DTuRnW5o8iFiVYB/+zXidfWxlR5MlQTcmM7hfOLT759Q8Wmn2SmUxYh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:35.0275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5053616d-de8c-48c6-12f1-08d788978b11
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2805
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
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's no longer used, all drivers have been converted to an embedded
drm_bridge struct.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 include/drm/drm_bridge.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 695d0898df38..ee175a2f95e6 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -398,8 +398,6 @@ struct drm_bridge {
 	const struct drm_bridge_timings *timings;
 	/** @funcs: control functions */
 	const struct drm_bridge_funcs *funcs;
-	/** @driver_private: pointer to the bridge driver's internal context */
-	void *driver_private;
 };
 
 void drm_bridge_add(struct drm_bridge *bridge);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
