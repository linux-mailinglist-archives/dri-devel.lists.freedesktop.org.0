Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005FD6062
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 12:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5636E24D;
	Mon, 14 Oct 2019 10:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00045.outbound.protection.outlook.com [40.107.0.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8256C6E24D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 10:39:27 +0000 (UTC)
Received: from DB7PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:5:16::20) by
 AM0PR08MB3763.eurprd08.prod.outlook.com (2603:10a6:208:109::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 14 Oct
 2019 10:39:24 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by DB7PR08CA0007.outlook.office365.com
 (2603:10a6:5:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.22 via Frontend
 Transport; Mon, 14 Oct 2019 10:39:24 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 14 Oct 2019 10:39:22 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Mon, 14 Oct 2019 10:39:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a09c42ab0b4103a
X-CR-MTA-TID: 64aa7808
Received: from 0be161cbbc76.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 696B6BF9-AD22-4001-BBF2-8C709AFDB6AD.1; 
 Mon, 14 Oct 2019 10:39:10 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0be161cbbc76.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2019 10:39:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XH3lYIK+AdgfG+wI/WBqaXn1TsfRQpFqORlxzo2XIwpqGEM3kVxWKDZvC5TNXiEWrZ3Z7InLnqWouxZoQ1CNM5MysRLGEJ+/74RNsBf0iCpk4EaBtnHWMDzMbnrQp0vyq3hyUbOCdoLc0cRNjYvNfBNb7o8GeLlkUZtlMajTwQ0N7ZAljfnGchWQn0h+FEfhIFTotqIPetkZMRbX21zX3Z5GCbq8gneyunV8C53WwDwORMGFHszBETyjIPeQsz7vZY89CflUZioUz7xrdYn4svNP4pe2/XnTJ7TdoAuFTGIsKTYQ2fxUYtAq24ORv18BggB7LIRLlVwPgJCdMOCkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8NZV1eSAwBJgjS43JUI8pJOnNSb6IlZ5O8HD3LIauA=;
 b=ZScLVlvuknhkgKzxoXq88n404AwGqzOIB7TTC4ajjVfeG7d9nwYskyB4wqpHNcCyzg+a6kGGlEHW1GuC5lQBDaoOXNBGg5Fz4ieynQqSpORfeca3Aa1xgieajg4yIDqd/LRCzat1kiQ0hVJDeVPh5Kkz0SsP8hJJ+MghGO36VoivGVtUgQxzTKaFuHDqelLDtR99DQ8MkQBIUYWNBKcEh+ihCWZ0Q0Ik/i1kUq2uyQ91tUScfXbNoyHR+uSVJ3x3FHvJ77bdhP7etv1lmtzUtWznMCUUg26xoiU5HRYMjck042ZwVgjDoSuJOKx4PeHBZWr8Iehoa0byBbrfkQrj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3038.eurprd08.prod.outlook.com (52.134.122.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Mon, 14 Oct 2019 10:39:08 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 10:39:07 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/cdAHid3tH8+UyzZeXX5YE1LKdVLBiAgAS7sICAAA99gA==
Date: Mon, 14 Oct 2019 10:39:07 +0000
Message-ID: <2848496.aPtRGPrWej@e123338-lin>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <1622787.6FTe1jSl1W@e123338-lin> <20191014094332.GA15094@jamwan02-TSP300>
In-Reply-To: <20191014094332.GA15094@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.49]
x-clientproxiedby: LO2P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::23) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cd32ccce-3200-486c-d993-08d75092c6da
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3038:|VI1PR08MB3038:|AM0PR08MB3763:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB37639B6D23CCA0AFFC75BFDB8F900@AM0PR08MB3763.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
x-forefront-prvs: 01901B3451
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(14454004)(52116002)(186003)(4326008)(386003)(478600001)(76176011)(7736002)(6636002)(102836004)(6506007)(305945005)(229853002)(71200400001)(71190400001)(6436002)(6486002)(66476007)(66446008)(86362001)(26005)(66556008)(64756008)(8676002)(54906003)(6862004)(81166006)(81156014)(25786009)(316002)(8936002)(6116002)(14444005)(256004)(66066001)(3846002)(446003)(486006)(2906002)(66946007)(5660300002)(11346002)(476003)(99286004)(6246003)(9686003)(6512007)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3038;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lIwJOPQByM5FOaYKtud+vBQkQ5QRUphgBagUNsNYk6a6RwWch3OH+fyJzlAroh6GG72Q7KM9YCBnv7lFHWlLY83rAXXsD+f7DJDwm6JaIekcOmusyqsPHrrNlPLuusfLirRFMgJZslN0fRp21VnQV+n6rN4T0zhTseCHT4rcVnK2pHbPpqsQz6/LMsQYJiQ0wfHbiEUhcTTH+CeyR6H+nu3h4QBMyBnqtYR9V6HBo7EYrnoMVr3h1N5ExJWcPinnIrPDpy86rDMgIL7hahPhhI6gXDmsiYysxhnnmnkFG/24RBgpb6Wp6BnQU/c8zqjCvhgHx6NquujJm0g43oSYlH4DrcWxU7dVFjjKqYzmMuQOcQLDxp35AudJivfDRcOWU0OAUvx8/1ubknlUbap477URd6pf7DznKJRF8oAlMX0=
Content-ID: <BD6F5598FC4AA84B847968F8A2E29CC6@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3038
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(396003)(376002)(346002)(136003)(189003)(199004)(356004)(6246003)(76130400001)(229853002)(25786009)(5660300002)(6636002)(7736002)(6862004)(4326008)(26826003)(478600001)(36906005)(97756001)(23726003)(186003)(6506007)(6116002)(3846002)(26005)(70206006)(2906002)(102836004)(70586007)(8676002)(81156014)(81166006)(99286004)(8746002)(8936002)(386003)(76176011)(14454004)(50466002)(86362001)(126002)(316002)(446003)(47776003)(9686003)(6512007)(63350400001)(336012)(14444005)(305945005)(66066001)(486006)(11346002)(476003)(46406003)(22756006)(33716001)(54906003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3763;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 839fdb88-da10-4781-c09e-08d75092bd95
NoDisclaimer: True
X-Forefront-PRVS: 01901B3451
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39Rh2eCsd8TimP84tVx1AQxgR4aRlCiRVc2+d92BjDbYX3Qve3Dfnj30u4I0L48A36HVO0Dp160rUa+ogK7vSliAfkXEfc04A3nROwToGn19nAakk/bQVPUHElwlwSdFjRtNF22ceNj3QGDpyUGnsPcDHcgAJ1bzNgla9rh0hV4Z8btFEp6oV5E549/WD0OvZ2GxKGyVoFklOP6prnMeFAvWJj685tTvSUtgQjazcOZP4a2P3o5PzAT+Rc+cxN+qgxAZpYTP8wxghdCJP6OiwUlhMD2FFCoASTH0u6Ocqdlw3o62hIzDf+XSJUCyacEyEfwz8aU9G6uB8rqRLozG43e4JQU3J4o+Xp+w9SfLR+cV0D+eckNleucx4y89EDgb5nynoIclXNq0PbDzhFACC8R/c5VROs4SxsRO1qhlHUE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 10:39:22.4890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd32ccce-3200-486c-d993-08d75092c6da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3763
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8NZV1eSAwBJgjS43JUI8pJOnNSb6IlZ5O8HD3LIauA=;
 b=GHDIR/Gbrmex1D1GzuhyZMXfqfrmXF1Y49f9+9SUWQw6S5AEFZetRya4TNyqeCwS/QdbuG/cCce6oyzGrBEzxJmIK8rpZy0YtR0B/ZHaz5fgP/jURbVyYqDLGIAwE0W7yZ3fyDNtkf5Wcljd8c9k/tJriIzEQ4Cxi8JexbJDaDU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8NZV1eSAwBJgjS43JUI8pJOnNSb6IlZ5O8HD3LIauA=;
 b=GHDIR/Gbrmex1D1GzuhyZMXfqfrmXF1Y49f9+9SUWQw6S5AEFZetRya4TNyqeCwS/QdbuG/cCce6oyzGrBEzxJmIK8rpZy0YtR0B/ZHaz5fgP/jURbVyYqDLGIAwE0W7yZ3fyDNtkf5Wcljd8c9k/tJriIzEQ4Cxi8JexbJDaDU=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCAxNCBPY3RvYmVyIDIwMTkgMTA6NDM6MzkgQlNUIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IE9uIEZyaSwgT2N0IDExLCAyMDE5IGF0IDA4
OjI2OjUzQU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBIaSBKYW1lcywKPiA+
IAo+ID4gT24gRnJpZGF5LCAxMSBPY3RvYmVyIDIwMTkgMDY6NDU6MjcgQlNUIGphbWVzIHFpYW4g
d2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBBZGQgYSBuZXcgaGVscGVy
IGZ1bmN0aW9uIGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24oKSBmb3IgZHJpdmVyIHRvCj4g
PiA+IGNvbnZlcnQgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1lbnQg
dGhhdCBzdXBwb3J0ZWQgYnkKPiA+ID4gaGFyZHdhcmUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53
YW5nQGFybS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9t
Z210LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgaW5jbHVkZS9kcm0vZHJt
X2NvbG9yX21nbXQuaCAgICAgfCAgMiArKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNl
cnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
b2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+ID4gPiBpbmRl
eCA0Y2U1YzZkOGRlOTkuLjNkNTMzZDBiNDVhZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9j
b2xvcl9tZ210LmMKPiA+ID4gQEAgLTEzMiw2ICsxMzIsMjkgQEAgdWludDMyX3QgZHJtX2NvbG9y
X2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24p
Cj4gPiA+ICB9Cj4gPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7Cj4g
PiA+IAo+ID4gPiArLyoqCj4gPiA+ICsgKiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uCj4g
PiA+ICsgKgo+ID4gPiArICogQHVzZXJfaW5wdXQ6IGlucHV0IHZhbHVlCj4gPiA+ICsgKiBAbTog
bnVtYmVyIG9mIGludGVnZXIgYml0cywgdGhlIG0gbXVzdCA8PSAzMQo+ID4gPiArICogQG46IG51
bWJlciBvZiBmcmFjdGluYWwgYml0cyB0aGUgbiBtdXN0IDw9IDMyCj4gCj4gQG06IG51bWJlciBv
ZiBpbnRlZ2VyIGJpdHMsIG9ubHkgc3VwcG9ydCBtIDw9IDMxCj4gQG46IG51bWJlciBvZiBmcmFj
dGluYWwgYml0c20gb25seSBzdXBwb3J0IG4gPD0gMzIKPiAKCkhlaGUsIGd1ZXNzIHdoYXQgSSBk
aWRuJ3QgZG8/IEFsc28sIFtuaXRdLCBzL2ZyYWN0aW5hbC9mcmFjdGlvbmFsLy4KCj4gPiA+ICsg
Kgo+ID4gPiArICogQ29udmVydCBhbmQgY2xhbXAgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFt
Lm4gMidzIGNvbXBsZW1lbnQuCj4gPiA+ICsgKi8KPiA+ID4gK3VpbnQ2NF90IGRybV9jb2xvcl9j
dG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1dCwKPiA+ID4gKwkJCQkgICAgICB1
aW50MzJfdCBtLCB1aW50MzJfdCBuKQo+ID4gPiArewo+ID4gPiArCXU2NCBtYWcgPSAodXNlcl9p
bnB1dCAmIH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7Cj4gPiBUaGlzIGRvZXNuJ3QgYWNjb3Vu
dCBmb3IgbiA+IDMyLCB3aGljaCBpcyBwZXJmZWN0bHkgcG9zc2libGUgKGUuZy4gUTEuNjMpLgo+
ID4gPiArCWJvb2wgbmVnYXRpdmUgPSAhISh1c2VyX2lucHV0ICYgQklUX1VMTCg2MykpOwo+ID4g
PiArCXM2NCB2YWw7Cj4gPiA+ICsKPiA+ID4gKwkvKiB0aGUgcmFuZ2Ugb2Ygc2lnbmVkIDJzIGNv
bXBsZW1lbnQgaXMgWy0yXm4rbSwgMl5uK20gLSAxXSAqLwo+ID4gPiArCXZhbCA9IGNsYW1wX3Zh
bChtYWcsIDAsIG5lZ2F0aXZlID8gQklUKG4gKyBtKSA6IEJJVChuICsgbSkgLSAxKTsKPiA+IFRo
aXMgYWxzbyBkb2Vzbid0IGFjY291bnQgZm9yIG4gKyBtID09IDY0Lgo+IAo+IFllcyB0aGUgZnVu
YyBpcyBvbmx5IGZvciBzdXBwb3J0IG0gPD0gMzEsIG4gPD0gMzIKPiAKPiBCdXQgSSdtIG5vdCBz
dXJlLCBob3cgdG8gaGFuZGxlIHRoZSB1bnN1cHBvcnQgY2FzZSA/Cj4gTWF5YmUganVzdCBtZW50
aW9uIGl0IGluIERvYyBpcyBlbm91Z2guCgpJJ2QgcGVyc29uYWxseSBhcHByZWNpYXRlIGEgV0FS
Tl9PTiguLi4pKi4gTXkgY29tbWVudCB3YXMgbW90aXZhdGVkIGJ5CnRoZSB1bmNoZWNrZWQgbmF0
dXJlIG9mIHRoZSBsaW1pdGF0aW9uLCB3aGljaCBtaWdodCBzdXJwcmlzZQphIGRldiB3aG8gZGlk
bid0IHJlYWQgdGhlIGRvYyBiZWZvcmUgdXNpbmcgdGhlIGZ1bmN0aW9uIChsaWtlIG15c2VsZiA6
KSkuCgpBY3R1YWxseSwgdGhlIGxpbWl0YXRpb25zIGFyZSBtb3JlIHRoYW4gc3BlY2lmaWVkLCBC
SVQobiArIG0pIGlzIG9ubHkKdmFsaWQgZm9yIChuICsgbSA8IDMyKSBvbiBMUDMyIHN5c3RlbXMu
CgpBdCBsZWFzdCBjaGFuZ2UgdGhvc2UgdG8gQklUX1VMTCgpLCB0aGVuOgoKUmV2aWV3ZWQtYnk6
IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KCiogLSBnY2M5LjIg
ZG9lc24ndCBnaXZlIG1lIGFueSBjb21waWxlLXRpbWUgd2FybmluZ3MgZm9yIHVzaW5nIHRoaXMg
ZnVuYwppbmNvcnJlY3RseS4KCj4gCj4gPiA+ICsKPiA+ID4gKwlyZXR1cm4gbmVnYXRpdmUgPyAw
bGwgLSB2YWwgOiB2YWw7Cj4gPiA+ICt9Cj4gPiA+ICtFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9j
dG1fczMxXzMyX3RvX3FtX24pOwo+ID4gPiArCj4gPiA+ICAvKioKPiA+ID4gICAqIGRybV9jcnRj
X2VuYWJsZV9jb2xvcl9tZ210IC0gZW5hYmxlIGNvbG9yIG1hbmFnZW1lbnQgcHJvcGVydGllcwo+
ID4gPiAgICogQGNydGM6IERSTSBDUlRDCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fY29sb3JfbWdtdC5oIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ID4gPiBpbmRl
eCBkMWM2NjJkOTJhYjcuLjYwZmVhNTUwMTg4NiAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2NvbG9yX21nbXQuaAo+ID4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdt
dC5oCj4gPiA+IEBAIC0zMCw2ICszMCw4IEBAIHN0cnVjdCBkcm1fY3J0YzsKPiA+ID4gIHN0cnVj
dCBkcm1fcGxhbmU7Cj4gPiA+IAo+ID4gPiAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0
KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24pOwo+ID4gPiArdWlu
dDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0LAo+
ID4gPiArCQkJCSAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pOwo+ID4gPiAKPiA+ID4gIHZv
aWQgZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4g
PiAgCQkJCXVpbnQgZGVnYW1tYV9sdXRfc2l6ZSwKPiA+ID4gLS0KPiA+ID4gMi4yMC4xCj4gPiA+
IAo+ID4gCj4gPiAKPiAKCgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
