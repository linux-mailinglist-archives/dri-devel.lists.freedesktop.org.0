Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBAD112D75
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECCF6E90D;
	Wed,  4 Dec 2019 14:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0436E90D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:30:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 256E520106;
 Wed,  4 Dec 2019 15:30:15 +0100 (CET)
Date: Wed, 4 Dec 2019 15:30:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tilcdc: Switch to using GPIO descriptors
Message-ID: <20191204143014.GB20926@ravnborg.org>
References: <20191203130916.155779-1-linus.walleij@linaro.org>
 <b3e3e44b-3061-7531-4e88-7ee9b44f40a7@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3e3e44b-3061-7531-4e88-7ee9b44f40a7@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=BTXFA4sy8_DcFOhKg4MA:9 a=CjuIK1q_8ugA:10
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
Cc: David Lechner <david@lechnology.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaS4KCk9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDA4OjI5OjQ1UE0gKzAyMDAsIEp5cmkg
U2FyaGEgd3JvdGU6Cj4gT24gMDMvMTIvMjAxOSAxNTowOSwgTGludXMgV2FsbGVpaiB3cm90ZToK
PiA+IFRoZSBUSSBMQ0RDIHBpY2tzIGEgR1BJTyBsaW5lIGZyb20gdGhlIGRldmljZSB0cmVlIHRv
IHVzZQo+ID4gZm9yIERQTVMgcG93ZXIgb24vb2ZmLiBXZSBjYW4gc3dpdGNoIHRoaXMgdG8gdXNl
IGEgR1BJTwo+ID4gZGVzY3JpcHRvciBwcmV0dHkgZWFzaWx5LiBNYWtlIHN1cmUgdG8gcmVxdWVz
dCB0aGUgR1BJTwo+ID4gImFzIGlzIiBzbyB0aGF0IHRoZSBEUE1TIHN0YXRlIHRoYXQgd2Ugc3Rh
cnQgKGJvb3QpIGluIGlzCj4gPiBwcmVzZXJ2ZWQuCj4gPiAKPiAKPiBIbW1tLCBJIGhhdmUgYmVl
biBjb25zaWRlcmluZyBkaXRjaGluZyB0aGlzIGRyaXZlciBhbGwgdG9nZXRoZXIgc2luY2Ugbm8K
PiBtYWlubGluZSBwbGF0Zm9ybSBoYXMgZXZlciB1c2VkIGl0LiBBbHNvLCBpZiBhbnlib2R5IGV2
ZXIgd2FudHMgdG8KPiBjb25uZWN0IHRmcDQxMCB0byB0aWxjZGMsIGhlIHNob3VsZCB1c2UgZHJt
L2JyaWRnZS90aS10ZnA0MTAuYyBpbnN0ZWFkLgo+IAo+IEJ1dCBzaW5jZSB0aGUgcGF0Y2ggaXMg
dGhlcmUsIG1heWJlIEkgc2hvdWxkIHBpY2sgaXQgdXAsIGFuZCByZW1vdmUgdGhlCj4gYnVuZGxl
ZCBkcml2ZXIgbGF0ZXIgYSBiaXQgbGF0ZXIuCgpJTU8gbXVjaCBiZXR0ZXIgdG8ganVzdCBnZXQg
cmlkIG9mIGl0IG5vdyAtIGFzIHRoZXJlIGlzIGFueXdheSBubyB1c2Vycy4KTm8gcmVhc29uIHRv
IHBhdGNoIGNvZGUgdGhhdCBpcyBlc3NlbnRpYWwgZGVhZC4KWW91IGp1c3QgcG9zdHBvbmUgdGhl
IHRhc2sgZm9yIG5vIGdhaW4uCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
