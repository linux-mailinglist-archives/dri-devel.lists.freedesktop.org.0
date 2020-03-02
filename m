Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5E177118
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594386E9FE;
	Tue,  3 Mar 2020 08:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6666E12A;
 Mon,  2 Mar 2020 08:45:03 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id B846767A7C0;
 Mon,  2 Mar 2020 09:45:00 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 2 Mar 2020
 09:45:00 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Mon, 2 Mar 2020 09:45:00 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: =?utf-8?B?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>, Lucas Stach
 <l.stach@pengutronix.de>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxznqgkQ0YAgAASYYCAAAlEgIAFurcAgAAChwCAAAR5gIAABF6AgAFhcICAAgymAIAABmKAgAAC9ICAB2CtgA==
Date: Mon, 2 Mar 2020 08:45:00 +0000
Message-ID: <8cc6fed1-f438-75f2-a090-eca8e21db769@kontron.de>
References: <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
 <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
 <f3a0bd17-83f5-4afa-e9a6-3eac411d34ff@kontron.de>
 <ca594143751e94a2cf519e03915faa23a91c2836.camel@pengutronix.de>
 <41b4070d-8db8-112c-6c57-f50af00b1604@kontron.de>
 <47cc398f-565a-5725-eb93-66870dfbdc0c@kontron.de>
 <8234253d725e665a4ef0f231c587e32cd4261a55.camel@pengutronix.de>
 <20200226160509.GA71919@bogon.m.sigxcpu.org>
In-Reply-To: <20200226160509.GA71919@bogon.m.sigxcpu.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <7712DA61232A2244B6E07606D073E4F8@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: B846767A7C0.AE2B4
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: agx@sigxcpu.org, cphealy@gmail.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 l.stach@pengutronix.de
X-Spam-Status: No
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYuMDIuMjAgMTc6MDUsIEd1aWRvIEfDvG50aGVyIHdyb3RlOg0KPiBPbiBXZWQsIEZlYiAy
NiwgMjAyMCBhdCAwNDo1NDozNVBNICswMTAwLCBMdWNhcyBTdGFjaCB3cm90ZToNCj4+IE9uIE1p
LCAyMDIwLTAyLTI2IGF0IDE1OjMxICswMDAwLCBTY2hyZW1wZiBGcmllZGVyIHdyb3RlOg0KPj4+
IE9uIDI1LjAyLjIwIDA5OjEzLCBGcmllZGVyIFNjaHJlbXBmIHdyb3RlOg0KPj4+PiBIaSBMdWNh
cywNCj4+Pj4NCj4+Pj4gT24gMjQuMDIuMjAgMTI6MDgsIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPj4+
Pj4gT24gTW8sIDIwMjAtMDItMjQgYXQgMTA6NTMgKzAwMDAsIFNjaHJlbXBmIEZyaWVkZXIgd3Jv
dGU6DQo+Pj4+Pj4gSGkgTHVjYXMsDQo+Pj4+Pj4NCj4+Pj4+PiBPbiAyNC4wMi4yMCAxMTozNywg
THVjYXMgU3RhY2ggd3JvdGU6DQo+Pj4+Pj4+IEhpIEZyaWVkZXIsDQo+Pj4+Pj4+DQo+Pj4+Pj4+
IE9uIE1vLCAyMDIwLTAyLTI0IGF0IDEwOjI4ICswMDAwLCBTY2hyZW1wZiBGcmllZGVyIHdyb3Rl
Og0KPj4+Pj4+Pj4gT24gMjAuMDIuMjAgMTk6NTgsIENocmlzIEhlYWx5IHdyb3RlOg0KPj4+Pj4+
Pj4+IEZvciB0aGUgamVya2V5IHRyYW5zaXRpb25zLCBjYW4geW91IGRldGVybWluZSBpZiB0aGlz
IGlzIGEgc3ltcHRvbSBvZg0KPj4+Pj4+Pj4+IGEgbG93IGZyYW1lcmF0ZSBvciBkcm9wcGVkIGZy
YW1lcyBvciBzb21ldGhpbmcgZWxzZT8NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFBlcmhhcHMgeW91
IGNhbiBzdGFydCB5b3VyIGFwcCB3aXRoDQo+Pj4+Pj4+Pj4gIkdBTExJVU1fSFVEPWZwcyxjcHUs
ZHJhdy1jYWxscyxmcmFtZXRpbWUiLiAgVGhpcyBtYXkgZ2l2ZSBzb21lDQo+Pj4+Pj4+Pj4gY2x1
ZXMuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhlIGZyYW1lcmF0ZSBzZWVtcyBvay4gSSBnZXQgc29t
ZXRoaW5nIGJldHdlZW4gNTAgYW5kIDcwIEZQUy4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJIGhhdmUg
YSBRdCBkZW1vIGFwcCB3aXRoIGEgbWVudSBhbmQgYW4gYW5pbWF0ZWQgJ2JhbGwnIHRoYXQgbW92
ZXMNCj4+Pj4+Pj4+IGFjcm9zcyB0aGUgc2NyZWVuLiBXaGVuIHRoZSBtZW51IGlzIHZpc2libGUs
IHRoZSBiYWxsIG1vdmVtZW50IGlzDQo+Pj4+Pj4+PiByZWFsbHkNCj4+Pj4+Pj4+IGplcmt5IChi
YWxsIHNlZW1zIHRvICdqdW1wIGJhY2sgYW5kIGZvcnRoJyBpbnN0ZWFkIG9mIG1vdmluZw0KPj4+
Pj4+Pj4gbGluZWFybHkpLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEFzIHNvb24gYXMgSSBoaWRlIHRo
ZSBtZW51IGFuZCBzaG93IHRoZSBhbmltYXRpb24gZnVsbHNjcmVlbiwgdGhlDQo+Pj4+Pj4+PiBt
b3ZlbWVudHMgYXJlIHBlcmZlY3RseSBzbW9vdGguDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gUnVubmlu
ZyB0aGUgc2FtZSBhcHAgd2l0aCBzb2Z0d2FyZSByZW5kZXJpbmcsIGV2ZXJ5dGhpbmcgbG9va3MN
Cj4+Pj4+Pj4+IGdvb2QsIHRvby4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBObyBpZGVhIHdoYXQgdGhh
dCBtZWFucywgdGhvdWdoLiBJIHByb2JhYmx5IG5lZWQgdG8gbG9vayBhdCB0aGUNCj4+Pj4+Pj4+
IGNvZGUgb2YNCj4+Pj4+Pj4+IHRoZSBhcHAgYW5kIGRvIHNvbWUgbW9yZSBleHBlcmltZW50cyB0
byBnZXQgYSBiZXR0ZXIgaWRlYSBvZiB3aGF0DQo+Pj4+Pj4+PiBtaWdodA0KPj4+Pj4+Pj4gY2F1
c2UgdGhlIGRpc3RvcnRpb24uDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVW5sZXNzIHNvbWUgb2YgdGhl
IGdyYXBoaWNzIGV4cGVydHMgaGVyZSBhbHJlYWR5IGhhdmUgYW4gaWRlYSBvZiB3aGF0DQo+Pj4+
Pj4+PiBjYW4gY2F1c2UgYW5kL29yIGhvdyB0byBkZWJ1ZyBzdWNoIGFuIGlzc3VlIT8NCj4+Pj4+
Pj4NCj4+Pj4+Pj4gV2hpY2ggZHJpdmVyIGlzIHVzZWQgZm9yIHRoZSBkaXNwbGF5IHNpZGU/IEl0
IHNlZW1zIGxpa2UgdGhlIGRpc3BsYXkNCj4+Pj4+Pj4gc2lkZSBkb2Vzbid0IHByb3Blcmx5IGhh
bmRsZSB0aGUgZG1hIGZlbmNlcyB1c2VkIHRvIHN5bmNocm9uaXplIHNjYW5vdXQNCj4+Pj4+Pj4g
YW5kIHJlbmRlcmluZy4NCj4+Pj4+Pg0KPj4+Pj4+IEkgcG9ydGVkL3BpY2tlZCB0aGUgZHJpdmVy
cyBmb3IgdGhlIExDRElGIGFuZCBEU0kgY29udHJvbGxlcnMgZnJvbQ0KPj4+Pj4+IGRldmVsb3Bt
ZW50IGJyYW5jaCBvZiB0aGUgNS40LWJhc2VkIHZlbmRvciBrZXJuZWwgWzFdIHRvIG91ciBvd24N
Cj4+Pj4+PiB2NS40LWJhc2VkIGtlcm5lbCBbMl0uIFNvIGl0IGlzIHF1aXRlIHByb2JhYmxlLCB0
aGF0IHNvbWV0aGluZyBjb3VsZCBiZQ0KPj4+Pj4+IHdyb25nIGhlcmUuDQo+Pj4+Pg0KPj4+Pj4g
UGxlYXNlIGp1c3QgdXNlIERSTV9NWFNGQiBmb3IgdGhlIGRpc3BsYXkgc2lkZSwgaW5zdGVhZCBv
ZiB0aGUNCj4+Pj4+IGRvd25zdHJlYW0gZHJpdmVyLg0KPj4+Pg0KPj4+PiBIbSwgZ29vZCBpZGVh
LiBJIHNvbWVob3cgZm9yZ290IGFib3V0IHRoZSBmYWN0LCB0aGF0IHRoZXJlIGlzIGFuDQo+Pj4+
IHVwc3RyZWFtIGRyaXZlciBmb3IgdGhlIExDRElGIGNvbnRyb2xsZXIuIE9uIGZpcnN0IHRyeSBJ
IGNvdWxkbid0IGdldCBpdA0KPj4+PiB0byBydW4gb24gdGhlIGkuTVg4TU0sIGJ1dCBJIHN1c3Bl
Y3QgdGhhdCdzIGR1ZSB0byBzb21lIHJlc2V0LA0KPj4+PiBwb3dlci1kb21haW4gb3IgY2xvY2sg
c2V0dXAsIHRoYXQgaXMgbWlzc2luZyB1cHN0cmVhbS4gSSB3aWxsIHNlZSBpZiBJDQo+Pj4+IGNh
biBnZXQgYW55IGZ1cnRoZXIgd2l0aCB0aGlzLg0KPj4+DQo+Pj4gU28gSSBoYWQgYSBjbG9zZXIg
bG9vayBhbmQgd2hpbGUgdGhlIERSTV9NWFNGQiBsb29rcyBvayBvbiBpdHMgb3duLCBJDQo+Pj4g
aGF2ZSBzb21lIHByb2JsZW0gd2l0aCB0aGUgcmVzdCBvZiB0aGUgaS5NWDhNTSBkaXNwbGF5IHN1
YnN5c3RlbS4NCj4+Pg0KPj4+IFRoZSB2ZW5kb3Igc3RhY2ssIHRoYXQgSSdtIGN1cnJlbnRseSB1
c2luZyBpbnRlZ3JhdGVzIGludG8gdGhlIGlteC1kcm0NCj4+PiBtYXN0ZXIvY29yZSBkcml2ZXIg
WzFdIHRoYXQgYmluZHMgYWxsIHRoZSBjb21wb25lbnRzIG9mIHRoZSBkaXNwbGF5DQo+Pj4gc3Vi
c3lzdGVtLCBzdWNoIGFzIHRoZSBMQ0RJRiBkcml2ZXIgYW5kIHRoZSBpbnRlZ3JhdGVkIFNFQ19E
U0lNIERTSSBicmlkZ2UuDQo+Pj4NCj4+PiBBbmQgYmVjYXVzZSBvZiBteSBsYWNrIG9mIERSTSBz
a2lsbHMsIEkgaGF2ZSBubyBpZGVhIGhvdyB0byBnZXQgdGhlDQo+Pj4gRFJNX01YU0ZCIGRyaXZl
ciB0byBiaW5kIHRvIHRoZSBpbXgtZHJtIGNvcmUsIGluc3RlYWQgb2YgcnVubmluZw0KPj4+IHNl
cGFyYXRlbHkgYW5kIGNvbm5lY3RpbmcgZGlyZWN0bHkgdG8gc29tZSBwYW5lbCBhcyBpdCBpcyBk
b25lIGZvcg0KPj4+IGkuTVgyMy8yOCBhbmQgaS5NWDZTWC9VTC4NCj4+DQo+PiBJdCdzIGEgc2Vw
YXJhdGUgaGFyZHdhcmUgYW5kIGl0J3MgYSBwcmV0dHkgbWFqb3IgZGVzaWduIGlzc3VlIG9mIHRo
ZQ0KPj4gZG93bnN0cmVhbSBkcml2ZXIgdGhhdCBpdCBpbnRlZ3JhdGVzIGludG8gaW14LWRybS4g
WW91IGRvbid0IHdhbnQgdGhpcw0KPj4gd2l0aCB0aGUgdXBzdHJlYW0gZHJpdmVyLg0KPj4NCj4+
IE1heWJlIEd1aWRvIChDQ2VkKSBjYW4gZ2l2ZSB5b3Ugc29tZSBjbHVlcywgYXMgYXBwYXJlbnRs
eSBoZSBpcyB1c2luZw0KPj4gdGhlIG1haW5saW5lIGVMQ0RJRiBkcml2ZXIgKyBzb21lIHBhdGNo
ZXMgdG8gZHJpdmUgdGhlIERTSSBkaXNwbGF5IHBhdGgNCj4+IG9uIGkuTVg4TVEuIEEgbG90IG9m
IHRoaXMgd2lsbCBwcm9iYWJseSBiZSB0cmFuc2ZlcmFibGUgdG8gdGhlIGkuTVg4TU0NCj4+IGRp
c3BsYXkgcGF0aC4NCj4gDQo+IE5ld2VyIG14c2ZiIHN1cHBvcnRzIGF0dGFjaGluZyBhIGJyaWRn
ZSBzbyBpZiB5b3UgbWFrZSB5b3VyIERTSSBob3N0DQo+IGNvbnRyb2xsZXIgZHJpdmVyIGEgRFNJ
IGJyaWRnZSBteHNmYiBjYW4gZHJpdmUgaXQ6DQo+IA0KPiAgICAgICBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMjbjI2OA0KPiANCj4gdGhpcyBzaG91bGQg
YmUgc2ltaWxhciB0byB3aGF0IHdhcyBkb25lIGZvciB0aGUgaW14OG1xIGhlcmUgKGlteDhtbQ0K
PiB1c2VycyBhIGRpZmZlcmVudCBpcCBjb3JlIHRob3VnaCk6DQo+IA0KPiAgICAgICBodHRwczov
L3NvdXJjZS5wdXJpLnNtL2d1aWRvLmd1bnRoZXIvbGludXgtaW14OC9jb21taXRzL2ZvcndhcmQt
dXBzdHJlYW0vbmV4dC0yMDIwMDIxNy9teHNmYitud2wvdjktd2lwDQo+IA0KPiBUaGVyZSdzIGFs
c28gc29tZSBhZGRpdGlvbmFsIG14c2ZiIHBhdGNoZXMgYnkgUm9iZXJ0IGZsb2F0aW5nIGFyb3Vu
ZA0KPiB3aGljaCBhcmVuJ3QgbWFpbmxpbmUgeWV0IHdoaWNoIHRoZSBhYm92ZSBicmFuY2ggYWxz
byBoYXMuDQo+IA0KPiBXaGljaCByZW1pbmRzIG1lIHRoYXQgaSBuZWVkIHRvIHByZXBhcmUgYW5k
IHNlbmQgb3V0IGEgdjkuDQoNClRoYW5rcyBMdWNhcyBhbmQgR3VpZG8gZm9yIHBvaW50aW5nIG91
dCB0aGUgZGV0YWlscyENCkl0J3MgdmVyeSB1bmZvcnR1bmF0ZSB0aGF0IGkuTVg4TVEgYW5kIGku
TVg4TU0gZG9uJ3Qgc2hhcmUgdGhlIHNhbWUgRFNJIA0KaXAgY29yZS4NCkl0IHNlZW1zIGxpa2Ug
SSBuZWVkIHRvIHRyeSBjb21pbmcgdXAgd2l0aCBhIGJyaWRnZSBkcml2ZXIgZm9yIHRoZSANClNh
bXN1bmcgRFNJTSBEU0kgY29udHJvbGxlciBmb3IgYSBwcm9wZXIgdXBzdHJlYW0gc29sdXRpb24u
DQoNClRoYW5rcywNCkZyaWVkZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
