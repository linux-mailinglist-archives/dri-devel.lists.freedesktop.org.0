Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BD61127EF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CAF72B00;
	Wed,  4 Dec 2019 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077772B00
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:42:12 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5889C290EFA;
 Wed,  4 Dec 2019 09:42:10 +0000 (GMT)
Date: Wed, 4 Dec 2019 10:42:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 08/11] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191204104207.38367944@collabora.com>
In-Reply-To: <20191204091255.GB6705@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-9-boris.brezillon@collabora.com>
 <20191203181705.GT4730@pendragon.ideasonboard.com>
 <20191204100302.38096544@collabora.com>
 <20191204091255.GB6705@pendragon.ideasonboard.com>
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

T24gV2VkLCA0IERlYyAyMDE5IDExOjEyOjU1ICswMjAwCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IE9u
IFdlZCwgRGVjIDA0LCAyMDE5IGF0IDEwOjAzOjAyQU0gKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3
cm90ZToKPiA+IE9uIFR1ZSwgMyBEZWMgMjAxOSAyMDoxNzowNSArMDIwMCBMYXVyZW50IFBpbmNo
YXJ0IHdyb3RlOiAgCj4gPiA+IE9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDAzOjE1OjEyUE0gKzAx
MDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4gPiA+IE9uZSBvZiB0aGUgbGFzdCByZW1h
aW5pbmcgb2JqZWN0cyB0byBub3QgaGF2ZSBpdHMgYXRvbWljIHN0YXRlLgo+ID4gPiA+IAo+ID4g
PiA+IFRoaXMgaXMgYmVpbmcgbW90aXZhdGVkIGJ5IG91ciBhdHRlbXB0IHRvIHN1cHBvcnQgcnVu
dGltZSBidXMtZm9ybWF0Cj4gPiA+ID4gbmVnb3RpYXRpb24gYmV0d2VlbiBlbGVtZW50cyBvZiB0
aGUgYnJpZGdlIGNoYWluLgo+ID4gPiA+IFRoaXMgcGF0Y2gganVzdCBwYXZlcyB0aGUgcm9hZCBm
b3Igc3VjaCBhIGZlYXR1cmUgYnkgYWRkaW5nIGEgbmV3Cj4gPiA+ID4gZHJtX2JyaWRnZV9zdGF0
ZSBvYmplY3QgaW5oZXJpdGluZyBmcm9tIGRybV9wcml2YXRlX29iaiBzbyB3ZSBjYW4KPiA+ID4g
PiByZS11c2Ugc29tZSBvZiB0aGUgZXhpc3Rpbmcgc3RhdGUgaW5pdGlhbGl6YXRpb24vdHJhY2tp
bmcgbG9naWMuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9u
IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogTmVp
bCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+
IENoYW5nZXMgaW4gdjQ6Cj4gPiA+ID4gKiBGaXggdGhlIGRvYwo+ID4gPiA+ICogS2lsbCBkZWZh
dWx0IGhlbHBlcnMgKGlubGluZWQpICAgIAo+ID4gPiAKPiA+ID4gSSBsaWtlZCB0aGUgZGVmYXVs
dCBoZWxwZXJzLCBpbmxpbmluZyB0aGVpciBjb250ZW50IG1ha2VzIHRoZSBjb2RlIG1vcmUKPiA+
ID4gZGlmZmljdWx0IHRvIGZvbGxvdyBpbiBteSBvcGluaW9uLiAgCj4gPiAKPiA+IEknbGwgZ28g
YmFjayB0byB0aGlzIGFwcHJvYWNoIHRoZW4uIFNob3VsZCBJIGtlZXAgdGhlIG9yaWdpbmFsIGhl
bHBlcgo+ID4gbmFtZXMgZXZlbiB0aG91Z2ggdGhleSdyZSBub3QgZ2xvYmFsbHkgdmlzaWJsZSAo
YW5kIHNob3VsZCBwcm9iYWJseQo+ID4gbmV2ZXIgYmUpPyAgCj4gCj4gSSBhZ3JlZSB0aGV5IHNo
b3VsZCBwcm9iYWJseSBuZXZlciBiZSB2aXNpYmxlLCBhbmQgSSB0cnVzdCB5b3VyCj4ganVkZ2Vt
ZW50IG9uIG5hbWluZy4gUGxlYXNlIGRvdWJsZS1jaGVjayB0aGUgZG9jdW1lbnRhdGlvbiB0aG91
Z2gsIHRvCj4gZW5zdXJlIHRoYXQgaXQgbWF0Y2hlcyB0aGUgaW1wbGVtZW50YXRpb24uCj4gCgpJ
cyB0aGVyZSBhbnkgcG9pbnQga2VlcGluZyB0aGUgZG9jdW1lbnRhdGlvbiBpZiB0aGV5J3JlIG5v
dCBleHBvc2VkPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
