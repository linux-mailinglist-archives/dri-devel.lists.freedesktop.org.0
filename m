Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102987588
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 11:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D2B6ED3E;
	Fri,  9 Aug 2019 09:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C108A6ED3E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 09:18:00 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25E4F21783;
 Fri,  9 Aug 2019 09:17:59 +0000 (UTC)
Date: Fri, 9 Aug 2019 09:47:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] omapdrm: no need to check return value of debugfs_create
 functions
Message-ID: <20190809074733.GA19892@kroah.com>
References: <20190613115749.GC26335@kroah.com>
 <20190808125053.GJ6055@pendragon.ideasonboard.com>
 <2d1fa29e-1441-2266-31f0-73a20cf3cebb@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d1fa29e-1441-2266-31f0-73a20cf3cebb@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565342280;
 bh=47+ngglCeFHXalunDkjTskxQm7j7SY76FtCyYy/TbRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O8n+qLiKikMZzVa2V8A3ZVlacdc4u3odR9cqOm9xhp6z4JNsU8LFUryuaWnkPGEus
 XMa+eB6a6vKOmsVmSIV9JyPrw1gWss/8T5YBNnhlihpdZCfNJyXcs0O8F0DyiPMbwR
 9WCDt2MJsAu79e8IA98IH0CFBNk0SaaoJSisXIHo=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jyri Sarha <jsarha@ti.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 zhong jiang <zhongjiang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDk6NTk6NTZBTSArMDMwMCwgVG9taSBWYWxrZWluZW4g
d3JvdGU6Cj4gSGksCj4gCj4gT24gMDgvMDgvMjAxOSAxNTo1MCwgTGF1cmVudCBQaW5jaGFydCB3
cm90ZToKPiA+IEhpIEdyZWcsCj4gPiAKPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+ID4g
Cj4gPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAwMTo1Nzo0OVBNICswMjAwLCBHcmVnIEtyb2Fo
LUhhcnRtYW4gd3JvdGU6Cj4gPiA+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhl
cmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRoZQo+ID4gPiByZXR1cm4gdmFsdWUuICBUaGUg
ZnVuY3Rpb24gY2FuIHdvcmsgb3Igbm90LCBidXQgdGhlIGNvZGUgbG9naWMgc2hvdWxkCj4gPiA+
IG5ldmVyIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgYmFzZWQgb24gdGhpcy4KPiA+ID4gCj4gPiA+
IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+ID4gPiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+ID4gPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgo+ID4gPiBDYzogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlh
bi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Cj4gPiA+IENjOiBKeXJpIFNhcmhhIDxqc2FyaGFAdGku
Y29tPgo+ID4gPiBDYzogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT4KPiA+ID4gQ2M6
IHpob25nIGppYW5nIDx6aG9uZ2ppYW5nQGh1YXdlaS5jb20+Cj4gPiA+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiAKPiA+IFRoaXMgbWFrZXMgc2Vu
c2UuCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiAKPiA+IFRvbWksIHdpbGwgeW91IHRha2UgdGhpcyBw
YXRjaCBpbiB5b3VyIHRyZWUgPwo+IAo+IFllcywgSSdsbCBwaWNrIHRoaXMgdXAuIEkgcHJlc3Vt
ZSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCkgd2lsbCBnaXZlIGEgd2FybmluZwo+IHByaW50IGlmIGl0
IGZhaWxzIHRvIGNyZWF0ZSB0aGUgZmlsZSwgaW5zdGVhZCBvZiBiZWluZyBzaWxlbnQuCgpZZXMg
aXQgZG9lcywgcGxlYXNlIHNlZSA0M2UyM2I2YzBiMDEgKCJkZWJ1Z2ZzOiBsb2cgZXJyb3JzIHdo
ZW4Kc29tZXRoaW5nIGdvZXMgd3JvbmciKSBhbmQgYzMzZDQ0MjMyOGY1ICgiZGVidWdmczogbWFr
ZSBlcnJvciBtZXNzYWdlIGEKYml0IG1vcmUgdmVyYm9zZSIpIGZvciB0aGUgZGV0YWlscyBpZiB5
b3UgYXJlIGN1cmlvdXMuCgpUaG9zZSB3YXJuaW5ncyBoYXZlIGFscmVhZHkgZm91bmQgYXQgbGVh
c3Qgb25lIHVzZXIgb2YgZGVidWdmcyB0aGF0IHdhcwpkb2luZyB0aGluZ3Mgd3JvbmcgYW5kIG5v
IG9uZSBoYWQgbm90aWNlZCBiZWZvcmUuCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
