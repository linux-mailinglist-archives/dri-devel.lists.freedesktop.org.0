Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B811263B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6506F8D1;
	Wed,  4 Dec 2019 09:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A376F8D5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:00:51 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C14B629112A;
 Wed,  4 Dec 2019 09:00:49 +0000 (GMT)
Date: Wed, 4 Dec 2019 10:00:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 07/11] drm/bridge: Clarify the atomic enable/disable
 hooks semantics
Message-ID: <20191204100046.2b4aab64@collabora.com>
In-Reply-To: <20191203180223.GS4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-8-boris.brezillon@collabora.com>
 <20191203180223.GS4730@pendragon.ideasonboard.com>
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

T24gVHVlLCAzIERlYyAyMDE5IDIwOjAyOjIzICswMjAwCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDAzOjE1OjEx
UE0gKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IFRoZSBbcHJlX11lbmFibGUvW3Bv
c3RfXWRpc2FibGUgaG9va3MgYXJlIHBhc3NlZCB0aGUgb2xkIGF0b21pYyBzdGF0ZS4KPiA+IFVw
ZGF0ZSB0aGUgZG9jIGFuZCByZW5hbWUgdGhlIGFyZ3VtZW50cyB0byBtYWtlIGl0IGNsZWFyLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjQ6Cj4g
PiAqIERyb3AgdGhlIGRvYyB1cGRhdGUgKExhdXJlbnQpICAKPiAKPiBJIHdhcyByZWZlcnJpbmcg
dG8gdGhlIGRvYyB1cGRhdGVzIGluIGRybV9icmlkZ2UuaCBvbmx5LiBJcyB0aGVyZSBhCj4gcmVh
c29uIHlvdSBkcm9wcGVkIHRoZSBjaGFuZ2VzIGZyb20gZHJtX2JyaWRnZS5jID8gSSB0aGluayB0
aG9zZSB3ZXJlCj4gZ29vZC4KCk9vcHMsIHRoYXQncyBhIG1pc3Rha2UuIEknbGwgZml4IGl0IGJl
Zm9yZSBhcHBseWluZy4KCj4gCj4gPiAqIEFkZCBSYnMKPiA+IAo+ID4gQ2hhbmdlcyBpbiB2MzoK
PiA+ICogTmV3IHBhdGNoCj4gPiAtLS0KPiA+ICBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggfCA4
ICsrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ID4gaW5kZXggYmZiMDM4NTE2M2YxLi5kN2Q3MTQwMjMw
NTAgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiA+ICsrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ID4gQEAgLTI2Myw3ICsyNjMsNyBAQCBzdHJ1Y3QgZHJt
X2JyaWRnZV9mdW5jcyB7Cj4gPiAgCSAqIFRoZSBAYXRvbWljX3ByZV9lbmFibGUgY2FsbGJhY2sg
aXMgb3B0aW9uYWwuCj4gPiAgCSAqLwo+ID4gIAl2b2lkICgqYXRvbWljX3ByZV9lbmFibGUpKHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gPiAtCQkJCSAgc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlKTsKPiA+ICsJCQkJICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRl
KTsKPiA+ICAKPiA+ICAJLyoqCj4gPiAgCSAqIEBhdG9taWNfZW5hYmxlOgo+ID4gQEAgLTI4OCw3
ICsyODgsNyBAQCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyB7Cj4gPiAgCSAqIFRoZSBAYXRvbWlj
X2VuYWJsZSBjYWxsYmFjayBpcyBvcHRpb25hbC4KPiA+ICAJICovCj4gPiAgCXZvaWQgKCphdG9t
aWNfZW5hYmxlKShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4gLQkJCSAgICAgIHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7Cj4gPiArCQkJICAgICAgc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKm9sZF9zdGF0ZSk7Cj4gPiAgCS8qKgo+ID4gIAkgKiBAYXRvbWljX2Rpc2FibGU6
Cj4gPiAgCSAqCj4gPiBAQCAtMzExLDcgKzMxMSw3IEBAIHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNz
IHsKPiA+ICAJICogVGhlIEBhdG9taWNfZGlzYWJsZSBjYWxsYmFjayBpcyBvcHRpb25hbC4KPiA+
ICAJICovCj4gPiAgCXZvaWQgKCphdG9taWNfZGlzYWJsZSkoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSwKPiA+IC0JCQkgICAgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKTsKPiA+
ICsJCQkgICAgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSk7Cj4gPiAgCj4g
PiAgCS8qKgo+ID4gIAkgKiBAYXRvbWljX3Bvc3RfZGlzYWJsZToKPiA+IEBAIC0zMzcsNyArMzM3
LDcgQEAgc3RydWN0IGRybV9icmlkZ2VfZnVuY3Mgewo+ID4gIAkgKiBUaGUgQGF0b21pY19wb3N0
X2Rpc2FibGUgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCj4gPiAgCSAqLwo+ID4gIAl2b2lkICgqYXRv
bWljX3Bvc3RfZGlzYWJsZSkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiA+IC0JCQkJICAg
IHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7Cj4gPiArCQkJCSAgICBzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKTsKPiA+ICB9Owo+ID4gIAo+ID4gIC8qKiAgCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
