Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D5112A97
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C8E6F4F6;
	Wed,  4 Dec 2019 11:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60079.outbound.protection.outlook.com [40.107.6.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6EA6EBB8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:31 +0000 (UTC)
Received: from VI1PR08CA0171.eurprd08.prod.outlook.com (2603:10a6:800:d1::25)
 by VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:29 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0171.outlook.office365.com
 (2603:10a6:800:d1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:29 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:29 +0000
Received: ("Tessian outbound 224ffa173bf0:v37");
 Wed, 04 Dec 2019 11:48:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02deba9103022596
X-CR-MTA-TID: 64aa7808
Received: from b7ecf5d06a39.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D52A9F92-832A-4F10-818E-23049E88648E.1; 
 Wed, 04 Dec 2019 11:48:20 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7ecf5d06a39.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFjfM1vbceSWlZzQOS3czSKAaBQBuopoGn+xGg+MwBYL0iX+W8QqSHFUoM+lfLR/lSzr/OdDxjIuP2jJgZLuUe52X2+7UD551EV8t/fcGVJHPI9AUgUwiHRv2tN5f134g8WsYhLlTtPdcMMNs+l/4hGfE33zTlPuyNFq3i+S+eB5jYif+jDAmt3dZ2Y6g4Q3zhZEYKwQOle1aY/VKbOMwfG7p4E8nsSEnNjgvjTtzXpwA6bEzu4/nRyur+DvnWXgp8TUOL0P6fvJNJyTvJernmYhE+YyLhe8N4EZtEAXYVCVCZfK2uwmDtIfdZANtuFTOhtWN+8Raak3v5jhUKqecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opfrCUQhstTmEWhDCMZ446EAzDQXpi+cbl+vvgZtrP0=;
 b=L3Hg4mrVEBOa+7Eg0HxR1pK28D7Url9Ao7j+h2mFv5lApB6IIMAaZbDrQZW/HBrqoKFKMoWFGhBaznFn7G4lZiq1/bRpMlGgq2CpXr/aSU9bKUPPnS43Xm9utLhNiotxh5idOgChVatRkEI5h8Dnwvy7aoSNi7jqBlsaQfmKRSXbGdgQsdJJ/yTxqIlQiFFt/gg9XcEun46x1fM8FMqalb4sRx5ODIsPL1d4DshzbdtnmqrjUtmxM1WVQ7NrzzXoTgm2SttCNLbGmhoKSkGFN9Loyu4MHh1QjsvYCa5nxHXZqx1+rCmHxGF7+lH4UPGfvqEHm2Tbf+5OYWzalFvz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:19 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:19 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 19/28] drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
Thread-Topic: [PATCH v2 19/28] drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
Thread-Index: AQHVqpi4n744fjqeC0eCTHPE/a2o9g==
Date: Wed, 4 Dec 2019 11:48:18 +0000
Message-ID: <20191204114732.28514-20-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef72a5c4-5054-4781-cdd2-08d778afe15d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|VI1PR08MB3629:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB362903734B885E9038722F3B8F5D0@VI1PR08MB3629.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ee8US9YYDLIamDHsVWNhK0wsPhjx0r2hLi/WzW6cH7KY2NCfcT1SdGVWBV/r/2Su1Qz9RqkprqD2MIttwwD9WOROL2vy6BaN2t+Exc1RFoL7l8bnDFHKhZ5JhbZaFbhR0TrVP/twY+ekr8JHd4XJp935yGF4Odv3NPLKx0nC3GWOTMIqis40gWZjMs9QgdG7+JhqvriWSFiMkVYcgKyexpdb5rjGLF4RUdNM1zLJVeIdjVJJVHAFT2N1259kg3t0fuZVoWGC3hstp7HBpWVrlrvA8S7PSInJg8qPmW9sdwSXdE4IxDRoy8ZqZ6dFM3X5EMnf8Xh4kkELBMOL+RQInh6deD6qGi2c7yWTCGpbZLb8lnoDQOdhElAgWUSHDc6TtfcKcLK84HnLOcQ/KOjwIU4/2dUFKWfQYCcvqNFbMKXrq+fT9xE1wF4RIxzzs08X
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(189003)(199004)(76130400001)(2501003)(4326008)(6116002)(36906005)(3846002)(23756003)(356004)(26826003)(2351001)(70206006)(14454004)(70586007)(76176011)(4744005)(36756003)(25786009)(478600001)(81156014)(81166006)(8936002)(1076003)(316002)(8676002)(50226002)(54906003)(86362001)(6512007)(7736002)(107886003)(305945005)(6916009)(22756006)(6486002)(5660300002)(5640700003)(26005)(336012)(6506007)(102836004)(186003)(2616005)(50466002)(2906002)(11346002)(99286004)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3629;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5cd40efa-2662-4175-beb2-08d778afdb19
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fo7J48bGkGbeV13ajYPRfYcstnqJIADDP1+rC2osHvaD4GnHj84KPhGXM78wo1XxkmFWZyv1NRiBVAiEUgLkeGpI8Wp0nozhHcP6rVwbSelllqOn/fGl7SC63OWumnDg6xnq4e0H/FHgWA95QpAEMiXMalr5r3XglgFpCx9T+mokbIATiGsVKL2/K+ZGbK6VoIoI+YI3LaREtRi6PY2+jm9Kge3cnuBfSWnDzUKlY1ZXR3plQ/1yqWrbs4hBOzYmkaT+EF/G2qCP6A9WHxYtqi6rZ2Lx4EoXM1lCtCuPyA1jFffxMIl+X3V3kRfKuZ3yHJFhJRN5ManIUwSM7bpPSE8wU8WokSyc+yPrue2kOOSIWI1lMk0n/3EP3Ts+oIePM+qQEkOv9Y0G2KsVPRFnBttrpFui5alPZZLQLrkcnkWJGPREUxBTo1ygV1qwfDcm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:29.1255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef72a5c4-5054-4781-cdd2-08d778afe15d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opfrCUQhstTmEWhDCMZ446EAzDQXpi+cbl+vvgZtrP0=;
 b=1GSexDf8+18j51n7+cQmgRoYULNXUuSLqkLLrNXgiCq9gde/QDWp82fbujopFdKGpWxxA+JSlhxWqX6BaL9vwpure/A5EG1ItX+QzOeFJelLk6sp1RcJAq6hN2KEOJ+FUeKmQ9etQCX4kt9jAVUpYgjTy9yYYwYvntvNWzXEdWs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opfrCUQhstTmEWhDCMZ446EAzDQXpi+cbl+vvgZtrP0=;
 b=1GSexDf8+18j51n7+cQmgRoYULNXUuSLqkLLrNXgiCq9gde/QDWp82fbujopFdKGpWxxA+JSlhxWqX6BaL9vwpure/A5EG1ItX+QzOeFJelLk6sp1RcJAq6hN2KEOJ+FUeKmQ9etQCX4kt9jAVUpYgjTy9yYYwYvntvNWzXEdWs=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1z
bjY1ZHNpODYuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1
ZHNpODYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKaW5kZXggNDNh
YmYwMWViZDRjLi40ZTIzNmI0NmY5MTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktc242NWRzaTg2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNp
ODYuYwpAQCAtNzY1LDkgKzc2NSw4IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJcGRhdGEtPmF1eC50cmFuc2ZlciA9IHRpX3NuX2F1
eF90cmFuc2ZlcjsKIAlkcm1fZHBfYXV4X3JlZ2lzdGVyKCZwZGF0YS0+YXV4KTsKIAotCXBkYXRh
LT5icmlkZ2UuZnVuY3MgPSAmdGlfc25fYnJpZGdlX2Z1bmNzOwotCXBkYXRhLT5icmlkZ2Uub2Zf
bm9kZSA9IGNsaWVudC0+ZGV2Lm9mX25vZGU7Ci0KKwlkcm1fYnJpZGdlX2luaXQoJnBkYXRhLT5i
cmlkZ2UsICZjbGllbnQtPmRldiwgJnRpX3NuX2JyaWRnZV9mdW5jcywKKwkJCU5VTEwsIE5VTEwp
OwogCWRybV9icmlkZ2VfYWRkKCZwZGF0YS0+YnJpZGdlKTsKIAogCXRpX3NuX2RlYnVnZnNfaW5p
dChwZGF0YSk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
