Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E9F2D60
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 12:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4439B6F657;
	Thu,  7 Nov 2019 11:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAC86E3FC;
 Thu,  7 Nov 2019 11:24:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 03:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="230168299"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 07 Nov 2019 03:24:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 13:24:32 +0200
Date: Thu, 7 Nov 2019 13:24:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/i915: Try to re-use GOP / previous M-N-P settings
 for vlv DSI PLL
Message-ID: <20191107112432.GB1208@intel.com>
References: <20191020182132.54945-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191020182132.54945-1-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgMjAsIDIwMTkgYXQgMDg6MjE6MzJQTSArMDIwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBGYXN0Ym9vdCBpcyBub3Qgd29ya2luZyBvbiBhbiBBc3VzIFQxMDBIQSwgaXQgZ2l2
ZXMgdGhlIGZvbGxvd2luZwo+IHJlbGV2YW50IG1lc3NhZ2VzIC8gZXJyb3JzOgo+IAo+ICBkc2kg
cGxsIGRpdiAwMDAyMDFlNiwgY3RybCA4MDA4MDEwMAo+ICBmYXN0c2V0IG1pc21hdGNoIGluIGRz
aV9wbGwuY3RybCAoZXhwZWN0ZWQgMHg4MDEwMDEwMCwgZm91bmQgMHg4MDA4MDEwMCkKPiAgZmFz
dHNldCBtaXNtYXRjaCBpbiBkc2lfcGxsLmRpdiAoZXhwZWN0ZWQgMHgwMDAyMDA4ZSwgZm91bmQg
MHgwMDAyMDFlNikKPiAKPiBUaGUgcHJvYmxlbSBzZWVtcyB0byBiZSB0aGF0IHRoZSBHT1AgcGlj
a3MgNSBmb3IgdGhlIFAgZGl2aXNvciwgd2hlcmUgYXMKPiB3ZSBlbmQgdXAgcGlja2luZyA0Lgo+
IAo+IFRoaXMgY29tbWl0IGZpeGVzIHRoaXMgYnkgZmlyc3QgY2hlY2tpbmcgb2YgdGhlIGN1cnJl
bnRseSBjb25maWd1cmVkCj4gRFNJIFBMTCBzZXR0aW5ncyBtYXRjaCB0aGUgZGVzaXJlZCBwY2xr
IGFuZCBpZiB0aGV5IGRvLCBzdGljayB3aXRoCj4gdGhlIGN1cnJlbnRseSBjb25maWd1cmVkIFBM
TCBzZXR0aW5ncy4KPiAKPiBOb3RlIHRoYXQgdmx2X2RzaV9nZXRfcGNsaygpIHN0b3JlcyB0aGUg
cmVhZCBjdHJsIGFuZCBkaXYgdmFsdWVzIGluc2lkZQo+IGNvbmZpZy0+ZHNpX3BsbCwgc28gdGhl
eSBhcmUgc2V0IHRvIHRoZSBHT1AgLyBwcmV2aW91cyB2YWx1ZXMgYWZ0ZXIKPiBjYWxsaW5nIGl0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaV9wbGwuYyB8IDI2
ICsrKysrKysrKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvdmx2X2RzaV9wbGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2
X2RzaV9wbGwuYwo+IGluZGV4IDk1ZjM5Y2QwY2UwMi4uNGEwOWVkZWNkNTk3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaV9wbGwuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaV9wbGwuYwo+IEBAIC0xMTksMTUgKzEx
OSwyNSBAQCBpbnQgdmx2X2RzaV9wbGxfY29tcHV0ZShzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5j
b2RlciwKPiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZW5j
b2Rlci0+YmFzZS5kZXYpOwo+ICAJc3RydWN0IGludGVsX2RzaSAqaW50ZWxfZHNpID0gZW5jX3Rv
X2ludGVsX2RzaSgmZW5jb2Rlci0+YmFzZSk7Cj4gIAlpbnQgcmV0Owo+IC0JdTMyIGRzaV9jbGs7
Cj4gLQo+IC0JZHNpX2NsayA9IGRzaV9jbGtfZnJvbV9wY2xrKGludGVsX2RzaS0+cGNsaywgaW50
ZWxfZHNpLT5waXhlbF9mb3JtYXQsCj4gLQkJCQkgICAgaW50ZWxfZHNpLT5sYW5lX2NvdW50KTsK
PiArCXUzMiBkc2lfY2xrLCBjdXJyZW50X3BjbGs7Cj4gIAo+IC0JcmV0ID0gZHNpX2NhbGNfbW5w
KGRldl9wcml2LCBjb25maWcsIGRzaV9jbGspOwo+IC0JaWYgKHJldCkgewo+IC0JCURSTV9ERUJV
R19LTVMoImRzaV9jYWxjX21ucCBmYWlsZWRcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gKwkvKgo+
ICsJICogRm9yIGV4YWN0IG1hdGNoZXMsIHRoZSBHT1AgbWF5IHBpY2sgYW5vdGhlciBzZXQgb2Yg
ZGl2aXNvcnMKPiArCSAqIHRoZW4gd2UgZG8sIGlmIHRoZSBHT1Agc2V0dGluZ3MgYXJlIGFuIGV4
YWN0IG1hdGNoIGtlZXAgdGhlbS4KPiArCSAqLwo+ICsJY3VycmVudF9wY2xrID0gdmx2X2RzaV9n
ZXRfcGNsayhlbmNvZGVyLCBjb25maWcpOwoKT25lIGlzIG5vdCBhbGxvd2VkIHRvIHRvdWNoIHRo
ZSBodyBpbiAuY29tcHV0ZV9jb25maWcoKS4KClRoZSBxdWVzdGlvbiBpcyB3aHkgZG9lcyB0aGUg
R09QIGdlbmVyYXRlIGEgZGlmZmVyZW50IFAgZGl2aWRlcj8KRG9lcyBpdCB1c2UgYSBzbGlnaHRs
eSBkaWZmZXJlbnQgY2xvY2s/CgoKPiArCWlmIChjdXJyZW50X3BjbGsgPT0gaW50ZWxfZHNpLT5w
Y2xrKSB7Cj4gKwkJY29uZmlnLT5kc2lfcGxsLmN0cmwgJj0gRFNJX1BMTF9QMV9QT1NUX0RJVl9N
QVNLOwo+ICsJfSBlbHNlIHsKPiArCQlkc2lfY2xrID0gZHNpX2Nsa19mcm9tX3BjbGsoaW50ZWxf
ZHNpLT5wY2xrLAo+ICsJCQkJCSAgICBpbnRlbF9kc2ktPnBpeGVsX2Zvcm1hdCwKPiArCQkJCQkg
ICAgaW50ZWxfZHNpLT5sYW5lX2NvdW50KTsKPiArCj4gKwkJcmV0ID0gZHNpX2NhbGNfbW5wKGRl
dl9wcml2LCBjb25maWcsIGRzaV9jbGspOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJRFJNX0RFQlVH
X0tNUygiZHNpX2NhbGNfbW5wIGZhaWxlZFxuIik7Cj4gKwkJCXJldHVybiByZXQ7Cj4gKwkJfQo+
ICAJfQo+ICAKPiAgCWlmIChpbnRlbF9kc2ktPnBvcnRzICYgKDEgPDwgUE9SVF9BKSkKPiAtLSAK
PiAyLjIzLjAKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
