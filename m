Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5B357D8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348E8895C1;
	Wed,  5 Jun 2019 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 04 Jun 2019 16:25:45 UTC
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEFF8922E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 16:25:45 +0000 (UTC)
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
X-IronPort-AV: E=Sophos;i="5.60,550,1549954800"; d="scan'208";a="35533999"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Jun 2019 09:18:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 4 Jun 2019 09:18:37 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 4 Jun 2019 09:18:38 -0700
Received: from MWHPR11MB1549.namprd11.prod.outlook.com (10.172.54.17) by
 MWHPR11MB1583.namprd11.prod.outlook.com (10.172.53.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.20; Tue, 4 Jun 2019 16:18:34 +0000
Received: from MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::316b:7774:8db6:30ec]) by MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::316b:7774:8db6:30ec%7]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 16:18:34 +0000
From: <Claudiu.Beznea@microchip.com>
To: <sam@ravnborg.org>, <thierry.reding@gmail.com>
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Topic: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Index: AQHU+2NzxFOsw6p3b0iYuTBfPVB4RaZgDjOAgCvdRQA=
Date: Tue, 4 Jun 2019 16:18:33 +0000
Message-ID: <c361b013-2d98-76e3-d30f-cec83000933c@microchip.com>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
 <20190507182713.GA16862@ravnborg.org>
In-Reply-To: <20190507182713.GA16862@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0032.eurprd07.prod.outlook.com
 (2603:10a6:800:90::18) To MWHPR11MB1549.namprd11.prod.outlook.com
 (2603:10b6:301:c::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190604191820598
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8622c385-bc4e-430f-465f-08d6e9084a4d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR11MB1583; 
x-ms-traffictypediagnostic: MWHPR11MB1583:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR11MB1583EDA94CA77947B5B5DB6B87150@MWHPR11MB1583.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39860400002)(366004)(346002)(199004)(189003)(52116002)(76176011)(316002)(66476007)(66556008)(64756008)(66446008)(5660300002)(446003)(26005)(486006)(66946007)(73956011)(2906002)(66066001)(2616005)(3846002)(31696002)(6506007)(386003)(7416002)(68736007)(6116002)(8676002)(86362001)(72206003)(81156014)(186003)(8936002)(81166006)(14444005)(476003)(305945005)(7736002)(478600001)(256004)(6436002)(229853002)(25786009)(14454004)(6512007)(6306002)(11346002)(53936002)(966005)(54906003)(110136005)(31686004)(6246003)(102836004)(99286004)(71190400001)(71200400001)(6486002)(4326008)(36756003)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1583;
 H:MWHPR11MB1549.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d3gRv7rqLimiMosEx4WSpSnFA41PAJYeK+DYVDlFUzW6TWXPYWQeHqf8u06t5qbCwdyLorTdFYBhtcQO2iU4I5XMNKub1DwRy4a2Jg7CMlaCb+iadRICGWcRB2UZaEcjXv8os7uvVLbIvE7HZBrUSFd6FFJoQGq8hVYUpkbsAt74V9XUzAQZCpl0HRRxSyf3ZTFH/XHSbUXkp7VSGLqH1i/FZstjBq6cviMMEwgGHj2HxcNeiRnrzqGQqE9xMXX7cwS762Pn4lr2mvGPoqJbDmXK2WLj8InOzaXc9K0kalOjm1IC+bD4S48EafdGx+e5mJru7tkLbCVQOfz0nrX/W33JO3nSPQR6mcB0aKryfdPNjDBTyX22veJgouT3ZCj9Qd0+wCJZznGYFID9REYiExpasWKHlCi9yAW4hKzQfao=
Content-ID: <4EDBCAD05C24604EBEFA9A6EEF02CDE8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8622c385-bc4e-430f-465f-08d6e9084a4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 16:18:33.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: claudiu.beznea@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1583
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3tI8LXi5R3L7VQnDezNvjooeBm3q62YSN/CRKjnfe4=;
 b=Imyztnv0YaM49ySTHizWxKmSKC1DXvAYzcYluxBdmyDi2F9UO3b7AE21Y/knd3AMX06uDWJX01QmEe6P4Nb/jMd2KzelsPt7Td3MfSNcGEHu3kaTBbmrY885hZcnEK6YdKhj4xSsqiEGESN1mXJ0SkbLaIl4d2+jYktkf70qp+A=
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
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLA0KDQpPbiAwNy4wNS4yMDE5IDIxOjI3LCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+IEV4
dGVybmFsIEUtTWFpbA0KPiANCj4gDQo+IEhpIFRoaWVycnkuDQo+IA0KPj4gICBwd206IGF0bWVs
LWhsY2RjOiBhZGQgY29tcGF0aWJsZSBmb3IgU0FNOVg2MCBITENEQydzIFBXTQ0KPiBPSyB0byBh
ZGQgdGhlICJwd206IGF0bWVsLWhsY2RjOiBhZGQgY29tcGF0aWJsZSBmb3IgU0FNOVg2MCBITENE
QydzIFBXTSINCj4gcGF0Y2ggdmlhIGRybS1taXNjPw0KPiBUaGVuIHdlIGNhbiBhZGQgYWxsIDYg
cGF0Y2hlcyBpbiBvbmUgZ28uDQoNClNpbmNlIHdlIGRvbid0IGhhdmUgYW4gYW5zd2VyIGZyb20g
VGhpZXJyeSB0aWxsIG5vdywgZG8geW91IHRoaW5rIGl0IGNvdWxkDQpiZSBmZWFzaWJsZSB0byB0
YWtlIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzPyBBZnRlciB0aGF0IEkN
CndpbGwgcmUtc2VuZCB0aGUgUFdNIHBhdGNoIHRvIFBXTSBsaXN0Lg0KDQpUaGFuayB5b3UsDQpD
bGF1ZGl1IEJlem5lYQ0KDQo+IA0KPiAJU2FtDQo+IA0KPiAoS2VwdCByZW1haW5pbmcgb2YgbWFp
bCBmb3IgcmVmZXJlbmNlKQ0KPj4NCj4+IEhpLA0KPj4NCj4+IFRoZXNlIHBhdGNoZXMgYWRkcyBz
dXBwb3J0IGZvciBTQU05WDYwJ3MgTENEIGNvbnRyb2xsZXIuDQo+Pg0KPj4gRmlyc3QgcGF0Y2hl
cyBhZGQgb3B0aW9uIHRvIHNwZWNpZnkgaWYgY29udHJvbGxlciBjbG9jayBzb3VyY2UgaXMgZml4
ZWQuDQo+PiBTZWNvbmQgcGF0Y2ggYXZvaWQgYSB2YXJpYWJsZSBpbml0aWFsaXphdGlvbiBpbiBh
dG1lbF9obGNkY19jcnRjX21vZGVfc2V0X25vZmIoKS4NCj4+IFRoZSAzcmQgYWRkIGNvbXBhdGli
bGVzIGluIHB3bS1hdG1lbC1obGNkYyBkcml2ZXIuDQo+PiBUaGUgNHRoIHBhdGNoIGVuYWJsZXMg
c3lzX2NsayBpbiBwcm9iZSBzaW5jZSBTQU05WDYwIG5lZWRzIHRoaXMuDQo+PiBTcGVjaWZpYyBz
dXBwb3J0IHdhcyBhZGRlZCBhbHNvIGluIHN1c3BlbmQvcmVzdW1lIGhvb2tzLg0KPj4gVGhlIDV0
aCBwYXRjaCBhZGRzIFNBTTlYNjAncyBMQ0QgY29uZmlndXJhdGlvbiBhbmQgZW5hYmxlZCBpdC4N
Cj4+DQo+PiBJIHRvb2sgdGhlIGNoYW5nZXMgb2YgdGhpcyBzZXJpZXMgYW5kIGludHJvZHVjZWQg
YWxzbyBhIGZpeA0KPj4gKHRoaXMgaXMgdGhlIDZ0aCBwYXRjaCBpbiB0aGlzIHNlcmllcykgLSBp
ZiB5b3Ugd2FudCB0byBzZW5kIGl0IHNlcGFyYXRlbHkNCj4+IEkgd291bGQgZ2xhZGx5IGRvIGl0
Lg0KPj4NCj4+IEkgcmVzZW5kIHRoaXMgdG8gYWxzbyBpbmNsdWRlIExlZSBKb25lcyBmb3IgcHdt
LWF0bWVsLWhsY2RjIGNoYW5nZXMuDQo+Pg0KPj4gVGhhbmsgeW91LA0KPj4gQ2xhdWRpdSBCZXpu
ZWENCj4+DQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBrZWVwIGNvbXBhdGlibGUgc3RyaW5nIG9u
IHBhdGNoIDMvNiBvbiBhIHNpbmdsZSBsaW5lIChJIGtlZXAgaGVyZSBhIHRhYg0KPj4gICBpbiBm
cm9udCBvZiAiLmNvbXBhdGlibGUiIHRvIGJlIGFsaWduZWQgd2l0aCB0aGUgcmVzdCBvZiB0aGUg
Y29kZSBpbg0KPj4gICBhdG1lbF9obGNkY19kdF9pZHNbXSkNCj4+IC0gcGF0Y2hlcyA0LzcgYW5k
IDMvNyBmcm9tIHYyIHdlcmUgYXBwbGllZCBzbyByZW1vdmUgdGhlbSBmcm9tIHRoaXMgdmVyc2lv
bg0KPj4gLSBhZGQgYSBmaXggZm9yIGF0bWVsX2hsY2RjIChwYXRjaCA2LzYpDQo+Pg0KPj4gQ2hh
bmdlcyBpbiB2MjoNCj4+IC0gdXNlICJ8IiBvcGVyYXRvciBpbiBwYXRjaCAxLzcgdG8gc2V0IEFU
TUVMX0hMQ0RDX0NMS1NFTCBvbiBjZmcNCj4+IC0gY29sbGVjdCBBY2tlZC1ieSwgUmV2aWV3ZWQt
YnkgdGFncw0KPj4NCj4+IENsYXVkaXUgQmV6bmVhICg0KToNCj4+ICAgZHJtOiBhdG1lbC1obGNk
YzogYWRkIGNvbmZpZyBvcHRpb24gZm9yIGNsb2NrIHNlbGVjdGlvbg0KPj4gICBkcm06IGF0bWVs
LWhsY2RjOiBhdm9pZCBpbml0aWFsaXppbmcgY2ZnIHdpdGggemVybw0KPj4gICBwd206IGF0bWVs
LWhsY2RjOiBhZGQgY29tcGF0aWJsZSBmb3IgU0FNOVg2MCBITENEQydzIFBXTQ0KPj4gICBkcm0v
YXRtZWwtaGNsY2RjOiByZXZlcnQgc2hpZnQgYnkgOA0KPj4NCj4+IFNhbmRlZXAgU2hlcmlrZXIg
TWFsbGlrYXJqdW4gKDIpOg0KPj4gICBkcm06IGF0bWVsLWhsY2RjOiBlbmFibGUgc3lzX2NsayBk
dXJpbmcgaW5pdGFsaXphdGlvbi4NCj4+ICAgZHJtOiBhdG1lbC1obGNkYzogYWRkIHNhbTl4NjAg
TENEIGNvbnRyb2xsZXINCj4+DQo+PiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX2NydGMuYyAgfCAgMTggKystLQ0KPj4gIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNk
Yy9hdG1lbF9obGNkY19kYy5jICAgIHwgMTIwICsrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4g
IGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5oICAgIHwgICAyICsN
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyB8ICAg
MiArLQ0KPj4gIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC1obGNkYy5jICAgICAgICAgICAgICAgICAg
IHwgICAxICsNCj4+ICA1IGZpbGVzIGNoYW5nZWQsIDEzMiBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkNCj4+DQo+PiAtLSANCj4+IDIuNy40DQo+Pg0KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QN
Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdA0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsDQo+IA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
