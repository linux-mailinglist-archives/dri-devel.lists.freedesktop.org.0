Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17922C31F3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 13:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3E76E60D;
	Tue,  1 Oct 2019 11:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3699C89242;
 Tue,  1 Oct 2019 11:04:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 04:04:06 -0700
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="195612547"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 04:03:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Eric Engestrom <eric@engestrom.ch>
Subject: Re: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
In-Reply-To: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
Date: Tue, 01 Oct 2019 14:03:55 +0300
Message-ID: <875zl8d8x0.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNiBTZXAgMjAxOSwgRXJpYyBFbmdlc3Ryb20gPGVyaWNAZW5nZXN0cm9tLmNoPiB3
cm90ZToKPiBPbiBUdWVzZGF5LCAyMDE5LTA5LTI0IDE1OjU4OjU2ICswMzAwLCBKYW5pIE5pa3Vs
YSB3cm90ZToKPj4gSGkgYWxsLCB2MiBvZiBbMV0sIGEgbGl0dGxlIHJlZmFjdG9yaW5nIGFyb3Vu
ZCBkcm1fZGVidWcgYWNjZXNzIHRvCj4+IGFic3RyYWN0IGl0IGJldHRlci4gVGhlcmUgc2hvdWxk
bid0IGJlIGFueSBmdW5jdGlvbmFsIGNoYW5nZXMuCj4+IAo+PiBJJ2QgYXBwcmVjaWF0ZSBhY2tz
IGZvciBtZXJnaW5nIHRoZSBsb3QgdmlhIGRybS1taXNjLiBJZiB0aGVyZSBhcmUgYW55Cj4+IG9i
amVjdGlvbnMgdG8gdGhhdCwgd2UnbGwgbmVlZCB0byBwb3N0cG9uZSB0aGUgbGFzdCBwYXRjaCB1
bnRpbAo+PiBldmVyeXRoaW5nIGhhcyBiZWVuIG1lcmdlZCBhbmQgY29udmVydGVkIGluIGRybS1u
ZXh0Lgo+PiAKPj4gQlIsCj4+IEphbmkuCj4+IAo+PiBDYzogRXJpYyBFbmdlc3Ryb20gPGVyaWMu
ZW5nZXN0cm9tQGludGVsLmNvbT4KPj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPj4gQ2M6IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNvbT4K
Pj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IENjOiBCZW4gU2tlZ2dzIDxi
c2tlZ2dzQHJlZGhhdC5jb20+Cj4+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
PiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+PiBDYzogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+Cj4+IENjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwo+PiBD
YzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBDYzogRnJhbmNpc2NvIEplcmV6
IDxjdXJyb2plcmV6QHJpc2V1cC5uZXQ+Cj4+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4KPj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51eC5v
cmcudWs+Cj4+IENjOiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwu
Y29tPgo+PiBDYzogZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gCj4+IAo+PiBbMV0g
aHR0cDovL21pZC5tYWlsLWFyY2hpdmUuY29tL2NvdmVyLjE1NjgzNzUxODkuZ2l0Lmphbmkubmlr
dWxhQGludGVsLmNvbQo+PiAKPj4gSmFuaSBOaWt1bGEgKDkpOgo+PiAgIGRybS9wcmludDogbW92
ZSBkcm1fZGVidWcgdmFyaWFibGUgdG8gZHJtX3ByaW50LltjaF0KPj4gICBkcm0vcHJpbnQ6IGFk
ZCBkcm1fZGVidWdfZW5hYmxlZCgpCj4+ICAgZHJtL2k5MTU6IHVzZSBkcm1fZGVidWdfZW5hYmxl
ZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCj4+ICAgZHJtL3ByaW50OiByZW5hbWUg
ZHJtX2RlYnVnIHRvIF9fZHJtX2RlYnVnIHRvIGRpc2NvdXJhZ2UgdXNlCj4KPiBUaGUgYWJvdmUg
Zm91ciBwYXRjaGVzIGFyZToKPiBSZXZpZXdlZC1ieTogRXJpYyBFbmdlc3Ryb20gPGVyaWNAZW5n
ZXN0cm9tLmNoPgo+Cj4gRGlkIHlvdSBjaGVjayB0byBtYWtlIHN1cmUgdGhlIGB1bmxpa2VseSgp
YCBpcyBwcm9wYWdhdGVkIGNvcnJlY3RseQo+IG91dHNpZGUgdGhlIGBkcm1fZGVidWdfZW5hYmxl
ZCgpYCBjYWxsPwoKSSBkaWQgbm93LgoKSGF2aW5nIGRybV9kZWJ1Z19lbmFibGVkKCkgYXMgYSBt
YWNybyB2cy4gYXMgYW4gaW5saW5lIGZ1bmN0aW9uIGRvZXMgbm90CnNlZW0gdG8gbWFrZSBhIGRp
ZmZlcmVuY2UsIHNvIEkgdGhpbmsgdGhlIGlubGluZSBpcyBjbGVhcmx5IHByZWZlcnJhYmxlLgoK
SG93ZXZlciwgZm9yIGV4YW1wbGUKCgl1bmxpa2VseShmb28gJiYgZHJtX2RlYnVnICYgRFJNX1VU
X0RQKQoKZG9lcyBwcm9kdWNlIGNvZGUgZGlmZmVyZW50IGZyb20KCgkoZm9vICYmIGRybV9kZWJ1
Z19lbmFibGVkKERSTV9VVF9EUCkpCgppbmRpY2F0aW5nIHRoYXQgdGhlIHVubGlrZWx5KCkgd2l0
aGluIGRybV9kZWJ1Z19lbmFibGVkKCkgZG9lcyBub3QKcHJvcGFnYXRlIHRvIHRoZSB3aG9sZSBj
b25kaXRpb24uIEl0J3MgcG9zc2libGUgdG8gcmV0YWluIHRoZSBzYW1lCmFzc2VtYmx5IG91dHB1
dCB3aXRoCgoJKHVubGlrZWx5KGZvbykgJiYgZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RQKSkK
CmJ1dCBpdCdzIHVuY2xlYXIgdG8gbWUgd2hldGhlciB0aGlzIGlzIHJlYWxseSB3b3J0aCBpdCwg
ZWl0aGVyCnJlYWRhYmlsaXR5IG9yIHBlcmZvcm1hbmNlIHdpc2UuCgpUaG91Z2h0cz8KCkJSLApK
YW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
