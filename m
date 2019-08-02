Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D927EF10
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0340D6ED4E;
	Fri,  2 Aug 2019 08:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DB96ED4D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:20:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA4D2CC;
 Fri,  2 Aug 2019 10:20:21 +0200 (CEST)
Date: Fri, 2 Aug 2019 11:20:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Message-ID: <20190802082020.GH5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564734021;
 bh=pvbdZIWzjzR/LxKyDLxztUTUtujs0Qx/v3CAnr+6Zr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHYpmQM8X1BQ3If4zZnaVavrylWcJsO7Q7Mj4RnoggvAyLn7DFA9j7FrYSuAVIgEB
 acgddoRooMGR6pU7/SIw571qLpE/NOhuBoJ0Zv2XFt+04jPWevQ9CMK3PnBGNrosCN
 bHAHKhXsiAinRECu0Ha7FRkCT6QRPl2yGRfOj1SI=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjM0OjA0QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBJZiB0aGUg
ZGlzcGxheSBjb21lcyB3aXRoIHR3byBwb3J0cywgYXNzdW1lIGl0IHN1cHBvcnRzIGR1YWwKPiBs
aW5rLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJv
QGJwLnJlbmVzYXMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2
ZHMuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwo+IGluZGV4IDJkNTRhZTUuLjk3YzUxYzIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwo+IEBAIC03NTEsNiArNzUxLDkgQEAgc3Rh
dGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykKPiAgCQkJ
cmV0ID0gLUVQUk9CRV9ERUZFUjsKPiAgCQkJZ290byBkb25lOwo+ICAJCX0KPiArCQlpZiAobHZk
cy0+aW5mby0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxfTElOSykKPiArCQkJbHZkcy0+
ZHVhbF9saW5rID0gb2ZfZ3JhcGhfZ2V0X2VuZHBvaW50X2NvdW50KHJlbW90ZSkKPiArCQkJCQk9
PSAyOwoKVGhpcyBpcyBhIGJpdCBvZiBhIGhhY2ssIGFzIEkgdGhpbmsgdGhlIGluZm9ybWF0aW9u
IHNob3VsZCBiZSBxdWVyaWVkCmZyb20gdGhlIHBhbmVsLCBsaWtlIHdlIGRvIGZvciBicmlkZ2Vz
LiBJJ2Qgc2F5IHdlIGNhbiBsaXZlIHdpdGggdGhpcwpmb3Igbm93LCBidXQgYXMgdGhlIGRhdGEg
c3dhcCBmbGFnIHNob3VsZCBjb21lIGZyb20gdGhlIHBhbmVsIGFzIHdlbGwsCndlIHdpbGwgbmVl
ZCBpbmZyYXN0cnVjdHVyZSBmb3IgdGhhdCwgYW5kIHdlIGNhbiBhcyB3ZWxsIHRocm91Z2ggdGhl
CmR1YWwgbGluayBmbGFnIHRoZXJlIGF0IHRoZSBzYW1lIHRpbWUuCgpJIHRoaW5rIHdlIHNob3Vs
ZCB1c2UgdGhlIGRybV9icmlkZ2VfdGltaW5ncyBzdHJ1Y3R1cmUgZm9yIHRoaXMgcHVycG9zZSwK
YXMgaXQgd291bGQgbWFrZSBsaWZlIG1vcmUgZGlmZmljdWx0IGZvciB1c2VycyBvZiBkcm1fYnJp
ZGdlIGFuZApkcm1fcGFuZWwgdG8gaGF2ZSB0d28gZGlmZmVyZW50IHN0cnVjdHVyZXMgKGVzcGVj
aWFsbHkgd2hlbiB3cmFwcGluZyBhCmRybV9wYW5lbCB3aXRoIGRybV9wYW5lbF9icmlkZ2VfYWRk
KCkpLiBUaGUgc3RydWN0dXJlIGNvdWxkIGJlIHJlbmFtZWQKaWYgZGVzaXJlZC4KCj4gIAl9Cj4g
IAo+ICAJaWYgKGx2ZHMtPmR1YWxfbGluaykgewoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNo
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
