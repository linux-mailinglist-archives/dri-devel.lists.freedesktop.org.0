Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A314E3FA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 21:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71596E8FE;
	Thu, 30 Jan 2020 20:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA166E8FD;
 Thu, 30 Jan 2020 20:31:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 12:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="309812713"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga001.jf.intel.com with ESMTP; 30 Jan 2020 12:31:47 -0800
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jan 2020 12:31:46 -0800
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.3]) by
 FMSMSX114.amr.corp.intel.com ([169.254.6.143]) with mapi id 14.03.0439.000;
 Thu, 30 Jan 2020 12:31:46 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH] drm/mst: Fix possible NULL pointer dereference in
 drm_dp_mst_process_up_req()
Thread-Topic: [PATCH] drm/mst: Fix possible NULL pointer dereference in
 drm_dp_mst_process_up_req()
Thread-Index: AQHV1vtT03cpejceXEOuAUNWuwPy3KgDjhOAgACipoA=
Date: Thu, 30 Jan 2020 20:31:46 +0000
Message-ID: <ce6efca4e3a8ae468b0d6da99a06d54b30a8df93.camel@intel.com>
References: <20200129232448.84704-1-jose.souza@intel.com>
 <fa91fb504dacb40f922077ee7181ec5f4caded08.camel@intel.com>
In-Reply-To: <fa91fb504dacb40f922077ee7181ec5f4caded08.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.12.250]
Content-ID: <337C94D034C8A84EA9F9690B8FE43EDC@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTAxLTMwIGF0IDEwOjQ5ICswMDAwLCBMaXNvdnNraXksIFN0YW5pc2xhdiB3
cm90ZToNCj4gT24gV2VkLCAyMDIwLTAxLTI5IGF0IDE1OjI0IC0wODAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIHdyb3RlOg0KPiA+IEFjY29yZGluZyB0byBEUCBzcGVjaWZpY2F0aW9uLCBEUF9T
SU5LX0VWRU5UX05PVElGWSBpcyBhbHNvIGENCj4gPiBicm9hZGNhc3QgbWVzc2FnZSBidXQgYXMg
dGhpcyBmdW5jdGlvbiBvbmx5IGhhbmRsZXMNCj4gPiBEUF9DT05ORUNUSU9OX1NUQVRVU19OT1RJ
RlkgSSB3aWxsIG9ubHkgbWFrZSB0aGUgc3RhdGljDQo+ID4gYW5hbHl6ZXIgdGhhdCBjYXVnaHQg
dGhpcyBpc3N1ZSBoYXBweSBieSBub3QgY2FsbGluZw0KPiA+IGRybV9kcF9nZXRfbXN0X2JyYW5j
aF9kZXZpY2VfYnlfZ3VpZCgpIHdpdGggYSBOVUxMIGd1aWQsIGNhdXNpbmcNCj4gPiBkcm1fZHBf
bXN0X3Byb2Nlc3NfdXBfcmVxKCkgdG8gcmV0dXJuIGluIHRoZSAiaWYgKCFtc3RiKSIgcmlnaHQN
Cj4gPiBiZWxsb3cuDQo+ID4gDQo+ID4gRml4ZXM6IDk0MDhjYzk0ZWIwNCAoImRybS9kcF9tc3Q6
IEhhbmRsZSBVUCByZXF1ZXN0cw0KPiA+IGFzeW5jaHJvbm91c2x5IikNCj4gPiBDYzogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMgfCAzICsrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMNCj4gPiBpbmRleCAyM2NmNDZiZmVmNzQuLmE4MTEyNDdjZWNmZSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+IEBAIC0zODI5LDcgKzM4Mjks
OCBAQCBkcm1fZHBfbXN0X3Byb2Nlc3NfdXBfcmVxKHN0cnVjdA0KPiA+IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsDQo+ID4gIAkJZWxzZSBpZiAobXNnLT5yZXFfdHlwZSA9PSBEUF9SRVNP
VVJDRV9TVEFUVVNfTk9USUZZKQ0KPiA+ICAJCQlndWlkID0gbXNnLT51LnJlc291cmNlX3N0YXQu
Z3VpZDsNCj4gPiAgDQo+ID4gLQkJbXN0YiA9IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2Vf
YnlfZ3VpZChtZ3IsIGd1aWQpOw0KPiA+ICsJCWlmIChndWlkKQ0KPiA+ICsJCQltc3RiID0NCj4g
PiBkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2aWNlX2J5X2d1aWQobWdyLCBndWlkKTsNCj4gPiAg
CX0gZWxzZSB7DQo+ID4gIAkJbXN0YiA9IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2UobWdy
LCBoZHItPmxjdCwgaGRyLQ0KPiA+ID4gcmFkKTsNCj4gPiAgCX0NCj4gDQo+IEJlZW4gZml4aW5n
IHNvbWV0aGluZyBzaW1pbGFyIGluIGRwIG1zdCB0b3BvbG9neSBhIHdoaWxlIGFnbywgd2FzDQo+
IGFsc28NCj4gc2ltaWxhciBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UuIEZpeCBzZWVtcyB0byBi
ZSBjb3JyZWN0LCBob3dldmVyIEkNCj4gd291bGQgc3RpbGwgaGF2ZSBhIGxvb2sgYXQgbGVhc3Qs
IGhvdyBpdCBhZmZlY3RzIG92ZXJhbGwgbG9naWMgdGhlbi4NCj4gSSBtZWFuIG5vdyB3ZSBkb24n
dCBjYWxsIGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZCBpZiBndWlkDQo+IGlz
IE5VTEwgLSB0aGF0J3Mgb2ssIGhvd2V2ZXIgaXQgbWVhbnMgdGhhdCBtc3RiIHdpbGwgbm90IGdl
dA0KPiBpbml0aWFsaXplZCBhbmQgaG93IHRoaXMgaXMgZ29pbmcgdG8gYWZmZWN0IHRoZSBjb2Rl
IGZsb3cgdGhlbj8NCj4gDQo+IFNIb3VsZCB3ZSBtYXkgYmUgc3RpbGwgdHJ5IHRvIGluaXRpYWxp
emUgbXN0YiBzb21laG93IGFuZCBjaGVjaw0KPiBndWlkIGFjdHVhbGx5IGluc2lkZSBvZiB0aGlz
IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZA0KPiBmdW5jdGlvbj8gT3IgY2Fs
bCBkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2aWNlPw0KPiANCj4gSSdtIG5vdCBzdGF0aW5nIGFu
eXRoaW5nIGhlcmUsIGp1c3QgYXNraW5nIHF1ZXN0aW9uIHRvIA0KPiBtYWtlIHRoZSBvdmVyYWxs
IHBpY3R1cmUgYml0IG1vcmUgY2xlYXIuDQoNCldlbGwgaXQgZG8gbm90IG1hdHRlcnMgaWYgaXQg
c2V0IG1zdGIgaWYgb24gdGhlIG5leHQgYmxvY2sgaXQgd2lsbCBvbmx5DQpoYW5kbGUgbWVzc2Fn
ZXMgb2YgRFBfQ09OTkVDVElPTl9TVEFUVVNfTk9USUZZIHR5cGUgYnV0IGZvciBzdXJlIHdlDQpz
aG91bGQgaGFuZGxlIHRoaXMgdHdvIG90aGVyIG1lc3NhZ2UgdHlwZXMuDQoNCj4gDQo+IEFueXdh
eXMsIGV2ZW4gd3JvbmcgbG9naWMgdG8gbWUgaXMgYmV0dGVyIHRoYW4gY3Jhc2hpbmcgc28sDQo+
IA0KPiBSZXZpZXdlZC1ieTogU3RhbmlzbGF2IExpc292c2tpeSA8c3RhbmlzbGF2Lmxpc292c2tp
eUBpbnRlbC5jb20+DQoNClRoYW5rcw0KDQo+IA0KPiANCj4gDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
