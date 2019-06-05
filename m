Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9433836CCF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026B68941E;
	Thu,  6 Jun 2019 07:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A01689617
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:44:06 +0000 (UTC)
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.60,550,1549954800"; d="scan'208";a="35658835"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jun 2019 01:44:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 5 Jun 2019 01:43:57 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 5 Jun 2019 01:43:57 -0700
Received: from DM5PR11MB1547.namprd11.prod.outlook.com (10.172.37.15) by
 DM5PR11MB1817.namprd11.prod.outlook.com (10.175.89.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 08:43:37 +0000
Received: from DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::11dc:d9db:1a6a:a0b8]) by DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::11dc:d9db:1a6a:a0b8%6]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 08:43:37 +0000
From: <Claudiu.Beznea@microchip.com>
To: <lee.jones@linaro.org>
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Topic: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Index: AQHU+2NzxFOsw6p3b0iYuTBfPVB4RaaM3vQAgAAfvgA=
Date: Wed, 5 Jun 2019 08:43:36 +0000
Message-ID: <0bf41938-b64c-b505-0a30-0abf4ad72a4b@microchip.com>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
 <20190605064948.GI4797@dell>
In-Reply-To: <20190605064948.GI4797@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0359.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::35) To DM5PR11MB1547.namprd11.prod.outlook.com
 (2603:10b6:4:a::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190605114324182
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5689a2e9-6613-458f-e0ff-08d6e991e62e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR11MB1817; 
x-ms-traffictypediagnostic: DM5PR11MB1817:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR11MB1817A7928950917899D766C087160@DM5PR11MB1817.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(6486002)(6436002)(11346002)(229853002)(53936002)(66556008)(5660300002)(966005)(2906002)(6306002)(54906003)(72206003)(8676002)(52116002)(2616005)(73956011)(446003)(486006)(66946007)(64756008)(71200400001)(31686004)(71190400001)(14444005)(256004)(14454004)(66446008)(66476007)(305945005)(76176011)(8936002)(6512007)(7416002)(7736002)(81156014)(476003)(316002)(36756003)(6116002)(3846002)(25786009)(6246003)(478600001)(4326008)(6916009)(102836004)(26005)(186003)(6506007)(99286004)(386003)(31696002)(66066001)(86362001)(53546011)(68736007)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1817;
 H:DM5PR11MB1547.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jsG8GA5WR8GoKREzBSpi85d+12Ca0oHVBdnkKwv/+6iekxcgVAon7jjyi1KZjlpA7+uVJTh4wsj+NiEGWnC3MtFyALeiMzj2HJFr1ClTkC+BDfofAxeZyZ6K2Pg54RWyUdg127rTtQhbB36WrtONyy+pDpLwgjKaqvQF46+qV9d2MArtoLh5xn5u7bgmXudZOX/YJKSp7JzDK5OYzbDPgyMeIlieRboFICw2lMO5XLw5nA3WrNM854yYxqRUalBoPYo1P+iZ1xEMO1Uc7oFUkXjQIg4uqKX1KkoV0xWmOPPjzJufpQIy0lyoUzYVMKUqXkThoWCcfuXf7DU5ZjDhJSLlKv0q8ZXSL0dNSsTra/YcxKUV+aib0MmV6CsBPnNy3I03EXPjG+yAj7TUm59pEFTyGpTTu1phKO2xwma36Fo=
Content-ID: <518B9938BFF0F946ADC161C9F98296A0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5689a2e9-6613-458f-e0ff-08d6e991e62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 08:43:37.3936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: claudiu.beznea@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1817
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ndpe7qI8Nn3TggX3YDVteH/xqjgGej+SPms7N5tbswo=;
 b=Y/lJQXRoIz10k8JczUz0GlL8s90IOuHn6R3IqmNDUbeoRbrt3FzJi9XIm123ofChe6OKAfb9ctBaLm8j2+tX9kwN0tIzZ6ioKqeA8BTmrkm+n83oBAMwu3NoWdvtoUmxVvNbh6+uHJkEKyn+HP4ms2Yq+tv/ngW41ptfO2u6bgE=
X-Mailman-Original-Authentication-Results: esa4.microchip.iphmx.com; spf=Pass
 smtp.mailfrom=Claudiu.Beznea@microchip.com;
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
Cc: linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
 bbrezillon@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ludovic.Desroches@microchip.com,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDA1LjA2LjIwMTkgMDk6NDksIExlZSBKb25lcyB3cm90ZToNCj4gRXh0ZXJuYWwgRS1N
YWlsDQo+IA0KPiANCj4gT24gVGh1LCAyNSBBcHIgMjAxOSwgQ2xhdWRpdS5CZXpuZWFAbWljcm9j
aGlwLmNvbSB3cm90ZToNCj4gDQo+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpu
ZWFAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBIaSwNCj4+DQo+PiBUaGVzZSBwYXRjaGVzIGFkZHMg
c3VwcG9ydCBmb3IgU0FNOVg2MCdzIExDRCBjb250cm9sbGVyLg0KPj4NCj4+IEZpcnN0IHBhdGNo
ZXMgYWRkIG9wdGlvbiB0byBzcGVjaWZ5IGlmIGNvbnRyb2xsZXIgY2xvY2sgc291cmNlIGlzIGZp
eGVkLg0KPj4gU2Vjb25kIHBhdGNoIGF2b2lkIGEgdmFyaWFibGUgaW5pdGlhbGl6YXRpb24gaW4g
YXRtZWxfaGxjZGNfY3J0Y19tb2RlX3NldF9ub2ZiKCkuDQo+PiBUaGUgM3JkIGFkZCBjb21wYXRp
YmxlcyBpbiBwd20tYXRtZWwtaGxjZGMgZHJpdmVyLg0KPj4gVGhlIDR0aCBwYXRjaCBlbmFibGVz
IHN5c19jbGsgaW4gcHJvYmUgc2luY2UgU0FNOVg2MCBuZWVkcyB0aGlzLg0KPj4gU3BlY2lmaWMg
c3VwcG9ydCB3YXMgYWRkZWQgYWxzbyBpbiBzdXNwZW5kL3Jlc3VtZSBob29rcy4NCj4+IFRoZSA1
dGggcGF0Y2ggYWRkcyBTQU05WDYwJ3MgTENEIGNvbmZpZ3VyYXRpb24gYW5kIGVuYWJsZWQgaXQu
DQo+Pg0KPj4gSSB0b29rIHRoZSBjaGFuZ2VzIG9mIHRoaXMgc2VyaWVzIGFuZCBpbnRyb2R1Y2Vk
IGFsc28gYSBmaXgNCj4+ICh0aGlzIGlzIHRoZSA2dGggcGF0Y2ggaW4gdGhpcyBzZXJpZXMpIC0g
aWYgeW91IHdhbnQgdG8gc2VuZCBpdCBzZXBhcmF0ZWx5DQo+PiBJIHdvdWxkIGdsYWRseSBkbyBp
dC4NCj4+DQo+PiBJIHJlc2VuZCB0aGlzIHRvIGFsc28gaW5jbHVkZSBMZWUgSm9uZXMgZm9yIHB3
bS1hdG1lbC1obGNkYyBjaGFuZ2VzLg0KPj4NCj4+IFRoYW5rIHlvdSwNCj4+IENsYXVkaXUgQmV6
bmVhDQo+Pg0KPj4gQ2hhbmdlcyBpbiB2MzoNCj4+IC0ga2VlcCBjb21wYXRpYmxlIHN0cmluZyBv
biBwYXRjaCAzLzYgb24gYSBzaW5nbGUgbGluZSAoSSBrZWVwIGhlcmUgYSB0YWINCj4+ICAgaW4g
ZnJvbnQgb2YgIi5jb21wYXRpYmxlIiB0byBiZSBhbGlnbmVkIHdpdGggdGhlIHJlc3Qgb2YgdGhl
IGNvZGUgaW4NCj4+ICAgYXRtZWxfaGxjZGNfZHRfaWRzW10pDQo+PiAtIHBhdGNoZXMgNC83IGFu
ZCAzLzcgZnJvbSB2MiB3ZXJlIGFwcGxpZWQgc28gcmVtb3ZlIHRoZW0gZnJvbSB0aGlzIHZlcnNp
b24NCj4+IC0gYWRkIGEgZml4IGZvciBhdG1lbF9obGNkYyAocGF0Y2ggNi82KQ0KPj4NCj4+IENo
YW5nZXMgaW4gdjI6DQo+PiAtIHVzZSAifCIgb3BlcmF0b3IgaW4gcGF0Y2ggMS83IHRvIHNldCBB
VE1FTF9ITENEQ19DTEtTRUwgb24gY2ZnDQo+PiAtIGNvbGxlY3QgQWNrZWQtYnksIFJldmlld2Vk
LWJ5IHRhZ3MNCj4+DQo+PiBDbGF1ZGl1IEJlem5lYSAoNCk6DQo+PiAgIGRybTogYXRtZWwtaGxj
ZGM6IGFkZCBjb25maWcgb3B0aW9uIGZvciBjbG9jayBzZWxlY3Rpb24NCj4+ICAgZHJtOiBhdG1l
bC1obGNkYzogYXZvaWQgaW5pdGlhbGl6aW5nIGNmZyB3aXRoIHplcm8NCj4+ICAgcHdtOiBhdG1l
bC1obGNkYzogYWRkIGNvbXBhdGlibGUgZm9yIFNBTTlYNjAgSExDREMncyBQV00NCj4+ICAgZHJt
L2F0bWVsLWhjbGNkYzogcmV2ZXJ0IHNoaWZ0IGJ5IDgNCj4+DQo+PiBTYW5kZWVwIFNoZXJpa2Vy
IE1hbGxpa2FyanVuICgyKToNCj4+ICAgZHJtOiBhdG1lbC1obGNkYzogZW5hYmxlIHN5c19jbGsg
ZHVyaW5nIGluaXRhbGl6YXRpb24uDQo+PiAgIGRybTogYXRtZWwtaGxjZGM6IGFkZCBzYW05eDYw
IExDRCBjb250cm9sbGVyDQo+Pg0KPj4gIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1l
bF9obGNkY19jcnRjLmMgIHwgIDE4ICsrLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxj
ZGMvYXRtZWxfaGxjZGNfZGMuYyAgICB8IDEyMCArKysrKysrKysrKysrKysrKysrKysrKy0NCj4+
ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuaCAgICB8ICAgMiAr
DQo+PiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMgfCAg
IDIgKy0NCj4+ICBkcml2ZXJzL3B3bS9wd20tYXRtZWwtaGxjZGMuYyAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+PiAgNSBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pDQo+IA0KPiBXaHkgaXMgdGhpcyBiZWluZyBzZW50IHRvIG1lPw0KDQpTb3JyeSwg
eW91IHdlcmUgaW4gdGhlIG9yaWdpbmFsICJ0byIgbGlzdCBkdWUgdG8gY2hhbmdlcyB0aGF0IHlv
dSBhc2tlZCBmb3INCmluIHYyIG9uIG1mZCBwYXJ0Lg0KDQpUaGllcnJ5IHN1Z2dlc3RlZCBpbiB2
MSBvZiB0aGlzIHNlcmllcyB0byB0YWtlIHB3bS1hdG1lbC1obGNkYy5jIGNoYW5nZXMNCnRob3Vn
aCBNRkQgdHJlZSBbMV0uIFRoZW4sIGluIHYyIHlvdSBhc2sgbWUgdG8gZG8gdXBkYXRlIGEgYml0
IHRoZSBjaGFuZ2VzDQppbiBwd20tYXRtZWwtaGxjZGMuYyBbMl0uDQoNCkFuZCBpbiB0aGlzIHJl
cGx5IEkgZm9yZ290IHRvIHJlbW92ZSB5b3VyIGVtYWlsIGFzIHlvdSBwcmV2aW91c2x5DQpzdWdn
ZXN0ZWQuIE15IGJhZCENCg0KVGhhbmsgeW91LA0KQ2xhdWRpdSBCZXpuZWENCg0KWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTAzMDQxMTA1MTcuR0I1MTIxQHVsbW8vDQpbMl0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDQyNTA4MzEzMi5HRDE0NzU4QGRlbGwv
DQoNCg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
