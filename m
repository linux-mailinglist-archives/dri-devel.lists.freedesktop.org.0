Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7C3FF20C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 19:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893396E7DD;
	Thu,  2 Sep 2021 17:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACF86E7D5;
 Thu,  2 Sep 2021 17:05:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="282897131"
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="282897131"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 10:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="689217835"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2021 10:05:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 2 Sep 2021 18:05:19 +0100
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.012;
 Thu, 2 Sep 2021 10:05:17 -0700
From: "Bloomfield, Jon" <jon.bloomfield@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, "Vetter, Daniel"
 <daniel.vetter@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, Dave Airlie <airlied@redhat.com>, "Jason
 Ekstrand" <jason@jlekstrand.net>
Subject: RE: [Intel-gfx] [PATCH 07/11] drm/i915: Add
 i915_gem_context_is_full_ppgtt
Thread-Topic: [Intel-gfx] [PATCH 07/11] drm/i915: Add
 i915_gem_context_is_full_ppgtt
Thread-Index: AQHXoAXL2Ahgu8dMaU2lX3fE+bluvquRSjEAgAAHvYCAABY9gP//jkPA
Date: Thu, 2 Sep 2021 17:05:05 +0000
Deferred-Delivery: Thu, 2 Sep 2021 17:04:33 +0000
Message-ID: <608e2c4bbe20443b86f1c62cd95f3e48@intel.com>
References: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
 <20210902142057.929669-7-daniel.vetter@ffwll.ch>
 <1cb4b910-ad02-ff02-46ef-7b3b4f393eb3@linux.intel.com>
 <YTDsKX2rQ4Kjr3io@phenom.ffwll.local>
 <68d369f3-b072-e138-8195-f6ff14f708a2@linux.intel.com>
In-Reply-To: <68d369f3-b072-e138-8195-f6ff14f708a2@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8dHZy
dGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVy
IDIsIDIwMjEgOTo0MiBBTQ0KPiBUbzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD47IERSSSBEZXZlbG9w
bWVudCA8ZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBJbnRlbCBHcmFwaGlj
cyBEZXZlbG9wbWVudCA8aW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBNYWFy
dGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgVmV0
dGVyLCBEYW5pZWwNCj4gPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPjsgQmxvb21maWVsZCwgSm9u
IDxqb24uYmxvb21maWVsZEBpbnRlbC5jb20+Ow0KPiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az47IEpvb25hcyBMYWh0aW5lbg0KPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4
LmludGVsLmNvbT47IFRob21hcyBIZWxsc3Ryw7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbT47IEF1bGQsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBM
YW5kd2VybGluLCBMaW9uZWwgRw0KPiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+OyBE
YXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPjsgSmFzb24NCj4gRWtzdHJhbmQgPGphc29u
QGpsZWtzdHJhbmQubmV0Pg0KPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIDA3LzEx
XSBkcm0vaTkxNTogQWRkDQo+IGk5MTVfZ2VtX2NvbnRleHRfaXNfZnVsbF9wcGd0dA0KPiANCj4g
DQo+IE9uIDAyLzA5LzIwMjEgMTY6MjIsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+ID4gT24gVGh1
LCBTZXAgMDIsIDIwMjEgYXQgMDM6NTQ6MzZQTSArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6
DQo+ID4+IE9uIDAyLzA5LzIwMjEgMTU6MjAsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+ID4+PiBB
bmQgdXNlIGl0IGFueXdoZXJlIHdlIGhhdmUgb3Blbi1jb2RlZCBjaGVja3MgZm9yIGN0eC0+dm0g
dGhhdCByZWFsbHkNCj4gPj4+IG9ubHkgY2hlY2sgZm9yIGZ1bGwgcHBndHQuDQo+ID4+Pg0KPiA+
Pj4gUGx1cyBmb3IgcGFyYW5vaWEgYWRkIGEgR0VNX0JVR19PTiB0aGF0IGNoZWNrcyBpdCdzIHJl
YWxseSBvbmx5IHNldA0KPiA+Pj4gd2hlbiB3ZSBoYXZlIGZ1bGwgcHBndHQsIGp1c3QgaW4gY2Fz
ZS4gZ2VtX2NvbnRleHQtPnZtIGlzIGRpZmZlcmVudA0KPiA+Pj4gc2luY2UgaXQncyBOVUxMIGlu
IGdndHQgbW9kZSwgdW5saWtlIGludGVsX2NvbnRleHQtPnZtIG9yIGd0LT52bSwNCj4gPj4+IHdo
aWNoIGlzIGFsd2F5cyBzZXQuDQo+ID4+Pg0KPiA+Pj4gdjI6IDBkYXkgZm91bmQgYSB0ZXN0Y2Fz
ZSB0aGF0IEkgbWlzc2VkLg0KPiA+Pj4NCj4gPj4+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+ID4+PiBDYzog
Sm9uIEJsb29tZmllbGQgPGpvbi5ibG9vbWZpZWxkQGludGVsLmNvbT4NCj4gPj4+IENjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gPj4+IENjOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+Pj4gQ2M6IEpv
b25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4NCj4gPj4+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiA+Pj4gQ2M6ICJUaG9t
YXMgSGVsbHN0csO2bSIgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiA+Pj4g
Q2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPj4+IENjOiBMaW9u
ZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+DQo+ID4+PiBDYzog
RGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gPj4+IENjOiBKYXNvbiBFa3N0cmFu
ZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jb250ZXh0LmMgICAgICAgICAgIHwgMiArLQ0KPiA+Pj4g
ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NvbnRleHQuaCAgICAgICAgICAg
fCA3ICsrKysrKysNCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9l
eGVjYnVmZmVyLmMgICAgICAgIHwgMiArLQ0KPiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jb250ZXh0LmMgfCA2ICsrKy0tLQ0KPiA+Pj4gICAgNCBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4g
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4
dC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NvbnRleHQuYw0KPiA+
Pj4gaW5kZXggN2E1NjZmYjdjY2E0Li4xZWVjODU5NDRjMWYgMTAwNjQ0DQo+ID4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4dC5jDQo+ID4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4dC5jDQo+ID4+PiBAQCAtMTU2
Niw3ICsxNTY2LDcgQEAgc3RhdGljIGludCBnZXRfcHBndHQoc3RydWN0DQo+IGRybV9pOTE1X2Zp
bGVfcHJpdmF0ZSAqZmlsZV9wcml2LA0KPiA+Pj4gICAgCWludCBlcnI7DQo+ID4+PiAgICAJdTMy
IGlkOw0KPiA+Pj4gLQlpZiAoIXJjdV9hY2Nlc3NfcG9pbnRlcihjdHgtPnZtKSkNCj4gPj4+ICsJ
aWYgKCFpOTE1X2dlbV9jb250ZXh0X2lzX2Z1bGxfcHBndHQoY3R4KSkNCj4gPj4NCj4gPj4gSXQg
cmVhZHMgYSBiaXQgd3JvbmcgYmVjYXVzZSBHRU0gY29udGV4dCBjYW5ub3QgKmJlKiBmdWxsIHBw
Z2d0LiBJdCBjYW4NCj4gYmUNCj4gPj4gYXNzb2NpYXRlZCB3aXRoIGEgVk0gd2hpY2ggaXMgb3Ig
aXNuJ3QgZnVsbCBwcGd0dC4gU28gYSB0ZXN0IG9uIGEgVk0NCj4gPj4gcmV0cmlldmVkIGZyb20g
YSBjb250ZXh0IGlzIHNlbW5udGljYWxseSBtb3JlIGNvcnJlY3QuIFBlcmhhcHMgeW91IHdhbnQN
Cj4gdG8NCj4gPj4gY29uc2lkZXIgYWRkaW5nIGEgaGVscGVyIHRvIHRoYXQgZWZmZWN0IGluc3Rl
YWQ/IEl0IGNvdWxkIG1lYW4gc3BsaXR0aW5nDQo+ID4+IGludG8gdHdvIGhlbHBlcnMgKGdldHRl
ciArIHRlc3QpIG9yIG1heWJlIGp1c3QgcmVuYW1pbmcgd291bGQgd29yay4gTGlrZQ0KPiA+PiBp
OTE1X2dlbV9jb250ZXh0X2hhc19mdWxsX3BwZ3R0X3ZtKGN0eCk/DQo+ID4NCj4gPiBUaGUgcG9p
bnRlciBpc24ndCBzZXQgd2hlbiB0aGUgZHJpdmVyL2NvbnRleHQgaXNuJ3QgcnVubmluZyBpbiBm
dWxsIHBwZ3R0DQo+ID4gbW9kZS4gVGhpcyBpcyB3aHkgSSd2ZSBhZGRlZCB0aGUgR0VNX0JVR19P
TiB0byBjaGVjayB3ZSdyZSBub3QNCj4gYnJlYWtpbmcNCj4gPiBhbnkgaW52YXJpYW50cy4gU28g
eWVhaCBpdCBpcyBhIGZ1bGwgcHBndHQgY29udGV4dCBvciBpdCdzIG5vdCwgdGhhdCBpcw0KPiA+
IGluZGVlZCB0aGUgcXVlc3Rpb24gaGVyZS4NCj4gPg0KPiA+IEknbSBoYXBweSB0byBiaWtlc2hl
ZCB0aGUgbmFtaW5nLCBidXQgSSBkb24ndCBzZWUgaG93IHlvdXIgc3VnZ2VzdGlvbiBpcw0KPiA+
IGFuIGltcHJvdmVtZW50Lg0KPiANCj4gSSB0aGluayB0aGUgcG9pbnRlciBiZWluZyBzZXQgb3Ig
bm90IGlzIGltcGxlbWVudGF0aW9uIGRldGFpbCwgZm9yDQo+IGluc3RhbmNlIHdlIGNvdWxkIGhh
dmUgaXQgYWx3YXlzIHNldCBqdXN0IGxpa2UgaXQgaXMgaW4gaW50ZWxfY29udGV4dC4NCj4gDQo+
IEkgc2ltcGx5IHRoaW5rIEdFTSBjb250ZXh0ICppc24ndCogZnVsbCBwcGd0dCwgYnV0IHRoZSBW
TSBpcy4gQW5kIHNpbmNlDQo+IEdFTSBjb250ZXh0ICpwb2ludHMqIHRvIGEgVk0sICpoYXMqIGlz
IHRoZSByaWdodCB2ZXJiIGluIG15IG1pbmQuIFlvdQ0KPiBkaWQgbm90IHdyaXRlIHdoeSBkbyB5
b3Ugbm90IHNlZSBoYXMgYXMgbW9yZSBjb3JyZWN0IHRoYW4gaXMgc28gSSBkb24ndA0KPiB3YW50
IHRvIGJlIGd1ZXNzaW5nIHRvbyBtdWNoLg0KDQpGV0lXLCBJIGFncmVlIHdpdGggVHZydGtvLiBp
OTE1X2dlbV9jb250ZXh0X2lzX2Z1bGxfcHBndHQgaXMgaW5jb3JyZWN0IGdyYW1tYXIuIEl0IElT
IGEgYmlrZSBzaGVkLCBidXQsIGhleSBpdCdsbCBsaXZlIGZvciBhIHdoaWxlLg0KDQo=
