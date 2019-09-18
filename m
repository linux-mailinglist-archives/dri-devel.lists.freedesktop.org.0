Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA09B5945
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 03:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD72E6EDB3;
	Wed, 18 Sep 2019 01:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20056.outbound.protection.outlook.com [40.107.2.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCA86EDB3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:30:03 +0000 (UTC)
Received: from DB6PR0801CA0053.eurprd08.prod.outlook.com (2603:10a6:4:2b::21)
 by VI1PR08MB4303.eurprd08.prod.outlook.com (2603:10a6:803:f7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.15; Wed, 18 Sep
 2019 01:29:58 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by DB6PR0801CA0053.outlook.office365.com
 (2603:10a6:4:2b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.18 via Frontend
 Transport; Wed, 18 Sep 2019 01:29:58 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 01:29:57 +0000
Received: ("Tessian outbound 0d576b67b9f5:v31");
 Wed, 18 Sep 2019 01:29:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1d1f021b1bc3165
X-CR-MTA-TID: 64aa7808
Received: from e846aa42bed5.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 173B670D-BDF2-4F36-B354-9A39C838CFCD.1; 
 Wed, 18 Sep 2019 01:29:47 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e846aa42bed5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Sep 2019 01:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9QUVp+n2VwxibBDs7otWhA+/ozrcsGhD7XhCRNl00VEEpl/9ZOt4yjEIW/yRpja80gbO7D4jYza/o4JJlqH6mSOWbhPkUzF5b+erRgAa73liFpU8ftIyarO3+U9YTVg1WBmDGtI/m0GoDEe/TUl+uea8vLw1LSy+zvTr75SoprQq9PExbSVRnxnZu4sOFcUcRhnLLFYidrReREMUGDkNhp/4ynzmpYxz4byaq20fjP7ikEvzIAvCfl4GS8tAWJWWVOXMgIEI/EmohzxOaeim1MdQGLiiGk6IQGdnn48MbMbbq69nBc4qtP+FvEx3n4hww6zJk0m7SbIdKRuYkvMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwFHRkWQwDjACHJD6UFNiXvEq5CHQM80FKgd9kUZbDE=;
 b=Zgel834TwbUYZ4VwxlKqhQPg05e4WKu7Xki+SZu8Dskf8wy5HFRmn29LgMFyYoYyqiUq1BPOJrRWs29cNP5B57bw/ebJ0y7ruebJmkZz6IL8GiLlXqqEafocQsMqRHMwgsr8iYA2W+ZLrmA4NEikH+oWVeb8VwBHoDvVoxoDntRfCTNnkreJog9pPncm5qrEpi1YaoM7M3EDEOhpbCENrOKICF+z8gGReyN9kWyxUXEC47jqb9/UO1pGspYidaa8jzyPPInA2AxpM1TfTieMGpABgfrBJrxKyqfDb2oW5JGkoblXBhMp1E9XJKv7ORfTQrk87qGtdct5P6fzgU8t0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5007.eurprd08.prod.outlook.com (10.255.159.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Wed, 18 Sep 2019 01:29:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 01:29:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/komeda: Adds error event print functionality
Thread-Topic: [PATCH] drm/komeda: Adds error event print functionality
Thread-Index: AQHVSRayAboXOjuz1kKxLGlCvtrW0acwIKWAgADOPoA=
Date: Wed, 18 Sep 2019 01:29:45 +0000
Message-ID: <20190918012937.GA11084@jamwan02-TSP300>
References: <1564738954-6101-1-git-send-email-lowry.li@arm.com>
 <CAKMK7uECMr46Ag8E=eqTKdZxgt_4M42t7GEyNGv0gxpv-TL3Pg@mail.gmail.com>
In-Reply-To: <CAKMK7uECMr46Ag8E=eqTKdZxgt_4M42t7GEyNGv0gxpv-TL3Pg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e1c26aba-c1b6-4e72-713f-08d73bd7b722
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5007; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5007:|VE1PR08MB5007:|VI1PR08MB4303:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4303D927C9A0DBF40CF2A72FB38E0@VI1PR08MB4303.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 01644DCF4A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(199004)(189003)(4326008)(6916009)(5660300002)(33656002)(6436002)(1076003)(6486002)(6116002)(3846002)(71200400001)(71190400001)(256004)(14444005)(2906002)(86362001)(33716001)(486006)(446003)(229853002)(316002)(66446008)(9686003)(54906003)(66946007)(66476007)(66556008)(64756008)(76176011)(52116002)(186003)(99286004)(58126008)(386003)(55236004)(11346002)(476003)(66066001)(102836004)(26005)(966005)(478600001)(14454004)(25786009)(8936002)(6246003)(8676002)(81156014)(81166006)(6306002)(7736002)(6512007)(6506007)(53546011)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5007;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: VZuvJ3Jw3L8z2lsPIrl+lfTInUrY9Ajdy5PSSgf5Fv89tCVorUb69NTdQugMlBmLb12OmUf6i4QFNvjOHNgF3d+8Rut02rxGtN2isLHXgEOTrlugCJadbRx3unjQPf6KEAYVZkzoWBb3J5QkpS7df41aRX9U+b/BQVRtag0Kz1xJ2e/p50AcheaPiRwa9CyzEZMll1pcEQKodn2Cpgy4sQWA7MEf1qv8/bZFMoZC+2hlvmzg5SGelgTj/cmj6IANnf7ZPcK5nlLB+jw1Qk70iUY12FBh+1FPwG52j2j72lMXFpGKUrsA5mPdQlFVIzfeSxJrtdaZVfdnwlnhc4Zqz7t5rgf0A1m3uVzqK2zyLO+c0AxHntZrsEMw9V/fLrCMGLnYyRi2O/h+ne+Rci008UI+huFJLHGM1blZoWF0qso=
Content-ID: <6837C2F5BB3AF941B5C73E15440B616B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5007
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(86362001)(97756001)(126002)(53546011)(99286004)(6506007)(386003)(5660300002)(76176011)(50466002)(23726003)(6246003)(229853002)(9686003)(33716001)(46406003)(6486002)(33656002)(6116002)(6512007)(3846002)(2906002)(22756006)(102836004)(70206006)(486006)(7736002)(25786009)(70586007)(4326008)(186003)(47776003)(305945005)(6306002)(478600001)(446003)(316002)(26826003)(476003)(14454004)(8676002)(966005)(36906005)(1076003)(58126008)(6862004)(54906003)(66066001)(356004)(11346002)(63350400001)(8746002)(81166006)(14444005)(76130400001)(81156014)(26005)(8936002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4303;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 91d5e5b1-5bab-45ee-b338-08d73bd7afb8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4303; 
NoDisclaimer: True
X-Forefront-PRVS: 01644DCF4A
X-Microsoft-Antispam-Message-Info: swY3dicshZpw2a9VcI44GKvPLzYt0Kir0LZDk43YQ7iEUvYrpI1ITGWIi/5GwTXlQxOhi8mQ+tcFJOH8E84fCUVVy6tBYw7azSVEGf8H4so170cJIdjuzMENug1CzH/ChPdqflP6Cs8JVkjf4lTcOJjBBZ/sCZh8bHIv5A8cQ/+Jw1dhpkjno/xxShnZa3DJVOENZX6sL53liTfpwP8OozmfcrtARKcyEiScOBJz37cn4RA3lhcqaIJgNE221sCGjjQL4ixfAl5ooYNaZfSCqppqnJqz5rq1yavNqhaq83lT3MtJDTgjqAlPjpJbcvolO2qyDkX41U6J7pk/RjmiAqkB5Zot+IU6PKKXUmrDVczKDke3lwHrczcShoDxGFeLJwBL+GQtEU5H63GrfZBwNMrlEaNOWmF/TuFy3eQjhak=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 01:29:57.1999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c26aba-c1b6-4e72-713f-08d73bd7b722
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4303
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwFHRkWQwDjACHJD6UFNiXvEq5CHQM80FKgd9kUZbDE=;
 b=MRnLx3s0Me3dNQQuM84bAx6lRVURTWGbL0PBRgIwhpu4U7QXlxklowBWe8hSgA1vClAO50yaqfnn4X0pFcyCs8gm/AuGotFh7G5paAEkpIgCje69mZLsw92nG/Y1/VpBWbyYbDwQxKefomc/NsJEmndlNXK1r1ZXK6DRVbHTNEI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwFHRkWQwDjACHJD6UFNiXvEq5CHQM80FKgd9kUZbDE=;
 b=MRnLx3s0Me3dNQQuM84bAx6lRVURTWGbL0PBRgIwhpu4U7QXlxklowBWe8hSgA1vClAO50yaqfnn4X0pFcyCs8gm/AuGotFh7G5paAEkpIgCje69mZLsw92nG/Y1/VpBWbyYbDwQxKefomc/NsJEmndlNXK1r1ZXK6DRVbHTNEI=
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
Cc: nd <nd@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6MTE6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEF1ZyAyLCAyMDE5IGF0IDExOjQzIEFNIExvd3J5IExpIChBcm0gVGVj
aG5vbG9neSBDaGluYSkKPiA8TG93cnkuTGlAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTog
Ikxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29tPgo+ID4K
PiA+IEFkZHMgdG8gcHJpbnQgdGhlIGV2ZW50IG1lc3NhZ2Ugd2hlbiBlcnJvciBoYXBwZW5zIGFu
ZCB0aGUgc2FtZSBldmVudAo+ID4gd2lsbCBub3QgYmUgcHJpbnRlZCB1bnRpbCBuZXh0IHZzeW5j
Lgo+ID4KPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAxLiBSZWZpbmUga29tZWRhX3NwcmludGYo
KTsKPiA+IDIuIE5vdCB1c2luZyBTVFJfU1ogbWFjcm8gZm9yIHRoZSBzdHJpbmcgc2l6ZSBpbiBr
b21lZGFfcHJpbnRfZXZlbnRzKCkuCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+IDEuIEhh
bmRsaW5nIHRoZSBldmVudCBwcmludCBieSBDT05GSUdfS09NRURBX0VSUk9SX1BSSU5UOwo+ID4g
Mi4gQ2hhbmdpbmcgdGhlIG1heCBzdHJpbmcgc2l6ZSB0byAyNTYuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9LY29uZmlnICAgICAgICAg
ICAgICAgfCAgIDYgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFr
ZWZpbGUgICAgICAgfCAgIDIgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rldi5oICAgfCAgMTUgKysrCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyB8IDE0MCArKysrKysrKysrKysrKysrKysrKysrCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgICB8ICAg
NCArCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNjcgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVu
dC5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcKPiA+IGluZGV4IGNlYzA2
MzkuLmU4N2ZmODYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
S2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcKPiA+
IEBAIC0xMiwzICsxMiw5IEBAIGNvbmZpZyBEUk1fS09NRURBCj4gPiAgICAgICAgICAgUHJvY2Vz
c29yIGRyaXZlci4gSXQgc3VwcG9ydHMgdGhlIEQ3MSB2YXJpYW50cyBvZiB0aGUgaGFyZHdhcmUu
Cj4gPgo+ID4gICAgICAgICAgIElmIGNvbXBpbGVkIGFzIGEgbW9kdWxlIGl0IHdpbGwgYmUgY2Fs
bGVkIGtvbWVkYS4KPiA+ICsKPiA+ICtjb25maWcgRFJNX0tPTUVEQV9FUlJPUl9QUklOVAo+ID4g
KyAgICAgICBib29sICJFbmFibGUga29tZWRhIGVycm9yIHByaW50Igo+ID4gKyAgICAgICBkZXBl
bmRzIG9uIERSTV9LT01FREEKPiA+ICsgICAgICAgaGVscAo+ID4gKyAgICAgICAgIENob29zZSB0
aGlzIG9wdGlvbiB0byBlbmFibGUgZXJyb3IgcHJpbnRpbmcuCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUKPiA+IGluZGV4IDVjMzkwMGMuLmYwOTVhMWMg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2Vm
aWxlCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxl
Cj4gPiBAQCAtMjIsNCArMjIsNiBAQCBrb21lZGEteSArPSBcCj4gPiAgICAgICAgIGQ3MS9kNzFf
ZGV2Lm8gXAo+ID4gICAgICAgICBkNzEvZDcxX2NvbXBvbmVudC5vCj4gPgo+ID4gK2tvbWVkYS0k
KENPTkZJR19EUk1fS09NRURBX0VSUk9SX1BSSU5UKSArPSBrb21lZGFfZXZlbnQubwo+ID4gKwo+
ID4gIG9iai0kKENPTkZJR19EUk1fS09NRURBKSArPSBrb21lZGEubwo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiA+IGluZGV4IGQxYzg2
YjYuLmUyOGU3ZTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kZXYuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmgKPiA+IEBAIC00MCw2ICs0MCwxNyBAQAo+ID4gICNkZWZpbmUg
S09NRURBX0VSUl9UVE5HICAgICAgICAgICAgICAgICAgICAgICAgQklUX1VMTCgzMCkKPiA+ICAj
ZGVmaW5lIEtPTUVEQV9FUlJfVFRGICAgICAgICAgICAgICAgICBCSVRfVUxMKDMxKQo+ID4KPiA+
ICsjZGVmaW5lIEtPTUVEQV9FUlJfRVZFTlRTICAgICAgXAo+ID4gKyAgICAgICAoS09NRURBX0VW
RU5UX1VSVU4gICAgICB8IEtPTUVEQV9FVkVOVF9JQlNZICAgICB8IEtPTUVEQV9FVkVOVF9PVlIg
fFwKPiA+ICsgICAgICAgS09NRURBX0VSUl9URVRPICAgICAgICAgfCBLT01FREFfRVJSX1RFTVIg
ICAgICAgfCBLT01FREFfRVJSX1RJVFIgfFwKPiA+ICsgICAgICAgS09NRURBX0VSUl9DUEUgICAg
ICAgICAgfCBLT01FREFfRVJSX0NGR0UgICAgICAgfCBLT01FREFfRVJSX0FYSUUgfFwKPiA+ICsg
ICAgICAgS09NRURBX0VSUl9BQ0UwICAgICAgICAgfCBLT01FREFfRVJSX0FDRTEgICAgICAgfCBL
T01FREFfRVJSX0FDRTIgfFwKPiA+ICsgICAgICAgS09NRURBX0VSUl9BQ0UzICAgICAgICAgfCBL
T01FREFfRVJSX0RSSUZUVE8gICAgfCBLT01FREFfRVJSX0ZSQU1FVE8gfFwKPiA+ICsgICAgICAg
S09NRURBX0VSUl9aTUUgICAgICAgICAgfCBLT01FREFfRVJSX01FUlIgICAgICAgfCBLT01FREFf
RVJSX1RDRiB8XAo+ID4gKyAgICAgICBLT01FREFfRVJSX1RUTkcgICAgICAgICB8IEtPTUVEQV9F
UlJfVFRGKQo+ID4gKwo+ID4gKyNkZWZpbmUgS09NRURBX1dBUk5fRVZFTlRTICAgICBLT01FREFf
RVJSX0NTQ0UKPiA+ICsKPiA+ICAvKiBtYWxpZHAgZGV2aWNlIGlkICovCj4gPiAgZW51bSB7Cj4g
PiAgICAgICAgIE1BTElfRDcxID0gMCwKPiA+IEBAIC0yMDcsNCArMjE4LDggQEAgc3RydWN0IGtv
bWVkYV9kZXYgewo+ID4KPiA+ICBzdHJ1Y3Qga29tZWRhX2RldiAqZGV2X3RvX21kZXYoc3RydWN0
IGRldmljZSAqZGV2KTsKPiA+Cj4gPiArI2lmZGVmIENPTkZJR19EUk1fS09NRURBX0VSUk9SX1BS
SU5UCj4gPiArdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpl
dnRzKTsKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICAjZW5kaWYgLypfS09NRURBX0RFVl9IXyovCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZXZlbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50
LmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwLi5hMzZmYjg2Cj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9ldmVudC5jCj4gPiBAQCAtMCwwICsxLDE0MCBAQAo+ID4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiArLyoKPiA+ICsgKiAoQykgQ09QWVJJR0hUIDIw
MTkgQVJNIExpbWl0ZWQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4gPiArICogQXV0aG9yOiBKYW1l
cy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gKyAqCj4gPiArICovCj4g
PiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSAia29tZWRh
X2Rldi5oIgo+ID4gKwo+ID4gK3N0cnVjdCBrb21lZGFfc3RyIHsKPiA+ICsgICAgICAgY2hhciAq
c3RyOwo+ID4gKyAgICAgICB1MzIgc3o7Cj4gPiArICAgICAgIHUzMiBsZW47Cj4gPiArfTsKPiA+
ICsKPiA+ICsvKiByZXR1cm4gMCBvbiBzdWNjZXNzLCAgPCAwIG9uIG5vIHNwYWNlLgo+ID4gKyAq
Lwo+ID4gK3N0YXRpYyBpbnQga29tZWRhX3NwcmludGYoc3RydWN0IGtvbWVkYV9zdHIgKnN0ciwg
Y29uc3QgY2hhciAqZm10LCAuLi4pCj4gPiArewo+ID4gKyAgICAgICB2YV9saXN0IGFyZ3M7Cj4g
PiArICAgICAgIGludCBudW0sIGZyZWVfc3o7Cj4gPiArICAgICAgIGludCBlcnI7Cj4gPiArCj4g
PiArICAgICAgIGZyZWVfc3ogPSBzdHItPnN6IC0gc3RyLT5sZW4gLSAxOwo+ID4gKyAgICAgICBp
ZiAoZnJlZV9zeiA8PSAwKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PU1BDOwo+ID4g
Kwo+ID4gKyAgICAgICB2YV9zdGFydChhcmdzLCBmbXQpOwo+ID4gKwo+ID4gKyAgICAgICBudW0g
PSB2c25wcmludGYoc3RyLT5zdHIgKyBzdHItPmxlbiwgZnJlZV9zeiwgZm10LCBhcmdzKTsKPiA+
ICsKPiA+ICsgICAgICAgdmFfZW5kKGFyZ3MpOwo+ID4gKwo+ID4gKyAgICAgICBpZiAobnVtIDwg
ZnJlZV9zeikgewo+ID4gKyAgICAgICAgICAgICAgIHN0ci0+bGVuICs9IG51bTsKPiA+ICsgICAg
ICAgICAgICAgICBlcnIgPSAwOwo+ID4gKyAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAg
ICAgIHN0ci0+bGVuID0gc3RyLT5zeiAtIDE7Cj4gPiArICAgICAgICAgICAgICAgZXJyID0gLUVO
T1NQQzsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gZXJyOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBldnRfc3ByaW50ZihzdHJ1Y3Qga29tZWRhX3N0ciAqc3Ry
LCB1NjQgZXZ0LCBjb25zdCBjaGFyICptc2cpCj4gPiArewo+ID4gKyAgICAgICBpZiAoZXZ0KQo+
ID4gKyAgICAgICAgICAgICAgIGtvbWVkYV9zcHJpbnRmKHN0ciwgbXNnKTsKPiA+ICt9Cj4gPiAr
Cj4gPiArc3RhdGljIHZvaWQgZXZ0X3N0cihzdHJ1Y3Qga29tZWRhX3N0ciAqc3RyLCB1NjQgZXZl
bnRzKQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKGV2ZW50cyA9PSAwVUxMKSB7Cj4gPiArICAgICAg
ICAgICAgICAga29tZWRhX3NwcmludGYoc3RyLCAiTm9uZSIpOwo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybjsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIs
IGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9WU1lOQywgIlZTWU5DfCIpOwo+ID4gKyAgICAgICBldnRf
c3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9GTElQLCAiRkxJUHwiKTsKPiA+ICsg
ICAgICAgZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZFTlRfRU9XLCAiRU9XfCIp
Owo+ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9NT0RF
LCAiT1AtTU9ERXwiKTsKPiA+ICsKPiA+ICsgICAgICAgZXZ0X3NwcmludGYoc3RyLCBldmVudHMg
JiBLT01FREFfRVZFTlRfVVJVTiwgIlVOREVSUlVOfCIpOwo+ID4gKyAgICAgICBldnRfc3ByaW50
ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9PVlIsICJPVkVSUlVOfCIpOwo+ID4gKwo+ID4g
KyAgICAgICAvKiBHTEIgZXJyb3IgKi8KPiA+ICsgICAgICAgZXZ0X3NwcmludGYoc3RyLCBldmVu
dHMgJiBLT01FREFfRVJSX01FUlIsICJNRVJSfCIpOwo+ID4gKyAgICAgICBldnRfc3ByaW50Zihz
dHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfRlJBTUVUTywgIkZSQU1FVE98Iik7Cj4gPiArCj4gPiAr
ICAgICAgIC8qIERPVSBlcnJvciAqLwo+ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIsIGV2ZW50
cyAmIEtPTUVEQV9FUlJfRFJJRlRUTywgIkRSSUZUVE98Iik7Cj4gPiArICAgICAgIGV2dF9zcHJp
bnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9GUkFNRVRPLCAiRlJBTUVUT3wiKTsKPiA+ICsg
ICAgICAgZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RFVE8sICJURVRPfCIp
Owo+ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ1NDRSwg
IkNTQ0V8Iik7Cj4gPiArCj4gPiArICAgICAgIC8qIExQVSBlcnJvcnMgb3IgZXZlbnRzICovCj4g
PiArICAgICAgIGV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VWRU5UX0lCU1ksICJJ
QlNZfCIpOwo+ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJf
QVhJRSwgIkFYSUV8Iik7Cj4gPiArICAgICAgIGV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09N
RURBX0VSUl9BQ0UwLCAiQUNFMHwiKTsKPiA+ICsgICAgICAgZXZ0X3NwcmludGYoc3RyLCBldmVu
dHMgJiBLT01FREFfRVJSX0FDRTEsICJBQ0UxfCIpOwo+ID4gKyAgICAgICBldnRfc3ByaW50Zihz
dHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQUNFMiwgIkFDRTJ8Iik7Cj4gPiArICAgICAgIGV2dF9z
cHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9BQ0UzLCAiQUNFM3wiKTsKPiA+ICsKPiA+
ICsgICAgICAgLyogTFBVIFRCVSBlcnJvcnMqLwo+ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIs
IGV2ZW50cyAmIEtPTUVEQV9FUlJfVENGLCAiVENGfCIpOwo+ID4gKyAgICAgICBldnRfc3ByaW50
ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVFRORywgIlRUTkd8Iik7Cj4gPiArICAgICAgIGV2
dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9USVRSLCAiVElUUnwiKTsKPiA+ICsg
ICAgICAgZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RFTVIsICJURU1SfCIp
Owo+ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVFRGLCAi
VFRGfCIpOwo+ID4gKwo+ID4gKyAgICAgICAvKiBDVSBlcnJvcnMqLwo+ID4gKyAgICAgICBldnRf
c3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ1BFLCAiQ09QUk9DfCIpOwo+ID4gKyAg
ICAgICBldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfWk1FLCAiWk1FfCIpOwo+
ID4gKyAgICAgICBldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ0ZHRSwgIkNG
R0V8Iik7Cj4gPiArICAgICAgIGV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9U
RU1SLCAiVEVNUnwiKTsKPiA+ICsKPiA+ICsgICAgICAgaWYgKHN0ci0+bGVuID4gMCAmJiAoc3Ry
LT5zdHJbc3RyLT5sZW4gLSAxXSA9PSAnfCcpKSB7Cj4gPiArICAgICAgICAgICAgICAgc3RyLT5z
dHJbc3RyLT5sZW4gLSAxXSA9IDA7Cj4gPiArICAgICAgICAgICAgICAgc3RyLT5sZW4tLTsKPiA+
ICsgICAgICAgfQo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgYm9vbCBpc19uZXdfZnJhbWUoc3Ry
dWN0IGtvbWVkYV9ldmVudHMgKmEpCj4gPiArewo+ID4gKyAgICAgICByZXR1cm4gKGEtPnBpcGVz
WzBdIHwgYS0+cGlwZXNbMV0pICYKPiA+ICsgICAgICAgICAgICAgIChLT01FREFfRVZFTlRfRkxJ
UCB8IEtPTUVEQV9FVkVOVF9FT1cpOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lkIGtvbWVkYV9wcmlu
dF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpCj4gPiArewo+ID4gKyAgICAgICB1
NjQgcHJpbnRfZXZ0cyA9IEtPTUVEQV9FUlJfRVZFTlRTOwo+ID4gKyAgICAgICBzdGF0aWMgYm9v
bCBlbl9wcmludCA9IHRydWU7Cj4gPiArCj4gPiArICAgICAgIC8qIHJlZHVjZSB0aGUgc2FtZSBt
c2cgcHJpbnQsIG9ubHkgcHJpbnQgdGhlIGZpcnN0IGV2dCBmb3Igb25lIGZyYW1lICovCj4gPiAr
ICAgICAgIGlmIChldnRzLT5nbG9iYWwgfHwgaXNfbmV3X2ZyYW1lKGV2dHMpKQo+ID4gKyAgICAg
ICAgICAgICAgIGVuX3ByaW50ID0gdHJ1ZTsKPiA+ICsgICAgICAgaWYgKCFlbl9wcmludCkKPiA+
ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICAgIGlmICgoZXZ0cy0+Z2xv
YmFsIHwgZXZ0cy0+cGlwZXNbMF0gfCBldnRzLT5waXBlc1sxXSkgJiBwcmludF9ldnRzKSB7Cj4g
PiArICAgICAgICAgICAgICAgY2hhciBtc2dbMjU2XTsKPiA+ICsgICAgICAgICAgICAgICBzdHJ1
Y3Qga29tZWRhX3N0ciBzdHI7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgc3RyLnN0ciA9IG1z
ZzsKPiA+ICsgICAgICAgICAgICAgICBzdHIuc3ogID0gc2l6ZW9mKG1zZyk7Cj4gPiArICAgICAg
ICAgICAgICAgc3RyLmxlbiA9IDA7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAga29tZWRhX3Nw
cmludGYoJnN0ciwgImdjdTogIik7Cj4gPiArICAgICAgICAgICAgICAgZXZ0X3N0cigmc3RyLCBl
dnRzLT5nbG9iYWwpOwo+ID4gKyAgICAgICAgICAgICAgIGtvbWVkYV9zcHJpbnRmKCZzdHIsICIs
IHBpcGVzWzBdOiAiKTsKPiA+ICsgICAgICAgICAgICAgICBldnRfc3RyKCZzdHIsIGV2dHMtPnBp
cGVzWzBdKTsKPiA+ICsgICAgICAgICAgICAgICBrb21lZGFfc3ByaW50Zigmc3RyLCAiLCBwaXBl
c1sxXTogIik7Cj4gPiArICAgICAgICAgICAgICAgZXZ0X3N0cigmc3RyLCBldnRzLT5waXBlc1sx
XSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJlcnIgZGV0ZWN0OiAlc1xu
IiwgbXNnKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBlbl9wcmludCA9IGZhbHNlOwo+ID4g
KyAgICAgICB9Cj4gPiArfQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmMKPiA+IGluZGV4IDQxOWE4YjAuLjBmYWZjMzYgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiA+
IEBAIC00Nyw2ICs0NywxMCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qga29tZWRhX2ttc19pcnFfaGFu
ZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ID4gICAgICAgICBtZW1zZXQoJmV2dHMsIDAsIHNp
emVvZihldnRzKSk7Cj4gPiAgICAgICAgIHN0YXR1cyA9IG1kZXYtPmZ1bmNzLT5pcnFfaGFuZGxl
cihtZGV2LCAmZXZ0cyk7Cj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9Q
UklOVAo+ID4gKyAgICAgICBrb21lZGFfcHJpbnRfZXZlbnRzKCZldnRzKTsKPiA+ICsjZW5kaWYK
PiAKPiAjaWZkZWYgaW4gY29kZSBpcyBkaXNjb3VyYWdlZCwgdGhlIHVzdWFsIHdheSB3ZSBoYW5k
bGUgdGhlc2UgY2FzZXMgaXMKPiBieSBoYXZpbmcgYSBkdW1teSBzdGF0aWMgaW5saW5lIGZ1bmN0
aW9uIHdoaWNoIGRvZXMgbm90aGluZyBpbiB0aGUKPiBoZWFkZXJzIGZvciB0aGUgY2FzZSBhIGNv
bmZpZyBvcHRpb24gaXNuJ3QgZW5hYmxlZC4KPiAtRGFuaWVsCgpIaSBEYW5pZWwmTWloYWlsOgoK
SWYgc28sIHNpbmNlIHRoaXMgQ09ORklHIGlzIGFsd2F5cyBlbmFibGVkIGZvciBrb21lZGEsIEkn
ZCBsaWtlIHRvCmRlbGV0ZSB0aGlzIENPTkZJRyBvcHRpb24gZGlyZWN0bHkuCgp0aGFua3MKamFt
ZXMKCj4gPiArCj4gPiAgICAgICAgIC8qIE5vdGlmeSB0aGUgY3J0YyB0byBoYW5kbGUgdGhlIGV2
ZW50cyAqLwo+ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwga21zLT5uX2NydGNzOyBpKyspCj4g
PiAgICAgICAgICAgICAgICAga29tZWRhX2NydGNfaGFuZGxlX2V2ZW50KCZrbXMtPmNydGNzW2ld
LCAmZXZ0cyk7Cj4gPiAtLQo+ID4gMS45LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKPiAKPiAKPiAtLSAKPiBEYW5p
ZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
