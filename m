Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2036B7EF15
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CE089471;
	Fri,  2 Aug 2019 08:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3F289471
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:22:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50D4CCC;
 Fri,  2 Aug 2019 10:22:11 +0200 (CEST)
Date: Fri, 2 Aug 2019 11:22:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 08/12] drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
Message-ID: <20190802082209.GI5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-9-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-9-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564734131;
 bh=VgdL0PFfWAynREcrc/v61AFgKdHD544UedHtCeN9bZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLdvB3uy+1uzNO8J9YA5iR7kxx0IWo1rTINLSEmUQ30eeqchNTDSt5ogc2k+VDQDP
 I/8yjwzd20GMDpmyRP48GAOZE+DUKa3EtR9s6C1yHageiAp/F660EPmnZ6POXu7Jge
 UHGKOxlfvqY8yBRgMNfA/HqiGtPvnmtNFQ6yqu34=
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
MDE5IGF0IDA4OjM0OjA1QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBVc2luZyBu
YW1lICJicmlkZ2UiIGZvciBtYWNybyBicmlkZ2VfdG9fcmNhcl9sdmRzIGFyZ3VtZW50IGRvZXNu
J3QKPiB3b3JrIHdoZW4gdGhlIHBvaW50ZXIgbmFtZSB1c2VkIGJ5IHRoZSBjYWxsZXIgaXMgbm90
ICJicmlkZ2UiLgo+IFJlbmFtZSB0aGUgYXJndW1lbnQgdG8gImJyaWRnZV9wdHIiIHRvIGFsbG93
IGZvciBhbnkgcG9pbnRlcgo+IG5hbWUuCj4gCj4gRml4ZXM6IGM2YTI3ZmE0MWZhYiAoImRybTog
cmNhci1kdTogQ29udmVydCBMVkRTIGVuY29kZXIgY29kZSB0byBicmlkZ2UgZHJpdmVyIikKPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2Fz
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCA0ICsr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwo+IGluZGV4IDk3YzUxYzIuLmVkZDYzZjUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwo+IEBAIC03Miw4ICs3Miw4IEBA
IHN0cnVjdCByY2FyX2x2ZHMgewo+ICAJYm9vbCBzdHJpcGVfc3dhcF9kYXRhOwo+ICB9Owo+ICAK
PiAtI2RlZmluZSBicmlkZ2VfdG9fcmNhcl9sdmRzKGJyaWRnZSkgXAo+IC0JY29udGFpbmVyX29m
KGJyaWRnZSwgc3RydWN0IHJjYXJfbHZkcywgYnJpZGdlKQo+ICsjZGVmaW5lIGJyaWRnZV90b19y
Y2FyX2x2ZHMoYnJpZGdlX3B0cikgXAo+ICsJY29udGFpbmVyX29mKGJyaWRnZV9wdHIsIHN0cnVj
dCByY2FyX2x2ZHMsIGJyaWRnZSkKCkhvdyBhYm91dCBqdXN0ICdiJyBpbnN0ZWFkIG9mICdicmlk
Z2VfcHRyJyA/IElmIHRoYXQncyBmaW5lIHdpdGggeW91CkknbGwgdGFrZSB0aGUgbW9kaWZpZWQg
cGF0Y2ggaW4gbXkgdHJlZSwgbm8gbmVlZCB0byByZXN1Ym1pdC4KClJldmlld2VkLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+ICAKPiAg
I2RlZmluZSBjb25uZWN0b3JfdG9fcmNhcl9sdmRzKGNvbm5lY3RvcikgXAo+ICAJY29udGFpbmVy
X29mKGNvbm5lY3Rvciwgc3RydWN0IHJjYXJfbHZkcywgY29ubmVjdG9yKQoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
