Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B432F39CB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 21:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337BD6F7B8;
	Thu,  7 Nov 2019 20:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7EB6F7B8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:48:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44AAD71D;
 Thu,  7 Nov 2019 21:48:56 +0100 (CET)
Date: Thu, 7 Nov 2019 22:48:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 5/7] drm/panel: panel-simple: Add connector type for
 etm0700g0dh6
Message-ID: <20191107204846.GQ24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573159736;
 bh=pmzvKL0wtmMTBCZNxQBXqoocDPWwX/PcDpvrlBEmGQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KKfWVT+LZqmLZZDVydKtyIlOtV8wgQvtJ2kFE+L7+ICbspPUg0OH7E9tl9n44sx/s
 DIx2YaQsFjBcPyUMh8WC6mOkLd0N2Q8xCuCCd47PuUyhLbP0cSo2eYtErfdW9DnKoi
 4KshitWefmZtx8hJAQUof5bBOGCUCDSvhuQNjkjk=
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

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgTm92IDA3LCAy
MDE5IGF0IDA4OjExOjAxUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBBZGQgY29u
bmVjdG9yIHR5cGUgZm9yIHRoZSBldG0wNzAwZzBkaDYgZnJvbSBFbWVyZ2luZyBEaXNwbGF5Cj4g
VGVjaG5vbG9naWVzIChFRFQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+IC0tLQo+IHYyLT52MzoKPiAqIE5l
dyBwYXRjaAo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYwo+IGluZGV4IDVkNDg3NjguLjgyMDY1ZmYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTEzNDIsNiArMTM0Miw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBlZHRfZXRtMDcwMGcwZGg2ID0gewo+ICAJfSwKPiAgCS5i
dXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I2NjZfMVgxOCwKPiAgCS5idXNfZmxhZ3MgPSBE
Uk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX05FR0VER0Us
Cj4gKwkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfUEFSQUxMRUwsCgpJIHN0
aWxsIHRoaW5rIHdlIHNob3VsZCBoYXZlIGEgRFJNX01PREVfQ09OTkVDVE9SX1BBTkVMLCBidXQg
cmVnYXJkbGVzcywKdGhpcyBwYW5lbCBzZWVtcyB0byBtYXRjaCBEUk1fTU9ERV9DT05ORUNUT1Jf
RFBJLgoKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBlZHRfZXRt
MDcwMGcwYmRoNiA9IHsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
