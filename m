Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2248EAC5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 13:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14066E395;
	Thu, 15 Aug 2019 11:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AE46E395
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:55:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A71B2AF;
 Thu, 15 Aug 2019 13:55:27 +0200 (CEST)
Date: Thu, 15 Aug 2019 14:55:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 6/9] drm: rcar-du: lvds: Fix companion's mode
Message-ID: <20190815115517.GJ5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565867073-24746-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565870128;
 bh=vqMbITpf9KzS4gwgFJCKsDh23NfR9QNwQcN0V6Q3nwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/i1hIqcO3oV535KDdJkR91ko/obz2wQ/pBBArzOrWf53Fd/L6T1xri1GZf7AL7rc
 AfG2VWOTt7oKwP3fOAOgbXgv3blvnFT9MORSYNegCitVxd2r0AdGLm29yC1y+HchNK
 77NcIoXfz+7zeiGZqIXQbXQhqnHYB3AP913y45Po=
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
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgQXVnIDE1LCAy
MDE5IGF0IDEyOjA0OjMwUE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgY29t
cGFuaW9uIGVuY29kZXIgbmVlZHMgdG8gYmUgdG9sZCB0byB1c2UgdGhlIHNhbWUKPiBtb2RlIGFz
IHRoZSBwcmltYXJ5IGVuY29kZXIuCj4gCj4gRml4ZXM6IGU5ZTg3OThhYjdiOCAoImRybTogcmNh
ci1kdTogbHZkczogQWRkIHN1cHBvcnQgZm9yIGR1YWwtbGluayBtb2RlIikKPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAK
PiAtLS0KPiB2MS0+djI6Cj4gKiByZXdvcmtlZCBhY2NvcmRpbmcgdG8gTGF1cmVudCdzIGZlZWRi
YWNrCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgNSArKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9sdmRzLmMKPiBpbmRleCAzZmUwYjg2Li40MWQyOGY0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9sdmRzLmMKPiBAQCAtNjAzLDYgKzYwMywxMSBAQCBzdGF0aWMgdm9pZCByY2Fy
X2x2ZHNfbW9kZV9zZXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCWx2ZHMtPmRpc3Bs
YXlfbW9kZSA9ICphZGp1c3RlZF9tb2RlOwo+ICAKPiAgCXJjYXJfbHZkc19nZXRfbHZkc19tb2Rl
KGx2ZHMpOwo+ICsJaWYgKGx2ZHMtPmNvbXBhbmlvbikgewo+ICsJCXN0cnVjdCByY2FyX2x2ZHMg
KmNvbXBhbmlvbl9sdmRzID0gYnJpZGdlX3RvX3JjYXJfbHZkcygKPiArCQkJCQkJCWx2ZHMtPmNv
bXBhbmlvbik7Cj4gKwkJY29tcGFuaW9uX2x2ZHMtPm1vZGUgPSBsdmRzLT5tb2RlOwoKSG93IGFi
b3V0IGNhbGxpbmcgcmNhcl9sdmRzX21vZGVfc2V0KCkgb24gdGhlIGNvbXBhbmlvbiBpbnN0ZWFk
ID8KCj4gKwl9Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgcmNhcl9sdmRzX2F0dGFjaChzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlKQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
