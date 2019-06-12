Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128643369
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3D89320;
	Thu, 13 Jun 2019 07:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jun 2019 08:02:42 UTC
Received: from esa6.microchip.iphmx.com (esa6.microchip.iphmx.com
 [216.71.154.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1118908E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:02:42 +0000 (UTC)
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Nicolas.Ferre@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="Nicolas.Ferre@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.63,363,1557212400"; d="scan'208";a="34080989"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jun 2019 00:55:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Jun 2019 00:55:32 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 12 Jun 2019 00:55:32 -0700
Received: from MWHPR11MB1662.namprd11.prod.outlook.com (10.172.55.15) by
 MWHPR11MB1646.namprd11.prod.outlook.com (10.172.54.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 07:55:30 +0000
Received: from MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::7534:63dc:8504:c2b3]) by MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::7534:63dc:8504:c2b3%6]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 07:55:30 +0000
From: <Nicolas.Ferre@microchip.com>
To: <colin.king@canonical.com>, <b.zolnierkie@samsung.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH][next] video: fbdev: atmel_lcdfb: remove redundant
 initialization to variable ret
Thread-Topic: [PATCH][next] video: fbdev: atmel_lcdfb: remove redundant
 initialization to variable ret
Thread-Index: AQHVIHhxNzg6Tx2rZEi/BuBHE6ieyaaXp22A
Date: Wed, 12 Jun 2019 07:55:30 +0000
Message-ID: <37ac8530-6601-a1a0-37e0-8c6d5d1702cd@microchip.com>
References: <20190611170913.20913-1-colin.king@canonical.com>
In-Reply-To: <20190611170913.20913-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0228.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::24) To MWHPR11MB1662.namprd11.prod.outlook.com
 (2603:10b6:301:e::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7757d5c-afab-4fdf-557a-08d6ef0b56ee
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR11MB1646; 
x-ms-traffictypediagnostic: MWHPR11MB1646:
x-microsoft-antispam-prvs: <MWHPR11MB1646FB9DAAA4376C23EA3DEDE0EC0@MWHPR11MB1646.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(72206003)(386003)(64756008)(66476007)(476003)(6512007)(68736007)(26005)(53546011)(99286004)(53936002)(2616005)(6506007)(102836004)(86362001)(11346002)(186003)(229853002)(486006)(6246003)(2501003)(446003)(36756003)(2201001)(66446008)(66556008)(31686004)(4326008)(6436002)(8676002)(305945005)(81166006)(316002)(31696002)(8936002)(6486002)(25786009)(81156014)(7736002)(478600001)(76176011)(52116002)(4744005)(54906003)(256004)(66946007)(2906002)(14444005)(110136005)(73956011)(5660300002)(14454004)(66066001)(71190400001)(71200400001)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1646;
 H:MWHPR11MB1662.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /x8SIDZnpkmA1BFQPgZKYF+oi2q7DRkAz+6Z7cZtpB0JVgainvWKkaGtIfDgjF4mh1bYp4ZWrXbfaHlmemNiwkTLoXSqcHgxc4tRp2JEaE7AFGfeTM4XpWiR21ydD5T0bATz9vl1Vv0C9StkWG13b7fHvB58XaYdbTQysP/eF3L9GwN8FoAUUFWC2ZuJ3fL6AT1LuIR9NO9g07PZwvge34fIhaTfh/nbgbZxvf2elKFNTzVJGHfddy2XYltx/kG/NIY+gF321ZUt7icG/S9ZsGyCWP/C0T2I3IpyfIzj4Dta53U7Z8ePZ2HV9h7umkuk1kzNJQ1cbw8KeGv5dAPb5q6ASQ7ZC9YDLiTcYGPW5CfkIfRRY97Z/Iz/8SfAI4dbrfyBGMssuRW5WvLxqKOVXOzCAPxylPtBmGs1sAYoqkk=
Content-ID: <BAA8371C89283945AE7EC078E4004321@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f7757d5c-afab-4fdf-557a-08d6ef0b56ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 07:55:30.5045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nicolas.ferre@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1646
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXSDa9DWzTco6T0nG/cxa6bKscMVuLsU5NrSuJMDljk=;
 b=EmICF+S+fXJasEH86dpp+vQQMlbEAX6ZZeVWcgkKva+UK3Ms1pYlXB99kdqrPGkop+8/M08zwFFxLw6oOUxFFuBgHAGaMRvHucodcoWV989iTSfhObCaO1cjNd07Ynq6MFHbBtfpgG3Dzz2vAy/noViEviLONW8NZG8F2hsA5e8=
X-Mailman-Original-Authentication-Results: esa6.microchip.iphmx.com; spf=Pass
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMDYvMjAxOSBhdCAxOTowOSwgQ29saW4gS2luZyB3cm90ZToNCj4gRXh0ZXJuYWwgRS1N
YWlsDQo+IA0KPiANCj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4NCj4gDQo+IEN1cnJlbnRseSB2YXJpYWJsZSByZXQgaXMgYmVpbmcgaW5pdGlhbGl6ZWQg
d2l0aCAtRU5PRU5UIGhvd2V2ZXIgdGhhdA0KPiB2YWx1ZSBpcyBuZXZlciByZWFkIGFuZCByZXQg
aXMgYmVpbmcgcmUtYXNzaWduZWQgbGF0ZXIgb24uIEhlbmNlIHRoaXMNCj4gYXNzaWdubWVudCBp
cyByZWR1bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkLg0KPiANCj4gQWRkcmVzc2VzLUNvdmVyaXR5
OiAoIlVudXNlZCB2YWx1ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+DQoNCkluZGVlZDoNCkFja2VkLWJ5OiBOaWNvbGFzIEZlcnJl
IDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQoNClRoYW5rcywgYmVzdCByZWdhcmRzLA0K
ICAgTmljb2xhcw0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9hdG1lbF9sY2Rm
Yi5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIuYw0KPiBpbmRleCBmYjExN2NjYmVh
YjMuLjkzMGNjM2Y5MmUwMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hdG1l
bF9sY2RmYi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIuYw0KPiBA
QCAtOTUwLDcgKzk1MCw3IEBAIHN0YXRpYyBpbnQgYXRtZWxfbGNkZmJfb2ZfaW5pdChzdHJ1Y3Qg
YXRtZWxfbGNkZmJfaW5mbyAqc2luZm8pDQo+ICAgCXN0cnVjdCBmYl92aWRlb21vZGUgZmJfdm07
DQo+ICAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOw0KPiAgIAlzdHJ1Y3QgdmlkZW9tb2RlIHZt
Ow0KPiAtCWludCByZXQgPSAtRU5PRU5UOw0KPiArCWludCByZXQ7DQo+ICAgCWludCBpOw0KPiAg
IA0KPiAgIAlzaW5mby0+Y29uZmlnID0gKHN0cnVjdCBhdG1lbF9sY2RmYl9jb25maWcqKQ0KPiAN
Cg0KDQotLSANCk5pY29sYXMgRmVycmUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
