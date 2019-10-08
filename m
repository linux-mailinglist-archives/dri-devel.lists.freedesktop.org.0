Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DCDCFBAC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 15:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030CD6E147;
	Tue,  8 Oct 2019 13:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800071.outbound.protection.outlook.com [40.107.80.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243B76E133;
 Tue,  8 Oct 2019 13:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KguI1lXunwWGgYZeDpCFvspJvhVzjAzQB+8HNEeE8O6iJn7QKTHWVbfAMJUItyWWyJX7vxO6WS/J8BkMuRm9dNuhwDJOWH+QFOhzAd8h8H8gpBE+0UgAueNOZeP8coRyg5PY/rykV8A9chyORH7z4q8PIHc8XSQIxfAabEQ0Y0p/4Af2t7fur80DMavlK4WGlvXwNK/HsmUYo8TqfBkQGEMdMAmV0bg6+ZTMrV3V9hPn8isk20CC6wIBV1HvfkTrEtbwHrFreVcjlZs43UbdkisLn5uyx6FDOcPmGU1P7/4M6exHRpoSNswt6uDtdfl1XMQ2T/YrZpvL//zwIgDSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4bqg0fgD+IVE4jqw2oYMVW87YnYQEwTety7nzfXHGw=;
 b=BYPZYUmMACGPOPydcIDTAgS+vmrk7oi3ZKgEANOmeLXcha/SKDDWAFOBVWTWLrRgwe493CDrjGSAuZ7PcBuBhSLEjR+ArVTlaYlIQTsoms3OeJ6Idy7y5xCbNl7OT1FPCX613a3LkpxVfL5/kubBJo8TJJ+dyDXj2ZuwEZc7KOKeml4lgmokPmM2efD2Dhjo057XfKXhDqtyaHu/vmyaDEiInRa9U7N3VsWYCooG4Ca4GwACWttwxw9lAGnONOaclqjXYLO+Lwlsxd6p2QUbqSM7PMkLf6ebvy53oMMgoe7d2WWkThYlfXkmIBTCYnxK5fewXGz1tR5jzGLPkWCfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0197.namprd12.prod.outlook.com (10.174.53.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 13:56:00 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 13:56:00 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Colin King <colin.king@canonical.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: make various arrays static, makes
 object smaller
Thread-Topic: [PATCH] drm/amdgpu/display: make various arrays static, makes
 object smaller
Thread-Index: AQHVfVpui/Yh/EJ0Nk64F3CjP4dHw6dQxXKA
Date: Tue, 8 Oct 2019 13:56:00 +0000
Message-ID: <9579bfae-1db5-d282-79ea-df1966f4c123@amd.com>
References: <20191007215857.14720-1-colin.king@canonical.com>
In-Reply-To: <20191007215857.14720-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57a896c3-bc8c-46ba-b7e0-08d74bf73fee
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0197:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0197FA8803A3B5FD7797C7628C9A0@CY4PR1201MB0197.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(189003)(199004)(2201001)(14454004)(53546011)(6506007)(386003)(65956001)(25786009)(52116002)(65806001)(66066001)(76176011)(186003)(66476007)(66446008)(64756008)(66556008)(66946007)(26005)(2501003)(102836004)(316002)(54906003)(110136005)(58126008)(478600001)(2616005)(305945005)(476003)(7736002)(8676002)(446003)(6512007)(6436002)(6486002)(31696002)(6246003)(71200400001)(486006)(229853002)(36756003)(5660300002)(2906002)(11346002)(6116002)(8936002)(31686004)(99286004)(256004)(81156014)(81166006)(3846002)(71190400001)(4326008)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0197;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ueGpsCHVtovM7AEn6Jpz5v9aigTki2plxb5Or5BL4yl9cGi95SrJetTbEerPOxR9uMcV80Q8XGxvVwJwPnGi92Zn/5Zcnt60bAB1gxj80KobJcCk4k2mHuFPs8a8Udmq/AbwLE59y3ZdNf9vdYB/EWGLgPKGKlv0D18onL57TyqGw1irP4TAKgYp2h724plbdsRPXDEqLS9S+VEwlTuhgCvfyMjB9W/T1wHO9rJh5esT2wjYHb7JjthiTq+NSGYLmUGCbfkOqgYp5wng+S5U+bq0qnK8fTUFv5RqZCW03ZZ4Rl63fr6FUKjJmzSH3v81c/R6bvvcZZ+65jX2v+eshWjNNS0u+21nqgFWXmcwonfYQGmlGTkvZkdtzCHDD1rW7sUeLg8B1KFDBMI07ddL184YKN+P+q5Tw34fLiwfAEo=
Content-ID: <97F77E734A27F1469061A04F2F087279@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a896c3-bc8c-46ba-b7e0-08d74bf73fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 13:56:00.1867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39b7err/D7hzoo4hPsL0hUGIn9MwZ5SkB9fz5HL3RNYFi021ZzptdEMyJesK56QgabZAI/awIRdimTPpyjzfoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4bqg0fgD+IVE4jqw2oYMVW87YnYQEwTety7nzfXHGw=;
 b=sK2EwAbEvebQapIbRodYAfl1/qk5Rmabp3PXT9TLEgmRuAic6vjli6kXXfBfd1NQncb40K20RPYmujInn90x4yRACGNHttbecEcjC+3ZWdkk6djg9U8S3qW29skmt+fu+GmuWHjLy8XlkbSIz+l0hwuJXy+Nz2G70n4SSGFMq2Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wNyA1OjU4IHAubS4sIENvbGluIEtpbmcgd3JvdGU6DQo+IEZyb206IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0KPiBEb24ndCBwb3B1bGF0
ZSB0aGUgYXJyYXlzIG9uIHRoZSBzdGFjayBidXQgaW5zdGVhZCBtYWtlIHRoZW0NCj4gc3RhdGlj
LiBNYWtlcyB0aGUgb2JqZWN0IGNvZGUgc21hbGxlciBieSAxNTggYnl0ZXMuDQo+IA0KPiBCZWZv
cmU6DQo+ICAgIHRleHQJICAgZGF0YQkgICAgYnNzCSAgICBkZWMJICAgIGhleAlmaWxlbmFtZQ0K
PiAgIDMyNDY4CSAgIDIwNzIJICAgICAgMAkgIDM0NTQwCSAgIDg2ZWMJZGlzcGxheS9kYy9iaW9z
L2Jpb3NfcGFyc2VyLm8NCj4gICAyMjE5OAkgICAxMDg4CSAgICAgIDAJICAyMzI4NgkgICA1YWY2
CWRpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIubw0KPiAgIDIyMjc4CSAgIDEwNzYJICAgICAg
MAkgIDIzMzU0CSAgIDViM2EJZGlzcGxheS9kYy9kY2UvZGNlX21lbV9pbnB1dC5vDQo+IA0KPiA4
MTE4MA0KPiBBZnRlcjoNCj4gICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4
CWZpbGVuYW1lDQo+ICAgMzIzNDEJICAgMjEzNgkgICAgICAwCSAgMzQ0NzcJICAgODZhZAlkaXNw
bGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIubw0KPiAgIDIyMDcwCSAgIDExODQJICAgICAgMAkgIDIz
MjU0CSAgIDVhZDYJZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5vDQo+ICAgMjIxMTkJICAg
MTE3MgkgICAgICAwCSAgMjMyOTEJICAgNWFmYglkaXNwbGF5L2RjL2RjZS9kY2VfbWVtX2lucHV0
Lm8NCj4gDQo+IChnY2MgdmVyc2lvbiA5LjIuMSwgYW1kNjQpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmMgIHwgMiArLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIyLmMgfCAy
ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9tZW1faW5wdXQu
YyB8IDIgKy0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9i
aW9zL2Jpb3NfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9i
aW9zX3BhcnNlci5jDQo+IGluZGV4IDIyMWUwZjU2Mzg5Zi4uNjVhYjIyNWNmNTQyIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2Vy
LmMNCj4gQEAgLTI3NDUsNyArMjc0NSw3IEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3VsdCBiaW9zX2dl
dF9ib2FyZF9sYXlvdXRfaW5mbygNCj4gIAlzdHJ1Y3QgYmlvc19wYXJzZXIgKmJwOw0KPiAgCWVu
dW0gYnBfcmVzdWx0IHJlY29yZF9yZXN1bHQ7DQo+ICANCj4gLQljb25zdCB1bnNpZ25lZCBpbnQg
c2xvdF9pbmRleF90b192Ymlvc19pZFtNQVhfQk9BUkRfU0xPVFNdID0gew0KPiArCXN0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgc2xvdF9pbmRleF90b192Ymlvc19pZFtNQVhfQk9BUkRfU0xPVFNd
ID0gew0KDQpXb24ndCB0aGlzIGJyZWFrIHRoZSBtdWx0aS1HUFUgY2FzZSB3aGVyZSB5b3UnbGwg
aGF2ZSBtdWx0aXBsZSBkcml2ZXINCmluc3RhbmNlcyB3aXRoIGRpZmZlcmVudCBsYXlvdXQ/DQoN
CkhhcnJ5DQoNCj4gIAkJR0VORVJJQ09CSkVDVF9CUkFDS0VUX0xBWU9VVF9FTlVNX0lEMSwNCj4g
IAkJR0VORVJJQ09CSkVDVF9CUkFDS0VUX0xBWU9VVF9FTlVNX0lEMiwNCj4gIAkJMCwgMA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJz
ZXIyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIu
Yw0KPiBpbmRleCBkZmY2NWMwZmU4MmYuLjgwOWM0YTg5Yjg5OSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIyLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIyLmMNCj4gQEAg
LTE4MzIsNyArMTgzMiw3IEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3VsdCBiaW9zX2dldF9ib2FyZF9s
YXlvdXRfaW5mbygNCj4gIAlzdHJ1Y3QgYmlvc19wYXJzZXIgKmJwOw0KPiAgCWVudW0gYnBfcmVz
dWx0IHJlY29yZF9yZXN1bHQ7DQo+ICANCj4gLQljb25zdCB1bnNpZ25lZCBpbnQgc2xvdF9pbmRl
eF90b192Ymlvc19pZFtNQVhfQk9BUkRfU0xPVFNdID0gew0KPiArCXN0YXRpYyBjb25zdCB1bnNp
Z25lZCBpbnQgc2xvdF9pbmRleF90b192Ymlvc19pZFtNQVhfQk9BUkRfU0xPVFNdID0gew0KPiAg
CQlHRU5FUklDT0JKRUNUX0JSQUNLRVRfTEFZT1VUX0VOVU1fSUQxLA0KPiAgCQlHRU5FUklDT0JK
RUNUX0JSQUNLRVRfTEFZT1VUX0VOVU1fSUQyLA0KPiAgCQkwLCAwDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9tZW1faW5wdXQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX21lbV9pbnB1dC5jDQo+IGluZGV4IDhh
YTkzN2Y0OTZjNC4uZWQwMDMxZDVlMDIxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9tZW1faW5wdXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9tZW1faW5wdXQuYw0KPiBAQCAtMzk1LDcgKzM5NSw3
IEBAIHN0YXRpYyB2b2lkIHByb2dyYW1fc2l6ZV9hbmRfcm90YXRpb24oDQo+ICB7DQo+ICAJY29u
c3Qgc3RydWN0IHJlY3QgKmluX3JlY3QgPSAmcGxhbmVfc2l6ZS0+c3VyZmFjZV9zaXplOw0KPiAg
CXN0cnVjdCByZWN0IGh3X3JlY3QgPSBwbGFuZV9zaXplLT5zdXJmYWNlX3NpemU7DQo+IC0JY29u
c3QgdWludDMyX3Qgcm90YXRpb25fYW5nbGVzW1JPVEFUSU9OX0FOR0xFX0NPVU5UXSA9IHsNCj4g
KwlzdGF0aWMgY29uc3QgdWludDMyX3Qgcm90YXRpb25fYW5nbGVzW1JPVEFUSU9OX0FOR0xFX0NP
VU5UXSA9IHsNCj4gIAkJCVtST1RBVElPTl9BTkdMRV8wXSA9IDAsDQo+ICAJCQlbUk9UQVRJT05f
QU5HTEVfOTBdID0gMSwNCj4gIAkJCVtST1RBVElPTl9BTkdMRV8xODBdID0gMiwNCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
