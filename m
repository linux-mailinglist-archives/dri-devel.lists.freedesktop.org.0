Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE401B6C9
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 15:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5778989E;
	Mon, 13 May 2019 13:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EA08989E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 13:11:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 06:11:36 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 13 May 2019 06:11:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2019 16:11:32 +0300
Date: Mon, 13 May 2019 16:11:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 4/6] drm/fourcc: Pass the format_info pointer to
 drm_format_plane_cpp
Message-ID: <20190513131132.GN24299@intel.com>
References: <27b0041c7977402df4a087c78d2849ffe51c9f1c.1557486447.git-series.maxime.ripard@bootlin.com>
 <32aa13e53dbc98a90207fd290aa8e79f785fb11e.1557486447.git-series.maxime.ripard@bootlin.com>
 <20190510160031.GM24299@intel.com>
 <20190512173054.uj3thuvkgmllsy2n@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190512173054.uj3thuvkgmllsy2n@flea>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgMDc6MzA6NTRQTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBIaSBWaWxsZSwKPiAKPiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAwNzowMDozMVBN
ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAxMCwgMjAxOSBh
dCAwMTowODo0OVBNICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+ID4gPiBTbyBmYXIsIHRo
ZSBkcm1fZm9ybWF0X3BsYW5lX2NwcCBmdW5jdGlvbiB3YXMgb3BlcmF0aW5nIG9uIHRoZSBmb3Jt
YXQncwo+ID4gPiBmb3VyY2MgYW5kIHdhcyBkb2luZyBhIGxvb2t1cCB0byByZXRyaWV2ZSB0aGUg
ZHJtX2Zvcm1hdF9pbmZvIHN0cnVjdHVyZSBhbmQKPiA+ID4gcmV0dXJuIHRoZSBjcHAuCj4gPiA+
Cj4gPiA+IEhvd2V2ZXIsIHRoaXMgaXMgaW5lZmZpY2llbnQgc2luY2UgaW4gbW9zdCBjYXNlcywg
d2Ugd2lsbCBoYXZlIHRoZQo+ID4gPiBkcm1fZm9ybWF0X2luZm8gcG9pbnRlciBhbHJlYWR5IGF2
YWlsYWJsZSBzbyB3ZSBzaG91bGRuJ3QgaGF2ZSB0byBwZXJmb3JtIGEKPiA+ID4gbmV3IGxvb2t1
cC4gU29tZSBkcm1fZm91cmNjIGZ1bmN0aW9ucyBhbHNvIGFscmVhZHkgb3BlcmF0ZSBvbiB0aGUK
PiA+ID4gZHJtX2Zvcm1hdF9pbmZvIHBvaW50ZXIgZm9yIHRoYXQgcmVhc29uLCBzbyB0aGUgQVBJ
IGlzIHF1aXRlIGluY29uc2lzdGVudAo+ID4gPiB0aGVyZS4KPiA+ID4KPiA+ID4gTGV0J3MgZm9s
bG93IHRoZSBsYXR0ZXIgcGF0dGVybiBhbmQgcmVtb3ZlIHRoZSBleHRyYSBsb29rdXAgd2hpbGUg
YmVpbmcgYQo+ID4gPiBiaXQgbW9yZSBjb25zaXN0ZW50LiBJbiBvcmRlciB0byBiZSBleHRyYSBj
b25zaXN0ZW50LCBhbHNvIHJlbmFtZSB0aGF0Cj4gPiA+IGZ1bmN0aW9uIHRvIGRybV9mb3JtYXRf
aW5mb19wbGFuZV9jcHAgYW5kIHRvIGEgc3RhdGljIGZ1bmN0aW9uIGluIHRoZQo+ID4gPiBoZWFk
ZXIgdG8gbWF0Y2ggdGhlIGN1cnJlbnQgcG9saWN5Lgo+ID4KPiA+IElzIHRoZXJlIGFueSBwb2lu
dCBrZWVwaW5nIHRoZSBmdW5jdGlvbiBhdCBhbGw/Cj4gPiBJdCdzIGp1c3QgaW5mby0+Y3BwW2ld
IG5vPwo+IAo+IFlvdSdyZSByaWdodCwgd2UgY2FuIHJlbW92ZSBpdC4KPiAKPiBEbyB5b3Ugd2Fu
dCB0aGlzIHRvIGJlIGRvbmUgaW4gdGhhdCBwYXRjaCBvciBhIHN1YnNlcXVlbnQgb25lPwoKSSBk
b24ndCBtaW5kIGVpdGhlciB3YXkuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
