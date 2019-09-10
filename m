Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC83AE748
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951B46E8A7;
	Tue, 10 Sep 2019 09:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFE56E82D;
 Tue, 10 Sep 2019 09:48:46 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 02:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="178625572"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 10 Sep 2019 02:48:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Sep 2019 12:48:42 +0300
Date: Tue, 10 Sep 2019 12:48:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] drm/edid: Have cea_db_offsets() zero start/end when
 the data block collection isn't found
Message-ID: <20190910094842.GE7482@intel.com>
References: <20190902131546.4691-1-ville.syrjala@linux.intel.com>
 <20190902131546.4691-2-ville.syrjala@linux.intel.com>
 <20190910114620.78a774a1@endymion>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910114620.78a774a1@endymion>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTE6NDY6MjBBTSArMDIwMCwgSmVhbiBEZWx2YXJlIHdy
b3RlOgo+IEhpIFZpbGxlLAo+IAo+IE9uIE1vbiwgIDIgU2VwIDIwMTkgMTY6MTU6NDYgKzAzMDAs
IFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gCj4gPiBMZXQncyBtYWtlIGNlYV9kYl9vZmZzZXRz
KCkgYSBiaXQgbW9yZSBjb252ZW5pZW50IHRvIHVzZSBieQo+ID4gc2V0dGluZyB0aGUgc3RhcnQv
ZW5kIG9mZnNldHMgdG8gemVybyB3aGVuZXZlciB0aGUgZGF0YSBibG9jawo+ID4gY29sbGVjdGlv
biBpc24ndCBwcmVzZW50LiBUaGlzIG1ha2VzIGl0IHNhZmUgZm9yIHRoZSBjYWxsZXIKPiA+IHRv
IGJsaW5kbHkgaXRlcmF0ZSB0aGUgZGF0YSBibG9ja3MgZXZlbiBpZiB0aGVyZSBhcmUgbm9uZS4K
PiA+IAo+ID4gQ2M6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDggKysrKy0tLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYwo+ID4gaW5kZXggN2IzMDcyZmM1NTBiLi5lNTkwNWRjNzY0YzEgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMKPiA+IEBAIC0zNjkwLDYgKzM2OTAsOSBAQCBjZWFfcmV2aXNpb24oY29u
c3QgdTggKmNlYSkKPiA+ICBzdGF0aWMgaW50Cj4gPiAgY2VhX2RiX29mZnNldHMoY29uc3QgdTgg
KmNlYSwgaW50ICpzdGFydCwgaW50ICplbmQpCj4gPiAgewo+ID4gKwkqc3RhcnQgPSAwOwo+ID4g
KwkqZW5kID0gMDsKPiA+ICsKPiA+ICAJaWYgKGNlYV9yZXZpc2lvbihjZWEpIDwgMykKPiA+ICAJ
CXJldHVybiAtRU5PVFNVUFA7Cj4gPiAgCj4gPiBAQCAtNDExNiwxMCArNDExOSw3IEBAIHN0YXRp
YyB2b2lkIGRybV9lZGlkX3RvX2VsZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBz
dHJ1Y3QgZWRpZCAqZWRpZCkKPiA+ICAJaWYgKGNlYV9yZXZpc2lvbihjZWEpID49IDMpIHsKPiA+
ICAJCWludCBpLCBzdGFydCwgZW5kOwo+ID4gIAo+ID4gLQkJaWYgKGNlYV9kYl9vZmZzZXRzKGNl
YSwgJnN0YXJ0LCAmZW5kKSkgewo+ID4gLQkJCXN0YXJ0ID0gMDsKPiA+IC0JCQllbmQgPSAwOwo+
ID4gLQkJfQo+ID4gKwkJY2VhX2RiX29mZnNldHMoY2VhLCAmc3RhcnQsICZlbmQpOwo+ID4gIAo+
ID4gIAkJZm9yX2VhY2hfY2VhX2RiKGNlYSwgaSwgc3RhcnQsIGVuZCkgewo+ID4gIAkJCWRiID0g
JmNlYVtpXTsKPiAKPiBOb3Qgc3VyZSBpZiB0aGF0J3MgcmVhbGx5IG5lZWRlZC4gQXMgaXQgc3Rh
bmRzIHRoZXJlJ3Mgb25seSBvbmUKPiBmdW5jdGlvbiB3aGljaCB3YW50cyB0byBjb250aW51ZSBh
ZnRlciBjZWFfZGJfb2Zmc2V0cygpIGZhaWxzLCBhbGwKPiBvdGhlcnMganVzdCBiYWlsIG91dCBh
dCB0aGF0IHBvaW50LiBOb3cgdGhhdCBjZWFfZGJfb2Zmc2V0cygpIGNoZWNrcwo+IGZvciByZXZp
c2lvbiA+PSAzLCB0aGUgY29uc3RydWN0IGFib3ZlIGNvdWxkIHNpbXBseSBiZWNvbWU6Cj4gCj4g
CWludCBpLCBzdGFydCwgZW5kOwo+IAo+IAlpZiAoY2VhX2RiX29mZnNldHMoY2VhLCAmc3RhcnQs
ICZlbmQpID09IDApIHsKPiAJCWZvcl9lYWNoX2NlYV9kYihjZWEsIGksIHN0YXJ0LCBlbmQpIHsK
PiAJCQlkYiA9ICZjZWFbaV07Cj4gCj4gd2hpY2ggaXMgSU1ITyBtb3JlIGVsZWdhbnQgYW5kIGRv
ZXMgbm90IHJlcXVpcmUgemVyb2luZyBzdGFydCBhbmQgZW5kCj4gaW4gY2VhX2RiX29mZnNldHMo
KS4KCkkgZGlzbGlrZSBpbmRlbnRhdGlvbi4gQWxzbyBjb3VsZCBwZXJoYXBzIGV2ZW4gbW92ZSB0
aGUgY2VhX2RiX29mZnNldHMoKQppbnRvIHRoZSBmb3JfZWFjaF9jZWFfZGIoKSBtYWNybyBzbyB0
aGF0IHRoZSBjYWxsZXIgZG9lc24ndCBoYXZlIHRvIGNhcmUKYWJvdXQgdGhlc2UgbXVuZGFuZSBk
ZXRhaWxzIGF0IGFsbC4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
