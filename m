Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C6F2F03
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B536F682;
	Thu,  7 Nov 2019 13:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315886F682
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:17:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DD0671D;
 Thu,  7 Nov 2019 14:17:53 +0100 (CET)
Date: Thu, 7 Nov 2019 15:17:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191107131743.GA24983@pendragon.ideasonboard.com>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
 <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
 <20191106100059.GA4878@pendragon.ideasonboard.com>
 <20191106100205.GB4878@pendragon.ideasonboard.com>
 <20191106104628.opzkif5ab5cinee6@uno.localdomain>
 <20191106125225.GC4878@pendragon.ideasonboard.com>
 <20191106125653.GD4878@pendragon.ideasonboard.com>
 <20191107111327.bl2ynkleesx4h2ne@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107111327.bl2ynkleesx4h2ne@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573132673;
 bh=i9hLfhedFfpFTtnN1Vl7N9qMVOHmqH8JXyPS8D38zS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=powb7DD2TYnhWqW6pKCHYtIW6hoQQ8NbgyyoJMvphwwpn//7FpH0Lhb7Tb3nauFZK
 xCNCX+1kZo33CIJUU03XmTQ3mhtNc/oHI+iKgOhxbgP+QT4QN+Faa3KTR0r6jQb+dh
 Ac1uvFwGe5k5gL2CC0yg1ErgrhOezCsrPC4qeivo=
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

SGkgSmFjb3BvLAoKT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTI6MTM6MzVQTSArMDEwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDAyOjU2OjUzUE0gKzAy
MDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAw
Mjo1MjoyNVBNICswMjAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4+IE9uIFdlZCwgTm92
IDA2LCAyMDE5IGF0IDExOjQ2OjI4QU0gKzAxMDAsIEphY29wbyBNb25kaSB3cm90ZToKPiA+Pj4g
T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTI6MDI6MDVQTSArMDIwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiA+Pj4+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDEyOjAwOjU5UE0gKzAyMDAs
IExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPj4+Pj4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQg
MDE6NDA6MTNQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPj4+Pj4+IE9uIFdlZCwgNiBO
b3YgMjAxOSBhdCAwNTo1NiwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPj4+Pj4+PiBPbiBXZWQsIDYg
Tm92IDIwMTkgYXQgMDU6NDksIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPj4+Pj4+Pj4KPiA+
Pj4+Pj4+PiBIaSBEYXZlLAo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gSGFzIHRoaXMgcHVsbCByZXF1
ZXN0IGZhbGxlbiB0aHJvdWdoIHRoZSBjcmFja3MgPwo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEl0IGZl
bGwgZG93biBhIGRpZmZlcmVudCBjcmFjayB0aGFuIHVzdWFsLCBpdCBtYWRlIGl0IGZyb20gcGF0
Y2h3b3JrCj4gPj4+Pj4+PiBvbnRvIG15IGhhcmQgZHJpdmUsIGJ1dCB0aGVuIEkgZGlkbid0IGV4
ZWN1dGUgdGhlIHB1bGwuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSSd2ZSBwdWxsZWQgaXQgZG93biwg
dGhhbmtzIGZvciByZW1pbmRlci4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gTm93IGl0IGZhaWxlZCBhcyBJ
IG1lbnRpb25lZCBvbiBpcmMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEkgdGhpbmsgdGhlIG5ldyBrY29u
ZmlnIG9wdGlvbiBuZWVkcyB0byBiZSBhIHRyaXN0YXRlLCBvdGhlcndpc2UKPiA+Pj4+Pj4gc2V0
dGluZyBpdCB0byBZIGFuZCBoYXZpbmcgcmNhci1kdSBhcyBNIGZhaWxzIHRvIGxpbmsKPiA+Pj4+
Pgo+ID4+Pj4+IFNvcnJ5IGFib3V0IHRoYXQgOi1TIEJvdGggSSBhbmQgdGhlIDAtZGF5IGJvdCBm
YWlsZWQgdG8gY2F0Y2ggaXQuCj4gPj4+Pj4gSmFjb3BvLCBjb3VsZCB5b3UgcGxlYXNlIGhhdmUg
YSBsb29rID8gSSdtIGFmcmFpZCB0aGlzIGxpa2VseSBtZWFuIGEgbmV3Cj4gPj4+Pj4gdmVyc2lv
biBvZiB0aGUgc2VyaWVzLCBhbmQgdGh1cyBtaXNzaW5nIHRoZSBtZXJnZSB3aW5kb3csIGFzIHdl
J3JlCj4gPj4+Pj4gYWxyZWFkeSBhdCAtcmM2Lgo+ID4+Pgo+ID4+PiBJIG1hbmFnZWQgdG8gcmVw
cm9kdWNlIGl0IGJ5IHNldHRpbmcgRFJNPW0uCj4gPj4+IFJDQVJfQ01NIHN0YXlzIGluZGVlZCA9
eSBhcyBpdCdzIGEgYm9vbC4gU2ltcGx5IHNldHRpbmcgaXQgdG8gdHJpc3RhdGUKPiA+Pj4gaXMg
ZW5vdWdoIHRvIGhhdmUgaXQgc2V0IHRvID1tIHdoZW4gRFJNPW0uCj4gPj4+Cj4gPj4+IENvdWxk
IHRoaXMgYmUgY2hhbmdlZCB3aGVuIGFwcGx5aW5nIHRoZSBzZXJpZXMgPwo+ID4+Pgo+ID4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L0tjb25maWcKPiA+Pj4gaW5kZXggNTM5ZDIzMjc5MGQxLi5lNjYwN2I1Yzhi
YjMgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L0tjb25maWcKPiA+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZwo+ID4+PiBAQCAtMTQsNyAr
MTQsNyBAQCBjb25maWcgRFJNX1JDQVJfRFUKPiA+Pj4gICAgICAgICAgIElmIE0gaXMgc2VsZWN0
ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCByY2FyLWR1LWRybS4KPiA+Pj4KPiA+Pj4gIGNv
bmZpZyBEUk1fUkNBUl9DTU0KPiA+Pj4gLSAgICAgICBib29sICJSLUNhciBEVSBDb2xvciBNYW5h
Z2VtZW50IE1vZHVsZSAoQ01NKSBTdXBwb3J0Igo+ID4+PiArICAgICAgIHRyaXN0YXRlICJSLUNh
ciBEVSBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZSAoQ01NKSBTdXBwb3J0Igo+ID4+PiAgICAgICAg
IGRlcGVuZHMgb24gRFJNICYmIE9GCj4gPj4+ICAgICAgICAgZGVwZW5kcyBvbiBEUk1fUkNBUl9E
VQo+ID4+PiAgICAgICAgIGhlbHAKPiA+Pgo+ID4+IFRoaXMgbG9va3MgcmVhc29uYWJsZSB0byBt
ZS4gSSdsbCBsZXQgRGF2ZSBkZWNpZGUgaWYgaGUgd2FudHMgdG8gYXBwbHkKPiA+PiB0aGlzIGNo
YW5nZSBoaW1zZWxmLCBvciBpZiBJIHNob3VsZCBzZW5kIGEgbmV3IHB1bGwgcmVxdWVzdCBmb3Ig
djUuNi4KPiA+Cj4gPiBBY3R1YWxseSB0aGlzIHdvbid0IHdvcmsuIFdpdGggRFJNX1JDQVJfRFU9
eSBhbmQgRFJNX1JDQVJfQ01NPW0geW91J2xsCj4gPiBoYXZlIGEgbGluayBmYWlsdXJlLgo+IAo+
IFlvdSdyZSByaWdodC4uIEFjdHVhbGx5IGp1c3QgY2hhbmdpbmcgdGhlIFJDQVJfQ01NIG9wdGlv
biB0byB0cmlzdGF0ZQo+IHdvbid0IGJlIGVub3VnaC4gQWRkaW5nICJpbXBseSBEUk1fUkNBUl9D
TU0iIHRvIHRoZSBEVSBvcHRpb24gaW5zdGVhZAo+IG1ha2VzIGl0IGltcG9zc2libGUgdG8gc2Vs
ZWN0IENNTT1tIHdoZW4gRFU9eSBhbmQgdmljZXZlcnNhLCBzbyBpdAo+IHNob3VsZCBiZSBlbm91
Z2guCj4gCj4gPiBMZXQncyBmaXggdGhpcyBwcm9wZXJseSBmb3IgdjUuNi4gQ291bGQgeW91IHBs
ZWFzZSBwcm9wb3NlIGEgZml4IHRoYXQKPiA+IHdpbGwgd29yayB3aXRoIGFsbCBjb21iaW5hdGlv
bnMgb2YgRFJNLCBEUk1fUkNBUl9EVSBhbmQgRFJNX1JDQVJfQ01NID8KPiAKPiBDYW4gSSBzZW5k
IGEgdjYuMSB2ZXJzaW9uIG9mIHRoZSBDTU0gcGF0Y2ggb25seSwgb3Igd291bGQgeW91IHByZWZl
ciBhCj4gdjcgPyB3ZSdyZSBhbnl3YXkgbGF0ZSBmb3IgNS41IEkgcHJlc3VtZQoKdjYuMSBzaG91
bGQgYmUgZW5vdWdoLiBQbGVhc2UgbWFrZSBzdXJlIHlvdSB0ZXN0IGFsbCBjb21iaW5hdGlvbnMg
b2YKQ09ORklHX0RSTV9SQ0FSX0RVIGFuZCBDT05GSUdfRFJNX1JDQVJfQ01NIDotKQoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
