Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817FF108385
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 14:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411FD89F55;
	Sun, 24 Nov 2019 13:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1089F55
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 13:40:11 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 47ED627C12F;
 Sun, 24 Nov 2019 13:40:09 +0000 (GMT)
Date: Sun, 24 Nov 2019 14:40:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 06/21] drm: Stop accessing encoder->bridge directly
Message-ID: <20191124144006.7e2fc959@collabora.com>
In-Reply-To: <20191124103926.GG4727@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-7-boris.brezillon@collabora.com>
 <20191124103926.GG4727@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyNCBOb3YgMjAxOSAxMjozOToyNiArMDIwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiA+IEBAIC0xMzQ2LDcgKzEz
NTUsNyBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2VuYWJsZXMoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ICAJCQkJZnVuY3MtPmNvbW1pdChlbmNvZGVyKTsKPiA+
ICAJCX0KPiA+ICAKPiA+IC0JCWRybV9hdG9taWNfYnJpZGdlX2NoYWluX2VuYWJsZShlbmNvZGVy
LT5icmlkZ2UsIG9sZF9zdGF0ZSk7Cj4gPiArCQlkcm1fYXRvbWljX2JyaWRnZV9jaGFpbl9lbmFi
bGUoYnJpZGdlLCBvbGRfc3RhdGUpOwo+ID4gIAl9Cj4gPiAgCj4gPiAgCWRybV9hdG9taWNfaGVs
cGVyX2NvbW1pdF93cml0ZWJhY2tzKGRldiwgb2xkX3N0YXRlKTsKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZW5jb2Rl
ci5jCj4gPiBpbmRleCA4MGQ4OGE1NTMwMmUuLjRmZTllNzIzZTIyNyAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZW5jb2Rlci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VuY29kZXIuYwo+ID4gQEAgLTE2Nyw5ICsxNjcsMTAgQEAgdm9pZCBkcm1fZW5jb2Rlcl9j
bGVhbnVwKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+ICAJICovCj4gPiAgCj4gPiAg
CWlmIChlbmNvZGVyLT5icmlkZ2UpIHsKPiA+IC0JCXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Ug
PSBlbmNvZGVyLT5icmlkZ2U7Cj4gPiArCQlzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlOwo+ID4g
IAkJc3RydWN0IGRybV9icmlkZ2UgKm5leHQ7Cj4gPiAgCj4gPiArCQlicmlkZ2UgPSBkcm1fYnJp
ZGdlX2NoYWluX2dldF9maXJzdF9icmlkZ2UoZW5jb2Rlcik7Cj4gPiAgCQl3aGlsZSAoYnJpZGdl
KSB7Cj4gPiAgCQkJbmV4dCA9IGJyaWRnZS0+bmV4dDsgIAo+IAo+IFNob3VsZG4ndCB0aGlzIGhh
dmUgYmVlbiBhZGRyZXNzZWQgaW4gdGhlIHByZXZpb3VzIHBhdGNoID8KPiAKCkl0IHNob3VsZCBh
bmQgSSB3aWxsIHVwZGF0ZSBwYXRjaCA2IGFjY29yZGluZ2x5LiBUaGlzIGJlaW5nIHNhaWQsIGl0
J3MKbm90IGEgYmlnIGRlYWwgc2luY2UgdGhlIGNvZGUgaXMgcGF0Y2hlZCB0byB1c2UKbGlzdF9m
b3JfZWFjaF9lbnRyeV9zYWZlKCkgaW4gcGF0Y2ggNyA7LSkuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
