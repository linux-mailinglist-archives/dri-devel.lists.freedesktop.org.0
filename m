Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC25B13D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D23B89D44;
	Sun, 30 Jun 2019 18:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 28 Jun 2019 07:55:38 UTC
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646626E88B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 07:55:38 +0000 (UTC)
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Nicolas.Ferre@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="Nicolas.Ferre@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="38691445"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2019 00:48:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Jun 2019 00:48:22 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 28 Jun 2019 00:48:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=etz58AQuh/mcXoM4nd68Vm4JLqzugP3DwDOhDCftJ6xj/k/8xokoRmd0J91Iu8JgTJ3dis5EkSRLYP01ZdN3G2VNaRdkbX+DcAPizRL7jFsYLI+tK2sdQ9UNp8I3c5lSb6rtUY+Nd93cQrWZ9ij7rR0YPzhzpeiWMyOG4CbB2so=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgiMdyIeQW4yFsmqMo4R261fF/haD72pVxxUrDjsFyQ=;
 b=Kpjheco0bnHjX5YGCHc0FzuO9HUWLOgooBSxbweFXNiYMYAwkdk2kjFSMJ+mtZNWmu2bEWfoxKFX/8sPfohwAybiIntzey4x688oyzT2htNKFSAF48k0GeYuKX2Hi0SHmMj2olCJxjaTwiINEDeuaeiMNnhd0MnDpUXSjKkz/1U=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MWHPR11MB1662.namprd11.prod.outlook.com (10.172.55.15) by
 MWHPR11MB1838.namprd11.prod.outlook.com (10.175.52.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 07:48:22 +0000
Received: from MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::7534:63dc:8504:c2b3]) by MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::7534:63dc:8504:c2b3%6]) with mapi id 15.20.2008.019; Fri, 28 Jun 2019
 07:48:22 +0000
From: <Nicolas.Ferre@microchip.com>
To: <boris.brezillon@collabora.com>, <sam@ravnborg.org>
Subject: Re: [PATCH] MAINTAINERS: add Sam Ravnborg for drm/atmel_hlcdc
Thread-Topic: [PATCH] MAINTAINERS: add Sam Ravnborg for drm/atmel_hlcdc
Thread-Index: AQHVLS234T2mTAnbKkOZSPCGA5TOq6awlrIAgAAaoAA=
Date: Fri, 28 Jun 2019 07:48:22 +0000
Message-ID: <f879b0eb-9559-7615-a044-5808b714a234@microchip.com>
References: <20190627211643.GA19853@ravnborg.org>
 <20190628081256.230165ae@collabora.com>
In-Reply-To: <20190628081256.230165ae@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::29) To MWHPR11MB1662.namprd11.prod.outlook.com
 (2603:10b6:301:e::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b932627-fb2b-4883-97e2-08d6fb9cfe2f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR11MB1838; 
x-ms-traffictypediagnostic: MWHPR11MB1838:
x-microsoft-antispam-prvs: <MWHPR11MB18386E29970D95820A34F7CDE0FC0@MWHPR11MB1838.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(72206003)(31696002)(229853002)(86362001)(2906002)(66066001)(73956011)(66946007)(66476007)(64756008)(66446008)(66556008)(8676002)(53936002)(6436002)(476003)(2616005)(6486002)(6512007)(81156014)(81166006)(14454004)(486006)(102836004)(71200400001)(256004)(4326008)(446003)(36756003)(25786009)(26005)(11346002)(68736007)(76176011)(305945005)(5660300002)(6116002)(3846002)(52116002)(386003)(6506007)(53546011)(7736002)(54906003)(110136005)(99286004)(186003)(316002)(6246003)(478600001)(8936002)(31686004)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1838;
 H:MWHPR11MB1662.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wJ+zQYpPWPc1/tDEJoG0JIoe8cS6jlb6iTRNDW2QmoMNeE5z6mSS6P9SK1rV8RIi0rqx5SDtu/8Z4q5UcrHapQfX/0gdaTOzCtwjLFX+qjoypnz9ah7eIXSABoBhcVKZTDThc9P3nw1f598f0ldEU7gh511L9DGUVFVmDfLx47q1Czbfmn7zyT9UAPapSzDNigUyCL/LgbiiTXddWJTgqDeaJ8tXJzu1DVZcHnDtAKdbsl1YuP64O5ZAUgLSUTuRH8hCmvtfMp6uuKUmISQ41KjDwDtfZQAj6xSkKibmcXswGF4Mo4wUwjmeM5xdD1mRb/k/29S0Tln2vSTtN2s5EPr8QzHC7JApjssFv7eMV+A4lSJCamrVdBDbuRH5QooZBuj8DNF2Wle+JM+V5lnctll8TMENQ0aXb/LlfrEZLMo=
Content-ID: <23B5457F24C75E4097BB8A779EFBBC14@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b932627-fb2b-4883-97e2-08d6fb9cfe2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 07:48:22.1779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nicolas.ferre@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1838
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgiMdyIeQW4yFsmqMo4R261fF/haD72pVxxUrDjsFyQ=;
 b=K2ssyNitm/NpFOgKVRlMbrgZd+SjJJJE4nbaqq80eDp3y7P+c2GIm0vGa3e6d38z3jO3hFwlVJEfg3eXNUaLWplXkD25MwfRQgnWA2gntz8YAGfCkx3y8ukzU7osyOYux0xoI5Pc/hO2+rw0wBN/YT/AKQnK24MFGquM4e0kHrk=
X-Mailman-Original-Authentication-Results: esa4.microchip.iphmx.com; spf=Pass
 smtp.mailfrom=Nicolas.Ferre@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Claudiu.Beznea@microchip.com, peda@axentia.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDYvMjAxOSBhdCAwODoxMiwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOg0KPiBPbiBUaHUs
IDI3IEp1biAyMDE5IDIzOjE2OjQzICswMjAwDQo+IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6DQo+IA0KPj4gSSBoYXZlIGFncmVlZCB3aXRoIEJvcmlzIEJyZXppbGxvbiB0
aGF0IHdlIHdpbGwgc2hhcmUgdGhlDQo+PiBtYWludGFpbmVyIHJvbGUgZm9yIHRoZSBkcm0vYXRt
ZWxfaGxjZGMgZHJpdmVyLg0KPj4gTmljb2xhcyBGZXJyZSBmcm9tIE1pY3JvY2hpcCBoYXMgZG9u
YXRlZCBhIGZldyBib2FyZHMgdGhhdA0KPj4gYWxsb3dzIG1lIHRvIHRlc3QgdGhpbmdzIC0gdGhh
bmtzIQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4NCj4+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4NCj4gDQo+
IEFja2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
Pg0KDQpPZiBjb3Vyc2U6DQpBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBt
aWNyb2NoaXAuY29tPg0KDQpUaGFua3MgYSBsb3QgU2FtIGZvciB0YWtpbmcgdGhpcyBtYWludGFp
bmVyIHJvbGUhDQoNCkJlc3QgcmVnYXJkcywNCiAgIE5pY29sYXMNCg0KPj4gQ2M6IE5pY29sYXMg
RmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4NCj4+IENjOiBBbGV4YW5kcmUgQmVs
bG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+PiBDYzogQ2xhdWRpdSBCZXpu
ZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQo+PiBDYzogUGV0ZXIgUm9zaW4gPHBl
ZGFAYXhlbnRpYS5zZT4NCj4+IC0tLQ0KPj4gICBNQUlOVEFJTkVSUyB8IDEgKw0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUw0KPj4gaW5kZXggNTE1YTgxZmRiN2Q2Li4wYTc2NzE2ODc0YmQgMTAw
NjQ0DQo+PiAtLS0gYS9NQUlOVEFJTkVSUw0KPj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+IEBAIC01
MjUxLDYgKzUyNTEsNyBAQCBGOglEb2N1bWVudGF0aW9uL2dwdS9tZXNvbi5yc3QNCj4+ICAgVDoJ
Z2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYw0KPj4gICANCj4+
ICAgRFJNIERSSVZFUlMgRk9SIEFUTUVMIEhMQ0RDDQo+PiArTToJU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPg0KPj4gICBNOglCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVs
Lm9yZz4NCj4+ICAgTDoJZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gICBTOglT
dXBwb3J0ZWQNCj4gDQo+IA0KPiANCg0KDQotLSANCk5pY29sYXMgRmVycmUNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
