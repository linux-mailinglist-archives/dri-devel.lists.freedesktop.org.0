Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB43A967F7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 19:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2A6E83A;
	Tue, 20 Aug 2019 17:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598F66E83A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 17:46:41 +0000 (UTC)
Received: from VE1PR08CA0016.eurprd08.prod.outlook.com (2603:10a6:803:104::29)
 by DB6PR0802MB2597.eurprd08.prod.outlook.com (2603:10a6:4:99::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 17:46:36 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by VE1PR08CA0016.outlook.office365.com
 (2603:10a6:803:104::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 17:46:36 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 17:46:35 +0000
Received: ("Tessian outbound 578a71fe5eaa:v26");
 Tue, 20 Aug 2019 17:46:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e106def2ec4df2b
X-CR-MTA-TID: 64aa7808
Received: from be28f872337c.1 (cr-mta-lb-1.cr-mta-net [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB360F74-5088-45AF-ADE2-1A366B85D7F7.1; 
 Tue, 20 Aug 2019 17:46:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be28f872337c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 20 Aug 2019 17:46:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSY6q4nUenKmmLmzH8i7vj+8QN/M+GMH+wgJIWViLnOIzOos73cSYglA4SByAcAFak8osNKptunCfS7tyUWgfAwymZxdJm/sp9oAULay9f/GCOI8tkEPg4tf0Ejt/1CDEGKiuvGaAQQAB6nQGJFrDSRnXuEteie1GvoGBjbN+DXVW8pjClnGeO4hkiqjSLkVFL6vIYibGiOixXMIJaz/9ZlYV0n0C/C8ANQYlpVNOpCG/XFSYqCbI2qgq36u/cS7OwoOQOvrH+5zYga2VmivVUGIvsq2PCqVmj+19QG1DQ0kKUTBZk8h16kZlhxzq4H5jv+dAsFS2Wzrsd0fAoOUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeAqChYb+xMSB36Is9YHtIowRWMUwlMz/dz4dVsxAb0=;
 b=mMtTOzUBTwfvjbuYPUqb+kjMYc5wELqnj5N1Q1F4i8aLsiTatgO2wL5u0UlgNMpVw3wuBEqfIk2uwSjpRVIv1DBUGMC610H5gNJqnlVR0MyGaGGko6PHCGymABdhtkUIWD1zfQ28pI8M5b105CbrQEqjz41OZaq02Rh5Rr0ZWE95KhSow7Ql78Y13SnOuSPrbcSQjcmYO1pXQpzVi/6QXymhLmG9nSGxrQBUkqqRWGsGJ5a3zezg8EuZvK9Z71UdltBsWrqZQ4wRr59bBWO/cnlY5jDa40qIm5lNifjP8jODw6Ns+tIk040KrgBfJfbrGw44rgDsbJr9d1vdtwQCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB4065.eurprd08.prod.outlook.com (20.178.119.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 17:46:20 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 17:46:20 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Brian Starkey <Brian.Starkey@arm.com>, "malidp@foss.arm.com"
 <malidp@foss.arm.com>, "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/komeda: Reordered the komeda's de-init functions
Thread-Topic: [PATCH] drm/komeda: Reordered the komeda's de-init functions
Thread-Index: AQHVV38sxxLTSIs2FkGlnIkeXiN2Eg==
Date: Tue, 20 Aug 2019 17:46:19 +0000
Message-ID: <20190820174606.1133-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::36) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 731832bf-a7b0-46a1-ad6d-08d72596585b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4065; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB4065:|DB6PR0802MB2597:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB259727B9BA260EFFCB7DD88BE4AB0@DB6PR0802MB2597.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:57;OLM:57;
x-forefront-prvs: 013568035E
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(189003)(199004)(4326008)(2906002)(50226002)(7736002)(305945005)(71190400001)(71200400001)(36756003)(99286004)(256004)(14444005)(5024004)(8936002)(8676002)(81156014)(81166006)(6512007)(66446008)(64756008)(66556008)(66476007)(3846002)(6116002)(53936002)(1076003)(25786009)(110136005)(66946007)(86362001)(14454004)(52116002)(2201001)(316002)(2501003)(26005)(186003)(66066001)(44832011)(486006)(476003)(2616005)(5660300002)(6436002)(102836004)(6506007)(386003)(6486002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4065;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: qUxw3S9AZVLxbjMIFpTPNC+daCu3BvN0kahoiHD7KTsGx2AyqR/L7kzAqfF/qOahw0dEoViLzNoUQ83jYoKZEvnaH0CgGsLtDm04OWKcarpvwSXyltACh1mFft4KTGtG8zA9KjaOSVFWNlSj6wK44FHFGeSewfZrxgxyNnvyvMK6mZhJtauNpcQzHcHha8+mh9M3/z/fjzAvpW38SThIQU3XmCRIUNepWrJR5nNPQgtebO68/hk4KkvWE6cXxHl3e9yfW9QVCPQZBFIR4LuRMg5ghdLAz9jHp+yb3UP/qLjCrgY8QCwj28yOLJYLCHnt3i6qzTaHDmylMp414+HDhljbPk9Wj2uZWLts/Vf888FaC564VrBYq6UBaEDC+ccEbWDeBZxW8wUPCX9URhD3pXQ5dxWa30st/vKjF6kmIS0=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4065
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(199004)(189003)(47776003)(110136005)(36906005)(316002)(66066001)(5660300002)(99286004)(102836004)(2501003)(70586007)(186003)(22756006)(386003)(6506007)(23756003)(70206006)(26005)(14454004)(5024004)(1076003)(50466002)(6486002)(76130400001)(6512007)(14444005)(336012)(486006)(478600001)(86362001)(7736002)(81156014)(81166006)(50226002)(4326008)(2201001)(6116002)(3846002)(63350400001)(63370400001)(8936002)(8746002)(476003)(356004)(25786009)(126002)(305945005)(8676002)(2906002)(26826003)(2616005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2597;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7e3e3f1b-5373-4d10-f0d2-08d725964f07
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR0802MB2597; 
NoDisclaimer: True
X-Forefront-PRVS: 013568035E
X-Microsoft-Antispam-Message-Info: sT7uJd9wtA1L0Jj5Ig/C0Lvu61xZ9achs1yT6KJqtHU+P0vTlhbxAfaIG0kqXR7ugbXRcWYcVIicQE57bMz75PQQMDLZy3aD8283RjA71hMbYOjWbjpMDdwuvtGa0zZ1h5DZt4kOI0qNRG0tiG980bOpnzGfnv3A4b7LlN5KhVDHpDBAh2j+HxGp8g5S5p/lG14DJ5X9yzRUBmer7ovxtxcscK/9EuY8hBjBXQDXXurK++1xwq1W6f5Uxh4GeEvCzj71/erpJ4y4M7zy7PlykleFuyEJvbL8+OlyeLJbSWWjTorf1Nfb+Ok8mvX5da4ZuuRKpL2BbKrwzC4iDyxTz8v3cMr7VfMd7+Xy6XFKmpDnRhZEck2xlnAMXL8fDFHp/7mu117jBgcDSjlbEKatLwRl6PcG4giO/9h7q9jisIM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 17:46:35.2688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 731832bf-a7b0-46a1-ad6d-08d72596585b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2597
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeAqChYb+xMSB36Is9YHtIowRWMUwlMz/dz4dVsxAb0=;
 b=WV1dUR4SxFLwNm13EEUupx+8Jl4JGJWzh8y3oi5MmHmI0m7v7C8quVPRhD4Fr/P+D1mrj/LLX4FY2pTx4vbfb4YXH6dfLKqrHln+hfvZc98356dQzf20kmRn9CO09SMNWsKhi0G5sgBXOYGDa6de43ggTigMEK6BIdkZuNV4/qw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeAqChYb+xMSB36Is9YHtIowRWMUwlMz/dz4dVsxAb0=;
 b=WV1dUR4SxFLwNm13EEUupx+8Jl4JGJWzh8y3oi5MmHmI0m7v7C8quVPRhD4Fr/P+D1mrj/LLX4FY2pTx4vbfb4YXH6dfLKqrHln+hfvZc98356dQzf20kmRn9CO09SMNWsKhi0G5sgBXOYGDa6de43ggTigMEK6BIdkZuNV4/qw=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRlLWluaXQgcm91dGluZSBzaG91bGQgYmUgZG9pbmcgdGhlIGZvbGxvd2luZyBpbiBvcmRl
cjotCjEuIFVucmVnaXN0ZXIgdGhlIGRybSBkZXZpY2UKMi4gU2h1dCBkb3duIHRoZSBjcnRjcyAt
IGZhaWxpbmcgdG8gZG8gdGhpcyBtaWdodCBjYXVzZSBhIGNvbm5lY3RvciBsZWFrYWdlClNlZSB0
aGUgJ2NvbW1pdCAxMDljNGQxOGU1NzQgKCJkcm0vYXJtL21hbGlkcDogRW5zdXJlIHRoYXQgdGhl
IGNydGNzIGFyZQpzaHV0ZG93biBiZWZvcmUgcmVtb3ZpbmcgYW55IGVuY29kZXIvY29ubmVjdG9y
IiknCjMuIERpc2FibGUgdGhlIGludGVycnVwdHMKNC4gVW5iaW5kIHRoZSBjb21wb25lbnRzCjUu
IEZyZWUgdXAgRFJNIG1vZGVfY29uZmlnIGluZm8KClNpZ25lZC1vZmYtYnk6IEF5YW4gS3VtYXIg
SGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgotLS0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMgICB8IDIwICsrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKaW5kZXggODkxOTFhNTU1Yzg0
Li5lMjE5ZDFiNjcxMDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2ttcy5jCkBAIC0xMyw2ICsxMyw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9mYl9o
ZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9wcm9i
ZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2lycS5oPgogI2luY2x1ZGUgPGRybS9kcm1f
dmJsYW5rLmg+CiAKQEAgLTMwNCwyNCArMzA1LDMwIEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAq
a29tZWRhX2ttc19hdHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiAJCQkgICAgICAga29t
ZWRhX2ttc19pcnFfaGFuZGxlciwgSVJRRl9TSEFSRUQsCiAJCQkgICAgICAgZHJtLT5kcml2ZXIt
Pm5hbWUsIGRybSk7CiAJaWYgKGVycikKLQkJZ290byBjbGVhbnVwX21vZGVfY29uZmlnOworCQln
b3RvIGZyZWVfY29tcG9uZW50X2JpbmRpbmc7CiAKIAllcnIgPSBtZGV2LT5mdW5jcy0+ZW5hYmxl
X2lycShtZGV2KTsKIAlpZiAoZXJyKQotCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7CisJCWdv
dG8gZnJlZV9jb21wb25lbnRfYmluZGluZzsKIAogCWRybS0+aXJxX2VuYWJsZWQgPSB0cnVlOwog
CiAJZXJyID0gZHJtX2Rldl9yZWdpc3Rlcihkcm0sIDApOwogCWlmIChlcnIpCi0JCWdvdG8gY2xl
YW51cF9tb2RlX2NvbmZpZzsKKwkJZ290byBmcmVlX2ludGVycnVwdHM7CiAKIAlyZXR1cm4ga21z
OwogCi1jbGVhbnVwX21vZGVfY29uZmlnOgorZnJlZV9pbnRlcnJ1cHRzOgogCWRybS0+aXJxX2Vu
YWJsZWQgPSBmYWxzZTsKKwltZGV2LT5mdW5jcy0+ZGlzYWJsZV9pcnEobWRldik7CitmcmVlX2Nv
bXBvbmVudF9iaW5kaW5nOgorCWNvbXBvbmVudF91bmJpbmRfYWxsKG1kZXYtPmRldiwgZHJtKTsK
K2NsZWFudXBfbW9kZV9jb25maWc6CiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKIAlr
b21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7CisJZHJtLT5kZXZfcHJpdmF0ZSA9
IE5VTEw7CisJZHJtX2Rldl9wdXQoZHJtKTsKIGZyZWVfa21zOgogCWtmcmVlKGttcyk7CiAJcmV0
dXJuIEVSUl9QVFIoZXJyKTsKQEAgLTMzMiwxMiArMzM5LDEzIEBAIHZvaWQga29tZWRhX2ttc19k
ZXRhY2goc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMpCiAJc3RydWN0IGRybV9kZXZpY2UgKmRy
bSA9ICZrbXMtPmJhc2U7CiAJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBkcm0tPmRldl9wcml2
YXRlOwogCisJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7CisJZHJtX2F0b21pY19oZWxwZXJfc2h1
dGRvd24oZHJtKTsKIAlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7CiAJbWRldi0+ZnVuY3MtPmRp
c2FibGVfaXJxKG1kZXYpOwotCWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOwogCWNvbXBvbmVudF91
bmJpbmRfYWxsKG1kZXYtPmRldiwgZHJtKTsKLQlrb21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9v
YmpzKGttcyk7CiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKKwlrb21lZGFfa21zX2Ns
ZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7CiAJZHJtLT5kZXZfcHJpdmF0ZSA9IE5VTEw7CiAJZHJt
X2Rldl9wdXQoZHJtKTsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
