Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0B70D7DA
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154210E097;
	Tue, 23 May 2023 08:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8110E097
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 08:50:50 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-194-4-IWd40DMtWa4Ek3F1Cvjg-1; Tue, 23 May 2023 09:50:32 +0100
X-MC-Unique: 4-IWd40DMtWa4Ek3F1Cvjg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 23 May
 2023 09:50:30 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 23 May 2023 09:50:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'15330273260@189.cn'" <15330273260@189.cn>, Jani Nikula
 <jani.nikula@linux.intel.com>, Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi
 <liyi@loongson.cn>
Subject: RE: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Thread-Topic: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Thread-Index: AQHZiBwkXHI4wBkIl0yfSK4Xtptrs69eSnTggAkC21SAAEjo0A==
Date: Tue, 23 May 2023 08:50:30 +0000
Message-ID: <e5effc4568034489acf2f4d4dad6eba9@AcuMS.aculab.com>
References: <20230516173026.2990705-1-15330273260@189.cn>
 <f6bd362145124f34a1af800dd330f8e9@AcuMS.aculab.com>
 <b23c41b1-e177-c81d-5327-fce5511cb97d@189.cn> <871qj8ob7z.fsf@intel.com>
 <4c9c0897-5e3a-1469-3d87-ff7723ac160c@189.cn>
In-Reply-To: <4c9c0897-5e3a-1469-3d87-ff7723ac160c@189.cn>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogMTUzMzAyNzMyNjBAMTg5LmNuIDwxNTMzMDI3MzI2MEAxODkuY24+DQo+IFNlbnQ6IDIz
IE1heSAyMDIzIDA1OjI3DQo+IA0KPiBPbiAyMDIzLzUvMjIgMTk6MjksIEphbmkgTmlrdWxhIHdy
b3RlOg0KPiA+IEluIGdlbmVyYWwsIGRvIG5vdCB1c2UgdW5zaWduZWQgdHlwZXMgaW4gYXJpdGht
ZXRoaWMgdG8gYXZvaWQgbmVnYXRpdmUNCj4gPiB2YWx1ZXMsIGJlY2F1c2UgbW9zdCBwZW9wbGUg
d2lsbCBiZSB0cmlwcGVkIG92ZXIgYnkgaW50ZWdlciBwcm9tb3Rpb24NCj4gPiBydWxlcywgYW5k
IHlvdSdsbCBnZXQgbmVnYXRpdmUgdmFsdWVzIGFueXdheS4NCj4gDQo+IA0KPiBIZXJlIEknbSBz
dXJlIGFib3V0IHRoaXMsDQo+IA0KPiBidXQgdGhlcmUgYXJlIHBsZW50eSB1bnNpZ25lZCB0eXBl
cyBhcml0aG1ldGljIGluIHRoZSBrZXJuZWwuDQoNClRoZSByZWFsIHByb2JsZW0gaXMgKGF0dGVt
cHRlZCkgYXJpdGhtZXRpYyBvbiB0eXBlcyBzbWFsbGVyIHRoYW4gaW50Lg0KUmVnYXJkbGVzcyBv
ZiB3aGV0aGVyIHRoZXkgYXJlIHNpZ25lZCBvciB1bnNpZ25lZC4NCg0KCURhdmlkDQoNCi0NClJl
Z2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0
b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykN
Cg==

