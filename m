Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2AD0BE3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2A56E940;
	Wed,  9 Oct 2019 09:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD396E2BE;
 Wed,  9 Oct 2019 09:52:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 02:52:22 -0700
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="187581234"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 02:52:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin King <colin.king@canonical.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915: remove redundant variable err
In-Reply-To: <20191009093935.17895-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191009093935.17895-1-colin.king@canonical.com>
Date: Wed, 09 Oct 2019 12:52:15 +0300
Message-ID: <87h84igsa8.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwOSBPY3QgMjAxOSwgQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
PiB3cm90ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
Pgo+Cj4gQW4gZWFybGllciBjb21taXQgcmVtb3ZlZCBhbnkgZXJyb3IgYXNzaWdubWVudHMgdG8g
ZXJyIGFuZCB3ZQo+IGFyZSBub3cgbGVmdCB3aXRoIGEgemVybyBhc3NpZ25tZW50IHRvIGVyciBh
bmQgYSBjaGVjayB0aGF0IGlzCj4gYWx3YXlzIGZhbHNlLiBDbGVhbiB0aGlzIHVwIGJ5IHJlbW92
aW5nIHRoZSByZWR1bmRhbnQgdmFyaWFibGUKPiBlcnIgYW5kIHRoZSBlcnJvciBjaGVjay4KPgo+
IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCInQ29uc3RhbnQnIHZhcmlhYmxlIGd1YXJkIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgoKRml4
ZXM6IGIxZTMxNzdiZDFkOCAoImRybS9pOTE1OiBDb29yZGluYXRlIGk5MTVfYWN0aXZlIHdpdGgg
aXRzIG93biBtdXRleCIpClJldmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50
ZWwuY29tPgoKCkJSLApKYW5pLgoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
YWN0aXZlLmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2FjdGl2ZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9hY3RpdmUuYwo+IGluZGV4IGFhMzdjMDcwMDRiOS4uNjczMDUxNjVj
MTJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfYWN0aXZlLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2FjdGl2ZS5jCj4gQEAgLTQzOCw3ICs0Mzgs
NiBAQCBzdGF0aWMgdm9pZCBlbmFibGVfc2lnbmFsaW5nKHN0cnVjdCBpOTE1X2FjdGl2ZV9mZW5j
ZSAqYWN0aXZlKQo+ICBpbnQgaTkxNV9hY3RpdmVfd2FpdChzdHJ1Y3QgaTkxNV9hY3RpdmUgKnJl
ZikKPiAgewo+ICAJc3RydWN0IGFjdGl2ZV9ub2RlICppdCwgKm47Cj4gLQlpbnQgZXJyID0gMDsK
PiAgCj4gIAltaWdodF9zbGVlcCgpOwo+ICAKPiBAQCAtNDU2LDggKzQ1NSw2IEBAIGludCBpOTE1
X2FjdGl2ZV93YWl0KHN0cnVjdCBpOTE1X2FjdGl2ZSAqcmVmKQo+ICAJLyogQW55IGZlbmNlIGFk
ZGVkIGFmdGVyIHRoZSB3YWl0IGJlZ2lucyB3aWxsIG5vdCBiZSBhdXRvLXNpZ25hbGVkICovCj4g
IAo+ICAJaTkxNV9hY3RpdmVfcmVsZWFzZShyZWYpOwo+IC0JaWYgKGVycikKPiAtCQlyZXR1cm4g
ZXJyOwo+ICAKPiAgCWlmICh3YWl0X3Zhcl9ldmVudF9pbnRlcnJ1cHRpYmxlKHJlZiwgaTkxNV9h
Y3RpdmVfaXNfaWRsZShyZWYpKSkKPiAgCQlyZXR1cm4gLUVJTlRSOwoKLS0gCkphbmkgTmlrdWxh
LCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
