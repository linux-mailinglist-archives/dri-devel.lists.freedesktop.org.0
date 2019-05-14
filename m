Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80D1C643
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 11:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D196891F4;
	Tue, 14 May 2019 09:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C14A891AC;
 Tue, 14 May 2019 09:43:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 02:43:23 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.103.238.204]) ([10.103.238.204])
 by orsmga005.jf.intel.com with ESMTP; 14 May 2019 02:43:22 -0700
Subject: Re: [PATCH libdrm 2/7] add timeline wait/query ioctl v2
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20190513095305.14110-1-david1.zhou@amd.com>
 <20190513095305.14110-2-david1.zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <77fddad5-5da8-a7b9-34e3-3a27ceae5e05@intel.com>
Date: Tue, 14 May 2019 10:43:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513095305.14110-2-david1.zhou@amd.com>
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
Cc: Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDUvMjAxOSAxMDo1MywgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiB2MjogZHJvcCBleHBv
cnQvaW1wb3J0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBh
bWQuY29tPgo+IC0tLQo+ICAgeGY4NmRybS5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgIHhmODZkcm0uaCB8ICA2ICsrKysrKwo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEveGY4NmRybS5jIGIv
eGY4NmRybS5jCj4gaW5kZXggMmMxOTM3NmIuLjE3ZTNkODgwIDEwMDY0NAo+IC0tLSBhL3hmODZk
cm0uYwo+ICsrKyBiL3hmODZkcm0uYwo+IEBAIC00MjU2LDMgKzQyNTYsNDcgQEAgZHJtX3B1Ymxp
YyBpbnQgZHJtU3luY29ialNpZ25hbChpbnQgZmQsIGNvbnN0IHVpbnQzMl90ICpoYW5kbGVzLAo+
ICAgICAgIHJldCA9IGRybUlvY3RsKGZkLCBEUk1fSU9DVExfU1lOQ09CSl9TSUdOQUwsICZhcmdz
KTsKPiAgICAgICByZXR1cm4gcmV0Owo+ICAgfQo+ICsKPiArZHJtX3B1YmxpYyBpbnQgZHJtU3lu
Y29ialRpbWVsaW5lV2FpdChpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9p
bnRzLAo+ICsJCQkJICAgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMsCj4gKwkJCQkgICAgICBpbnQ2
NF90IHRpbWVvdXRfbnNlYywgdW5zaWduZWQgZmxhZ3MsCj4gKwkJCQkgICAgICB1aW50MzJfdCAq
Zmlyc3Rfc2lnbmFsZWQpCj4gK3sKPiArICAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV93
YWl0IGFyZ3M7Cj4gKyAgICBpbnQgcmV0Owo+ICsKPiArICAgIG1lbWNsZWFyKGFyZ3MpOwo+ICsg
ICAgYXJncy5oYW5kbGVzID0gKHVpbnRwdHJfdCloYW5kbGVzOwo+ICsgICAgYXJncy5wb2ludHMg
PSAodWludDY0X3QpKHVpbnRwdHJfdClwb2ludHM7CgoKSSBkb24ndCB0aGluayB5b3UgbmVlZCB0
aG9zZSB1aW50cHRyX3QgLT4gdWludDY0X3QgY2FzdHMuCgoKPiArICAgIGFyZ3MudGltZW91dF9u
c2VjID0gdGltZW91dF9uc2VjOwo+ICsgICAgYXJncy5jb3VudF9oYW5kbGVzID0gbnVtX2hhbmRs
ZXM7Cj4gKyAgICBhcmdzLmZsYWdzID0gZmxhZ3M7Cj4gKwo+ICsgICAgcmV0ID0gZHJtSW9jdGwo
ZmQsIERSTV9JT0NUTF9TWU5DT0JKX1RJTUVMSU5FX1dBSVQsICZhcmdzKTsKPiArICAgIGlmIChy
ZXQgPCAwKQo+ICsgICAgICAgIHJldHVybiAtZXJybm87Cj4gKwo+ICsgICAgaWYgKGZpcnN0X3Np
Z25hbGVkKQo+ICsgICAgICAgICpmaXJzdF9zaWduYWxlZCA9IGFyZ3MuZmlyc3Rfc2lnbmFsZWQ7
Cj4gKyAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICsKPiArZHJtX3B1YmxpYyBpbnQgZHJtU3lu
Y29ialF1ZXJ5KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCj4g
KwkJCSAgICAgICB1aW50MzJfdCBoYW5kbGVfY291bnQpCj4gK3sKPiArICAgIHN0cnVjdCBkcm1f
c3luY29ial90aW1lbGluZV9hcnJheSBhcmdzOwo+ICsgICAgaW50IHJldDsKPiArCj4gKyAgICBt
ZW1jbGVhcihhcmdzKTsKPiArICAgIGFyZ3MuaGFuZGxlcyA9ICh1aW50cHRyX3QpaGFuZGxlczsK
PiArICAgIGFyZ3MucG9pbnRzID0gKHVpbnQ2NF90KSh1aW50cHRyX3QpcG9pbnRzOwoKClNhbWUg
aGVyZS4KCgo+ICsgICAgYXJncy5jb3VudF9oYW5kbGVzID0gaGFuZGxlX2NvdW50Owo+ICsKPiAr
ICAgIHJldCA9IGRybUlvY3RsKGZkLCBEUk1fSU9DVExfU1lOQ09CSl9RVUVSWSwgJmFyZ3MpOwo+
ICsgICAgaWYgKHJldCkKPiArICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgcmV0dXJuIDA7Cj4g
K30KPiArCj4gKwo+IGRpZmYgLS1naXQgYS94Zjg2ZHJtLmggYi94Zjg2ZHJtLmgKPiBpbmRleCA4
ODdlY2M3Ni4uNjBjN2E4NGYgMTAwNjQ0Cj4gLS0tIGEveGY4NmRybS5oCj4gKysrIGIveGY4NmRy
bS5oCj4gQEAgLTg3Niw2ICs4NzYsMTIgQEAgZXh0ZXJuIGludCBkcm1TeW5jb2JqV2FpdChpbnQg
ZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1bnNpZ25lZCBudW1faGFuZGxlcywKPiAgIAkJCSAgdWlu
dDMyX3QgKmZpcnN0X3NpZ25hbGVkKTsKPiAgIGV4dGVybiBpbnQgZHJtU3luY29ialJlc2V0KGlu
dCBmZCwgY29uc3QgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQzMl90IGhhbmRsZV9jb3VudCk7Cj4g
ICBleHRlcm4gaW50IGRybVN5bmNvYmpTaWduYWwoaW50IGZkLCBjb25zdCB1aW50MzJfdCAqaGFu
ZGxlcywgdWludDMyX3QgaGFuZGxlX2NvdW50KTsKPiArZXh0ZXJuIGludCBkcm1TeW5jb2JqVGlt
ZWxpbmVXYWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCj4g
KwkJCQkgIHVuc2lnbmVkIG51bV9oYW5kbGVzLAo+ICsJCQkJICBpbnQ2NF90IHRpbWVvdXRfbnNl
YywgdW5zaWduZWQgZmxhZ3MsCj4gKwkJCQkgIHVpbnQzMl90ICpmaXJzdF9zaWduYWxlZCk7Cj4g
K2V4dGVybiBpbnQgZHJtU3luY29ialF1ZXJ5KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVp
bnQ2NF90ICpwb2ludHMsCj4gKwkJCSAgIHVpbnQzMl90IGhhbmRsZV9jb3VudCk7Cj4gICAKPiAg
ICNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQo+ICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
