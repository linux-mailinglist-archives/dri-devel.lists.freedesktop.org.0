Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C723111E21E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2A86E42B;
	Fri, 13 Dec 2019 10:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595A36E427;
 Fri, 13 Dec 2019 10:37:51 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 02:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="415602524"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2019 02:37:46 -0800
Date: Fri, 13 Dec 2019 16:07:00 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 03/12] drm/i915: WARN if HDCP signalling is enabled
 upon disable
Message-ID: <20191213103700.GC3829@intel.com>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-4-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212190230.188505-4-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0xMiBhdCAxNDowMjoyMSAtMDUwMCwgU2VhbiBQYXVsIHdyb3RlOgo+IEZyb206
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEhEQ1Agc2lnbmFsbGluZyBz
aG91bGQgbm90IGJlIGxlZnQgb24sIFdBUk4gaWYgaXQgaXMKTEdUTQoKUmV2aWV3ZWQtYnk6IFJh
bWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KPiAKPiBDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5w
YXVsQGNocm9taXVtLm9yZz4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gQWRkZWQgdG8gdGhlIHNl
dCBpbiBsaWV1IG9mIGp1c3QgY2xlYXJpbmcgdGhlIGJpdAo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5j
Cj4gaW5kZXggNWI2ZjMyNTE3Yzc1Li40YTViZGYzZWY1MWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKPiBAQCAtMTk1MSw2ICsxOTUxLDggQEAgdm9pZCBp
bnRlbF9kZGlfZGlzYWJsZV90cmFuc2NvZGVyX2Z1bmMoY29uc3Qgc3RydWN0IGludGVsX2NydGNf
c3RhdGUgKmNydGNfc3RhdGUKPiAgCWk5MTVfcmVnX3QgcmVnID0gVFJBTlNfRERJX0ZVTkNfQ1RM
KGNwdV90cmFuc2NvZGVyKTsKPiAgCXUzMiB2YWwgPSBJOTE1X1JFQUQocmVnKTsKPiAgCj4gKwlX
QVJOX09OKHZhbCAmIFRSQU5TX0RESV9IRENQX1NJR05BTExJTkcpOwo+ICsKPiAgCWlmIChJTlRF
TF9HRU4oZGV2X3ByaXYpID49IDEyKSB7Cj4gIAkJdmFsICY9IH4oVFJBTlNfRERJX0ZVTkNfRU5B
QkxFIHwgVEdMX1RSQU5TX0RESV9QT1JUX01BU0sgfAo+ICAJCQkgVFJBTlNfRERJX0RQX1ZDX1BB
WUxPQURfQUxMT0MpOwo+IC0tIAo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2ds
ZSAvIENocm9taXVtIE9TCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
