Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EC1A0569F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C961010E824;
	Wed,  8 Jan 2025 09:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="LIoVaYvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 84917 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jan 2025 09:23:54 UTC
Received: from ironport.ite.com.tw
 (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAD810E824
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YbpVXqdiTycM8rq57PjnPQtHyP+XiwRlm3HVnfpMVdM=;
 b=LIoVaYvEvrAfkcbC6bvMbfvy0sJ+mSHDCOq+bDwPGnZADRClCPDuDukS
 TdPvi8i4oQSrABBUA0GnvExY8W0AxU4TfSGBQ6KzOjKUmqVF+P8tFXkH0
 mm5YNhI9RLBgy1vZpmIrHA4A6BmuAYs9ML1NS9/UQ5o65lvpWSK6hwLT+
 sQlJV96ac4aRApfSV77ZH0zbNsU/l5cIoUjy2VyOqdCexD+cEhzv+dc7Q
 oT5z0bc8g/2WOIl59zzVqWXB7GsncnE7CaUXiafLbNOd8V0+W3Z9J0ogn
 g8m3MoRr3eYjIWlf2Nkpf/cnH/Y+kGaNngmtJoCgd4fQjDviE8g88409J g==;
X-CSE-ConnectionGUID: hyGfrg8RRkSvrdd2ut7/cA==
X-CSE-MsgGUID: gE+yiuLZSZSIzLk2L2qxtQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 08 Jan 2025 17:23:52 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 5089No9k001938;
 Wed, 8 Jan 2025 17:23:50 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 8 Jan 2025 17:23:50 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Wed, 8 Jan 2025 17:23:49 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: RE: [bug report] drm/bridge: it6505: fix HDCP CTS compare V matching
Thread-Topic: [bug report] drm/bridge: it6505: fix HDCP CTS compare V matching
Thread-Index: AQHbYa2esjieHEX6kk2BjP9dbu/W3bMMmOsQ
Date: Wed, 8 Jan 2025 09:23:49 +0000
Message-ID: <ba425ad51b584812aabdb55d7d472c59@ite.com.tw>
References: <b1cc3aab-d5c5-4e61-b270-24c2b28df217@stanley.mountain>
In-Reply-To: <b1cc3aab-d5c5-4e61-b270-24c2b28df217@stanley.mountain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: D83B6ABFD0C08FC97E80CB3F4F128329F84F1FDAE6EAD6E8304C86A8489B0FAD2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 5089No9k001938
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuIENhcnBlbnRlciwNCj4NCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4gDQo+U2VudDogV2VkbmVz
ZGF5LCBKYW51YXJ5IDgsIDIwMjUgNToxNCBQTQ0KPlRvOiBIZXJtZXMgV3UgKKdkqM6nuykgPEhl
cm1lcy5XdUBpdGUuY29tLnR3Pg0KPkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+U3ViamVjdDogW2J1ZyByZXBvcnRdIGRybS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQ1RT
IGNvbXBhcmUgViBtYXRjaGluZw0KPg0KPkhlbGxvIEhlcm1lcyBXdSwNCj4NCj5Db21taXQgMDk4
OWMwMmM3YTVjICgiZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERDUCBDVFMgY29tcGFyZSBWDQo+
bWF0Y2hpbmciKSBmcm9tIERlYyAzMCwgMjAyNCAobGludXgtbmV4dCksIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+DQo+CWRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jOjIyNTMgaXQ2NTA1X2hkY3BfcGFydDJfa3N2bGlzdF9j
aGVjaygpDQo+CXdhcm46IGlnbm9yaW5nIHVucmVhY2hhYmxlIGNvZGUuDQo+DQo+ZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMNCj4gICAgMjIzMCBzdGF0aWMgYm9vbCBpdDY1MDVf
aGRjcF9wYXJ0Ml9rc3ZsaXN0X2NoZWNrKHN0cnVjdCBpdDY1MDUgKml0NjUwNSkNCj4gICAgMjIz
MSB7DQo+ICAgIDIyMzIgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBpdDY1MDUtPmRldjsN
Cj4gICAgMjIzMyAgICAgICAgIHU4IGF2WzVdWzRdLCBidls1XVs0XTsNCj4gICAgMjIzNCAgICAg
ICAgIGludCBpLCBlcnIsIHJldHJ5Ow0KPiAgICAyMjM1IA0KPiAgICAyMjM2ICAgICAgICAgaSA9
IGl0NjUwNV9zZXR1cF9zaGExX2lucHV0KGl0NjUwNSwgaXQ2NTA1LT5zaGExX2lucHV0KTsNCj4g
ICAgMjIzNyAgICAgICAgIGlmIChpIDw9IDApIHsNCj4gICAgMjIzOCAgICAgICAgICAgICAgICAg
ZGV2X2VycihkZXYsICJTSEEtMSBJbnB1dCBsZW5ndGggZXJyb3IgJWQiLCBpKTsNCj4gICAgMjIz
OSAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiAgICAyMjQwICAgICAgICAgfQ0KPiAg
ICAyMjQxIA0KPiAgICAyMjQyICAgICAgICAgaXQ2NTA1X3NoYTFfZGlnZXN0KGl0NjUwNSwgaXQ2
NTA1LT5zaGExX2lucHV0LCBpLCAodTggKilhdik7DQo+ICAgIDIyNDMgICAgICAgICAvKjFCLTA1
IFYnIG11c3QgcmV0cnkgMyB0aW1lcyAqLw0KPiAgICAyMjQ0ICAgICAgICAgZm9yIChyZXRyeSA9
IDA7IHJldHJ5IDwgMzsgcmV0cnkrKykgew0KPiAgICAyMjQ1ICAgICAgICAgICAgICAgICBlcnIg
PSBpdDY1MDVfZ2V0X2RwY2QoaXQ2NTA1LCBEUF9BVVhfSERDUF9WX1BSSU1FKDApLCAodTggKili
diwNCj4gICAgMjI0NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVv
ZihidikpOw0KPiAgICAyMjQ3IA0KPiAgICAyMjQ4ICAgICAgICAgICAgICAgICBpZiAoZXJyIDwg
MCkgew0KPiAgICAyMjQ5ICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiUmVh
ZCBWJyB2YWx1ZSBGYWlsICVkIiwgcmV0cnkpOw0KPiAgICAyMjUwICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOw0KPiAgICAyMjUxICAgICAgICAgICAgICAgICB9DQo+ICAgIDIyNTIg
DQo+LS0+IDIyNTMgICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCA1OyBpKyspIHsNCj4N
Cj5UaGlzIGxvb2tzIGxpa2UgYSBsb29wIGZyb20gMC00Lg0KPg0KPiAgICAyMjU0ICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChidltpXVszXSAhPSBhdltpXVswXSB8fCBidltpXVsyXSAhPSBh
dltpXVsxXSB8fA0KPiAgICAyMjU1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdltpXVsx
XSAhPSBhdltpXVsyXSB8fCBidltpXVswXSAhPSBhdltpXVszXSkNCj4gICAgMjI1NiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAyMjU3IA0KPiAgICAyMjU4ICAg
ICAgICAgICAgICAgICAgICAgICAgIERSTV9ERVZfREVCVUdfRFJJVkVSKGRldiwgIlYnIGFsbCBt
YXRjaCEhICVkLCAlZCIsIHJldHJ5LCBpKTsNCj4gICAgMjI1OSAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsNCj4NCj5CdXQgaXQgaXMgYSAibG9vcCIgZnJvbSAwLTAuDQoNCkkg
aGF2ZSBmaXggdGhpcyBpbiBmb2xsb3dpbmcsDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MDEwOC1maXgtaGRjcC12LWNvbXAtdjEtMS05NDA0ODExODI1Y2RAaXRlLmNvbS50dy8N
Cg0KVGhhbmtzIGEgbG90Lg0KDQo+ICAgIDIyNjAgICAgICAgICAgICAgICAgIH0NCj4gICAgMjI2
MSAgICAgICAgIH0NCj4gICAgMjI2MiANCj4gICAgMjI2MyAgICAgICAgIERSTV9ERVZfREVCVUdf
RFJJVkVSKGRldiwgIlYnIE5PVCBtYXRjaCEhICVkIiwgcmV0cnkpOw0KPiAgICAyMjY0ICAgICAg
ICAgcmV0dXJuIGZhbHNlOw0KPiAgICAyMjY1IH0NCj4NCj5yZWdhcmRzLA0KPmRhbiBjYXJwZW50
ZXINCj4NCg0KQlIsDQpIZXJtZXMNCg0K
