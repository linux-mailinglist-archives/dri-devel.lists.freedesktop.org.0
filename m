Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46CE6CD65
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 13:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FB86E36D;
	Thu, 18 Jul 2019 11:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698436E36D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 11:31:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 04:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="158757384"
Received: from lelicken-mobl1.ger.corp.intel.com (HELO [10.249.33.88])
 ([10.249.33.88])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2019 04:31:31 -0700
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org
References: <20190718111339.25126-1-david1.zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <3bef64d0-97be-6aed-aa10-7a4592e7fb54@intel.com>
Date: Thu, 18 Jul 2019 14:31:31 +0300
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
VkFMOwo+ICsJCXJldCA9IC1FTk9UQkxLOwo+ICAgCX0KPiAgIAo+ICAgCWlmICghKGZsYWdzICYg
RFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQpKQo+IEBAIC04MzIsNyArODMy
LDcgQEAgc3RhdGljIHNpZ25lZCBsb25nIGRybV9zeW5jb2JqX2FycmF5X3dhaXRfdGltZW91dChz
dHJ1Y3QgZHJtX3N5bmNvYmogKipzeW5jb2JqcywKPiAgIAkJCWlmIChmbGFncyAmIERSTV9TWU5D
T0JKX1dBSVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUKSB7Cj4gICAJCQkJY29udGludWU7Cj4gICAJ
CQl9IGVsc2Ugewo+IC0JCQkJdGltZW91dCA9IC1FSU5WQUw7Cj4gKwkJCQl0aW1lb3V0ID0gLUVO
T1RCTEs7Cj4gICAJCQkJZ290byBjbGVhbnVwX2VudHJpZXM7Cj4gICAJCQl9Cj4gICAJCX0KCgpU
aGlzIHdvdWxkIGJyZWFrIGV4aXN0aW5nIHRlc3RzIGZvciBiaW5hcnkgc3luY29ianMuCgpJcyB0
aGlzIHJlYWxseSB3aGF0IHdlIHdhbnQ/CgoKLUxpb25lbAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
