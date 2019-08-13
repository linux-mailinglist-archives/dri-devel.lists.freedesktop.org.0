Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE728B546
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 12:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422096E0EB;
	Tue, 13 Aug 2019 10:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092070098.outbound.protection.outlook.com [40.92.70.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649396E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 10:19:05 +0000 (UTC)
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (10.152.20.52) by DB5EUR03HT081.eop-EUR03.prod.protection.outlook.com
 (10.152.21.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18; Tue, 13 Aug
 2019 10:18:58 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.20.57) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 10:18:58 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460%4]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 10:18:58 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
Thread-Topic: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
Thread-Index: AQHVUboa7A1pYK0KN0KnivRIR5caz6b40QaAgAAMi4A=
Date: Tue, 13 Aug 2019 10:18:57 +0000
Message-ID: <HE1PR06MB40116485045605E0B9E67B92ACD20@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
 <60547c6d-e8a1-0b2c-b8ae-acb2f4643be8@xs4all.nl>
In-Reply-To: <60547c6d-e8a1-0b2c-b8ae-acb2f4643be8@xs4all.nl>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0054.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::31) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:DBA9AD1BB0783CA976A1EC8B4D067D85AEB3965F102EEB96568F5E30E4F80B9E;
 UpperCasedChecksum:0DA820003AB7690E2662D6C462004CC18A5662A19C7A8D4B52D17360DDEABF96;
 SizeAsReceived:7779; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [uvjZ3hyHswyphtJUsy9V4KDwL5s3FhSG]
x-microsoft-original-message-id: <2c39a66b-b90b-72a9-6dd9-844149ae11eb@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:DB5EUR03HT081; 
x-ms-traffictypediagnostic: DB5EUR03HT081:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-message-info: ncpTPHBQq84euolWOOx2KAB4+zK8KKGOAbhBWUsS2OXg/LKnFoRiE7PKDLV4p57mG9c5nKw4SFgBQrGeHfGvsRih0Dm0LstDmAfyRbYiRtjfbIdD/85HFyDx54ibtMlI5nQyUmMZpVSPYkAJyKu4uHbbmpzTq7u5MkLTsgb/mTq8tOLEIwTjZtG5zO/oTzcj
Content-ID: <05E66ED1B41203478771BB06AD0230B9@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfefc67-b425-44de-23d2-08d71fd7a6da
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 10:18:57.9867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT081
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgYW4gYWx0ZXJuYXRpdmUgSSBoYXZlIGEgcGF0Y2ggWzFdIHRvIHN1Ym1pdCB0aGF0IG1vdmVz
IGNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZSgpIGNhbGwNCmZyb20gZHdfaGRtaV9p
cnEoKSB0byBkd19oZG1pX2Nvbm5lY3Rvcl9kZXRlY3QoKSBpbiBvcmRlciB0byBhZGRyZXNzIGFu
IGlzc3VlIHdpdGgNCnN0YWxlIENFQyBwaHlzIGFkZHIgYW5kIHN0YWxlIEVESUQvRUxEIGRhdGEg
YWZ0ZXIgVFYgb3IgQVZSIHVzZXMgYSAxMDBtcyBIUEQgcHVsc2UNCnRvIHNpZ25hbCBFRElEIGhh
cyBjaGFuZ2VkLCBmdWxsIHBhdGNoc2V0IGF0IFsyXS4NCg0KQXQgdGhlIG1vbWVudCBDRUMgcGh5
cyBhZGRyZXNzIGlzIGludmFsaWRhdGVkIGRpcmVjdGx5IGF0IEhQRCwgbGVhdmluZyB0aGUgYWRk
cmVzcyBhcyBpbnZhbGlkDQphZnRlciBhIDEwMG1zIEhQRCBwdWxzZSwgcGh5cyBhZGRyZXNzIG1h
eSBsYXRlciBiZSByZXN0b3JlZCB0byBhIHZhbGlkIHBoeXMgYWRkcmVzcyB3aGVuDQpnZXRfbW9k
ZXMoKSBpcyBjYWxsZWQgYnkgZHJtIGNvcmUuDQoNClNob3VsZCBJIHdhaXQgb24geW91ciBhbmQg
cmVsYXRlZCBwYXRjaGVzIHRvIGJlIG1lcmdlZCBiZWZvcmUgc3VibWl0dGluZyBteSBzZXJpZXM/
DQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vS3dpYm9vL2xpbnV4LXJvY2tjaGlwL2NvbW1pdC8y
ZjRmOTljODI5ODNlNzA5NTI2NjhjMjFmMWM1NmEwMjQxYmQ3NWYyDQpbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL0t3aWJvby9saW51eC1yb2NrY2hpcC9jb21wYXJlL25leHQtMjAxOTA4MTMuLi5uZXh0
LTIwMTkwODEzLWNlYy1lbGQNCg0KUmVnYXJkcywNCkpvbmFzDQoNCk9uIDIwMTktMDgtMTMgMTE6
MzQsIEhhbnMgVmVya3VpbCB3cm90ZToNCj4gQ0MgRGFyaXVzeiBhcyB3ZWxsLCBzaW5jZSB0aGlz
IGlzc3VlIHdhcyBkaXNjb3ZlcmVkIHdoZW4gdGVzdGluZyBoaXMNCj4gQ0VDIHBhdGNoZXMuDQo+
DQo+IFJlZ2FyZHMsDQo+DQo+IAlIYW5zDQo+DQo+IE9uIDgvMTMvMTkgMTE6MzIgQU0sIEhhbnMg
VmVya3VpbCB3cm90ZToNCj4+IFdoZW4gdGVzdGluZyBDRUMgb24gdGhlIEFNTC1TOTA1WC1DQyBi
b2FyZCBJIG5vdGljZWQgdGhhdCB0aGUgQ0VDIHBoeXNpY2FsDQo+PiBhZGRyZXNzIHdhcyBub3Qg
aW52YWxpZGF0ZWQgd2hlbiB0aGUgSERNSSBjYWJsZSB3YXMgdW5wbHVnZ2VkLiBTb21lIG1vcmUN
Cj4+IGRpZ2dpbmcgc2hvd2VkIHRoYXQgbWVzb24gdXNlcyBtZXNvbl9kd19oZG1pLmMgdG8gaGFu
ZGxlIHRoZSBIUEQuDQo+Pg0KPj4gQm90aCBkd19oZG1pX2lycSgpIGFuZCBkd19oZG1pX3RvcF90
aHJlYWRfaXJxKCkgKGluIG1lc29uX2R3X2hkbWkuYykgY2FsbA0KPj4gdGhlIGR3X2hkbWlfc2V0
dXBfcnhfc2Vuc2UoKSBmdW5jdGlvbi4gU28gbW92ZSB0aGUgY29kZSB0byBpbnZhbGlkYXRlIHRo
ZQ0KPj4gQ0VDIHBoeXNpY2FsIGFkZHJlc3MgdG8gdGhhdCBmdW5jdGlvbiwgc28gdGhhdCBpdCBp
cyBpbmRlcGVuZGVudCBvZiB3aGVyZQ0KPj4gdGhlIEhQRCBpbnRlcnJ1cHQgaGFwcGVucy4NCj4+
DQo+PiBUZXN0ZWQgd2l0aCBib3RoIGEgQU1MLVM5MDVYLUNDIGFuZCBhIEtoYWRhcyBWSU0yIGJv
YXJkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29A
eHM0YWxsLm5sPg0KPj4gLS0tDQo+PiBOb3RlOiBhbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBt
YWtlIGEgbmV3IGR3LWhkbWkgZnVuY3Rpb24gc3VjaCBhcw0KPj4gZHdfaGRtaV9jZWNfcGh5c19h
ZGRyX2ludmFsaWRhdGUoKSB0aGF0IGlzIGNhbGxlZCBmcm9tIG1lc29uX2R3X2hkbWkuYy4NCj4+
IEkgZGVjaWRlZCBub3QgdG8gZG8gdGhhdCBzaW5jZSB0aGlzIHBhdGNoIGlzIG1pbmltYWxseSBp
bnZhc2l2ZSwgYnV0DQo+PiB0aGF0IGNhbiBvYnZpb3VzbHkgYmUgY2hhbmdlZCBpZiB0aGF0IGFw
cHJvYWNoIGlzIHByZWZlcnJlZC4NCj4+IC0tLQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMNCj4+IGluZGV4IGM1YTg1NGFmNTRmOC4uZTg5OWIzMWUxNDMyIDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jDQo+PiBA
QCAtMjMyOSw2ICsyMzI5LDEzIEBAIHZvaWQgZHdfaGRtaV9zZXR1cF9yeF9zZW5zZShzdHJ1Y3Qg
ZHdfaGRtaSAqaGRtaSwgYm9vbCBocGQsIGJvb2wgcnhfc2Vuc2UpDQo+PiAgCQlkd19oZG1pX3Vw
ZGF0ZV9wb3dlcihoZG1pKTsNCj4+ICAJCWR3X2hkbWlfdXBkYXRlX3BoeV9tYXNrKGhkbWkpOw0K
Pj4gIAl9DQo+PiArCWlmICghaHBkICYmICFyeF9zZW5zZSkgew0KPj4gKwkJc3RydWN0IGNlY19u
b3RpZmllciAqbm90aWZpZXIgPSBSRUFEX09OQ0UoaGRtaS0+Y2VjX25vdGlmaWVyKTsNCj4+ICsN
Cj4+ICsJCWlmIChub3RpZmllcikNCj4+ICsJCQljZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFs
aWRhdGUobm90aWZpZXIpOw0KPj4gKwl9DQo+PiArDQo+PiAgCW11dGV4X3VubG9jaygmaGRtaS0+
bXV0ZXgpOw0KPj4gIH0NCj4+ICBFWFBPUlRfU1lNQk9MX0dQTChkd19oZG1pX3NldHVwX3J4X3Nl
bnNlKTsNCj4+IEBAIC0yMzY5LDE0ICsyMzc2LDYgQEAgc3RhdGljIGlycXJldHVybl90IGR3X2hk
bWlfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4+ICAJCWR3X2hkbWlfc2V0dXBfcnhfc2Vu
c2UoaGRtaSwNCj4+ICAJCQkJICAgICAgIHBoeV9zdGF0ICYgSERNSV9QSFlfSFBELA0KPj4gIAkJ
CQkgICAgICAgcGh5X3N0YXQgJiBIRE1JX1BIWV9SWF9TRU5TRSk7DQo+PiAtDQo+PiAtCQlpZiAo
KHBoeV9zdGF0ICYgKEhETUlfUEhZX1JYX1NFTlNFIHwgSERNSV9QSFlfSFBEKSkgPT0gMCkgew0K
Pj4gLQkJCXN0cnVjdCBjZWNfbm90aWZpZXIgKm5vdGlmaWVyOw0KPj4gLQ0KPj4gLQkJCW5vdGlm
aWVyID0gUkVBRF9PTkNFKGhkbWktPmNlY19ub3RpZmllcik7DQo+PiAtCQkJaWYgKG5vdGlmaWVy
KQ0KPj4gLQkJCQljZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFsaWRhdGUobm90aWZpZXIpOw0K
Pj4gLQkJfQ0KPj4gIAl9DQo+Pg0KPj4gIAlpZiAoaW50cl9zdGF0ICYgSERNSV9JSF9QSFlfU1RB
VDBfSFBEKSB7DQo+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
