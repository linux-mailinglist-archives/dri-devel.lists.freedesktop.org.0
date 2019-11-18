Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F726100F98
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 00:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F846E102;
	Mon, 18 Nov 2019 23:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490516E102
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 23:58:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2CBA563;
 Tue, 19 Nov 2019 00:58:06 +0100 (CET)
Date: Tue, 19 Nov 2019 01:57:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: display: bridge: lvds-transmitter:
 Document "ti,sn75lvds83"
Message-ID: <20191118235755.GD5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574121487;
 bh=Mxk6rk2xF2thaig3R3p3Gkx/6h3F0FLe6+BRnlHkuvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NTexvwR44K59XOTHnJRxJQvxBcwFnXbk3AfI2NBTZi6Rq+VAuiQ+0UR4zoN58y8oH
 Ji1ZOecBBRIinFjIGawGntKHcFhbjCX+4W/c5GKv1mA4KDnW34UCdB0oLORRcecfTk
 6k8R2ibCJdXr2pUM5YttJEg3QiL9gHVi6N+wmkAs=
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
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgTm92IDEzLCAy
MDE5IGF0IDAzOjUxOjIzUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBDb21wYXRp
YmxlIHN0cmluZyAidGksc243NWx2ZHM4MyIgaXMgYmVpbmcgdXNlZCBieSBkZXZpY2UgdHJlZQo+
IHJrMzE4OC1icWVkaXNvbjJxYy5kdHMsIGJ1dCBpdCdzIG5vdCBkb2N1bWVudGVkIGFueXdoZXJl
LCB0aGVyZWZvcmUKPiBkb2N1bWVudCBpdCB3aXRoaW4gbHZkcy10cmFuc21pdHRlci55YW1sLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJl
bmVzYXMuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gdjMtPnY0Ogo+ICogTmV3IHBhdGNoCj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRz
LXRyYW5zbWl0dGVyLnlhbWwgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci55YW1sCj4gaW5kZXgg
YTgzMjZjZS4uMjdkZTYxNiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci55YW1sCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNt
aXR0ZXIueWFtbAo+IEBAIC0zNyw2ICszNyw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gZW51
bToKPiAgICAgICAgICAtIHRpLGRzOTBjMTg1ICAgICAgICMgRm9yIHRoZSBUSSBEUzkwQzE4NSBG
UEQtTGluayBTZXJpYWxpemVyCj4gICAgICAgICAgLSB0aSxkczkwYzE4NyAgICAgICAjIEZvciB0
aGUgVEkgRFM5MEMxODcgRlBELUxpbmsgU2VyaWFsaXplcgo+ICsgICAgICAgIC0gdGksc243NWx2
ZHM4MyAgICAgIyBGb3IgdGhlIFRJIFNONzVMVkRTODMgRmxhdExpbmsgdHJhbnNtaXR0ZXIKPiAg
ICAgICAgLSBjb25zdDogbHZkcy1lbmNvZGVyICMgR2VuZXJpYyBMVkRTIGVuY29kZXIgY29tcGF0
aWJsZSBmYWxsYmFjawo+ICAKPiAgICBwb3J0czoKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5j
aGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
