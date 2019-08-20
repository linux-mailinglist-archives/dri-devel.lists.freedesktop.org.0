Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58C96841
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 20:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D936E840;
	Tue, 20 Aug 2019 18:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15496E842
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 18:02:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF9C733D;
 Tue, 20 Aug 2019 20:02:10 +0200 (CEST)
Date: Tue, 20 Aug 2019 21:02:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 18/19] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190820180205.GL10820@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-19-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190706140746.29132-19-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566324131;
 bh=RwxPZkVAe/4kQHs4ulwNUErBint7sN5+Gpu2PLkQQxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gNI3MgZxcG5L0dKoVa9vkhJgPckR996yAEfVijwv7B4a2ez1nJuOPlAlGL8lC5Rbc
 lUI2y8xv2PCEsrWbNjdyC6sP1tb9jhn8V3s5Gw9RH8MEIQtJmXzthF+wldhowtc4qO
 TfSamiIIfPuu8yU0fk5C6DAQuGaDyQ1ZGrpZC+iA=
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

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTYXQsIEp1bCAwNiwgMjAx
OSBhdCAwNDowNzo0NVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gRW5hYmxlIHRoZSBH
QU1NQV9MVVQgS01TIHByb3BlcnR5IHVzaW5nIHRoZSBmcmFtZXdvcmsgaGVscGVycyB0bwo+IHJl
Z2lzdGVyIHRoZSBwcm9lcHJ0eSBhbmQgdGhlIGFzc29jaWF0ZWQgZ2FtbWEgdGFibGUgc2l6ZSBt
YXhpbXVtIHNpemUuCgpzL3Byb2VwcnR5L3Byb3BlcnR5LwoiYW5kIHNldCB0aGUgYXNzb2NpYXRl
ZCBnYW1tZSB0YWJsZSBtYXhpbXVtIHNpemUiID8KCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3Bv
IE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jIHwgNCArKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2NydGMuYwo+IGluZGV4IDNkYWM2MDVjM2E2Ny4uMjIyY2NjMjBkNmQ4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKPiBAQCAtMTA4Miw2ICsxMDgyLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyBjcnRjX2Z1bmNzX2dlbjMgPSB7Cj4gIAku
c2V0X2NyY19zb3VyY2UgPSByY2FyX2R1X2NydGNfc2V0X2NyY19zb3VyY2UsCj4gIAkudmVyaWZ5
X2NyY19zb3VyY2UgPSByY2FyX2R1X2NydGNfdmVyaWZ5X2NyY19zb3VyY2UsCj4gIAkuZ2V0X2Ny
Y19zb3VyY2VzID0gcmNhcl9kdV9jcnRjX2dldF9jcmNfc291cmNlcywKPiArCS5nYW1tYV9zZXQg
PSBkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0LAo+ICB9Owo+ICAKPiAgLyogLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiBAQCAtMTIwNSw2ICsxMjA2LDkgQEAgaW50IHJjYXJfZHVfY3J0
Y19jcmVhdGUoc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJncnAsIHVuc2lnbmVkIGludCBzd2luZGV4
LAo+ICAJaWYgKHJjZHUtPmNtbXNbc3dpbmRleF0pIHsKPiAgCQlyY3J0Yy0+Y21tID0gcmNkdS0+
Y21tc1tzd2luZGV4XTsKPiAgCQlyZ3JwLT5jbW1zX21hc2sgfD0gQklUKGh3aW5kZXggJSAyKTsK
PiArCj4gKwkJZHJtX21vZGVfY3J0Y19zZXRfZ2FtbWFfc2l6ZShjcnRjLCBDTU1fR0FNTUFfTFVU
X1NJWkUpOwo+ICsJCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIGZhbHNlLCBD
TU1fR0FNTUFfTFVUX1NJWkUpOwo+ICAJfQo+ICAKPiAgCWRybV9jcnRjX2hlbHBlcl9hZGQoY3J0
YywgJmNydGNfaGVscGVyX2Z1bmNzKTsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
