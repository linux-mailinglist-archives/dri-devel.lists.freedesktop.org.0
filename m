Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD598840157
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EC310F6AC;
	Mon, 29 Jan 2024 09:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4BF1127A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:23:09 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-31-yT1IZiFMOyGriZohOn-eyA-1; Mon, 29 Jan 2024 09:23:07 +0000
X-MC-Unique: yT1IZiFMOyGriZohOn-eyA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 29 Jan
 2024 09:22:40 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 29 Jan 2024 09:22:40 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jani Nikula' <jani.nikula@linux.intel.com>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
Thread-Topic: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
Thread-Index: AdpSITDgD70hEVnBTjm/gYoTnRBnpgAcWocAAAB9+7A=
Date: Mon, 29 Jan 2024 09:22:40 +0000
Message-ID: <963d1126612347dd8c398a9449170e16@AcuMS.aculab.com>
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
 <87sf2gjyn9.fsf@intel.com>
In-Reply-To: <87sf2gjyn9.fsf@intel.com>
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
Cc: 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 'Dan Carpenter' <dan.carpenter@linaro.org>, 'Andrew
 Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 "'David S . Miller'" <davem@davemloft.net>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFuaSBOaWt1bGENCj4gU2VudDogMjkgSmFudWFyeSAyMDI0IDA5OjA4DQo+IA0KPiBP
biBTdW4sIDI4IEphbiAyMDI0LCBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdodEBBQ1VMQUIuQ09N
PiB3cm90ZToNCj4gPiBibGtfc3RhY2tfbGltaXRzKCkgY29udGFpbnM6DQo+ID4gCXQtPnpvbmVk
ID0gbWF4KHQtPnpvbmVkLCBiLT56b25lZCk7DQo+ID4gVGhlc2UgYXJlIGJvb2wsIHNvIGl0IGlz
IGp1c3QgYSBiaXR3aXNlIG9yLg0KPiANCj4gU2hvdWxkIGJlIGEgbG9naWNhbCBvciwgcmVhbGx5
LiBBbmQgfHwgaW4gY29kZS4NCg0KTm90IHJlYWxseSwgYml0d2lzZSBpcyBmaW5lIGZvciBib29s
IChlc3BlY2lhbGx5IGZvciAnb3InKQ0KYW5kIGdlbmVyYXRlcyBiZXR0ZXIgY29kZS4NCg0KCURh
dmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3Vu
dCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3
Mzg2IChXYWxlcykNCg==

