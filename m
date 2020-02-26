Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B810D16FCCD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 11:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271406E255;
	Wed, 26 Feb 2020 10:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07AF6E255
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:58:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5F35AD8E;
 Wed, 26 Feb 2020 10:58:44 +0000 (UTC)
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: fix set of link bandwidth
To: Icenowy Zheng <icenowy@aosc.io>, Torsten Duwe <duwe@lst.de>
References: <20200221165127.813325-1-icenowy@aosc.io>
 <20200221171328.GC6928@lst.de> <1E7BDB0F-639B-42BB-A4B4-A4C8CF94EBE0@aosc.io>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <f4109d23-4591-1c52-2822-0a2ba358fe1f@suse.de>
Date: Wed, 26 Feb 2020 11:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1E7BDB0F-639B-42BB-A4B4-A4C8CF94EBE0@aosc.io>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSWNleW5vdywKClRvcnN0ZW4gYXNrZWQgbWUgdG8gbWVyZ2UgeW91ciBwYXRjaCB2aWEgZHJt
LW1pc2MtbmV4dC4gSSdkIGFkZCB0aGUKYWRkaXRpb25hbCBjYyBhbmQgZml4ZXMgdGFncyB0aGF0
IFRvcnN0ZW4gbGlzdGVkLiBBcmUgeW91IE9LIHdpdGggdGhhdD8KCkJlc3QgcmVnYXJkcwpUaG9t
YXMKCkFtIDIyLjAyLjIwIHVtIDAzOjQzIHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiAKPiAKPiDk
uo4gMjAyMOW5tDLmnIgyMuaXpSBHTVQrMDg6MDAg5LiK5Y2IMToxMzoyOCwgVG9yc3RlbiBEdXdl
IDxkdXdlQGxzdC5kZT4g5YaZ5YiwOgo+PiBPbiBTYXQsIEZlYiAyMiwgMjAyMCBhdCAxMjo1MToy
N0FNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+Pj4gQ3VycmVudCBjb2RlIHRyaWVzIHRv
IHN0b3JlIHRoZSBsaW5rIHJhdGUgKGluIGJwcywgd2hpY2ggaXMgYSBiaWcKPj4+IG51bWJlcikg
aW4gYSB1OCwgd2hpY2ggc3VyZWx5IG92ZXJmbG93LiBUaGVuIGl0J3MgY29udmVydGVkIGJhY2sg
dG8KPj4+IGJhbmR3aWR0aCBjb2RlICh3aGljaCBpcyB0aHVzIDApIGFuZCB3cml0dGVuIHRvIHRo
ZSBjaGlwLgo+Pj4KPj4+IFRoZSBjb2RlIHNvbWV0aW1lcyB3b3JrcyBiZWNhdXNlIHRoZSBjaGlw
IHdpbGwgYXV0b21hdGljYWxseSBmYWxsYmFjawo+PiB0bwo+Pj4gdGhlIGxvd2VzdCBwb3NzaWJs
ZSBEUCBsaW5rIHJhdGUgKDEuNjJHYnBzKSB3aGVuIGdldCB0aGUgaW52YWxpZAo+PiB2YWx1ZS4K
Pj4+IEhvd2V2ZXIsIG9uIHRoZSBlRFAgcGFuZWwgb2YgT2xpbWV4IFRFUkVTLUksIHdoaWNoIHdh
bnRzIDIuN0dicHMKPj4gbGluaywKPj4+IGl0IGZhaWxlZC4KPj4+Cj4+PiBBcyB3ZSBoYWQgYWxy
ZWFkeSByZWFkIHRoZSBsaW5rIGJhbmR3aWR0aCBhcyBiYW5kd2lkdGggY29kZSBpbgo+PiBlYXJs
aWVyCj4+PiBjb2RlICh0byBjaGVjayB3aGV0aGVyIGl0IGlzIHN1cHBvcnRlZCksIHVzZSBpdCB3
aGVuIHNldHRpbmcKPj4gYmFuZHdpZHRoLAo+Pj4gaW5zdGVhZCBvZiBjb252ZXJ0aW5nIGl0IHRv
IGxpbmsgcmF0ZSBhbmQgdGhlbiBjb252ZXJ0aW5nIGJhY2suCj4+Pgo+Pj4gRml4ZXM6IGUxY2Zm
ODJjMTA5NyAoImRybS9icmlkZ2U6IGZpeCBhbng2MzQ1IGNvbXBpbGF0aW9uIGZvciB2NS41IikK
Pj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPj4+IC0t
LQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5j
IHwgMyArLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgv
YW5hbG9naXgtYW54NjM0NS5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeC1hbng2MzQ1LmMKPj4+IGluZGV4IDU2ZjU1YzUzYWJmZC4uMmRmYTJmZDJhMjNiIDEw
MDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1h
bng2MzQ1LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXgtYW54NjM0NS5jCj4+PiBAQCAtMjEwLDggKzIxMCw3IEBAIHN0YXRpYyBpbnQgYW54NjM0NV9k
cF9saW5rX3RyYWluaW5nKHN0cnVjdAo+PiBhbng2MzQ1ICphbng2MzQ1KQo+Pj4gIAlpZiAoZXJy
KQo+Pj4gIAkJcmV0dXJuIGVycjsKPj4+ICAKPj4+IC0JZHBjZFswXSA9IGRybV9kcF9tYXhfbGlu
a19yYXRlKGFueDYzNDUtPmRwY2QpOwo+Pj4gLQlkcGNkWzBdID0gZHJtX2RwX2xpbmtfcmF0ZV90
b19id19jb2RlKGRwY2RbMF0pOwo+Pj4gKwlkcGNkWzBdID0gZHBfYnc7Cj4+Cj4+IFdoeSBkbyB5
b3UgbWFrZSB0aGlzIGFzc2lnbm1lbnQgYW5kIG5vdCB1c2UgZHBfYncgZGlyZWN0bHkgaW4gdGhl
IGNhbGw/Cj4gCj4gQmVjYXVzZSB0aGUgZHBjZCBhcnJheSBpcyB0aGVuIHdyaXR0ZW4gYXMgYSBj
b250aW5vdXMgYXJyYXkKPiBiYWNrIHRvIERQQ0QuCj4gCj4+Cj4+PiAgCWVyciA9IHJlZ21hcF93
cml0ZShhbng2MzQ1LT5tYXBbSTJDX0lEWF9EUFRYXSwKPj4+ICAJCQkgICBTUF9EUF9NQUlOX0xJ
TktfQldfU0VUX1JFRywgZHBjZFswXSk7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXgo+Pj4gIAlpZiAoZXJyKQo+Pj4gLS0gCj4+
PiAyLjI0LjEKPj4KPj4gQlRXLCBteSB2ZXJzaW9uIGlzIG9ubHkgYSBiaXQgbW9yZSB2ZXJib3Nl
Ogo+Pgo+PiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzU0MzQ0Lwo+
Pgo+PiAJVG9yc3Rlbgo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
