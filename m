Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0A6388689
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 07:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2046E200;
	Wed, 19 May 2021 05:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BC8F6E202
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 05:31:19 +0000 (UTC)
X-UUID: 294fa27d168740cfa5356bc62f4d1256-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=R77Q1fQW/odTmnYvAyiJFw4Pabof7f591ESN1e7RqC4=; 
 b=Nkv2IH+00T7LnZXW05A/HuORHiBBsUtDzG+8p/stQU8UnC8UMJRofokaKzOCed0qBF9dtL5Zr8GDd1HhINgQeTcR928KNsj3PS6qqyfEJSjugVktSWPiqNK2y9IsbXcG4TkyLUBvXeVznThEe2EDENAJGL68TjnfHrJKAKg9tlc=;
X-UUID: 294fa27d168740cfa5356bc62f4d1256-20210519
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 345906070; Wed, 19 May 2021 13:31:17 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 May 2021 13:31:14 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 13:31:13 +0800
Message-ID: <1621402273.10680.0.camel@mszsdaap41>
Subject: Re: [PATCH 4/4] drm/mediatek: add dsi module reset driver
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 May 2021 13:31:13 +0800
In-Reply-To: <CAAOTY__JZsAmGtX-+hNu0123xKoEdP2CgGxmQK2bqa-i+3dr6Q@mail.gmail.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
 <20210420132614.150242-4-jitao.shi@mediatek.com>
 <CAAOTY__JZsAmGtX-+hNu0123xKoEdP2CgGxmQK2bqa-i+3dr6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 86D50871892250EBFA58D265CE83AD217ED8423C9374DC154FC2BF45A4E07E942000:8
X-MTK: N
Content-Transfer-Encoding: base64
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 Huijuan Xie =?UTF-8?Q?=28=E8=B0=A2=E6=85=A7=E5=A8=9F=29?=
 <Huijuan.Xie@mediatek.com>, "stonea168@163.com" <stonea168@163.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Cawa Cheng =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?=
 <cawa.cheng@mediatek.com>,
 Rex-BC Chen =?UTF-8?Q?=28=E9=99=B3=E6=9F=8F=E8=BE=B0=29?=
 <Rex-BC.Chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIxLTA0LTI0IGF0IDA3OjUwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSml0YW86DQo+IA0KPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaW
vCAyMDIx5bm0NOaciDIw5pelIOmAseS6jCDkuIvljYg5OjI25a+r6YGT77yaDQo+ID4NCj4gPiBS
ZXNldCBkc2kgSFcgdG8gZGVmYXVsdCB3aGVuIHBvd2VyIG9uLiBQcmV2ZW50IHRoZSBzZXR0aW5n
IGRpZmZlcmV0DQo+ID4gYmV0d2VlbiBib290bG9hZGVyIGFuZCBrZXJuZWwuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAzNiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0K
PiA+IGluZGV4IDQ1NWZlNTgyYzZiNS4uMTEzNDM4ZGRkNGNjIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ID4gQEAgLTcsMTAgKzcsMTIgQEANCj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2NvbXBvbmVudC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+DQo+
ID4gICNpbmNsdWRlIDxsaW51eC9pcnEuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNj
b24uaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9v
Zl9wbGF0Zm9ybS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPg0KPiA+ICAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZWdt
YXAuaD4NCj4gPg0KPiA+ICAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+DQo+ID4gICNp
bmNsdWRlIDx2aWRlby92aWRlb21vZGUuaD4NCj4gPiBAQCAtMTQzLDYgKzE0NSw4IEBADQo+ID4g
ICNkZWZpbmUgREFUQV8wICAgICAgICAgICAgICAgICAgICAgICAgICgweGZmIDw8IDE2KQ0KPiA+
ICAjZGVmaW5lIERBVEFfMSAgICAgICAgICAgICAgICAgICAgICAgICAoMHhmZiA8PCAyNCkNCj4g
Pg0KPiA+ICsjZGVmaW5lIE1NU1lTX1NXX1JTVF9EU0lfQiBCSVQoMjUpDQo+ID4gKw0KPiA+ICAj
ZGVmaW5lIE5TX1RPX0NZQ0xFKG4sIGMpICAgICgobikgLyAoYykgKyAoKChuKSAlIChjKSkgPyAx
IDogMCkpDQo+ID4NCj4gPiAgI2RlZmluZSBNVEtfRFNJX0hPU1RfSVNfUkVBRCh0eXBlKSBcDQo+
ID4gQEAgLTE4Niw3ICsxOTAsOCBAQCBzdHJ1Y3QgbXRrX2RzaSB7DQo+ID4gICAgICAgICBzdHJ1
Y3QgZHJtX2JyaWRnZSAqbmV4dF9icmlkZ2U7DQo+ID4gICAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yOw0KPiA+ICAgICAgICAgc3RydWN0IHBoeSAqcGh5Ow0KPiA+IC0NCj4g
PiArICAgICAgIHN0cnVjdCByZWdtYXAgKm1tc3lzX3N3X3JzdF9iOw0KPiA+ICsgICAgICAgdTMy
IHN3X3JzdF9iOw0KPiA+ICAgICAgICAgdm9pZCBfX2lvbWVtICpyZWdzOw0KPiA+DQo+ID4gICAg
ICAgICBzdHJ1Y3QgY2xrICplbmdpbmVfY2xrOw0KPiA+IEBAIC0yNzIsNiArMjc3LDE2IEBAIHN0
YXRpYyB2b2lkIG10a19kc2lfZGlzYWJsZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KPiA+ICAgICAg
ICAgbXRrX2RzaV9tYXNrKGRzaSwgRFNJX0NPTl9DVFJMLCBEU0lfRU4sIDApOw0KPiA+ICB9DQo+
ID4NCj4gPiArc3RhdGljIHZvaWQgbXRrX2RzaV9yZXNldF9hbGwoc3RydWN0IG10a19kc2kgKmRz
aSkNCj4gPiArew0KPiA+ICsgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKGRzaS0+bW1zeXNfc3df
cnN0X2IsIGRzaS0+c3dfcnN0X2IsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgTU1T
WVNfU1dfUlNUX0RTSV9CLCAwKTsNCj4gPiArICAgICAgIHVzbGVlcF9yYW5nZSgxMDAwLCAxMTAw
KTsNCj4gPiArDQo+ID4gKyAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoZHNpLT5tbXN5c19zd19y
c3RfYiwgZHNpLT5zd19yc3RfYiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBNTVNZ
U19TV19SU1RfRFNJX0IsIE1NU1lTX1NXX1JTVF9EU0lfQik7DQo+ID4gK30NCj4gPiArDQo+ID4g
IHN0YXRpYyB2b2lkIG10a19kc2lfcmVzZXRfZW5naW5lKHN0cnVjdCBtdGtfZHNpICpkc2kpDQo+
ID4gIHsNCj4gPiAgICAgICAgIG10a19kc2lfbWFzayhkc2ksIERTSV9DT05fQ1RSTCwgRFNJX1JF
U0VULCBEU0lfUkVTRVQpOw0KPiA+IEBAIC05ODUsNiArMTAwMCw4IEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lk
ICpkYXRhKQ0KPiA+DQo+ID4gICAgICAgICByZXQgPSBtdGtfZHNpX2VuY29kZXJfaW5pdChkcm0s
IGRzaSk7DQo+ID4NCj4gPiArICAgICAgIG10a19kc2lfcmVzZXRfYWxsKGRzaSk7DQo+ID4gKw0K
PiA+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAgfQ0KPiA+DQo+ID4gQEAgLTEwMDcsNiArMTAy
NCw3IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiA+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiAg
ICAgICAgIHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsOw0KPiA+ICAgICAgICAgc3RydWN0IHJlc291
cmNlICpyZWdzOw0KPiA+ICsgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPiA+ICAgICAg
ICAgaW50IGlycV9udW07DQo+ID4gICAgICAgICBpbnQgcmV0Ow0KPiA+DQo+ID4gQEAgLTEwMjIs
NiArMTA0MCwyMiBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAgICAgICAg
IH0NCj4gPg0KPiA+ICsgICAgICAgcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhh
bmRsZShkZXYtPm9mX25vZGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJtZWRpYXRlayxzeXNjb24tZHNpIik7DQo+ID4gKyAgICAgICByZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChkZXYtPm9mX25vZGUsICJtZWRpYXRlayxzeXNj
b24tZHNpIiwgMSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZkc2ktPnN3X3JzdF9iKTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKHJlZ21hcCkp
DQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIocmVnbWFwKTsNCj4gPiArDQo+ID4g
KyAgICAgICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIocmVn
bWFwKTsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IG1t
c3lzIHJlZ2lzdGVyczogJWRcbiIsIHJldCk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgZHNpLT5tbXN5c19zd19yc3Rf
YiA9IHJlZ21hcDsNCj4gPiArDQo+IA0KPiBJdCBsb29rcyBsaWtlIHRoYXQgbXRrLW1tc3lzIGlz
IHRoZSByZXNldCBjb250cm9sbGVyIGFuZCBtdGstZHNpIGlzDQo+IHJlc2V0IGNvbnN1bWVyLiBQ
bGVhc2UgcmVmZXIgdG8gWzFdLCBbMl0gdG8gaW1wbGVtZW50Lg0KPiANCj4gWzFdIGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2RyaXZlci1hcGkvcmVzZXQuaHRtbA0KPiBb
Ml0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0
L3Jlc2V0LnR4dD9oPXY1LjEyLXJjOA0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4g
DQoNClRoYW5rcywgSSdsbCBmaXggbmV4dCB2ZXJzaW9uLg0KDQo+ID4gICAgICAgICByZXQgPSBk
cm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoZGV2LT5vZl9ub2RlLCAwLCAwLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwYW5lbCwgJmRzaS0+bmV4dF9i
cmlkZ2UpOw0KPiA+ICAgICAgICAgaWYgKHJldCkNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA0KDQo=

