Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E0296F4
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 13:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14596E0FB;
	Fri, 24 May 2019 11:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590FC6E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 11:19:38 +0000 (UTC)
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 71F01C0006;
 Fri, 24 May 2019 11:19:29 +0000 (UTC)
Date: Fri, 24 May 2019 13:19:28 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 3/6] drm/sun4i: dsi: Add bridge support
Message-ID: <20190524111928.ourdmraxw7vrhaar@flea>
References: <20190524104317.20287-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524104317.20287-1-jagan@amarulasolutions.com>
User-Agent: NeoMutt/20180716
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
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAwNDoxMzoxNFBNICswNTMwLCBKYWdhbiBUZWtp
IHdyb3RlOgo+IFNvbWUgZGlzcGxheSBwYW5lbHMgd291bGQgY29tZSB1cCB3aXRoIGEgbm9uLURT
SSBvdXRwdXQgd2hpY2gKPiBjYW4gaGF2ZSBhbiBvcHRpb24gdG8gY29ubmVjdCBEU0kgaW50ZXJm
YWNlIGJ5IG1lYW5zIG9mIGJyaWRnZQo+IGNvbnZlcnRlci4KPgo+IFRoaXMgRFNJIHRvIG5vbi1E
U0kgYnJpZGdlIGNvbnZlcnRlciB3b3VsZCByZXF1aXJlIGEgYnJpZGdlCj4gZHJpdmVyIHRoYXQg
d291bGQgY29tbXVuaWNhdGUgdGhlIERTSSBjb250cm9sbGVyIGZvciBicmlkZ2UKPiBmdW5jdGlv
bmFsaXRpZXMuCj4KPiBTbywgYWRkIHN1cHBvcnQgZm9yIGJyaWRnZSBmdW5jdGlvbmFsaXRpZXMg
aW4gQWxsd2lubmVyIERTSQo+IGNvbnRyb2xsZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBU
ZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA2MCArKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuaCB8ICAxICsKPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCj4gaW5kZXggYWUyZmUzMWIwNWIxLi4yYjRiMTM1
NWE4OGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNp
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+IEBAIC03
NzUsNiArNzc1LDkgQEAgc3RhdGljIHZvaWQgc3VuNmlfZHNpX2VuY29kZXJfZW5hYmxlKHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiAgCWlmICghSVNfRVJSKGRzaS0+cGFuZWwpKQo+ICAJ
CWRybV9wYW5lbF9wcmVwYXJlKGRzaS0+cGFuZWwpOwo+Cj4gKwlpZiAoIUlTX0VSUihkc2ktPmJy
aWRnZSkpCj4gKwkJZHJtX2JyaWRnZV9wcmVfZW5hYmxlKGRzaS0+YnJpZGdlKTsKPiArCgpkcm1f
cGFuZWxfYnJpZGdlIHByb3ZpZGVzIHdoYXQncyBuZWVkZWQgdG8gZGVhbCB3aXRoIGJvdGggYSBw
YW5lbCBhbmQKYSBicmlkZ2UsIEkgZ3Vlc3MgaXQgd291bGQgbWFrZSBzZW5zZSB0byB1c2UgdGhp
cyBpbnN0ZWFkIG9mCmR1cGxpY2F0aW5nIGV2ZXJ5dGhpbmcuCgpNYXhpbWUKCi0tCk1heGltZSBS
aXBhcmQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
