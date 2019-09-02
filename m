Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938CEA5538
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E92899A3;
	Mon,  2 Sep 2019 11:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A746A899A3;
 Mon,  2 Sep 2019 11:46:56 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 04:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; d="scan'208";a="186982502"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 02 Sep 2019 04:46:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2019 14:46:51 +0300
Date: Mon, 2 Sep 2019 14:46:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 3/3] drm/edid: no CEA extension is not an error
Message-ID: <20190902114651.GS7482@intel.com>
References: <20190830181423.4f31a28f@endymion>
 <20190830181652.5b58727b@endymion>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830181652.5b58727b@endymion>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDY6MTY6NTJQTSArMDIwMCwgSmVhbiBEZWx2YXJlIHdy
b3RlOgo+IEl0IGlzIGZpbmUgZm9yIGRpc3BsYXlzIHdpdGhvdXQgYXVkaW8gZnVuY3Rpb25hbGl0
eSB0byBub3QgaW1wbGVtZW50Cj4gQ0VBIGV4dGVuc2lvbiBpbiB0aGVpciBFRElELiBEbyBub3Qg
cmV0dXJuIGFuIGVycm9yIGluIHRoYXQgY2FzZSwKPiBpbnN0ZWFkIHJldHVybiAwIGFzIGlmIHRo
ZXJlIHdhcyBhIENFQSBleHRlbnNpb24gd2l0aCBubyBhdWRpbyBvcgo+IHNwZWFrZXIgYmxvY2su
Cj4gCj4gVGhpcyBmaXhlcyBoYWxmIG9mIGJ1ZyBmZG8jMTA3ODI1Ogo+IGh0dHBzOi8vYnVncy5m
cmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNzgyNQo+IAo+IFNpZ25lZC1vZmYtYnk6
IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YyB8ICAgIDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IC0tLSBsaW51eC01LjIub3JpZy9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YwkyMDE5LTA4LTMwIDE3OjU3OjM4LjE5OTk5MDk5NSArMDIwMAo+ICsrKyBsaW51eC01LjIvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMJMjAxOS0wOC0zMCAxODowNDozNi44NDAzMzM4MzQgKzAy
MDAKPiBAQCAtNDEzMCw3ICs0MTMwLDcgQEAgaW50IGRybV9lZGlkX3RvX3NhZChzdHJ1Y3QgZWRp
ZCAqZWRpZCwgcwo+ICAJY2VhID0gZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihlZGlkKTsKPiAgCWlm
ICghY2VhKSB7Cj4gIAkJRFJNX0RFQlVHX0tNUygiU0FEOiBubyBDRUEgRXh0ZW5zaW9uIGZvdW5k
XG4iKTsKPiAtCQlyZXR1cm4gLUVOT0VOVDsKPiArCQlyZXR1cm4gMDsKPiAgCX0KClNlZW1zIHJl
YXNvbmFibGUuIE1heWJlIHRoZSBjZWFfcmV2aXNpb248MyBicmFuY2hlcyBzaG91bGQgYWxzZSBy
ZXR1cm4gMD8KCkVpdGhlciB3YXkKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cgo+ICAKPiAgCWlmIChjZWFfcmV2aXNpb24oY2VhKSA8
IDMpIHsKPiBAQCAtNDE5MSw3ICs0MTkxLDcgQEAgaW50IGRybV9lZGlkX3RvX3NwZWFrZXJfYWxs
b2NhdGlvbihzdHJ1Ywo+ICAJY2VhID0gZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihlZGlkKTsKPiAg
CWlmICghY2VhKSB7Cj4gIAkJRFJNX0RFQlVHX0tNUygiU0FEOiBubyBDRUEgRXh0ZW5zaW9uIGZv
dW5kXG4iKTsKPiAtCQlyZXR1cm4gLUVOT0VOVDsKPiArCQlyZXR1cm4gMDsKPiAgCX0KPiAgCj4g
IAlpZiAoY2VhX3JldmlzaW9uKGNlYSkgPCAzKSB7Cj4gCj4gLS0gCj4gSmVhbiBEZWx2YXJlCj4g
U1VTRSBMMyBTdXBwb3J0Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
