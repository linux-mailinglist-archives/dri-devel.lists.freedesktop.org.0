Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C310C508
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABFC6E6C3;
	Thu, 28 Nov 2019 08:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51826E2CF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 14:46:47 +0000 (UTC)
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 4F99B67A908;
 Wed, 27 Nov 2019 15:46:44 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 27 Nov
 2019 15:46:43 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 27 Nov 2019 15:46:43 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
Subject: Re: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Topic: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Index: AQHVpTF8J31QIDdxa0aA18ReaLae0g==
Date: Wed, 27 Nov 2019 14:46:43 +0000
Message-ID: <fc1b73b2-def6-2e54-defc-30fe73b8d82e@kontron.de>
References: <20190809141611.9927-1-bogdan.togorean@analog.com>
 <20190809141611.9927-3-bogdan.togorean@analog.com>
 <20190809152510.GA23265@ravnborg.org>
 <c99cfbd3dc45bb02618e7653c33022f3553e1cce.camel@analog.com>
 <20190819104616.GA15890@ravnborg.org>
 <20190820085329.GC11147@phenom.ffwll.local>
 <ccba9a66c6d5db8a295353b16084c6a1199f31dc.camel@analog.com>
 <4c60f287-eb6b-d5b3-8d40-89172755887d@kontron.de>
 <d8470738b044d6559aa8e7b07f8d50ce6791f980.camel@analog.com>
In-Reply-To: <d8470738b044d6559aa8e7b07f8d50ce6791f980.camel@analog.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <1FBA5847889E314386D0F04F2535C456@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 4F99B67A908.A172D
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: a.hajda@samsung.com, airlied@linux.ie,
 allison@lohutok.net, bogdan.togorean@analog.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 matt.redfearn@thinci.com, robh+dt@kernel.org, sam@ravnborg.org,
 tglx@linutronix.de
X-Spam-Status: No
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:48 +0000
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMTEuMTkgMTU6MjIsIFRvZ29yZWFuLCBCb2dkYW4gd3JvdGU6DQo+IEhpIEZyaWVkZXIs
DQo+IA0KPiBJJ20gZ2xhZCB0byBmaW5kIHRoZXJlIGFyZSBvdGhlciBwZXJzb25zIGludGVyZXN0
ZWQgaW4gdGhpcyBkcml2ZXIgYW5kDQo+IGVzcGVjaWFsbHkgc3VwcG9ydCBmb3IgQURWNzUzNS4g
VW5mb3J0dW5hdGVseSBJIGhhZCB0byBwdXQgb24gaG9sZCB0aGUNCj4gZGV2ZWxvcG1lbnQgZHVl
IHRvIG90aGVyIGFjdGl2aXRpZXMgYnV0IEknbGwgc2VuZCBWMyB0b21vcnJvdy4NCg0KR3JlYXQg
dG8gaGVhciB0aGF0LiBUaGFua3MgZm9yIHlvdXIgZWZmb3J0LiBJIHdpbGwgdHJ5IHRvIHRlc3Qg
eW91ciB2MyANCndoZW4gSSBoYXZlIHJlY2VpdmVkIHRoZSBuZXcgaGFyZHdhcmUgYW5kIGdvdCBp
dCB1cCBhbmQgcnVubmluZy4NCg0KPiANCj4gSSBhbHNvIHN0YXJ0ZWQgd29yayBvbiBIRENQIHN1
cHBvcnQgZm9yIHRoaXMgZHJpdmVyIGFuZCBob3BlIHRvIHNlbmQNCj4gc29vbiBhIHBhdGNoIGZv
ciB0aGF0Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBCb2dkYW4NCj4gDQo+IE9uIFdlZCwgMjAx
OS0xMS0yNyBhdCAxMTo1MiArMDAwMCwgU2NocmVtcGYgRnJpZWRlciB3cm90ZToNCj4+IFtFeHRl
cm5hbF0NCj4+DQo+PiBIaSBCb2dkYW4sDQo+Pg0KPj4gT24gMjEuMDguMTkgMDc6MzQsIFRvZ29y
ZWFuLCBCb2dkYW4gd3JvdGU6DQo+Pj4gT24gVHVlLCAyMDE5LTA4LTIwIGF0IDEwOjUzICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+PiBbRXh0ZXJuYWxdDQo+Pj4+DQo+Pj4+IE9uIE1v
biwgQXVnIDE5LCAyMDE5IGF0IDEyOjQ2OjE2UE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToN
Cj4+Pj4+IEhpIEJvZ2Rhbi4NCj4+Pj4+DQo+Pj4+Pj4+PiAgICAJCWFkdjc1MzNfZGV0YWNoX2Rz
aShhZHY3NTExKTsNCj4+Pj4+Pj4+ICAgIAlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoYWR2NzUxMS0+
aTJjX2NlYyk7DQo+Pj4+Pj4+PiAgICAJaWYgKGFkdjc1MTEtPmNlY19jbGspDQo+Pj4+Pj4+PiBA
QCAtMTI2Niw4ICsxMjc4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkDQo+
Pj4+Pj4+PiBhZHY3NTExX2kyY19pZHNbXSA9IHsNCj4+Pj4+Pj4+ICAgIAl7ICJhZHY3NTExIiwg
QURWNzUxMSB9LA0KPj4+Pj4+Pj4gICAgCXsgImFkdjc1MTF3IiwgQURWNzUxMSB9LA0KPj4+Pj4+
Pj4gICAgCXsgImFkdjc1MTMiLCBBRFY3NTExIH0sDQo+Pj4+Pj4+PiAtI2lmZGVmIENPTkZJR19E
Uk1fSTJDX0FEVjc1MzMNCj4+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0RSTV9JMkNfQURWNzUzeA0K
Pj4+Pj4+Pj4gICAgCXsgImFkdjc1MzMiLCBBRFY3NTMzIH0sDQo+Pj4+Pj4+PiArCXsgImFkdjc1
MzUiLCBBRFY3NTM1IH0sDQo+Pj4+Pj4+PiAgICAjZW5kaWYNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhp
cyBpZmRlZiBtYXkgbm90IGJlIG5lZWRlZD8/DQo+Pj4+Pj4+IElmIHdlIGRpZCBub3QgZ2V0IHRo
aXMgdHlwZSB3ZSB3aWxsIG5vdCBsb29rIGl0IHVwLg0KPj4+Pj4+IEJ1dCBpZiB3ZSBoYXZlIGRl
ZmluZWQgaW4gRFQgYWR2NzUzMy81IGRldmljZSBidXQNCj4+Pj4+PiBDT05GSUdfRFJNX0kyQ19B
RFY3NTN4IG5vdCBzZWxlY3RlZCBwcm9iZSB3aWxsIGZhaWwgd2l0aA0KPj4+Pj4+IEVOT0RFVi4N
Cj4+Pj4+PiBUaGF0DQo+Pj4+Pj4gd291bGQgYmUgb2s/DQo+Pj4+Pg0KPj4+Pj4gV2hhdCBkbyB3
ZSBnYWluIGZyb20gdGhpcyBjb21wbGV4aXR5IGluIHRoZSBlbmQuDQo+Pj4+PiBXaHkgbm90IGxl
dCB0aGUgZHJpdmVyIGFsd2F5cyBzdXBwb3J0IGFsbCB2YXJpYW50cy4NCj4+Pj4+DQo+Pj4+PiBJ
ZiB0aGlzIHJlc3VsdCBpbiBhIHNpbXBsZXIgZHJpdmVyLCBhbmQgbGVzcyBjaG9pY2VzIGluIEtj
b25maWcNCj4+Pj4+IHRoZW4gaXQgaXMgYSB3aW4td2luLg0KPj4+Pg0KPj4+PiBZZWFoIGluIGdl
bmVyYWwgd2UgZG9uJ3QgS2NvbmZpZyB3aXRoaW4gZHJpdmVycyBpbiBkcm0gdG8gZGlzYWJsZQ0K
Pj4+PiBzcGVjaWZpYw0KPj4+PiBjb2RlLXBhdGhzLiBJdCdzIG5vdCB3b3J0aCB0aGUgcGFpbi4N
Cj4+ICAgPg0KPj4+IEFjaywNCj4+PiBUaGFuayB5b3UgZm9yIGNsYXJpZmljYXRpb24uIFdpbGwg
cmVtb3ZlIGluIFYzLg0KPj4NCj4+IEFyZSB5b3Ugc3RpbGwgd29ya2luZyBvbiB0aGlzPyBEbyB5
b3UgcGxhbiB0byBzZW5kIGEgdjM/DQo+PiBJIHdpbGwgc29vbiBsYXkgbXkgaGFuZHMgb24gYSBi
b2FyZCB3aXRoIHRoZSBBRFY3NTM1IGFuZCB3b3VsZCBsaWtlDQo+PiB0bw0KPj4gc2VlIHRoaXMg
bWVyZ2VkLg0KPj4gQWxzbyBmb3IgcGF0Y2ggMS8yLCBpdCBzZWVtcyB5b3UgYWxyZWFkeSBoYXZl
IGEgUi1iIGZvciB2MSBmcm9tDQo+PiBMYXVyZW50LA0KPj4gYnV0IHlvdSBkaWRuJ3QgY2Fycnkg
dGhlIHRhZyB0byB2Mi4NCj4+DQo+PiBUaGFua3MsDQo+PiBGcmllZGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
