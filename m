Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52176BC245
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119346E9E8;
	Tue, 24 Sep 2019 07:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64C6E98E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 17:57:27 +0000 (UTC)
Received: from bell.riseup.net (bell-pn.riseup.net [10.0.1.178])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id E3D001A0DA7;
 Mon, 23 Sep 2019 10:57:25 -0700 (PDT)
X-Riseup-User-ID: 09F0AE2C6C56BF08CD5EBE05B5951D0EEE3EBD23478EAC0475B93738BB7874E8
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by bell.riseup.net (Postfix) with ESMTPSA id F1B7E2249A0;
 Mon, 23 Sep 2019 10:57:21 -0700 (PDT)
To: Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <CGME20190921125017epcas3p2f5661cca04f0959f9707f6111102435d@epcas3p2.samsung.com>
 <20190921124843.6967-1-joonas.kylmala@iki.fi>
 <d8a8bf25-0c5e-8d94-9406-b1f74e3edfac@samsung.com>
From: =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala@iki.fi>
Openpgp: preference=signencrypt
Autocrypt: addr=joonas.kylmala@iki.fi; prefer-encrypt=mutual; keydata=
 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
 gKPkEg==
Subject: Re: [PATCH] drm/panel: samsung: s6e8aa0: Add backlight control support
Message-ID: <08a83744-ed02-d641-e2a4-db2247ae53de@iki.fi>
Date: Mon, 23 Sep 2019 20:57:17 +0300
MIME-Version: 1.0
In-Reply-To: <d8a8bf25-0c5e-8d94-9406-b1f74e3edfac@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
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
Cc: paul.kocialkowski@bootlin.com, GNUtoo@cyberdimension.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgp0aGFua3MgYSBsb3QgZm9yIHRoZSByZXZpZXcsIEFuZHJ6ZWohCgpBbmRyemVqIEhhamRh
Ogo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIHM2ZThhYTBfYmFja2xpZ2h0
X29wcyA9IHsKPj4gKwkudXBkYXRlX3N0YXR1cwk9IHM2ZThhYTBfc2V0X2JyaWdodG5lc3MsCj4g
Cj4gCj4gVGhpcyBpcyByYWN5LCB1cGRhdGVfc3RhdHVzIGNhbiBiZSBjYWxsZWQgaW4gYW55IHRp
bWUgYmV0d2VlbiBwcm9iZSBhbmQKPiByZW1vdmUsIHBhcnRpY3VsYXJseToKPiAKPiBhKSBiZWZv
cmUgcGFuZWwgZW5hYmxlLAo+IAo+IGIpIGR1cmluZyBwYW5lbCBlbmFibGUsCj4gCj4gYykgd2hl
biBwYW5lbCBpcyBlbmFibGVkLAo+IAo+IGQpIGR1cmluZyBwYW5lbCBkaXNhYmxlLAo+IAo+IGUp
IGFmdGVyIHBhbmVsIGRpc2FibGUsCj4gCj4gCj4gYiBhbmQgZCBhcmUgcmFjeSBmb3Igc3VyZSAt
IGJhY2tsaWdodCBhbmQgZHJtIGNhbGxiYWNrcyBhcmUgYXN5bmMuCj4gCj4gSU1PIHRoZSBiZXN0
IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHJlZ2lzdGVyIGJhY2tsaWdodCBhZnRlciBhdHRhY2hpbmcK
PiBwYW5lbCB0byBkcm0sIGJ1dCBmb3IgdGhpcyBkcm1fcGFuZWxfZnVuY3Mgc2hvdWxkIGhhdmUg
YXR0YWNoL2RldGFjaAo+IGNhbGxiYWNrcyAobGlrZSBkcm1fYnJpZGdlX2Z1bmNzKSwKPiAKPiB0
aGVuIHVwZGF0ZV9zdGF0dXMgY2FsbGJhY2sgc2hvdWxkIHRha2Ugc29tZSBkcm1fY29ubmVjdG9y
IGxvY2sgdG8KPiBzeW5jaHJvbml6ZSB3aXRoIGRybSwgYW5kIHdyaXRlIHRvIGh3IG9ubHkgd2hl
biBwaXBlIGlzIGVuYWJsZWQuCgpJIHdpbGwgc3RhcnQgcmVhZGluZyB0aGUga2VybmVsIERSTSBL
TVMgZG9jdW1lbnRhdGlvbiBpbiBvcmRlciB0byBsZWFybgpob3cgdGhlIGF0dGFjaCBjYWxsYmFj
ayB3b3VsZCBmaXQgaW4gdGhlIHBpY3R1cmUgYW5kIGRvIHdoYXQgeW91IHN1Z2dlc3QKYnV0IGl0
IG1pZ2h0IHRha2UgYSBmZXcgd2Vla3Mgb3IgbW9udGhzLgoKQWxzbywgYXMgYSBsb3Qgb2YgdGhp
cyBjb2RlIHdhcyBtaW1pY2tlZCBmcm9tCmRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1z
dW5nLXM2ZTYzbTAuYyBpdCBsb29rcyBsaWtlIHRoYXQgaXMgYWxzbwpoYXZpbmcgdGhpcyByYWNl
IGNvbmRpdGlvbi4gVW5mb3J0dW5hdGVseSwgSSBkb24ndCB0aGluayBJIGhhdmUgdGhlCnM2ZTYz
bTAgcGFuZWwgc28gZm9yIHRoYXQgSSBwcm9iYWJseSBjYW5ub3QgZml4IHRoaXMgaXNzdWUuCgpK
b29uYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
