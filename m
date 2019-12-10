Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD8117DA1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 03:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBE08934F;
	Tue, 10 Dec 2019 02:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC4E8934F;
 Tue, 10 Dec 2019 02:19:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 18:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="264424112"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2019 18:12:46 -0800
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Dec 2019 18:12:45 -0800
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.27]) by
 fmsmsx101.amr.corp.intel.com ([169.254.1.124]) with mapi id 14.03.0439.000;
 Mon, 9 Dec 2019 18:12:45 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915: Introduce
 intel_plane_state_reset()
Thread-Topic: [Intel-gfx] [PATCH 5/5] drm/i915: Introduce
 intel_plane_state_reset()
Thread-Index: AQHVlXceoRqLlWqfAU6qOmJ952K306ezWcyA
Date: Tue, 10 Dec 2019 02:12:45 +0000
Message-ID: <6067ffaec3a38192267394a7766cc5f6d4733846.camel@intel.com>
References: <20191107142417.11107-1-ville.syrjala@linux.intel.com>
 <20191107142417.11107-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20191107142417.11107-5-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.98.40.69]
Content-ID: <2236AB4F0AC3DA468A5415A4429F6FF5@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTExLTA3IGF0IDE2OjI0ICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gRm9yIHRoZSBzYWtlIG9mIHN5bW1ldHJ5IHdpdGggdGhlIGNydGMgc3R1ZmYgbGV0J3Mg
YWRkDQo+IGEgaGVscGVyIHRvIHJlc2V0IHRoZSBwbGFuZSBzdGF0ZSB0byBzYW5lIGRlZmF1bHQg
dmFsdWVzLg0KPiBGb3IgdGhlIG1vbWVudCB0aGlzIG9ubHkgZ2V0cyBjYWxsZXIgZnJvbSB0aGUg
cGxhbmUgaW5pdC4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfCAxNQ0KPiArKysrKysrKysrKysr
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRv
bWljX3BsYW5lLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21p
Y19wbGFuZS5jDQo+IGluZGV4IDQyYjNiMzQ0OWQyZS4uOTQyOWI4ZTE3MjcwIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMN
Cj4gQEAgLTQxLDYgKzQxLDE2IEBADQo+ICAjaW5jbHVkZSAiaW50ZWxfcG0uaCINCj4gICNpbmNs
dWRlICJpbnRlbF9zcHJpdGUuaCINCj4gIA0KPiArc3RhdGljIHZvaWQgaW50ZWxfcGxhbmVfc3Rh
dGVfcmVzZXQoc3RydWN0IGludGVsX3BsYW5lX3N0YXRlDQo+ICpwbGFuZV9zdGF0ZSwNCj4gKwkJ
CQkgICAgc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSkNCj4gK3sNCj4gKwltZW1zZXQocGxhbmVf
c3RhdGUsIDAsIHNpemVvZigqcGxhbmVfc3RhdGUpKTsNCj4gKw0KPiArCV9fZHJtX2F0b21pY19o
ZWxwZXJfcGxhbmVfc3RhdGVfcmVzZXQoJnBsYW5lX3N0YXRlLT51YXBpLA0KPiAmcGxhbmUtPmJh
c2UpOw0KPiArDQo+ICsJcGxhbmVfc3RhdGUtPnNjYWxlcl9pZCA9IC0xOw0KPiArfQ0KPiArDQo+
ICBzdHJ1Y3QgaW50ZWxfcGxhbmUgKmludGVsX3BsYW5lX2FsbG9jKHZvaWQpDQo+ICB7DQo+ICAJ
c3RydWN0IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsNCj4gQEAgLTU2LDggKzY2LDkg
QEAgc3RydWN0IGludGVsX3BsYW5lICppbnRlbF9wbGFuZV9hbGxvYyh2b2lkKQ0KPiAgCQlyZXR1
cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gIAl9DQo+ICANCj4gLQlfX2RybV9hdG9taWNfaGVscGVy
X3BsYW5lX3Jlc2V0KCZwbGFuZS0+YmFzZSwgJnBsYW5lX3N0YXRlLQ0KPiA+dWFwaSk7DQo+IC0J
cGxhbmVfc3RhdGUtPnNjYWxlcl9pZCA9IC0xOw0KPiArCWludGVsX3BsYW5lX3N0YXRlX3Jlc2V0
KHBsYW5lX3N0YXRlLCBwbGFuZSk7DQo+ICsNCj4gKwlwbGFuZS0+YmFzZS5zdGF0ZSA9ICZwbGFu
ZV9zdGF0ZS0+dWFwaTsNCj4gIA0KPiAgCXJldHVybiBwbGFuZTsNCj4gIH0NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
