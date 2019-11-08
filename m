Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D20F5275
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 18:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619406FA26;
	Fri,  8 Nov 2019 17:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9126FA26;
 Fri,  8 Nov 2019 17:20:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Nov 2019 09:20:17 -0800
X-IronPort-AV: E=Sophos;i="5.68,282,1569308400"; d="scan'208";a="193224588"
Received: from jkrzyszt-desk.igk.intel.com (HELO
 jkrzyszt-desk.ger.corp.intel.com) ([172.22.244.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Nov 2019 09:20:13 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: [RESEND PATCH 1/3] drm/i915/dmabuf: Implement pwrite() callback
Date: Fri, 08 Nov 2019 18:20:04 +0100
Message-ID: <2352014.aE0AnA4Fr9@jkrzyszt-desk.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20191105142755.GI10326@phenom.ffwll.local>
References: <20191031082958.10755-1-janusz.krzysztofik@linux.intel.com>
 <20191105142755.GI10326@phenom.ffwll.local>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org,
 Piotr =?ISO-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWVzZGF5LCBOb3ZlbWJlciA1LCAyMDE5IDM6Mjc6NTUgUE0gQ0VUIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDk6Mjk6NTZBTSArMDEwMCwg
SmFudXN6IEtyenlzenRvZmlrIHdyb3RlOgo+ID4gV2UgbmVlZCBkbWFidWYgc3BlY2lmaWMgcHdy
aXRlKCkgY2FsbGJhY2sgdXRpbGl6aW5nIGRtYS1idWYgQVBJLAo+ID4gb3RoZXJ3aXNlIEdFTV9Q
V1JJVEUgSU9DVEwgd2lsbCBubyBsb25nZXIgd29yayB3aXRoIGRtYS1idWYgYmFja2VkCj4gPiAo
aS5lLiwgUFJJTUUgaW1wb3J0ZWQpIG9iamVjdHMgb24gaGFyZHdhcmUgd2l0aCBubyBtYXBwYWJs
ZSBhcGVydHVyZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFudXN6IEtyenlzenRvZmlrIDxq
YW51c3oua3J6eXN6dG9maWtAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gPiBDYzogTWljaGFs
IFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+Cj4gCj4gRG8gd2UgaGF2ZSB1
c2Vyc3BhY2UgZm9yIHRoaXMgKGFzaWRlIGZyb20gaWd0cyk/IFNwZWNpZmljYWxseSBmb3IgdGhl
Cj4gZ2VuMTIgKyBkbWEtYnVmIGltcG9ydCArIHB3cml0ZS9yZWFkL3doYXRldmVyIGNhc2UgeW91
J3JlIGZpeGluZyBpbiB0aGlzCj4gc2VyaWVzIGhlcmUuCgpJJ3ZlIGRpc2N1c3NlZCB0aGF0IG9u
IElSQyB3aXRoIERhbmllbCBhbmQgQ2hyaXMsIGl0IGxvb2tzIGxpa2UgCkk5MTVfR0VNX1BSRUFE
L1BXUklURSBJT0NUTCBzdXBwb3J0IGlzIHByb3ZpZGVkIG9uIFBSSU1FIGltcG9ydGVkIGRtYS1i
dWYgCm9iamVjdHMgbWFpbmx5IGZvciBjb21wbGV0ZW5lc3Mgb2YgdGhlIHVBUEksIHVzZWZ1bCBm
b3IgbXVsdGktZGV2aWNlIHRlc3RzLiAgClRoZXJlIHdlcmUgY29uY2x1c2lvbnMgd2Ugc2hvdWxk
IGFzayBEYXZlIGFuZCBKb25hcyBmb3IgdGhlaXIgcG9zaXRpb24gaWYgdGhhdCAKc3VwcG9ydCBz
aG91bGQgc3RpbGwgYmUgcHJvdmlkZWQgKGFuZCBmaXhlZCBmb3IgdGhlIG5vIG1hcHBhYmxlIGFw
ZXJ0dXJlIGNhc2UpIApvciBtYXliZSBkcm9wcGVkIGFzIG5vdCB1c2VkIChhbmQgcmVsYXRlZCAo
c3ViKXRlc3RzIGFsc28gZHJvcHBlZCkuCgpEYXZlLCBKb25hcywgY291bGQgeW91IHBsZWFzZSBn
aXZlIHlvdXIgY29tbWVudHM/CgpUaGFua3MsCkphbnVzegoKCj4gLURhbmllbAo+IAo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jIHwgNTUgKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCsp
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
ZG1hYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vCmk5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jCj4g
PiBpbmRleCA5NmNlOTVjOGFjNWEuLjkzZWVhMTAzMWM4MiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jCj4gPiBAQCAtMjQ4LDkgKzI0OCw2NCBA
QCBzdGF0aWMgdm9pZCBpOTE1X2dlbV9vYmplY3RfcHV0X3BhZ2VzX2RtYWJ1ZihzdHJ1Y3QgCmRy
bV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKPiA+ICAJCQkJIERNQV9CSURJUkVDVElPTkFMKTsKPiA+
ICB9Cj4gPiAgCj4gPiArc3RhdGljIGludCBpOTE1X2dlbV9vYmplY3RfcHdyaXRlX2RtYWJ1Zihz
dHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAo+ID4gKwkJCQkJIGNvbnN0IHN0cnVjdCAK
ZHJtX2k5MTVfZ2VtX3B3cml0ZSAqYXJncykKPiA+ICt7Cj4gPiArCXN0cnVjdCBkbWFfYnVmICpk
bWFidWYgPSBvYmotPmJhc2UuaW1wb3J0X2F0dGFjaC0+ZG1hYnVmOwo+ID4gKwl2b2lkIF9fdXNl
ciAqdXNlcl9kYXRhID0gdTY0X3RvX3VzZXJfcHRyKGFyZ3MtPmRhdGFfcHRyKTsKPiA+ICsJc3Ry
dWN0IGZpbGUgKmZpbGUgPSBkbWFidWYtPmZpbGU7Cj4gPiArCWNvbnN0IHN0cnVjdCBmaWxlX29w
ZXJhdGlvbnMgKmZvcCA9IGZpbGUtPmZfb3A7Cj4gPiArCXZvaWQgX19mb3JjZSAqdmFkZHI7Cj4g
PiArCWludCByZXQ7Cj4gPiArCj4gPiArCWlmIChmb3AtPndyaXRlKSB7Cj4gPiArCQlsb2ZmX3Qg
b2Zmc2V0ID0gYXJncy0+b2Zmc2V0Owo+ID4gKwo+ID4gKwkJLyoKPiA+ICsJCSAqIGZvcC0+d3Jp
dGUoKSBpcyBzdXBwb3NlZCB0byBjYWxsIApkbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3MoKQo+ID4g
KwkJICogaWYgT19TWU5DIGZsYWcgaXMgc2V0LCBhdm9pZCBjYWxsaW5nIGl0IHR3aWNlCj4gPiAr
CQkgKi8KPiA+ICsJCWlmICghKGZpbGUtPmZfZmxhZ3MgJiBPX1NZTkMpKSB7Cj4gPiArCQkJcmV0
ID0gZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKGRtYWJ1ZiwgCkRNQV9UT19ERVZJQ0UpOwo+ID4g
KwkJCWlmIChyZXQpCj4gPiArCQkJCXJldHVybiByZXQ7Cj4gPiArCQl9Cj4gPiArCj4gPiArCQly
ZXQgPSBmb3AtPndyaXRlKGZpbGUsIHVzZXJfZGF0YSwgYXJncy0+c2l6ZSwgJm9mZnNldCk7Cj4g
PiArCj4gPiArCQlpZiAoIShmaWxlLT5mX2ZsYWdzICYgT19TWU5DKSkKPiA+ICsJCQlkbWFfYnVm
X2VuZF9jcHVfYWNjZXNzKGRtYWJ1ZiwgCkRNQV9UT19ERVZJQ0UpOwo+ID4gKwo+ID4gKwkJaWYg
KCFyZXQpCj4gPiArCQkJcmV0dXJuIDA7Cj4gPiArCX0KPiA+ICsKPiA+ICsJLyogZG1hLWJ1ZiBm
aWxlIC53cml0ZSgpIG5vdCBzdXBwb3J0ZWQgb3IgZmFpbGVkLCB0cnkgCmRtYV9idWZfdm1hcCgp
ICovCj4gPiArCXJldCA9IGRtYV9idWZfYmVnaW5fY3B1X2FjY2VzcyhkbWFidWYsIERNQV9UT19E
RVZJQ0UpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsJdmFk
ZHIgPSBkbWFfYnVmX3ZtYXAoZG1hYnVmKTsKPiA+ICsJaWYgKCF2YWRkcikKPiA+ICsJCWdvdG8g
b3V0X2VycjsKPiA+ICsKPiA+ICsJcmV0ID0gY29weV9mcm9tX3VzZXIodmFkZHIgKyBhcmdzLT5v
ZmZzZXQsIHVzZXJfZGF0YSwgYXJncy0+c2l6ZSk7Cj4gPiArCWRtYV9idWZfdnVubWFwKGRtYWJ1
ZiwgdmFkZHIpOwo+ID4gKwlpZiAoIXJldCkKPiA+ICsJCWdvdG8gb3V0X2VuZDsKPiA+ICsKPiA+
ICtvdXRfZXJyOgo+ID4gKwkvKiBmYWxsIGJhY2sgdG8gR1RUIG1hcHBpbmcgKi8KPiA+ICsJcmV0
ID0gLUVOT0RFVjsKPiA+ICtvdXRfZW5kOgo+ID4gKwlkbWFfYnVmX2VuZF9jcHVfYWNjZXNzKGRt
YWJ1ZiwgRE1BX1RPX0RFVklDRSk7Cj4gPiArCXJldHVybiByZXQ7Cj4gPiArfQo+ID4gKwo+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdF9vcHMgaTkxNV9nZW1fb2Jq
ZWN0X2RtYWJ1Zl9vcHMgPSAKewo+ID4gIAkuZ2V0X3BhZ2VzID0gaTkxNV9nZW1fb2JqZWN0X2dl
dF9wYWdlc19kbWFidWYsCj4gPiAgCS5wdXRfcGFnZXMgPSBpOTE1X2dlbV9vYmplY3RfcHV0X3Bh
Z2VzX2RtYWJ1ZiwKPiA+ICsJLnB3cml0ZSA9IGk5MTVfZ2VtX29iamVjdF9wd3JpdGVfZG1hYnVm
LAo+ID4gIH07Cj4gPiAgCj4gPiAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICppOTE1X2dlbV9wcmlt
ZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAKPiAKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
