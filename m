Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624EFB6306
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 14:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694CE6EF14;
	Wed, 18 Sep 2019 12:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC166EF14
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 12:24:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 05:24:06 -0700
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; d="scan'208";a="387898031"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 05:24:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/7] drm: add drm_print_bits
In-Reply-To: <20190904054740.20817-2-kraxel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190904054740.20817-1-kraxel@redhat.com>
 <20190904054740.20817-2-kraxel@redhat.com>
Date: Wed, 18 Sep 2019 15:24:01 +0300
Message-ID: <87sgotx066.fsf@intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwNCBTZXAgMjAxOSwgR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+IHdy
b3RlOgo+IE5ldyBoZWxwZXIgdG8gcHJpbnQgbmFtZWQgYml0cyBvZiBzb21lIHZhbHVlICh0aGlu
ayBmbGFncyBmaWVsZHMpLgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9wcmludC5oICAgICB8ICAzICsr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMgfCAzMyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJp
bnQuaAo+IGluZGV4IDExMjE2NWQzMTk1ZC4uMTJkNDkxNjI1NGI0IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9wcmludC5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPiBA
QCAtODksNiArODksOSBAQCBfX3ByaW50ZigyLCAzKQo+ICB2b2lkIGRybV9wcmludGYoc3RydWN0
IGRybV9wcmludGVyICpwLCBjb25zdCBjaGFyICpmLCAuLi4pOwo+ICB2b2lkIGRybV9wdXRzKHN0
cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hhciAqc3RyKTsKPiAgdm9pZCBkcm1fcHJpbnRf
cmVnc2V0MzIoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgZGVidWdmc19yZWdzZXQzMiAq
cmVnc2V0KTsKPiArdm9pZCBkcm1fcHJpbnRfYml0cyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsCj4g
KwkJICAgIHVuc2lnbmVkIGxvbmcgdmFsdWUsIGNvbnN0IGNoYXIgKmJpdHNbXSwKPiArCQkgICAg
dW5zaWduZWQgaW50IGZyb20sIHVuc2lnbmVkIGludCB0byk7Cj4gIAo+ICBfX3ByaW50ZigyLCAw
KQo+ICAvKioKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9wcmludC5jCj4gaW5kZXggYWQzMDJkNzFlZWVlLi5kZmEyNzM2N2Vi
YjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9wcmludC5jCj4gQEAgLTE4NSw2ICsxODUsMzkgQEAgdm9pZCBkcm1f
cHJpbnRmKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hhciAqZiwgLi4uKQo+ICB9Cj4g
IEVYUE9SVF9TWU1CT0woZHJtX3ByaW50Zik7Cj4gIAo+ICsvKioKPiArICogZHJtX3ByaW50X2Jp
dHMgLSBwcmludCBiaXRzIHRvIGEgJmRybV9wcmludGVyIHN0cmVhbQo+ICsgKgo+ICsgKiBQcmlu
dCBiaXRzIChpbiBmbGFnIGZpZWxkcyBmb3IgZXhhbXBsZSkgaW4gaHVtYW4gcmVhZGFibGUgZm9y
bS4KPiArICogVGhlIGZpcnN0IG5hbWUgaW4gdGhlIEBiaXRzIGFycmF5IGlzIGZvciB0aGUgYml0
IGluZGV4ZWQgYnkgQGZyb20uCj4gKyAqCj4gKyAqIEBwOiB0aGUgJmRybV9wcmludGVyCj4gKyAq
IEB2YWx1ZTogZmllbGQgdmFsdWUuCj4gKyAqIEBiaXRzOiBBcnJheSB3aXRoIGJpdCBuYW1lcy4K
PiArICogQGZyb206IHN0YXJ0IG9mIGJpdCByYW5nZSB0byBwcmludCAoaW5jbHVzaXZlKS4KPiAr
ICogQHRvOiBlbmQgb2YgYml0IHJhbmdlIHRvIHByaW50IChleGNsdXNpdmUpLgo+ICsgKi8KPiAr
dm9pZCBkcm1fcHJpbnRfYml0cyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsCj4gKwkJICAgIHVuc2ln
bmVkIGxvbmcgdmFsdWUsIGNvbnN0IGNoYXIgKmJpdHNbXSwKPiArCQkgICAgdW5zaWduZWQgaW50
IGZyb20sIHVuc2lnbmVkIGludCB0bykKPiArewo+ICsJYm9vbCBmaXJzdCA9IHRydWU7Cj4gKwl1
bnNpZ25lZCBpbnQgaTsKPiArCj4gKwlmb3IgKGkgPSBmcm9tOyBpIDwgdG87IGkrKykgewo+ICsJ
CWlmICghKHZhbHVlICYgKDEgPDwgaSkpKQo+ICsJCQljb250aW51ZTsKCmZvcl9lYWNoX3NldF9i
aXQgZnJvbSBiaXRvcHMuaD8KCj4gKwkJaWYgKFdBUk5fT05fT05DRSghYml0c1tpLWZyb21dKSkK
PiArCQkJY29udGludWU7Cj4gKwkJZHJtX3ByaW50ZihwLCAiJXMlcyIsIGZpcnN0ID8gIiIgOiAi
LCIsCj4gKwkJCSAgIGJpdHNbaS1mcm9tXSk7CgpJIHdvbmRlciBhYm91dCB0aGUgdXNlZnVsbmVz
cyBvZiBmcm9tIGFuZCB0bywgYXMgd2VsbCBhcyBpbmRleGluZwooaS1mcm9tKSBmb3IgdGhlIHN0
cmluZ3MuCgpUbyBsaW1pdCB0aGUgdmFsdWVzIHRvIGJlIHByaW50ZWQgaW4gYSBtb3JlIGdlbmVy
YWwgd2F5IHRoYW4gcmFuZ2UsIHlvdQpjYW4gdXNlOgoKCWRybV9wcmludF9iaXRzKHAsIHZhbHVl
ICYgR0VOTUFTSyhoLCBsKSwgYml0cyk7CgpBbmQgb2J2aW91c2x5IHRvIGFkanVzdCB0aGUgc3Rh
cnRpbmcgcG9zaXRpb246CgoJZHJtX3ByaW50X2JpdHMocCwgdmFsdWUgPj4gbCwgYml0cyk7CgpT
ZWVtcyBsaWtlIGEgc2ltcGxlIGxlbiBwYXJhbWV0ZXIgdG8gaW5kaWNhdGUgdGhlIEFSUkFZX1NJ
WkUoKSBvZiBiaXRzCndvdWxkIGJlIG1vcmUgc3RyYWlnaGZvcndhcmQgdG8gZ3VhcmQgYWdhaW5z
dCBhcnJheSBvdmVyZmxvdy4KCglkcm1fcHJpbnRfYml0cyhwLCB2YWx1ZSwgYml0cywgQVJSQVlf
U0laRShiaXRzKSk7CgoKQlIsCkphbmkuCgoKPiArCQlmaXJzdCA9IGZhbHNlOwo+ICsJfQo+ICsJ
aWYgKGZpcnN0KQo+ICsJCWRybV9wcmludGYocCwgIihub25lKSIpOwo+ICt9Cj4gK0VYUE9SVF9T
WU1CT0woZHJtX3ByaW50X2JpdHMpOwo+ICsKPiAgdm9pZCBkcm1fZGV2X3ByaW50ayhjb25zdCBz
dHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmxldmVsLAo+ICAJCSAgICBjb25zdCBjaGFy
ICpmb3JtYXQsIC4uLikKPiAgewoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
