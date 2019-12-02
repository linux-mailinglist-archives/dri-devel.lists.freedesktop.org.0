Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76910EB66
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 15:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3A889862;
	Mon,  2 Dec 2019 14:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708DD89862;
 Mon,  2 Dec 2019 14:13:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 06:13:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="204572503"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 06:13:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chandan Uddaraju <chandanu@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 seanpaul@chromium.org
Subject: Re: [DPU PATCH v3 2/5] drm: add constant N value in helper file
In-Reply-To: <0101016ec6ddf2ce-8548e076-2347-49be-a9be-4d81a14ad8f7-000000@us-west-2.amazonses.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6ddf2ce-8548e076-2347-49be-a9be-4d81a14ad8f7-000000@us-west-2.amazonses.com>
Date: Mon, 02 Dec 2019 16:13:24 +0200
Message-ID: <87tv6ike7v.fsf@intel.com>
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
Cc: Chandan Uddaraju <chandanu@codeaurora.org>, hoegsberg@google.com,
 dri-devel@lists.freedesktop.org, abhinavk@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMiBEZWMgMjAxOSwgQ2hhbmRhbiBVZGRhcmFqdSA8Y2hhbmRhbnVAY29kZWF1cm9y
YS5vcmc+IHdyb3RlOgo+IFRoZSBjb25zdGFudCBOIHZhbHVlICgweDgwMDApIGlzIHVzZWQgYnkg
bXVsdGlwbGUgRFAKPiBkcml2ZXJzLiBEZWZpbmUgdGhpcyB2YWx1ZSBpbiBoZWFkZXIgZmlsZSBh
bmQgdXNlIHRoaXMKPiBpbiB0aGUgZXhpc3RpbmcgaTkxNSBkaXNwbGF5IGRyaXZlci4KPgo+IFNp
Z25lZC1vZmYtYnk6IENoYW5kYW4gVWRkYXJhanUgPGNoYW5kYW51QGNvZGVhdXJvcmEub3JnPgoK
UmV2aWV3ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgphbmQgYWNr
IGZvciBtZXJnaW5nIHZpYSBkcm0tbWlzYyBvciB3aGljaGV2ZXIgdHJlZSB5b3UgZmluZCBzdWl0
YWJsZS4KCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuYyB8IDIgKy0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAg
ICAgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4g
aW5kZXggY2UwNWU4MC4uMWE0Y2NmZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jCj4gQEAgLTc0OTYsNyArNzQ5Niw3IEBAIHN0YXRpYyB2b2lk
IGNvbXB1dGVfbV9uKHVuc2lnbmVkIGludCBtLCB1bnNpZ25lZCBpbnQgbiwKPiAgCSAqIHdoaWNo
IHRoZSBkZXZpY2VzIGV4cGVjdCBhbHNvIGluIHN5bmNocm9ub3VzIGNsb2NrIG1vZGUuCj4gIAkg
Ki8KPiAgCWlmIChjb25zdGFudF9uKQo+IC0JCSpyZXRfbiA9IDB4ODAwMDsKPiArCQkqcmV0X24g
PSBEUF9MSU5LX0NPTlNUQU5UX05fVkFMVUU7Cj4gIAllbHNlCj4gIAkJKnJldF9uID0gbWluX3Qo
dW5zaWduZWQgaW50LCByb3VuZHVwX3Bvd19vZl90d28obiksIERBVEFfTElOS19OX01BWCk7Cj4g
IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmgKPiBpbmRleCA4MzY0NTAyLi42OWI4MjUxIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9o
ZWxwZXIuaAo+IEBAIC0xMzU3LDYgKzEzNTcsNyBAQCBpbnQgZHJtX2RwX2RwY2RfcmVhZF9saW5r
X3N0YXR1cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAo+ICAgKiBEaXNwbGF5UG9ydCBsaW5rCj4g
ICAqLwo+ICAjZGVmaW5lIERQX0xJTktfQ0FQX0VOSEFOQ0VEX0ZSQU1JTkcgKDEgPDwgMCkKPiAr
I2RlZmluZSBEUF9MSU5LX0NPTlNUQU5UX05fVkFMVUUgMHg4MDAwCj4gIAo+ICBzdHJ1Y3QgZHJt
X2RwX2xpbmsgewo+ICAJdW5zaWduZWQgY2hhciByZXZpc2lvbjsKCi0tIApKYW5pIE5pa3VsYSwg
SW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
