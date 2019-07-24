Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D9873E5D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 22:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4216E655;
	Wed, 24 Jul 2019 20:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700065.outbound.protection.outlook.com [40.107.70.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7996E655
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 20:24:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feqPo3LNOq+Kw7MlWMBCu1AClGcJT6gW+FXXed+GXyXxWfRHUm1K/xQeCqoGNZFrpTj6Y5pow7fPj16/u9uWOrt989wEKgqDy8hJOThMc8jFc5ccjFRJJI/RbL6yZYHWbMkovFzmjhKNg0tHl+iRnpBrTde2c0YlO2y3ILIUoq3Y2fST5QstZPIl/g5v69Zz0PHXapttMgUsmxX2D8JYH8vvmwzeOJbElQBvjIu3efRCDsChO4ryprw/EQrrQVwCV3+kIdREh0LxGgpJ/CpBo/Vz01+0iDP7oxVhOapwVgePu7Ny2llFw5VkIiyBh4O/ZnbPIl6+uTC0DBeQda2GQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji9523Jx9WVkru7SlxRnq6sQl/Q9qENtMM2cL2uCDM4=;
 b=HgbKAicVDI1YzwDCxstWRKvnXNsLWlrnM9JEXCnh+d8ja3w6wTRfEsQao6xdSFn8zAtqqvz7dUtSBFU4C0G3V/xG+lLjLfQykzTujMBClLtbnaKEeRqN34B4XcXWA0/hn4LlnNBMO2XNkyX0+1cTQFxAupKcSpCySSBGyL8ghHusgB1VHF65uokfW1RxIUonK8Yr9jbqENec+2VfqEe2fol5r75Fnjj0ntchLrwxizQy++H7LGKF0XYna627P0qftG+trQNxWw05g1WWXgteE4c9P66kNaC+bPVnwU5l411yWOtlQ81h7BIGJx8SN39I2+VWDLgFJh1zg5E1pMvCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=vmware.com;dmarc=pass action=none
 header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
Received: from BY5PR05MB6883.namprd05.prod.outlook.com (52.132.255.33) by
 BY5PR05MB7010.namprd05.prod.outlook.com (52.132.254.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 24 Jul 2019 20:24:19 +0000
Received: from BY5PR05MB6883.namprd05.prod.outlook.com
 ([fe80::6d09:ff82:988b:5e03]) by BY5PR05MB6883.namprd05.prod.outlook.com
 ([fe80::6d09:ff82:988b:5e03%5]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 20:24:19 +0000
From: Deepak Singh Rawat <drawat@vmware.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [Linux-graphics-maintainer] [PATCH 2/3] drm/vmwgfx: add local
 DRM_AUTH check for PRIME TO/FROM HANDLE
Thread-Topic: [Linux-graphics-maintainer] [PATCH 2/3] drm/vmwgfx: add local
 DRM_AUTH check for PRIME TO/FROM HANDLE
Thread-Index: AQHVQl3FyAKptji6EEm0tlfnt04SFg==
Date: Wed, 24 Jul 2019 20:24:19 +0000
Message-ID: <c4632fc380c53d5a4cf8237d2cf3ed6a34896eca.camel@vmware.com>
References: <20190722174025.9830-1-emil.l.velikov@gmail.com>
 <20190722174025.9830-2-emil.l.velikov@gmail.com>
In-Reply-To: <20190722174025.9830-2-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To BY5PR05MB6883.namprd05.prod.outlook.com
 (2603:10b6:a03:1c9::33)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10b5daab-7247-45c0-a0d6-08d71074e7bd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR05MB7010; 
x-ms-traffictypediagnostic: BY5PR05MB7010:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BY5PR05MB7010B1538531FF0B5A8AA1B6BAC60@BY5PR05MB7010.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(25786009)(478600001)(2616005)(71190400001)(476003)(71200400001)(486006)(50226002)(446003)(5660300002)(6116002)(36756003)(229853002)(4326008)(11346002)(3846002)(2906002)(14454004)(6512007)(8676002)(2501003)(8936002)(118296001)(186003)(68736007)(6506007)(26005)(102836004)(6246003)(81156014)(53936002)(99286004)(66946007)(52116002)(110136005)(107886003)(86362001)(81166006)(7736002)(66066001)(256004)(316002)(6436002)(6486002)(66446008)(64756008)(66476007)(66556008)(386003)(76176011)(305945005)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR05MB7010;
 H:BY5PR05MB6883.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q9Xu/ntBE7rYtUPcFKARDv20o/4ONntUrVkzkz1zQAqDKnLkTyyFLuuQkdzZcPM/6Pbj2Ag4qSYbRZnexwaxMeFNLR6LZC2572/LrvVQ82TIzeMkOcMzqTD7UtpFj6NGRC4e4kd8F3qQWO0z/adTuSm9TjOgIto4NKqe3QW5LBzPNOfYjOvDUajFyHPywkjlIsUdpljXsquzlZWvXqL9izPREx5eJhXKyXTMTY4oQLgVvpyyRsrgsTD5f5J/sdcr6b86h9y9+DWDo3Yt4akz6Z+8Dw4/ggRbgb+1W4E7SOyVmgOYp2ZdpQmWxPQDxlqz93Qm9VzWv0X9LNNz14hpSCLD+j95n3vogL3++Edd6ya14bh/F62CX3R+W9sqF4ww1pRVKEGUiS0trsHVfABjZmyc5XxflE+BYiWjCaG7z2Q=
Content-ID: <4BE9F48995EE4A4F9D4EE0F3D495E6AB@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b5daab-7247-45c0-a0d6-08d71074e7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 20:24:19.0647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drawat@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR05MB7010
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji9523Jx9WVkru7SlxRnq6sQl/Q9qENtMM2cL2uCDM4=;
 b=FAN17iP/2vbAWN2vXLF8a0rRur9N+tdjZ8Gv1fvr+LSv2oUHF+avUK1KO3EkVWvbnxV+g1xKPN97XDKimpKjmjPgcmiX/5hOumXZahwW2Vz9WelUVH/GnOwjTMvBmgPhI4WwbuaaR2uxyJaJtrimE6JvZ8oJQJ32jkCqzGhkFlE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=drawat@vmware.com; 
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA3LTIyIGF0IDE4OjQwICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+IA0KPiBS
ZWFsaXN0aWNhbGx5IG5vIGRyaXZlcnMsIGJ1dCB2bXdnZnggY2FyZSBhYm91dCB0aGUgRFJNX0FV
VEggZmxhZw0KPiBoZXJlLg0KPiANCj4gRm9sbG93LXVwIHdvcmsgaW4gdGhpcyBkcml2ZXIgd2ls
bCBwcm9wZXJseSBpc29sYXRlIHByaW1hcnkgY2xpZW50cw0KPiBmcm9tDQo+IGRpZmZlcmVudCBt
YXN0ZXIgcmVhbG1zLCB0aHVzIHdlJ2xsIG5vIGxvbmdlciBuZWVkIHRvIHBhcnNlIF9hbnlfDQo+
IGlvY3RsDQo+IGZsYWdzLg0KPiANCj4gVW50aWwgdGhhdCB3b3JrIGxhbmRzLCBhZGQgYSBsb2Nh
bCB3b3JrYXJvdW5kLg0KPiANCj4gQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3Mt
bWFpbnRhaW5lckB2bXdhcmUuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJv
bUB2bXdhcmUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gSSdkIGxpa2UgdG8gbWVyZ2UgdGhpcyB0aHJvdWdo
IHRoZSBkcm0tbWlzYyB0cmVlLiBBY2sgYW5kIHJiIGFyZQ0KPiBhcHByZWNpYXRlZC4NCj4gDQo+
IFRoYW5rcw0KPiBFbWlsDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
ZHJ2LmMgfCA5ICsrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gaW5kZXggMjc1ZDkwZmUy
YTI1Li4zMmMxOGJiNDgyYTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5j
DQo+IEBAIC0xMTMxLDYgKzExMzEsMTUgQEAgc3RhdGljIGxvbmcgdm13X2dlbmVyaWNfaW9jdGwo
c3RydWN0IGZpbGUNCj4gKmZpbHAsIHVuc2lnbmVkIGludCBjbWQsDQo+ICAJfSBlbHNlIGlmICgh
ZHJtX2lvY3RsX2ZsYWdzKG5yLCAmZmxhZ3MpKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0K
PiArCS8qDQo+ICsJICogTGl0dGxlIHdvcmthcm91bmQgdW50aWwgdGhlIHZtd2dmeCBwYXRjaGVz
IHByb3ZpZGluZw0KPiBpc29sYXRpb24gb2YNCj4gKwkgKiBwcmltYXJ5IGNsaWVudHMgZnJvbSBk
aWZmZXJlbnQgbWFzdGVyIHJlYWxtcyBsYW5kcy4NCj4gKwkgKiBXaXRoIHRoYXQgd29yaywgd2Un
bGwgbm8gbG9uZ2VyIG5lZWQgdG8gcGFyc2UgX2FueV8gaW9jdGwNCj4gZmxhZ3MuDQo+ICsJICov
DQo+ICsJaWYgKG5yID09IDB4MmQgLyogRFJNX0lPQ1RMX1BSSU1FX0hBTkRMRV9UT19GRCAqLyB8
fA0KPiArCSAgICBuciA9PSAweDJlIC8qIERSTV9JT0NUTF9QUklNRV9GRF9UT19IQU5ETEUgKi8p
DQo+ICsJCWZsYWdzICE9IERSTV9BVVRIOw0KDQpEbyB5b3UgbWVhbiBiaXR3aXNlIE9SIGFzc2ln
bm1lbnQ/IEluIGN1cnJlbnQgZm9ybSB0aGlzIGlzIG5vLW9wLg0KDQo+ICsNCj4gIAl2bWFzdGVy
ID0gdm13X21hc3Rlcl9jaGVjayhkZXYsIGZpbGVfcHJpdiwgZmxhZ3MpOw0KPiAgCWlmIChJU19F
UlIodm1hc3RlcikpIHsNCj4gIAkJcmV0ID0gUFRSX0VSUih2bWFzdGVyKTsNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
