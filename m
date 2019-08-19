Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8091B94E57
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 21:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CD589159;
	Mon, 19 Aug 2019 19:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690051.outbound.protection.outlook.com [40.107.69.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11246E27C;
 Mon, 19 Aug 2019 19:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD6P86gfxT+Rwnwtc3b6QmgXOnisWSGG04kjtBYmDYEtbW+ZGR6dOHJusUlLpLeYUlcBM7fTm+TlY5AHv/+++buoD5DiR2dgnxTLw6pA6zzTCncR9um05Xh8ACA4vzWFXxc08w/eYtbmgPAzh8yIEyLPhqZ/wGquPykNQneUpfk4X1GsW29KaBuyvWp7+ojrPH4ayWHRCFzbLICNmApW4bqNwDcj73RB6gxMyOcwYec97MWOW2sMKIpdehDlMxz+UuEofKDT4o23wgVHP8vDIjhm7riyNdtbS8FFr1hEmJLflYJwnQc5xd5molsr+hqF21SxaiOr/m5GvCa7Nk9f/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvUKBZM27qYRZUbd8BiBqfJEUqMNBBC5XDrz8Wx2WQU=;
 b=H3vAKVP9O9q+04TokwAiBRp2rkfGT+OwIn7vjFX1ddSGHfbGxypGksmOI476w2SnUFcoTCCpMhVrtaA2heWELgALuhWDRBNPsUJd9TS142OSKUY5d8QAS7h6aWGSbdJRQcTI+4+nx5LIaZXFcIA8Hq9uo1FPedmDDptYg0oaY/K/728Q9gt6uZ3H3YdVw8eehKNo55EVQLxtSp4CkM2HwNoTZc00ObDe3zA0Y0PeYDYRef5rofpwXGKJRV7jaXaXKLvn+1TJoRRxXy61OprVGOgzMomV/Ymcisik4U5oGLtXBI8cj8Is6mZER9PqXWrYDUb1Uo4Rc+5Cei5gZZn1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3317.namprd12.prod.outlook.com (20.178.55.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Mon, 19 Aug 2019 19:34:25 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 19:34:25 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 14/14] drm/amd/display: Trigger modesets on MST DSC
 connectors
Thread-Topic: [PATCH 14/14] drm/amd/display: Trigger modesets on MST DSC
 connectors
Thread-Index: AQHVVqXjqew83fH/x0GuciXYkYPnWqcC3OcA
Date: Mon, 19 Aug 2019 19:34:24 +0000
Message-ID: <1da62258-0a43-1945-7046-6b9bd58f8524@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
 <20190819155038.1771-15-David.Francis@amd.com>
In-Reply-To: <20190819155038.1771-15-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a540794-ec79-410c-399e-08d724dc3dea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3317; 
x-ms-traffictypediagnostic: BYAPR12MB3317:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3317573E23460B3224982695ECA80@BYAPR12MB3317.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(189003)(199004)(5660300002)(316002)(110136005)(81156014)(8676002)(81166006)(99286004)(66066001)(2501003)(2906002)(3846002)(6116002)(76176011)(31686004)(5024004)(14444005)(256004)(8936002)(71200400001)(71190400001)(66446008)(66476007)(66946007)(6486002)(229853002)(66556008)(6436002)(64756008)(52116002)(14454004)(2201001)(6246003)(6506007)(53936002)(4326008)(6512007)(11346002)(25786009)(446003)(31696002)(486006)(53546011)(386003)(86362001)(450100002)(476003)(2616005)(478600001)(186003)(26005)(36756003)(102836004)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3317;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TRxLSjyI0tkot3IJah1K3kphZqJXb6oUGJwsvz2z4CXPQCYt21jzGSNtVG1UkGVVf/mkT1APPQJcj93rLv53YZDmZzgSWqxAydquAFygjRbRppajENWpEHqIgW3qlxR1WTCjZBF80SHPNAY7ZDqoszwWe/JcWyOjifaixyXNTgKfpOtlddB/Gden/uFhnB2L6TQjB0tKY5jeY58bNKDwfYGTPJeHdUOB7WIU1fK3gp6CFwEuxBm1nzGw9lCIRwYBlz18e4Ci2jvYxzkUlcE/5+LRxdj79jRH0e5d0TduRrvq5SQgVk1nshLGscyX6WXH8iaHC/jmKETKaE6mLqONFfsF7REwuSk1T3iBw7qJHufB+L8qICgJ/0xcjSxWSCaZVX8x1cdn+cpkokty9TubpJ5+WINk4ZQwcDGupGsUrHY=
Content-ID: <4697EDC712DB724D97B8C9115DCA2F32@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a540794-ec79-410c-399e-08d724dc3dea
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 19:34:24.9568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtpQkDuO5LgP5HGy1mBQeAgjjN4hmO3f40zyp0nBKBjAPqN9BwlOXMayCKeWwrY+2ej+UN3+v0h+kBnktmQM5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3317
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvUKBZM27qYRZUbd8BiBqfJEUqMNBBC5XDrz8Wx2WQU=;
 b=yHqn4ULKM3wQisdChCwgDnHw6LV9bFjSgs5xFccc1+a7srAPMxW1/PFgV1JtoFW6QO0CQUOuCqapWnOaO8NJ4SRmYnO6jCTxU9+a8yWF8s3jmOzI5AypAy8r/4jkIAwJdEXtqeLS31AhxtsOk+E3vl3x3kyL5y2rFaO9eNR7/Uc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xOS8xOSAxMTo1MCBBTSwgRGF2aWQgRnJhbmNpcyB3cm90ZToNCj4gV2hlbmV2ZXIgYSBj
b25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFjaGVkLCBvcg0KPiB1
bmRlcmdvZXMgYSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRo
YXQNCj4gdG9wb2xvZ3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5nZSB0aGVp
ciByZXF1aXJlZA0KPiBiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWluZywg
YXMgdGhvdWdoIGEgbW9kZXNldA0KPiB3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFt
IGRpZCBub3QgY2hhbmdlIHRpbWluZy4NCj4gDQo+IFRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRj
IGhhcyBkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldCwNCj4gZm9yIGVhY2ggY3J0YyB0aGF0
IHNoYXJlcyBhIE1TVCB0b3BvbG9neSB3aXRoIHRoYXQgc3RyZWFtIGFuZA0KPiBzdXBwb3J0cyBE
U0MsIGFkZCB0aGF0IGNydGMgKGFuZCBhbGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQNCj4gcGxh
bmVzKSB0byB0aGUgYXRvbWljIHN0YXRlIGFuZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0
ZQ0KPiANCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPiBDYzogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDgwICsrKysrKysrKysr
KysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+
IGluZGV4IDE0NWZkNzMwMjVkYy4uOGQ1MzU3YWVjNWU4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAgLTY0NzUs
NyArNjQ3NSw3OCBAQCBzdGF0aWMgaW50IGRvX2FxdWlyZV9nbG9iYWxfbG9jayhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LA0KPiAgIA0KPiAgIAlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7DQo+ICAg
fQ0KPiArI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+ICtzdGF0aWMgaW50
IGFkZF9hZmZlY3RlZF9tc3RfZHNjX2NydGNzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSwgc3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiArew0KPiArCXN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3I7DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGU7
DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3JfbGlzdF9pdGVyIGNvbm5faXRlcjsNCj4gKwlzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlOw0KPiArCXN0cnVjdCBhbWRncHVfZG1f
Y29ubmVjdG9yICphY29ubmVjdG9yID0gTlVMTCwgKmFjb25uZWN0b3JfdG9fYWRkOw0KPiArCWlu
dCBpLCBqLCByZXQ7DQo+ICsJc3RydWN0IGRybV9jcnRjICpjcnRjc19hZmZlY3RlZFtNQVhfUElQ
RVNdID0geyAwIH07ID4gKw0KPiArCWZvcl9lYWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUoc3Rh
dGUsIGNvbm5lY3RvciwgY29ubl9zdGF0ZSwgaSkgew0KPiArCQlpZiAoY29ubl9zdGF0ZS0+Y3J0
YyAhPSBjcnRjKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJYWNvbm5lY3RvciA9IHRvX2Ft
ZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj4gKwkJaWYgKCFhY29ubmVjdG9yLT5wb3J0
KQ0KPiArCQkJYWNvbm5lY3RvciA9IE5VTEw7DQo+ICsJCWVsc2UNCj4gKwkJCWJyZWFrOw0KPiAr
CX0NCj4gKw0KPiArCWlmICghYWNvbm5lY3RvcikNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gKwlp
ID0gMDsNCj4gKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihzdGF0ZS0+ZGV2LCAmY29u
bl9pdGVyKTsNCg0KSSBkb24ndCBsaWtlIHRoYXQgd2UncmUgZ3JhYmJpbmcgdGhlIGdsb2JhbCBj
b25uZWN0b3IgbG9jayBldmVyeSBzaW5nbGUgDQp0aW1lIGFueSBDUlRDIHVuZGVyZ29lcyBhIG1v
ZGVzZXQgZXZlbiBmb3IgQVNJQ3MgdGhhdCBkb24ndCBzdXBwb3J0IERTQy4NCg0KV2UgZG8gbG9j
ayBldmVyeXRoaW5nIGJlbG93IGluIGF0b21pYyBjaGVjayBhbnl3YXkgZm9yIEZVTEwgdXBkYXRl
cyBidXQgDQpJJ2QgbGlrZSB0byBhdm9pZCBhZGRpbmcgbW9yZSBjb2RlIHRoYXQgZG9lcyB0aGlz
IGlmIHBvc3NpYmxlLiBNYXliZSBhIA0KY2hlY2sgYXQgdGhlIHN0YXJ0IHRoYXQgb25seSBkb2Vz
IHRoaXMgaWYgdGhlIEFTSUMgaGFzIERTQyBzdXBwb3J0IHdvdWxkIA0KYmUgT0suDQoNCj4gKwlk
cm1fZm9yX2VhY2hfY29ubmVjdG9yX2l0ZXIoY29ubmVjdG9yLCAmY29ubl9pdGVyKSB7DQo+ICsJ
CWlmICghY29ubmVjdG9yLT5zdGF0ZSB8fCAhY29ubmVjdG9yLT5zdGF0ZS0+Y3J0YykNCj4gKwkJ
CWNvbnRpbnVlOw0KPiArDQo+ICsJCWFjb25uZWN0b3JfdG9fYWRkID0gdG9fYW1kZ3B1X2RtX2Nv
bm5lY3Rvcihjb25uZWN0b3IpOw0KPiArCQlpZiAoIWFjb25uZWN0b3JfdG9fYWRkLT5wb3J0KQ0K
PiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJaWYgKGFjb25uZWN0b3JfdG9fYWRkLT5wb3J0LT5t
Z3IgIT0gYWNvbm5lY3Rvci0+cG9ydC0+bWdyKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJ
aWYgKCFhY29ubmVjdG9yX3RvX2FkZC0+ZGNfc2luaykNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+
ICsJCWlmICghYWNvbm5lY3Rvcl90b19hZGQtPmRjX3NpbmstPnNpbmtfZHNjX2NhcHMuZHNjX2Rl
Y19jYXBzLmlzX2RzY19zdXBwb3J0ZWQpDQo+ICsJCQljb250aW51ZTsNCj4gICANCj4gKwkJaWYg
KGkgPj0gTUFYX1BJUEVTKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJY3J0Y3NfYWZmZWN0
ZWRbaV0gPSBjb25uZWN0b3ItPnN0YXRlLT5jcnRjOw0KDQpEcm9wIHRoaXMgY3J0Y3NfYWZmZWN0
ZWQgYXJyYXkgYW5kIGp1c3QgcGVyZm9ybSB0aGUgbG9naWMgYmVsb3cgcmlnaHQgDQpoZXJlLiBX
ZSBkb24ndCByZWFsbHkgbmVlZCB0d28gbG9vcHMgaGVyZSwgcmVkdW5kYW50IGNhbGxzIHRvIA0K
ZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZSBhbmQgdGhlIG90aGVyIGhlbHBlcnMgYXJlIGZpbmUu
DQoNCj4gKwkJaSsrOw0KPiArCX0NCj4gKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNv
bm5faXRlcik7DQo+ICsNCj4gKwlmb3IgKGogPSAwOyBqIDwgaTsgaisrKSB7DQo+ICsJCW5ld19j
cnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Y3NfYWZmZWN0
ZWRbal0pOw0KPiArCQlpZiAoSVNfRVJSKG5ld19jcnRjX3N0YXRlKSkNCj4gKwkJCXJldHVybiBQ
VFJfRVJSKG5ld19jcnRjX3N0YXRlKTsNCj4gKw0KPiArCQluZXdfY3J0Y19zdGF0ZS0+bW9kZV9j
aGFuZ2VkID0gdHJ1ZTsNCj4gKw0KPiArCQlyZXQgPSBkcm1fYXRvbWljX2FkZF9hZmZlY3RlZF9j
b25uZWN0b3JzKHN0YXRlLCBjcnRjc19hZmZlY3RlZFtqXSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJ
CQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJCXJldCA9IGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3Bs
YW5lcyhzdGF0ZSwgY3J0Y3NfYWZmZWN0ZWRbal0pOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0
dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gKw0KPiArfQ0KPiArI2VuZGlm
DQo+ICAgc3RhdGljIHZvaWQgZ2V0X2ZyZWVzeW5jX2NvbmZpZ19mb3JfY3J0YygNCj4gICAJc3Ry
dWN0IGRtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlLA0KPiAgIAlzdHJ1Y3QgZG1fY29ubmVj
dG9yX3N0YXRlICpuZXdfY29uX3N0YXRlKQ0KPiBAQCAtNzE3OCw2ICs3MjQ5LDE1IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAg
IAkJCWdvdG8gZmFpbDsNCj4gICAJfQ0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19EUk1fQU1EX0RD
X0RTQ19TVVBQT1JUDQo+ICsJZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNy
dGMsIG9sZF9jcnRjX3N0YXRlLCBuZXdfY3J0Y19zdGF0ZSwgaSkgew0KPiArCQlpZiAoZHJtX2F0
b21pY19jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUpKSB7DQo+ICsJCQlyZXQgPSBh
ZGRfYWZmZWN0ZWRfbXN0X2RzY19jcnRjcyhzdGF0ZSwgY3J0Yyk7DQo+ICsJCQlpZiAocmV0KQ0K
PiArCQkJCWdvdG8gZmFpbDsNCj4gKwkJfQ0KPiArCX0NCj4gKyNlbmRpZg0KPiAgIAkvKg0KPiAg
IAkgKiBBZGQgYWxsIHByaW1hcnkgYW5kIG92ZXJsYXkgcGxhbmVzIG9uIHRoZSBDUlRDIHRvIHRo
ZSBzdGF0ZQ0KPiAgIAkgKiB3aGVuZXZlciBhIHBsYW5lIGlzIGVuYWJsZWQgdG8gbWFpbnRhaW4g
Y29ycmVjdCB6LW9yZGVyaW5nDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
