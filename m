Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B2B3100
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 18:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231876E09C;
	Sun, 15 Sep 2019 16:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Sun, 15 Sep 2019 16:58:17 UTC
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9B6E09C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 16:58:17 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 4AC6381DD1; Sun, 15 Sep 2019 18:51:59 +0200 (CEST)
Date: Sun, 15 Sep 2019 18:52:04 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190915165204.GA4857@bug>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-2-andreas@kemnade.info>
 <20190909105729.w5552rtop7rhghy2@holly.lan>
 <20190909221349.46ca5a1f@aktux>
 <20190910102156.vmprsjebmlphkv34@holly.lan>
 <20190910210648.3594912d@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910210648.3594912d@kemnade.info>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, linux-fbdev@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgo+ID4gPiA+IElzIHRoaXMgbmVlZGVkPwo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgYSBy
ZW1vdmUgcGF0aCwgbm90IGEgcG93ZXIgbWFuYWdlbWVudCBwYXRoLCBhbmQgd2UgaGF2ZSBubyBp
ZGVhCj4gPiA+ID4gd2hhdCB0aGUgb3JpZ2luYWwgc3RhdHVzIG9mIHRoZSBwaW4gd2FzIGFueXdh
eT8KPiA+ID4gPiAgIAo+ID4gPiAKPiA+ID4gTG9va2luZyBhdCBJc2hkbiBvbiBwYWdlIDUgb2Yg
dGhlIGRhdGFzaGVldCwgc3dpdGNoaW5nIGl0IG9mZiBldmVyeXRpbWUKPiA+ID4gcG9zc2libGUg
c2VlbXMgbm90IG5lZWRlZC4gV2Ugd291bGQgbmVlZCB0byBjYWxsIGNoaXBfaW5pdCgpIGV2ZXJ5
dGltZQo+ID4gPiB3ZSBlbmFibGUgdGhlIGdwaW8gb3IgbGl2ZSB3aXRoIGRlZmF1bHQgdmFsdWVz
Lgo+ID4gPiBUaGVyZWZvcmUgSSBkaWQgZGVjaWRlIHRvIG5vdCBwdXQgaXQgaW50byBhbnkgcG93
ZXIgbWFuYWdlbWVudCBwYXRoLgo+ID4gPiBCdXQgc3dpdGNoaW5nIGl0IG9uIGFuZCBub3Qgc3dp
dGNoaW5nIGl0IG9mZiBmZWVscyBzbyB1bmJhbGFuY2VkLiAgIAo+ID4gCj4gPiBFaXRoZXIgdGhl
IHBvd2VyIGNvbnN1bWVkIGJ5IHRoZSBjb250cm9sbGVyIHdoZW4gc3RyaW5ncyBhcmVuJ3QgbGl0
IHVwCj4gPiBtYXR0ZXJzLCBpbiB3aGljaCBjYXNlIHRoZSBkcml2ZXIgc2hvdWxkIGltcGxlbWVu
dCBwcm9wZXIgcG93ZXIKPiA+IG1hbmFnZW1lbnQgb3IgaXQgZG9lc24ndCBtYXR0ZXIgYW5kIGNo
YW5naW5nIHRoZSBwaW4gc3RhdGUgaXNuJ3QgbmVlZGVkLgo+ID4gCj4gPiBJJ20gaGFwcHkgd2l0
aCBlaXRoZXIgb2YgdGhlIGFib3ZlIGJ1dCB0aGlzIGxvb2tzIGxpa2UgYSB0aGlyZCB3YXksCj4g
PiB3aGVyZSBlYWdlciB1c2VycyBjb3VsZCBoYWNrIGluIGEgYml0IG9mIGV4dHJhIHBvd2VyIG1h
bmFnZW1lbnQgYnkKPiA+IGZvcmNpbmcgZHJpdmVycyB0byB1bmJpbmQuIAo+ID4gCj4gSSB0aGlu
ayBJIHdpbGwgdGFrZSB0aGUgc2ltcGxlIHdheS4gSSBhbSBxdWl0ZSBzdXJlIHRoYXQgdGhlIHBv
d2VyCj4gY29uc3VtcHRpb24gd2l0aCBIV0VOIG9uIGFuZCBsZWRzIG9mZiBkb2VzIG5vdCBtYXR0
ZXIuIElmIHNvbWVvbmUKPiBsYXRlciBjb21lcyB1cCBhbmQgZmluZHMgb3V0IHRoYXQgSSBtaXNy
ZWFkIHRoZSBkYXRhc2hlZXQsIHRoaW5ncwo+IGFyZSBwcmVwYXJlZCB0byBiZSBpbXByb3ZlZC4K
CkR1bm5vLi4gaWYgdGhlIHBvd2VyIGNvbnN1bXB0aW9uIGRvZXMgbm90IG1hdHRlciwgd2h5IGRv
ZXMgdGhlIGNoaXAgaGF2ZSB0aGUgZW5hYmxlCnBpbiBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCB3
aHkgZG8gd2UgYm90aGVyIHN1cHBvcnRpbmcgaXQ/IFdlIGNvdWxkIGhhcmRjb2RlIHRoZQpwaW4g
dG8gZW5hYmxlZCBhcyB3ZWxsLi4KCQkJCQkJCQkJUGF2ZWwKCgotLSAKKGVuZ2xpc2gpIGh0dHA6
Ly93d3cubGl2ZWpvdXJuYWwuY29tL35wYXZlbG1hY2hlawooY2Vza3ksIHBpY3R1cmVzKSBodHRw
Oi8vYXRyZXkua2FybGluLm1mZi5jdW5pLmN6L35wYXZlbC9waWN0dXJlL2hvcnNlcy9ibG9nLmh0
bWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
