Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047810FDD8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEF26E4AB;
	Tue,  3 Dec 2019 12:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4646E4AB;
 Tue,  3 Dec 2019 12:41:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 04:41:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="204962080"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 04:41:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/i915: Fix DPCD register order in
 intel_dp_aux_enable_backlight()
In-Reply-To: <20191122231616.2574-4-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191122231616.2574-1-lyude@redhat.com>
 <20191122231616.2574-4-lyude@redhat.com>
Date: Tue, 03 Dec 2019 14:41:00 +0200
Message-ID: <87r21lintv.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMiBOb3YgMjAxOSwgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gRm9yIGVEUCBwYW5lbHMsIGl0IGFwcGVhcnMgaXQncyBleHBlY3RlZCB0aGF0IHNvIGxvbmcg
YXMgdGhlIHBhbmVsIGlzIGluCj4gRFBDRCBjb250cm9sIG1vZGUgdGhhdCB0aGUgYnJpZ2h0bmVz
cyB2YWx1ZSBpcyBuZXZlciBzZXQgdG8gMC4gSW5zdGVhZCwKPiBpZiB0aGUgZGVzaXJlZCBlZmZl
Y3QgaXMgdG8gc2V0IHRoZSBwYW5lbCdzIGJhY2tsaWdodCB0byAwIHdlJ3JlCj4gZXhwZWN0ZWQg
dG8gc2ltcGx5IHR1cm4gb2ZmIHRoZSBiYWNrbGlnaHQgdGhyb3VnaCB0aGUKPiBEUF9FRFBfRElT
UExBWV9DT05UUk9MX1JFR0lTVEVSLgo+Cj4gV2UgYWxyZWFkeSBkbyB0aGUgbGF0dGVyIGNvcnJl
Y3RseSBpbiBpbnRlbF9kcF9hdXhfZGlzYWJsZV9iYWNrbGlnaHQoKS4KPiBCdXQsIHdlIG1ha2Ug
dGhlIG1pc3Rha2Ugb2Ygd3JpdGluZyB0aGUgRFBDRCByZWdpc3RlcnMgaW4gdGhlIHdyb25nCj4g
b3JkZXIgd2hlbiBlbmFibGluZyB0aGUgYmFja2xpZ2h0IGluIGludGVsX2RwX2F1eF9lbmFibGVf
YmFja2xpZ2h0KCkKPiBzaW5jZSB3ZSBjdXJyZW50bHkgZW5hYmxlIHRoZSBiYWNrbGlnaHQgdGhy
b3VnaAo+IERQX0VEUF9ESVNQTEFZX0NPTlRST0xfUkVHSVNURVIgYmVmb3JlIHdyaXRpbmcgdGhl
IGJyaWdodG5lc3MgbGV2ZWwuIE9uCj4gdGhlIFgxIEV4dHJlbWUgMm5kIEdlbmVyYXRpb24sIHRo
aXMgYXBwZWFycyB0byBoYXZlIHRoZSBwb3RlbnRpYWwgb2YKPiBjb25mdXNpbmcgdGhlIHBhbmVs
IGluIHN1Y2ggYSB3YXkgdGhhdCBmdXJ0aGVyIGF0dGVtcHRzIHRvIHNldCB0aGUKPiBicmlnaHRu
ZXNzIGRvbid0IGFjdHVhbGx5IGNoYW5nZSB0aGUgYmFja2xpZ2h0IGFzIGV4cGVjdGVkIGFuZCBs
ZWF2ZSBpdAo+IG9mZi4gUHJlc3VtYWJseSwgdGhpcyBoYXBwZW5zIGJlY2F1c2UgdGhlIGluY29y
cmVjdCByZWdpc3RlciB3cml0aW5nCj4gb3JkZXIgYnJpZWZseSBsZWF2ZXMgdGhlIHBhbmVsIHdp
dGggRFBDRCBtb2RlIGVuYWJsZWQgYW5kIGEgMCBicmlnaHRuZXNzCj4gbGV2ZWwgc2V0Lgo+Cj4g
U28sIHJldmVyc2UgdGhlIG9yZGVyIHdlIHdyaXRlIHRoZSBEUENEIHJlZ2lzdGVycyB3aGVuIGVu
YWJsaW5nIHRoZQo+IHBhbmVsIGJhY2tsaWdodCBzbyB0aGF0IHdlIHdyaXRlIHRoZSBicmlnaHRu
ZXNzIHZhbHVlIGZpcnN0LCBhbmQgZW5hYmxlCj4gdGhlIGJhY2tsaWdodCBzZWNvbmQuIFRoaXMg
Zml4IGFwcGVhcnMgdG8gYmUgdGhlIGZpbmFsIGJpdCBuZWVkZWQgdG8gZ2V0Cj4gdGhlIGJhY2ts
aWdodCBvbiB0aGUgVGhpbmtQYWQgWDEgRXh0cmVtZSAybmQgR2VuZXJhdGlvbidzIEFNT0xFRCBz
Y3JlZW4KPiB3b3JraW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KClJldmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
PgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFj
a2xpZ2h0LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwX2F1eF9iYWNrbGlnaHQuYwo+IGluZGV4IDBiZjg3NzJiYzdiYi4uODdiNTlkYjlmZmUz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4
X2JhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9hdXhfYmFja2xpZ2h0LmMKPiBAQCAtMjA1LDggKzIwNSw5IEBAIHN0YXRpYyB2b2lkIGludGVs
X2RwX2F1eF9lbmFibGVfYmFja2xpZ2h0KGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpj
cnRjX3N0Cj4gIAkJfQo+ICAJfQo+ICAKPiArCWludGVsX2RwX2F1eF9zZXRfYmFja2xpZ2h0KGNv
bm5fc3RhdGUsCj4gKwkJCQkgICBjb25uZWN0b3ItPnBhbmVsLmJhY2tsaWdodC5sZXZlbCk7Cj4g
IAlzZXRfYXV4X2JhY2tsaWdodF9lbmFibGUoaW50ZWxfZHAsIHRydWUpOwo+IC0JaW50ZWxfZHBf
YXV4X3NldF9iYWNrbGlnaHQoY29ubl9zdGF0ZSwgY29ubmVjdG9yLT5wYW5lbC5iYWNrbGlnaHQu
bGV2ZWwpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBpbnRlbF9kcF9hdXhfZGlzYWJsZV9iYWNr
bGlnaHQoY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKm9sZF9jb25uX3N0YXRlKQoK
LS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
