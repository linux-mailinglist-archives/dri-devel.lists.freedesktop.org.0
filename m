Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD79F1668
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 13:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DEF6ED1F;
	Wed,  6 Nov 2019 12:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B211D6ED1F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 12:57:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 159B452C;
 Wed,  6 Nov 2019 13:57:02 +0100 (CET)
Date: Wed, 6 Nov 2019 14:56:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191106125653.GD4878@pendragon.ideasonboard.com>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
 <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
 <20191106100059.GA4878@pendragon.ideasonboard.com>
 <20191106100205.GB4878@pendragon.ideasonboard.com>
 <20191106104628.opzkif5ab5cinee6@uno.localdomain>
 <20191106125225.GC4878@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106125225.GC4878@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573045022;
 bh=0uP6pN9Bk3ykqEcOHmUkcSiLf1Dx7PTQmBAcUfGn1FI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROBJRptvluRvYeoCEsmh70Z4yd2aC8DyBM1Bmuc9pv1FXUO5eHll3oQ5fvihJeT3s
 kHMTD3b3XUvvyE08gRCDA8puXLFcAzxJDNeYlMLhPtP7uuUJ2Sjz+jmELd8DtR0c/c
 qLzUxAQcYCe+knM3HS0egu86gzo47vrc0ddfLDeY=
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

SGkgSmFjb3BvLAoKT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDI6NTI6MjVQTSArMDIwMCwgTGF1
cmVudCBQaW5jaGFydCB3cm90ZToKPiBPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAxMTo0NjoyOEFN
ICswMTAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAx
MjowMjowNVBNICswMjAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiBPbiBXZWQsIE5v
diAwNiwgMjAxOSBhdCAxMjowMDo1OVBNICswMjAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+
ID4gPiA+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDAxOjQwOjEzUE0gKzEwMDAsIERhdmUgQWly
bGllIHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCA2IE5vdiAyMDE5IGF0IDA1OjU2LCBEYXZlIEFp
cmxpZSB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkLCA2IE5vdiAyMDE5IGF0IDA1OjQ5LCBMYXVy
ZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSGkgRGF2ZSwK
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEhhcyB0aGlzIHB1bGwgcmVxdWVzdCBmYWxsZW4g
dGhyb3VnaCB0aGUgY3JhY2tzID8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSXQgZmVsbCBkb3du
IGEgZGlmZmVyZW50IGNyYWNrIHRoYW4gdXN1YWwsIGl0IG1hZGUgaXQgZnJvbSBwYXRjaHdvcmsK
PiA+ID4gPiA+ID4gb250byBteSBoYXJkIGRyaXZlLCBidXQgdGhlbiBJIGRpZG4ndCBleGVjdXRl
IHRoZSBwdWxsLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJJ3ZlIHB1bGxlZCBpdCBkb3duLCB0
aGFua3MgZm9yIHJlbWluZGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vdyBpdCBmYWlsZWQgYXMg
SSBtZW50aW9uZWQgb24gaXJjLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgdGhpbmsgdGhlIG5ldyBr
Y29uZmlnIG9wdGlvbiBuZWVkcyB0byBiZSBhIHRyaXN0YXRlLCBvdGhlcndpc2UKPiA+ID4gPiA+
IHNldHRpbmcgaXQgdG8gWSBhbmQgaGF2aW5nIHJjYXItZHUgYXMgTSBmYWlscyB0byBsaW5rCj4g
PiA+ID4KPiA+ID4gPiBTb3JyeSBhYm91dCB0aGF0IDotUyBCb3RoIEkgYW5kIHRoZSAwLWRheSBi
b3QgZmFpbGVkIHRvIGNhdGNoIGl0Lgo+ID4gPiA+IEphY29wbywgY291bGQgeW91IHBsZWFzZSBo
YXZlIGEgbG9vayA/IEknbSBhZnJhaWQgdGhpcyBsaWtlbHkgbWVhbiBhIG5ldwo+ID4gPiA+IHZl
cnNpb24gb2YgdGhlIHNlcmllcywgYW5kIHRodXMgbWlzc2luZyB0aGUgbWVyZ2Ugd2luZG93LCBh
cyB3ZSdyZQo+ID4gPiA+IGFscmVhZHkgYXQgLXJjNi4KPiA+IAo+ID4gSSBtYW5hZ2VkIHRvIHJl
cHJvZHVjZSBpdCBieSBzZXR0aW5nIERSTT1tLgo+ID4gUkNBUl9DTU0gc3RheXMgaW5kZWVkID15
IGFzIGl0J3MgYSBib29sLiBTaW1wbHkgc2V0dGluZyBpdCB0byB0cmlzdGF0ZQo+ID4gaXMgZW5v
dWdoIHRvIGhhdmUgaXQgc2V0IHRvID1tIHdoZW4gRFJNPW0uCj4gPiAKPiA+IENvdWxkIHRoaXMg
YmUgY2hhbmdlZCB3aGVuIGFwcGx5aW5nIHRoZSBzZXJpZXMgPwo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L0tjb25maWcKPiA+IGluZGV4IDUzOWQyMzI3OTBkMS4uZTY2MDdiNWM4YmIzIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvS2NvbmZpZwo+ID4gQEAgLTE0LDcgKzE0LDcgQEAgY29uZmlnIERS
TV9SQ0FSX0RVCj4gPiAgICAgICAgICAgSWYgTSBpcyBzZWxlY3RlZCB0aGUgbW9kdWxlIHdpbGwg
YmUgY2FsbGVkIHJjYXItZHUtZHJtLgo+ID4gCj4gPiAgY29uZmlnIERSTV9SQ0FSX0NNTQo+ID4g
LSAgICAgICBib29sICJSLUNhciBEVSBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZSAoQ01NKSBTdXBw
b3J0Igo+ID4gKyAgICAgICB0cmlzdGF0ZSAiUi1DYXIgRFUgQ29sb3IgTWFuYWdlbWVudCBNb2R1
bGUgKENNTSkgU3VwcG9ydCIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBEUk0gJiYgT0YKPiA+ICAg
ICAgICAgZGVwZW5kcyBvbiBEUk1fUkNBUl9EVQo+ID4gICAgICAgICBoZWxwCj4gCj4gVGhpcyBs
b29rcyByZWFzb25hYmxlIHRvIG1lLiBJJ2xsIGxldCBEYXZlIGRlY2lkZSBpZiBoZSB3YW50cyB0
byBhcHBseQo+IHRoaXMgY2hhbmdlIGhpbXNlbGYsIG9yIGlmIEkgc2hvdWxkIHNlbmQgYSBuZXcg
cHVsbCByZXF1ZXN0IGZvciB2NS42LgoKQWN0dWFsbHkgdGhpcyB3b24ndCB3b3JrLiBXaXRoIERS
TV9SQ0FSX0RVPXkgYW5kIERSTV9SQ0FSX0NNTT1tIHlvdSdsbApoYXZlIGEgbGluayBmYWlsdXJl
LgoKTGV0J3MgZml4IHRoaXMgcHJvcGVybHkgZm9yIHY1LjYuIENvdWxkIHlvdSBwbGVhc2UgcHJv
cG9zZSBhIGZpeCB0aGF0CndpbGwgd29yayB3aXRoIGFsbCBjb21iaW5hdGlvbnMgb2YgRFJNLCBE
Uk1fUkNBUl9EVSBhbmQgRFJNX1JDQVJfQ01NID8KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5j
aGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
