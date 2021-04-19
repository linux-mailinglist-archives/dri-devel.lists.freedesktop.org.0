Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC6E3645D1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 16:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8136E3D3;
	Mon, 19 Apr 2021 14:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC7B6E364;
 Mon, 19 Apr 2021 14:16:58 +0000 (UTC)
IronPort-SDR: 4V9Y7uwH2S7+GBmAhKHc9o1L+2YHrRN7KFVIPGmsiRD+Q5CQfG6hSzmMsyO3pf2a4vNj+rmWS9
 V3aUJ6U5O7pA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195362754"
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="195362754"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 07:16:56 -0700
IronPort-SDR: IaGQzpfJzOQawjEqiA6LOtoLKSpeU72NbrpcPdBFP3Q8sDA/Jsggqqz5Qa0Qhe961dvsz2sI1E
 7TYy0JFKHPnw==
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; d="scan'208";a="383750147"
Received: from ongshuph-mobl.gar.corp.intel.com (HELO [10.214.164.79])
 ([10.214.164.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 07:16:52 -0700
Subject: Re: [Intel-gfx] [PATCH 12/19] drm/i915/lmem: Bypass aperture when
 lmem is available
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-13-matthew.auld@intel.com>
 <f2b2b40a-309c-a86b-7ddb-0761f7ee6dc0@linux.intel.com>
 <30d80560-f4ab-b20b-b80c-ca1e22128d26@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <a8ffc582-e5d2-1d7f-44a0-c9bfd714f0fa@linux.intel.com>
Date: Mon, 19 Apr 2021 15:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <30d80560-f4ab-b20b-b80c-ca1e22128d26@intel.com>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org,
 Chris P Wilson <chris.p.wilson@intel.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDE2LzA0LzIwMjEgMTU6MjUsIE1hdHRoZXcgQXVsZCB3cm90ZToKPiBPbiAxNC8wNC8yMDIx
IDE2OjMzLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPj4KPj4gT24gMTIvMDQvMjAyMSAxMDowNSwg
TWF0dGhldyBBdWxkIHdyb3RlOgo+Pj4gRnJvbTogQW51c2hhIFNyaXZhdHNhIDxhbnVzaGEuc3Jp
dmF0c2FAaW50ZWwuY29tPgo+Pj4KPj4+IEluIHRoZSBzY2VuYXJpbyB3aGVyZSBsb2NhbCBtZW1v
cnkgaXMgYXZhaWxhYmxlLCB3ZSBoYXZlCj4+PiByZWx5IG9uIENQVSBhY2Nlc3MgdmlhIGxtZW0g
ZGlyZWN0bHkgaW5zdGVhZCBvZiBhcGVydHVyZS4KPj4+Cj4+PiB2MjoKPj4+IGdtY2ggaXMgb25s
eSByZWxldmFudCBmb3IgbXVjaCBvbGRlciBodywgdGhlcmVmb3JlIHdlIGNhbiBkcm9wIHRoZQo+
Pj4gaGFzX2FwZXJ0dXJlIGNoZWNrIHNpbmNlIGl0IHNob3VsZCBhbHdheXMgYmUgcHJlc2VudCBv
biBzdWNoIHBsYXRmb3Jtcy4KPj4+IChDaHJpcykKPj4+Cj4+PiBDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPj4+IENjOiBEaGluYWthcmFuIFBhbmRp
eWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPj4+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+Pj4gQ2M6IENocmlzIFAg
V2lsc29uIDxjaHJpcy5wLndpbHNvbkBpbnRlbC5jb20+Cj4+PiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4+PiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMu
bGFodGluZW5AbGludXguaW50ZWwuY29tPgo+Pj4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8g
PGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4+PiBDYzogQ1EgVGFuZyA8Y3EudGFu
Z0BpbnRlbC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5z
cml2YXRzYUBpbnRlbC5jb20+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZmJkZXYuYyB8IDIyICsrKysrKysrKysrKysrKy0tLS0tLS0KPj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9sbWVtLmPCoMKgIHwgMTUgKysrKysrKysr
KysrKysrCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbG1lbS5owqDC
oCB8wqAgNSArKysrKwo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxOSArKysrKysrKysrKysrLS0tLS0tCj4+PiDCoCA0IGZpbGVz
IGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMgCj4+PiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYwo+Pj4gaW5kZXggMmIz
Nzk1OWRhNzQ3Li40YWY0MDIyOWY1ZWMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYwo+Pj4gQEAgLTEzOSwxNCArMTM5LDIyIEBAIHN0YXRpYyBp
bnQgaW50ZWxmYl9hbGxvYyhzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAKPj4+ICpoZWxwZXIsCj4+PiDC
oMKgwqDCoMKgIHNpemUgPSBtb2RlX2NtZC5waXRjaGVzWzBdICogbW9kZV9jbWQuaGVpZ2h0Owo+
Pj4gwqDCoMKgwqDCoCBzaXplID0gUEFHRV9BTElHTihzaXplKTsKPj4+IC3CoMKgwqAgLyogSWYg
dGhlIEZCIGlzIHRvbyBiaWcsIGp1c3QgZG9uJ3QgdXNlIGl0IHNpbmNlIGZiZGV2IGlzIG5vdCB2
ZXJ5Cj4+PiAtwqDCoMKgwqAgKiBpbXBvcnRhbnQgYW5kIHdlIHNob3VsZCBwcm9iYWJseSB1c2Ug
dGhhdCBzcGFjZSB3aXRoIEZCQyBvciAKPj4+IG90aGVyCj4+PiAtwqDCoMKgwqAgKiBmZWF0dXJl
cy4gKi8KPj4+IMKgwqDCoMKgwqAgb2JqID0gRVJSX1BUUigtRU5PREVWKTsKPj4+IC3CoMKgwqAg
aWYgKHNpemUgKiAyIDwgZGV2X3ByaXYtPnN0b2xlbl91c2FibGVfc2l6ZSkKPj4+IC3CoMKgwqDC
oMKgwqDCoCBvYmogPSBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihkZXZfcHJpdiwgc2l6
ZSk7Cj4+PiAtwqDCoMKgIGlmIChJU19FUlIob2JqKSkKPj4+IC3CoMKgwqDCoMKgwqDCoCBvYmog
PSBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3NobWVtKGRldl9wcml2LCBzaXplKTsKPj4+ICvCoMKg
wqAgaWYgKEhBU19MTUVNKGRldl9wcml2KSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIG9iaiA9IGk5
MTVfZ2VtX29iamVjdF9jcmVhdGVfbG1lbShkZXZfcHJpdiwgc2l6ZSwKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJOTE1X0JPX0FMTE9DX0NP
TlRJR1VPVVMpOwo+Pgo+PiBIYXMgdG8gYmUgY29udGlndW91cz8gUXVlc3Rpb24gZm9yIGRpc3Bs
YXkgZXhwZXJ0cyBJIGd1ZXNzLgo+Pgo+PiBbQ29tZXMgYmFjayBsYXRlci5dIEFoIGZvciBpb21h
cD8gUHV0IGEgY29tbWVudCB0byB0aGF0IGVmZmVjdCBwZXJoYXBzPwo+IAo+IEkgZG9uJ3QgdGhp
bmsgaXQgaGFzIHRvIGJlLCBzaW5jZSB3ZSBjb3VsZCBpbiB0aGVvcnkganVzdCB1c2UgcGluX21h
cCgpIAo+IHVuZGVybmVhdGgsIHdoaWNoIGNhbiBhbHJlYWR5IGRlYWwgd2l0aCBub24tY29udGln
dW91cyBjaHVua3Mgb2YgbG1lbSwgCj4gYWx0aG91Z2ggdGhhdCBtaWdodCBicmluZyBpbiB3dyBs
b2NraW5nLiBJIHRoaW5rIGZvciBub3cganVzdCBhZGQgYSAKPiBjb21tZW50IGFuZCBtYXJrIHRo
aXMgYXMgWFhYLCBhbmQgcG90ZW50aWFsbHkgcmV2aXNpdCBhcyBmb2xsb3cgdXA/CgpTdXJlLgoK
UmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpS
ZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
