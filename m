Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7403A2ACBE2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 04:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED34B896E9;
	Tue, 10 Nov 2020 03:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310103.outbound.protection.outlook.com [40.107.131.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083C0896E9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 03:33:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIv1XiuBuqpn1XeQOrCkLHMaMdtrwjHBPyQdZV4C9gXcKMgBQpU82NJ6qzjDMLnVGi+qTq6QJQ+bedb0rAWnsgWeuaSdaCyZLZmObSu2X/FY7huzYTGp95ofcxbQtW9Fp/7DYPaQ98ZBLatqWkAvFaq5mUzP0GCthCUjci6FZv4G9Q9RCEpdLrX1dJ+WfLQ0J9oC24u6t8IH4dcZwRDoDSwjJeqEAmemxL/t0tWZAYYhlHv6dJ6B5QsJoVyRBYkqcxxMDveN/mOODFb2vgADlMRTaTauh6aV3c7lZdB34uWAj64Ic5QY6esNZ2ziCqpnK+jVxbG2o6je/5UgOZE97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/Uvngsgft7GA26gfzSDWFAYjomc+baJzDdpBNUhw0Y=;
 b=evH4ueFqzM5fWvdXsJ97GJcXBr6s0pk/FIarf6tiKPE593L+RUwcwy6NyDSAyvsw1JzmwSJ+J1+FLSV7eZZwBbjQFHRUN0QPQf1Ss7CfvBz78GfYI9YSY6ZyOOBktLeGWEokOXKMFVrjSSYhEMtOhNSDLXFXyYgr5Gn6WpzauzgYlFZdPMDsHWU+39JP2OwPBSMWq/s/zzOxwtQNguACYV1MlwcR5U7MVzN7jMps6ZuOXOkkHqO8iclRgPXqT0WeZJ6zJKXDxVoDirk/IcXtpFqR0o3UI+l3dkJP9rCqubXteGmfsYQbPQ5Q6xI98mq6x+ceS+uUL3CpyrZBmu6VpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB3010.apcprd06.prod.outlook.com (2603:1096:203:90::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Tue, 10 Nov
 2020 03:33:22 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1%5]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 03:33:22 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/ast: Create chip AST2600
Thread-Topic: [PATCH] drm/ast: Create chip AST2600
Thread-Index: AQHWtnwVkhOhBcTgxUCQzqT1ECo4aam/mIuAgAEZjhA=
Date: Tue, 10 Nov 2020 03:33:22 +0000
Message-ID: <HK2PR06MB33003C10AA74ABE7FD8697628CE90@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20201109093812.161483-1-kuohsiang_chou@aspeedtech.com>
 <fd2cdee4-3eb3-facd-5398-56d74fa7cf14@suse.de>
In-Reply-To: <fd2cdee4-3eb3-facd-5398-56d74fa7cf14@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cedb1053-1d0b-4c69-4a99-08d88529601a
x-ms-traffictypediagnostic: HK0PR06MB3010:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB301019FD8E1408192A19C2CD8CE90@HK0PR06MB3010.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nxKmlvdeEood5conokDALePA1sqgnKi72ZhMNAqQOraxK+F9OB25fnxDrYG7WMXv/o8Sx9XS6sfOF4Xm4sHP9gU8mCdBP3Y4s1fLH0qSanmlMoRRae1qJUoR8EdpWPAVTxlJWJ3+q6cOPFx6qy8KHCllUsNwrAH1/aAT8/pAyNnF67/53IZ2v/OKBOLSYwfQd8Oni0Nc1j1GNz1tj5cIZkX/dOG1s3I3GSPX0coed9uaX765vEv835DM8wywskUPiAgFxJLS2AAhUrXj4odIbeL2Y+7bFVqAndK6MTvGdFpuabmgVXYUUtL1Ap/jHwQczLVhpiy4h3IvyGgxoCrWOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(376002)(39840400004)(396003)(2906002)(186003)(53546011)(6506007)(55236004)(26005)(5660300002)(316002)(33656002)(110136005)(66556008)(86362001)(71200400001)(52536014)(66946007)(66446008)(64756008)(76116006)(107886003)(83380400001)(4326008)(66574015)(54906003)(66476007)(478600001)(7696005)(8676002)(8936002)(55016002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MPVQ7zx4VV4cpNNuJhgBeZMz1DVyyA10D6KslUM4im214G1SV6XlDKYPXof4NbOKzeGfT9pwVZeaNjVGwHDkJKH/1B45yy1SKtMORAc23ri7XUdKfIHi4rWVIFhX6yKKpvT3sl0/8rs9aZsm3/Tp+SpM6eeChMfaxRne7/Z6g5ZSqngyOu7G4wNYWh9wli3HNBqgxftREryTkUq13rnQ+2YQ2OP9o1J2gVbQ015BEVna2fPYzTnEKwe+7KxZGM/WqHOBYQiUOivAbg8+4RWUId/I+ImAnlChd0hCiBNiQ8Y4IaPe+5EHxybqE1hWTYRcahuH4IesP7xmX7CMRidQ12ieMMLoXUH80bDdabiQUL7jNRn+nHI3b/rCaFui74gSW/K0ZhG7fbS/8XV4XQ4+c17na6nHKNVXVXtSYeXl8Iw0QzNXYsKvMUs2holFsXjw3o5Wtj2w9j7ZYYUA49TVba+b3XW2Ok9i+cwgT8615AcKE7HyQ/6D6zx6NXYRqsNtJqagXAnsSddV029buwUVzO5tZIxdLKFoCBFUoQnzfXf0kkad68g4IoLXo922/6g7ce+11UJXOtya+qT6+xmhDSTE/D9p+UOF1o13kvn9mUr1TAqU9K7Y9eu4Kk5mm0mBxWZV+cgmKuoRYPRQbjUsUw==
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedb1053-1d0b-4c69-4a99-08d88529601a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 03:33:22.3855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: caKUcyzXrBgBW6qSSIx12UaQf12U8hOY5o+EsboTE4rZmly1JcqhPxzwWYaUvayFYy1+A9xmuuCFwISXLqtBZfNLLjfFevo05R5IWzrsYQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3010
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Tommy Huang <tommy_huang@aspeedtech.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung <arc_sung@aspeedtech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFRob21hcywNCg0KT0ssIEkgd2lsbCBkZXNjcmliZSB0aGUgcGF0Y2ggbW9yZSBwcmVjaXNl
bHkgaW4gdGhlIGZ1dHVyZS4gVGhhbmtzIGFnYWluISEhDQoNCkhhdmUgYSBnb29kIGRheS4NCglL
dW8tSHNpYW5nIENob3UNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRob21h
cyBaaW1tZXJtYW5uIFttYWlsdG86dHppbW1lcm1hbm5Ac3VzZS5kZV0gDQpTZW50OiBNb25kYXks
IE5vdmVtYmVyIDA5LCAyMDIwIDY6MjYgUE0NClRvOiBLdW8tSHNpYW5nIENob3UgPGt1b2hzaWFu
Z19jaG91QGFzcGVlZHRlY2guY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KQ2M6IGFpcmxpZWRAcmVkaGF0LmNvbTsgYWly
bGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBKZW5taW4gWXVhbiA8amVubWluX3l1YW5A
YXNwZWVkdGVjaC5jb20+OyBBcmMgU3VuZyA8YXJjX3N1bmdAYXNwZWVkdGVjaC5jb20+OyBUb21t
eSBIdWFuZyA8dG9tbXlfaHVhbmdAYXNwZWVkdGVjaC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm0vYXN0OiBDcmVhdGUgY2hpcCBBU1QyNjAwDQoNCkhpDQoNCkFtIDA5LjExLjIwIHVtIDEw
OjM4IHNjaHJpZWIgS3VvSHNpYW5nIENob3U6DQo+IFtOZXddIFN1cHBvcnQgQVNUMjYwMA0KDQpB
IHN0eWxlIGlzc3VlOiBiZXR0ZXIgd3JpdGUgYSBuaWNlIHNlbnRlbmNlIHRoYW4gdGhlc2UgdGFn
cy4gIEZvciB0aGUgcGF0Y2ggYXQgaGFuZCwgSSdkIHByZWZlcnJlZCBzb21ldGhpbmcgbGlrZTog
Ik9ubHkgYWRkIGFuIGlkIGZvciBzdXBwb3J0aW5nIEFTVDI2MDAuIE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcyBhcmUgcmVxdWlyZWQuIg0KDQpJIGFzc3VtZSB0aGF0IHRoZXJlIGFyZW5vIGZ1cnRoZXIg
Y2hhbmdlcyByZXF1aXJlZCBmb3IgQVNUMjYwMC4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3Vv
SHNpYW5nIENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2guY29tPg0KDQpSZXZpZXdlZC1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkknbGwgYWRkIHRo
ZSBwYXRjaCB0byBkcm0tbWlzYy1uZXh0LiBUaGFua3MhDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgfCAxICsNCj4gIGRy
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyB8IDUgKysrKy0NCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
ZHJ2LmggaW5kZXggNDY3MDQ5Y2E4NDMwLi42YjllM2I5NGE3MTIgDQo+IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcnYuaA0KPiBAQCAtNjMsNiArNjMsNyBAQCBlbnVtIGFzdF9jaGlwIHsNCj4gIAlB
U1QyMzAwLA0KPiAgCUFTVDI0MDAsDQo+ICAJQVNUMjUwMCwNCj4gKwlBU1QyNjAwLA0KPiAgfTsN
Cj4gDQo+ICBlbnVtIGFzdF90eF9jaGlwIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21haW4uYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgaW5k
ZXggNzcwNjZiY2E4NzkzLi40ZWM2ODg0ZjZjNjUgDQo+IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
bWFpbi5jDQo+IEBAIC0xNDMsNyArMTQzLDEwIEBAIHN0YXRpYyBpbnQgYXN0X2RldGVjdF9jaGlw
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgKm5lZWRfcG9zdCkNCj4gIAlhc3RfZGV0ZWN0
X2NvbmZpZ19tb2RlKGRldiwgJnNjdV9yZXYpOw0KPiANCj4gIAkvKiBJZGVudGlmeSBjaGlwc2V0
ICovDQo+IC0JaWYgKGRldi0+cGRldi0+cmV2aXNpb24gPj0gMHg0MCkgew0KPiArCWlmIChkZXYt
PnBkZXYtPnJldmlzaW9uID49IDB4NTApIHsNCj4gKwkJYXN0LT5jaGlwID0gQVNUMjYwMDsNCj4g
KwkJZHJtX2luZm8oZGV2LCAiQVNUIDI2MDAgZGV0ZWN0ZWRcbiIpOw0KPiArCX0gZWxzZSBpZiAo
ZGV2LT5wZGV2LT5yZXZpc2lvbiA+PSAweDQwKSB7DQo+ICAJCWFzdC0+Y2hpcCA9IEFTVDI1MDA7
DQo+ICAJCWRybV9pbmZvKGRldiwgIkFTVCAyNTAwIGRldGVjdGVkXG4iKTsNCj4gIAl9IGVsc2Ug
aWYgKGRldi0+cGRldi0+cmV2aXNpb24gPj0gMHgzMCkgew0KPiAtLQ0KPiAyLjE4LjQNCj4gDQoN
Ci0tDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
