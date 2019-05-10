Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD21A0E2
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 18:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEC689E9E;
	Fri, 10 May 2019 16:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522EC89E9E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 16:00:36 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 09:00:35 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 10 May 2019 09:00:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 May 2019 19:00:31 +0300
Date: Fri, 10 May 2019 19:00:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 4/6] drm/fourcc: Pass the format_info pointer to
 drm_format_plane_cpp
Message-ID: <20190510160031.GM24299@intel.com>
References: <27b0041c7977402df4a087c78d2849ffe51c9f1c.1557486447.git-series.maxime.ripard@bootlin.com>
 <32aa13e53dbc98a90207fd290aa8e79f785fb11e.1557486447.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32aa13e53dbc98a90207fd290aa8e79f785fb11e.1557486447.git-series.maxime.ripard@bootlin.com>
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

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDE6MDg6NDlQTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBTbyBmYXIsIHRoZSBkcm1fZm9ybWF0X3BsYW5lX2NwcCBmdW5jdGlvbiB3YXMgb3Bl
cmF0aW5nIG9uIHRoZSBmb3JtYXQncwo+IGZvdXJjYyBhbmQgd2FzIGRvaW5nIGEgbG9va3VwIHRv
IHJldHJpZXZlIHRoZSBkcm1fZm9ybWF0X2luZm8gc3RydWN0dXJlIGFuZAo+IHJldHVybiB0aGUg
Y3BwLgo+IAo+IEhvd2V2ZXIsIHRoaXMgaXMgaW5lZmZpY2llbnQgc2luY2UgaW4gbW9zdCBjYXNl
cywgd2Ugd2lsbCBoYXZlIHRoZQo+IGRybV9mb3JtYXRfaW5mbyBwb2ludGVyIGFscmVhZHkgYXZh
aWxhYmxlIHNvIHdlIHNob3VsZG4ndCBoYXZlIHRvIHBlcmZvcm0gYQo+IG5ldyBsb29rdXAuIFNv
bWUgZHJtX2ZvdXJjYyBmdW5jdGlvbnMgYWxzbyBhbHJlYWR5IG9wZXJhdGUgb24gdGhlCj4gZHJt
X2Zvcm1hdF9pbmZvIHBvaW50ZXIgZm9yIHRoYXQgcmVhc29uLCBzbyB0aGUgQVBJIGlzIHF1aXRl
IGluY29uc2lzdGVudAo+IHRoZXJlLgo+IAo+IExldCdzIGZvbGxvdyB0aGUgbGF0dGVyIHBhdHRl
cm4gYW5kIHJlbW92ZSB0aGUgZXh0cmEgbG9va3VwIHdoaWxlIGJlaW5nIGEKPiBiaXQgbW9yZSBj
b25zaXN0ZW50LiBJbiBvcmRlciB0byBiZSBleHRyYSBjb25zaXN0ZW50LCBhbHNvIHJlbmFtZSB0
aGF0Cj4gZnVuY3Rpb24gdG8gZHJtX2Zvcm1hdF9pbmZvX3BsYW5lX2NwcCBhbmQgdG8gYSBzdGF0
aWMgZnVuY3Rpb24gaW4gdGhlCj4gaGVhZGVyIHRvIG1hdGNoIHRoZSBjdXJyZW50IHBvbGljeS4K
CklzIHRoZXJlIGFueSBwb2ludCBrZWVwaW5nIHRoZSBmdW5jdGlvbiBhdCBhbGw/Ckl0J3MganVz
dCBpbmZvLT5jcHBbaV0gbm8/CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
