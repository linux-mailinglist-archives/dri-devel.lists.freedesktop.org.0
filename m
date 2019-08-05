Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB0815D8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5566D89728;
	Mon,  5 Aug 2019 09:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3F489728
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:48:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 071782F9;
 Mon,  5 Aug 2019 11:48:33 +0200 (CEST)
Date: Mon, 5 Aug 2019 12:48:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Message-ID: <20190805094832.GC29747@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082020.GH5008@pendragon.ideasonboard.com>
 <TY1PR01MB1770CA2012398B421E609D54C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770CA2012398B421E609D54C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564998514;
 bh=Hlh6gN/t4xFizjbxHfFQzVLy6XLN3G3JoWMd+k4cq+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=njb4pAnNHQunR991gcRzW/2IP86RN3qunFwrTDBtWjtmCMef9nA6OU6nVetreRI1n
 QIH94hCpAjye0HhE76vTyRnB0VUDhLkJGvi2wjx53YDM6xUJ0/L3Yo2DdP10d/mvyA
 fXASI8aA+Balq23VeA4qYdIQxtddCn/45ZRba3Qc=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAwOToxMjozNEFNICswMDAwLCBG
YWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBTZW50OiAwMiBBdWd1c3QgMjAxOSAwOToy
MAo+ID4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDcvMTJdIGRybTogcmNhci1kdTogbHZkczog
QWRkIHN1cHBvcnQgZm9yIGR1YWwgbGluayBwYW5lbHMKPiA+IAo+ID4gSGkgRmFicml6aW8sCj4g
PiAKPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+ID4gCj4gPiBPbiBGcmksIEF1ZyAwMiwg
MjAxOSBhdCAwODozNDowNEFNICswMTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gPiA+IElm
IHRoZSBkaXNwbGF5IGNvbWVzIHdpdGggdHdvIHBvcnRzLCBhc3N1bWUgaXQgc3VwcG9ydHMgZHVh
bAo+ID4gPiBsaW5rLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8IDMgKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jCj4gPiA+IGluZGV4IDJkNTRhZTUuLjk3YzUxYzIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gPiA+IEBAIC03NTEsNiArNzUxLDkgQEAgc3RhdGljIGlu
dCByY2FyX2x2ZHNfcGFyc2VfZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykKPiA+ID4gIAkJCXJl
dCA9IC1FUFJPQkVfREVGRVI7Cj4gPiA+ICAJCQlnb3RvIGRvbmU7Cj4gPiA+ICAJCX0KPiA+ID4g
KwkJaWYgKGx2ZHMtPmluZm8tPnF1aXJrcyAmIFJDQVJfTFZEU19RVUlSS19EVUFMX0xJTkspCj4g
PiA+ICsJCQlsdmRzLT5kdWFsX2xpbmsgPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfY291bnQocmVt
b3RlKQo+ID4gPiArCQkJCQk9PSAyOwo+ID4gCj4gPiBUaGlzIGlzIGEgYml0IG9mIGEgaGFjaywg
YXMgSSB0aGluayB0aGUgaW5mb3JtYXRpb24gc2hvdWxkIGJlIHF1ZXJpZWQKPiA+IGZyb20gdGhl
IHBhbmVsLCBsaWtlIHdlIGRvIGZvciBicmlkZ2VzLiBJJ2Qgc2F5IHdlIGNhbiBsaXZlIHdpdGgg
dGhpcwo+ID4gZm9yIG5vdywgYnV0IGFzIHRoZSBkYXRhIHN3YXAgZmxhZyBzaG91bGQgY29tZSBm
cm9tIHRoZSBwYW5lbCBhcyB3ZWxsLAo+ID4gd2Ugd2lsbCBuZWVkIGluZnJhc3RydWN0dXJlIGZv
ciB0aGF0LCBhbmQgd2UgY2FuIGFzIHdlbGwgdGhyb3VnaCB0aGUKPiA+IGR1YWwgbGluayBmbGFn
IHRoZXJlIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gSSB0b3RhbGx5IGFncmVlLCB0aGlzIGlzIGEg
bmFzdHkgaGFjaywgbXkgc2VyaWVzIGlzIG1pc3NpbmcgdGhlIGluZnJhc3RydWN0dXJlCj4gZm9y
IGRlc2NyaWJpbmcgdGhpcyBpbmZvcm1hdGlvbgo+IAo+ID4gSSB0aGluayB3ZSBzaG91bGQgdXNl
IHRoZSBkcm1fYnJpZGdlX3RpbWluZ3Mgc3RydWN0dXJlIGZvciB0aGlzIHB1cnBvc2UsCj4gPiBh
cyBpdCB3b3VsZCBtYWtlIGxpZmUgbW9yZSBkaWZmaWN1bHQgZm9yIHVzZXJzIG9mIGRybV9icmlk
Z2UgYW5kCj4gPiBkcm1fcGFuZWwgdG8gaGF2ZSB0d28gZGlmZmVyZW50IHN0cnVjdHVyZXMgKGVz
cGVjaWFsbHkgd2hlbiB3cmFwcGluZyBhCj4gPiBkcm1fcGFuZWwgd2l0aCBkcm1fcGFuZWxfYnJp
ZGdlX2FkZCgpKS4gVGhlIHN0cnVjdHVyZSBjb3VsZCBiZSByZW5hbWVkCj4gPiBpZiBkZXNpcmVk
Lgo+IAo+IEkgYW0gbm90IHRvbyBzdXJlIHVzaW5nIGRybV9icmlkZ2VfdGltaW5ncyBmb3IgcGFu
ZWxzIHdvdWxkIG1ha2UgZXZlcnlib2R5Cj4gaGFwcHk/IElzIHRoZXJlIGFueSBhbHRlcm5hdGl2
ZT8gUGVyaGFwcyB0aGlzIGNhbGxzIGZvciBhIG5ldyBzdHJ1Y3Qgd2UgY291bGQKPiBlbWJlZCBp
biBib3RoIGRybV9icmlkZ2VfdGltaW5ncyBhbmQgc29tZSBkcm1fcGFuZWxfPHdoYXRldmVyPiBk
YXRhCj4gc3RydWN0dXJlPwoKSSB0aGluayB3ZSBjb3VsZCBzaW1wbHkgcmVuYW1lIHRoZSBzdHJ1
Y3R1cmUsIGFsbCBpdHMgZmllbGRzIGFwcGx5IHRvCnBhbmVscyB0b28uCgo+ID4gPiAgCX0KPiA+
ID4KPiA+ID4gIAlpZiAobHZkcy0+ZHVhbF9saW5rKSB7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
