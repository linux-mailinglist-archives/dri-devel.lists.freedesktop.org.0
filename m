Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4410A19A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1453F6E42A;
	Tue, 26 Nov 2019 15:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60063.outbound.protection.outlook.com [40.107.6.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3B6E426
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 15:55:24 +0000 (UTC)
Received: from DB6PR0801CA0053.eurprd08.prod.outlook.com (2603:10a6:4:2b::21)
 by VI1PR08MB4527.eurprd08.prod.outlook.com (2603:10a6:803:f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 15:55:22 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by DB6PR0801CA0053.outlook.office365.com
 (2603:10a6:4:2b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 26 Nov 2019 15:55:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 15:55:21 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Tue, 26 Nov 2019 15:55:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13591cb9624bdbd3
X-CR-MTA-TID: 64aa7808
Received: from 06fdba92f32a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BEC2877C-C917-4548-836E-3297BED3AD8B.1; 
 Tue, 26 Nov 2019 15:55:13 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06fdba92f32a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 15:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMqe7wq7K4N9JPAZrzgaR9CU7n34/1m4RS4xD1zzEPxBKnWDTYuxJLne9YyXsfBV6T5455L2A5J1pD5fzbIT/JlHceOGC1PaOew4YOuP5sO/cIPnRRQlZMldX02Tz8V+FkGpdyDmZBhU1nOxPmc1sL4StbcWcQxKxFECpBjDjSEkz6FkCMUbq4jm5dthSH3C7vyCkpJnH/7osvHZky1e/m+BCVWWnCL9DSakDOkS68BmyLw8y9+V2snyVB5JYTLQSBXDKOlFm1pnyVO65HSeaakzXVkI9wsInVbgaEYn54uFMj0LSfT2GxYBSUkt8XpXT1L4bZNmRhJ9F3rKGTruSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ4Shp5DNvgZrnsPgpX3VYjT6D2K6I+KjyjtOxnByyw=;
 b=K+hsuvDjuiBo8PRUVLf8hm5ZqVVMu68uk1oJQuFj1aj/wAsyGdJsHn0QUwpotj7byh8y2JF4fc1VTqLe8r1b7N9aFEOKDzgN+qfIjrb3+Ffrd7QicFOWmnFw+xx+G28pI2XEmkX2cSVz7uuVD5HZoe1vXZ0MrW/13JsWzVsP8C+EusqLRBSamOA2pEuPJ9cx5JIN/XpBnc4770w59ztIUF5DomlT5gCyfM9YG+J8BG9yHefU/Owj/az0oRlx+R5GSWebm0hkRrW6hg13dG06cWufwjCeBF0WrywnBKqELkxAyNt+X1DDCvRUDZZqz9fjFYpVgllz8uBThQb5qX2KXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2910.eurprd08.prod.outlook.com (10.175.245.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 15:55:10 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:55:10 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/30] drm: Introduce drm_bridge_init()
Thread-Topic: [PATCH 01/30] drm: Introduce drm_bridge_init()
Thread-Index: AQHVpFukMd5nbiwRlEK6zRU7NBRujaedgi4AgAADJIA=
Date: Tue, 26 Nov 2019 15:55:09 +0000
Message-ID: <11447519.fzG14qnjOE@e123338-lin>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-2-mihail.atanassov@arm.com>
 <20191126142610.GV29965@phenom.ffwll.local>
In-Reply-To: <20191126142610.GV29965@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::24) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22a8a6be-f7f7-4feb-9c7f-08d772890b13
X-MS-TrafficTypeDiagnostic: VI1PR08MB2910:|VI1PR08MB4527:
X-Microsoft-Antispam-PRVS: <VI1PR08MB4527612FBC8DF697B13456728F450@VI1PR08MB4527.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2887;OLM:2887;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(51914003)(6246003)(86362001)(81156014)(81166006)(66946007)(8936002)(110136005)(66476007)(5660300002)(2906002)(5024004)(316002)(6116002)(3846002)(66066001)(2501003)(386003)(66446008)(6436002)(14454004)(446003)(6486002)(99286004)(11346002)(229853002)(71190400001)(26005)(8676002)(64756008)(256004)(25786009)(478600001)(71200400001)(54906003)(66556008)(6506007)(33716001)(4326008)(76176011)(186003)(6512007)(305945005)(7736002)(102836004)(52116002)(9686003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2910;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lm9PPYYhwt78tZz7SROKCFCGCbaW8EzKd8c3/EUR2yFkfVdh+JLd/IIJ0om0iG0MZi1dJJ6nteq3MEV4Yh7vEh7E/qX1l/gvPWvqVWJUVLZthsdOnlY8lwSHNPWxj9Mcz8+rIsM43DwLWDEdbv+Qw/WzsLr+lA7v3FPyGYpJIuVuA7+NzIWUi7Illa8jILPhg2EDYtyds39Bhrp8peEuYxeGTiAexTu3x2ew+9KOh96/7+xCtW+oyfVm60bHrzbvGDIOoO8RXXAp13EgSCbAAD/QPQi5T0uY53fNk8itFoJRyhkcuTpINsMWYZPwyZUqD2GgfStHG0C+Xa9mEtC3IepfK8hOyzlNhWZ6N5OE5ebeUfl9GmtP/LNwV0Za3Z187XVd8ZGQqvg75YcKUDtuTDo/SkmvVqX34PU9fREb+Ax0/73RjZq5n47Wk/BQR6BW
x-ms-exchange-transport-forked: True
Content-ID: <E0AB6B693B61AD4EBA89E26E0FF2B122@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(1496009)(396003)(136003)(39860400002)(346002)(376002)(51914003)(189003)(199004)(478600001)(305945005)(336012)(5024004)(8936002)(99286004)(316002)(356004)(110136005)(36906005)(8746002)(54906003)(106002)(81156014)(81166006)(2501003)(6246003)(8676002)(7736002)(70586007)(70206006)(6486002)(50466002)(4326008)(86362001)(107886003)(33716001)(97756001)(229853002)(26005)(9686003)(66066001)(46406003)(26826003)(14454004)(47776003)(22756006)(25786009)(76130400001)(102836004)(6506007)(5660300002)(446003)(23726003)(2906002)(386003)(76176011)(186003)(11346002)(6512007)(6116002)(3846002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4527;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 44746272-0f92-47ca-485f-08d7728903eb
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWx7BENWv/3hBXavJCdzUqim8mzjKQ7FhcleaVfplAGdac1q9i8jwWNlodvB0aakDiuUxVJeOEBs1zmjjICCuS2flMWsqFqkE+iKGrBzomaXoA0h9NAdMyry6GkoOKcZLtKQxbx3aE9jijRedHBIOHXQ1+JW/O4Du/jociTmPxH64FoFdjx/4CFbjmvC4iLe3lChLer87YDRV7VG1cEEVfNQ+N/GqJHy8w2IemuawjO3y9WVmQvNSoaQpHIWINFZWZBdnyKUkeA5bGKjpYvqUGoqbXnoop8aGsM4aJUICuRmRdhyxKBxgrfMXMSY94C5/GKBYt1tHNQLvg25fCk/KT9JiTgkEDwILfKbL0gIXUS4TVAh0PXuDVoXRMQnCWBqkwVEpMRm+Fy6BNUb928en9/5hgXH+Qec0SZcqDKaG1QNhp6TMo8R8tTyyd4JoWp0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 15:55:21.7514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a8a6be-f7f7-4feb-9c7f-08d772890b13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ4Shp5DNvgZrnsPgpX3VYjT6D2K6I+KjyjtOxnByyw=;
 b=rADI9EYTrY2bXRYwCL7UXiIAyB8DyoMPuc9AgW7Ur/EAaL8OrcdDLpgJUlCSelAn4OuF88zlXAg+P/XR85g0GpubYvVQoO9INQaNGRVs4Ln23zrXI317YmgOffGi+x3EUOeE7jNy2fYDs8ynKcUnK427954VPg9kNcwgUCELCiE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ4Shp5DNvgZrnsPgpX3VYjT6D2K6I+KjyjtOxnByyw=;
 b=rADI9EYTrY2bXRYwCL7UXiIAyB8DyoMPuc9AgW7Ur/EAaL8OrcdDLpgJUlCSelAn4OuF88zlXAg+P/XR85g0GpubYvVQoO9INQaNGRVs4Ln23zrXI317YmgOffGi+x3EUOeE7jNy2fYDs8ynKcUnK427954VPg9kNcwgUCELCiE=
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3LgoKT24gVHVlc2RheSwgMjYg
Tm92ZW1iZXIgMjAxOSAxNDoyNjoxMCBHTVQgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUs
IE5vdiAyNiwgMjAxOSBhdCAwMToxNTo1OVBNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3Rl
Ogo+ID4gQSBzaW1wbGUgY29udmVuaWVuY2UgZnVuY3Rpb24gdG8gaW5pdGlhbGl6ZSB0aGUgc3Ry
dWN0IGRybV9icmlkZ2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3Yg
PG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAKPiBUaGUgY29tbWl0IG1lc3NhZ2UgaGVyZSBs
ZWF2ZXMgZmlndXJpbmcgb3V0IHdoeSB3ZSBuZWVkIHRoaXMgdG8gdGhlCj4gcmVhZGVyLiBSZWFk
aW5nIGFoZWFkIHRoZSByZWFzb25zIHNlZW1zIHRvIGJlIHRvIHJvbGwgb3V0IGJyaWRnZS0+ZGV2
Cj4gc2V0dGluZyBmb3IgZXZlcnlvbmUsIHNvIHRoYXQgd2UgY2FuIHNldCB0aGUgZGV2aWNlX2xp
bmsuIFBsZWFzZSBleHBsYWluCj4gdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugc28gdGhlIHBh
dGNoIGlzIHByb3Blcmx5IG1vdGl2YXRlZC4KCkFjaywgYnV0IHdpdGggb25lIGNhdmVhdDogYnJp
ZGdlLT5kZXYgaXMgdGhlIHN0cnVjdCBkcm1fZGV2aWNlIHRoYXQgaXMKdGhlIGJyaWRnZSBjbGll
bnQsIHdlIG5lZWQgdG8gYWRkIGEgYnJpZGdlLT5kZXZpY2UgKHBhdGNoIDI5IGluIHRoaXMKc2Vy
aWVzKSB3aGljaCBpcyB0aGUgc3RydWN0IGRldmljZSB0aGF0IHdpbGwgbWFuYWdlIHRoZSBicmlk
Z2UgbGlmZXRpbWUuCgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2Uu
YyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgaW5jbHVkZS9kcm0vZHJt
X2JyaWRnZS5oICAgICB8ICA0ICsrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlv
bnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gPiBpbmRleCBjYmE1MzdjOTllNDMuLmNi
ZTY4MGFhNmVhYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKPiA+IEBAIC04OSw2ICs4OSwz
NSBAQCB2b2lkIGRybV9icmlkZ2VfcmVtb3ZlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4g
PiAgfQo+ID4gIEVYUE9SVF9TWU1CT0woZHJtX2JyaWRnZV9yZW1vdmUpOwo+ID4gIAo+ID4gKy8q
Kgo+ID4gKyAqIGRybV9icmlkZ2VfaW5pdCAtIGluaXRpYWxpc2UgYSBkcm1fYnJpZGdlIHN0cnVj
dHVyZQo+ID4gKyAqCj4gPiArICogQGJyaWRnZTogYnJpZGdlIGNvbnRyb2wgc3RydWN0dXJlCj4g
PiArICogQGZ1bmNzOiBjb250cm9sIGZ1bmN0aW9ucwo+ID4gKyAqIEBkZXY6IGRldmljZQo+ID4g
KyAqIEB0aW1pbmdzOiB0aW1pbmcgc3BlY2lmaWNhdGlvbiBmb3IgdGhlIGJyaWRnZTsgb3B0aW9u
YWwgKG1heSBiZSBOVUxMKQo+ID4gKyAqIEBkcml2ZXJfcHJpdmF0ZTogcG9pbnRlciB0byB0aGUg
YnJpZGdlIGRyaXZlciBpbnRlcm5hbCBjb250ZXh0IChtYXkgYmUgTlVMTCkKPiAKPiBQbGVhc2Ug
YWxzbyBzcHJpbmtsZSBzb21lIGxpbmtzIHRvIHRoaXMgbmV3IGZ1bmN0aW9uIHRvIHJlbGV2YW50
IHBsYWNlcywKPiBJJ2QgYWRkIGF0IGxlYXN0Ogo+IAo+ICJEcml2ZXJzIHNob3VsZCBjYWxsIGRy
bV9icmlkZ2VfaW5pdCgpIGZpcnN0LiIgdG8gdGhlIGtlcm5lbGRvYyBmb3IKPiBkcm1fYnJpZGdl
X2FkZC4gZHJtX2JyaWRnZV9hZGQgc2hvdWxkIGFsc28gbWVudGlvbiBkcm1fYnJpZGdlX3JlbW92
ZSBhcwo+IHRoZSB1bmRvIGZ1bmN0aW9uLgo+IAo+IEFuZCBwZXJoYXBzIGEgbG9uZ2VyIHBhcmFn
cmFwaCB0byAmc3RydWN0IGRybV9icmlkZ2U6Cj4gCj4gIkJyaWRnZSBkcml2ZXJzIHNob3VsZCBj
YWxsIGRybV9icmlkZ2VfaW5pdCgpIHRvIGluaXRpYWxpemVkIGEgYnJpZGdlCj4gZHJpdmVyLCBh
bmQgdGhlbiByZWdpc3RlciBpdCB3aXRoIGRybV9icmlkZ2VfYWRkKCkuCj4gCj4gIlVzZXJzIG9m
IGJyaWRnZXMgbGluayBhIGJyaWRnZSBkcml2ZXIgaW50byB0aGVpciBvdmVyYWxsIGRpc3BsYXkg
b3V0cHV0Cj4gcGlwZWxpbmUgYnkgY2FsbGluZyBkcm1fYnJpZGdlX2F0dGFjaCgpLiIKCldpbGwg
ZG8uCgo+IAo+ID4gKyAqLwo+ID4gK3ZvaWQgZHJtX2JyaWRnZV9pbml0KHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICsJCSAgICAgY29uc3Qgc3RydWN0
IGRybV9icmlkZ2VfZnVuY3MgKmZ1bmNzLAo+ID4gKwkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Jy
aWRnZV90aW1pbmdzICp0aW1pbmdzLAo+ID4gKwkJICAgICB2b2lkICpkcml2ZXJfcHJpdmF0ZSkK
PiA+ICt7Cj4gPiArCVdBUk5fT04oIWZ1bmNzKTsKPiA+ICsKPiA+ICsJYnJpZGdlLT5kZXYgPSBO
VUxMOwo+IAo+IEdpdmVuIHRoYXQgdGhlIGdvYWwgaGVyZSBpcyB0byBnZXQgYnJpZGdlLT5kZXYg
c2V0IHVwLCB3aHkgbm90Cj4gCj4gCVdBUk5fT04oIWRldik7Cj4gCWJyaWRnZS0+ZGV2ID0gZGV2
OwoKU2VlIGFib3ZlIHN0cnVjdCBkZXZpY2UgdnMgc3RydWN0IGRybV9kZXZpY2UuIEkgYWRkIGEK
CglicmlkZ2UtPmRldmljZSA9IGRldjsKCmluIHBhdGNoIDI5LCB3aGljaCB0YWtlcyBjYXJlIG9m
IHRoYXQuIEkgc2tpcHBlZCB0aGUgd2FybiBzaW5jZQp0aGVyZSdzIGEgZGVyZWZlcmVuY2Ugb2Yg
ZGV2LCBidXQgSSBub3cgcmVhbGl6ZWQgaXQncyBiZWhpbmQgQ09ORklHX09GLApzbyBJJ2xsIGFk
ZCBpdCBpbiBmb3IgdjIuCgpZZXMsICdkZXZpY2UnIGlzbid0IHRoZSBiZXN0IG9mIG5hbWVzLCBi
dXQgSSB0b29rIFJ1c3NlbGwncyBwYXRjaAphbG1vc3QgYXMtaXMsIEkgZGlkbid0IGhhdmUgYW55
IGJldHRlciBpZGVhcyBmb3IgYmlrZXNoZWRkaW5nLgoKPiAKPiBUaGF0IHNob3VsZCBoZWxwIHVz
IHRvIHJlYWxseSBtb3ZlIGZvcndhcmQgd2l0aCBhbGwgdGhpcy4KPiAtRGFuaWVsCj4gCj4gPiAr
CWJyaWRnZS0+ZW5jb2RlciA9IE5VTEw7Cj4gPiArCWJyaWRnZS0+bmV4dCA9IE5VTEw7Cj4gPiAr
Cj4gPiArI2lmZGVmIENPTkZJR19PRgo+ID4gKwlicmlkZ2UtPm9mX25vZGUgPSBkZXYtPm9mX25v
ZGU7Cj4gPiArI2VuZGlmCj4gPiArCWJyaWRnZS0+dGltaW5ncyA9IHRpbWluZ3M7Cj4gPiArCWJy
aWRnZS0+ZnVuY3MgPSBmdW5jczsKPiA+ICsJYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZSA9IGRyaXZl
cl9wcml2YXRlOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MKGRybV9icmlkZ2VfaW5pdCk7Cj4g
PiArCj4gPiAgLyoqCj4gPiAgICogZHJtX2JyaWRnZV9hdHRhY2ggLSBhdHRhY2ggdGhlIGJyaWRn
ZSB0byBhbiBlbmNvZGVyJ3MgY2hhaW4KPiA+ICAgKgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ID4gaW5kZXggYzBh
MjI4NmE4MWU5Li5kNmQ5ZDUzMDE1NTEgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1f
YnJpZGdlLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ID4gQEAgLTQwMiw2
ICs0MDIsMTAgQEAgc3RydWN0IGRybV9icmlkZ2Ugewo+ID4gIAo+ID4gIHZvaWQgZHJtX2JyaWRn
ZV9hZGQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7Cj4gPiAgdm9pZCBkcm1fYnJpZGdlX3Jl
bW92ZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiA+ICt2b2lkIGRybV9icmlkZ2VfaW5p
dChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiArCQkg
ICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzICpmdW5jcywKPiA+ICsJCSAgICAgY29u
c3Qgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyAqdGltaW5ncywKPiA+ICsJCSAgICAgdm9pZCAq
ZHJpdmVyX3ByaXZhdGUpOwo+ID4gIHN0cnVjdCBkcm1fYnJpZGdlICpvZl9kcm1fZmluZF9icmlk
Z2Uoc3RydWN0IGRldmljZV9ub2RlICpucCk7Cj4gPiAgaW50IGRybV9icmlkZ2VfYXR0YWNoKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiA+
ICAJCSAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwcmV2aW91cyk7Cj4gCj4gCgoKLS0gCk1paGFp
bAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
