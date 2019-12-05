Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC2B1147BE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 20:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035E26E15F;
	Thu,  5 Dec 2019 19:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB88E6E15F;
 Thu,  5 Dec 2019 19:39:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 11:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="243370449"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 05 Dec 2019 11:39:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Dec 2019 21:39:35 +0200
Date: Thu, 5 Dec 2019 21:39:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 04/11] drm/i915: Don't WARN on HDCP toggle if
 get_hw_state returns false
Message-ID: <20191205193935.GL1208@intel.com>
References: <20191203173638.94919-1-sean@poorly.run>
 <20191203173638.94919-5-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203173638.94919-5-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ramalingm.c@intel.com,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMTI6MzY6MjdQTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IE5vdyB0aGF0
IHdlIGNhbiByZWx5IG9uIHRyYW5zY29kZXIgZGlzYWJsZSB0byB0b2dnbGUgc2lnbmFsbGluZyBv
ZmYsCj4gaXQncyBsZXNzIG9mIGEgY2F0YXN0cm9waGUgaWYgZ2V0X2h3X3N0YXRlKCkgcmV0dXJu
cyBmYWxzZS4KPiAKPiBPbmNlIHdlIGVuYWJsZSBNU1QsIHRoaXMgd2lsbCBiZSBhIHZhbGlkIGV4
aXQgcGF0aCBhbmQgd2Ugd2FudCB0byBtYWtlCj4gc3VyZSB3ZSdyZSBub3Qgc3BhbW1pbmcgdGhl
IGxvZ3MgbmVlZGxlc3NseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kZGkuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCj4gaW5k
ZXggZThhYzk4YThlZTdmLi5jYTI4OTEzYTRjOWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGRpLmMKPiBAQCAtMTk4Myw3ICsxOTgzLDcgQEAgaW50IGludGVsX2Rk
aV90b2dnbGVfaGRjcF9zaWduYWxsaW5nKHN0cnVjdCBpbnRlbF9lbmNvZGVyICppbnRlbF9lbmNv
ZGVyLAo+ICAJaWYgKFdBUk5fT04oIXdha2VyZWYpKQo+ICAJCXJldHVybiAtRU5YSU87Cj4gIAo+
IC0JaWYgKFdBUk5fT04oIWludGVsX2VuY29kZXItPmdldF9od19zdGF0ZShpbnRlbF9lbmNvZGVy
LCAmcGlwZSkpKSB7Cj4gKwlpZiAoIWludGVsX2VuY29kZXItPmdldF9od19zdGF0ZShpbnRlbF9l
bmNvZGVyLCAmcGlwZSkpIHsKCkhvdyBjYW4gdGhpcyBnZXQgY2FsbGVkIHdoZW4gdGhlIGVuY29k
ZXIgaXMgbm90IGVuYWJsZWQ/CkZlZWxzIGxpa2UgdGhpcyB3aG9sZSB0aGluZyBpcyB0cnlpbmcg
dG8gcGFwZXIgb3ZlciBzb21lCmJpZ2dlciBidWcgaW4gdGhlIGhkY3AgY29kZS4KCj4gIAkJcmV0
ID0gLUVJTzsKPiAgCQlnb3RvIG91dDsKPiAgCX0KPiAtLSAKPiBTZWFuIFBhdWwsIFNvZnR3YXJl
IEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
