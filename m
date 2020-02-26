Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3510A17122C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ECB6EC19;
	Thu, 27 Feb 2020 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Wed, 26 Feb 2020 15:37:06 UTC
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFE56EA8A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:37:06 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id A0D7067A904;
 Wed, 26 Feb 2020 16:31:45 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 26 Feb
 2020 16:31:45 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Wed, 26 Feb 2020 16:31:45 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Lucas Stach <l.stach@pengutronix.de>, Chris Healy <cphealy@gmail.com>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxznqgkQ0YAgAASYYCAAAlEgIAFurcAgAAChwCAAAR5gIAABF6AgAFhcICAAgymAA==
Date: Wed, 26 Feb 2020 15:31:45 +0000
Message-ID: <47cc398f-565a-5725-eb93-66870dfbdc0c@kontron.de>
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
 <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
 <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
 <f3a0bd17-83f5-4afa-e9a6-3eac411d34ff@kontron.de>
 <ca594143751e94a2cf519e03915faa23a91c2836.camel@pengutronix.de>
 <41b4070d-8db8-112c-6c57-f50af00b1604@kontron.de>
In-Reply-To: <41b4070d-8db8-112c-6c57-f50af00b1604@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <7DE6D7D774F52347BB92D832998BE4A9@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: A0D7067A904.ABB47
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: cphealy@gmail.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, l.stach@pengutronix.de
X-Spam-Status: No
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUuMDIuMjAgMDk6MTMsIEZyaWVkZXIgU2NocmVtcGYgd3JvdGU6DQo+IEhpIEx1Y2FzLA0K
PiANCj4gT24gMjQuMDIuMjAgMTI6MDgsIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPj4gT24gTW8sIDIw
MjAtMDItMjQgYXQgMTA6NTMgKzAwMDAsIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6DQo+Pj4gSGkg
THVjYXMsDQo+Pj4NCj4+PiBPbiAyNC4wMi4yMCAxMTozNywgTHVjYXMgU3RhY2ggd3JvdGU6DQo+
Pj4+IEhpIEZyaWVkZXIsDQo+Pj4+DQo+Pj4+IE9uIE1vLCAyMDIwLTAyLTI0IGF0IDEwOjI4ICsw
MDAwLCBTY2hyZW1wZiBGcmllZGVyIHdyb3RlOg0KPj4+Pj4gT24gMjAuMDIuMjAgMTk6NTgsIENo
cmlzIEhlYWx5IHdyb3RlOg0KPj4+Pj4+IEZvciB0aGUgamVya2V5IHRyYW5zaXRpb25zLCBjYW4g
eW91IGRldGVybWluZSBpZiB0aGlzIGlzIGEgc3ltcHRvbSBvZg0KPj4+Pj4+IGEgbG93IGZyYW1l
cmF0ZSBvciBkcm9wcGVkIGZyYW1lcyBvciBzb21ldGhpbmcgZWxzZT8NCj4+Pj4+Pg0KPj4+Pj4+
IFBlcmhhcHMgeW91IGNhbiBzdGFydCB5b3VyIGFwcCB3aXRoDQo+Pj4+Pj4gIkdBTExJVU1fSFVE
PWZwcyxjcHUsZHJhdy1jYWxscyxmcmFtZXRpbWUiLsKgIFRoaXMgbWF5IGdpdmUgc29tZSANCj4+
Pj4+PiBjbHVlcy4NCj4+Pj4+DQo+Pj4+PiBUaGUgZnJhbWVyYXRlIHNlZW1zIG9rLiBJIGdldCBz
b21ldGhpbmcgYmV0d2VlbiA1MCBhbmQgNzAgRlBTLg0KPj4+Pj4NCj4+Pj4+IEkgaGF2ZSBhIFF0
IGRlbW8gYXBwIHdpdGggYSBtZW51IGFuZCBhbiBhbmltYXRlZCAnYmFsbCcgdGhhdCBtb3Zlcw0K
Pj4+Pj4gYWNyb3NzIHRoZSBzY3JlZW4uIFdoZW4gdGhlIG1lbnUgaXMgdmlzaWJsZSwgdGhlIGJh
bGwgbW92ZW1lbnQgaXMgDQo+Pj4+PiByZWFsbHkNCj4+Pj4+IGplcmt5IChiYWxsIHNlZW1zIHRv
ICdqdW1wIGJhY2sgYW5kIGZvcnRoJyBpbnN0ZWFkIG9mIG1vdmluZyANCj4+Pj4+IGxpbmVhcmx5
KS4NCj4+Pj4+DQo+Pj4+PiBBcyBzb29uIGFzIEkgaGlkZSB0aGUgbWVudSBhbmQgc2hvdyB0aGUg
YW5pbWF0aW9uIGZ1bGxzY3JlZW4sIHRoZQ0KPj4+Pj4gbW92ZW1lbnRzIGFyZSBwZXJmZWN0bHkg
c21vb3RoLg0KPj4+Pj4NCj4+Pj4+IFJ1bm5pbmcgdGhlIHNhbWUgYXBwIHdpdGggc29mdHdhcmUg
cmVuZGVyaW5nLCBldmVyeXRoaW5nIGxvb2tzIA0KPj4+Pj4gZ29vZCwgdG9vLg0KPj4+Pj4NCj4+
Pj4+IE5vIGlkZWEgd2hhdCB0aGF0IG1lYW5zLCB0aG91Z2guIEkgcHJvYmFibHkgbmVlZCB0byBs
b29rIGF0IHRoZSANCj4+Pj4+IGNvZGUgb2YNCj4+Pj4+IHRoZSBhcHAgYW5kIGRvIHNvbWUgbW9y
ZSBleHBlcmltZW50cyB0byBnZXQgYSBiZXR0ZXIgaWRlYSBvZiB3aGF0IA0KPj4+Pj4gbWlnaHQN
Cj4+Pj4+IGNhdXNlIHRoZSBkaXN0b3J0aW9uLg0KPj4+Pj4NCj4+Pj4+IFVubGVzcyBzb21lIG9m
IHRoZSBncmFwaGljcyBleHBlcnRzIGhlcmUgYWxyZWFkeSBoYXZlIGFuIGlkZWEgb2Ygd2hhdA0K
Pj4+Pj4gY2FuIGNhdXNlIGFuZC9vciBob3cgdG8gZGVidWcgc3VjaCBhbiBpc3N1ZSE/DQo+Pj4+
DQo+Pj4+IFdoaWNoIGRyaXZlciBpcyB1c2VkIGZvciB0aGUgZGlzcGxheSBzaWRlPyBJdCBzZWVt
cyBsaWtlIHRoZSBkaXNwbGF5DQo+Pj4+IHNpZGUgZG9lc24ndCBwcm9wZXJseSBoYW5kbGUgdGhl
IGRtYSBmZW5jZXMgdXNlZCB0byBzeW5jaHJvbml6ZSBzY2Fub3V0DQo+Pj4+IGFuZCByZW5kZXJp
bmcuDQo+Pj4NCj4+PiBJIHBvcnRlZC9waWNrZWQgdGhlIGRyaXZlcnMgZm9yIHRoZSBMQ0RJRiBh
bmQgRFNJIGNvbnRyb2xsZXJzIGZyb20NCj4+PiBkZXZlbG9wbWVudCBicmFuY2ggb2YgdGhlIDUu
NC1iYXNlZCB2ZW5kb3Iga2VybmVsIFsxXSB0byBvdXIgb3duDQo+Pj4gdjUuNC1iYXNlZCBrZXJu
ZWwgWzJdLiBTbyBpdCBpcyBxdWl0ZSBwcm9iYWJsZSwgdGhhdCBzb21ldGhpbmcgY291bGQgYmUN
Cj4+PiB3cm9uZyBoZXJlLg0KPj4NCj4+IFBsZWFzZSBqdXN0IHVzZSBEUk1fTVhTRkIgZm9yIHRo
ZSBkaXNwbGF5IHNpZGUsIGluc3RlYWQgb2YgdGhlDQo+PiBkb3duc3RyZWFtIGRyaXZlci4NCj4g
DQo+IEhtLCBnb29kIGlkZWEuIEkgc29tZWhvdyBmb3Jnb3QgYWJvdXQgdGhlIGZhY3QsIHRoYXQg
dGhlcmUgaXMgYW4gDQo+IHVwc3RyZWFtIGRyaXZlciBmb3IgdGhlIExDRElGIGNvbnRyb2xsZXIu
IE9uIGZpcnN0IHRyeSBJIGNvdWxkbid0IGdldCBpdCANCj4gdG8gcnVuIG9uIHRoZSBpLk1YOE1N
LCBidXQgSSBzdXNwZWN0IHRoYXQncyBkdWUgdG8gc29tZSByZXNldCwgDQo+IHBvd2VyLWRvbWFp
biBvciBjbG9jayBzZXR1cCwgdGhhdCBpcyBtaXNzaW5nIHVwc3RyZWFtLiBJIHdpbGwgc2VlIGlm
IEkgDQo+IGNhbiBnZXQgYW55IGZ1cnRoZXIgd2l0aCB0aGlzLg0KDQpTbyBJIGhhZCBhIGNsb3Nl
ciBsb29rIGFuZCB3aGlsZSB0aGUgRFJNX01YU0ZCIGxvb2tzIG9rIG9uIGl0cyBvd24sIEkgDQpo
YXZlIHNvbWUgcHJvYmxlbSB3aXRoIHRoZSByZXN0IG9mIHRoZSBpLk1YOE1NIGRpc3BsYXkgc3Vi
c3lzdGVtLg0KDQpUaGUgdmVuZG9yIHN0YWNrLCB0aGF0IEknbSBjdXJyZW50bHkgdXNpbmcgaW50
ZWdyYXRlcyBpbnRvIHRoZSBpbXgtZHJtIA0KbWFzdGVyL2NvcmUgZHJpdmVyIFsxXSB0aGF0IGJp
bmRzIGFsbCB0aGUgY29tcG9uZW50cyBvZiB0aGUgZGlzcGxheSANCnN1YnN5c3RlbSwgc3VjaCBh
cyB0aGUgTENESUYgZHJpdmVyIGFuZCB0aGUgaW50ZWdyYXRlZCBTRUNfRFNJTSBEU0kgYnJpZGdl
Lg0KDQpBbmQgYmVjYXVzZSBvZiBteSBsYWNrIG9mIERSTSBza2lsbHMsIEkgaGF2ZSBubyBpZGVh
IGhvdyB0byBnZXQgdGhlIA0KRFJNX01YU0ZCIGRyaXZlciB0byBiaW5kIHRvIHRoZSBpbXgtZHJt
IGNvcmUsIGluc3RlYWQgb2YgcnVubmluZyANCnNlcGFyYXRlbHkgYW5kIGNvbm5lY3RpbmcgZGly
ZWN0bHkgdG8gc29tZSBwYW5lbCBhcyBpdCBpcyBkb25lIGZvciANCmkuTVgyMy8yOCBhbmQgaS5N
WDZTWC9VTC4NCg0KWzFdIA0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgt
ZHJtLWNvcmUuYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
