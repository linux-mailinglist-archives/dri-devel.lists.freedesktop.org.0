Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB37EE42
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F856ECE6;
	Fri,  2 Aug 2019 08:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43046ECE6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:03:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0013A33E;
 Fri,  2 Aug 2019 10:03:33 +0200 (CEST)
Date: Fri, 2 Aug 2019 11:03:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 04/12] dt-bindings: display: Add bindings for
 Advantech IDK-2121WR
Message-ID: <20190802080332.GE5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564733014;
 bh=iESMaiwMfzcHwok5GLi0XmKd4pH/pITjQS3plSb9Z34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GlIO4h09Z40O9LbRY2FO6XIGflDy1hY2hNm+JpqlfFcT4o1UBbVay+On30qcePB3R
 XpK6hxFtraFU69VIrNjbWvA7k7S5K3ybAB23zpFl3Uy0bn/8xyo4nBeE98MbJOP/L0
 BExEJZlMr4sLNiLx+OBcBgfFnhF/L3lxiy98JP1A=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjM0OjAxQU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGlzIHBh
bmVsIGlzIGhhbmRsZWQgdGhyb3VnaCB0aGUgZ2VuZXJpYyBsdmRzLXBhbmVsIGJpbmRpbmdzLAo+
IHNvIG9ubHkgbmVlZHMgaXRzIGFkZGl0aW9uYWwgY29tcGF0aWJsZSBzcGVjaWZpZWQuCj4gCj4g
U29tZSBwYW5lbCBzcGVjaWZpYyBkb2N1bWVudGF0aW9uIGNhbiBiZSBmb3VuZCBoZXJlOgoKcy9w
YW5lbCBzcGVjaWZpYy9wYW5lbC1zcGVjaWZpYy8KCj4gaHR0cHM6Ly9idXkuYWR2YW50ZWNoLmV1
L0Rpc3BsYXlzL0VtYmVkZGVkLUxDRC1LaXRzLUhpZ2gtQnJpZ2h0bmVzcy9tb2RlbC1JREstMjEy
MVdSLUsyRkhBMkUuaHRtCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL2Fk
dmFudGVjaCxpZGstMjEyMXdyLnR4dCAgICAgICAgIHwgNjIgKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50
ZWNoLGlkay0yMTIxd3IudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxp
ZGstMjEyMXdyLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uNzBi
MTViNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQKPiBAQCAtMCwwICsx
LDYyIEBACj4gK0FkdmFudGVjaCBDby4sIEx0ZC4gSURLLTIxMjFXUiAyMS41IiBMVkRTIHBhbmVs
Cj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+
ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiYWR2YW50
ZWNoLGlkay0yMTIxd3IiIGZvbGxvd2VkIGJ5ICJwYW5lbC1sdmRzIgo+ICsKPiArVGhpcyBiaW5k
aW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgbHZkcy1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBz
cGVjaWZpZWQKPiAraW4gcGFuZWwtbHZkcy50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCgpIb3cgYWJv
dXQgYWRkaW5nICJUaGUgcGFuZWwgb3BlcmF0ZXMgaW4gZHVhbC1saW5rIG1vZGUgYW5kIHRodXMg
cmVxdWlyZXMKdHdvIHBvcnQgbm9kZXMuIiA/Cgo+ICsKPiArRXhhbXBsZQo+ICstLS0tLS0tCj4g
Kwo+ICsJcGFuZWwgewo+ICsJCWNvbXBhdGlibGUgPSAiYWR2YW50ZWNoLGlkay0yMTIxd3IiLCAi
cGFuZWwtbHZkcyI7Cj4gKwo+ICsJCXdpZHRoLW1tID0gPDQ3Nj47Cj4gKwkJaGVpZ2h0LW1tID0g
PDI2OD47Cj4gKwo+ICsJCWRhdGEtbWFwcGluZyA9ICJ2ZXNhLTI0IjsKPiArCj4gKwkJcGFuZWwt
dGltaW5nIHsKPiArCQkJY2xvY2stZnJlcXVlbmN5ID0gPDE0ODUwMDAwMD47Cj4gKwkJCWhhY3Rp
dmUgPSA8MTkyMD47Cj4gKwkJCXZhY3RpdmUgPSA8MTA4MD47Cj4gKwkJCWhzeW5jLWxlbiA9IDw0
ND47Cj4gKwkJCWhmcm9udC1wb3JjaCA9IDw4OD47Cj4gKwkJCWhiYWNrLXBvcmNoID0gPDE0OD47
Cj4gKwkJCXZmcm9udC1wb3JjaCA9IDw0PjsKPiArCQkJdmJhY2stcG9yY2ggPSA8MzY+Owo+ICsJ
CQl2c3luYy1sZW4gPSA8NT47Cj4gKwkJfTsKPiArCj4gKwkJcG9ydHMgewo+ICsJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJCQlwb3J0QDAg
ewo+ICsJCQkJcmVnID0gPDA+Owo+ICsJCQkJbHZkczBfcGFuZWxfaW46IGVuZHBvaW50IHsKPiAr
CQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMwX291dD47Cj4gKwkJCQl9Owo+ICsJCQl9Owo+
ICsKPiArCQkJcG9ydEAxIHsKPiArCQkJCXJlZyA9IDwxPjsKPiArCQkJCWx2ZHMxX3BhbmVsX2lu
OiBlbmRwb2ludCB7Cj4gKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+Owo+ICsJ
CQkJfTsKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiArCj4gKwliYWNrbGlnaHQ6IGJhY2tsaWdo
dCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKPiArCQlwd21zID0gPCZwd201
IDAgNTAwMDA+Owo+ICsKPiArCQlicmlnaHRuZXNzLWxldmVscyA9IDwwIDQgOCAxNiAzMiA2NCAx
MjggMjU1PjsKPiArCQlkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgPSA8Nj47Cj4gKwo+ICsJCXBv
d2VyLXN1cHBseSA9IDwmcmVnXzEycDB2PjsKPiArCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW82IDEy
IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsJfTsKCkkgdGhpbmsgeW91IGNhbiBkcm9wIHRoZSBiYWNr
bGlnaHQgaGVyZSwgaXQncyBhIGJpdCBvdXQgb2Ygc2NvcGUuCgotLSAKUmVnYXJkcywKCkxhdXJl
bnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
