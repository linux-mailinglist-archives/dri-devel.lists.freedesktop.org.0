Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF88100F8D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 00:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6656289683;
	Mon, 18 Nov 2019 23:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E8B89683
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 23:55:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7D18311;
 Tue, 19 Nov 2019 00:55:40 +0100 (CET)
Date: Tue, 19 Nov 2019 01:55:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: display: bridge: lvds-transmitter:
 Document powerdown-gpios
Message-ID: <20191118235530.GB5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574121342;
 bh=OPbuFy8vWR5cxnnCz+S/rfqhG8X+9lN/T165urB055g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GJKZzVhEwnGm6Mn6nqF342wi1sgX5aZjbXvbdQDWbDLq5EJqW3PylT9Q+avOANtqS
 KohobwdZCbtuVYpPlzq1m7/HNYYO6N3Y4coZFsvjIomQhe+523/1cV9z9bDZILEl4/
 RSl/vWbFT7Eh7/J4hZgV3R+r+7PwGlidpVeVMuqA=
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
MDE5IGF0IDAzOjUxOjIxUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBBZGQgZG9j
dW1lbnRhdGlvbiBmb3IgcHJvcGVydHkgcG93ZXJkb3duLWdwaW9zLiBUaGUgcHJvcGVydHkgaXMK
PiBvcHRpb25hbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlv
LmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+IHYzLT52NDoKPiAqIE5l
dyBwYXRjaAo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9s
dmRzLXRyYW5zbWl0dGVyLnlhbWwgICAgICAgICB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0
ZXIueWFtbAo+IGluZGV4IGI1ZGQwZGEuLjI0ODQ3MzcgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIu
eWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9sdmRzLXRyYW5zbWl0dGVyLnlhbWwKPiBAQCAtNTcsNiArNTcsMTEgQEAgcHJvcGVydGll
czoKPiAgICAgICAgLSBwb3J0QDAKPiAgICAgICAgLSBwb3J0QDEKPiAgCj4gKyAgcG93ZXJkb3du
LWdwaW9zOgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFRoZSBHUElPIHVzZWQgdG8gY29u
dHJvbCB0aGUgcG93ZXIgZG93biBsaW5lIG9mIHRoaXMgZGV2aWNlLgo+ICsgICAgbWF4SXRlbXM6
IDEKPiArCj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcG9ydHMKCi0tIApS
ZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
