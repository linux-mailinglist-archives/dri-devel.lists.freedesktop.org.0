Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0686FB93
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 10:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801F8981D;
	Mon, 22 Jul 2019 08:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6F38981D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:46:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 01:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,294,1559545200"; d="scan'208";a="159815768"
Received: from unknown (HELO [10.252.50.208]) ([10.252.50.208])
 by orsmga007.jf.intel.com with ESMTP; 22 Jul 2019 01:46:36 -0700
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org
References: <20190718111339.25126-1-david1.zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <79b2a068-412c-55ae-e094-14b9912b3e68@intel.com>
Date: Mon, 22 Jul 2019 11:46:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718111339.25126-1-david1.zhou@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDcvMjAxOSAxNDoxMywgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiBpZiBXQUlUX0ZPUl9T
VUJNSVQgaXNuJ3Qgc2V0IGFuZCBpbiB0aGUgbWVhbndoaWxlIG5vIHVuZGVybHlpbmcgZmVuY2Ug
b24gc3luY29iaiwKPiB0aGVuIHJldHVybiBub24tYmxvY2sgZXJyb3IgY29kZSB0byB1c2VyIHNh
cGNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgNCArKy0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9zeW5jb2JqLmMKPiBpbmRleCAzNjFhMDFhMDhjMTguLjkyOWY3YzY0ZjlhMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fc3luY29iai5jCj4gQEAgLTI1Miw3ICsyNTIsNyBAQCBpbnQgZHJtX3N5bmNvYmpfZmlu
ZF9mZW5jZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdmF0ZSwKPiAgIAkJCXJldHVybiAwOwo+
ICAgCQlkbWFfZmVuY2VfcHV0KCpmZW5jZSk7Cj4gICAJfSBlbHNlIHsKPiAtCQlyZXQgPSAtRUlO
VkFMOwo+ICsJCXJldCA9IC1FTk9UQkxLOwoKClRoaXMgd2lsbCBvbmx5IHJldHVybiB0aGUgbmV3
IGVycm9yIHdoZW4gdGhlcmUgaXMgbm8gY2hhaW4gZmVuY2UgaW4gdGhlIApzeW5jb2JqPwoKRG9u
J3QgeW91IHdhbnQgdGhlIG5ldyBlcnJvciBjb2RlIGFmdGVyIGRtYV9mZW5jZV9jaGFpbl9maW5k
X3NlcW5vKCkgdG9vPwoKCldoaWNoIG1ha2UgbWUgcmVhbGl6ZSB0aGVyZSBpcyBwcm9iYWJseSBh
IGJ1ZyB3aXRoIHRoaXMgY29kZSA6CgoKcmV0ID0gZG1hX2ZlbmNlX2NoYWluX2ZpbmRfc2Vxbm8o
ZmVuY2UsIHBvaW50KTsKaWYgKCFyZXQpCiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKZG1hX2Zl
bmNlX3B1dCgqZmVuY2UpOwoKClNvdW5kcyBsaWtlIHRoZSBjb25kaXRpb24gc2hvdWxkIGJlCgpp
ZiAocmV0KQoKIMKgwqDCoCDCoMKgwqAgcmV0dXJuIHJldDsKCgpJIHJlYWxpemUgd2UgaGF2ZSBp
bnRyb2R1Y2VkIGEgYmxvY2tpbmcgYmVoYXZpb3Igb24gdGhlIHRyYW5zZmVyIGlvY3RsLgoKSWYg
d2UncmUgZ29pbmcgdG8gY2hhbmdlIHRoaXMgdG8gcmV0dXJuIEVXT1VMREJMT0NLLCB3ZSBtaWdo
dCB3YW50IHRvIApnZXQgcmlkIG9mIGl0LgoKCi1MaW9uZWwKCgo+ICAgCX0KPiAgIAo+ICAgCWlm
ICghKGZsYWdzICYgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQpKQo+IEBA
IC04MzIsNyArODMyLDcgQEAgc3RhdGljIHNpZ25lZCBsb25nIGRybV9zeW5jb2JqX2FycmF5X3dh
aXRfdGltZW91dChzdHJ1Y3QgZHJtX3N5bmNvYmogKipzeW5jb2JqcywKPiAgIAkJCWlmIChmbGFn
cyAmIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUKSB7Cj4gICAJCQkJY29u
dGludWU7Cj4gICAJCQl9IGVsc2Ugewo+IC0JCQkJdGltZW91dCA9IC1FSU5WQUw7Cj4gKwkJCQl0
aW1lb3V0ID0gLUVOT1RCTEs7Cj4gICAJCQkJZ290byBjbGVhbnVwX2VudHJpZXM7Cj4gICAJCQl9
Cj4gICAJCX0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
