Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D49076718
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9C96ED4F;
	Fri, 26 Jul 2019 13:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8636ED4F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 77030FB03;
 Fri, 26 Jul 2019 15:16:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3_bPs4b8AVr; Fri, 26 Jul 2019 15:16:11 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 58A3546AA1; Fri, 26 Jul 2019 15:16:11 +0200 (CEST)
Date: Fri, 26 Jul 2019 15:16:11 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/3] drm/panel: jh057n00900: Move dsi init sequence to
 prepare
Message-ID: <20190726131611.GA13619@bogon.m.sigxcpu.org>
References: <cover.1564132646.git.agx@sigxcpu.org>
 <20190726102529.GB15658@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726102529.GB15658@ravnborg.org>
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLApPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAxMjoyNToyOVBNICswMjAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gSGkgR3VpZG8uCj4gCj4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTE6
MjE6NDBBTSArMDIwMCwgR3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gPiBJZiB0aGUgcGFuZWwgaXMg
d3JhcHBlZCBpbiBhIHBhbmVsX2JyaWRnZSBpdCBnZXRzIHByZXBhcigpZWQgYmVmb3JlIHRoZQo+
ID4gdXBzdHJlYW0gRFNJIGJyaWRnZSB3aGljaCBjYW4gY2F1c2UgaGFuZ3MgKGUuZy4gd2l0aCBp
bXgtbndsIHNpbmNlIGNsb2Nrcwo+ID4gYXJlIG5vdCBlbmFibGVkIHlldCkuIFRvIGF2b2lkIHRo
aXMgbW92ZSB0aGUgcGFuZWwncyBmaXJzdCBEU0kgYWNjZXNzIHRvCj4gPiBlbmFibGUoKSBzbyB0
aGUgdXBzdHJlYW0gYnJpZGdlIGNhbiBwcmVwYXJlIHRoZSBEU0kgaG9zdCBjb250cm9sbGVyIGlu
Cj4gPiBpdCdzIHByZV9lbmFibGUoKS4KPiA+IAo+ID4gVGhlIHNlY29uZCBwYXRjaCBtYWtlcyB0
aGUgZGlzYWJsZSgpIGNhbGwgc3ltbWV0cmljIHRvIHRoZSBhYm92ZSBhbmQgdGhlIHRoaXJkCj4g
PiBvbmUganVzdCBlYXNlcyBkZWJ1Z2dpbmcuCj4gPiAKPiA+IEd1aWRvIEfDvG50aGVyICgzKToK
PiA+ICAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogTW92ZSBwYW5lbCBEU0kgaW5pdCB0byBlbmFi
bGUoKQo+ID4gICBkcm0vcGFuZWw6IGpoMDU3bjAwOTAwOiBNb3ZlIG1pcGlfZHNpX2Rjc19zZXRf
ZGlzcGxheV9vZmYgdG8gZGlzYWJsZSgpCj4gPiAgIGRybS9wYW5lbDogamgwNTduMDA5MDA6IFBy
aW50IGVycm9yIGNvZGUgb24gYWxsIERSTV9ERVZfRVJST1IoKXMKPiAKPiBQYXRjaCAxICsgMyBh
cmUgYm90aDoKPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
IAo+IFNlZSBjb21tZW50IG9uIHBhdGNoIDIuCgpGaXhlZCBpbiB2Mi4KCj4gCj4gV2hpbGUgeW91
IGFyZSB0b3VjaGluZyB0aGlzIGRyaXZlciBjYW4geW91IG1ha2UgYW4gZXh0cmEgcGF0Y2g/Cj4g
Cj4gVG9kYXkgdGhlIGRyaXZlciBjYWxscyB0aGUgaW50ZXJuYWwgcHJlcGFyZSxlbmFibGUsZGlz
YWJsZSx1bnByZXBhcmUKPiBmdW5jdGlvbnMuCj4gVGhlIHJpZ2h0IHdheSB0byBkbyBpdCBpcyB0
byB1c2UgdGhlCj4gZHJtX3BhbmVsXyhwcmVwYXJlLGVuYWJsZSxkaXNhYmxlLHVucHJlcGFyZSkg
dmFyaWFudHMuCgpJIGhvcGUgSSBnb3QgdGhpcyByaWdodCBpbiB2MiBidXQuLi4KCj4gCj4gVGhl
IGJlbmVmaXQgaXMgdGhhdCB3ZSBjYW4gbW92ZSBhIGxpdHRsZSBsb2dpYyB0byB0aGVzZSBmdW5j
dGlvbnMKPiBhbmQgdGhlIGRyaXZlcnMgd2lsbCB0aGVuIGJlbmVmaXQgZnJvbSB0aGlzLgo+IAo+
IFR3byB0aGluZ3MgSSBoYXZlIGluIG15IGxvY2FsIHF1ZXVlOgo+IC0gTW92ZSBib29sIGZvciBw
cmVwYXJlZC9lbmFibGVkCj4gICAodG8gcHJvdGVjdCB0aGF0IHdlIGRvIG5vdCBwcmVwYXJlL2Vu
YWJsZSB0d2ljZSkKPiAtIGJhY2tsaWdodCBzdXBwb3J0CgouLi5pIGhvcGUgc28gc2luY2Ugd2hh
dCB5b3UgaGF2ZSBwbGFubmVkIGhlcmUgd291bGQgZWxpbWluYXRlIGxvdHMgb2YKY29kZSBkdXBs
aWNhdGlvbiBpbiB0aGUgcGFuZWwgZHJpdmVycy4KQ2hlZXJzIGFuZCB0aGFua3MgZm9yIGhhdmlu
ZyBhIGxvb2shCiAtLSBHdWlkbwoKPiAKPiBUaGlzIGRyaXZlciB3aWxsIGJlbmVmaXQgZm9ybSBi
b3RoIGFuZCB0aGlzIGxpdHRsZSBtb2RpZmljYXRpb24gd2lsbAo+IG1ha2UgaXQgc2ltcGxlciB0
byBpbnRyb2R1Y2UuCj4gSSBjYW4gYWxzbyBwcmVwYXJlIHRoZSBwYXRjaCBpZiB5b3UgcHJlZmVy
Lgo+IAo+IAlTYW0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
