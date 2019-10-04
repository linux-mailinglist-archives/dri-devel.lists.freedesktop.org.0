Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E03CBD58
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EC26EBB7;
	Fri,  4 Oct 2019 14:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1066EBB9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:34:52 +0000 (UTC)
Received: from VI1PR08CA0197.eurprd08.prod.outlook.com (2603:10a6:800:d2::27)
 by DBBPR08MB4554.eurprd08.prod.outlook.com (2603:10a6:10:d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Fri, 4 Oct
 2019 14:34:49 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0197.outlook.office365.com
 (2603:10a6:800:d2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.18 via Frontend
 Transport; Fri, 4 Oct 2019 14:34:49 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 4 Oct 2019 14:34:47 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Fri, 04 Oct 2019 14:34:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0798540fbde5b4ef
X-CR-MTA-TID: 64aa7808
Received: from e28735ce9d3a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14D801F9-9CE1-413F-9B1E-3C7D8327D8A5.1; 
 Fri, 04 Oct 2019 14:34:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e28735ce9d3a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Oct 2019 14:34:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eoh65+Yw/SOSHXFMB0nANtTj7X7phw/0a7R+UGIul1Y3voyG1q1ItIfNhasUQH+Z3tjOAejREGt3HdR6lvvEC5dbDJTyL/SCDfjKXH651XDBfHhykOvPeJf7E4SIlYJdWKqQDS5ZBhhOwTp2g7d8uS3JLpNAZTMOaZfz58KemUkfLs2bCo/ug2NQ6VGHJryRVxrqEp+o/8z1sjzaBzUh/vCjDLQ/pK0KvHfEFhG26b5r8UhWNUgc9ot91D1vsx5UPdIDiSOwtERUI4NAgRAkB3SKbZlRtuabrtjVmCeIo2M40T7rNPdFh4ojIXzgUat36NTv/BsBWJGrt7ED5ss/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK4ZcTaWUSRAjX0xe8+6lEgAOWI0bkyan77WyvE7Nwo=;
 b=huCNw23ZqbBUP1lLa9cpb/ARdt/lRKwtvRXsElOd5cV3ZaIGPojsh6TDG6dyNybFh0ojUiP46EWKG+eDv+8YXmhRRvfUaFvdtJ3/FBntieAFwOqfFtwdytYOBCodrSLaZN8jkPlofvNfZkmS6I2EITkve7GVOgH7kJeYDvJigqdXIw4xNwhWb0dRFiZ22uaedAuJBJiEpOmmznw1NteX6lE1pnDrkBKW8vszVzf/xSH6sFyk3ifZ/PxDtlrq/NsDnkJ6aEZMAfLIHEPCKULOQbpaJpXPGr74KmKtlncMfFwgI+iOGBLInWPCDq1EWwWCYXv0WEbbqePO422kZsOcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4288.eurprd08.prod.outlook.com (20.179.25.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:34:39 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:34:39 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/komeda: Memory manage struct komeda_drv in
 probe/remove
Thread-Topic: [PATCH 2/3] drm/komeda: Memory manage struct komeda_drv in
 probe/remove
Thread-Index: AQHVesDatT7fIDs+C0WcvAQ2c1lXGQ==
Date: Fri, 4 Oct 2019 14:34:39 +0000
Message-ID: <20191004143418.53039-3-mihail.atanassov@arm.com>
References: <20191004143418.53039-1-mihail.atanassov@arm.com>
In-Reply-To: <20191004143418.53039-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7e80022c-8d33-4009-83ec-08d748d801f8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4288:|VI1PR08MB4288:|DBBPR08MB4554:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4554531B265554E3CD79BC208F9E0@DBBPR08MB4554.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:296;OLM:296;
x-forefront-prvs: 018093A9B5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(199004)(189003)(1076003)(66066001)(14454004)(66556008)(102836004)(2906002)(5660300002)(478600001)(36756003)(76176011)(26005)(50226002)(3846002)(2501003)(6116002)(11346002)(66446008)(386003)(186003)(64756008)(6506007)(66476007)(8936002)(66946007)(2616005)(4326008)(256004)(44832011)(81166006)(6512007)(99286004)(486006)(6436002)(5640700003)(8676002)(6486002)(86362001)(25786009)(71190400001)(476003)(6916009)(7736002)(305945005)(71200400001)(446003)(2351001)(54906003)(316002)(52116002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4288;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: b5k7dmFBQ7V2Gg0Eey0+UbOOxONeoXqgpT9bskVPXBKYyGlTf6AOjsutW+4i0dA9AM2RB9vbzcj6Kss4zMaSaqRfhYV+/Pt2Ir+0yfqD2hAv14nTx2Rw0upHV0PMY9AwL6YjzgbjD13F28yiiBJflgIvKdeGhh0YctHag3xnXHWLugYW6MK7ZTx0a+LGD73VUMC9kCbrurz/fAQGZfQXMqpdbAn/H0QZYKFHq3kFCNO5MqCMFkOKXYdqGTkHGwPU19EAVyvg4QM1cIMnBtdnVDlk8gBmHofmTiJ67d88PBjZ2vOcnJwFl8vy5Kkbp04VefXz5Qyzhwirn5B9hSO3L8trJioPffQH8+IY6P8BUdN7bV0IbVNHkDT/QY5avgLWfGOsQhhXf8DiNKi6ABWltURNuFPzqO/AOh9h1D3Eb7g=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4288
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(76176011)(99286004)(2501003)(476003)(478600001)(54906003)(50226002)(2616005)(2351001)(6486002)(76130400001)(86362001)(36756003)(36906005)(102836004)(66066001)(5640700003)(1076003)(6506007)(386003)(486006)(6512007)(47776003)(23756003)(356004)(316002)(186003)(4326008)(336012)(25786009)(8936002)(6116002)(7736002)(3846002)(8746002)(70586007)(70206006)(50466002)(6916009)(305945005)(22756006)(107886003)(26005)(26826003)(81166006)(81156014)(126002)(446003)(63350400001)(14454004)(11346002)(2906002)(8676002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4554;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8d42af8c-9711-46bb-beec-08d748d7fcc7
NoDisclaimer: True
X-Forefront-PRVS: 018093A9B5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHBnrrU4DsOTLLROaR0c+nAx2hXV07YbnJaPjb3rYGnRD7A9/Cn1dDtlB0HHYL80aNQrV+ykvgSSQyJb2YpTzhT8qQlr99hscumgg+C0FSDJE9NUpObcg7B0ZmTrFHXT5XzYQfstj4BAvzoBYuoX3O56Fu3O6p0IdvLR5+Cl//CYYmdyk9BHm0q+1vz9XlPa4vqN4WV0BzwY5mL0UO3LKE8enbhdb8ooNj4Gd7kDs9dEHEYDtOHbKynBMUSsQzh0T1GADZBB13+WC1Z5exmAmrCewIfH28gU4ye0q4SbOg9wt+Q8r+RxB893PAYeutKV8gXtolZsDls4kHzVTFrn5/Ej0Bmmnw02JjekJbh4wG8j5fX4OaOEs7t4XHIp7sAJSt7T610ksfE+HXFjM9+mTk0ERx2Vkr0bT27MhpgWqks=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 14:34:47.8803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e80022c-8d33-4009-83ec-08d748d801f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4554
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK4ZcTaWUSRAjX0xe8+6lEgAOWI0bkyan77WyvE7Nwo=;
 b=PbGcC81UIqnELOaGaoq5oTb9ucYR3XFbFBAuz7SnVXkVisFMTqMTGEjPFn4TD6CAP0JUV0v9Dpqyvhq4iqfykfJb87uOTy6Tyt6axXq76+ZQUerRGss+tpseBuOh0VFQKUKdnRmc9dYTXbU2HEGrbum5v7iHkyW+8rL3b6YQhN0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK4ZcTaWUSRAjX0xe8+6lEgAOWI0bkyan77WyvE7Nwo=;
 b=PbGcC81UIqnELOaGaoq5oTb9ucYR3XFbFBAuz7SnVXkVisFMTqMTGEjPFn4TD6CAP0JUV0v9Dpqyvhq4iqfykfJb87uOTy6Tyt6axXq76+ZQUerRGss+tpseBuOh0VFQKUKdnRmc9dYTXbU2HEGrbum5v7iHkyW+8rL3b6YQhN0=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Maxime Ripard <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBmaWVsZHMgb2Yga29tZWRhX2RydiBtZW1iZXJzIHdpbGwgYmUgdXNlZnVsIHZlcnkgZWFy
bHkKaW4gcHJvYmUgY29kZSwgc28gbWFrZSBzdXJlIGFuIGluc3RhbmNlIGlzIGF2YWlsYWJsZS4K
ClNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNv
bT4KLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jICAgfCAz
MCArKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kcnYuYwppbmRleCA2NjAxODFiZGMwMDguLjllZDI1ZmZlMGUyMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKQEAgLTMyLDIy
ICszMiwxNSBAQCBzdGF0aWMgdm9pZCBrb21lZGFfdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikK
IAlpZiAoIW1kcnYpCiAJCXJldHVybjsKIAotCWtvbWVkYV9rbXNfZmluaShtZHJ2LT5rbXMpOwot
CWtvbWVkYV9kZXZfZmluaShtZHJ2LT5tZGV2KTsKLQotCWRldl9zZXRfZHJ2ZGF0YShkZXYsIE5V
TEwpOwotCWRldm1fa2ZyZWUoZGV2LCBtZHJ2KTsKKwlrb21lZGFfa21zX2ZpbmkoJm1kcnYtPmtt
cyk7CisJa29tZWRhX2Rldl9maW5pKCZtZHJ2LT5tZGV2KTsKIH0KIAogc3RhdGljIGludCBrb21l
ZGFfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IGtvbWVkYV9kcnYgKm1kcnY7
CisJc3RydWN0IGtvbWVkYV9kcnYgKm1kcnYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlpbnQg
ZXJyOwogCi0JbWRydiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbWRydiksIEdGUF9LRVJO
RUwpOwotCWlmICghbWRydikKLQkJcmV0dXJuIC1FTk9NRU07Ci0KIAllcnIgPSBrb21lZGFfZGV2
X2luaXQoJm1kcnYtPm1kZXYsIGRldik7CiAJaWYgKGVycikKIAkJZ290byBmcmVlX21kcnY7CkBA
IC01Niw4ICs0OSw2IEBAIHN0YXRpYyBpbnQga29tZWRhX2JpbmQoc3RydWN0IGRldmljZSAqZGV2
KQogCWlmIChlcnIpCiAJCWdvdG8gZmluaV9tZGV2OwogCi0JZGV2X3NldF9kcnZkYXRhKGRldiwg
bWRydik7Ci0KIAlyZXR1cm4gMDsKIAogZmluaV9tZGV2OgpAQCAtOTcsMTAgKzg4LDE1IEBAIHN0
YXRpYyBpbnQga29tZWRhX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgY29tcG9uZW50
X21hdGNoICptYXRjaCA9IE5VTEw7CiAJc3RydWN0IGRldmljZV9ub2RlICpjaGlsZDsKKwlzdHJ1
Y3Qga29tZWRhX2RydiAqbWRydjsKIAogCWlmICghZGV2LT5vZl9ub2RlKQogCQlyZXR1cm4gLUVO
T0RFVjsKIAorCW1kcnYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKm1kcnYpLCBHRlBfS0VS
TkVMKTsKKwlpZiAoIW1kcnYpCisJCXJldHVybiAtRU5PTUVNOworCiAJZm9yX2VhY2hfYXZhaWxh
YmxlX2NoaWxkX29mX25vZGUoZGV2LT5vZl9ub2RlLCBjaGlsZCkgewogCQlpZiAob2Zfbm9kZV9j
bXAoY2hpbGQtPm5hbWUsICJwaXBlbGluZSIpICE9IDApCiAJCQljb250aW51ZTsKQEAgLTExMCwx
MiArMTA2LDIwIEBAIHN0YXRpYyBpbnQga29tZWRhX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWtvbWVkYV9hZGRfc2xhdmUoZGV2LCAmbWF0Y2gsIGNoaWxk
LCBLT01FREFfT0ZfUE9SVF9PVVRQVVQsIDEpOwogCX0KIAorCWRldl9zZXRfZHJ2ZGF0YShkZXYs
IG1kcnYpOworCiAJcmV0dXJuIGNvbXBvbmVudF9tYXN0ZXJfYWRkX3dpdGhfbWF0Y2goZGV2LCAm
a29tZWRhX21hc3Rlcl9vcHMsIG1hdGNoKTsKIH0KIAogc3RhdGljIGludCBrb21lZGFfcGxhdGZv
cm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0JY29tcG9uZW50X21h
c3Rlcl9kZWwoJnBkZXYtPmRldiwgJmtvbWVkYV9tYXN0ZXJfb3BzKTsKKwlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2OworCXN0cnVjdCBrb21lZGFfZHJ2ICptZHJ2ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7CisKKwljb21wb25lbnRfbWFzdGVyX2RlbChkZXYsICZrb21lZGFfbWFzdGVy
X29wcyk7CisKKwlkZXZfc2V0X2RydmRhdGEoZGV2LCBOVUxMKTsKKwlkZXZtX2tmcmVlKGRldiwg
bWRydik7CiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
