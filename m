Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654D9BFB8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 21:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DC86E0E5;
	Sat, 24 Aug 2019 19:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080046E0E3;
 Sat, 24 Aug 2019 19:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZCuO2rHm8+gqTENi9U0fKZUVt36lXsyePU56FkHiCrGaNXY7g+Fk0h1gIYSkas7svCoGxzLAgPFIsC51R5TvuOlhsyksn30xUnkRac2u78rGuAk1/amPnH8gm98tMMf8icthCEXPUQ6cCs12uDkwkkrfh4jnySpu/RTjk2zhqYkykpMH6cjMsKuFN01w3i5isfZA07SkyUghXI47wg/Gg1qLEya93uxmXNZ2Mc+tZOlhHH6myuzwsSR59A6qKXp1iY4mKs7QP32Xu6dO16wLiVnsd9SH62A/YWFDtFZzhB/fYGCqjlnX9jlo1m5lI1iTa1mS07Qk/4mjpIAHTapCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMf3R78Rtw8huGE400j4z0dKUS8ZLeR8GA9GxmV04pA=;
 b=alQ9NqAiit0TAxX/PC+tGsWZDpIOc6I7QeFJPh7xSP21qblxuHDPe0fdWEaypccStYT/VkLENqzBhXfoHi2YO6x69EXqIfl8mSgCoyrNUJg+z9xtNcBSsNQ/pw/RKojPIBnUwdpcgP/4TE1Z30MhBNcRJFSRIVTwYQZQlcoyd6L1m4xl3rikEhxjKCv7YW10etuc6tQTk8JdK76vl70/+H139+RDNwGkI8quik6xkUFmOZ59CXIQar6qF4nyCtkZDDxaAQeEV1rZESsd+dFdCjqzAtMqsrFEHnYYw59+iLDGGzmQ+WpX8y5ooo5fLtPJAzVsMkjfHvCko26F35twiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1338.namprd12.prod.outlook.com (10.168.235.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 19:04:44 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 19:04:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: Give dma-fence-array distinct lockclasses
Thread-Topic: [PATCH] dma-buf: Give dma-fence-array distinct lockclasses
Thread-Index: AQHVWoQTNl2oCTyTfEeuCxOzO57wAKcKqIOA
Date: Sat, 24 Aug 2019 19:04:43 +0000
Message-ID: <1a7c7518-1efd-39d4-fee5-b7ac76c50de0@amd.com>
References: <20190824135848.8571-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190824135848.8571-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0197.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::17) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5980c39-aef5-4e5f-e6a2-08d728c5ec52
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1338; 
x-ms-traffictypediagnostic: DM5PR12MB1338:
x-microsoft-antispam-prvs: <DM5PR12MB13388A61E5825ACE928C2E5783A70@DM5PR12MB1338.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(199004)(189003)(66946007)(31686004)(102836004)(2501003)(64756008)(66476007)(66556008)(66446008)(8936002)(52116002)(25786009)(54906003)(14454004)(6506007)(386003)(53936002)(6512007)(305945005)(66574012)(476003)(99286004)(76176011)(4326008)(2616005)(486006)(5660300002)(7736002)(11346002)(256004)(446003)(110136005)(186003)(8676002)(46003)(6246003)(6436002)(36756003)(81156014)(31696002)(81166006)(316002)(65956001)(65806001)(71190400001)(229853002)(71200400001)(14444005)(478600001)(6486002)(2906002)(58126008)(6116002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1338;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fHU6s5Y0RAXBdnfRA+DgMAoqDuAthgGuqa51+gis60uq4J+P9juBt3uOOr5R1UcWSArKRCGlmKxZPH8eoTcml0RNj1ULZ2q7cuyPBLwfRGUF0sCL8Ezc7osHoqzY1ESiA2iPXj6Ypx4JKSscbUFivRBzL/GDCz+V6AZ43dVX4c68bo8keoUuFRVjLSBodbWokjCCf0tE+MGCfBueOv6NTPMX00TKaAQKPeBEwrjmM8rVjso+d0K/P+Hbyn2tCjMwQy3PT89HZyCjsqmBV3KjVkcOcWu3Ly6HRY/MOAxNrjC28l1iJjvzA3etgAWkvYMWzJVvDj3D+gzk6WugunrI/wh/QDmLT7HO38pIrVskeYzkJhEN8iDfTxiAiB73Rdwz9PJpvxEMsuHr+znIadnWGVp2dTVQXaMzyHp4M22w9F0=
x-ms-exchange-transport-forked: True
Content-ID: <4862ABA8EB94324EA9D7C62A7EB42761@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5980c39-aef5-4e5f-e6a2-08d728c5ec52
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 19:04:43.7837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nso/kuKZZZl45pvuVGUmtkqEKK7OHkiTVhD/6ADC0x8R/PhtPUzxaw7KYbbmMPsw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1338
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMf3R78Rtw8huGE400j4z0dKUS8ZLeR8GA9GxmV04pA=;
 b=vtzI4DVKI2gJWRI+60RTwGH8viHQ1O9d7lAviiBHTzz1w0V/AHi+zBpTo6gOnCduE3wHx3Xg5CIr8tt762RlKYFE/DxgxWVKvxvwQHkEFiMCW3JUuWsMxm+c6UxFIs7nxgMn+kWaL4SIGi7mfYx3SS0QY5ZHTYcOuPQlMS7wYVU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDguMTkgdW0gMTU6NTggc2NocmllYiBDaHJpcyBXaWxzb246DQo+IEluIG9yZGVyIHRv
IGFsbG93IGRtYS1mZW5jZS1hcnJheSBhcyBhIGdlbmVyaWMgY29udGFpbmVyIGZvciBmZW5jZXMs
IHdlDQo+IG5lZWQgdG8gYWxsb3cgZm9yIGl0IHRvIGNvbnRhaW4gb3RoZXIgZG1hLWZlbmNlLWFy
cmF5cy4gQnkgZ2l2aW5nIGVhY2gNCj4gZG1hLWZlbmNlLWFycmF5IGNvbnN0cnVjdGlvbiB0aGVp
ciBvd24gbG9ja2NsYXNzLCB3ZSBhbGxvdyBkaWZmZXJlbnQNCj4gdHlwZXMgb2YgZG1hLWZlbmNl
LWFycmF5IHRvIG5lc3QsIGJ1dCBzdGlsbCBkbyBub3QgYWxsb3cgb24gY2xhc3Mgb2YNCj4gZG1h
LWZlbmNlLWFycmF5IHRvIGNvbnRhaW4gaXRzZWxmIChldmVuIHRob3VnaCB0aGV5IGhhdmUgZGlz
dGluY3QNCj4gbG9ja3MpLg0KPg0KPiBJbiBwcmFjdGljZSwgdGhpcyBtZWFucyB0aGF0IGVhY2gg
c3Vic3lzdGVtIGdldHMgaXRzIG93biBkbWEtZmVuY2UtYXJyYXkNCj4gY2xhc3MgYW5kIHdlIGNh
biBmcmVlbHkgdXNlIGRtYS1mZW5jZS1hcnJheXMgYXMgY29udGFpbmVycyB3aXRoaW4gdGhlDQo+
IGRtYWJ1ZiBjb3JlIHdpdGhvdXQgYW5nZXJpbmcgbG9ja2RlcC4NCg0KSSd2ZSBjb25zaWRlcmVk
IHRoaXMgZm9yIGFzIHdlbGwuIEUuZy4gdG8gdXNlIHRoZSBkbWFfZmVuY2VfYXJyYXkgDQppbXBs
ZW1lbnRhdGlvbiBpbnN0ZWFkIG9mIGNvbWluZyB1cCB3aXRoIHRoZSBkbWFfZmVuY2VfY2hhaW4g
Y29udGFpbmVyLg0KDQpCdXQgYXMgaXQgdHVybmVkIG91dCB3aGVuIHVzZXJzcGFjZSBjYW4gY29u
dHJvbCBuZXN0aW5nLCBpdCBpcyB0cml2aWFsIA0KdG8gY2hhaW4gZW5vdWdoIGRtYV9mZW5jZV9h
cnJheXMgdG9nZXRoZXIgdG8gY2F1c2UgYW4gaW4ga2VybmVsIHN0YWNrIA0Kb3ZlcmZsb3cuIFdo
aWNoIGluIHR1cm4gY3JlYXRlcyBhIHJlYWxseSBuaWNlIGF0dGFjayB2ZWN0b3IuDQoNClNvIGFz
IGxvbmcgYXMgdXNlcnNwYWNlIGhhcyBjb250cm9sIG92ZXIgZG1hX2ZlbmNlX2FycmF5IG5lc3Rp
bmcgdGhpcyBpcyANCmEgY2xlYXIgTkFLIGFuZCBhY3R1YWxseSBleHRyZW1lbHkgZGFuZ2Vyb3Vz
Lg0KDQpJdCBhY3R1YWxseSB0b29rIG1lIHF1aXRlIGEgd2hpbGUgdG8gZ2V0IHRoZSBkbWFfZmVu
Y2VfY2hhaW4gY29udGFpbmVyIA0KcmVjdXJzaW9uIGxlc3MgdG8gYXZvaWQgc3R1ZmYgbGlrZSB0
aGlzLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlz
IFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPg0KPiAtLS0NCj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMg
fCAxMyArKysrKysrKy0tLS0tDQo+ICAgaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaCAg
IHwgMTYgKysrKysrKysrKysrLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UtYXJyYXkuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYw0KPiBp
bmRleCBkM2ZiZDk1MGJlOTQuLmQ5YmNkYmI2NmQ0NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9k
bWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jDQo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVu
Y2UtYXJyYXkuYw0KPiBAQCAtMTQ3LDEwICsxNDcsMTEgQEAgRVhQT1JUX1NZTUJPTChkbWFfZmVu
Y2VfYXJyYXlfb3BzKTsNCj4gICAgKiBJZiBAc2lnbmFsX29uX2FueSBpcyB0cnVlIHRoZSBmZW5j
ZSBhcnJheSBzaWduYWxzIGlmIGFueSBmZW5jZSBpbiB0aGUgYXJyYXkNCj4gICAgKiBzaWduYWxz
LCBvdGhlcndpc2UgaXQgc2lnbmFscyB3aGVuIGFsbCBmZW5jZXMgaW4gdGhlIGFycmF5IHNpZ25h
bC4NCj4gICAgKi8NCj4gLXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmRtYV9mZW5jZV9hcnJheV9j
cmVhdGUoaW50IG51bV9mZW5jZXMsDQo+IC0JCQkJCSAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoq
ZmVuY2VzLA0KPiAtCQkJCQkgICAgICAgdTY0IGNvbnRleHQsIHVuc2lnbmVkIHNlcW5vLA0KPiAt
CQkJCQkgICAgICAgYm9vbCBzaWduYWxfb25fYW55KQ0KPiArc3RydWN0IGRtYV9mZW5jZV9hcnJh
eSAqX19kbWFfZmVuY2VfYXJyYXlfY3JlYXRlKGludCBudW1fZmVuY2VzLA0KPiArCQkJCQkJIHN0
cnVjdCBkbWFfZmVuY2UgKipmZW5jZXMsDQo+ICsJCQkJCQkgdTY0IGNvbnRleHQsIHVuc2lnbmVk
IHNlcW5vLA0KPiArCQkJCQkJIGJvb2wgc2lnbmFsX29uX2FueSwNCj4gKwkJCQkJCSBzdHJ1Y3Qg
bG9ja19jbGFzc19rZXkgKmtleSkNCj4gICB7DQo+ICAgCXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkg
KmFycmF5Ow0KPiAgIAlzaXplX3Qgc2l6ZSA9IHNpemVvZigqYXJyYXkpOw0KPiBAQCAtMTYyLDYg
KzE2Myw4IEBAIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmRtYV9mZW5jZV9hcnJheV9jcmVhdGUo
aW50IG51bV9mZW5jZXMsDQo+ICAgCQlyZXR1cm4gTlVMTDsNCj4gICANCj4gICAJc3Bpbl9sb2Nr
X2luaXQoJmFycmF5LT5sb2NrKTsNCj4gKwlsb2NrZGVwX3NldF9jbGFzcygmYXJyYXktPmxvY2ss
IGtleSk7DQo+ICsNCj4gICAJZG1hX2ZlbmNlX2luaXQoJmFycmF5LT5iYXNlLCAmZG1hX2ZlbmNl
X2FycmF5X29wcywgJmFycmF5LT5sb2NrLA0KPiAgIAkJICAgICAgIGNvbnRleHQsIHNlcW5vKTsN
Cj4gICAJaW5pdF9pcnFfd29yaygmYXJyYXktPndvcmssIGlycV9kbWFfZmVuY2VfYXJyYXlfd29y
ayk7DQo+IEBAIC0xNzQsNyArMTc3LDcgQEAgc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqZG1hX2Zl
bmNlX2FycmF5X2NyZWF0ZShpbnQgbnVtX2ZlbmNlcywNCj4gICANCj4gICAJcmV0dXJuIGFycmF5
Ow0KPiAgIH0NCj4gLUVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2FycmF5X2NyZWF0ZSk7DQo+ICtF
WFBPUlRfU1lNQk9MKF9fZG1hX2ZlbmNlX2FycmF5X2NyZWF0ZSk7DQo+ICAgDQo+ICAgLyoqDQo+
ICAgICogZG1hX2ZlbmNlX21hdGNoX2NvbnRleHQgLSBDaGVjayBpZiBhbGwgZmVuY2VzIGFyZSBm
cm9tIHRoZSBnaXZlbiBjb250ZXh0DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1m
ZW5jZS1hcnJheS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaA0KPiBpbmRleCAz
MDNkZDcxMjIyMGYuLjEzOTVmOTQyOGNkYiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9k
bWEtZmVuY2UtYXJyYXkuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5o
DQo+IEBAIC03NCwxMCArNzQsMTggQEAgdG9fZG1hX2ZlbmNlX2FycmF5KHN0cnVjdCBkbWFfZmVu
Y2UgKmZlbmNlKQ0KPiAgIAlyZXR1cm4gY29udGFpbmVyX29mKGZlbmNlLCBzdHJ1Y3QgZG1hX2Zl
bmNlX2FycmF5LCBiYXNlKTsNCj4gICB9DQo+ICAgDQo+IC1zdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5
ICpkbWFfZmVuY2VfYXJyYXlfY3JlYXRlKGludCBudW1fZmVuY2VzLA0KPiAtCQkJCQkgICAgICAg
c3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlcywNCj4gLQkJCQkJICAgICAgIHU2NCBjb250ZXh0LCB1
bnNpZ25lZCBzZXFubywNCj4gLQkJCQkJICAgICAgIGJvb2wgc2lnbmFsX29uX2FueSk7DQo+ICsj
ZGVmaW5lIGRtYV9mZW5jZV9hcnJheV9jcmVhdGUobnVtLCBmZW5jZXMsIGNvbnRleHQsIHNlcW5v
LCBhbnkpICh7IFwNCj4gKwlzdGF0aWMgc3RydWN0IGxvY2tfY2xhc3Nfa2V5IF9fa2V5OwkJCVwN
Cj4gKwkJCQkJCQkJXA0KPiArCV9fZG1hX2ZlbmNlX2FycmF5X2NyZWF0ZSgobnVtKSwgKGZlbmNl
cyksIChjb250ZXh0KSwgKHNlcW5vKSwgKGFueSksIFwNCj4gKwkJICAgICAgICAJICZfX2tleSk7
CQkJXA0KPiArfSkNCj4gKw0KPiArc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqX19kbWFfZmVuY2Vf
YXJyYXlfY3JlYXRlKGludCBudW1fZmVuY2VzLA0KPiArCQkJCQkJIHN0cnVjdCBkbWFfZmVuY2Ug
KipmZW5jZXMsDQo+ICsJCQkJCQkgdTY0IGNvbnRleHQsIHVuc2lnbmVkIHNlcW5vLA0KPiArCQkJ
CQkJIGJvb2wgc2lnbmFsX29uX2FueSwNCj4gKwkJCQkJCSBzdHJ1Y3QgbG9ja19jbGFzc19rZXkg
KmtleSk7DQo+ICAgDQo+ICAgYm9vbCBkbWFfZmVuY2VfbWF0Y2hfY29udGV4dChzdHJ1Y3QgZG1h
X2ZlbmNlICpmZW5jZSwgdTY0IGNvbnRleHQpOw0KPiAgIA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
