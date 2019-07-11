Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA05D66041
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 21:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20516E284;
	Thu, 11 Jul 2019 19:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6396E284;
 Thu, 11 Jul 2019 19:55:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 12:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,479,1557212400"; d="scan'208";a="168117192"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 11 Jul 2019 12:55:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Jul 2019 22:55:05 +0300
Date: Thu, 11 Jul 2019 22:55:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915: Copy name string into ring buffer for
 intel_update/disable_plane tracepoints
Message-ID: <20190711195505.GC5942@intel.com>
References: <20190710120110.17394e73@gandalf.local.home>
 <20190710171230.7471-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710171230.7471-1-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDg6MTI6MzBQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiAiU3RldmVuIFJvc3RlZHQgKFZNd2FyZSkiIDxyb3N0ZWR0QGdvb2RtaXMu
b3JnPgo+IAo+IEN1cnJlbnRseSB0aGUgaW50ZWxfdXBkYXRlX3BsYW5lIGFuZCBpbnRlbF9kaXNh
YmxlX3BsYW5lIHRyYWNlcG9pbnRzIHJlY29yZAo+IHRoZSBhZGRyZXNzIG9mIHBsYW5lLT5uYW1l
IGluIHRoZSByaW5nIGJ1ZmZlciwgYW5kIHRoZW4gd2hlbiByZWFkaW5nIHRoZQo+IHJpbmcgYnVm
ZmVyIHVzZXMgJXMgdG8gZ2V0IHRoZSBuYW1lLiBUaGUgaXNzdWUgd2l0aCB0aGlzLCBpcyB0aGF0
IHRob3NlIHR3bwo+IGV2ZW50cyBjYW4gYmUgbWludXRlcywgaG91cnMgb3IgZXZlbiBkYXlzIGFw
YXJ0LiBJdCBpcyB2ZXJ5IGRhbmdlcm91cyB0bwo+IGRlcmVmZXJlbmNlIGEgc3RyaW5nIHBvaW50
ZXIgd2l0aG91dCBrbm93aW5nIGlmIGl0IHN0aWxsIGV4aXN0cyBvciBub3QuCj4gCj4gVGhlIHBy
b3BlciB3YXkgdG8gaGFuZGxlIHRoaXMgaXMgdG8gdXNlIHRoZSBfX3N0cmluZygpIG1hY3JvIGlu
IHRoZQo+IHRyYWNlcG9pbnQgd2hpY2ggd2lsbCBzYXZlIHRoZSBzdHJpbmcgaW50byB0aGUgcmlu
ZyBidWZmZXIgYXQgdGhlIHRpbWUgb2YKPiByZWNvcmRpbmcuIFRoZW4gdGhlcmUncyBubyB3b3Jy
aWVzIGlmIHRoZSBvcmlnaW5hbCBzdHJpbmcgc3RpbGwgZXhpc3RzIGluCj4gbWVtb3J5IHdoZW4g
dGhlIHJpbmcgYnVmZmVyIGlzIHJlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFJvc3Rl
ZHQgKFZNd2FyZSkgPHJvc3RlZHRAZ29vZG1pcy5vcmc+Cj4gW3ZzeXJqYWxhOiBSZWJhc2Ugb24g
dG9wIG9mIGRybS10aXBdCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNJIGlzIGhhcHB5IChub3QgdGhhdCB3ZSB0ZXN0IHRo
aXMgc3R1ZmYpIGFuZCBJJ20gaGFwcHkgKHRoZSB0cmFjZXBvaW50cwpzdGlsbCB3b3JrKSAtPiBw
dXNoZWQgdG8gZHJtLWludGVsLW5leHQtcXVldWVkLiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdHJhY2UuaCB8IDEyICsrKysrKy0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3RyYWNlLmggYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3RyYWNlLmgKPiBpbmRleCBjY2U0MjZiMjNhMjQuLmRhMThiOGQ2
YjgwYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3RyYWNlLmgKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3RyYWNlLmgKPiBAQCAtMjkzLDE2ICsyOTMs
MTYgQEAgVFJBQ0VfRVZFTlQoaW50ZWxfdXBkYXRlX3BsYW5lLAo+ICAKPiAgCSAgICBUUF9TVFJV
Q1RfX2VudHJ5KAo+ICAJCQkgICAgIF9fZmllbGQoZW51bSBwaXBlLCBwaXBlKQo+IC0JCQkgICAg
IF9fZmllbGQoY29uc3QgY2hhciAqLCBuYW1lKQo+ICAJCQkgICAgIF9fZmllbGQodTMyLCBmcmFt
ZSkKPiAgCQkJICAgICBfX2ZpZWxkKHUzMiwgc2NhbmxpbmUpCj4gIAkJCSAgICAgX19hcnJheShp
bnQsIHNyYywgNCkKPiAgCQkJICAgICBfX2FycmF5KGludCwgZHN0LCA0KQo+ICsJCQkgICAgIF9f
c3RyaW5nKG5hbWUsIHBsYW5lLT5uYW1lKQo+ICAJCQkgICAgICksCj4gIAo+ICAJICAgIFRQX2Zh
c3RfYXNzaWduKAo+ICsJCQkgICBfX2Fzc2lnbl9zdHIobmFtZSwgcGxhbmUtPm5hbWUpOwo+ICAJ
CQkgICBfX2VudHJ5LT5waXBlID0gY3J0Yy0+cGlwZTsKPiAtCQkJICAgX19lbnRyeS0+bmFtZSA9
IHBsYW5lLT5uYW1lOwo+ICAJCQkgICBfX2VudHJ5LT5mcmFtZSA9IGludGVsX2NydGNfZ2V0X3Zi
bGFua19jb3VudGVyKGNydGMpOwo+ICAJCQkgICBfX2VudHJ5LT5zY2FubGluZSA9IGludGVsX2dl
dF9jcnRjX3NjYW5saW5lKGNydGMpOwo+ICAJCQkgICBtZW1jcHkoX19lbnRyeS0+c3JjLCAmcGxh
bmUtPnN0YXRlLT5zcmMsIHNpemVvZihfX2VudHJ5LT5zcmMpKTsKPiBAQCAtMzEwLDcgKzMxMCw3
IEBAIFRSQUNFX0VWRU5UKGludGVsX3VwZGF0ZV9wbGFuZSwKPiAgCQkJICAgKSwKPiAgCj4gIAkg
ICAgVFBfcHJpbnRrKCJwaXBlICVjLCBwbGFuZSAlcywgZnJhbWU9JXUsIHNjYW5saW5lPSV1LCAi
IERSTV9SRUNUX0ZQX0ZNVCAiIC0+ICIgRFJNX1JFQ1RfRk1ULAo+IC0JCSAgICAgIHBpcGVfbmFt
ZShfX2VudHJ5LT5waXBlKSwgX19lbnRyeS0+bmFtZSwKPiArCQkgICAgICBwaXBlX25hbWUoX19l
bnRyeS0+cGlwZSksIF9fZ2V0X3N0cihuYW1lKSwKPiAgCQkgICAgICBfX2VudHJ5LT5mcmFtZSwg
X19lbnRyeS0+c2NhbmxpbmUsCj4gIAkJICAgICAgRFJNX1JFQ1RfRlBfQVJHKChjb25zdCBzdHJ1
Y3QgZHJtX3JlY3QgKilfX2VudHJ5LT5zcmMpLAo+ICAJCSAgICAgIERSTV9SRUNUX0FSRygoY29u
c3Qgc3RydWN0IGRybV9yZWN0ICopX19lbnRyeS0+ZHN0KSkKPiBAQCAtMzIyLDIwICszMjIsMjAg
QEAgVFJBQ0VfRVZFTlQoaW50ZWxfZGlzYWJsZV9wbGFuZSwKPiAgCj4gIAkgICAgVFBfU1RSVUNU
X19lbnRyeSgKPiAgCQkJICAgICBfX2ZpZWxkKGVudW0gcGlwZSwgcGlwZSkKPiAtCQkJICAgICBf
X2ZpZWxkKGNvbnN0IGNoYXIgKiwgbmFtZSkKPiAgCQkJICAgICBfX2ZpZWxkKHUzMiwgZnJhbWUp
Cj4gIAkJCSAgICAgX19maWVsZCh1MzIsIHNjYW5saW5lKQo+ICsJCQkgICAgIF9fc3RyaW5nKG5h
bWUsIHBsYW5lLT5uYW1lKQo+ICAJCQkgICAgICksCj4gIAo+ICAJICAgIFRQX2Zhc3RfYXNzaWdu
KAo+ICsJCQkgICBfX2Fzc2lnbl9zdHIobmFtZSwgcGxhbmUtPm5hbWUpOwo+ICAJCQkgICBfX2Vu
dHJ5LT5waXBlID0gY3J0Yy0+cGlwZTsKPiAtCQkJICAgX19lbnRyeS0+bmFtZSA9IHBsYW5lLT5u
YW1lOwo+ICAJCQkgICBfX2VudHJ5LT5mcmFtZSA9IGludGVsX2NydGNfZ2V0X3ZibGFua19jb3Vu
dGVyKGNydGMpOwo+ICAJCQkgICBfX2VudHJ5LT5zY2FubGluZSA9IGludGVsX2dldF9jcnRjX3Nj
YW5saW5lKGNydGMpOwo+ICAJCQkgICApLAo+ICAKPiAgCSAgICBUUF9wcmludGsoInBpcGUgJWMs
IHBsYW5lICVzLCBmcmFtZT0ldSwgc2NhbmxpbmU9JXUiLAo+IC0JCSAgICAgIHBpcGVfbmFtZShf
X2VudHJ5LT5waXBlKSwgX19lbnRyeS0+bmFtZSwKPiArCQkgICAgICBwaXBlX25hbWUoX19lbnRy
eS0+cGlwZSksIF9fZ2V0X3N0cihuYW1lKSwKPiAgCQkgICAgICBfX2VudHJ5LT5mcmFtZSwgX19l
bnRyeS0+c2NhbmxpbmUpCj4gICk7Cj4gIAo+IC0tIAo+IDIuMjEuMAoKLS0gClZpbGxlIFN5cmrD
pGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
