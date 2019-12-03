Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED710F7AD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 07:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB248922B;
	Tue,  3 Dec 2019 06:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD428922B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 06:12:34 +0000 (UTC)
Received: from VI1PR08CA0101.eurprd08.prod.outlook.com (2603:10a6:800:d3::27)
 by HE1PR0801MB1690.eurprd08.prod.outlook.com (2603:10a6:3:7f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Tue, 3 Dec
 2019 06:12:31 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR08CA0101.outlook.office365.com
 (2603:10a6:800:d3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Tue, 3 Dec 2019 06:12:31 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 06:12:30 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Tue, 03 Dec 2019 06:12:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1e07b2fb8c8bca1
X-CR-MTA-TID: 64aa7808
Received: from 49bad07b3426.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A69222EF-AAE1-4701-B770-BD1EF8F22631.1; 
 Tue, 03 Dec 2019 06:12:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49bad07b3426.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Dec 2019 06:12:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZwzbNSGZJgG4xQvdEKsUGrK9GMuytHlrRCEV0E6lPpkjmWFduKHKQMhB19849xN/JWkDlqyihu2Ij7XBITVmsR3yzwAVDW1VUcj+WgFvWr9IKE95NP5ZchCz/25wQXG38DJVh3gJXIuvHV+YqGAOW4YsZ/NmKzVYDUvdWGaMHaVYahdvbhztQmmc1DG+fOqIxDBA/tnsM0SYrn2N2MPkllzdavaWH0NWhZj2RyUqYR2s3vttaLzVR+UaB68psEYdrhsExHRQjLK8YqMqtxFgIFDzPepZYqGhRtZXlo38PcVHK+gV3v3uoR3GYWm1CbEfdizquPumosmdNJUZxwL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imz+nN4XmH+Hb1lDxtBSSmffWSXwdgcVObA1324nDS4=;
 b=czHC61qMQFbMyP7uCq2JsU2jQjTsx9L0Xm5GFAwH+LBy1HKQiL8Pnd3hjOCkAgi1+ioYEIeHvBAX/m6ab3HXRZvIZokiOQ4XBUsZTvc3g/rrVi2q6paHImf5tzs8HFZZJYARf/N2p58NzPQz4czVxslf73KBcye+R5FC1FhhgvR2W03F3+A/dyHqajFeLBI9defMwuhhX6rs531jzr2/rwYcIpE7lZGUwLerPn3Z4ikgNGu06L1D5lvR6eFIwbsLnhl/MgsaXtU6hCfmLYA/nyxLiKAg8Qs8env7bkScgAYfpWqftU/gbpJ1bXgZTZ28eQvtpzqNd0HWNBHTqD9qug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4750.eurprd08.prod.outlook.com (10.255.112.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Tue, 3 Dec 2019 06:12:20 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 06:12:20 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>, David Airlie
 <airlied@linux.ie>, nd <nd@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [01/30] drm: Introduce drm_bridge_init()
Thread-Topic: [01/30] drm: Introduce drm_bridge_init()
Thread-Index: AQHVqNUM0g5O7Fjga0S0liny7wKZ4KemiS2AgAFmXAA=
Date: Tue, 3 Dec 2019 06:12:20 +0000
Message-ID: <20191203061212.GA16542@jamwan02-TSP300>
References: <20191126131541.47393-2-mihail.atanassov@arm.com>
 <20191202055459.GA25729@jamwan02-TSP300>
 <20191202084935.GW624164@phenom.ffwll.local>
In-Reply-To: <20191202084935.GW624164@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0067.apcprd04.prod.outlook.com
 (2603:1096:202:15::11) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a72a12cd-7627-4369-7271-08d777b7c7b4
X-MS-TrafficTypeDiagnostic: VE1PR08MB4750:|VE1PR08MB4750:|HE1PR0801MB1690:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB169014DF9FE418EB1813CA63B3420@HE1PR0801MB1690.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1247;OLM:1247;
x-forefront-prvs: 02408926C4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(396003)(39860400002)(366004)(346002)(189003)(199004)(81166006)(7736002)(305945005)(66446008)(66476007)(66066001)(66946007)(64756008)(76176011)(6116002)(52116002)(966005)(11346002)(446003)(33716001)(14454004)(26005)(66556008)(25786009)(186003)(3846002)(55236004)(102836004)(6506007)(386003)(6436002)(6306002)(8676002)(81156014)(6246003)(9686003)(6512007)(2906002)(6486002)(478600001)(2501003)(229853002)(256004)(5024004)(8936002)(33656002)(110136005)(316002)(5660300002)(1076003)(86362001)(58126008)(2201001)(99286004)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4750;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P1KH2p5oOWBRVfkSaewm+dDEaANHSN+cRtWDxUs0lnTSoYsTGb9XO3+wu5FVEMZ2Ij1FcWwV9Q5xusDOwMT1hucHUvwRGVJ2oRHS1OddL2JXOclT473Vyh+onLhCZqua/CfVdyw8g4eQRVKPalV30miF8IluVny2RD9kjr1ktG0tIVvHTNH/4mkUmi/GdmNALfEGdEj/hvfhrUZlhAGKDl7qqp3PenVQt4wxBdCZLe4ufUcUZLFcEbcx1xFxTQxUmZ4Exj3/fyUNkCEtBASRaU8a5pCJtBC3ybgVjmQUK/UoZ3hfR7EVXrF+t7/NZuRt0VBrrdQK+yXFF1M45HVLEjj3LEekYv7murRfzFBM87F+Zx8IfPokY66+K7/iUlJ3cFAV3P1ZhO8ErFBqmiRr0fVkSdDV9PZdeVP4JgZJ8c8/pUqj3gHHfNwobrTBPBvZHQib40dVqMIRSVKn1Cd5CwEfMhSSed1N1ViSUYI3UFM=
Content-ID: <E0978FF761E31743A11BA43EF79098CA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4750
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(40434004)(8676002)(110136005)(47776003)(2201001)(8746002)(8936002)(3846002)(50466002)(6116002)(70586007)(6512007)(305945005)(7736002)(6306002)(14454004)(23726003)(76176011)(33656002)(5660300002)(102836004)(46406003)(6506007)(316002)(36906005)(386003)(478600001)(2906002)(33716001)(26826003)(587094005)(99286004)(97756001)(229853002)(186003)(966005)(5024004)(81156014)(70206006)(25786009)(14444005)(81166006)(336012)(26005)(66066001)(76130400001)(106002)(1076003)(2501003)(86362001)(11346002)(446003)(58126008)(22756006)(6246003)(356004)(6486002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1690;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cf7877dd-4db0-47ff-9fcc-08d777b7c13a
X-Forefront-PRVS: 02408926C4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVd7mxOHUb6CcOayTD1XGHK1UTRz6/DA/jY+qn68b6eo3TWcxDVSKi6ToCHTt5qeeaRBTEUxA474dUk7c1GCwaNFEQW+39HAZlrG3x4vnlR6H2wWDYtuQhsKPFexexBqXLs6nreqmqT88KlwewU70rl8ZM9Di2uRIXx4plSt2PKQ0H1AnV5Rj6Bz+qIPi8JSBvVT/LqpS7AsYRD49gSmNkv1EB0+O7kdUEEl5xX5HsQ/EvlF7DdJivnv42zQNjH9/hOpUoWYD60yr36ThH4mX4+ynF4s0lV5viGfKcDjFaQMooKk59wKD1ReN7GXnAkhwZnMgxH40I+SDEiepXJfIr+2sLsdcdzqM6WmZqp315pO1zd2k0xZHz41dG92M75nymmpw5sjd9/5HkqSpZ6RUUZZvPR6iQDqIJUEfs1XkyR3tJ0YWp/pkYSx9MPrnMkvaNmEds5dhv10DExHkLG62UPMzqNk4fwJ4nBIy9HWPK0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 06:12:30.8796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a72a12cd-7627-4369-7271-08d777b7c7b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/4/tFEbP02vmbCIZeySfuXOQ2b8cnuJWPANXDODfOQ=;
 b=RDSjVnvc95bf45aPmf4u8zSW0kTN42AsROgyY6SNat2tL5NaC7wH22GWNYfAbghw+HKGAQwcmvbl5L3uvYGn0M7ormwlCKbB2j4405Bvg4V4LqQ3GOhMWJt5ZmrI7PlYBsOrwuUGvmSa/OHAQ7PV2ZCbY4gYPk45zWXb4qemP6Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imz+nN4XmH+Hb1lDxtBSSmffWSXwdgcVObA1324nDS4=;
 b=1ZlG/a5rZUxwT2stRawqu7AEwjrbYIHZXHTenrUI4Up+mGJn7BZ+wwSfY/VRi6iKRkMJpwgvoWey64J10ceZomce/op9XnqtTSPD7UsGDhclDgDq311OyxhvRES8AXYJf5bppj7y9iI7najBYV08p7d8vfIUgjKl2rqtWpSfdHc=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDk6NDk6MzVBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIERlYyAwMiwgMjAxOSBhdCAwNTo1NTowNkFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIFR1ZSwgTm92IDI2
LCAyMDE5IGF0IDAxOjE1OjU5UE0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiA+
IEEgc2ltcGxlIGNvbnZlbmllbmNlIGZ1bmN0aW9uIHRvIGluaXRpYWxpemUgdGhlIHN0cnVjdCBk
cm1fYnJpZGdlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9icmlkZ2UuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBp
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmggICAgIHwgIDQgKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2JyaWRnZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+ID4gPiBp
bmRleCBjYmE1MzdjOTllNDMuLmNiZTY4MGFhNmVhYyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Jy
aWRnZS5jCj4gPiA+IEBAIC04OSw2ICs4OSwzNSBAQCB2b2lkIGRybV9icmlkZ2VfcmVtb3ZlKHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gPiA+ICB9Cj4gPiA+ICBFWFBPUlRfU1lNQk9MKGRy
bV9icmlkZ2VfcmVtb3ZlKTsKPiA+ID4KPiA+ID4gKy8qKgo+ID4gPiArICogZHJtX2JyaWRnZV9p
bml0IC0gaW5pdGlhbGlzZSBhIGRybV9icmlkZ2Ugc3RydWN0dXJlCj4gPiA+ICsgKgo+ID4gPiAr
ICogQGJyaWRnZTogYnJpZGdlIGNvbnRyb2wgc3RydWN0dXJlCj4gPiA+ICsgKiBAZnVuY3M6IGNv
bnRyb2wgZnVuY3Rpb25zCj4gPiA+ICsgKiBAZGV2OiBkZXZpY2UKPiA+ID4gKyAqIEB0aW1pbmdz
OiB0aW1pbmcgc3BlY2lmaWNhdGlvbiBmb3IgdGhlIGJyaWRnZTsgb3B0aW9uYWwgKG1heSBiZSBO
VUxMKQo+ID4gPiArICogQGRyaXZlcl9wcml2YXRlOiBwb2ludGVyIHRvIHRoZSBicmlkZ2UgZHJp
dmVyIGludGVybmFsIGNvbnRleHQgKG1heSBiZSBOVUxMKQo+ID4gPiArICovCj4gPiA+ICt2b2lk
IGRybV9icmlkZ2VfaW5pdChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLCBzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gPiA+ICsgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNz
ICpmdW5jcywKPiA+ID4gKyAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfdGlt
aW5ncyAqdGltaW5ncywKPiA+ID4gKyAgICAgICAgICAgICAgdm9pZCAqZHJpdmVyX3ByaXZhdGUp
Cj4gPiA+ICt7Cj4gPiA+ICsgV0FSTl9PTighZnVuY3MpOwo+ID4gPiArCj4gPiA+ICsgYnJpZGdl
LT5kZXYgPSBOVUxMOwo+ID4gPiArIGJyaWRnZS0+ZW5jb2RlciA9IE5VTEw7Cj4gPiA+ICsgYnJp
ZGdlLT5uZXh0ID0gTlVMTDsKPiA+ID4gKwo+ID4gPiArI2lmZGVmIENPTkZJR19PRgo+ID4gPiAr
IGJyaWRnZS0+b2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKPiA+ID4gKyNlbmRpZgo+ID4gPiArIGJy
aWRnZS0+dGltaW5ncyA9IHRpbWluZ3M7Cj4gPiA+ICsgYnJpZGdlLT5mdW5jcyA9IGZ1bmNzOwo+
ID4gPiArIGJyaWRnZS0+ZHJpdmVyX3ByaXZhdGUgPSBkcml2ZXJfcHJpdmF0ZTsKPiA+Cj4gPiBD
YW4gd2UgZGlyZWN0bHkgcHV0IGRybV9icmlkZ2VfYWRkKCkgaGVyZS4gdGhlbgo+ID4gLSBVc2Vy
IGFsd2F5cyBuZWVkIHRvIGNhbGwgYnJpZGdlX2luaXQgYW5kIGFkZCB0b2dldGhlci4KPiA+IC0g
Q29uc2lzdGVudCB3aXRoIG90aGVycyBsaWtlIGRybV9wbGFuZS9jcnRjX2luaXQgd2hpY2ggZGly
ZWN0bHkgaGFzCj4gPiAgIGRybV9tb2RlX29iamVjdF9hZGQoKSBpbiBpdC4KPgo+IFVoIG5vLCB0
aGUgdHJvdWJsZSBoZXJlIGlzIHRoYXQgZHJtX2JyaWRnZV9hZGQgc2hvdWxkIGFjdHVhbGx5IGJl
IGNhbGxlZAo+IF9yZWdpc3RlciwgYmVjYXVzZSBpdCBwdWJsaXNoZXMgdGhlIGJyaWRnZSB0byB0
aGUgd29ybGQuIEkgdGhpbmsgd2UgZXZlbgo+IGhhdmUgYSB0b2RvIGl0ZW0gdG8gcmVuYW1lIF9h
ZGQgdG8gX3JlZ2lzdGVyIC4uLiBPbmNlIHRoYXQncyBkb25lIHRoZQo+IGJyaWRnZSBjYW4ndCBi
ZSBjaGFuZ2VkIGFueW1vcmUsIGFsbCBpbml0IGNvZGUgbXVzdCBoYXZlIGNvbXBsZXRlZC4gU28K
PiBvZnRlbiB5b3UgbmVlZCBhIGJpdCBvZiBjb2RlIGJldHdlZW4gX2luaXQoKSBhbmQgX3JlZ2lz
dGVyKCkuCj4KPiBkcm1fbW9kZV9vYmplY3RfYWRkIGlzIGRpZmZlcmVudCBzaW5jZSBmb3IgbW9k
ZSBvYmplY3RzIGl0IGRvZXNuJ3QgcHVibGlzaAo+IGl0IHRvIHRoZSB3b3JsZCwgdGhhdCdzIGRv
bmUgd2l0aCBkcm1fZGV2X3JlZ2lzdGVyIGFuZAo+IGRybV9jb25uZWN0b3JfcmVnaXN0ZXIuIGRy
bV9tb2RlX29iamVjdF9hZGQganVzdCBkb2VzIGEgYml0IG9mIGludGVybmFsCj4gaG91c2Uga2Vl
cGluZy4KPiAtRGFuaWVsCj4KClllcywgdGhlIG5hbWUgX3JlZ2lzdGVyKCkgaXMgbW9yZSBiZXR0
ZXIuCgpBbmQgdGhhbmsgeW91IGZvciBzdWNoIGRldGFpbGVkIGV4cGxhbmF0aW9uLgoKVGhhbmtz
CkphbWVzCgo+ID4KPiA+IEphbWVzLgo+ID4gPiArfQo+ID4gPiArRVhQT1JUX1NZTUJPTChkcm1f
YnJpZGdlX2luaXQpOwo+ID4gPiArCj4gPiA+ICAvKioKPiA+ID4gICAqIGRybV9icmlkZ2VfYXR0
YWNoIC0gYXR0YWNoIHRoZSBicmlkZ2UgdG8gYW4gZW5jb2RlcidzIGNoYWluCj4gPiA+ICAgKgo+
ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2JyaWRnZS5oCj4gPiA+IGluZGV4IGMwYTIyODZhODFlOS4uZDZkOWQ1MzAxNTUxIDEwMDY0
NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiA+ID4gKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX2JyaWRnZS5oCj4gPiA+IEBAIC00MDIsNiArNDAyLDEwIEBAIHN0cnVjdCBkcm1f
YnJpZGdlIHsKPiA+ID4KPiA+ID4gIHZvaWQgZHJtX2JyaWRnZV9hZGQoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSk7Cj4gPiA+ICB2b2lkIGRybV9icmlkZ2VfcmVtb3ZlKHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UpOwo+ID4gPiArdm9pZCBkcm1fYnJpZGdlX2luaXQoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwgc3RydWN0IGRldmljZSAqZGV2LAo+ID4gPiArICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyAqZnVuY3MsCj4gPiA+ICsgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgKnRpbWluZ3MsCj4gPiA+ICsgICAgICAgICAg
ICAgIHZvaWQgKmRyaXZlcl9wcml2YXRlKTsKPiA+ID4gIHN0cnVjdCBkcm1fYnJpZGdlICpvZl9k
cm1fZmluZF9icmlkZ2Uoc3RydWN0IGRldmljZV9ub2RlICpucCk7Cj4gPiA+ICBpbnQgZHJtX2Jy
aWRnZV9hdHRhY2goc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLAo+ID4gPiAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9icmlkZ2UgKnByZXZp
b3VzKTsKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKSU1QT1JUQU5UIE5PVElDRTog
VGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlk
ZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5k
IGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0
IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55
IG1lZGl1bS4gVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
