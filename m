Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F266C8EDA0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3D96E9BF;
	Thu, 15 Aug 2019 14:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9A96E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:04:03 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D31720644;
 Thu, 15 Aug 2019 14:04:02 +0000 (UTC)
Date: Thu, 15 Aug 2019 16:04:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Message-ID: <20190815140400.GA7174@kroah.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815131838.GP5011@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565877843;
 bh=MIPucA8nlaeUB0gX1iRzjKyYa/bVxtRZHYmUpn/icYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBJbzT98lJdPARaPU38GixwII164snNT2WYHBu4XVIXpmEdEfq+P1WZZvxzWZs193
 OvmX0xjRRBV2zIUPLjWQAZAvQqnwEUmE9oJpcIY91mnI4Cl4IXk5UO2ugysErxjjLX
 vKaSjOA2qaWKLfb+Ed0yLok/T2iukEID/1Bntyb4=
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6MTg6MzhQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBGYWJyaXppbywKPiAKPiAoQ0MnaW5nIEdyZWcgYXMgdGhlIGFyY2hpdGVj
dCBvZiB0aGUgU1BEWCBtb3ZlKQoKX29uZSBvZl8sIG5vdCB0aGUgb25lIHRoYXQgZGlkIHRoZSBt
b3N0IG9mIGhlIHdvcmssIHRoYXQgd291bGQgYmUgVGhvbWFzIDopCgo+IE9uIFRodSwgQXVnIDE1
LCAyMDE5IGF0IDEyOjA0OjI3UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiA+IFRo
ZSBpbmZvcm1hdGlvbiByZXByZXNlbnRlZCBieSBkcm1fYnJpZGdlX3RpbWluZ3MgaXMgYWxzbwo+
ID4gbmVlZGVkIGJ5IHBhbmVscywgdGhlcmVmb3JlIHJlbmFtZSBkcm1fYnJpZGdlX3RpbWluZ3Mg
dG8KPiA+IGRybV90aW1pbmdzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0
cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiA+IExpbms6IGh0dHBzOi8vd3d3
LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LXJlbmVzYXMtc29jL21zZzQzMjcxLmh0bWwKPiA+IAo+
ID4gLS0tCj4gPiB2MS0+djI6Cj4gPiAqIG5ldyBwYXRjaAo+ID4gCj4gPiBJIGhhdmUgY29waWVk
IHRoZSBsaWNlbnNlIGZyb20gaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGFzIHRoYXQncwo+ID4g
d2hlcmUgdGhlIHN0cnVjdCBvcmlnaW5hbGx5IGNhbWUgZnJvbS4gV2hhdCdzIHRoZSByaWdodCBT
UERYIGxpY2Vuc2UKPiA+IHRvIHVzZSBpbiB0aGlzIGNhc2U/Cj4gCj4gaHR0cHM6Ly93aWtpLnNw
ZHgub3JnL3ZpZXcvTGVnYWxfVGVhbS9EZWNpc2lvbnMvRGVhbGluZ193aXRoX1B1YmxpY19Eb21h
aW5fd2l0aGluX1NQRFhfRmlsZXMKPiAKPiBHcmVnLCBhbnkgaWRlYSBvbiBob3cgd2Ugc2hvdWxk
IGhhbmRsZSB0aGlzID8KClVnaCwgd2hhdCBsdW5hY3kuICBCdXQgZHJtX2JyaWRnZS5oIGlzIE5P
VCB1bmRlciBhbnkgInB1YmxpYyBkb21haW4iCmxpY2Vuc2UsIHNvIHdoeSBpcyB0aGF0IGFuIGlz
c3VlIGhlcmU/ICBUaGlzIGxvb2tzIGxpa2UgYSAibm9ybWFsIiBic2QgMwpjbGF1c2UgbGljZW5z
ZSB0byBtZSwgcmlnaHQ/CgpTbyBJIHdvdWxkIGp1c3QgdXNlICJCU0QtMy1DbGF1c2UiIGFzIHRo
ZSBTUERYIGxpY2Vuc2UgaGVyZSwgaWYgSSB3ZXJlCmRvaW5nIHRoaXMgcGF0Y2guLi4KCnRoYW5r
cywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
