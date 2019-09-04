Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3CA838D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 15:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F286C89B20;
	Wed,  4 Sep 2019 13:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720060.outbound.protection.outlook.com [40.107.72.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D074894DD;
 Wed,  4 Sep 2019 13:18:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOogiED8RAXOuJ/PKWJJSseyAvRD7uGcE85GfdaVbwuAL194WLHTbwqEAZ+o4GrS6PMSzHbL9shCWtNyg9z/Sl3Yfj4hfLdeBaVrNJXHDDNXxKU+IKBbV+DbTyXuKFGllPOxTH13rXwBdsp75JDJWReeQM52vnInmQNsSjHioun9OAuVxIP8UyPbfxzrb3dyiJ8OSkcgMMQFKyXQkVzE+xe+C93eF3Q7zdlvShZRLmOFKG3rGmLrDenEfFYcA7M5acTMnJ3RRYTsRCo4oPL2Mgt16duPrT68s4KqB42FmOTDmmRgp02KQOyaQEQGXL/Qddm9xMA8A87SaZwAdw7pBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E4Hx5iDIjlABzPtsodcAw1JvOoKp0CLGSYRbCTHDNY=;
 b=CrtUwDMNOsmSOJv7H/mx+i+Y8PhG4XXg113NnR5Tdq8WT3cFYGEnMV0Nsy2nkirdHq8USxq5gOMBkW0lTWlUkrmdZwmjykj/5SmCqYh8J7KjrroYn0v6fOS5uJ8cU0nz1TQPMlLSz3UZvoHZJDC+TRjKU3Tsyh1xhF6GGVnrLheu9YMrHHROOzp3WG+B5wUDbpBzMFZS2IVwN+Do7hS49WhQ9cxsjYW5ER0xdLAK4pfqCrbXuFonOG6vkBymyO1ALXV+8pXjcWXFLn30WJaoNwHML+5EDLogPD4JowuGCcYVNnTgr+AFf4lQNJBgPjYaXpHcDURA3HKCllSmlg4jKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0152.namprd12.prod.outlook.com (10.172.77.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Wed, 4 Sep 2019 13:18:32 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 13:18:32 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Jean Delvare <jdelvare@suse.de>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/amd: be quiet when no SAD block is found
Thread-Topic: [PATCH v2 1/3] drm/amd: be quiet when no SAD block is found
Thread-Index: AQHVYwDpstTz2NJH6E2fVmfEjSnc9qcbgHmA
Date: Wed, 4 Sep 2019 13:18:32 +0000
Message-ID: <aa218fd9-2d34-6eff-9508-2d81d26c16c5@amd.com>
References: <20190904111152.266d5176@endymion>
 <20190904111248.61dfdd68@endymion>
In-Reply-To: <20190904111248.61dfdd68@endymion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c08d547-c4c0-45e7-6743-08d7313a620c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0152; 
x-ms-traffictypediagnostic: CY4PR1201MB0152:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0152EA89A7B3F449EAFF6BC68CB80@CY4PR1201MB0152.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(189003)(199004)(66556008)(64756008)(66446008)(66476007)(52116002)(316002)(4326008)(36756003)(229853002)(31696002)(66946007)(25786009)(2201001)(5660300002)(53936002)(966005)(478600001)(8676002)(81166006)(2501003)(54906003)(81156014)(14454004)(99286004)(58126008)(6486002)(8936002)(76176011)(6436002)(65956001)(305945005)(65806001)(476003)(6506007)(26005)(7736002)(386003)(2616005)(66066001)(6512007)(31686004)(486006)(11346002)(6306002)(6246003)(71200400001)(71190400001)(256004)(102836004)(446003)(53546011)(2906002)(6116002)(186003)(110136005)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0152;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DIUFQohgX3lM0klbt6lE8C5ArmuGIN3lzQdzlGs8NCLjgrl9A3xILBUOsrAMX1PRlndPpG+idh2IX+Ndqcw9XwCKBkITWIcMzA+kp/3hv1DdZ7UN7tac/5BMUeH7oMDq6D2NqIO0gIIgyP4uNMdpFq940sMs2ypG/Wu7uWK62ARE3LWsvO5YUEwgJZyCg28yjm58HOIAAemgDKrnGnLvK4/k0aw9rCKc1DlNgIWbrL4aAhuOFSAOGfd97J3E0VR2LH0BWzD36A3wyq0U930Vxgw6HWHPj/INY3SAfJQMtEdEZEh2/A7wgdxI20eKbBbe6Xg9ZnuPejZQBF6JUsDmrPgTlHYgbu4SKSS2atE2IHgsHDGBelsYl6d+j2iVLIUruIaO4+aiuP/7pmA/qFc9FJmceZN12imbhwmmNl63TSA=
Content-ID: <3130AFEA5F480544AD398E77372D16F2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c08d547-c4c0-45e7-6743-08d7313a620c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 13:18:32.1667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cAFBraU7sY1f1pThMLxHDpFmAngTO/SnUBqa3Lbw/X7YPEY3gO3vYjwh5wfaTnLYuf7wDOmKZsv7GsdBEuennw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E4Hx5iDIjlABzPtsodcAw1JvOoKp0CLGSYRbCTHDNY=;
 b=shS6kEs8y1nblCYoOS5YnTdG3f30jBkgvyQzDssNS5fxPwZ5EALxTMhKtUmBjO7qaPld3kkfOafGmW23gtZ2b9sxzIWd0Wk1gSKW+GvO7uC20D1G4wSdbhzCdHvHH/ZA6e/A17GgfmwBNUHgKsG5lxzIbj7924yaMxueTvjQqCk=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wNCA1OjEyIGEubS4sIEplYW4gRGVsdmFyZSB3cm90ZToNCj4gSXQgaXMgZmlu
ZSBmb3IgZGlzcGxheXMgd2l0aG91dCBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIG5vdCBwcm92aWRl
DQo+IGFueSBTQUQgYmxvY2sgaW4gdGhlaXIgRURJRC4gRG8gbm90IGxvZyBhbiBlcnJvciBpbiB0
aGF0IGNhc2UsDQo+IGp1c3QgcmV0dXJuIHF1aWV0bHkuDQo+IA0KPiBUaGlzIGZpeGVzIGhhbGYg
b2YgYnVnIGZkbyMxMDc4MjU6DQo+IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19i
dWcuY2dpP2lkPTEwNzgyNQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmVhbiBEZWx2YXJlIDxqZGVs
dmFyZUBzdXNlLmRlPg0KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPg0KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+IENjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2aWQxLlpob3VAYW1kLmNvbT4NCj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBh
bWQuY29tPg0KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQoNClJldmlld2VkLWJ5
OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAt
LS0NCj4gTm8gY2hhbmdlIHNpbmNlIHYxLg0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RjZV92MTBfMC5jICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKystLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMV8wLmMgICAgICAgICAgICAgICAgICAgIHwgICAg
NCArKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jICAgICAgICAg
ICAgICAgICAgICAgfCAgICA0ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Rj
ZV92OF8wLmMgICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKystLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgICAgNyArKyst
LS0tDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygt
KQ0KPiANCj4gLS0tIGxpbnV4LTUuMi5vcmlnL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Rj
ZV92MTBfMC5jCTIwMTktMDctMDggMDA6NDE6NTYuMDAwMDAwMDAwICswMjAwDQo+ICsrKyBsaW51
eC01LjIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMF8wLmMJMjAxOS0wOC0zMCAx
NDoyODo0Ni4wODE2ODIyMjMgKzAyMDANCj4gQEAgLTEzNDUsMTAgKzEzNDUsMTAgQEAgc3RhdGlj
IHZvaWQgZGNlX3YxMF8wX2F1ZGlvX3dyaXRlX3NhZF9yZQ0KPiAgCX0NCj4gIA0KPiAgCXNhZF9j
b3VudCA9IGRybV9lZGlkX3RvX3NhZChhbWRncHVfY29ubmVjdG9yX2VkaWQoY29ubmVjdG9yKSwg
JnNhZHMpOw0KPiAtCWlmIChzYWRfY291bnQgPD0gMCkgew0KPiArCWlmIChzYWRfY291bnQgPCAw
KQ0KPiAgCQlEUk1fRVJST1IoIkNvdWxkbid0IHJlYWQgU0FEczogJWRcbiIsIHNhZF9jb3VudCk7
DQo+ICsJaWYgKHNhZF9jb3VudCA8PSAwKQ0KPiAgCQlyZXR1cm47DQo+IC0JfQ0KPiAgCUJVR19P
Tighc2Fkcyk7DQo+ICANCj4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShlbGRfcmVnX3Rv
X3R5cGUpOyBpKyspIHsNCj4gLS0tIGxpbnV4LTUuMi5vcmlnL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2RjZV92MTFfMC5jCTIwMTktMDctMDggMDA6NDE6NTYuMDAwMDAwMDAwICswMjAwDQo+
ICsrKyBsaW51eC01LjIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMV8wLmMJMjAx
OS0wOC0zMCAxNDoyOToyNy4yNzYyMDUzMTAgKzAyMDANCj4gQEAgLTEzNzEsMTAgKzEzNzEsMTAg
QEAgc3RhdGljIHZvaWQgZGNlX3YxMV8wX2F1ZGlvX3dyaXRlX3NhZF9yZQ0KPiAgCX0NCj4gIA0K
PiAgCXNhZF9jb3VudCA9IGRybV9lZGlkX3RvX3NhZChhbWRncHVfY29ubmVjdG9yX2VkaWQoY29u
bmVjdG9yKSwgJnNhZHMpOw0KPiAtCWlmIChzYWRfY291bnQgPD0gMCkgew0KPiArCWlmIChzYWRf
Y291bnQgPCAwKQ0KPiAgCQlEUk1fRVJST1IoIkNvdWxkbid0IHJlYWQgU0FEczogJWRcbiIsIHNh
ZF9jb3VudCk7DQo+ICsJaWYgKHNhZF9jb3VudCA8PSAwKQ0KPiAgCQlyZXR1cm47DQo+IC0JfQ0K
PiAgCUJVR19PTighc2Fkcyk7DQo+ICANCj4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShl
bGRfcmVnX3RvX3R5cGUpOyBpKyspIHsNCj4gLS0tIGxpbnV4LTUuMi5vcmlnL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2RjZV92Nl8wLmMJMjAxOS0wNy0wOCAwMDo0MTo1Ni4wMDAwMDAwMDAg
KzAyMDANCj4gKysrIGxpbnV4LTUuMi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZf
MC5jCTIwMTktMDgtMzAgMTc6NTg6NTMuNjEzOTUzNDU4ICswMjAwDQo+IEBAIC0xMjQ4LDEwICsx
MjQ4LDEwIEBAIHN0YXRpYyB2b2lkIGRjZV92Nl8wX2F1ZGlvX3dyaXRlX3NhZF9yZWcNCj4gIAl9
DQo+ICANCj4gIAlzYWRfY291bnQgPSBkcm1fZWRpZF90b19zYWQoYW1kZ3B1X2Nvbm5lY3Rvcl9l
ZGlkKGNvbm5lY3RvciksICZzYWRzKTsNCj4gLQlpZiAoc2FkX2NvdW50IDw9IDApIHsNCj4gKwlp
ZiAoc2FkX2NvdW50IDwgMCkNCj4gIAkJRFJNX0VSUk9SKCJDb3VsZG4ndCByZWFkIFNBRHM6ICVk
XG4iLCBzYWRfY291bnQpOw0KPiArCWlmIChzYWRfY291bnQgPD0gMCkNCj4gIAkJcmV0dXJuOw0K
PiAtCX0NCj4gIA0KPiAgCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGVsZF9yZWdfdG9fdHlw
ZSk7IGkrKykgew0KPiAgCQl1MzIgdG1wID0gMDsNCj4gLS0tIGxpbnV4LTUuMi5vcmlnL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92OF8wLmMJMjAxOS0wNy0wOCAwMDo0MTo1Ni4wMDAw
MDAwMDAgKzAyMDANCj4gKysrIGxpbnV4LTUuMi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9k
Y2VfdjhfMC5jCTIwMTktMDgtMzAgMTQ6Mjk6MDEuOTQ4ODgzNzA4ICswMjAwDQo+IEBAIC0xMjk4
LDEwICsxMjk4LDEwIEBAIHN0YXRpYyB2b2lkIGRjZV92OF8wX2F1ZGlvX3dyaXRlX3NhZF9yZWcN
Cj4gIAl9DQo+ICANCj4gIAlzYWRfY291bnQgPSBkcm1fZWRpZF90b19zYWQoYW1kZ3B1X2Nvbm5l
Y3Rvcl9lZGlkKGNvbm5lY3RvciksICZzYWRzKTsNCj4gLQlpZiAoc2FkX2NvdW50IDw9IDApIHsN
Cj4gKwlpZiAoc2FkX2NvdW50IDwgMCkNCj4gIAkJRFJNX0VSUk9SKCJDb3VsZG4ndCByZWFkIFNB
RHM6ICVkXG4iLCBzYWRfY291bnQpOw0KPiArCWlmIChzYWRfY291bnQgPD0gMCkNCj4gIAkJcmV0
dXJuOw0KPiAtCX0NCj4gIAlCVUdfT04oIXNhZHMpOw0KPiAgDQo+ICAJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUoZWxkX3JlZ190b190eXBlKTsgaSsrKSB7DQo+IC0tLSBsaW51eC01LjIub3Jp
Zy9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJz
LmMJMjAxOS0wNy0wOCAwMDo0MTo1Ni4wMDAwMDAwMDAgKzAyMDANCj4gKysrIGxpbnV4LTUuMi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMJ
MjAxOS0wOC0zMCAxNDozMTowMy4wODY0MjE5MTAgKzAyMDANCj4gQEAgLTk4LDExICs5OCwxMCBA
QCBlbnVtIGRjX2VkaWRfc3RhdHVzIGRtX2hlbHBlcnNfcGFyc2VfZWRpDQo+ICAJCQkoc3RydWN0
IGVkaWQgKikgZWRpZC0+cmF3X2VkaWQpOw0KPiAgDQo+ICAJc2FkX2NvdW50ID0gZHJtX2VkaWRf
dG9fc2FkKChzdHJ1Y3QgZWRpZCAqKSBlZGlkLT5yYXdfZWRpZCwgJnNhZHMpOw0KPiAtCWlmIChz
YWRfY291bnQgPD0gMCkgew0KPiAtCQlEUk1fSU5GTygiU0FEcyBjb3VudCBpczogJWQsIGRvbid0
IG5lZWQgdG8gcmVhZCBpdFxuIiwNCj4gLQkJCQlzYWRfY291bnQpOw0KPiArCWlmIChzYWRfY291
bnQgPCAwKQ0KPiArCQlEUk1fRVJST1IoIkNvdWxkbid0IHJlYWQgU0FEczogJWRcbiIsIHNhZF9j
b3VudCk7DQo+ICsJaWYgKHNhZF9jb3VudCA8PSAwKQ0KPiAgCQlyZXR1cm4gcmVzdWx0Ow0KPiAt
CX0NCj4gIA0KPiAgCWVkaWRfY2Fwcy0+YXVkaW9fbW9kZV9jb3VudCA9IHNhZF9jb3VudCA8IERD
X01BWF9BVURJT19ERVNDX0NPVU5UID8gc2FkX2NvdW50IDogRENfTUFYX0FVRElPX0RFU0NfQ09V
TlQ7DQo+ICAJZm9yIChpID0gMDsgaSA8IGVkaWRfY2Fwcy0+YXVkaW9fbW9kZV9jb3VudDsgKytp
KSB7DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
