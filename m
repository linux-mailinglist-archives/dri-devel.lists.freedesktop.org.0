Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0687A16FE7F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0206E8B7;
	Wed, 26 Feb 2020 11:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6306E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:59:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F07ECADFF;
 Wed, 26 Feb 2020 11:59:16 +0000 (UTC)
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
Message-ID: <715efe04-c2f2-48e2-c8e4-009816a8ab69@suse.de>
Date: Wed, 26 Feb 2020 12:59:14 +0100
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

SGkKCkFtIDI2LjAyLjIwIHVtIDEyOjAyIHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiAKPiAKPiDk
uo4gMjAyMOW5tDLmnIgyNuaXpSBHTVQrMDg6MDAg5LiL5Y2INjo1ODo0MywgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IOWGmeWIsDoKPj4gSGkgSWNleW5vdywKPj4KPj4g
VG9yc3RlbiBhc2tlZCBtZSB0byBtZXJnZSB5b3VyIHBhdGNoIHZpYSBkcm0tbWlzYy1uZXh0LiBJ
J2QgYWRkIHRoZQo+PiBhZGRpdGlvbmFsIGNjIGFuZCBmaXhlcyB0YWdzIHRoYXQgVG9yc3RlbiBs
aXN0ZWQuIEFyZSB5b3UgT0sgd2l0aCB0aGF0Pwo+IAo+IEkgdGhpbmsgdGhpcyBmaXhlcyBhIGRy
aXZlciAoYW5kIGEgYm9hcmQpIGF2YWlsYWJsZSBpbiA1LjYuCj4gCj4gTWF5YmUgaXQgc2hvdWxk
IGVudGVyIGZpeGVzPwoKSSB0aGluayB3ZSBjYW4gZG8gdGhhdC4gQW55dGhpbmcgZWxzZT8KCkJl
c3QgcmVnYXJkcwpUaG9tYXMKCj4gCj4+Cj4+IEJlc3QgcmVnYXJkcwo+PiBUaG9tYXMKPj4KPj4g
QW0gMjIuMDIuMjAgdW0gMDM6NDMgc2NocmllYiBJY2Vub3d5IFpoZW5nOgo+Pj4KPj4+Cj4+PiDk
uo4gMjAyMOW5tDLmnIgyMuaXpSBHTVQrMDg6MDAg5LiK5Y2IMToxMzoyOCwgVG9yc3RlbiBEdXdl
IDxkdXdlQGxzdC5kZT4g5YaZ5YiwOgo+Pj4+IE9uIFNhdCwgRmViIDIyLCAyMDIwIGF0IDEyOjUx
OjI3QU0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+Pj4+IEN1cnJlbnQgY29kZSB0cmll
cyB0byBzdG9yZSB0aGUgbGluayByYXRlIChpbiBicHMsIHdoaWNoIGlzIGEgYmlnCj4+Pj4+IG51
bWJlcikgaW4gYSB1OCwgd2hpY2ggc3VyZWx5IG92ZXJmbG93LiBUaGVuIGl0J3MgY29udmVydGVk
IGJhY2sgdG8KPj4+Pj4gYmFuZHdpZHRoIGNvZGUgKHdoaWNoIGlzIHRodXMgMCkgYW5kIHdyaXR0
ZW4gdG8gdGhlIGNoaXAuCj4+Pj4+Cj4+Pj4+IFRoZSBjb2RlIHNvbWV0aW1lcyB3b3JrcyBiZWNh
dXNlIHRoZSBjaGlwIHdpbGwgYXV0b21hdGljYWxseQo+PiBmYWxsYmFjawo+Pj4+IHRvCj4+Pj4+
IHRoZSBsb3dlc3QgcG9zc2libGUgRFAgbGluayByYXRlICgxLjYyR2Jwcykgd2hlbiBnZXQgdGhl
IGludmFsaWQKPj4+PiB2YWx1ZS4KPj4+Pj4gSG93ZXZlciwgb24gdGhlIGVEUCBwYW5lbCBvZiBP
bGltZXggVEVSRVMtSSwgd2hpY2ggd2FudHMgMi43R2Jwcwo+Pj4+IGxpbmssCj4+Pj4+IGl0IGZh
aWxlZC4KPj4+Pj4KPj4+Pj4gQXMgd2UgaGFkIGFscmVhZHkgcmVhZCB0aGUgbGluayBiYW5kd2lk
dGggYXMgYmFuZHdpZHRoIGNvZGUgaW4KPj4+PiBlYXJsaWVyCj4+Pj4+IGNvZGUgKHRvIGNoZWNr
IHdoZXRoZXIgaXQgaXMgc3VwcG9ydGVkKSwgdXNlIGl0IHdoZW4gc2V0dGluZwo+Pj4+IGJhbmR3
aWR0aCwKPj4+Pj4gaW5zdGVhZCBvZiBjb252ZXJ0aW5nIGl0IHRvIGxpbmsgcmF0ZSBhbmQgdGhl
biBjb252ZXJ0aW5nIGJhY2suCj4+Pj4+Cj4+Pj4+IEZpeGVzOiBlMWNmZjgyYzEwOTcgKCJkcm0v
YnJpZGdlOiBmaXggYW54NjM0NSBjb21waWxhdGlvbiBmb3IKPj4gdjUuNSIpCj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPj4+Pj4gLS0tCj4+Pj4+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYyB8IDMg
Ky0tCj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
Cj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FuYWxvZ2l4LWFueDYzNDUuYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbmFsb2dpeC1hbng2MzQ1LmMKPj4+Pj4gaW5kZXggNTZmNTVjNTNhYmZkLi4yZGZhMmZkMmEy
M2IgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXgtYW54NjM0NS5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXgtYW54NjM0NS5jCj4+Pj4+IEBAIC0yMTAsOCArMjEwLDcgQEAgc3RhdGljIGlu
dCBhbng2MzQ1X2RwX2xpbmtfdHJhaW5pbmcoc3RydWN0Cj4+Pj4gYW54NjM0NSAqYW54NjM0NSkK
Pj4+Pj4gIAlpZiAoZXJyKQo+Pj4+PiAgCQlyZXR1cm4gZXJyOwo+Pj4+PiAgCj4+Pj4+IC0JZHBj
ZFswXSA9IGRybV9kcF9tYXhfbGlua19yYXRlKGFueDYzNDUtPmRwY2QpOwo+Pj4+PiAtCWRwY2Rb
MF0gPSBkcm1fZHBfbGlua19yYXRlX3RvX2J3X2NvZGUoZHBjZFswXSk7Cj4+Pj4+ICsJZHBjZFsw
XSA9IGRwX2J3Owo+Pj4+Cj4+Pj4gV2h5IGRvIHlvdSBtYWtlIHRoaXMgYXNzaWdubWVudCBhbmQg
bm90IHVzZSBkcF9idyBkaXJlY3RseSBpbiB0aGUKPj4gY2FsbD8KPj4+Cj4+PiBCZWNhdXNlIHRo
ZSBkcGNkIGFycmF5IGlzIHRoZW4gd3JpdHRlbiBhcyBhIGNvbnRpbm91cyBhcnJheQo+Pj4gYmFj
ayB0byBEUENELgo+Pj4KPj4+Pgo+Pj4+PiAgCWVyciA9IHJlZ21hcF93cml0ZShhbng2MzQ1LT5t
YXBbSTJDX0lEWF9EUFRYXSwKPj4+Pj4gIAkJCSAgIFNQX0RQX01BSU5fTElOS19CV19TRVRfUkVH
LCBkcGNkWzBdKTsKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeXl5eXl4KPj4+Pj4gIAlpZiAoZXJyKQo+Pj4+PiAtLSAKPj4+Pj4gMi4y
NC4xCj4+Pj4KPj4+PiBCVFcsIG15IHZlcnNpb24gaXMgb25seSBhIGJpdCBtb3JlIHZlcmJvc2U6
Cj4+Pj4KPj4+PiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzU0MzQ0
Lwo+Pj4+Cj4+Pj4gCVRvcnN0ZW4KPj4+Cj4gCgotLSAKVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgK
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55CihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykKR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
