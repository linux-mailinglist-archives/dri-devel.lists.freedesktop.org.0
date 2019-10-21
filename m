Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F84DF38B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 18:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D996E18F;
	Mon, 21 Oct 2019 16:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078E46E188
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 16:47:48 +0000 (UTC)
Received: from VI1PR08CA0259.eurprd08.prod.outlook.com (2603:10a6:803:dc::32)
 by AM6PR08MB4487.eurprd08.prod.outlook.com (2603:10a6:20b:74::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Mon, 21 Oct
 2019 16:47:44 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0259.outlook.office365.com
 (2603:10a6:803:dc::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 16:47:43 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 21 Oct 2019 16:47:42 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Mon, 21 Oct 2019 16:47:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9a25194a78a757f
X-CR-MTA-TID: 64aa7808
Received: from 0883c3b38210.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD9AD2BC-D4F5-4AA8-AE85-95C16E356AB9.1; 
 Mon, 21 Oct 2019 16:47:37 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0883c3b38210.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 16:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dh8A34tH++BdlsbHp71S4ooIsjM7Do4unGUK9U3vEFHYTp0J/6DF4u/q758XpDRZN9s7QfIkgjwXJhwbjR1HCiDLDzw9vmFhisBSNq5OSBVUl+La8cvwTA/1T4zOPVbHcEBQ0lEi/PCQp5l8gCm2EAglfqWMrLWvEHFN4px5e9/2Crt5RcBi02oTmXVfX8d35AFWvXpiYqJ2LFbs3VUcKzKNJgXzaGoxnw9FSOxuIIy8aiDFPevNQS0dJyMWzPUi0wpgjKsEGKN1rrg7+wSV6qhAu7ySCFqxX6HZZycNwczrVtO5XSHDZLZuS7JdyZGskdgcyrfRnyPPn+TZBDWZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqjsYGtito0owHXQyV4kjHNN6CmmoCoNhwj27nXP6vE=;
 b=jc/ujFe27o8obaY6EgiXW/6aO6XOpchsBej1qrWEp5ZwODa8cYQOhkYfotW8KDiJiLOnH139qTQb6FSTDeghCqG/TunGYM2hoVy+fOJ56I/Rqv8jFEW5USeJ1oly0bPdPUSxBP6LWiUNlAya0jkMJhdP2CEFs1jLihYE03ghRai+mjBrUb6xZ9FD9QC8yOB+GjVop/bdQ+icuwK0uAqVhst5wv1z5ES5Te78j5pDY82h1TywOKX3+gbPMEeCC2u5jCm5sIH8u2cMwgS7kEce/iimdZDupx0aXACn3HzHohmf9+UzQeeGEFvLIrWsNsMrm+0cbiNsXOUdDd7D6+Q/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3693.eurprd08.prod.outlook.com (20.178.13.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 21 Oct 2019 16:47:35 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 16:47:35 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/komeda: add rate limiting disable to err_verbosity
Thread-Topic: [PATCH 5/5] drm/komeda: add rate limiting disable to
 err_verbosity
Thread-Index: AQHViC89H1LXrklOHUu4e/U5aAFNnw==
Date: Mon, 21 Oct 2019 16:47:35 +0000
Message-ID: <20191021164654.9642-6-mihail.atanassov@arm.com>
References: <20191021164654.9642-1-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: edd5fc5d-e665-4504-28e9-08d756466465
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3693:|VI1PR08MB3693:|AM6PR08MB4487:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44872B05A707024E6394A4098F690@AM6PR08MB4487.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(199004)(189003)(11346002)(6436002)(316002)(54906003)(256004)(8936002)(6512007)(14444005)(2501003)(71200400001)(5640700003)(71190400001)(50226002)(486006)(2906002)(446003)(6486002)(2616005)(44832011)(5660300002)(8676002)(476003)(305945005)(66066001)(36756003)(86362001)(25786009)(14454004)(186003)(478600001)(6506007)(386003)(102836004)(26005)(4326008)(2351001)(81156014)(1076003)(6116002)(3846002)(66946007)(81166006)(66556008)(52116002)(66476007)(7736002)(64756008)(66446008)(99286004)(76176011)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3693;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HLkzIMJEQxzlI9copX2NPj0yiWNa8wBN39G2iPJ9LYDFDKx3no8aPiV2lddOQ4qf0KSznQ+tIoReapEbfhW9rkAvw5Vq0rPPJwN8kx+h71IyKY5jKFXu07vJpZU388K01J8iNFhTdFfkcJOfhNfMKSVFOCO/RMwnG7md10/B9nGxm65wLLpJ0urrWMu+baCr/wLFXS1zG7JF/p/Kok3jltVYDNO3icOsx3PK26YVtXAasOPSrC+iS9RPfKQ5MRap8IYlvfhdn82AypvpxIepZhVnSpljhnEkq3NFnV9V4BQq/O97ANZ0VdPY6DYmT6D8r8Y723m9F3DYdYoU+DY15XiaS25552kSpl53J4L4ttVHNFCILA2ef5VgNp3m2boLhs9HhyBmUeV58Q/J33Jw3X8yiStOD+nYI/o8sJ6BcKaV1gv+JaMSeF9P6fHbdslF
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3693
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(189003)(199004)(6486002)(2351001)(478600001)(86362001)(26826003)(70206006)(1076003)(356004)(70586007)(76130400001)(2501003)(3846002)(6116002)(2906002)(14454004)(25786009)(6916009)(7736002)(50226002)(81156014)(8746002)(5640700003)(8936002)(81166006)(8676002)(305945005)(50466002)(5660300002)(14444005)(47776003)(54906003)(316002)(186003)(107886003)(76176011)(4326008)(99286004)(26005)(102836004)(6506007)(386003)(66066001)(22756006)(2616005)(11346002)(446003)(6512007)(126002)(476003)(486006)(23756003)(36756003)(336012)(63350400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4487;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a8b2873a-98fe-4272-17fa-08d756465ffd
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gnc0GVEdgaskReBNZF9mfiEybDcG3okxBPTyt6iOdqhLXDWc8Mk0VYRmgkIIGtos4aKN+p8SxvnYhTHgZf4qmEQAMvKVXFyK5kSjx/7Jud2UGrXjJOCO4149obHS2r4r55Fbh76ki4Ws36R9sC6IkQI2njLxRs0YCS+AZZqBV9PUf7SiWND5bCyGHzUWsJRtVCK8pe97HIOJjP5ZL8pUvrYkj7PBTdjYzteq/u5qRluL7sglp8sodQ01yW5wj0GMddWS9Hsh4Tt05f7WZ5DD84d8wfdfwrrZcrlkvCD9Pjr7Hga1twcTDCWyJZefVd6ZP+0frtIChP97PdDnnI1+SWvSOra91COpixoCxgWCw8NKGAhiNM+ReduiRgIU+/m7sxB0RMN7ydEw08qcOzVqmfkApNRZE0eMYOiT8sS4q9vBN1hUnte6/uh8x2lLI3/p
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 16:47:42.7774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edd5fc5d-e665-4504-28e9-08d756466465
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqjsYGtito0owHXQyV4kjHNN6CmmoCoNhwj27nXP6vE=;
 b=6jcl66n4LMmg2Lezx5wQs+mvEHCPf/eF10A6OrrfW70+kwdZ2q2ui/6z8C/D+3HZJG2XOGreDMkOsDS+YvqCnPBRo6NhbrzMqdFRVwzcn0q11y1qG+c6/XkP1xRqbup5QJS2MCICEKNU0x1FilPkQjneSjAcljQY0Xc37qOc2RE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqjsYGtito0owHXQyV4kjHNN6CmmoCoNhwj27nXP6vE=;
 b=6jcl66n4LMmg2Lezx5wQs+mvEHCPf/eF10A6OrrfW70+kwdZ2q2ui/6z8C/D+3HZJG2XOGreDMkOsDS+YvqCnPBRo6NhbrzMqdFRVwzcn0q11y1qG+c6/XkP1xRqbup5QJS2MCICEKNU0x1FilPkQjneSjAcljQY0Xc37qOc2RE=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBwb3NzaWJsZSB0byBnZXQgbXVsdGlwbGUgZXZlbnRzIGluIGEgc2luZ2xlIGZyYW1lL2Zs
aXAsIHNvIGFkZCBhbgpvcHRpb24gdG8gcHJpbnQgdGhlbSBhbGwuCgpTaWduZWQtb2ZmLWJ5OiBN
aWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICB8IDIgKysKIGRyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMgfCAzICsrLQogMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IGQ5ZmM5YzQ4ODU5
YS4uMTVmNTJlMzA0YzA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9kZXYuaApAQCAtMjI0LDYgKzIyNCw4IEBAIHN0cnVjdCBrb21lZGFfZGV2IHsK
ICNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9JTkZPX0VWRU5UUyBCSVQoMikKIAkvKiBEdW1wIERS
TSBzdGF0ZSBvbiBhbiBlcnJvciBvciB3YXJuaW5nIGV2ZW50LiAqLwogI2RlZmluZSBLT01FREFf
REVWX1BSSU5UX0RVTVBfU1RBVEVfT05fRVZFTlQgQklUKDgpCisJLyogRGlzYWJsZSByYXRlIGxp
bWl0aW5nIG9mIGV2ZW50IHByaW50cyAobm9ybWFsbHkgb25lIHBlciBjb21taXQpICovCisjZGVm
aW5lIEtPTUVEQV9ERVZfUFJJTlRfRElTQUJMRV9SQVRFTElNSVQgQklUKDEyKQogfTsKIAogc3Rh
dGljIGlubGluZSBib29sCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9ldmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZXZlbnQuYwppbmRleCBiZjg4NDYzYmI0ZDkuLjg2ZTMzZmVkOGE5MSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jCkBA
IC0xMTksNyArMTE5LDggQEAgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFf
ZXZlbnRzICpldnRzLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCS8qIHJlZHVjZSB0aGUgc2Ft
ZSBtc2cgcHJpbnQsIG9ubHkgcHJpbnQgdGhlIGZpcnN0IGV2dCBmb3Igb25lIGZyYW1lICovCiAJ
aWYgKGV2dHMtPmdsb2JhbCB8fCBpc19uZXdfZnJhbWUoZXZ0cykpCiAJCWVuX3ByaW50ID0gdHJ1
ZTsKLQlpZiAoIWVuX3ByaW50KQorCWlmICghKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BS
SU5UX0RJU0FCTEVfUkFURUxJTUlUKQorCSAgICAmJiAhZW5fcHJpbnQpCiAJCXJldHVybjsKIAog
CWlmIChlcnJfdmVyYm9zaXR5ICYgS09NRURBX0RFVl9QUklOVF9FUlJfRVZFTlRTKQotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
