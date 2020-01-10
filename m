Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B491F136E58
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 14:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AB06EA20;
	Fri, 10 Jan 2020 13:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DCC6EA20;
 Fri, 10 Jan 2020 13:42:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 05:42:10 -0800
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; d="scan'208";a="216669084"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 05:42:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/7] drm: always determine branch device with
 drm_dp_is_branch()
In-Reply-To: <20190829114854.1539-2-oleg.vasilev@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190829114854.1539-1-oleg.vasilev@intel.com>
 <20190829114854.1539-2-oleg.vasilev@intel.com>
Date: Fri, 10 Jan 2020 15:42:03 +0200
Message-ID: <87blrbo2c4.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOSBBdWcgMjAxOSwgT2xlZyBWYXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50ZWwuY29t
PiB3cm90ZToKPiBUaGUgaGVscGVyIHNob3VsZCBhbHdheXMgYmUgdXNlZC4KPgo+IFJldmlld2Vk
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiBDYzogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogaW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwoKUHVzaGVkIHBhdGNoZXMgMS0yIHRvIGRybS1taXNjLW5l
eHQsIHRoYW5rcyBmb3IgdGhlIHBhdGNoZXMgYW5kIHJldmlldy4KCkJSLApKYW5pLgoKCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgICB8IDMgKy0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDIgKy0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
aGVscGVyLmMKPiBpbmRleCBmZmM2OGQzMDVhZmUuLjE0MzIwOTMwMDkxYiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9oZWxwZXIuYwo+IEBAIC01NzMsOCArNTczLDcgQEAgdm9pZCBkcm1fZHBfZG93bnN0
cmVhbV9kZWJ1ZyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4gIAlpbnQgbGVuOwo+ICAJdWludDhfdCBy
ZXZbMl07Cj4gIAlpbnQgdHlwZSA9IHBvcnRfY2FwWzBdICYgRFBfRFNfUE9SVF9UWVBFX01BU0s7
Cj4gLQlib29sIGJyYW5jaF9kZXZpY2UgPSBkcGNkW0RQX0RPV05TVFJFQU1QT1JUX1BSRVNFTlRd
ICYKPiAtCQkJICAgICBEUF9EV05fU1RSTV9QT1JUX1BSRVNFTlQ7Cj4gKwlib29sIGJyYW5jaF9k
ZXZpY2UgPSBkcm1fZHBfaXNfYnJhbmNoKGRwY2QpOwo+ICAKPiAgCXNlcV9wcmludGYobSwgIlx0
RFAgYnJhbmNoIGRldmljZSBwcmVzZW50OiAlc1xuIiwKPiAgCQkgICBicmFuY2hfZGV2aWNlID8g
InllcyIgOiAibm8iKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4g
aW5kZXggMjM5MDhkYTFjZDVkLi42ZGE2YTQ4NTlmMDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gQEAgLTI5MjIsNyArMjkyMiw3IEBAIHN0YXRpYyBib29s
IGRvd25zdHJlYW1faHBkX25lZWRzX2QwKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApCj4gIAkg
KiBGSVhNRSBzaG91bGQgcmVhbGx5IGNoZWNrIGFsbCBkb3duc3RyZWFtIHBvcnRzLi4uCj4gIAkg
Ki8KPiAgCXJldHVybiBpbnRlbF9kcC0+ZHBjZFtEUF9EUENEX1JFVl0gPT0gMHgxMSAmJgo+IC0J
CWludGVsX2RwLT5kcGNkW0RQX0RPV05TVFJFQU1QT1JUX1BSRVNFTlRdICYgRFBfRFdOX1NUUk1f
UE9SVF9QUkVTRU5UICYmCj4gKwkJZHJtX2RwX2lzX2JyYW5jaChpbnRlbF9kcC0+ZHBjZCkgJiYK
PiAgCQlpbnRlbF9kcC0+ZG93bnN0cmVhbV9wb3J0c1swXSAmIERQX0RTX1BPUlRfSFBEOwo+ICB9
CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
