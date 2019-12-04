Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5F11264F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909056F473;
	Wed,  4 Dec 2019 09:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0E56F473
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:03:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 928FF291100;
 Wed,  4 Dec 2019 09:03:04 +0000 (GMT)
Date: Wed, 4 Dec 2019 10:03:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 08/11] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191204100302.38096544@collabora.com>
In-Reply-To: <20191203181705.GT4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-9-boris.brezillon@collabora.com>
 <20191203181705.GT4730@pendragon.ideasonboard.com>
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

T24gVHVlLCAzIERlYyAyMDE5IDIwOjE3OjA1ICswMjAwCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDAzOjE1
OjEyUE0gKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IE9uZSBvZiB0aGUgbGFzdCBy
ZW1haW5pbmcgb2JqZWN0cyB0byBub3QgaGF2ZSBpdHMgYXRvbWljIHN0YXRlLgo+ID4gCj4gPiBU
aGlzIGlzIGJlaW5nIG1vdGl2YXRlZCBieSBvdXIgYXR0ZW1wdCB0byBzdXBwb3J0IHJ1bnRpbWUg
YnVzLWZvcm1hdAo+ID4gbmVnb3RpYXRpb24gYmV0d2VlbiBlbGVtZW50cyBvZiB0aGUgYnJpZGdl
IGNoYWluLgo+ID4gVGhpcyBwYXRjaCBqdXN0IHBhdmVzIHRoZSByb2FkIGZvciBzdWNoIGEgZmVh
dHVyZSBieSBhZGRpbmcgYSBuZXcKPiA+IGRybV9icmlkZ2Vfc3RhdGUgb2JqZWN0IGluaGVyaXRp
bmcgZnJvbSBkcm1fcHJpdmF0ZV9vYmogc28gd2UgY2FuCj4gPiByZS11c2Ugc29tZSBvZiB0aGUg
ZXhpc3Rpbmcgc3RhdGUgaW5pdGlhbGl6YXRpb24vdHJhY2tpbmcgbG9naWMuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gKiBGaXggdGhlIGRvYwo+ID4gKiBL
aWxsIGRlZmF1bHQgaGVscGVycyAoaW5saW5lZCkgIAo+IAo+IEkgbGlrZWQgdGhlIGRlZmF1bHQg
aGVscGVycywgaW5saW5pbmcgdGhlaXIgY29udGVudCBtYWtlcyB0aGUgY29kZSBtb3JlCj4gZGlm
ZmljdWx0IHRvIGZvbGxvdyBpbiBteSBvcGluaW9uLgoKSSdsbCBnbyBiYWNrIHRvIHRoaXMgYXBw
cm9hY2ggdGhlbi4gU2hvdWxkIEkga2VlcCB0aGUgb3JpZ2luYWwgaGVscGVyCm5hbWVzIGV2ZW4g
dGhvdWdoIHRoZXkncmUgbm90IGdsb2JhbGx5IHZpc2libGUgKGFuZCBzaG91bGQgcHJvYmFibHkK
bmV2ZXIgYmUpPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
