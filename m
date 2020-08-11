Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D3241D34
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 17:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCD86E57A;
	Tue, 11 Aug 2020 15:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pp0132.ppsmtp.net (pp0132.ppsmtp.net [132.145.227.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CED56E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 15:32:22 +0000 (UTC)
Received: from pps.filterd (pp0132.ppsmtp.internal [127.0.0.1])
 by pp0132.ppsmtp.internal (8.16.0.42/8.16.0.42) with SMTP id 07BFN59t021512;
 Tue, 11 Aug 2020 17:32:20 +0200
Received: from exchange.systecgmbh.local ([81.173.215.30])
 by pp0132.ppsmtp.internal with ESMTP id 32shg1su85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 17:32:20 +0200
Received: from exchange.systecgmbh.local (10.0.1.54) by exchange (10.0.1.54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1713.5; Tue, 11 Aug
 2020 17:32:16 +0200
Received: from exchange.systecgmbh.local ([fe80::5086:b331:10c9:2db1]) by
 exchange.systecgmbh.local ([fe80::d829:29c0:9f1d:4a8e%7]) with mapi id
 15.01.1713.009; Tue, 11 Aug 2020 17:32:16 +0200
From: Stefan Birkholz <Birkholz@systecnet.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: AW: imx-drm: master bind failed: -517 with parallel_display (on
 i.MX6DL)
Thread-Topic: imx-drm: master bind failed: -517 with parallel_display (on
 i.MX6DL)
Thread-Index: AdZv7KKvurew1forSlCr+ylhpmkNJf//6hiA///eMzA=
Date: Tue, 11 Aug 2020 15:32:15 +0000
Message-ID: <04b805e44cbc4bffac21297dbdf4adae@systecnet.com>
References: <f25a430a491c46a9bacef9f62c3c2129@systecnet.com>
 <CAKMK7uFaAMmnLOEdm29fKmVpK4i=HnCLDGhk8sTu2KAhhn3cMQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFaAMmnLOEdm29fKmVpK4i=HnCLDGhk8sTu2KAhhn3cMQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.3.109]
MIME-Version: 1.0
X-Proofpoint-ID: SID=32shg1su85 QID=32shg1su85-1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_15:2020-08-11,
 2020-08-11 signatures=0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLA0KDQphY3R1YWxseSBnaXQgYmlzZWN0aW9uIHlpZWxkZWQgdHdvIHN1YnNlcXVl
bnQgY29tbWl0cyA1YmY3Mjk1ZmUzNGE1MjUgYW5kIDgwYWNiZWQ5ZjhmY2ExZGIzZiwgYm90aCB3
ZXJlIGJhZCwgYnV0IEkgd2Fzbid0IGNsZWFyIGFib3V0IHdoYXQgY2hhbmdlZCBpbiB0aGUgaW14
LWRybSBzdWJzeXN0ZW0gaW4gdGhvc2UgY29tbWl0czsgYmlzZWN0aW9uIHN0b3BwZWQgdGhlbi4g
SSBub3RpY2VkIHRoZXJlIHdhcyBhIHRyYW5zaXRpb24gZnJvbSB1c2luZyA8ZHJtL2RybV9jcnRj
X2hlbHBlci5oPiB0byA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+IGluIHRoYXQgdGltZXNwYW4s
IGJ1dCBJIGRpZG4ndCB3YW50IHRvIGFzc3VtZSB0aGF0J3MgdGhlIHNvdXJjZSBvZiB0aGUgcHJv
YmxlbS4gDQoNClJlZ2FyZHMsDQogU3RlZmFuDQoNCi0tLS0tVXJzcHLDvG5nbGljaGUgTmFjaHJp
Y2h0LS0tLS0NClZvbjogRGFuaWVsIFZldHRlciBbbWFpbHRvOmRhbmllbEBmZndsbC5jaF0gDQpH
ZXNlbmRldDogRGllbnN0YWcsIDExLiBBdWd1c3QgMjAyMCAxNzoxNw0KQW46IFN0ZWZhbiBCaXJr
aG9seiA8Qmlya2hvbHpAc3lzdGVjbmV0LmNvbT4NCkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQmV0cmVm
ZjogUmU6IGlteC1kcm06IG1hc3RlciBiaW5kIGZhaWxlZDogLTUxNyB3aXRoIHBhcmFsbGVsX2Rp
c3BsYXkgKG9uIGkuTVg2REwpDQoNCk9uIFR1ZSwgQXVnIDExLCAyMDIwIGF0IDU6MDcgUE0gU3Rl
ZmFuIEJpcmtob2x6IDxCaXJraG9sekBzeXN0ZWNuZXQuY29tPiB3cm90ZToNCj4NCj4gSGVsbG8s
DQo+DQo+IHdlIGFyZSB1c2luZyB0aGUgbWFpbmxpbmUga2VybmVsIChjdXJyZW50bHkgb24gNC4x
OS4xMjgpIHN1Y2Nlc3NmdWxseSBvbiBhbiBpLk1YNkRMLWJhc2VkIHN5c3RlbSwgYnV0IHdoZW4g
d2UgdHJ5IHRvIHVwZ3JhZGUgdG8gYW55IG1vcmUgcmVjZW50IGtlcm5lbCAoPjUuMSkgdGhlIGRp
c3BsYXkgb3V0cHV0IHN0b3BzIHdvcmtpbmcgKHNjcmVlbiBpcyBibGFuaywgYmFja2xpZ2h0IHdv
cmtzKS4NCj4NCj4gVGhlIHJlbGV2YW50IGVudHJpZXMgZnJvbSB0aGUga2VybmVsIGxvZyBzZWVt
IHRvIGJlOg0KPiBbICAgIDguOTU0OTQyXSBpbXgtZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBib3Vu
ZCBpbXgtaXB1djMtY3J0Yy4zIChvcHMgaW14X2RybV9leGl0IFtpbXhkcm1dKQ0KPiBbICAgIDku
MDI4NDA2XSBpbXgtZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBmYWlsZWQgdG8gYmluZCBkaXNwMCAo
b3BzIGlteF9wZF9vcHMgW3BhcmFsbGVsX2Rpc3BsYXldKTogLTUxNw0KPiBbICAgIDkuMDM3ODcz
XSBpbXgtZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBtYXN0ZXIgYmluZCBmYWlsZWQ6IC01MTcNCj4N
Cj4gKEkgY2FuIHJlcHJvZHVjZSB0aG9zZSBieSB1bi0vcmVsb2FkaW5nIHRoZSBwYXJhbGxlbC1k
aXNwbGF5LmtvIA0KPiBtb2R1bGUuKQ0KPg0KPiBPbiBhIHdvcmtpbmcgNC4xOS4xMjggdGhlIGNv
cnJlc3BvbmRpbmcgZW50cmllcyBhcmU6DQo+IFsgICAgOC44NzkwNTBdIGlteC1kcm0gZGlzcGxh
eS1zdWJzeXN0ZW06IGJvdW5kIGlteC1pcHV2My1jcnRjLjMgKG9wcyBpbXhfZHJtX2V4aXQgW2lt
eGRybV0pDQo+IFsgICAgOC44ODczNjFdIGlteC1kcm0gZGlzcGxheS1zdWJzeXN0ZW06IGJvdW5k
IGRpc3AwIChvcHMgaW14X3BkX29wcyBbcGFyYWxsZWxfZGlzcGxheV0pDQo+IFsgICAgOS4xMzEy
ODhdIGlteC1kcm0gZGlzcGxheS1zdWJzeXN0ZW06IGZiMDogRFJNIGVtdWxhdGVkIGZyYW1lIGJ1
ZmZlciBkZXZpY2UNCj4gWyAgICA5LjEzOTYxOF0gW2RybV0gSW5pdGlhbGl6ZWQgaW14LWRybSAx
LjAuMCAyMDEyMDUwNyBmb3IgZGlzcGxheS1zdWJzeXN0ZW0gb24gbWlub3IgMg0KPg0KPiBWaWEg
Z2l0IGJpc2VjdGlvbiBJIGZvdW5kIHRoZSBsYXN0ICJnb29kIiBjb21taXQgYXQgWzA0NDE3NWEw
NjcwNmQ1MTZhYTQyODc0YmI0NGRiYmZjM2M0ZDIwZWJdLCBhbmQgdGhlIG5leHQgImJhZCIgY29t
bWl0IGF0IFsyMjhjZDJkYmEyN2NlZTk5NTZjMWFmOTdlNjQ0NWJlMDU2ODgxZTQxXS4NCg0KVGhl
cmUncyBvdmVyIDhrIGNvbW1pdHMgaW4gdGhhdCByYW5nZSwgd2hhdCdzIHRoZSByZWFzb24gZ2l0
IGJpc2VjdCBkaWRuJ3QgY29udGludWUgdG8gZnVydGhlciBkcmlsbCBkb3duIGludG8gd2hhdCB0
aGUgYmFkIGNvbW1pdCBpcz8NClRoaXMgcmFuZ2UgY29udGFpbnMgYW4gZW50aXJlIGRybSBtZXJn
ZSB3aW5kb3cgcHVsbCByZXF1ZXN0LCBzbyBwcmV0dHkgaGFyZCB0byBndWVzcyB3aGF0IGJyb2tl
Lg0KDQo+IEkgdGVzdGVkIGJvdGggdGhlc2UgdmVyc2lvbnMgd2l0aCBleGFjdGx5IHRoZSBzYW1l
IC5kdGIgYW5kIG91ciAuY29uZmlnIChhZGFwdGVkIHZpYSAibWFrZSBvbGRkZWZjb25maWciIGZv
ciBib3RoIHZlcnNpb25zKSBmcm9tIHRoZSA0LjE5LjEyOCBrZXJuZWwuDQo+DQo+IERvIHlvdSBo
YXZlIGFueSBzdWdnZXN0aW9ucyB3aGF0IHdlIGNhbiBkbyB0byB0cnkgYW5kIGZpeCB0aGlzIHBy
b2JsZW0/DQoNCkZ1cnRoZXIgcmVkdWNpbmcgdGhlIHJhbmdlIG9mIHN1c3BlY3QgY29tbWl0cyBz
aG91bGQgaGVscC4gTWF5YmUgaW14IG1haW50YWluZXJzIGhhdmUgc29tZSBndWVzcywgYnV0IEkg
ZGVmaW5pdGVseSBkb24ndCBoYXZlIG11Y2ggaWRlYSB3aGF0J3MgbWlzc2luZyBhbW9uZyB0aGF0
IGJpZyBhIHBpbGUgb2YgY29tbWl0cy4NCg0KVGhhbmtzLCBEYW5pZWwNCg0KPg0KPiBLaW5kIHJl
Z2FyZHMsDQo+ICBTdGVmYW4gQmlya2hvbHoNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQoNCg0KDQotLQ0KRGFuaWVsIFZldHRlcg0KU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uDQpodHRwOi8vYmxvZy5mZndsbC5jaA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
