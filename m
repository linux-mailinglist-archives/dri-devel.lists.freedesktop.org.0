Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59C171615
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 12:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F696E838;
	Thu, 27 Feb 2020 11:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4946E838
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 11:34:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78822AD14;
 Thu, 27 Feb 2020 11:34:16 +0000 (UTC)
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: fix set of link bandwidth
To: Icenowy Zheng <icenowy@aosc.io>, Torsten Duwe <duwe@lst.de>
References: <20200221165127.813325-1-icenowy@aosc.io>
 <20200221171328.GC6928@lst.de> <1E7BDB0F-639B-42BB-A4B4-A4C8CF94EBE0@aosc.io>
 <f4109d23-4591-1c52-2822-0a2ba358fe1f@suse.de>
 <07EED5EC-28C6-473D-B672-509F5C770479@aosc.io>
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
Message-ID: <08f290ef-7dd0-c8b9-0177-3248fb153eca@suse.de>
Date: Thu, 27 Feb 2020 12:34:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <07EED5EC-28C6-473D-B672-509F5C770479@aosc.io>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDI2LjAyLjIwIHVtIDEyOjAyIHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiAKPiAKPiDk
uo4gMjAyMOW5tDLmnIgyNuaXpSBHTVQrMDg6MDAg5LiL5Y2INjo1ODo0MywgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IOWGmeWIsDoKPj4gSGkgSWNleW5vdywKPj4KPj4g
VG9yc3RlbiBhc2tlZCBtZSB0byBtZXJnZSB5b3VyIHBhdGNoIHZpYSBkcm0tbWlzYy1uZXh0LiBJ
J2QgYWRkIHRoZQo+PiBhZGRpdGlvbmFsIGNjIGFuZCBmaXhlcyB0YWdzIHRoYXQgVG9yc3RlbiBs
aXN0ZWQuIEFyZSB5b3UgT0sgd2l0aCB0aGF0Pwo+IAo+IEkgdGhpbmsgdGhpcyBmaXhlcyBhIGRy
aXZlciAoYW5kIGEgYm9hcmQpIGF2YWlsYWJsZSBpbiA1LjYuCj4gCj4gTWF5YmUgaXQgc2hvdWxk
IGVudGVyIGZpeGVzPwoKUHVzaGVkIHRvIGRybS1taXNjLWZpeGVzCgpCZXN0IHJlZ2FyZHMKVGhv
bWFzCgo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVGhvbWFzCj4+Cj4+IEFtIDIyLjAyLjIwIHVt
IDAzOjQzIHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPj4+Cj4+Pgo+Pj4g5LqOIDIwMjDlubQy5pyI
MjLml6UgR01UKzA4OjAwIOS4iuWNiDE6MTM6MjgsIFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBsc3QuZGU+
IOWGmeWIsDoKPj4+PiBPbiBTYXQsIEZlYiAyMiwgMjAyMCBhdCAxMjo1MToyN0FNICswODAwLCBJ
Y2Vub3d5IFpoZW5nIHdyb3RlOgo+Pj4+PiBDdXJyZW50IGNvZGUgdHJpZXMgdG8gc3RvcmUgdGhl
IGxpbmsgcmF0ZSAoaW4gYnBzLCB3aGljaCBpcyBhIGJpZwo+Pj4+PiBudW1iZXIpIGluIGEgdTgs
IHdoaWNoIHN1cmVseSBvdmVyZmxvdy4gVGhlbiBpdCdzIGNvbnZlcnRlZCBiYWNrIHRvCj4+Pj4+
IGJhbmR3aWR0aCBjb2RlICh3aGljaCBpcyB0aHVzIDApIGFuZCB3cml0dGVuIHRvIHRoZSBjaGlw
Lgo+Pj4+Pgo+Pj4+PiBUaGUgY29kZSBzb21ldGltZXMgd29ya3MgYmVjYXVzZSB0aGUgY2hpcCB3
aWxsIGF1dG9tYXRpY2FsbHkKPj4gZmFsbGJhY2sKPj4+PiB0bwo+Pj4+PiB0aGUgbG93ZXN0IHBv
c3NpYmxlIERQIGxpbmsgcmF0ZSAoMS42MkdicHMpIHdoZW4gZ2V0IHRoZSBpbnZhbGlkCj4+Pj4g
dmFsdWUuCj4+Pj4+IEhvd2V2ZXIsIG9uIHRoZSBlRFAgcGFuZWwgb2YgT2xpbWV4IFRFUkVTLUks
IHdoaWNoIHdhbnRzIDIuN0dicHMKPj4+PiBsaW5rLAo+Pj4+PiBpdCBmYWlsZWQuCj4+Pj4+Cj4+
Pj4+IEFzIHdlIGhhZCBhbHJlYWR5IHJlYWQgdGhlIGxpbmsgYmFuZHdpZHRoIGFzIGJhbmR3aWR0
aCBjb2RlIGluCj4+Pj4gZWFybGllcgo+Pj4+PiBjb2RlICh0byBjaGVjayB3aGV0aGVyIGl0IGlz
IHN1cHBvcnRlZCksIHVzZSBpdCB3aGVuIHNldHRpbmcKPj4+PiBiYW5kd2lkdGgsCj4+Pj4+IGlu
c3RlYWQgb2YgY29udmVydGluZyBpdCB0byBsaW5rIHJhdGUgYW5kIHRoZW4gY29udmVydGluZyBi
YWNrLgo+Pj4+Pgo+Pj4+PiBGaXhlczogZTFjZmY4MmMxMDk3ICgiZHJtL2JyaWRnZTogZml4IGFu
eDYzNDUgY29tcGlsYXRpb24gZm9yCj4+IHY1LjUiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vu
b3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4+Pj4+IC0tLQo+Pj4+PiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgfCAzICstLQo+Pj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2
MzQ1LmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54
NjM0NS5jCj4+Pj4+IGluZGV4IDU2ZjU1YzUzYWJmZC4uMmRmYTJmZDJhMjNiIDEwMDY0NAo+Pj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUu
Ywo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFu
eDYzNDUuYwo+Pj4+PiBAQCAtMjEwLDggKzIxMCw3IEBAIHN0YXRpYyBpbnQgYW54NjM0NV9kcF9s
aW5rX3RyYWluaW5nKHN0cnVjdAo+Pj4+IGFueDYzNDUgKmFueDYzNDUpCj4+Pj4+ICAJaWYgKGVy
cikKPj4+Pj4gIAkJcmV0dXJuIGVycjsKPj4+Pj4gIAo+Pj4+PiAtCWRwY2RbMF0gPSBkcm1fZHBf
bWF4X2xpbmtfcmF0ZShhbng2MzQ1LT5kcGNkKTsKPj4+Pj4gLQlkcGNkWzBdID0gZHJtX2RwX2xp
bmtfcmF0ZV90b19id19jb2RlKGRwY2RbMF0pOwo+Pj4+PiArCWRwY2RbMF0gPSBkcF9idzsKPj4+
Pgo+Pj4+IFdoeSBkbyB5b3UgbWFrZSB0aGlzIGFzc2lnbm1lbnQgYW5kIG5vdCB1c2UgZHBfYncg
ZGlyZWN0bHkgaW4gdGhlCj4+IGNhbGw/Cj4+Pgo+Pj4gQmVjYXVzZSB0aGUgZHBjZCBhcnJheSBp
cyB0aGVuIHdyaXR0ZW4gYXMgYSBjb250aW5vdXMgYXJyYXkKPj4+IGJhY2sgdG8gRFBDRC4KPj4+
Cj4+Pj4KPj4+Pj4gIAllcnIgPSByZWdtYXBfd3JpdGUoYW54NjM0NS0+bWFwW0kyQ19JRFhfRFBU
WF0sCj4+Pj4+ICAJCQkgICBTUF9EUF9NQUlOX0xJTktfQldfU0VUX1JFRywgZHBjZFswXSk7Cj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xl5eXl5eCj4+Pj4+ICAJaWYgKGVycikKPj4+Pj4gLS0gCj4+Pj4+IDIuMjQuMQo+Pj4+Cj4+Pj4g
QlRXLCBteSB2ZXJzaW9uIGlzIG9ubHkgYSBiaXQgbW9yZSB2ZXJib3NlOgo+Pj4+Cj4+Pj4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzM1NDM0NC8KPj4+Pgo+Pj4+IAlU
b3JzdGVuCj4+Pgo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdlc2No
w6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
