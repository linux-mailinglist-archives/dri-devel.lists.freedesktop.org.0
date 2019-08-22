Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528098D98
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DE76E49B;
	Thu, 22 Aug 2019 08:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2396E49B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 08:25:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A503A28CF32;
 Thu, 22 Aug 2019 09:25:16 +0100 (BST)
Date: Thu, 22 Aug 2019 10:25:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH RFC 11/19] drm/bridge: Patch atomic hooks to take a
 drm_bridge_state
Message-ID: <20190822102513.67c73d7f@collabora.com>
In-Reply-To: <20190822000217.GB16985@pendragon.ideasonboard.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-12-boris.brezillon@collabora.com>
 <20190822000217.GB16985@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMiBBdWcgMjAxOSAwMzowMjoxNyArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiA+ICB9Cj4gPiAgRVhQT1JU
X1NZTUJPTChkcm1fYXRvbWljX2JyaWRnZV9jaGFpbl9wb3N0X2Rpc2FibGUpOwo+ID4gQEAgLTUx
OCwxMCArNTM1LDE4IEBAIHZvaWQgZHJtX2F0b21pY19icmlkZ2VfY2hhaW5fcHJlX2VuYWJsZShz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gPiAgCj4gPiAgCWxpc3RfZm9yX2VhY2hfZW50
cnlfcmV2ZXJzZShicmlkZ2UsICZlbmNvZGVyLT5icmlkZ2VfY2hhaW4sCj4gPiAgCQkJCSAgICBj
aGFpbl9ub2RlKSB7Cj4gPiAtCQlpZiAoYnJpZGdlLT5mdW5jcy0+YXRvbWljX3ByZV9lbmFibGUp
Cj4gPiAtCQkJYnJpZGdlLT5mdW5jcy0+YXRvbWljX3ByZV9lbmFibGUoYnJpZGdlLCBzdGF0ZSk7
Cj4gPiAtCQllbHNlIGlmIChicmlkZ2UtPmZ1bmNzLT5wcmVfZW5hYmxlKQo+ID4gKwkJaWYgKGJy
aWRnZS0+ZnVuY3MtPmF0b21pY19wcmVfZW5hYmxlKSB7Cj4gPiArCQkJc3RydWN0IGRybV9icmlk
Z2Vfc3RhdGUgKmJyaWRnZV9zdGF0ZTsKPiA+ICsKPiA+ICsJCQlicmlkZ2Vfc3RhdGUgPSBkcm1f
YXRvbWljX2dldF9uZXdfYnJpZGdlX3N0YXRlKHN0YXRlLAo+ID4gKwkJCQkJCQkJICAgICAgIGJy
aWRnZSk7ICAKPiAKPiBTaG91bGRuJ3QgeW91IGdldCB0aGUgb2xkIHN0YXRlIGhlcmUgPyBUaGUg
bmV3IHN0YXRlIGluIGNvbW1pdC1yZWxhdGVkCj4gb3BlcmF0aW9ucyBpcyBzdXBwb3NlZCB0byBi
ZSBvYnRhaW5lZCBmcm9tIHRoZSBvYmplY3QgaXRzZWxmLCBhbmQgdGhlCj4gb2xkIHN0YXRlIGlz
IHBhc3NlZCB0byB0aGUgZnVuY3Rpb24uIFNlZSBob3cgdGhlIENSVEMgYW5kIGVuY29kZXIKPiAu
YXRvbWljX2VuYWJsZSgpIGFyZSBjYWxsZWQgaW4gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21v
ZGVzZXRfZW5hYmxlcwo+IChkcm1fYXRvbWljX2hlbHBlci5jKSBmb3IgaW5zdGFuY2UuCj4gCj4g
WW91IHNob3VsZCB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gb2YgdGhlIGJyaWRnZSBhdG9taWMg
b3BlcmF0aW9ucyB0bwo+IG1ha2VzIHRoaXMgZXhwbGljaXQuIFRoZSBkb2N1bWVudGF0aW9uIG9m
IHRoZSBicmlkZ2UgaGVscGVycwo+IChkcm1fYXRvbWljX2JyaWRnZV9lbmFibGUoKSAmIGNvLikg
aXMgYWxzbyBtaXNsZWFkaW5nLCB0aGV5IGdldCBwYXNzZWQKPiB0aGUgb2xkIHN0YXRlLCB3aGls
ZSB0aGUgZG9jdW1lbnRhdGlvbiBzdGF0ZXMgImF0b21pYyBzdGF0ZSBiZWluZwo+IGNvbW1pdHRl
ZCIuIEkgdGhpbmsgeW91IHNob3VsZCByZW5hbWUgYWxsIHRob3NlIHN0YXRlIHBhcmFtZXRlcnMg
dG8KPiBvbGRfc3RhdGUgdG8gbWFrZSB0aGlzIGNsZWFyZXIuCj4gCj4gTGFzdCBidXQgbm90IGxl
YXN0LCB0aGUgaW1wbGVtZW50YXRpb24gaW4gdGhlIGFuYWxvZ2l4IGJyaWRnZSBkcml2ZXIKPiBz
ZWVtcyB0byBleHBlY3QgdGhlIG5ldyBzdGF0ZSwgc28gSSB0aGluayBpdCdzIGJ1Z2d5LgoKSSBi
YXNlZCB0aGF0IGRlY2lzaW9uIG9uIHRoZSBvbmx5IGRyaXZlciBpbXBsZW1lbnRpbmcgdGhvc2Ug
aG9va3MuIEkKY2FuIHBhc3MgdGhlIG9sZF9zdGF0ZSBpbnN0ZWFkLgoKPiAKPiA+ICsJCQlpZiAo
V0FSTl9PTighYnJpZGdlX3N0YXRlKSkKPiA+ICsJCQkJcmV0dXJuOwo+ID4gKwo+ID4gKwkJCWJy
aWRnZS0+ZnVuY3MtPmF0b21pY19wcmVfZW5hYmxlKGJyaWRnZSwgYnJpZGdlX3N0YXRlKTsKPiA+
ICsJCX0gZWxzZSBpZiAoYnJpZGdlLT5mdW5jcy0+cHJlX2VuYWJsZSkgewo+ID4gIAkJCWJyaWRn
ZS0+ZnVuY3MtPnByZV9lbmFibGUoYnJpZGdlKTsKPiA+ICsJCX0KPiA+ICAJfQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
