Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190998EA96
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 13:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3080C6E317;
	Thu, 15 Aug 2019 11:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134A16E317
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:47:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E32B2B2;
 Thu, 15 Aug 2019 13:47:23 +0200 (CEST)
Date: Thu, 15 Aug 2019 14:47:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: display: Add bindings for Advantech
 IDK-2121WR
Message-ID: <20190815114719.GI5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565867073-24746-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565869643;
 bh=7YHIexGsypHKPBrHkKhWFogXO6dZbIw8bhIG8muuOqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5M6DY0HUEV5MQtRh5Vn9NcRMQ4In57gkO1EnrM4iMjn/aX7onIcfXLuV3h5mEqFR
 CV1YluX1JPfiNsIUYD///aVF/Hu4JXSMkF1m7k/LzushWEVVK5R8v7xjI1HtQl/hXb
 Xfb4p1TAEnYx4/Wm2xWhNTeNdsrTGSDAGlFvwmmM=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMjowNDoyNlBNICswMTAwLCBG
YWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gVGhpcyBwYW5lbCBpcyBoYW5kbGVkIHRocm91Z2ggdGhl
IGdlbmVyaWMgbHZkcy1wYW5lbCBiaW5kaW5ncywKPiBzbyBvbmx5IG5lZWRzIGl0cyBhZGRpdGlv
bmFsIGNvbXBhdGlibGUgc3BlY2lmaWVkLgo+IAo+IFNvbWUgcGFuZWwtc3BlY2lmaWMgZG9jdW1l
bnRhdGlvbiBjYW4gYmUgZm91bmQgaGVyZToKPiBodHRwczovL2J1eS5hZHZhbnRlY2guZXUvRGlz
cGxheXMvRW1iZWRkZWQtTENELUtpdHMtSGlnaC1CcmlnaHRuZXNzL21vZGVsLUlESy0yMTIxV1It
SzJGSEEyRS5odG0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlv
LmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAKPiAtLS0KPiB2MS0+djI6Cj4gKiBSZXdvcmtlZCBh
Y2NvcmRpbmcgdG8gTGF1cmVudCdzIGZlZWRiYWNrCj4gKiBSZW5hbWVkIGx2ZHMwX3BhbmVsX2lu
IHRvIHBhbmVsX2luMAo+ICogUmVuYW1lZCBsdmRzMV9wYW5lbF9pbiB0byBwYW5lbF9pbjEKPiAK
PiBMYXVyZW50LAo+IAo+IFNob3VsZCB0aGlzIGJlIGEgLnlhbWwgZmlsZSBhbHJlYWR5PwoKSXQn
cyBub3QgYSBzdHJpY3QgcmVxdWlyZW1lbnQsIGJ1dCBJJ20gc3VyZSBSb2Igd291bGQgcmVhbGx5
IGFwcHJlY2lhdGUuCkkndmUgY29udmVydGVkIGEgRFQgYmluZGluZyB0byB5YW1sIHJlY2VudGx5
IChmb3IgYSBwYW5lbCB0b28pLCBhbmQgSQpoYXZlIHRvIHNheSBJJ20gaW1wcmVzc2VkIGJ5IHRo
ZSB2YWxpZGF0aW9uIHlhbWwgYnJpbmdzLCBib3RoIGZvciBEVApzb3VyY2VzIGFuZCBmb3IgRFQg
YmluZGluZ3MuIEl0IGV2ZW4gdmFsaWRhdGVzIHRoZSBleGFtcGxlIGluIHRoZQpiaW5kaW5ncywg
d2hpY2ggaXMgZ3JlYXQuIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS93cml0aW5nLXNjaGVtYS5t
ZApzaG91bGQgZ2l2ZSB5b3UgYSBmZXcgcG9pbnRlcnMgdG8gZ2V0IHN0YXJ0ZWQgKGluIHBhcnRp
Y3VsYXIgbWFrZSBzdXJlCnlvdSBydW4gbWFrZSBkdF9iaW5kaW5nX2NoZWNrIGZvciB5b3VyIG5l
dyBiaW5kaW5ncykuCgo+ICAuLi4vZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50
eHQgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDU2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnR4dAo+
IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAuLjZlZTFkMWIKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
YWR2YW50ZWNoLGlkay0yMTIxd3IudHh0Cj4gQEAgLTAsMCArMSw1NiBAQAo+ICtBZHZhbnRlY2gg
Q28uLCBMdGQuIElESy0yMTIxV1IgMjEuNSIgTFZEUyBwYW5lbAo+ICs9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGll
czoKPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImFkdmFudGVjaCxpZGstMjEyMXdyIiBmb2xs
b3dlZCBieSAicGFuZWwtbHZkcyIKPiArCj4gK1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdp
dGggdGhlIGx2ZHMtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVkCj4gK2luIHBhbmVs
LWx2ZHMudHh0IGluIHRoaXMgZGlyZWN0b3J5Lgo+ICtUaGUgcGFuZWwgb3BlcmF0ZXMgaW4gZHVh
bC1saW5rIG1vZGUgYW5kIHRodXMgcmVxdWlyZXMgdHdvIHBvcnQgbm9kZXMsCj4gK3RoZSBmaXJz
dCBwb3J0IG5vZGUgZXhwZWN0cyBvZGQgcGl4ZWxzICgxLCAzLCA1LCBldGMuKSBhbmQgdGhlIHNl
Y29uZCBwb3J0Cj4gK2V4cGVjdHMgZXZlbiBwaXhlbHMgKDAsIDIsIDQsIGV0Yy4pLgo+ICsKPiAr
RXhhbXBsZQo+ICstLS0tLS0tCj4gKwo+ICsJcGFuZWwgewo+ICsJCWNvbXBhdGlibGUgPSAiYWR2
YW50ZWNoLGlkay0yMTIxd3IiLCAicGFuZWwtbHZkcyI7Cj4gKwo+ICsJCXdpZHRoLW1tID0gPDQ3
Nj47Cj4gKwkJaGVpZ2h0LW1tID0gPDI2OD47Cj4gKwo+ICsJCWRhdGEtbWFwcGluZyA9ICJ2ZXNh
LTI0IjsKPiArCj4gKwkJcGFuZWwtdGltaW5nIHsKPiArCQkJY2xvY2stZnJlcXVlbmN5ID0gPDE0
ODUwMDAwMD47Cj4gKwkJCWhhY3RpdmUgPSA8MTkyMD47Cj4gKwkJCXZhY3RpdmUgPSA8MTA4MD47
Cj4gKwkJCWhzeW5jLWxlbiA9IDw0ND47Cj4gKwkJCWhmcm9udC1wb3JjaCA9IDw4OD47Cj4gKwkJ
CWhiYWNrLXBvcmNoID0gPDE0OD47Cj4gKwkJCXZmcm9udC1wb3JjaCA9IDw0PjsKPiArCQkJdmJh
Y2stcG9yY2ggPSA8MzY+Owo+ICsJCQl2c3luYy1sZW4gPSA8NT47Cj4gKwkJfTsKPiArCj4gKwkJ
cG9ydHMgewo+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkJI3NpemUtY2VsbHMgPSA8
MD47Cj4gKwo+ICsJCQlwb3J0QDAgewo+ICsJCQkJLyogT2RkIHBpeGVscyAqLwo+ICsJCQkJcmVn
ID0gPDA+Owo+ICsJCQkJcGFuZWxfaW4wOiBlbmRwb2ludCB7Cj4gKwkJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZsdmRzMF9vdXQ+Owo+ICsJCQkJfTsKPiArCQkJfTsKPiArCj4gKwkJCXBvcnRAMSB7
Cj4gKwkJCQkvKiBFdmVuIHBpeGVscyAqLwo+ICsJCQkJcmVnID0gPDE+Owo+ICsJCQkJcGFuZWxf
aW4xOiBlbmRwb2ludCB7Cj4gKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+Owo+
ICsJCQkJfTsKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiAtLSAKPiAyLjcuNAo+IAoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
