Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AC11A99D2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 12:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919A089249;
	Wed, 15 Apr 2020 10:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8175089249;
 Wed, 15 Apr 2020 10:02:05 +0000 (UTC)
IronPort-SDR: MofK/Jm1SvBllk2hCmRb5FYSYyxHwWZP5/Jo5iuWcguzLBcDNZ2C2KnWl4ceHQBdxLfmwRd2H7
 fDNw6yTPtKZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 03:02:05 -0700
IronPort-SDR: YCHs3IYWb9gtrHs5gw9GrjcXnvMyfREiLLP4EXe7Jn/McUD8BD+cSF9vkGInQUEaWfnzg9A8c/
 owcHhi3s4NQQ==
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="453874219"
Received: from ssolodk-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.48.37])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 03:02:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/i915: utilize subconnector property for DP
In-Reply-To: <1586242207-23214-2-git-send-email-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1586242207-23214-1-git-send-email-jeevan.b@intel.com>
 <1586242207-23214-2-git-send-email-jeevan.b@intel.com>
Date: Wed, 15 Apr 2020 13:01:59 +0300
Message-ID: <874ktl5ap4.fsf@intel.com>
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
Cc: Jeevan B <jeevan.b@intel.com>, uma.shankar@intel.com,
 Oleg Vasilev <oleg.vasilev@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNyBBcHIgMjAyMCwgSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4gd3JvdGU6
Cj4gRnJvbTogT2xlZyBWYXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50ZWwuY29tPgo+Cj4gU2luY2Ug
RFAtc3BlY2lmaWMgaW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIGRyaXZlcidzIHN0cnVjdHVyZXMs
IGV2ZXJ5Cj4gZHJpdmVyIG5lZWRzIHRvIGltcGxlbWVudCBzdWJjb25uZWN0b3IgcHJvcGVydHkg
YnkgaXRzZWxmLgo+Cj4gdjI6IHVwZGF0ZXMgdG8gbWF0Y2ggcHJldmlvdXMgY29tbWl0IGNoYW5n
ZXMKPgo+IHYzOiByZWJhc2UKPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
U2lnbmVkLW9mZi1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gVGVzdGVkLWJ5OiBP
bGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+Cj4gTGluazogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwODI5MTE0ODU0LjE1MzktNC1v
bGVnLnZhc2lsZXZAaW50ZWwuY29tCgpZb3UncmUgbm90IHN1cHBvc2VkIHRvIGFkZCB0aGUgTGlu
azogdGFnIHlvdXJzZWxmLgoKUmV2aWV3ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gaW5kZXggZGI2YWU4ZS4uYmE0
NDNlMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiBAQCAt
NjE1NSw2ICs2MTU1LDExIEBAIGludGVsX2RwX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLAo+ICAJICovCj4gIAlpbnRlbF9kaXNwbGF5X3Bvd2VyX2ZsdXNoX3dvcmsoZGV2
X3ByaXYpOwo+ICAKPiArCWlmICghaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkKPiArCQlkcm1f
ZHBfc2V0X3N1YmNvbm5lY3Rvcl9wcm9wZXJ0eShjb25uZWN0b3IsCj4gKwkJCQkJCSBzdGF0dXMs
Cj4gKwkJCQkJCSBpbnRlbF9kcC0+ZHBjZCwKPiArCQkJCQkJIGludGVsX2RwLT5kb3duc3RyZWFt
X3BvcnRzKTsKPiAgCXJldHVybiBzdGF0dXM7Cj4gIH0KPiAgCj4gQEAgLTcyMTEsNiArNzIxNiw5
IEBAIGludGVsX2RwX2FkZF9wcm9wZXJ0aWVzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0Cj4gIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYgPSB0b19pOTE1KGNvbm5lY3Rvci0+ZGV2KTsKPiAgCWVudW0gcG9ydCBwb3J0ID0g
ZHBfdG9fZGlnX3BvcnQoaW50ZWxfZHApLT5iYXNlLnBvcnQ7Cj4gIAo+ICsJaWYgKCFpbnRlbF9k
cF9pc19lZHAoaW50ZWxfZHApKQo+ICsJCWRybV9tb2RlX2FkZF9kcF9zdWJjb25uZWN0b3JfcHJv
cGVydHkoY29ubmVjdG9yKTsKPiArCj4gIAlpZiAoIUlTX0c0WChkZXZfcHJpdikgJiYgcG9ydCAh
PSBQT1JUX0EpCj4gIAkJaW50ZWxfYXR0YWNoX2ZvcmNlX2F1ZGlvX3Byb3BlcnR5KGNvbm5lY3Rv
cik7CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
