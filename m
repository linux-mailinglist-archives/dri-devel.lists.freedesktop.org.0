Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5980634508
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 13:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA7589622;
	Tue,  4 Jun 2019 11:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78089622
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 11:04:53 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 04:04:52 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 04 Jun 2019 04:04:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Jun 2019 14:04:49 +0300
Date: Tue, 4 Jun 2019 14:04:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH libdrm 00/10] Add C8, 30bpp and FP16 support to modetest
Message-ID: <20190604110449.GB5942@intel.com>
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
 <CAKb7Uvi3dOhF7C=te5=yMqoohM6fqXWyJJgPRyCXOQ8psRx5vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvi3dOhF7C=te5=yMqoohM6fqXWyJJgPRyCXOQ8psRx5vg@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDQ6NTc6NDNQTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gU3VuLCBKdW4gMiwgMjAxOSBhdCA4OjQwIFBNIElsaWEgTWlya2luIDxpbWlya2lu
QGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIHBh
dHRlcm4gZ2VuZXJhdGlvbiBsb2dpYyB0byBzdXBwb3J0IGFkZGl0aW9uYWwKPiA+IGZvcm1hdHMs
IGFzIHdlbGwgYXMgYSBuZXcgImdyYWRpZW50IiBwYXR0ZXJuIChzZWUgcGF0Y2ggY29tbWVudHMg
b24gd2h5Cj4gPiBJIGZvdW5kIGl0IHVzZWZ1bCkuCj4gPgo+ID4gRnVydGhlcm1vcmUsIHRoZXNl
IGZvcm1hdHMgYXJlIHBpcGVkIHRocm91Z2ggdG8gbW9kZXRlc3QsIGluY2x1ZGluZyB0aGUKPiA+
IGFiaWxpdHkgdG8gc2V0IGEgZ2FtbWEgdGFibGUsIHdoaWNoIGlzIG5lY2Vzc2FyeSBmb3IgdGhl
IEM4IGluZGV4ZWQKPiA+IGZvcm1hdC4KPiA+Cj4gPiBUaGlzIHdhcyB0ZXN0ZWQgb24gbm91dmVh
dSwgYW5kIHVzZWQgZm9yIGJyaW5nLXVwIG9mIHRoZSBDOCwgWEIzMCwgYW5kCj4gPiBGUDE2IGZv
cm1hdHMgb24gdGhlIE5WSURJQSBoYXJkd2FyZSB0aGF0IHN1cHBvcnRzIHRoZXNlLgo+IAo+IEp1
c3QgdG8gZm9sbG93IHVwLCBJJ3ZlIHN1Y2Nlc3NmdWxseSB0ZXN0ZWQgb24gYW4gSW50ZWwgU0tM
IHdpdGggQzgKPiBhbmQgWEIzMC9YUjMwIGFzIHdlbGwgKGFuZCBjb25maXJtZWQgdGhhdCB0aGUg
R0FNTUFfTFVUIGdldHMgdW5zZXQgaW4KPiBhIHNlcXVlbmNlIG9mIEM4IGZvbGxvd2VkIGJ5IFhC
MzApLiBGUDE2IHdhcyBub3QgYXZhaWxhYmxlIG9uIHRoZQo+IGtlcm5lbCBJIGFtIGN1cnJlbnRs
eSB1c2luZyAoYW5kIHBlcmhhcHMgbm90IHRoZSBIVz8pCgpodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvc2VyaWVzLzYxMzQ1LwoKb3IgYSBzbGlnaHRseSBvbGRlciB2ZXJzaW9uOgpn
aXQ6Ly9naXRodWIuY29tL3ZzeXJqYWxhL2xpbnV4LmdpdCBmcDE2X3NjYW5vdXRfNAoKaW4gY2Fz
ZSB5b3Ugd2FudCB0byB0ZXN0IGl0LgoKPiAKPiAgIC1pbGlhCj4gCj4gPgo+ID4gSWxpYSBNaXJr
aW4gKDEwKToKPiA+ICAgdXRpbDogYWRkIEM4IGZvcm1hdCwgc3VwcG9ydCBpdCB3aXRoIFNNUFRF
IHBhdHRlcm4KPiA+ICAgdXRpbDogZml4IE1BS0VfUkdCQSBtYWNybyBmb3IgMTBicHAgbW9kZXMK
PiA+ICAgdXRpbDogYWRkIGdyYWRpZW50IHBhdHRlcm4KPiA+ICAgdXRpbDogYWRkIGZwMTYgZm9y
bWF0IHN1cHBvcnQKPiA+ICAgdXRpbDogYWRkIGNhaXJvIGRyYXdpbmcgZm9yIDMwYnBwIGZvcm1h
dHMgd2hlbiBhdmFpbGFibGUKPiA+ICAgbW9kZXRlc3Q6IGRvbid0IHByZXRlbmQgdGhhdCBhdG9t
aWMgbW9kZSBpbmNsdWRlcyBhIGZvcm1hdAo+ID4gICBtb2RldGVzdDogYWRkIGFuIGFkZF9wcm9w
ZXJ0eV9vcHRpb25hbCB2YXJpYW50IHRoYXQgZG9lcyBub3QgcHJpbnQKPiA+ICAgICBlcnJvcnMK
PiA+ICAgbW9kZXRlc3Q6IGFkZCBDOCBzdXBwb3J0IHRvIGdlbmVyYXRlIFNNUFRFIHBhdHRlcm4K
PiA+ICAgbW9kZXRlc3Q6IGFkZCB0aGUgYWJpbGl0eSB0byBzcGVjaWZ5IGZpbGwgcGF0dGVybnMg
b24gdGhlIGNvbW1hbmRsaW5lCj4gPiAgIG1vZGV0ZXN0OiBhZGQgRlAxNiBmb3JtYXQgc3VwcG9y
dAo+ID4KPiA+ICB0ZXN0cy9tb2RldGVzdC9idWZmZXJzLmMgIHwgIDEzICsrCj4gPiAgdGVzdHMv
bW9kZXRlc3QvbW9kZXRlc3QuYyB8IDEwOSArKysrKysrKy0tCj4gPiAgdGVzdHMvdXRpbC9mb3Jt
YXQuYyAgICAgICB8ICAgNyArCj4gPiAgdGVzdHMvdXRpbC9wYXR0ZXJuLmMgICAgICB8IDQzMiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIHRlc3RzL3V0aWwvcGF0
dGVybi5oICAgICAgfCAgIDcgKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNTQzIGluc2VydGlvbnMo
KyksIDI1IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAyLjIxLjAKPiA+CgotLSAKVmlsbGUg
U3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
