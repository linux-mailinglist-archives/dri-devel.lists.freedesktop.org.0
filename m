Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F31A4D95BD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 08:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0110E412;
	Tue, 15 Mar 2022 07:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003ED10E412
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 07:56:31 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-216-xYBwVrWXPkuS3LcJVzhFpQ-1; Tue, 15 Mar 2022 07:56:28 +0000
X-MC-Unique: xYBwVrWXPkuS3LcJVzhFpQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Tue, 15 Mar 2022 07:56:27 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Tue, 15 Mar 2022 07:56:26 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'T.J. Mercier'" <tjmercier@google.com>, Todd Kjos <tkjos@google.com>
Subject: RE: [RFC v3 7/8] binder: use __kernel_pid_t and __kernel_uid_t for
 userspace
Thread-Topic: [RFC v3 7/8] binder: use __kernel_pid_t and __kernel_uid_t for
 userspace
Thread-Index: AQHYN/2hnJZ5hPm3HkKIFJirFaEIKazAEl4g
Date: Tue, 15 Mar 2022 07:56:26 +0000
Message-ID: <a365a5f6c7864a879b133b99d1f43fb2@AcuMS.aculab.com>
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-8-tjmercier@google.com>
 <CAHRSSEy5_h9LJB4q5_OJA7fSq=ROo68UaK+hdPz-Vj-wac1Qhg@mail.gmail.com>
 <CABdmKX1G0Rwmz7=BP1ER+TmtrnkGiE0nROsPTHKxnj=6bHhY3Q@mail.gmail.com>
In-Reply-To: <CABdmKX1G0Rwmz7=BP1ER+TmtrnkGiE0nROsPTHKxnj=6bHhY3Q@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Cc: Zefan Li <lizefan.x@bytedance.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Kenny.Ho@amd.com" <Kenny.Ho@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Todd Kjos <tkjos@android.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 =?utf-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVC5KLiBNZXJjaWVyDQo+IFNlbnQ6IDE0IE1hcmNoIDIwMjIgMjM6NDUNCj4gDQo+IE9u
IFRodSwgTWFyIDEwLCAyMDIyIGF0IDExOjMzIEFNIFRvZGQgS2pvcyA8dGtqb3NAZ29vZ2xlLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBXZWQsIE1hciA5LCAyMDIyIGF0IDg6NTIgQU0gVC5KLiBN
ZXJjaWVyIDx0am1lcmNpZXJAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gVGhlIGtl
cm5lbCBpbnRlcmZhY2Ugc2hvdWxkIHVzZSB0eXBlcyB0aGF0IHRoZSBrZXJuZWwgZGVmaW5lcyBp
bnN0ZWFkIG9mDQo+ID4gPiBwaWRfdCBhbmQgdWlkX3QsIHdob3NlIGRlZmluaXRvbiBpcyBvd25l
ZCBieSBsaWJjLiBUaGlzIGZpeGVzIHRoZSBoZWFkZXINCj4gPiA+IHNvIHRoYXQgaXQgY2FuIGJl
IGluY2x1ZGVkIHdpdGhvdXQgZmlyc3QgaW5jbHVkaW5nIHN5cy90eXBlcy5oLg0KPiA+ID4NCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFQuSi4gTWVyY2llciA8dGptZXJjaWVyQGdvb2dsZS5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvYW5kcm9pZC9iaW5kZXIuaCB8IDQg
KystLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9hbmRyb2lk
L2JpbmRlci5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2FuZHJvaWQvYmluZGVyLmgNCj4gPiA+IGlu
ZGV4IDE2OWZkNTA2OWExYS4uYWEyODQ1NGRiY2EzIDEwMDY0NA0KPiA+ID4gLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L2FuZHJvaWQvYmluZGVyLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9s
aW51eC9hbmRyb2lkL2JpbmRlci5oDQo+ID4gPiBAQCAtMjg5LDggKzI4OSw4IEBAIHN0cnVjdCBi
aW5kZXJfdHJhbnNhY3Rpb25fZGF0YSB7DQo+ID4gPg0KPiA+ID4gICAgICAgICAvKiBHZW5lcmFs
IGluZm9ybWF0aW9uIGFib3V0IHRoZSB0cmFuc2FjdGlvbi4gKi8NCj4gPiA+ICAgICAgICAgX191
MzIgICAgICAgICAgIGZsYWdzOw0KPiA+ID4gLSAgICAgICBwaWRfdCAgICAgICAgICAgc2VuZGVy
X3BpZDsNCj4gPiA+IC0gICAgICAgdWlkX3QgICAgICAgICAgIHNlbmRlcl9ldWlkOw0KPiA+ID4g
KyAgICAgICBfX2tlcm5lbF9waWRfdCAgc2VuZGVyX3BpZDsNCj4gPiA+ICsgICAgICAgX19rZXJu
ZWxfdWlkX3QgIHNlbmRlcl9ldWlkOw0KPiA+DQo+ID4gQXJlIHdlIGd1YXJhbnRlZWQgdGhhdCB0
aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUgVUFQSSBhdCBhbGw/IFVzZXJzcGFjZQ0KPiA+IGNvZGUg
dXNpbmcgdGhpcyBkZWZpbml0aW9uIHdpbGwgaGF2ZSB0byBydW4gd2l0aCBrZXJuZWxzIHVzaW5n
IHRoZSBvbGQNCj4gPiBkZWZpbml0aW9uIGFuZCB2aXNhLXZlcnNhLg0KPiANCj4gQSBzdGFuZGFy
ZHMgY29tcGxpYW50IHVzZXJzcGFjZSBzaG91bGQgYmUgZXhwZWN0aW5nIGEgc2lnbmVkIGludGVn
ZXINCj4gdHlwZSBoZXJlLiBTbyB0aGUgb25seSB3YXkgSSBjYW4gdGhpbmsgdXNlcnNwYWNlIHdv
dWxkIGJlIGFmZmVjdGVkIGlzDQo+IGlmOg0KPiAxKSBwaWRfdCBpcyBhIGxvbmcgQU5EDQo+IDIp
IHNpemVvZihsb25nKSA+IHNpemVvZihpbnQpIEFORA0KPiAzKSBDb25zdW1lcnMgb2YgdGhlIHBp
ZF90IGRlZmluaXRpb24gYWN0dWFsbHkgYXR0ZW1wdCB0byBtdXRhdGUgdGhlDQo+IHJlc3VsdCB0
byBtYWtlIHVzZSBvZiBleHRyYSBiaXRzIGluIHRoZSB2YXJpYWJsZSAod2hpY2ggYXJlIG5vdCB0
aGVyZSkNCg0KT3IgdGhlIHVzZXJzcGFjZSBoZWFkZXJzIGhhdmUgYSAxNmJpdCBwaWRfdC4NCg0K
SSBjYW4ndCBoZWxwIGZlZWxpbmcgdGhhdCB1YXBpIGhlYWRlcnMgc2hvdWxkIG9ubHkgdXNlIGV4
cGxpY2l0DQpmaXhlZCBzaXplZCB0eXBlcy4NClRoZXJlIGlzIG5vIHBvaW50IGluZGlyZWN0aW5n
IHRoZSB0eXBlIG5hbWVzIC0gdGhlIHNpemVzIHN0aWxsDQpjYW4ndCBiZSBjaGFuZ2VzLg0KDQoJ
RGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1v
dW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEz
OTczODYgKFdhbGVzKQ0K

