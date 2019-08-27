Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA999E9E4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 15:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E337899DE;
	Tue, 27 Aug 2019 13:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACB3899DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 13:49:07 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1i2bqL-0006r4-VU; Tue, 27 Aug 2019 15:49:05 +0200
Message-ID: <1566913742.4102.13.camel@pengutronix.de>
Subject: Re: [PATCH v2 17/21] drm/imx: pd: Use bus format/flags provided by
 the bridge when available
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 27 Aug 2019 15:49:02 +0200
In-Reply-To: <20190827152013.0d7aff4e@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-18-boris.brezillon@collabora.com>
 <1566893719.4102.1.camel@pengutronix.de>
 <20190827104353.1447e5ba@collabora.com>
 <1566897782.4102.6.camel@pengutronix.de>
 <20190827115706.1e172a63@collabora.com>
 <1566910280.4102.10.camel@pengutronix.de>
 <20190827152013.0d7aff4e@collabora.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTI3IGF0IDE1OjIwICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6
Cj4gT24gVHVlLCAyNyBBdWcgMjAxOSAxNDo1MToyMCArMDIwMAo+IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ICAKPiA+IFsuLi5dCj4gPiA+ID4gPiBJIGNh
biBkbyB0aGF0IGlmIHlvdSBsaWtlLiBOb3RlIHRoYXQgd2UgYXJlIGZvcndhcmRpbmcKPiA+ID4g
PiA+IHRoZSAtPm91dHB1dF9idXNfY2ZnLmZtdCB2YWx1ZSB0byB0aGUgSVBVIERJLCBub3QgLT5p
bnB1dF9idXNfY2ZnLmZtdC4KPiA+ID4gPiA+IEkganVzdCBhc3N1bWVkIHRoYXQgaW5wdXQgZm9y
bWF0IHdvdWxkbid0IGJlIHVzZWQgaW4gdGhlIGR1bW15IGJyaWRnZQo+ID4gPiA+ID4gZWxlbWVu
dCAodGhlIG9uZSBlbWJlZGRlZCBpbiB0aGUgZW5jb2Rlcikgc2luY2UgZW5jb2RlcnMgb25seSBo
YXZlIGFuCj4gPiA+ID4gPiBvdXRwdXQgZW5kIChpbnB1dCBwb3J0IGlzIGxpa2VseSB0byBiZSBh
IFNvQyBzcGVjaWZpYyBsaW5rIGJldHdlZW4gdGhlCj4gPiA+ID4gPiBDUlRDIGFuZCB0aGUgZW5j
b2RlciB3aGljaCB3ZSBwcm9iYWJseSBkb24ndCBuZWVkL3dhbnQgdG8gZXhwb3NlKS4gICAgCj4g
PiA+ID4gCj4gPiA+ID4gVGhlbiB3aHkgKHdvdWxkIHRoaXMgZHJpdmVyIGhhdmUgdG8pIGltcGxl
bWVudCBnZXRfaW5wdXRfZm10cyBhdCBhbGw/ICAKPiA+ID4gCj4gPiA+IFRoYXQncyB0aGUgb25s
eSB3YXkgd2UgY2FuIGNoZWNrIGlmIGFuIG91dHB1dCBmb3JtYXQgaXMgc3VwcG9ydGVkOiBidXMK
PiA+ID4gZm9ybWF0IG5lZ290aWF0aW9uIGlzIGJhc2VkIG9uIGEgdHJpYWwgYW5kIGVycm9yIGxv
Z2ljIHRoYXQgc3RhcnRzIGZyb20KPiA+ID4gdGhlIGVuZCBvZiB0aGUgcGlwZWxpbmUgKGxhc3Qg
YnJpZGdlIGVsZW1lbnQpIGFuZCBnb2VzIGJhY2t3YXJkIHVudGlsCj4gPiA+IGl0IHJlYWNoZXMg
dGhlIGZpcnN0IGJyaWRnZSAodGhlIGR1bW15IGVuY29kZXIgYnJpZGdlKS4gQSBidXMgZm9ybWF0
Cj4gPiA+IHNldHRpbmcgaXMgdmFsaWRhdGVkIHdoZW4gYWxsIC0+Z2V0X2lucHV0X2J1c19mbXRz
KCkgaG9va3MgcmV0dXJuZWQgYXQKPiA+ID4gbGVhc3Qgb25lIHBvc3NpYmxlIGZvcm1hdCAoKm51
bV9pbnB1dF9mb3JtYXRzID4gMCkgZm9yIHRoZSBvdXRwdXQgZm9ybWF0Cj4gPiA+IGJlaW5nIHRl
c3RlZCBieSB0aGUgbmV4dCBlbGVtZW50IGluIHRoZSBjaGFpbi4gQW5kIHRoYXQncyB3aHkgZXZl
biB0aGUKPiA+ID4gZHVtbXkgZW5jb2RlciBicmlkZ2UgaGFzIHRvIGltcGxlbWVudCB0aGlzIGhv
b2sgdW5sZXNzIGl0IG9ubHkgc3VwcG9ydHMKPiA+ID4gb25lIG91dHB1dCBmb3JtYXQgKHRoZSBj
b3JlIHJldHVybnMgTUVESUFfQlVTX0ZNVF9GSVhFRCB3aGVuICAKPiA+ID4gLT5nZXRfaW5wdXRf
YnVzX2ZtdHMgaXMgTlVMTCkuICAKPiA+IAo+ID4gVGhpcyBmdW5jdGlvbiAoY3VycmVudGx5KSBh
bHNvIG9ubHkgcmV0dXJucyBNRURJQV9CVVNfRk1UX0ZJWEVELCBzbwo+ID4gdGhlcmUgaXMgbm8g
ZGlmZmVyZW5jZSBpbiByZXR1cm4gdmFsdWUgKGlmIHF1ZXJpZWQgd2l0aCBhIHN1cHBvcnRlZAo+
ID4gb3V0cHV0X2ZtdCkuCj4gCj4gVGhlcmUncyBhIHNtYWxsIGRpZmZlcmVuY2UgYWN0dWFsbHk6
IHdoZW4gb3V0cHV0X2ZtdCAhPQo+IE1FRElBX0JVU19GTVRfRklYRUQsIHdlIG1ha2Ugc3VyZSBv
dXRwdXRfZm10IGlzIHNvbWV0aGluZyB3ZSBzdXBwb3J0LiBJZgo+IHlvdSBkb24ndCBpbXBsZW1l
bnQgLT5nZXRfaW5wdXRfYnVzX2ZtdHMoKSB5b3UnbGwganVzdCBhY2NlcHQgYW55IGZvcm1hdAo+
IHJlcXVlc3RlZCBieSB0aGUgbmV4dCBlbGVtZW50IGluIHRoZSBwaXBlbGluZS4KCkkgc2VlLiBN
eSB3aG9sZSBwb2ludCB3YXMgcHJlZGljYXRlZCBvbiB0aGUgaW5jb3JyZWN0IGFzc3VtcHRpb24g
dGhhdApnZXRfaW5wdXRfYnVzX2ZtdHMgd291bGQgbm90IGhhdmUgdG8gYmUgZmVkIHVzdXBwb3J0
ZWQgb3V0cHV0X2ZtdHMuCgo+ID4gc2VsZWN0X2J1c19mbXRfcmVjdXJzaXZlIGNvdWxkIGp1c3Qg
Y2hlY2sgYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMgaWYKPiA+IHRoYXQgaXMgaW1wbGVtZW50
ZWQsIGJ1dCBhdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzIGlzbid0Lgo+IAo+IEknZCBsaWtlIHRv
IHVzZSAtPmdldF9vdXRwdXRfYnVzX2ZtdHMoKSBvbmx5IHRvIHJldHJpZXZlIHN1cHBvcnRlZAo+
IG91dHB1dCBmb3JtYXRzIG9uIHRoZSBsYXN0IGJyaWRnZSBlbGVtZW50LCBvdGhlcndpc2UgaXQg
bWFrZXMgdGhlCj4gd2hvbGUgdGhpbmcgZXZlbiBtb3JlIGNvbXBsZXguCgpPaywgSSBzaG91bGQg
aGF2ZSBwYWlkIG1vcmUgYXR0ZW50aW9uIHRvIHRoZSBkb2N1bWVudGF0aW9uIGluIHBhdGNoIDE2
LgoKPiA+IFRoYXQgcG9pbnQgaXMgbW9vdCB0aG91Z2gsIGlmIHdlIHByb3BhZ2F0ZSB0aGUgb3V0
cHV0IGZvcm1hdCB0byB0aGUKPiA+IGlucHV0IGZvcm1hdC4KPiAKPiBJJ2xsIGRvIHRoYXQgdGhl
biAoYW5kIG1hbmRhdGUgdGhhdCBhbGwgZW5jb2RlciBkcml2ZXJzIGRvIHRoZSBzYW1lKS4KClNv
dW5kcyBnb29kLiBBdCBsZWFzdCB0aGVuIHRoZXJlIGFyZW4ndCB0d28gY2xhc3NlcyBvZiBicmlk
Z2VzIHRoYXQKaW1wbGVtZW50IHRoZSBuZWdvdGlhdGlvbiBjYWxsYmFja3MgZGlmZmVyZW50bHku
CgpyZWdhcmRzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
