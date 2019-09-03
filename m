Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E29A64EA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 11:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD24E89704;
	Tue,  3 Sep 2019 09:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADCA89704;
 Tue,  3 Sep 2019 09:17:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 02:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="184695406"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
 by orsmga003.jf.intel.com with ESMTP; 03 Sep 2019 02:17:51 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.73]) by
 IRSMSX103.ger.corp.intel.com ([169.254.3.144]) with mapi id 14.03.0439.000;
 Tue, 3 Sep 2019 10:17:50 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "Peres, Martin"
 <martin.peres@intel.com>, "Ser, Simon" <simon.ser@intel.com>
Subject: Re: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Topic: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Index: AQHVTFZ9Xb5ovM3/BU6v/tV6RvEfjacCMIaAgBeWVYA=
Date: Tue, 3 Sep 2019 09:17:49 +0000
Message-ID: <2d8527f7e982148eec6dc8dd80470d4daf4cfa82.camel@intel.com>
References: <20190806125551.25761-1-stanislav.lisovskiy@intel.com>
 <20190806135150.GZ7444@phenom.ffwll.local>
 <8614f54fd742f9f35979768997e416d36b69563a.camel@intel.com>
 <CAKMK7uHgfviXTqkHsCVmZX97dWFfbysCHtiRVDpSzJ3aheTQkw@mail.gmail.com>
 <5e7dcb14e618796e9cb8a9503cec9d9985c5fd4d.camel@intel.com>
 <20190807210702.GG7444@phenom.ffwll.local>
 <cab2f3a9f9827a993069e402feecc9a9853560a1.camel@intel.com>
 <56A4AB1F0E1B5D4C83D27F43C50F662E590292A2@IRSMSX107.ger.corp.intel.com>
 <ce9f67ad10a2b1f07ab79bc4ac328ef2bd9a2cf4.camel@intel.com>
In-Reply-To: <ce9f67ad10a2b1f07ab79bc4ac328ef2bd9a2cf4.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.89]
Content-ID: <5A0784961BB63C4F804A665C9728BD1F@intel.com>
MIME-Version: 1.0
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA4LTE5IGF0IDA5OjA1ICswMDAwLCBMaXNvdnNraXksIFN0YW5pc2xhdiB3
cm90ZToNCj4gT24gTW9uLCAyMDE5LTA4LTE5IGF0IDA4OjM1ICswMTAwLCBQZXJlcywgTWFydGlu
IHdyb3RlOg0KPiA+IE9uIDE5LzA4LzIwMTkgMTA6MjMsIExpc292c2tpeSwgU3RhbmlzbGF2IHdy
b3RlOg0KPiA+ID4gT24gV2VkLCAyMDE5LTA4LTA3IGF0IDIzOjA3ICswMjAwLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFNvIGlndCBpc24ndCB2YWxp
ZCB1c2Vyc3BhY2UgKGl0J3MganVzdCBnb29kIHRlc3RjYXNlcykuIENhbiB3ZQ0KPiA+ID4gPiBy
ZXBybw0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gc2FtZSBvbiByZWFsIHVzZXJzcGFjZT8gRG9lcyB0
aGlzIHdvcmsgd2l0aCByZWFsIHVzZXJzcGFjZT8NCj4gPiA+ID4gV2UndmUNCj4gPiA+ID4gaGFk
DQo+ID4gPiA+IHVzZXJzcGFjZSB3aGljaCB0cmllcyB0byBiZSBjbGV2ZXIgYW5kIGZpbHRlcnMg
b3V0IHdoYXQgbG9va3MNCj4gPiA+ID4gbGlrZQ0KPiA+ID4gPiByZWR1bmRhbnQgaG90cGx1ZyBl
dmVudHMuIEFuZCB0aGVuIGdldHMgaXQgd3JvbmcgaW4gY2FzZXMgbGlrZQ0KPiA+ID4gPiB0aGlz
Lg0KPiA+ID4gPiANCj4gPiA+ID4gQWxzbywgd2UndmUgaGFkIGZvcmV2ZXIgYW4gdW5jb25kaXRp
b25hbCB1ZXZlbnQgb24gcmVzdW1lLA0KPiA+ID4gPiBleGFjdGx5DQo+ID4gPiA+IGJlY2F1c2UN
Cj4gPiA+ID4gYW55dGhpbmcgY291bGQgaGF2ZSBjaGFuZ2VkLiBEaWQgd2UgbG9vc2UgdGhpcyBv
bmUgb24gdGhlIHdheQ0KPiA+ID4gPiBzb21ld2hlcmU/DQo+ID4gPiA+IE9yIG1heWJlIEkgbWlz
cmVtZW1iZXIgLi4uDQo+ID4gPiA+IA0KPiA+ID4gPiBJZiBhbGwgd2UgY2FyZSBhYm91dCBpcyBy
ZXN1bWUgcmUtYWRkaW5nIHRoYXQgdW5jb25kdGlvbmFsDQo+ID4gPiA+IHVldmVudA0KPiA+ID4g
PiBvbg0KPiA+ID4gPiByZXN1bWUgaXMgZ29pbmcgdG8gYmUgYSBsb3QgZWFzaWVyIHRoYW4gdGhp
cyBoZXJlLg0KPiA+ID4gPiAtRGFuaWVsDQo+ID4gPiANCj4gPiA+IFNvcnJ5IGZvciBsb25nIHJl
cGx5KHdhcyBvbiB2YWNhdGlvbiksIHRoYXQgaXMgYSBnb29kIHF1ZXN0aW9uDQo+ID4gPiByZWdh
cmRpbmcgcmVwcm9kdWNpbmcgdGhpcyBpbiByZWFsIGxpZmUgc2NlbmFyaW8uIE15IG9idmlvdXMN
Cj4gPiA+IGd1ZXNzDQo+ID4gPiB3YXMgdG8gc3VzcGVuZCB0aGUgbWFjaGluZSBhbmQgbWVhbndo
aWxlIGNoYW5nZSBjb25uZWN0ZWQgZGlzcGxheQ0KPiA+ID4gdG8NCj4gPiA+IGFub3RoZXIgb25l
LiBIb3dldmVyIHRoaXMgc2l0dWF0aW9uIHNlZW1zIHRvIGJlIGFscmVhZHkgaGFuZGxlZA0KPiA+
ID4gYnkNCj4gPiA+IGtlcm5lbCBuaWNlbHkodHJpZWQgZmV3IHRpbWVzIGFuZCB3ZSBhbHdheXMg
Z2V0IGEgaG90cGx1ZyBldmVudCkuDQo+ID4gPiBTbw0KPiA+ID4gdGhhdCBlZGlkIGNoYW5nZSBk
dXJpbmcgc3VzcGVuZCBjaGFtZWxpdW0gdGVzdCBjYXNlIHNlZW1zIHRvIGJlDQo+ID4gPiBhIGJp
dCBkaWZmZXJlbnQuIEkgd2lsbCB0YWxrIHRvIG91ciBndXlzIHdobyB3cm90ZSB0aGlzIGFib3V0
DQo+ID4gPiB3aGF0DQo+ID4gPiBpcw0KPiA+ID4gdGhlIHJlYWwgbGlmZSBzY2VuYXJpbyBmb3Ig
dGhpcywgYmVjYXVzZSBJJ20gbm93IGN1cmlvdXMgYXMgd2VsbC4NCj4gPiANCj4gPiBUaGFua3Mg
RGFuaWVsIGZvciB0aGUgZmVlZGJhY2suDQo+ID4gDQo+ID4gSSBhbHNvIG5vdyB3b25kZXIgd2h5
IG91ciBJR1QgdGVzdCAoY2hhbWVsaXVtLWJhc2VkKSBkb2VzIG5vdCBwYXNzDQo+ID4gaWYNCj4g
PiBhDQo+ID4gdWV2ZW50IGlzIHNlbnQgb24gcmVzdW1lIGF1dG9tYXRpY2FsbHkgYW5kIGFsbCB0
aGUgdGVzdCBpcw0KPiA+IGV4cGVjdGluZw0KPiA+IGlzDQo+ID4gYSB1ZXZlbnQuLi4NCj4gPiAN
Cj4gPiBNYXJ0aW4NCj4gDQo+IEluIGZhY3QgSSB3YXMgd3JvbmcgLSB3aGVuIGl0IHdvcmtlZCwg
aXQgd2FzIHVzaW5nIGV4YWN0bHkgdGhvc2UNCj4gcGF0Y2hlcyA6KS4gV2l0aCBjbGVhbiBkcm0t
dGlwIC0gaXQgc2VlbXMgdG8gd29yayBvY2Fzc2lvbmFsbHkgYW5kIGl0DQo+IGRvZXNuJ3QgdXBk
YXRlIHRoZSBhY3R1YWwgZGlzcGxheSBlZGlkIGFuZCBvdGhlciBzdHVmZiwgc28gZXZlbiB3aGVu
DQo+IGRpc3BsYXlzIGFyZSBjaGFuZ2VkIHdlIHN0aWxsIHNlZSB0aGUgb2xkIGluZm8vZWRpZCBm
cm9tIHVzZXJzcGFjZS4NCj4gDQo+IFdlIGFsd2F5cyBnZXQgYSBocGQgaXJxIHdoZW4gc3VzcGVu
ZC9yZXN1bWUgaG93ZXZlciBpdCBkb2Vzbid0IGFsd2F5cw0KPiByZXN1bHQgaW4gdWV2ZW50IGJl
aW5nIHNlbnQuIFNvIHRoZXJlIGlzIGEgcmVhbCBuZWVkIGluIHRob3NlDQo+IHBhdGNoZXMuDQo+
IA0KDQpKdXN0IGRlY2lkZWQgdG8gInBpbmciIHRoaXMgZGlzY3Vzc2lvbiBhZ2Fpbi4gVGhlIGlz
c3VlIGlzIGFscmVhZHkgc29tZQ0KeWVhcnMgb2xkIGFuZCBzdGlsbCBub3RoaW5nIGlzIGZpeGVk
LiBJIGRvIGFncmVlIHRoYXQgbWF5IGJlIHNvbWV0aGluZw0KbmVlZHMgdG8gYmUgZml4ZWQvY2hh
bmdlZCBoZXJlIGluIHRob3NlIHBhdGNoZXMsIGJ1dCBzb21ldGhpbmcgbXVzdCBiZQ0KYWdyZWVk
IGF0IGxlYXN0IEkgZ3Vlc3MsIGFzIGRpc2N1c3Npb25zIHRoZW1zZWxmIGRvIG5vdCBmaXggYnVn
cy4NCkN1cnJlbnRseSB0aG9zZSBwYXRjaGVzIGFkZHJlc3MgYSBwYXJ0aWN1bGFyIGlzc3VlIHdo
aWNoIG9jY3VycywgaWYNCmRpc3BsYXkgaXMgY2hhbmdlZCBkdXJpbmcgc3VzcGVuZC4gDQpPbiBv
Y2Fzc2lvbmFsIGJhc2lzLCB1c2Vyc3BhY2UgbWlnaHQgbm90IGdldCBhIGhvdHBsdWcgZXZlbnQg
YXQgYWxsLA0KY2F1c2luZyBkaWZmZXJlbnQga2luZCBvZiBwcm9ibGVtcyhsaWtlIHdyb25nIG1v
ZGUgc2V0IG9uIGRpc3BsYXkgb3INCmRpYXBseSBub3Qgd29ya2luZyBhdCBhbGwpLiBBbHNvIHNv
bWUga21zX2NoYW1lbGl1bSBob3RwbHVnIHRlc3RzIGZhaWwNCmJlY2F1c2Ugb2YgdGhhdC4gDQoN
Cj4gPiANCj4gPiA+IA0KPiA+ID4gLSBTdGFuaXNsYXYNCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+
ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gLVN0YW5pc2xhdg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiBDaGVlcnMsIERhbmllbA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gLVN0YW5pc2xhdg0KPiA+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gLURhbmllbA0KPiA+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBTdGFuaXNs
YXYgTGlzb3Zza2l5ICgzKToNCj4gPiA+ID4gPiA+ID4gPiA+ICAgZHJtOiBBZGQgaGVscGVyIHRv
IGNvbXBhcmUgZWRpZHMuDQo+ID4gPiA+ID4gPiA+ID4gPiAgIGRybTogSW50cm9kdWNlIGNoYW5n
ZSBjb3VudGVyIHRvIGRybV9jb25uZWN0b3INCj4gPiA+ID4gPiA+ID4gPiA+ICAgZHJtL2k5MTU6
IFNlbmQgaG90cGx1ZyBldmVudCBpZiBlZGlkIGhhZCBjaGFuZ2VkLg0KPiA+ID4gPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAg
ICAgICAgICAgICAgfCAgMSArDQo+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMgICAgICAgICAgICAgICAgICAgfCAzMw0KPiA+ID4gPiA+ID4gPiA+ID4gKysrKysr
KysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3By
b2JlX2hlbHBlci5jICAgICAgICAgICB8IDI5DQo+ID4gPiA+ID4gPiA+ID4gPiArKysrKysrKysr
KysrKystDQo+ID4gPiA+ID4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAxNg0KPiA+ID4gPiA+ID4gPiA+
ID4gKysrKysrKysrLQ0KPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaGRtaS5jICAgIHwgMTYNCj4gPiA+ID4gPiA+ID4gPiA+ICsrKysrKysrLS0N
Cj4gPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hv
dHBsdWcuYyB8IDIxDQo+ID4gPiA+ID4gPiA+ID4gPiArKysrKysrKysrDQo+ID4gPiA+ID4gPiA+
ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiA+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgg
ICAgICAgICAgICAgICAgICB8ICAzICsrDQo+ID4gPiA+ID4gPiA+ID4gPiAgaW5jbHVkZS9kcm0v
ZHJtX2VkaWQuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgOQ0KPiA+ID4gPiA+ID4gPiA+ID4g
KysrKysrDQo+ID4gPiA+ID4gPiA+ID4gPiAgOCBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
PiA+IC0tDQo+ID4gPiA+ID4gPiA+ID4gPiAyLjE3LjENCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gDQo+ID4gDQo+IA0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
