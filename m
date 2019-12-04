Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED1112A93
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3836F4F7;
	Wed,  4 Dec 2019 11:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37BE6E8DE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:33 +0000 (UTC)
Received: from VI1PR08CA0157.eurprd08.prod.outlook.com (2603:10a6:800:d1::11)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17; Wed, 4 Dec
 2019 11:48:31 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0157.outlook.office365.com
 (2603:10a6:800:d1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:31 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:30 +0000
Received: ("Tessian outbound a8ced1463995:v37");
 Wed, 04 Dec 2019 11:48:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f609738160676c2d
X-CR-MTA-TID: 64aa7808
Received: from b7ecf5d06a39.10
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C71C4CBE-4543-428D-8819-AC471F306DE4.1; 
 Wed, 04 Dec 2019 11:48:22 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b7ecf5d06a39.10 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euiCuXMPMKennQ3P1HAOA0FsjcwQj4cWm9GsvGl0gRxXacXc1HJ6iXy2FZ+wQPnqj6tUZf4j2kNnkDmXrjHy1HU/PPGnfWIuvNkLbQuMgCrL8kd7qyKoMWRJK8s2Vn+o95gJIFwKoxsJIF1CkOrSDcfP0WiM7WBEnrLU1wyL1St6jcptuZrZwJXqlMpLmwNMekStMHqGVO8CKUIEmePUpozIDaB1asmqwr+lO8XgzVUVgfZQx+KfU2RKF6bpJt1T7xwYh6F9blMe0MMnds/Axka/K7Y33OBKWsYNMz99T6dl4Q7ubWWbDuV0QjOibpcbHv1W4h00rdmPPotr2LGTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ACjV4UGNCWLSq8MibzK+USLBibC30MfoACrBrreo6w=;
 b=dEgND/wqxuNRAeDNTOo08n4EjebnpPNWfpbUnBTEbHPhL+nLOzlZm3bJDtoOBsZYuMjaz2jN8g6++fYQz9mB2V0mNh4xgJtyt3+c913YuYtsTxkC9wEF6d72W46GQG6QMZb9xivjSmhcZgER7JMVYvpUu5r4qbWwvhkrNqSYALCTbrYMtr3jpFRtGTijF61vpzF2h9mEdg2kAckll4hI3cMO9BigVuNtIZ2Oppxs087xPGOpEdEVG+tG0UvP6Kod9wzN98XXAmckyXsdW1PVHd/FcmfD0G9DcsWiqFXcXQ3y5y1SEYLV4bLcI4vkz/No7MWhGlWj6VzdS9HYE4T8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:20 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:20 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 21/28] drm/exynos: mic: Use drm_bridge_init()
Thread-Topic: [PATCH v2 21/28] drm/exynos: mic: Use drm_bridge_init()
Thread-Index: AQHVqpi5K8LO++NS4U2nSxfkhZ2Q5g==
Date: Wed, 4 Dec 2019 11:48:20 +0000
Message-ID: <20191204114732.28514-22-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4f73bc06-5d1e-4262-3cb8-08d778afe267
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM6PR08MB4405:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44054F2C870DB54FC7B5B3E38F5D0@AM6PR08MB4405.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(7416002)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: swHtl3lM5DNGW+yfqJ+0LRrIcntQrPyU3gJ3lU2I87mob8849XNBHNH2F54qRwzlArTIpeHWMR6ipbFPAEyjQWL9+bmWEjtncItl2vSaWStTl8Rf7Z0/xV2LjOPoPs2MYKB23vGlFaMcvcubVqkVOtZEZk+/ieh7doUjkMDn34vPyWKrxS39+aRM2W0v1JrCBCn/hlbpaL/h9jEaO4TO9G9tUYiGS/UFr7rbxnlVEMVc5zkxFm0bce56LRJaRdeKz+dE7kBvREiNGEJWq/DSnloPlwrc1ZCd8Ukg1ItOYhCHwMxw7ExZWFkBsMlpyOnpHQnlhe4a7r10GAPA7Q9a5VNCXXeSG6eBfykeZjwFGfpceDqttlrm+bZrFfgRQ8Pq1G4A9ASRygyhTVuDZMpdFFiaAdEzI6sgEExcQvb7SqKV3AqI3S5ekAsUtysOH7r8
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(5660300002)(6916009)(81166006)(23756003)(26005)(70206006)(7736002)(3846002)(81156014)(36906005)(99286004)(2351001)(316002)(2501003)(26826003)(356004)(1076003)(2616005)(22756006)(8676002)(8936002)(50226002)(2906002)(14454004)(8746002)(478600001)(25786009)(4326008)(107886003)(36756003)(6486002)(11346002)(6512007)(76130400001)(305945005)(102836004)(86362001)(6506007)(54906003)(5640700003)(70586007)(50466002)(76176011)(336012)(186003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4405;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e801a01-9320-4c23-3ed5-08d778afdc2c
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVI/Pv6RqxP2CmAafvPIaD6wVJbf2sZPi6Zn38vLMa2oI3p3dh6Z+wvKGVjR2Ol62r4tisDB07tcUnCSXpI6H2+zC+8rG/PzlBgRVCs/SDS7eBC2u3De1GtGGaayaUpJbf8kypeVajEsBXQQSpFavZ8XicNsD9btHiIaanBSifmtk9ZpzKja7xv2VV7pszM9My6An4Z6/BWRBHyGlBUlJ0QS4kXEDfHysZQK7lFp0MOg1+5qDLMwPNUIiDIqr+gUFZK/2S+9XDM7LYzDTW1Ny7eIoz635RuB6FAiYGxdw537khF9KUHqsfMrLPECmmQyQ3706urfjEZ5FUvsMX5oTVitX5ZfqdnpkGYxEMloV5hThnA6/jztNZds2E/lRUMm68cwQvSAS4FtaTtm4Zckqu4KpkpOcbkYNMQCYLOaVqT1udMRfV66qEf9b2elWHzj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:30.8600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f73bc06-5d1e-4262-3cb8-08d778afe267
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ACjV4UGNCWLSq8MibzK+USLBibC30MfoACrBrreo6w=;
 b=xR+QFID3SCM0cWoVSBA4I6BSgRQe4GUbyQa6A9xzNf5AGk1LPbGN5SICdOjNOw7gV9QK6IrIAqJLA+pt+IV0G43bMlnnoFw/Ls4shNiZAGrTdFdiAvGYIdgeeThHr8wxrSH9zGRcl+62g6aphheK2DuP7GZqlRO9vpvUe6122Zc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ACjV4UGNCWLSq8MibzK+USLBibC30MfoACrBrreo6w=;
 b=xR+QFID3SCM0cWoVSBA4I6BSgRQe4GUbyQa6A9xzNf5AGk1LPbGN5SICdOjNOw7gV9QK6IrIAqJLA+pt+IV0G43bMlnnoFw/Ls4shNiZAGrTdFdiAvGYIdgeeThHr8wxrSH9zGRcl+62g6aphheK2DuP7GZqlRO9vpvUe6122Zc=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2U6IG5vIGxvZ2ljIGRlcGVuZHMgb24gZHJpdmVyX3ByaXZhdGUg
YmVpbmcgTlVMTCwgc28KaXQncyBzYWZlIHRvIHNldCBpdCBlYXJsaWVyIGluIGV4eW5vc19taWNf
cHJvYmUuCgpBY2tlZC1ieTogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpUZXN0ZWQt
Ynk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogTWloYWls
IEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9taWMuYyB8IDggKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fbWljLmMKaW5kZXggZjQxZDc1OTIzNTU3Li5jYWFkMzQ4YTU2NDYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMKQEAgLTMwOSwxMCArMzA5LDYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIG1pY19icmlkZ2VfZnVuY3MgPSB7CiBzdGF0
aWMgaW50IGV4eW5vc19taWNfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3RlciwKIAkJCSAgIHZvaWQgKmRhdGEpCiB7Ci0Jc3RydWN0IGV4eW5vc19taWMgKm1pYyA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwotCi0JbWljLT5icmlkZ2UuZHJpdmVyX3ByaXZhdGUgPSBt
aWM7Ci0KIAlyZXR1cm4gMDsKIH0KIApAQCAtNDIyLDkgKzQxOCw3IEBAIHN0YXRpYyBpbnQgZXh5
bm9zX21pY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgbWljKTsKIAotCW1pYy0+YnJpZGdlLmZ1bmNzID0gJm1pY19icmlk
Z2VfZnVuY3M7Ci0JbWljLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKLQorCWRybV9i
cmlkZ2VfaW5pdCgmbWljLT5icmlkZ2UsIGRldiwgJm1pY19icmlkZ2VfZnVuY3MsIE5VTEwsIG1p
Yyk7CiAJZHJtX2JyaWRnZV9hZGQoJm1pYy0+YnJpZGdlKTsKIAogCXBtX3J1bnRpbWVfZW5hYmxl
KGRldik7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
