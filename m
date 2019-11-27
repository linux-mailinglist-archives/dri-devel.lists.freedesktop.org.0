Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6910C503
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D3C6E614;
	Thu, 28 Nov 2019 08:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 578 seconds by postgrey-1.36 at gabe;
 Wed, 27 Nov 2019 12:02:03 UTC
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70566E532
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 12:02:03 +0000 (UTC)
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 6CF6F67A903;
 Wed, 27 Nov 2019 12:52:18 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 27 Nov
 2019 12:52:17 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 27 Nov 2019 12:52:17 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: Re: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Topic: Re: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Index: AQHVpRke93eDKSsyK0u0m5zFvr+lWQ==
Date: Wed, 27 Nov 2019 11:52:17 +0000
Message-ID: <4c60f287-eb6b-d5b3-8d40-89172755887d@kontron.de>
References: <20190809141611.9927-1-bogdan.togorean@analog.com>
 <20190809141611.9927-3-bogdan.togorean@analog.com>
 <20190809152510.GA23265@ravnborg.org>
 <c99cfbd3dc45bb02618e7653c33022f3553e1cce.camel@analog.com>
 <20190819104616.GA15890@ravnborg.org>
 <20190820085329.GC11147@phenom.ffwll.local>
 <ccba9a66c6d5db8a295353b16084c6a1199f31dc.camel@analog.com>
In-Reply-To: <ccba9a66c6d5db8a295353b16084c6a1199f31dc.camel@analog.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <65B7112A5BC3804EA5F6AAD9C877BF3B@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 6CF6F67A903.A1496
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
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:47 +0000
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
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9nZGFuLA0KDQpPbiAyMS4wOC4xOSAwNzozNCwgVG9nb3JlYW4sIEJvZ2RhbiB3cm90ZToN
Cj4gT24gVHVlLCAyMDE5LTA4LTIwIGF0IDEwOjUzICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Og0KPj4gW0V4dGVybmFsXQ0KPj4NCj4+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDEyOjQ2OjE2
UE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToNCj4+PiBIaSBCb2dkYW4uDQo+Pj4NCj4+Pj4+
PiAgIAkJYWR2NzUzM19kZXRhY2hfZHNpKGFkdjc1MTEpOw0KPj4+Pj4+ICAgCWkyY191bnJlZ2lz
dGVyX2RldmljZShhZHY3NTExLT5pMmNfY2VjKTsNCj4+Pj4+PiAgIAlpZiAoYWR2NzUxMS0+Y2Vj
X2NsaykNCj4+Pj4+PiBAQCAtMTI2Niw4ICsxMjc4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBp
MmNfZGV2aWNlX2lkDQo+Pj4+Pj4gYWR2NzUxMV9pMmNfaWRzW10gPSB7DQo+Pj4+Pj4gICAJeyAi
YWR2NzUxMSIsIEFEVjc1MTEgfSwNCj4+Pj4+PiAgIAl7ICJhZHY3NTExdyIsIEFEVjc1MTEgfSwN
Cj4+Pj4+PiAgIAl7ICJhZHY3NTEzIiwgQURWNzUxMSB9LA0KPj4+Pj4+IC0jaWZkZWYgQ09ORklH
X0RSTV9JMkNfQURWNzUzMw0KPj4+Pj4+ICsjaWZkZWYgQ09ORklHX0RSTV9JMkNfQURWNzUzeA0K
Pj4+Pj4+ICAgCXsgImFkdjc1MzMiLCBBRFY3NTMzIH0sDQo+Pj4+Pj4gKwl7ICJhZHY3NTM1Iiwg
QURWNzUzNSB9LA0KPj4+Pj4+ICAgI2VuZGlmDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBpZmRlZiBtYXkg
bm90IGJlIG5lZWRlZD8/DQo+Pj4+PiBJZiB3ZSBkaWQgbm90IGdldCB0aGlzIHR5cGUgd2Ugd2ls
bCBub3QgbG9vayBpdCB1cC4NCj4+Pj4gQnV0IGlmIHdlIGhhdmUgZGVmaW5lZCBpbiBEVCBhZHY3
NTMzLzUgZGV2aWNlIGJ1dA0KPj4+PiBDT05GSUdfRFJNX0kyQ19BRFY3NTN4IG5vdCBzZWxlY3Rl
ZCBwcm9iZSB3aWxsIGZhaWwgd2l0aCBFTk9ERVYuDQo+Pj4+IFRoYXQNCj4+Pj4gd291bGQgYmUg
b2s/DQo+Pj4NCj4+PiBXaGF0IGRvIHdlIGdhaW4gZnJvbSB0aGlzIGNvbXBsZXhpdHkgaW4gdGhl
IGVuZC4NCj4+PiBXaHkgbm90IGxldCB0aGUgZHJpdmVyIGFsd2F5cyBzdXBwb3J0IGFsbCB2YXJp
YW50cy4NCj4+Pg0KPj4+IElmIHRoaXMgcmVzdWx0IGluIGEgc2ltcGxlciBkcml2ZXIsIGFuZCBs
ZXNzIGNob2ljZXMgaW4gS2NvbmZpZw0KPj4+IHRoZW4gaXQgaXMgYSB3aW4td2luLg0KPj4NCj4+
IFllYWggaW4gZ2VuZXJhbCB3ZSBkb24ndCBLY29uZmlnIHdpdGhpbiBkcml2ZXJzIGluIGRybSB0
byBkaXNhYmxlDQo+PiBzcGVjaWZpYw0KPj4gY29kZS1wYXRocy4gSXQncyBub3Qgd29ydGggdGhl
IHBhaW4uDQogPg0KPiBBY2ssDQo+IFRoYW5rIHlvdSBmb3IgY2xhcmlmaWNhdGlvbi4gV2lsbCBy
ZW1vdmUgaW4gVjMuDQoNCkFyZSB5b3Ugc3RpbGwgd29ya2luZyBvbiB0aGlzPyBEbyB5b3UgcGxh
biB0byBzZW5kIGEgdjM/DQpJIHdpbGwgc29vbiBsYXkgbXkgaGFuZHMgb24gYSBib2FyZCB3aXRo
IHRoZSBBRFY3NTM1IGFuZCB3b3VsZCBsaWtlIHRvIA0Kc2VlIHRoaXMgbWVyZ2VkLg0KQWxzbyBm
b3IgcGF0Y2ggMS8yLCBpdCBzZWVtcyB5b3UgYWxyZWFkeSBoYXZlIGEgUi1iIGZvciB2MSBmcm9t
IExhdXJlbnQsIA0KYnV0IHlvdSBkaWRuJ3QgY2FycnkgdGhlIHRhZyB0byB2Mi4NCg0KVGhhbmtz
LA0KRnJpZWRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
