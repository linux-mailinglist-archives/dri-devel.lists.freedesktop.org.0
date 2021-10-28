Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C210B43D8CC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 03:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF596E03E;
	Thu, 28 Oct 2021 01:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FE76E03E;
 Thu, 28 Oct 2021 01:43:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227757830"
X-IronPort-AV: E=Sophos;i="5.87,188,1631602800"; d="scan'208";a="227757830"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 18:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,188,1631602800"; d="scan'208";a="447770479"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga003.jf.intel.com with ESMTP; 27 Oct 2021 18:43:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 02:43:37 +0100
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.012;
 Wed, 27 Oct 2021 18:43:36 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, lkp <lkp@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/dmabuf: fix broken build
Thread-Topic: [PATCH 1/2] drm/i915/dmabuf: fix broken build
Thread-Index: AQHXyxDUaKHj3AXu+USb6UxUwtl4aavnAlOAgAALPoCAAAEegIABCvmA
Date: Thu, 28 Oct 2021 01:43:36 +0000
Message-ID: <3c77071b97add2ae18db01e02914f53654faf795.camel@intel.com>
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <CAM0jSHNig=n9cw0CCNhWHnLn5hLPYFFQR4D9OgZ-QavgyJGJpg@mail.gmail.com>
 <87k0hyj13f.fsf@intel.com>
 <CAM0jSHOCn120_-WZCJHa2+NzPrB_pErHPT3hA2BGarM-ZDw-Cg@mail.gmail.com>
 <87cznqiyzg.fsf@intel.com>
 <CAM0jSHN4oYq=DRnpKiMXjVKUFQ5kttobWpuJLEi6eFzMwjP5-g@mail.gmail.com>
In-Reply-To: <CAM0jSHN4oYq=DRnpKiMXjVKUFQ5kttobWpuJLEi6eFzMwjP5-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D02E8190C5EFA489EB9FB077722899B@intel.com>
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

T24gV2VkLCAyMDIxLTEwLTI3IGF0IDEwOjQ4ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IE9uIFdlZCwgMjcgT2N0IDIwMjEgYXQgMTA6NDQsIEphbmkgTmlrdWxhDQo+IDxqYW5pLm5pa3Vs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFdlZCwgMjcgT2N0IDIwMjEs
IE1hdHRoZXcgQXVsZCA8bWF0dGhldy53aWxsaWFtLmF1bGRAZ21haWwuY29tPg0KPiA+IHdyb3Rl
Og0KPiA+ID4gT24gV2VkLCAyNyBPY3QgMjAyMSBhdCAwOTo1OCwgSmFuaSBOaWt1bGENCj4gPiA+
IDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4g
T24gV2VkLCAyNyBPY3QgMjAyMSwgTWF0dGhldyBBdWxkDQo+ID4gPiA+IDxtYXR0aGV3LndpbGxp
YW0uYXVsZEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IE9uIFRodSwgMjEgT2N0IDIwMjEg
YXQgMTM6NTQsIE1hdHRoZXcgQXVsZA0KPiA+ID4gPiA+IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29t
PiB3cm90ZToNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gd2JpbnZkX29uX2FsbF9jcHVzKCkg
aXMgb25seSBkZWZpbmVkIG9uIHg4NiBpdCBzZWVtcywgcGx1cw0KPiA+ID4gPiA+ID4gd2UgbmVl
ZCB0bw0KPiA+ID4gPiA+ID4gaW5jbHVkZSBhc20vc21wLmggaGVyZS4NCj4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBKYW5pLCB3b3Vs
ZCBpdCBtYWtlIHNlbnNlIHRvIGNoZXJyeS1waWNrIHRoaXMgdG8gLWZpeGVzPyBUaGUNCj4gPiA+
ID4gPiBvZmZlbmRpbmcNCj4gPiA+ID4gPiBjb21taXQgaXMgaW4gZHJtLW5leHQsIGFuZCB0aGVy
ZSBoYXZlIGJlZW4gYSBmZXcgcmVwb3J0cw0KPiA+ID4gPiA+IGFyb3VuZCB0aGlzLg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IEZpeGVzOiBhMDM1MTU0ZGE0NWQgKCJkcm0vaTkxNS9kbWFidWY6IGFk
ZCBwYXJhbm9pZCBmbHVzaC1vbi0NCj4gPiA+ID4gPiBhY3F1aXJlIikNCj4gPiA+ID4gDQo+ID4g
PiA+IElmIHRoZSBGaXhlczogdGFnIGlzIGluIHBsYWNlLCBvdXIgdG9vbGluZyB3aWxsIGNoZXJy
eS1waWNrIGl0DQo+ID4gPiA+IHdoZXJlIGl0DQo+ID4gPiA+IGJlbG9uZ3MuIChJbiB0aGlzIGNh
c2UsIGRybS1pbnRlbC1uZXh0LWZpeGVzLCBub3QgZHJtLWludGVsLQ0KPiA+ID4gPiBmaXhlcy4p
DQo+ID4gPiANCj4gPiA+IFllYWgsIEkgZm9yZ290IHRvIGFkZCB0aGUgZml4ZXMgdGFnIGhlcmUg
dW5mb3J0dW5hdGVseS4NCj4gPiANCj4gPiBBbHJlYWR5IG1lcmdlZD8gV2hhdCdzIHRoZSBjb21t
aXQgaWQgdG8gYmUgY2hlcnJ5LXBpY2tlZD8gUm9kcmlnbw0KPiA+IGNhbiBkbw0KPiA+IGl0IG1h
bnVhbGx5Lg0KPiANCj4gWWVhaCwgaXQgd2FzIG1lcmdlZCB0byBndC1uZXh0Og0KPiANCj4gNzc3
MjI2ZGFjMDU4ICgiZHJtL2k5MTUvZG1hYnVmOiBmaXggYnJva2VuIGJ1aWxkIikNCg0KcGlja2Vk
IHVwIHRvIGRybS1pbnRlbC1uZXh0LWZpeGVzDQoNCnRoYW5rcywNClJvZHJpZ28uDQoNCj4gDQo+
ID4gDQo+ID4gTm90ZSB0byBzZWxmLCB3ZSBzaG91bGQgc2V0IHVwIHNvbWUgd2F5IHRvIGNoZWNr
IHdoaWNoIG1haW50YWluZXINCj4gPiBpcw0KPiA+IHJlc3BvbnNpYmxlIGZvciB3aGljaCBicmFu
Y2hlcyBhbmQgd2hlbi4NCj4gPiANCj4gPiBCUiwNCj4gPiBKYW5pLg0KPiA+IA0KPiA+ID4gDQo+
ID4gPiA+IA0KPiA+ID4gPiBDYzogUm9kcmlnbyB3aG8gY292ZXJzIGRybS1pbnRlbC1uZXh0LWZp
eGVzIGF0bS4NCj4gPiA+ID4gDQo+ID4gPiA+IEJSLA0KPiA+ID4gPiBKYW5pLg0KPiA+ID4gPiAN
Cj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
LS0tDQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFi
dWYuYyB8IDcgKysrKysrKw0KPiA+ID4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj4gPiA+ID4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+ID4gPiA+ID4gPiBpbmRleCAxYWRj
ZDhlMDJkMjkuLmE0NWQwZWMyYzViNiAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYw0KPiA+ID4gPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+ID4gPiA+ID4gPiBAQCAt
MTIsNiArMTIsMTMgQEANCj4gPiA+ID4gPiA+IMKgI2luY2x1ZGUgImk5MTVfZ2VtX29iamVjdC5o
Ig0KPiA+ID4gPiA+ID4gwqAjaW5jbHVkZSAiaTkxNV9zY2F0dGVybGlzdC5oIg0KPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiArI2lmIGRlZmluZWQoQ09ORklHX1g4NikNCj4gPiA+ID4gPiA+ICsj
aW5jbHVkZSA8YXNtL3NtcC5oPg0KPiA+ID4gPiA+ID4gKyNlbHNlDQo+ID4gPiA+ID4gPiArI2Rl
ZmluZSB3YmludmRfb25fYWxsX2NwdXMoKSBcDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgIHBy
X3dhcm4oRFJJVkVSX05BTUUgIjogTWlzc2luZyBjYWNoZSBmbHVzaCBpbg0KPiA+ID4gPiA+ID4g
JXNcbiIsIF9fZnVuY19fKQ0KPiA+ID4gPiA+ID4gKyNlbmRpZg0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gwqBJOTE1X1NFTEZURVNUX0RFQ0xBUkUoc3RhdGljIGJvb2wNCj4gPiA+ID4gPiA+
IGZvcmNlX2RpZmZlcmVudF9kZXZpY2VzOykNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gwqBz
dGF0aWMgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKmRtYV9idWZfdG9fb2JqKHN0cnVjdA0K
PiA+ID4gPiA+ID4gZG1hX2J1ZiAqYnVmKQ0KPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiA+IDIu
MjYuMw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiAtLQ0KPiA+ID4gPiBKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQo+ID4gDQo+ID4gLS0NCj4g
PiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQoNCg==
