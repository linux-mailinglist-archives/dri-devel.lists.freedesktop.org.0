Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E683FA53
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 23:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990AB10EB5D;
	Sun, 28 Jan 2024 22:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE37E10FB43
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 22:22:28 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-65-vnl-NSxrMcqYOJXJo4DcEw-1; Sun, 28 Jan 2024 22:22:18 +0000
X-MC-Unique: vnl-NSxrMcqYOJXJo4DcEw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 22:21:54 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 22:21:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
Subject: RE: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
Thread-Topic: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
Thread-Index: AdpSITDgD70hEVnBTjm/gYoTnRBnpgAA0+uAAAR1AXA=
Date: Sun, 28 Jan 2024 22:21:53 +0000
Message-ID: <a756a7712dfe4d03a142520d4c46e7a3@AcuMS.aculab.com>
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
 <CAHk-=whxYjLFhjov39N67ePb3qmCmxrhbVXEtydeadfao53P+A@mail.gmail.com>
In-Reply-To: <CAHk-=whxYjLFhjov39N67ePb3qmCmxrhbVXEtydeadfao53P+A@mail.gmail.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David
 S . Miller" <davem@davemloft.net>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMjggSmFudWFyeSAyMDI0IDE5OjU5DQo+IA0K
PiBPbiBTdW4sIDI4IEphbiAyMDI0IGF0IDExOjM2LCBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdo
dEBhY3VsYWIuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhvd2V2ZXIgaXQgZ2VuZXJhdGVzOg0KPiA+
IGVycm9yOiBjb21wYXJpc29uIG9mIGNvbnN0YW50IMOi4oKsy5www6LigqzihKIgd2l0aCBib29s
ZWFuIGV4cHJlc3Npb24gaXMgYWx3YXlzIHRydWUgWy1XZXJyb3I9Ym9vbC1jb21wYXJlXQ0KPiA+
IGluc2lkZSB0aGUgc2lnbmVkbmVzcyBjaGVjayB0aGF0IG1heCgpIGRvZXMgdW5sZXNzIGEgJysg
MCcgaXMgYWRkZWQuDQo+IA0KPiBQbGVhc2UgZml4IHlvdXIgbG9jYWxlLiBZb3UgaGF2ZSByYW5k
b20gZ2FyYmFnZSBjaGFyYWN0ZXJzIHRoZXJlLA0KPiBwcmVzdW1hYmx5IGJlY2F1c2UgeW91IGhh
dmUgc29tZSBpbmNvcnJlY3QgbG9jYWxlIHNldHRpbmcgc29tZXdoZXJlIGluDQo+IHlvdXIgdG9v
bGNoYWluLg0KDQpIbW1tbSBibGFtZSBnY2MgOi0pDQpUaGUgZXJyb3IgbWVzc2FnZSBkaXNwbGF5
cyBhcyAnMCcgYnV0IGlzIGUyOjgwOjk4IDMwIGUyOjgwOjk5DQpJIEhBVEUgVVRGLTgsIGl0IHdv
dWxkbid0IGJlIGFzIGJhZCBpZiBpdCB3ZXJlIGEgYmlqZWN0aW9uLg0KDQpMZXRzIHNlZSBpZiBh
ZGRpbmcgJ0xBTkc9QycgaW4gdGhlIHNoZWxsIHNjcmlwdCBJIHVzZSB0bw0KZG8ga2VybmVsIGJ1
aWxkcyBpcyBlbm91Z2guDQoNCkkgYWxzbyBtYW5hZ2VkIHRvIHNlbmQgcGFydHMgMSB0byA2IHdp
dGhvdXQgZGVsZXRpbmcgdGhlIFJFOg0KKEkgaGF2ZSB0byBjdXQmcGFzdGUgZnJvbSB3b3JkcGFk
IGludG8gYSAncmVwbHktYWxsJyBvZiB0aGUgZmlyc3QNCm1lc3NhZ2UgSSBzZW5kLiBXb3JrIHVz
ZXMgbWltZWNhc3QgYW5kIGl0IGhhcyBzdGFydGVkIGJvdW5jaW5nDQpteSBjb3B5IG9mIGV2ZXJ5
IG1lc3NhZ2UgSSBzZW5kIHRvIHRoZSBsaXN0cy4pDQoNCk1heWJlIEkgc2hvdWxkIHN0YXJ0IHVz
aW5nIHRlbG5ldCB0byBzZW5kIHJhdyBTTVRQIDotKQ0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJl
ZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXlu
ZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

