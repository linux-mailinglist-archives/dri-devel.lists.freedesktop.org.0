Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073410FDD4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A796E31A;
	Tue,  3 Dec 2019 12:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE946E31A;
 Tue,  3 Dec 2019 12:40:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 04:40:25 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="204961932"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 04:40:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/i915: Assume 100% brightness when not in DPCD
 control mode
In-Reply-To: <20191122231616.2574-3-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191122231616.2574-1-lyude@redhat.com>
 <20191122231616.2574-3-lyude@redhat.com>
Date: Tue, 03 Dec 2019 14:40:18 +0200
Message-ID: <87tv6hinv1.fsf@intel.com>
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
Cj4gQ3VycmVudGx5IHdlIGFsd2F5cyBkZXRlcm1pbmUgdGhlIGluaXRpYWwgcGFuZWwgYnJpZ2h0
bmVzcyBsZXZlbCBieQo+IHNpbXBseSByZWFkaW5nIHRoZSB2YWx1ZSBmcm9tIERQX0VEUF9CQUNL
TElHSFRfQlJJR0hUTkVTU19NU0IvTFNCLiBUaGlzCj4gc2VlbXMgd3JvbmcgdGhvdWdoLCBiZWNh
dXNlIGlmIHRoZSBwYW5lbCBpcyBub3QgY3VycmVudGx5IGluIERQQ0QKPiBjb250cm9sIG1vZGUg
dGhlcmUncyBub3QgcmVhbGx5IGFueSByZWFzb24gd2h5IHRoZXJlIHdvdWxkIGJlIGFueQo+IGJy
aWdodG5lc3MgdmFsdWUgcHJvZ3JhbW1lZCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPiBUaGlzIGFw
cGVhcnMgdG8gYmUgdGhlIGNhc2Ugb24gdGhlIExlbm92byBUaGlua1BhZCBYMSBFeHRyZW1lIDJu
ZAo+IEdlbmVyYXRpb24sIHdoZXJlIHRoZSBkZWZhdWx0IHZhbHVlIGluIHRoZXNlIHJlZ2lzdGVy
cyBpcyBhbHdheXMgMCBvbgo+IGJvb3QgZGVzcGl0ZSB0aGUgZmFjdCB0aGUgcGFuZWwgcnVucyBh
dCBtYXggYnJpZ2h0bmVzcyBieSBkZWZhdWx0Lgo+IEdldHRpbmcgdGhlIGluaXRpYWwgYnJpZ2h0
bmVzcyB2YWx1ZSBjb3JyZWN0IGhlcmUgaXMgaW1wb3J0YW50IGFzIHdlbGwsCj4gc2luY2UgdGhl
IHBhbmVsIG9uIHRoaXMgbGFwdG9wIGRvZXNuJ3QgYmVoYXZlIHdlbGwgaWYgaXQncyBldmVyIHB1
dCBpbnRvCj4gRFBDRCBjb250cm9sIG1vZGUgd2hpbGUgdGhlIGJyaWdodG5lc3MgbGV2ZWwgaXMg
cHJvZ3JhbW1lZCB0byAwLgo+Cj4gU28sIGxldCdzIGZpeCB0aGlzIGJ5IGNoZWNraW5nIHdoYXQg
dGhlIGN1cnJlbnQgYmFja2xpZ2h0IGNvbnRyb2wgbW9kZQo+IGlzIGJlZm9yZSByZWFkaW5nIHRo
ZSBicmlnaHRuZXNzIGxldmVsLiBJZiBpdCdzIGluIERQQ0QgY29udHJvbCBtb2RlLCB3ZQo+IHJl
dHVybiB0aGUgcHJvZ3JhbW1lZCBicmlnaHRuZXNzIGxldmVsLiBPdGhlcndpc2Ugd2UgYXNzdW1l
IDEwMCUKPiBicmlnaHRuZXNzIGFuZCByZXR1cm4gdGhlIGhpZ2hlc3QgcG9zc2libGUgYnJpZ2h0
bmVzcyBsZXZlbC4gVGhpcyBhbHNvCj4gcHJldmVudHMgdXMgZnJvbSBhY2NpZGVudGFsbHkgcHJv
Z3JhbW1pbmcgYSBicmlnaHRuZXNzIGxldmVsIG9mIDAuCj4KPiBUaGlzIGlzIG9uZSBvZiB0aGUg
bWFueSBmaXhlcyB0aGF0IGdldHMgYmFja2xpZ2h0IGNvbnRyb2xzIHdvcmtpbmcgb24KPiB0aGUg
VGhpbmtQYWQgWDEgRXh0cmVtZSAybmQgR2VuZXJhdGlvbiB3aXRoIG9wdGlvbmFsIDRLIEFNT0xF
RCBzY3JlZW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
Pgo+IC0tLQo+ICAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4X2JhY2tsaWdo
dC5jIHwgMTUgKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9hdXhfYmFja2xpZ2h0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
X2F1eF9iYWNrbGlnaHQuYwo+IGluZGV4IGZhZDQ3MDU1M2NmOS4uMGJmODc3MmJjN2JiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4X2JhY2ts
aWdodC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhf
YmFja2xpZ2h0LmMKPiBAQCAtNTksOCArNTksMjMgQEAgc3RhdGljIHUzMiBpbnRlbF9kcF9hdXhf
Z2V0X2JhY2tsaWdodChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAg
CXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPSBlbmNfdG9faW50ZWxfZHAoJmNvbm5lY3Rvci0+
ZW5jb2Rlci0+YmFzZSk7Cj4gIAl1OCByZWFkX3ZhbFsyXSA9IHsgMHgwIH07Cj4gKwl1OCBjb250
cm9sX3JlZzsKPiAgCXUxNiBsZXZlbCA9IDA7Cj4gIAo+ICsJaWYgKGRybV9kcF9kcGNkX3JlYWRi
KCZpbnRlbF9kcC0+YXV4LCBEUF9FRFBfRElTUExBWV9DT05UUk9MX1JFR0lTVEVSLAoKU2hvdWxk
bid0IHRoYXQgYmUgRFBfRURQX0JBQ0tMSUdIVF9NT0RFX1NFVF9SRUdJU1RFUiBpbnN0ZWFkPwoK
PiArCQkJICAgICAgJmNvbnRyb2xfcmVnKSAhPSAxKSB7Cj4gKwkJRFJNX0RFQlVHX0tNUygiRmFp
bGVkIHRvIHJlYWQgdGhlIERQQ0QgcmVnaXN0ZXIgMHgleFxuIiwKPiArCQkJICAgICAgRFBfRURQ
X0RJU1BMQVlfQ09OVFJPTF9SRUdJU1RFUik7Cj4gKwkJcmV0dXJuIDA7Cj4gKwl9Cj4gKwo+ICsJ
LyoKPiArCSAqIElmIHdlJ3JlIG5vdCBpbiBEUENEIGNvbnRyb2wgbW9kZSB5ZXQsIHRoZSBwcm9n
cmFtbWVkIGJyaWdodG5lc3MKPiArCSAqIHZhbHVlIGlzIG1lYW5pbmdsZXNzIGFuZCB3ZSBzaG91
bGQgYXNzdW1lIG1heCBicmlnaHRuZXNzCj4gKwkgKi8KPiArCWlmICghKGNvbnRyb2xfcmVnICYg
RFBfRURQX0JBQ0tMSUdIVF9DT05UUk9MX01PREVfRFBDRCkpCj4gKwkJcmV0dXJuIGNvbm5lY3Rv
ci0+cGFuZWwuYmFja2xpZ2h0Lm1heDsKCkl0J3Mgbm90IGp1c3QgYSBiaXQsIEkgdGhpbmsgeW91
IG5lZWQgdG8gY2hlY2sgKGNvbnRyb2xfcmVnICYgbWFzaykgPT0KdmFsdWUuCgpCUiwKSmFuaS4K
Cj4gKwo+ICAJaWYgKGRybV9kcF9kcGNkX3JlYWQoJmludGVsX2RwLT5hdXgsIERQX0VEUF9CQUNL
TElHSFRfQlJJR0hUTkVTU19NU0IsCj4gIAkJCSAgICAgJnJlYWRfdmFsLCBzaXplb2YocmVhZF92
YWwpKSA8IDApIHsKPiAgCQlEUk1fREVCVUdfS01TKCJGYWlsZWQgdG8gcmVhZCBEUENEIHJlZ2lz
dGVyIDB4JXhcbiIsCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNz
IENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
