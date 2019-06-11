Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144963D50B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F01891F2;
	Tue, 11 Jun 2019 18:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABAA891AC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:07:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AD0EFA6;
 Tue, 11 Jun 2019 20:07:25 +0200 (CEST)
Date: Tue, 11 Jun 2019 21:07:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Drake <michael.drake@codethink.co.uk>
Subject: Re: [PATCH v1 03/11] dt-bindings: display/bridge: Add config
 property for ti948
Message-ID: <20190611180710.GT5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-4-michael.drake@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-4-michael.drake@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560276445;
 bh=U6cKsDlIYIUfJDEzJan9NNjl5MrieaoyWtyhjTAgz4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vo19II7zbYRl4pohD//ZsjLDurh4XnSv5I1Hy7ArCKvKqru7lg3u0uay0D89nhrMj
 8YQJj5RCRoL+L2ITwNGolf5osznyh/2qk17MiL1clDQktwm+OcaLxdORHCHfeUrivV
 e2rYFRwV3bT0NWBNdQ92AdePHJKImJuihtwF5Zdw=
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@lists.codethink.co.uk,
 Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGFlbCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBKdW4gMTEsIDIw
MTkgYXQgMDM6MDQ6MDRQTSArMDEwMCwgTWljaGFlbCBEcmFrZSB3cm90ZToKPiBUaGUgY29uZmln
IHByb3BlcnR5IGNhbiBiZSB1c2VkIHRvIHByb3ZpZGUgYW4gYXJyYXkgb2YKPiByZWdpc3RlciBh
ZGRyZXNzZXMgYW5kIHZhbHVlcyB0byBiZSB3cml0dGVuIHRvIGNvbmZpZ3VyZQo+IHRoZSBkZXZp
Y2UgZm9yIHRoZSBib2FyZC4KClBsZWFzZSBkb24ndC4gRFQgZGVzY3JpYmVzIHRoZSBoYXJkd2Fy
ZSAob3IgbW9yZSBhY2N1cmF0ZWx5IHRoZSBzeXN0ZW0pLAppdCdzIG5vdCBtZWFudCB0byBzdG9y
ZSBhcmJpdHJhcnkgY29uZmlndXJhdGlvbiBkYXRhLiBBbGwgdGhlIHJlZ2lzdGVycwpzcGVjaWZp
ZWQgYmVsb3cgc2hvdWxkIGluc3RlYWQgYmUgc2V0IGJ5IHRoZSBkcml2ZXIgYmFzZWQgb24gYQpj
b21iaW5hdGlvbiBvZiBoYXJkd2FyZSBkZXNjcmlwdGlvbiBhbmQgaW5mb3JtYXRpb24gb2J0YWlu
ZWQgYXQgcnVudGltZS4KCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBEcmFrZSA8bWljaGFlbC5k
cmFrZUBjb2RldGhpbmsuY28udWs+Cj4gQ2M6IFBhdHJpY2sgR2xhc2VyIDxwZ2xhc2VyQHRlc2xh
LmNvbT4KPiBDYzogTmF0ZSBDYXNlIDxuY2FzZUB0ZXNsYS5jb20+Cj4gLS0tCj4gIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwdWI5NDgudHh0ICB8IDIxICsrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRz
OTB1Yjk0OC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvdGksZHM5MHViOTQ4LnR4dAo+IGluZGV4IGY5ZTg2Y2IyMjkwMC4uMWU3MDMzYjBmM2I3
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS90aSxkczkwdWI5NDgudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OC50eHQKPiBAQCAtMTIsNiArMTIs
OCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICAKPiAg
LSByZWd1bGF0b3JzOiBMaXN0IG9mIHJlZ3VsYXRvciBuYW1lIHN0cmluZ3MgdG8gZW5hYmxlIGZv
ciBvcGVyYXRpb24gb2YgZGV2aWNlLgo+ICstIGNvbmZpZzogTGlzdCBvZiA8cmVnaXN0ZXIgYWRk
cmVzcz4sPHZhbHVlPiBwYWlycyB0byBiZSBzZXQgdG8gY29uZmlndXJlCj4gKyAgZGV2aWNlIG9u
IHBvd2VydXAuICBUaGUgcmVnaXN0ZXIgYWRkcmVzc2VzIGFuZCB2YWx1ZXMgYXJlIDhiaXQuCj4g
IAo+ICBFeGFtcGxlCj4gIC0tLS0tLS0KPiBAQCAtMjEsNCArMjMsMjMgQEAgdGk5NDg6IGRzOTB1
Yjk0OEAwIHsKPiAgCj4gIAlyZWd1bGF0b3JzOiAidmNjIiwKPiAgCSAgICAgICAgICAgICJ2Y2Nf
ZGlzcCI7Cj4gKwljb25maWc6Cj4gKwkgICAgICAgIC8qIHNldCBlcnJvciBjb3VudCB0byBtYXgg
Ki8KPiArCSAgICAgICAgPDB4NDE+LCA8MHgxZj4sCj4gKwkgICAgICAgIC8qIHNldHMgb3V0cHV0
IG1vZGUsIG5vIGNoYW5nZSBub3RpY2VkICovCj4gKwkgICAgICAgIDwweDQ5PiwgPDB4ZTA+LAo+
ICsJICAgICAgICAvKiBzcGVlZCB1cCBJMkMsIDB4RSBpcyBhcm91bmQgNDgwS0h6ICovCj4gKwkg
ICAgICAgIDwweDI2PiwgPDB4MGU+LAo+ICsJICAgICAgICAvKiBzcGVlZCB1cCBJMkMsIDB4RSBp
cyBhcm91bmQgNDgwS0h6ICovCj4gKwkgICAgICAgIDwweDI3PiwgPDB4MGU+LAo+ICsJICAgICAg
ICAvKiBzZXRzIEdQSU8wIGFzIGFuIGlucHV0ICovCj4gKwkgICAgICAgIDwweDFEPiwgPDB4MTM+
LAo+ICsJICAgICAgICAvKiBzZXQgR1BJTzIgaGlnaCwgYmFja2xpZ2h0IFBXTSAoc2V0IHRvIDB4
NTAgZm9yIG5vcm1hbCB1c2UpICovCj4gKwkgICAgICAgIDwweDFFPiwgPDB4NTA+LAo+ICsJICAg
ICAgICAvKiBzZXRzIEdQSU8zIGFzIGFuIG91dHB1dCB3aXRoIHJlbW90ZSBjb250cm9sIGZvciB0
b3VjaCBYUkVTICovCj4gKwkgICAgICAgIDwweDFGPiwgPDB4MDU+LAo+ICsJICAgICAgICAvKiBz
ZXQgR1BJTzUgaGlnaCwgYmFja2xpZ2h0IGVuYWJsZSBvbiBuZXcgZGlzcGxheSAqLwo+ICsJICAg
ICAgICA8MHgyMD4sIDwweDA5PiwKPiArCSAgICAgICAgLyogc2V0IEdQSU83IGFuZCBHUElPOCBo
aWdoIHRvIGVuYWJsZSB0b3VjaCBwb3dlciBhbmQgcHJveCBzZW5zZSAqLwo+ICsJICAgICAgICA8
MHgyMT4sIDwweDkxPjsKPiAgfTsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
