Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25C3899C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7A489B20;
	Fri,  7 Jun 2019 12:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B6589B20
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:03:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 817DE334;
 Fri,  7 Jun 2019 14:03:18 +0200 (CEST)
Date: Fri, 7 Jun 2019 15:03:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190607120304.GH7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-20-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559908998;
 bh=84znYhgs5zYBGQHXQMi32sSSKWf+vibIjQy0J6VPl/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W+XFkIEVyl5OCJAOjfsk5rQcwXyh69rVjOpQcMWrKGCSd64PRP0pscrFfMw9Ckr5T
 jKAoCC3UmVmO87u5oVEPgynapV3JQwezuqbbzhRJ/8WBXJgkZy5JFL0xGALwwJpKZz
 GWgeT/i/eruObyIPEzQmGyvw00zQPkObcSXtmFrk=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjoxOVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gRW5hYmxlIHRoZSBH
QU1NQV9MVVQgS01TIHByb3BlcnR5IHVzaW5nIHRoZSBmcmFtZXdvcmsgaGVscGVycyB0bwo+IHJl
Z2lzdGVyIHRoZSBwcm9lcHJ0eSBhbmQgdGhlIGFzc29jaWF0ZWQgZ2FtbWEgdGFibGUgc2l6ZSBt
YXhpbXVtIHNpemUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVu
ZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2NydGMuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwo+IGluZGV4IGU2ZDNkZjM3YzgyNy4u
YzkyMGZiNWRiYTY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMK
PiBAQCAtMTIwNyw2ICsxMjA3LDkgQEAgaW50IHJjYXJfZHVfY3J0Y19jcmVhdGUoc3RydWN0IHJj
YXJfZHVfZ3JvdXAgKnJncnAsIHVuc2lnbmVkIGludCBzd2luZGV4LAo+ICAJICAgIHJjZHUtPmNt
bXNbc3dpbmRleF0pIHsKPiAgCQlyY3J0Yy0+Y21tID0gcmNkdS0+Y21tc1tzd2luZGV4XTsKPiAg
CQlyZ3JwLT5jbW1zX21hc2sgfD0gQklUKGh3aW5kZXggJSAyKTsKPiArCj4gKwkJZHJtX21vZGVf
Y3J0Y19zZXRfZ2FtbWFfc2l6ZShjcnRjLCBDTU1fR0FNTUFfTFVUX1NJWkUpOwo+ICsJCWRybV9j
cnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIGZhbHNlLCBDTU1fR0FNTUFfTFVUX1NJWkUp
OwoKVGhpcyBjaGFuZ2UgbG9va3MgZ29vZCwgYnV0IHlvdSBhbHNvIG5lZWQgdG8gYWRkIHN1cHBv
cnQgZm9yIGxlZ2FjeSBBUEkuCkFjY29yZGluZyB0byB0aGUgZnVuY3Rpb24ncyBkb2N1bWVudGF0
aW9uLAoKICogRHJpdmVycyBzaG91bGQgdXNlIGRybV9hdG9taWNfaGVscGVyX2xlZ2FjeV9nYW1t
YV9zZXQoKSB0byBpbXBsZW1lbnQgdGhlCiAqIGxlZ2FjeSAmZHJtX2NydGNfZnVuY3MuZ2FtbWFf
c2V0IGNhbGxiYWNrLgoKPiAgCX0KPiAgCj4gIAlkcm1fY3J0Y19oZWxwZXJfYWRkKGNydGMsICZj
cnRjX2hlbHBlcl9mdW5jcyk7Cj4gCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
