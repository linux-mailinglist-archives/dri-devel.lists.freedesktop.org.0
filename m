Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D626FF1658
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 13:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85489CF6;
	Wed,  6 Nov 2019 12:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA8089CF6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 12:52:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D897B52C;
 Wed,  6 Nov 2019 13:52:33 +0100 (CET)
Date: Wed, 6 Nov 2019 14:52:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191106125225.GC4878@pendragon.ideasonboard.com>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
 <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
 <20191106100059.GA4878@pendragon.ideasonboard.com>
 <20191106100205.GB4878@pendragon.ideasonboard.com>
 <20191106104628.opzkif5ab5cinee6@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106104628.opzkif5ab5cinee6@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573044754;
 bh=zN3vBo7fAD4jIAhJlbFynqQqHHObQ2cb7eAY9s4FwFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cFvNzlXRMypV3020x3OFvqtHH1APm+4YLEPtZx0tr9XdY23r9tKdfxrUG98v9M9oV
 tTm0fp87hS5I+cdBkpXaD0dLtEFzPaO87Qry0URBlickgivHyEm6cx8CuivFhvdQ/F
 oWA3SZlmPW/53VFFVErJA3AbJzjPyGgNkousjKNQ=
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

SGVsbG8sCgpPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAxMTo0NjoyOEFNICswMTAwLCBKYWNvcG8g
TW9uZGkgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTI6MDI6MDVQTSArMDIwMCwg
TGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDEyOjAw
OjU5UE0gKzAyMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgTm92IDA2
LCAyMDE5IGF0IDAxOjQwOjEzUE0gKzEwMDAsIERhdmUgQWlybGllIHdyb3RlOgo+ID4gPiA+IE9u
IFdlZCwgNiBOb3YgMjAxOSBhdCAwNTo1NiwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPiA+ID4gPiBP
biBXZWQsIDYgTm92IDIwMTkgYXQgMDU6NDksIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IEhpIERhdmUsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhhcyB0
aGlzIHB1bGwgcmVxdWVzdCBmYWxsZW4gdGhyb3VnaCB0aGUgY3JhY2tzID8KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBJdCBmZWxsIGRvd24gYSBkaWZmZXJlbnQgY3JhY2sgdGhhbiB1c3VhbCwgaXQgbWFk
ZSBpdCBmcm9tIHBhdGNod29yawo+ID4gPiA+ID4gb250byBteSBoYXJkIGRyaXZlLCBidXQgdGhl
biBJIGRpZG4ndCBleGVjdXRlIHRoZSBwdWxsLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkndmUgcHVs
bGVkIGl0IGRvd24sIHRoYW5rcyBmb3IgcmVtaW5kZXIuCj4gPiA+ID4KPiA+ID4gPiBOb3cgaXQg
ZmFpbGVkIGFzIEkgbWVudGlvbmVkIG9uIGlyYy4KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgdGhl
IG5ldyBrY29uZmlnIG9wdGlvbiBuZWVkcyB0byBiZSBhIHRyaXN0YXRlLCBvdGhlcndpc2UKPiA+
ID4gPiBzZXR0aW5nIGl0IHRvIFkgYW5kIGhhdmluZyByY2FyLWR1IGFzIE0gZmFpbHMgdG8gbGlu
awo+ID4gPgo+ID4gPiBTb3JyeSBhYm91dCB0aGF0IDotUyBCb3RoIEkgYW5kIHRoZSAwLWRheSBi
b3QgZmFpbGVkIHRvIGNhdGNoIGl0Lgo+ID4gPiBKYWNvcG8sIGNvdWxkIHlvdSBwbGVhc2UgaGF2
ZSBhIGxvb2sgPyBJJ20gYWZyYWlkIHRoaXMgbGlrZWx5IG1lYW4gYSBuZXcKPiA+ID4gdmVyc2lv
biBvZiB0aGUgc2VyaWVzLCBhbmQgdGh1cyBtaXNzaW5nIHRoZSBtZXJnZSB3aW5kb3csIGFzIHdl
J3JlCj4gPiA+IGFscmVhZHkgYXQgLXJjNi4KPiAKPiBJIG1hbmFnZWQgdG8gcmVwcm9kdWNlIGl0
IGJ5IHNldHRpbmcgRFJNPW0uCj4gUkNBUl9DTU0gc3RheXMgaW5kZWVkID15IGFzIGl0J3MgYSBi
b29sLiBTaW1wbHkgc2V0dGluZyBpdCB0byB0cmlzdGF0ZQo+IGlzIGVub3VnaCB0byBoYXZlIGl0
IHNldCB0byA9bSB3aGVuIERSTT1tLgo+IAo+IENvdWxkIHRoaXMgYmUgY2hhbmdlZCB3aGVuIGFw
cGx5aW5nIHRoZSBzZXJpZXMgPwo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZwo+IGluZGV4IDUz
OWQyMzI3OTBkMS4uZTY2MDdiNWM4YmIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9LY29uZmlnCj4g
QEAgLTE0LDcgKzE0LDcgQEAgY29uZmlnIERSTV9SQ0FSX0RVCj4gICAgICAgICAgIElmIE0gaXMg
c2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCByY2FyLWR1LWRybS4KPiAKPiAgY29u
ZmlnIERSTV9SQ0FSX0NNTQo+IC0gICAgICAgYm9vbCAiUi1DYXIgRFUgQ29sb3IgTWFuYWdlbWVu
dCBNb2R1bGUgKENNTSkgU3VwcG9ydCIKPiArICAgICAgIHRyaXN0YXRlICJSLUNhciBEVSBDb2xv
ciBNYW5hZ2VtZW50IE1vZHVsZSAoQ01NKSBTdXBwb3J0Igo+ICAgICAgICAgZGVwZW5kcyBvbiBE
Uk0gJiYgT0YKPiAgICAgICAgIGRlcGVuZHMgb24gRFJNX1JDQVJfRFUKPiAgICAgICAgIGhlbHAK
ClRoaXMgbG9va3MgcmVhc29uYWJsZSB0byBtZS4gSSdsbCBsZXQgRGF2ZSBkZWNpZGUgaWYgaGUg
d2FudHMgdG8gYXBwbHkKdGhpcyBjaGFuZ2UgaGltc2VsZiwgb3IgaWYgSSBzaG91bGQgc2VuZCBh
IG5ldyBwdWxsIHJlcXVlc3QgZm9yIHY1LjYuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hh
cnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
