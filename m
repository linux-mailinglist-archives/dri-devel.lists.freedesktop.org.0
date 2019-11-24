Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A113810836B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 14:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A103A89C93;
	Sun, 24 Nov 2019 13:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4DA89C93
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 13:28:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E77B128FFBF;
 Sun, 24 Nov 2019 13:28:20 +0000 (GMT)
Date: Sun, 24 Nov 2019 14:28:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 03/21] drm/exynos: Declare the DSI encoder as a
 bridge element
Message-ID: <20191124142818.516dfac4@collabora.com>
In-Reply-To: <20191124141727.45597a6e@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-4-boris.brezillon@collabora.com>
 <20191124102433.GD4727@pendragon.ideasonboard.com>
 <20191124141727.45597a6e@collabora.com>
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

T24gU3VuLCAyNCBOb3YgMjAxOSAxNDoxNzoyNyArMDEwMApCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gPiA+IEBAIC0xNjg3LDE2ICsxNzA1
LDE4IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZSAqbWFzdGVyLAo+ID4gPiAgCWRybV9lbmNvZGVyX2luaXQoZHJtX2RldiwgZW5j
b2RlciwgJmV4eW5vc19kc2lfZW5jb2Rlcl9mdW5jcywKPiA+ID4gIAkJCSBEUk1fTU9ERV9FTkNP
REVSX1RNRFMsIE5VTEwpOwo+ID4gPiAgCj4gPiA+IC0JZHJtX2VuY29kZXJfaGVscGVyX2FkZChl
bmNvZGVyLCAmZXh5bm9zX2RzaV9lbmNvZGVyX2hlbHBlcl9mdW5jcyk7Cj4gPiA+IC0KPiA+ID4g
IAlyZXQgPSBleHlub3NfZHJtX3NldF9wb3NzaWJsZV9jcnRjcyhlbmNvZGVyLCBFWFlOT1NfRElT
UExBWV9UWVBFX0xDRCk7Cj4gPiA+ICAJaWYgKHJldCA8IDApCj4gPiA+ICAJCXJldHVybiByZXQ7
Cj4gPiA+ICAKPiA+ID4gKwkvKiBEZWNsYXJlIG91cnNlbGYgYXMgdGhlIGZpcnN0IGJyaWRnZSBl
bGVtZW50LiAqLwo+ID4gPiArCWRzaS0+YnJpZGdlLmZ1bmNzID0gJmV4eW5vc19kc2lfYnJpZGdl
X2Z1bmNzOwo+ID4gPiArCWRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsICZkc2ktPmJyaWRnZSwg
TlVMTCk7Cj4gPiA+ICsKPiA+ID4gIAlpZiAoZHNpLT5pbl9icmlkZ2Vfbm9kZSkgewo+ID4gPiAg
CQlpbl9icmlkZ2UgPSBvZl9kcm1fZmluZF9icmlkZ2UoZHNpLT5pbl9icmlkZ2Vfbm9kZSk7Cj4g
PiA+ICAJCWlmIChpbl9icmlkZ2UpCj4gPiA+IC0JCQlkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVy
LCBpbl9icmlkZ2UsIE5VTEwpOwo+ID4gPiArCQkJZHJtX2JyaWRnZV9hdHRhY2goZW5jb2Rlciwg
aW5fYnJpZGdlLCAmZHNpLT5icmlkZ2UpOwo+ID4gPiAgCX0gIAo+ID4gCj4gPiBTYW1lIGFzIGZv
ciBwYXRjaCAwMS8yMSwgbWF5YmUgdGhpcyBjb3VsZCBiZSBtb3ZlZCB0byB0aGlzIGJyaWRnZSdz
Cj4gPiBhdHRhY2ggb3BlcmF0aW9uID8gQWN0dWFsbHksIG5vdyB0aGF0IEkndmUgcmVhZCB0aGUg
Y29kZSwgdGhpcyBpbl9icmlkZ2UKPiA+IHBhcnQgbG9va3Mgd2VpcmQuIFdoeSB3b3VsZCB0aGUg
RFNJIGVuY29kZXIgaGF2ZSBhbiBpbnB1dCBicmlkZ2UgdGhhdCBpcwo+ID4gaGFzIHRvIG1hbmFn
ZSBpdHNlbGYgPwo+IAo+IFllcywgSSBrbm93LCBpdCBkb2Vzbid0IG1ha2UgYW55IHNlbnNlLiBF
aXRoZXIgd2UncmUgZGVhbGluZyB3aXRoIGEKPiBicmlkZ2Ugd2hpY2ggY2FuIGJlIGNoYWluZWQg
dG8gb3RoZXIgYnJpZGdlcyAoY2FuIGJlIHBsYWNlZCBpbiB0aGUKPiBtaWRkbGUgb2YgYSBjaGFp
biBhcyB3ZWxsKSwgb3Igd2UncmUgZGVhbGluZyB3aXRoIGFuIGVuY29kZXIgd2hpY2gKPiBwcmVj
ZWRlcyBhbnkgYnJpZGdlcy4gSW4gdGhlIGxhdHRlciBjYXNlICh3aGljaCBpcyBob3cgZXh5bm9z
X2RzaSBpcwo+IGltcGxlbWVudGVkKSBpbl9icmlkZ2UgZG9lc24ndCBoYXZlIGFueSBtZWFuaW5n
LCBhbmQgdGhhdCdzIGV2ZW4gd29yc2UKPiBzaW5jZSB3ZSdyZSBwbGFjaW5nIHRoZSBzby1jYWxs
ZWQgaW5wdXQgYnJpZGdlIChBS0EgcHJldmlvdXMgYnJpZGdlKQo+IGFmdGVyIG91ciBlbmNvZGVy
ICh0aGF0J3Mgd2hhdCBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBpbl9icmlkZ2UsCj4gTlVM
TCkgZG9lcykuCgpNb3JlIG9uIHRoYXQgdG9waWM6IEkgY2hlY2tlZCB0aGUgZXh5bm9zIGR0cyB3
ZSBoYXZlIGluIG1haW5saW5lIGFuZApubyBvbmUgaXMgbWFraW5nIHVzZSBvZiB0aGUgcG9ydHMg
cGFydCBvZiB0aGUgZXh5bm9zX2RzaW0gYmluZGluZ3MsIHNvCm1heWJlIHdlIHNob3VsZCBqdXN0
IGRlcHJlY2F0ZSBpdC4gVGhlIG90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBwYXRjaAp0aGUgZHJp
dmVyIHRvIGFjdCBhcyBhIHJlYWwgYnJpZGdlLCBidXQgSSBjYW4ndCBkbyB0aGF0IHdpdGhvdXQg
c29tZW9uZQp0ZXN0aW5nIG15IGNoYW5nZXMgYW5kIEkgZGlkbid0IGdldCBtdWNoIGZlZWRiYWNr
IGZyb20gRXh5bm9zCm1haW50YWluZXJzIHNvIGZhci4uLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
