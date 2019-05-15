Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2E1FB54
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 22:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A998920E;
	Wed, 15 May 2019 20:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975D08920E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 20:04:00 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hR07s-0000bC-Ci; Wed, 15 May 2019 22:03:44 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Add hooks for suspend/resume
Date: Wed, 15 May 2019 22:03:43 +0200
Message-ID: <1842218.E6FT6db3r4@diego>
In-Reply-To: <20190515180503.GU17077@art_vandelay>
References: <20190502223808.185180-1-dianders@chromium.org>
 <CAD=FV=X=ScK0H-ZNcOeEta2BL+f4TSAmXS=D585omXxbRVZcyQ@mail.gmail.com>
 <20190515180503.GU17077@art_vandelay>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIDE1LiBNYWkgMjAxOSwgMjA6MDU6MDMgQ0VTVCBzY2hyaWViIFNlYW4gUGF1
bDoKPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMTowMToyNkFNIC0wNzAwLCBEb3VnIEFuZGVy
c29uIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IE9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDEwOjU4
IEFNIFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPiB3cm90ZToKPiA+IAo+ID4gPiBPbiBUaHUs
IE1heSAwMiwgMjAxOSBhdCAwMzozODowN1BNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3Rl
Ogo+ID4gPiA+IE9uIFJvY2tjaGlwIHJrMzI4OC1iYXNlZCBDaHJvbWVib29rcyB3aGVuIHlvdSBk
byBhIHN1c3BlbmQvcmVzdW1lCj4gPiA+ID4gY3ljbGU6Cj4gPiA+ID4KPiA+ID4gPiAxLiBZb3Ug
bG9zZSB0aGUgYWJpbGl0eSB0byBkZXRlY3QgYW4gSERNSSBkZXZpY2UgYmVpbmcgcGx1Z2dlZCBp
bi4KPiA+ID4gPgo+ID4gPiA+IDIuIElmIHlvdSdyZSB1c2luZyB0aGUgaTJjIGJ1cyBidWlsdCBp
biB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMKPiA+ID4gPiB3b3JraW5nLgo+ID4gPiA+Cj4gPiA+
ID4gTGV0J3MgYWRkIGEgaG9vayB0byB0aGUgY29yZSBkdy1oZG1pIGRyaXZlciBzbyB0aGF0IHdl
IGNhbiBjYWxsIGl0IGluCj4gPiA+ID4gZHdfaGRtaS1yb2NrY2hpcCBpbiB0aGUgbmV4dCBjb21t
aXQuCj4gPiA+ID4KPiA+ID4gPiBOT1RFOiB0aGUgZXhhY3Qgc2V0IG9mIHN0ZXBzIEkndmUgZG9u
ZSBoZXJlIGluIHJlc3VtZSBjb21lIGZyb20KPiA+ID4gPiBsb29raW5nIGF0IHRoZSBub3JtYWwg
ZHdfaGRtaSBpbml0IHNlcXVlbmNlIGluIHVwc3RyZWFtIExpbnV4IHBsdXMgdGhlCj4gPiA+ID4g
c2VxdWVuY2UgdGhhdCB3ZSBkaWQgaW4gZG93bnN0cmVhbSBDaHJvbWUgT1MgMy4xNC4gIFRlc3Rp
bmcgc2hvdyB0aGF0Cj4gPiA+ID4gaXQgc2VlbXMgdG8gd29yaywgYnV0IGlmIGFuIGV4dHJhIHN0
ZXAgaXMgbmVlZGVkIG9yIHNvbWV0aGluZyBoZXJlIGlzCj4gPiA+ID4gbm90IG5lZWRlZCB3ZSBj
b3VsZCBpbXByb3ZlIGl0Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBB
bmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMjEgKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ID4gIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAg
ICAgICAgICAgIHwgIDMgKysrCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMKPiA+ID4gPiBpbmRleCBkYjc2MTMyOWExZTMuLjRiMzhiZmQ0M2U1OSAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gPiA+
ID4gQEAgLTI3ODAsNiArMjc4MCwyNyBAQCB2b2lkIGR3X2hkbWlfdW5iaW5kKHN0cnVjdCBkd19o
ZG1pICpoZG1pKQo+ID4gPiA+ICB9Cj4gPiA+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKGR3X2hkbWlf
dW5iaW5kKTsKPiA+ID4gPgo+ID4gPiA+ICtpbnQgZHdfaGRtaV9zdXNwZW5kKHN0cnVjdCBkd19o
ZG1pICpoZG1pKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30K
PiA+ID4gPiArRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9zdXNwZW5kKTsKPiA+ID4gPiArCj4g
PiA+ID4gK2ludCBkd19oZG1pX3Jlc3VtZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiA+ID4gPiAr
ewo+ID4gPiA+ICsgICAgIGluaXRpYWxpemVfaGRtaV9paF9tdXRlcyhoZG1pKTsKPiA+ID4gPiAr
Cj4gPiA+ID4gKyAgICAgZHdfaGRtaV9zZXR1cF9pMmMoaGRtaSk7Cj4gPiA+ID4gKyAgICAgaWYg
KGhkbWktPmkyYykKPiA+ID4gPiArICAgICAgICAgICAgIGR3X2hkbWlfaTJjX2luaXQoaGRtaSk7
Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGlmIChoZG1pLT5waHkub3BzLT5zZXR1cF9ocGQpCj4g
PiA+ID4gKyAgICAgICAgICAgICBoZG1pLT5waHkub3BzLT5zZXR1cF9ocGQoaGRtaSwgaGRtaS0+
cGh5LmRhdGEpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICByZXR1cm4gMDsKPiA+ID4gPiArfQo+
ID4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChkd19oZG1pX3Jlc3VtZSk7Cj4gPiA+Cj4gPiA+IEJv
dGggcGF0Y2hlcyBsb29rIGdvb2QgdG8gbWUsIEknZCBwcm9iYWJseSBwcmVmZXIgdG8ganVzdCBz
bWFzaCB0aGVtIHRvZ2V0aGVyLAo+ID4gPiBidXQgbWVoLgo+ID4gPgo+ID4gPiBJZiBubyBvbmUg
bW9yZSBhdXRob3JpdGF0aXZlIGNoaW1lcyBpbiwgSSdsbCBhcHBseSB0aGVtIHRvIC1taXNjIGlu
IGEgZmV3IGRheXMuCj4gPiAKPiA+IFN1cmUuICBJIGNhbiBzbWFzaCB0aGVtIGFuZCByZS1wb3N0
IG9yIHlvdSBjYW4gc21hc2ggdGhlbSBmb3IgbWUgb3Igd2UKPiA+IGNhbiBrZWVwIHRoZW0gYXMt
aXMuICBJIG9yaWdpbmFsbHkgc2VwYXJhdGVkIGJlY2F1c2UgSSB3YXNuJ3Qgc3VyZSBpZgo+ID4g
dGhleSdkIGV2ZW50dWFsbHkgZ28gdGhyb3VnaCBkaWZmZXJlbnQgdHJlZXMuICBKdXN0IGxldCBt
ZSBrbm93ISAgOi0pCj4gCj4gRGVmaW5pdGVseSBubyBuZWVkIHRvIHJlcG9zdC4gSXQncyBlbnRp
cmVseSBwb3NzaWJsZSBBbmRyemVqIG9yIEhlaWtvIHByZWZlciB0bwo+IGhhdmUgdGhlIGR3LWhk
bWkgc3R1ZmYgYnJva2VuIG91dCBhbnl3YXlzLiBNeSBvcGluaW9uIGlzIG9mIGxpdHRsZSB2YWx1
ZSBoZXJlIDopCgpJIGd1ZXNzIG15IG93biBwcmVmZXJlbmNlIGlzIHRvIGtlZXAgdGhlbSBhcyB0
aGV5IGFyZSBub3cgLSBzbyBzZXBhcmF0ZS4KSXQgbWFrZXMgaXQgZWFzaWVyIHRvIHNlZSB3aGF0
IGdldHMgZG9uZSBhbmQgYWxzbyBrZWVwcyB0aGUgYm91bmRhcnkgb24Kd2hlcmUgdG8gc3BsaXQg
cHJldHR5IGNsZWFyLgoKCkhlaWtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
