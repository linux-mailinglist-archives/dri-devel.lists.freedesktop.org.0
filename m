Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C259DBD7FF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 07:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9B26EB2A;
	Wed, 25 Sep 2019 05:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50068.outbound.protection.outlook.com [40.107.5.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68016EB2A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 05:59:33 +0000 (UTC)
Received: from AM4PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:205:2::16)
 by AM0PR08MB4049.eurprd08.prod.outlook.com (2603:10a6:208:12c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Wed, 25 Sep
 2019 05:59:30 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by AM4PR08CA0045.outlook.office365.com
 (2603:10a6:205:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 25 Sep 2019 05:59:30 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Wed, 25 Sep 2019 05:59:27 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Wed, 25 Sep 2019 05:59:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 388c28d4e391fd87
X-CR-MTA-TID: 64aa7808
Received: from dce0bc606223.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02F3B035-E903-4083-8DAB-E0D89493FA97.1; 
 Wed, 25 Sep 2019 05:59:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dce0bc606223.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Sep 2019 05:59:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9BCPYMnm1fibs48XEBEXtDUXb33lt55PiwjjvmoGATIDvFnehvG0pVooR71HjYudDmh6JomnJfNPPcgUmWYoeis0DyLAfrRctIGuffLJPeHWk2cQp9VVQE5ITkXwhiM/y59UuN/AT4duTy4MH9MCpWNrIgpE8y5IOFxWwTnKR5ByrTRBJUfZWG4Fpu347CFvVvfDKpjNXQl1DWKD0sOyA1tgHFD6KZTnUYe+/Y0qzY0PsIrgFOrkHVvs2LO46gecrbCvl4qxdHskj9AWwpFVj79FUbMoR7BwfWgDihg7RDMD/X4ah85rnLtKy5N8KuHxUw61sfXGLd4H+CauUtOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4/w0pL5IokLsy5MZI9XnBSldWZqNoC5W2AIqRQNc6U=;
 b=lcyxpV7+1Q2643jCY4bMRMopU0SO0XU5xOm6Ad+/a9kcnmOjd2TfbCNR6isZGalQ/97qD1DFvKrW5+Avbp7MG5ak3Hi+Og75IywYO79TBTJqt+Anam6wh3VB2EpYlGF/HxB+FLxRo6DCDVV0vYm19RFxasW1yxdxmimOJB6u0ymaZBPR9QlIP5VGXiH7kY6HcljHUMhA6j/gPM7QMQOOYudTCm3pn7TGUrbGbdipkPbLXGi9hPuIwsw3byviF4nbLsJqeIuoY+FGoUyQMsgxQrgSGye0mwG9KwZfpASxk6syU1XZpE/EQ04yuL/Uq6RrEYWTyx1Eb+pmufXKZ6iVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4829.eurprd08.prod.outlook.com (10.255.113.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 05:59:19 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 05:59:19 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/komeda: prevent memory leak in komeda_wb_connector_add
Thread-Topic: [PATCH] drm/komeda: prevent memory leak in
 komeda_wb_connector_add
Thread-Index: AQHVc1n//vysXyMGDEaxrhE/kSCsmac75gEA
Date: Wed, 25 Sep 2019 05:59:19 +0000
Message-ID: <20190925055912.GA27846@jamwan02-TSP300>
References: <20190925043031.32308-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190925043031.32308-1-navid.emamdoost@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0023.apcprd06.prod.outlook.com
 (2603:1096:202:2e::35) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3ca5cd05-a8b9-4d5f-6889-08d7417d8651
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4829; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4829:|VE1PR08MB4829:|AM0PR08MB4049:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4049BD430AD15DE2597F33C2B3870@AM0PR08MB4049.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(189003)(199004)(229853002)(76176011)(9686003)(52116002)(11346002)(6512007)(8676002)(81166006)(6436002)(14454004)(3846002)(6116002)(25786009)(99286004)(486006)(256004)(55236004)(446003)(476003)(14444005)(33716001)(81156014)(102836004)(386003)(6506007)(8936002)(64756008)(66446008)(26005)(66476007)(186003)(6246003)(66556008)(6486002)(66946007)(5660300002)(478600001)(305945005)(58126008)(86362001)(7736002)(54906003)(33656002)(316002)(66066001)(2906002)(6916009)(4326008)(71200400001)(71190400001)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4829;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: oQiPdJDVvAQ3+raflbzjJOOD9f8nBPaVLgu2DYcwPxzytfhbrTK8eksX0b2V1xDX+bopQe6IhC6F7+1lCqOfypJu/H/HvthpiTPDTk+HiPTVgS4Af/uDuF7BHMHaACWeZ6/Ch7AuCH92rd38pYr9OjmyEr9WRKokbgt9xpv9MP0YIzCVSE/9dwqxl3CwU7nlmm54zFd4+VerN25QUo0WgLY7BosZeqKNhUN0LkKmwjNHTFC0Z7Luz4uNRsxlGzw+qa6JlCIUeCcF1TKKqaOF2y+Kh3Zl8ghgHR38t2OtPuK0VIpix3GangcgaLDRptrg2eprWUdydIFi1dwCQiWQcyYzdtrLtqsEYTs6U0XFqZmt7BIBNV/VgF9MIrNjY+V8f1HOYkCjJG59By4VfEStyzgq/cp1nr3c0aaS8rhCXO8=
Content-ID: <5AA98EFFC17CAA419B3A4DEC6035C371@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4829
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(376002)(136003)(346002)(396003)(189003)(199004)(14444005)(229853002)(478600001)(50466002)(26005)(476003)(6506007)(66066001)(486006)(102836004)(23726003)(47776003)(2906002)(22756006)(76130400001)(316002)(6116002)(86362001)(5660300002)(336012)(186003)(99286004)(14454004)(386003)(36906005)(126002)(6246003)(305945005)(7736002)(8676002)(33656002)(76176011)(97756001)(6862004)(58126008)(26826003)(33716001)(11346002)(1076003)(63350400001)(3846002)(6512007)(81166006)(70586007)(25786009)(70206006)(6486002)(46406003)(54906003)(8746002)(81156014)(356004)(9686003)(8936002)(446003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4049;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 58d60162-fcbb-485f-7d2c-08d7417d80fd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4049; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: TCyPfVH+k1LlJwCLIgSATbs5ywbnVXc9VQQRb7vO+jUgySDdf1kb7zHeuJKYGtoqVdXZOEFNiabdzw2eaEeANZ6Oka6FLRsLd94UFdHNbIqUSwTL0mMZGkm7K6ZDk+KOvdWmULUaHI91oACRVR7wU8ncjtwUiY5zlN/yQtRp+r1jvVV1QTReirCabM2+0JvB0WGnSrwlYIdcp+YRotCLsGtVQ2Eidi3aqal9xqptaHEjm4f3qSoa1NdjIKz2M08skDBrxSfFkV6kj3OtM/13L0EFA6CZFRvPBP2z+hUfqg5I2/xauu5ZO53qRMwyjES34RhjqvpuQclKNhKlKcqxR6MefT5Hqn/sqp8FuMY79sdSj40/k2hSHbvf2CzQG7x6XAG0LXvcN/909gEuY0jm5okUaqDTMFKS0YCY5S9PXuw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 05:59:27.5353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca5cd05-a8b9-4d5f-6889-08d7417d8651
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4049
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4/w0pL5IokLsy5MZI9XnBSldWZqNoC5W2AIqRQNc6U=;
 b=Hv/iJ2r9E64mjWdCDZ0Gr4Ph2k1fgc0xwfNFRfEvaqF0K1re8Z+or/L1dlYd/TM0FjVfFh+liALDOQVmc6aKBOlGk5og89c/VRJGBbUgcqdYsY68mGG80zy0yZur3AytVFP2KhyLmQc5JQBLpkJJgfXem3SHN7eZq31TLHvcMmQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4/w0pL5IokLsy5MZI9XnBSldWZqNoC5W2AIqRQNc6U=;
 b=Hv/iJ2r9E64mjWdCDZ0Gr4Ph2k1fgc0xwfNFRfEvaqF0K1re8Z+or/L1dlYd/TM0FjVfFh+liALDOQVmc6aKBOlGk5og89c/VRJGBbUgcqdYsY68mGG80zy0yZur3AytVFP2KhyLmQc5JQBLpkJJgfXem3SHN7eZq31TLHvcMmQ=
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
Cc: David Airlie <airlied@linux.ie>, "kjlu@umn.edu" <kjlu@umn.edu>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>, "smccaman@umn.edu" <smccaman@umn.edu>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMTE6MzA6MzBQTSAtMDUwMCwgTmF2aWQgRW1hbWRvb3N0
IHdyb3RlOgo+IEluIGtvbWVkYV93Yl9jb25uZWN0b3JfYWRkIGlmIGRybV93cml0ZWJhY2tfY29u
bmVjdG9yX2luaXQgZmFpbHMgdGhlCj4gYWxsb2NhdGVkIG1lbW9yeSBmb3Iga3diX2Nvbm4gc2hv
dWxkIGJlIHJlbGVhc2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2
aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4g
aW5kZXggMjg1MWNhYzk0ZDg2Li43NTEzM2Y5NjdmZGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+
IEBAIC0xNjYsOCArMTY2LDEwIEBAIHN0YXRpYyBpbnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQo
c3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gIAkJCQkJICAgJmtvbWVkYV93Yl9lbmNvZGVy
X2hlbHBlcl9mdW5jcywKPiAgCQkJCQkgICBmb3JtYXRzLCBuX2Zvcm1hdHMpOwo+ICAJa29tZWRh
X3B1dF9mb3VyY2NfbGlzdChmb3JtYXRzKTsKPiAtCWlmIChlcnIpCj4gKwlpZiAoZXJyKSB7Cj4g
KwkJa2ZyZWUoa3diX2Nvbm4pOwo+ICAJCXJldHVybiBlcnI7Cj4gKwl9CgpIaSBOYXZpZDoKClRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KCj4gIAo+ICAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yl9jb25uLT5iYXNlLCAma29tZWRhX3diX2Nvbm5faGVs
cGVyX2Z1bmNzKTsKPiAgCj4gLS0gCj4gMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
