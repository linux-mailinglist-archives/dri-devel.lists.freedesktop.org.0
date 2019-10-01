Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F3C3821
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1F76E81D;
	Tue,  1 Oct 2019 14:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911486E81D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:56:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 07:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="203254365"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 01 Oct 2019 07:55:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Oct 2019 17:55:56 +0300
Date: Tue, 1 Oct 2019 17:55:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v3 5/5] RFC: drm/atomic-helper: Reapply color
 transformation after resume
Message-ID: <20191001145556.GP1208@intel.com>
References: <20190930222802.32088-1-ezequiel@collabora.com>
 <20190930222802.32088-6-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930222802.32088-6-ezequiel@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDc6Mjg6MDJQTSAtMDMwMCwgRXplcXVpZWwgR2FyY2lh
IHdyb3RlOgo+IFNvbWUgcGxhdGZvcm1zIGFyZSBub3QgYWJsZSB0byBtYWludGFpbiB0aGUgY29s
b3IgdHJhbnNmb3JtYXRpb24KPiBzdGF0ZSBhZnRlciBhIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBj
eWNsZS4KPiAKPiBTZXQgdGhlIGNvbG9nX21nbXRfY2hhbmdlZCBmbGFnIHNvIHRoYXQgQ01NIG9u
IHRoZSBDUlRDcyBpbgo+IHRoZSBzdXNwZW5kIHN0YXRlIGFyZSByZWFwcGxpZWQgYWZ0ZXIgc3lz
dGVtIHJlc3VtZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVs
QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gVGhpcyBpcyBhbiBSRkMsIGFuZCBpdCdzIG1vc3RseSBi
YXNlZCBvbiBKYWNvcG8gTW9uZGkncyB3b3JrIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5Lzkv
Ni80OTguCj4gCj4gQ2hhbmdlcyBmcm9tIHYyOgo+ICogTmV3IHBhdGNoLgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDEyICsrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jCj4gaW5kZXggZTQxZGIwZjIwMmNhLi41MTg0ODgxMjU1NzUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYwo+IEBAIC0zMjM0LDggKzMyMzQsMjAgQEAgaW50IGRybV9h
dG9taWNfaGVscGVyX3Jlc3VtZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCQkgICAgIHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiAgewo+ICAJc3RydWN0IGRybV9tb2Rlc2V0
X2FjcXVpcmVfY3R4IGN0eDsKPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsK
PiArCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiArCXVuc2lnbmVkIGludCBpOwo+ICAJaW50IGVy
cjsKPiAgCj4gKwlmb3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0YywgY3J0Y19z
dGF0ZSwgaSkgewo+ICsJCS8qCj4gKwkJICogRm9yY2UgcmUtZW5hYmxlbWVudCBvZiBDTU0gYWZ0
ZXIgc3lzdGVtIHJlc3VtZSBpZiBhbnkKPiArCQkgKiBvZiB0aGUgRFJNIGNvbG9yIHRyYW5zZm9y
bWF0aW9uIHByb3BlcnRpZXMgd2FzIHNldCBpbgo+ICsJCSAqIHRoZSBzdGF0ZSBzYXZlZCBhdCBz
eXN0ZW0gc3VzcGVuZCB0aW1lLgo+ICsJCSAqLwo+ICsJCWlmIChjcnRjX3N0YXRlLT5nYW1tYV9s
dXQpCgpZb3Ugc2F5ICJhbnkiIGJ1dCB5b3UgY2hlY2sgdGhlIG9uZT8KCj4gKwkJCWNydGNfc3Rh
dGUtPmNvbG9yX21nbXRfY2hhbmdlZCA9IHRydWU7CgpCdXQgSSdtIG5vdCBjb252aW5jZWQgdGhp
cyBpcyB0aGUgYmVzdCB3YXkgdG8gZ28gYWJvdXQgaXQuIApJIHdvdWxkIGdlbmVyYWxseSBleHBl
Y3QgdGhhdCB5b3UgcmVwZ3JvZ3JhbSBldmVyeXRoaW5nCndoZW4gZG9pbmcgYSBmdWxsIG1vZGVz
ZXQgc2luY2UgdGhlIHN0YXRlIHdhcyBwb3NzaWJseQpsb3N0IHdoaWxlIHRoZSBjcnRjIHdhcyBk
aXNhYmxlZC4KCj4gKwl9Cj4gIAlkcm1fbW9kZV9jb25maWdfcmVzZXQoZGV2KTsKPiAgCj4gIAlE
Uk1fTU9ERVNFVF9MT0NLX0FMTF9CRUdJTihkZXYsIGN0eCwgMCwgZXJyKTsKPiAtLSAKPiAyLjIy
LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
