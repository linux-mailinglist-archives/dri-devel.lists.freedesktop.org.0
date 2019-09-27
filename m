Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B2C00AD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 10:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC936EEA4;
	Fri, 27 Sep 2019 08:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481DF6EEA4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 08:09:15 +0000 (UTC)
Received: from VI1PR08CA0107.eurprd08.prod.outlook.com (2603:10a6:800:d3::33)
 by AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Fri, 27 Sep
 2019 08:09:12 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0107.outlook.office365.com
 (2603:10a6:800:d3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Fri, 27 Sep 2019 08:09:11 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 27 Sep 2019 08:09:10 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Fri, 27 Sep 2019 08:09:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0bfc9e9ded52eff4
X-CR-MTA-TID: 64aa7808
Received: from 482ea364ef6e.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABC011FB-8A4F-4DB7-90BE-0183F839DC62.1; 
 Fri, 27 Sep 2019 08:09:00 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 482ea364ef6e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Sep 2019 08:09:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9DhLeNi3lpOdDOlRQ0MFdCTKazkU94uKf8TUwF5yAKMf4RYZWzQ6ImKdbkG6U7HeytMI92tm1jSIshs4wE/Dn6vdSQee437GnJQD41NseIcZp2T9o2xeernoO3C5ZXzNUhrdVM7+8YbgNGNyysbt6fnfLNqAF/bsd7iOFj1FhWkNWb5WEd3rAH2gt8J//jmy6RQCrW35HxiN6U9VcGROczyYTZbpOVTHtLI6qrdZC/NnQSzLtZiME/l22JAWP7ZdA/vM6jtgA/7h9VQS0l1Cucofvc2idrXUUVnPKRU+M46ajGj4tCm6KduNq74+4skstpdrPs/Jff+GdlBXK78Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awzzyHw/0QSg+Qbj/bMWYl8B/+n5C9OdQ3BaY30ZcUs=;
 b=Zj/dmbpmcIPiUhVz/vdYny8CjLA8387YXKY4ZVLiBmLINMiIQeKxbfc7szQQQGmvDBMcuf61vpwHoh0PJMlY+XURvQyh0KrddSYERNl5M8yxgmDWTwMSecxMOEHEwyp1hAhQN+g1VYtPv/zAuQ7XVBMi+o8RnLzs2XqgPKF7QodRoBy5UDvPR1dfOM62IPm4+3smx7/xwhdLb4mXfeGSHRPP2goEWze1Brxike55XYnnWwVSAlgS5/ZNzRVnpEiuP76OoiCpkc7pH+UE79RBQEOgAb/rgQCJONFh+/s5fc7TZx+an6UiF7p5gftT+YcrAXHI54YR2g+UL/JB1t1b0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5087.eurprd08.prod.outlook.com (10.255.159.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Fri, 27 Sep 2019 08:08:59 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 08:08:59 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: drm/komeda: prevent memory leak in komeda_wb_connector_add
Thread-Topic: drm/komeda: prevent memory leak in komeda_wb_connector_add
Thread-Index: AQHVdQrQ/2qKdtcMBE6ojSvUeSYtTg==
Date: Fri, 27 Sep 2019 08:08:59 +0000
Message-ID: <20190927080852.GA25223@jamwan02-TSP300>
References: <20190925043031.32308-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190925043031.32308-1-navid.emamdoost@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0044.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9dd16cdb-5228-4224-1cc4-08d74321fa04
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB5087; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5087:|VE1PR08MB5087:|AM0PR08MB3972:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB397221BD292ECBB34181A513B3810@AM0PR08MB3972.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0173C6D4D5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(136003)(346002)(396003)(376002)(189003)(199004)(446003)(5660300002)(66476007)(478600001)(54906003)(58126008)(316002)(66556008)(81166006)(99286004)(66446008)(55236004)(64756008)(8936002)(81156014)(52116002)(2906002)(102836004)(229853002)(3846002)(6116002)(33716001)(14444005)(6916009)(66946007)(76176011)(25786009)(6506007)(386003)(256004)(26005)(186003)(33656002)(6512007)(8676002)(1076003)(9686003)(4326008)(486006)(6436002)(305945005)(86362001)(476003)(7736002)(6246003)(6486002)(71190400001)(71200400001)(66066001)(11346002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5087;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: mplRSBmQFRWDuSkEPtLpJhO/VBH6IFdZ77khwvSrDARPfa4m4Db6srWxRb+16mkzFWbBMrV6BJWYbwc5rglrJuOqN+fLHixXWZ+tUcOunJ3fl8cib+Yqnw9Feo/Np0CBupi0qvEGrT9lUQ1uXMoE82C0uJ8kxNz2AIH9jEVW6iahBJ64dRJYq+sAnOjuIb010Giq+ScoHDjs3GBz8wRYGr0ltPQlIZrenCLK683vgUOYZML3xxWbBJhHF3r2AABfzy8vdLxlc80TSDGaPJGk92VU9++Uxsns804v3hqxuc7ZSQ7t0lr0eZf5rNkFkTE+5uSNBwYX8+9Bp6ArwMAxamH/FoaWIVvtPZkCaBRNBxCddMKAtxqSNrHVdGJsCekWCTn0wK6Op5FgMD468BSWPrDRBzBXTgIgTDiq3HOzpH8=
Content-ID: <9AB2ADE2338123448D05C93BCCB5DEE1@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5087
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(6116002)(1076003)(6486002)(5660300002)(81156014)(356004)(76176011)(446003)(102836004)(63350400001)(126002)(76130400001)(11346002)(486006)(70586007)(70206006)(476003)(336012)(46406003)(14454004)(97756001)(26826003)(316002)(25786009)(54906003)(26005)(186003)(8746002)(99286004)(58126008)(36906005)(478600001)(386003)(8676002)(6506007)(14444005)(33656002)(7736002)(81166006)(86362001)(8936002)(305945005)(22756006)(4326008)(6862004)(33716001)(6246003)(66066001)(50466002)(9686003)(3846002)(47776003)(2906002)(6512007)(23726003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3972;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 75b8f8f1-0c86-4df0-e09a-08d74321f35e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3972; 
NoDisclaimer: True
X-Forefront-PRVS: 0173C6D4D5
X-Microsoft-Antispam-Message-Info: zplDUIoQOopx7ytigc/8FgIKn1PMViqercqlAoydheki8RzlND5/VcbBZw+yCIkdp19AUX5Bn7eqHr4o2okJsOHQ3I9bnUYOoK2Ri5qVilatCWJa8ab8lCzwi14zSIQiBupxmDrGEGBAau/alYWNPFNXk0S8FY/+Mv6FXV+IyFzHY59K1KNHOvoZlLFht9ldFhWEeh1n7Da0956skLYPusia/wkZiif4HlxXiREwJ3sjCM3A951q8ddM0HcdsO9mjRnhceqBj+wW2hhTqQTqEcX3cGh4N5+nyIkUgNbn32kGQMyXfZfA88wKxhV+EaSjiHGaScVVrvqe8Vx68MCzkutxhaF6xUQOmkPFLGZtJlLFzT11KQiDTt8wHnnWIjRDwTaj0e22KpbccNGZO3D8rad+CjAKaZPtPGX8niMfnFM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2019 08:09:10.3199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd16cdb-5228-4224-1cc4-08d74321fa04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3972
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awzzyHw/0QSg+Qbj/bMWYl8B/+n5C9OdQ3BaY30ZcUs=;
 b=1BHTDRRYQclVxxbmqdUJq79dZvU1xkhUl0yHU1YjcExKFmw3oHyqE5Gor4HC4Zmf1FB+GBUjLm+8ECMfjp60I6LbcEwt2RGl//PLUC+LTInak7DoJoVDMOuTUbWzdgipMAfA5AoMq62+KVDkP9a3OkLFj5qI3RbPbsw8DCBPpI8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awzzyHw/0QSg+Qbj/bMWYl8B/+n5C9OdQ3BaY30ZcUs=;
 b=1BHTDRRYQclVxxbmqdUJq79dZvU1xkhUl0yHU1YjcExKFmw3oHyqE5Gor4HC4Zmf1FB+GBUjLm+8ECMfjp60I6LbcEwt2RGl//PLUC+LTInak7DoJoVDMOuTUbWzdgipMAfA5AoMq62+KVDkP9a3OkLFj5qI3RbPbsw8DCBPpI8=
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
KwkJa2ZyZWUoa3diX2Nvbm4pOwo+ICAJCXJldHVybiBlcnI7Cj4gKwl9CgpUaGFuayB5b3UgZm9y
IHRoZSBmaXguCgpXaWxsIHB1c2ggaXQgdG8gZHJtLW1pc2MtZml4ZXMKClJldmlld2VkLWJ5OiBK
YW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFy
bS5jb20+Cgo+ICAKPiAgCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmd2JfY29ubi0+YmFzZSwg
JmtvbWVkYV93Yl9jb25uX2hlbHBlcl9mdW5jcyk7Cj4gIApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
