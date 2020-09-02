Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC825A856
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 11:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B546E155;
	Wed,  2 Sep 2020 09:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606616E155
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 09:09:20 +0000 (UTC)
Date: Wed, 02 Sep 2020 09:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1599037758;
 bh=tWZLjcjpso7hjA2WIHTYXpXERR7Rr72qonBHENyVUic=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=OCtM6on/gZ0ul9beiqs+h6tfxzqMwNoEgh0KOMhiK4wJgFngrAoHuauJBUvPBXfZR
 ssM3+Fp3Hl4kO/KU6fqcc5xI00srJ+T7mYBlW7KPt6coX3GdGPLb7XoKuWotg6liAn
 UWLMEyEo8Rd3g7rl+56KDPfy4auvXuOm9rLI8Av8jNi3V2exqaGNVmdasJjMG0s42j
 vz+NH/qSj4XBMGp6eLJ/6WTNrKjW62+OBXwVw8Z2yyahKMRhV+TsoAJsvIlPBEPCh3
 3HdEXAjZVzWHEZLX91ti8HnEcZJSmOwJ64n4ajA/mHAa2PmFUwd3d+IKIROMUJS5zm
 K+YTYFZMtCjaQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: add support for gamma_set interface
Message-ID: <DtMHF2YzGDmVCCHE0UKH2NdZW1XmY3V3DoP-rvWbpYlFi1s5ncHyqDZd27U6ya_LBm64G73rqYlZMU0rI4IBcdiUaiSvtGDj2WW3bgZGKDc=@emersion.fr>
In-Reply-To: <20200901132656.GD2352366@phenom.ffwll.local>
References: <20200829140647.7626-1-realwakka@gmail.com>
 <UeJwFKvmNgKdZY_icN0-nrFly9R1vbzaMZ-TiyxIIPBcdl278uZsK6YdTTdRl6rFukBAmN-eyCFpnfsIB-El9QpyYiutdcpgJg64n4tsRRc=@emersion.fr>
 <20200831133858.GA9280@realwakka> <20200831134852.GY6112@intel.com>
 <C7EgdPUBX9nRTKx9kkGIZijd0yGMOLEtXOwa2jvk-rKtprmNZKSDP-Jos7mYU88DOQYiXJBnz0_D2FAQ1x7jCwLcR-cmZtzCc5cLsJqyDCk=@emersion.fr>
 <20200901132656.GD2352366@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgU2VwdGVtYmVyIDEsIDIwMjAgMzoyNiBQTSwgRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPiB3cm90ZToKCj4gT24gVHVlLCBTZXAgMDEsIDIwMjAgYXQgMDg6NTc6MzdB
TSArMDAwMCwgU2ltb24gU2VyIHdyb3RlOgo+Cj4gPiBPbiBNb25kYXksIEF1Z3VzdCAzMSwgMjAy
MCAzOjQ4IFBNLCBWaWxsZSBTeXJqw6Rsw6QgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20g
d3JvdGU6Cj4gPgo+ID4gPiA+ID4gSXQgZG9lc24ndCBzZWVtIGxpa2UgdGhpcyBJR1QgdGVzdCdz
IGdvYWwgaXMgdG8gZXhlcmNpc2Ugc3VwcG9ydCBmb3IKPiA+ID4gPiA+IGdhbW1hIExVVHMuIERv
ZXMgdGhlIHRlc3QganVzdCB0cmllcyB0byByZXNldCB0aGUgZ2FtbWEgTFVUIHRvIGxpbmVhcj8K
PiA+ID4gPiA+IElmIHNvLCBJIHRoaW5rIHRoZSBJR1QgdGVzdCBzaG91bGQgYmUgZml4ZWQgdG8g
aWdub3JlICJJIGRvbid0IHN1cHBvcnQKPiA+ID4gPiA+IGdhbW1hIiBlcnJvcnMuCj4gPiA+ID4K
PiA+ID4gPiBJdCBzZWVtcyBsaWtlIHRoYXQgSUdUIHRlc3QgcGl4ZWwtZm9ybWF0IGlzIHRvIG1h
a2UgZ2FtbWEgbHV0IGxpa2UgYmVsb3cuCj4gPiA+ID4gZm9yIChpID0gMDsgaSA8IGx1dF9zaXpl
OyBpKyspCj4gPiA+ID4gbHV0W2ldID0gKGkgKiAweGZmZmYgLyAobHV0X3NpemUgLSAxKSkgJiBt
YXNrOwo+ID4gPiA+IEFuZCBzZXQgdGhpcyB0YWJsZSB0byBkcm0gZHJpdmVyLiBhbmQgdGVzdCBi
ZWdpbnMuIEl0J3MgdGhlIHRlc3QgYWJvdXQgcGl4ZWwKPiA+ID4gPiBmb3JtYXQuIEkgdGhpbmsg
eW91J3JlIHJpZ2h0LiBJdCdzIG5vdCBhYm91dCBnYW1tYSBsdXQuCj4gPiA+Cj4gPiA+IFRoZSBw
b2ludCBvZiB0aGUgZ2FtbWEgTFVUIHN0dWZmIGluIHRoZSBwaXhlbCBmb3JtYXQgdGVzdCBpcyB0
byB0aHJvdwo+ID4gPiBhd2F5IGEgYnVuY2ggb2YgdGhlIGxzYnMgc28gdGhhdCB0aGUgdGVzdCBw
YXNzZXMgd2hlbiB0aGUgcmVzdWx0IGlzCj4gPiA+ICJjbG9zZSBlbm91Z2giIHRvIHRoZSA4YnBj
IFJHQiByZWZlcmVuY2UgaW1hZ2UuIFdpdGhvdXQgaXQgd2Ugd291bGQKPiA+ID4gbmV2ZXIgZ2V0
IGEgY3JjIG1hdGNoIHdoZW4gdGVzdGluZyBub24tOGJwYyBvciBZQ2JDciBmb3JtYXRzLgo+ID4K
PiA+IE9LLCB0aGF0IG1ha2VzIHNlbnNlLiBXb3VsZCBpdCBiZSBzZW5zaWJsZSB0bzoKPiA+Cj4g
PiAtICAgRG9uJ3Qgc2V0IGdhbW1hIGlmIHRoZSBwaXhlbCBmb3JtYXQgYmVpbmcgdGVzdGVkIGlz
IDhicGMKPgo+IEhtIG5vdCBzdXJlIHdoYXQgOGJwYyBmb3JtYXQgeW91IG1lYW4gaGVyZSwgYmVj
YXVzZSB3ZSBoYXZlIEM4IChuZWVkcwo+IGdhbW1hIHRhYmxlIG9yIGRvZXNuJ3Qgd29yaykgYW5k
IHRoZSA4YiBncmV5c2NhbGUgb25lIHdpdGggdGhlIFI4IG9uZS4gSWYKPiB5b3UgYXNrIGZvciBs
ZWdhY3kgOGJwYyB5b3UgZ2V0IEM4LgoKV2h5IGRvIHdlIG5lZWQgYSBnYW1tYSBMVVQgZm9yIEM4
IGFuZCBSOD8gVGhlcmUgc2hvdWxkbid0IGJlIGFueQpwcmVjaXNpb24gbG9zcywgcmlnaHQ/Cgo+
ID4gLSAgIE1ha2UgdGhlIHRlc3Qgc2tpcCBpZiB0aGUgcGl4ZWwgZm9ybWF0IGlzID44YnBjIGFu
ZCBnYW1tYSBpc24ndAo+ID4gICAgIHN1cHBvcnRlZAo+ID4KPgo+IFllYWggdGhlIHRlc3Qgc2hv
dWxkIHNraXAgaWYgZ2FtbWEgaXNuJ3QgdGhlcmUuCj4gLURhbmllbAo+Cj4gPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4g
LS0KPgo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KPiBodHRwOi8vYmxvZy5mZndsbC5jaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
