Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22E47E4C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 11:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECF889198;
	Mon, 17 Jun 2019 09:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD01D89198
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 09:24:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 02:24:44 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2019 02:24:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 02/12] drm/client: Restrict the plane_state scope
In-Reply-To: <20190614141211.rl7ihqgzllcai634@flea>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <4f6344cb770047cf5808791d849bbc0cbd330e54.1560514379.git-series.maxime.ripard@bootlin.com>
 <87wohouz90.fsf@intel.com> <20190614141211.rl7ihqgzllcai634@flea>
Date: Mon, 17 Jun 2019 12:27:37 +0300
Message-ID: <87a7egv9x2.fsf@intel.com>
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSwgTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gSGkgSmFuaSwKPgo+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDAzOjI4
OjU5UE0gKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+PiBPbiBGcmksIDE0IEp1biAyMDE5LCBN
YXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPj4gPiBUaGUg
ZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMgZnVuY3Rpb24gdXNlcyB0d28gdGltZXMg
dGhlCj4+ID4gcGxhbmVfc3RhdGUgdmFyaWFibGUgaW4gaW5uZXIgYmxvY2tzIG9mIGNvZGUsIGJ1
dCB0aGUgdmFyaWFibGUgaGFzIGEgc2NvcGUKPj4gPiBnbG9iYWwgdG8gdGhpcyBmdW5jdGlvbi4K
Pj4gPgo+PiA+IFRoaXMgd2lsbCBsZWFkIHRvIGluYWR2ZXJ0ZW50IGRldnMgdG8gcmV1c2UgdGhl
IHZhcmlhYmxlIGluIHRoZSBzZWNvbmQKPj4gPiBibG9jayB3aXRoIHRoZSB2YWx1ZSBsZWZ0IGJ5
IHRoZSBmaXJzdCwgd2l0aG91dCBhbnkgd2FybmluZyBmcm9tIHRoZQo+PiA+IGNvbXBpbGVyIHNp
bmNlIHZhbHVlIHdvdWxkIGhhdmUgYmVlbiBpbml0aWFsaXplZC4KPj4gPgo+PiA+IEZpeCB0aGlz
IGJ5IG1vdmluZyB0aGUgdmFyaWFibGUgZGVjbGFyYXRpb24gdG8gdGhlIHByb3BlciBzY29wZS4K
Pj4KPj4gVGhpcyBpcyBhbiBpbXByb3ZlbWVudCwgYnV0IEknZCBjb25zaWRlciByZW5hbWluZyBh
bHNvIHRvIG5vdCBzaGFkb3cKPj4gdmFyaWFibGVzLgo+Pgo+PiA+IFNpZ25lZC1vZmYtYnk6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4+ID4gLS0tCj4+ID4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyB8IDUgKysrKy0KPj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiA+Cj4+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+PiA+IGluZGV4IDAwNmJmNzM5MGU3ZC4uODI2NGMz
YTczMmIwIDEwMDY0NAo+PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVz
ZXQuYwo+PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+PiA+
IEBAIC04NjEsNyArODYxLDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X3BhbmVsX3JvdGF0
aW9uKTsKPj4gPiAgc3RhdGljIGludCBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0X2F0b21pYyhz
dHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwgYm9vbCBhY3RpdmUpCj4+ID4gIHsKPj4gPiAg
CXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjbGllbnQtPmRldjsKPj4gPiAtCXN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOwo+PiA+ICAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7
Cj4+ID4gIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGU7Cj4+ID4gIAlzdHJ1Y3QgZHJt
X21vZGVzZXRfYWNxdWlyZV9jdHggY3R4Owo+PiA+IEBAIC04NzksNiArODc4LDggQEAgc3RhdGlj
IGludCBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0X2F0b21pYyhzdHJ1Y3QgZHJtX2NsaWVudF9k
ZXYgKmNsaWVudCwgYm9vbAo+PiA+ICAJc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0eDsKPj4gPiAg
cmV0cnk6Cj4+ID4gIAlkcm1fZm9yX2VhY2hfcGxhbmUocGxhbmUsIGRldikgewo+PiA+ICsJCXN0
cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOwo+PiA+ICsKPj4gPiAgCQlwbGFuZV9z
dGF0ZSA9IGRybV9hdG9taWNfZ2V0X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7Cj4+ID4gIAkJ
aWYgKElTX0VSUihwbGFuZV9zdGF0ZSkpIHsKPj4gPiAgCQkJcmV0ID0gUFRSX0VSUihwbGFuZV9z
dGF0ZSk7Cj4+ID4gQEAgLTkwMSw2ICs5MDIsOCBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRfbW9k
ZXNldF9jb21taXRfYXRvbWljKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50LCBib29sCj4+
ID4gIAkJdW5zaWduZWQgaW50IHJvdGF0aW9uOwo+PiA+Cj4+ID4gIAkJaWYgKGRybV9jbGllbnRf
cGFuZWxfcm90YXRpb24obW9kZV9zZXQsICZyb3RhdGlvbikpIHsKPj4gPiArCQkJc3RydWN0IGRy
bV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGU7Cj4+ID4gKwo+Cj4gVGhhdCdzIG5vdCBzdXBlciBj
bGVhciBmcm9tIHRoYXQgcGF0Y2gsIGJ1dCB0aGlzIHZhcmlhYmxlIHdpbGwgbm90Cj4gc2hhZG93
IHRoZSBmaXJzdCBvbmUuCj4KPiBUaGUgY29kZSBsYXlvdXQgaXMgcHJldHR5IG11Y2ggdGhpcyBv
bmU6Cj4KPiBsb29wICgpIHsKPiAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRl
Owo+Cj4gICBbLi4uXQo+IH0KPgo+IGxvb3AgKCkgewo+ICAgbG9vcCAoKSB7Cj4gICAgIHN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOwo+Cj4gICAgIFsuLi5dCj4gICB9Cj4gfQo+
Cj4gc28gdGhlIHNoYWRvd2luZyBkb2Vzbid0IGV4aXN0CgpJbmRlZWQsIHNvcnJ5IGZvciB0aGUg
bm9pc2UuCgpCUiwKSmFuaS4KCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
