Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FC7505CD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 11:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6F189453;
	Mon, 24 Jun 2019 09:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5289453
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:32:38 +0000 (UTC)
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB3118.eurprd08.prod.outlook.com (52.133.15.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.15; Mon, 24 Jun 2019 09:32:35 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::f00e:b5de:6aa:4a64]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::f00e:b5de:6aa:4a64%6]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 09:32:35 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVKBsKBvRwqAaS30eXmbt21cTJQqamO1MAgART94A=
Date: Mon, 24 Jun 2019 09:32:35 +0000
Message-ID: <20190624093233.73f3tcshewlbogli@DESKTOP-E1NTVVP.localdomain>
References: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
 <CAKMK7uEjh+GrSy5AgbVLVQd1S5oJ8KFiWEUmxtMMVdcMSBtdCQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEjh+GrSy5AgbVLVQd1S5oJ8KFiWEUmxtMMVdcMSBtdCQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::26) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5c4cdfa-ffeb-40fa-6607-08d6f886e3be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3118; 
x-ms-traffictypediagnostic: VI1PR08MB3118:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB3118843B1B8A5ED1AC0A63D7F0E00@VI1PR08MB3118.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(366004)(376002)(346002)(199004)(189003)(66476007)(53936002)(7736002)(6486002)(102836004)(99286004)(52116002)(14454004)(6506007)(81166006)(8676002)(72206003)(81156014)(76176011)(316002)(6916009)(8936002)(53546011)(44832011)(26005)(966005)(6246003)(476003)(2906002)(54906003)(186003)(11346002)(486006)(446003)(58126008)(9686003)(6116002)(3846002)(6512007)(256004)(229853002)(305945005)(6436002)(1076003)(14444005)(386003)(25786009)(478600001)(6306002)(5660300002)(71200400001)(66066001)(68736007)(66446008)(86362001)(66556008)(71190400001)(4326008)(73956011)(64756008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3118;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UoPjhhq+tJbmaI6exE1fk9ud0O9pG/XLf2tS1mHYFeGaLBU3Rmnq7dXBY/ieKDm6Cjx/llt0iD2kl4DhV0XM1pLmb3n8DX96MAiff60+aiuEZfRQ+sc4D9nJrwbDXIv8JJeZ16M3hrzsSLDBNz3rPMShFQvFjhgGLe0vbUSGSnW9VNYnEYJMgMRFk6Ve0tqYxA/H1825sM3zjAvs3h5+etn7Bk1XZBqHekhHSoqA3HgxACSE8wwOCihXu7PM+41dJ3Mgh8lt3SdID1DxdblGykAtXKC4Txx+B+pNIzbVEdKwQ/+FihQEX2QyIGTzLExVEL3F733c31Qb1Hg3eWZlPX3GO0UiutmHcmJqcFCZ711YhNYJZ83+OHr+eubcUobet8o7W17pTw8ECvHlQKELIGjBdi4jTU4jzulAULuYZA8=
Content-ID: <C330A0BE0BC8B2479ECC7057B841D34C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c4cdfa-ffeb-40fa-6607-08d6f886e3be
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 09:32:35.3533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv5Xqog5f/Dc9maPP2LdqiIYxbtPDzmV6HbKrukCNDU=;
 b=0HT1Uv1IdM8VE0Nc4gRRUPkJhD7Y9Z5cqIQop2EPOXpLUYMZjLtmLAAbqa1/CXbs0kC/UjuYaBXnNYJBMZedD5UmDHZUOWmG2ItcTggobOYb2XC0z2gi7/1YPkujY89IZH0NnOtgNsxQBTKVL95ELntOmnG1QUlM6yvMVC1cFow=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
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
Cc: nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>,
 "yuq825@gmail.com" <yuq825@gmail.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDU6Mjc6MDBQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAxMjoyMSBQTSBSYXlt
b25kIFNtaXRoIDxSYXltb25kLlNtaXRoQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCB0aGUg
RFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJMRUFWRUQgbW9kaWZpZXIgdG8K
PiA+IGRlbm90ZSB0aGUgMTZ4MTYgYmxvY2sgdS1pbnRlcmxlYXZlZCBmb3JtYXQgdXNlZCBpbiBB
cm0gVXRnYXJkIGFuZAo+ID4gTWlkZ2FyZCBHUFVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJh
eW1vbmQgU21pdGggPHJheW1vbmQuc21pdGhAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTAgKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0v
ZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+IGluZGV4IDNm
ZWVhYTMuLjhlZDdlY2YgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3Vy
Y2MuaAo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+IEBAIC03NDMs
NiArNzQzLDE2IEBAIGV4dGVybiAiQyIgewo+ID4gICNkZWZpbmUgQUZCQ19GT1JNQVRfTU9EX0JD
SCAgICAgKDFVTEwgPDwgMTEpCj4gPgo+ID4gIC8qCj4gPiArICogQXJtIDE2eDE2IEJsb2NrIFUt
SW50ZXJsZWF2ZWQgbW9kaWZpZXIKPiA+ICsgKgo+ID4gKyAqIFRoaXMgaXMgdXNlZCBieSBBcm0g
TWFsaSBVdGdhcmQgYW5kIE1pZGdhcmQgR1BVcy4gSXQgZGl2aWRlcyB0aGUgaW1hZ2UKPiA+ICsg
KiBpbnRvIDE2eDE2IHBpeGVsIGJsb2Nrcy4gQmxvY2tzIGFyZSBzdG9yZWQgbGluZWFybHkgaW4g
b3JkZXIsIGJ1dCBwaXhlbHMKPiA+ICsgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KPiA+
ICsgKi8KPiA+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX0FSTV8xNlgxNl9CTE9DS19VX0lOVEVS
TEVBVkVEIFwKPiA+ICsgICAgICAgZm91cmNjX21vZF9jb2RlKEFSTSwgKCgxVUxMIDw8IDU1KSB8
IDEpKQo+IAo+IFRoaXMgc2VlbXMgdG8gYmUgYW4gZXh0cmVtZWx5IHJhbmRvbSBwaWNrIGZvciBh
IG5ldyBudW1iZXIuIFdoYXQncyB0aGUKPiB0aGlua2luZyBoZXJlPyBBc2lkZSBmcm9tICJkb2Vz
bnQgbWF0Y2ggYW55IG9mIHRoZSBhZmJjIGNvbWJvcyIgb2ZjLgo+IElmIHlvdSdyZSBhbHJlYWR5
IHVwIHRvIGhhdmluZyB0aHJvd24gYXdheSA1NWJpdHMsIHRoZW4gaXQncyBub3QgZ29pbmcKPiB0
byBsYXN0IGxvbmcgcmVhbGx5IDotKQo+IAo+IEkgdGhpbmsgYSBnb29kIGlkZWEgd291bGQgYmUg
dG8gcmVzZXJ2ZSBhIGJ1bmNoIG9mIHRoZSBoaWdoIGJpdHMgYXMKPiBzb21lIGZvcm0gb2YgaW5k
ZXggKGFmYmMgd291bGQgZ2V0IGluZGV4IDAgZm9yIGJhY2t3YXJkcyBjb21wYXQpLiBBbmQKPiB0
aGVuIHRoZSBsb3dlciBiaXRzIHdvdWxkIGJlIGZvciBmcmVlIHVzZSBmb3IgYSBnaXZlbiBpbmRl
eC9tb2RlLiBBbmQKPiB0aGUgZmlyc3QgbW9kZSBpcyBwcm9iYWJseSBhbiBlbnVtZXJhdGlvbiwg
d2hlcmUgcG9zc2libGUgbW9kZXMgc2ltcGxlCj4gZ2V0IGVudW1lcmF0ZWQgd2l0aG91dCBmdXJ0
aGVyIGZsYWdzIG9yIGFueXRoaW5nLgoKWXVwLCB0aGF0J3MgdGhlIHBsYW46CgoJKDAgPDwgNTUp
OiBBRkJDCgkoMSA8PCA1NSk6IFRoaXMgIm5vbi1jYXRlZ29yeSIgZm9yIFUtSW50ZXJsZWF2ZWQK
CSgxIDw8IDU0KTogV2hhdGV2ZXIgdGhlIG5leHQgY2F0ZWdvcnkgaXMKCSgzIDw8IDU0KTogV2hh
dGV2ZXIgY29tZXMgYWZ0ZXIgdGhhdAoJKDEgPDwgNTMpOiBNYXliZSB3ZSdsbCBnZXQgaGVyZSBz
b21lZGF5CgkuLi4KCkkgZGlkbid0IHdhbnQgdG8gZXhwbGljaXRseSByZXNlcnZlIHNvbWUgaGln
aCBiaXRzLCBiZWNhdXNlIHdlJ3ZlIG5vCmlkZWEgaG93IG1hbnkgdG8gcmVzZXJ2ZS4gVGhpcyB3
YXksIHdlIGNhbiBhc3NpZ24gZXhhY3RseSBhcyBtYW55CmhpZ2ggYml0cyBhcyB3ZSBuZWVkLCB3
aGVuIHdlIG5lZWQgdGhlbS4gSWYgYW55IG9mIHRoZSAibW9kZXMiIHN0YXJ0CmVuY3JvYWNoaW5n
IHRvd2FyZHMgdGhlIGhpZ2ggYml0cywgd2UnbGwgaGF2ZSB0byBtYWtlIGEgZGVjaXNpb24gYXQK
dGhhdCBwb2ludC4KCkFsc28sIHRoaXMgaXMgdGhlIG9ubHkgVS1JbnRlcmxlYXZlZCBmb3JtYXQg
KHRoYXQgSSBrbm93IG9mKSwgc28gaXQncwpub3Qgd29ydGggY2FsbGluZyBiaXQgNTUgIlRoZSBV
LUludGVybGVhdmVkIGJpdCIgYmVjYXVzZSB0aGF0IHdvdWxkIGJlCmEgd2FzdGUgb2Ygc3BhY2Uu
IEl0J3MgbW9yZSBsaWtlIHRoZSAibWlzYyIgYml0LCBidXQgdGhhdCdzIG5vdCBhCnVzZWZ1bCBu
YW1lIHRvIGVuc2hyaW5lIGluIFVBUEkuCgpOb3RlIHRoYXQgaXNuJ3QgdGhlIHNhbWUgYXMgdGhl
ICJub3QtQUZCQyBiaXQiLCBiZWNhdXNlIHdlIG1heSB3ZWxsCmhhdmUgc29tZXRoaW5nIGluIHRo
ZSBmdXR1cmUgd2hpY2ggaXMgbmVpdGhlciBBRkJDIG5vciAibWlzYyIuCgpXZSd2ZSBiZWVuIHZl
cnkgY2FyZWZ1bCBpbiBvdXIgY29kZSB0byBlbmZvcmNlIGFsbAp1bmRlZmluZWQvdW5yZWNvZ25p
c2VkIGJpdHMgdG8gYmUgemVybywgdG8gZW5zdXJlIHRoYXQgdGhpcyB3b3Jrcy4KCj4gCj4gVGhl
IG90aGVyIGJpdDogV291bGQgYmUgcmVhbCBnb29kIHRvIGRlZmluZSB0aGUgZm9ybWF0IGEgYml0
IG1vcmUKPiBwcmVjaXNlbHksIGluY2x1ZGluZyB0aGUgbGF5b3V0IHdpdGhpbiB0aGUgdGlsZS4K
Ckl0J3MgVS1JbnRlcmxlYXZlZCwgb2J2aW91c2x5IDstKQoKLUJyaWFuCgo+IAo+IEFsc28gb2Zj
IG5lZWRzIGFja3MgZnJvbSBsaW1hL3BhbmZyb3N0IHBlb3BsZSBzaW5jZSBJIGFzc3VtZSB0aGV5
J2xsCj4gYmUgdXNpbmcgdGhpcywgdG9vLgo+IAo+IFRoYW5rcywgRGFuaWVsCj4gCj4gPiArCj4g
PiArLyoKPiA+ICAgKiBBbGx3aW5uZXIgdGlsZWQgbW9kaWZpZXIKPiA+ICAgKgo+ID4gICAqIFRo
aXMgdGlsaW5nIG1vZGUgaXMgaW1wbGVtZW50ZWQgYnkgdGhlIFZQVSBmb3VuZCBvbiBhbGwgQWxs
d2lubmVyIHBsYXRmb3JtcywKPiA+IC0tCj4gPiAyLjcuNAo+ID4KPiAKPiAKPiAtLSAKPiBEYW5p
ZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
