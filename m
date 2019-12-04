Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D322A112AE8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 13:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5C76E8D9;
	Wed,  4 Dec 2019 12:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F068B6E89F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 12:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 0BFEDFB04;
 Wed,  4 Dec 2019 13:04:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1P6AeK0vdY6H; Wed,  4 Dec 2019 13:04:16 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4AAF84964C; Wed,  4 Dec 2019 13:04:16 +0100 (CET)
Date: Wed, 4 Dec 2019 13:04:16 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 18/26] drm/panel: rocktech-jh057n00900: use drm_panel
 backlight support
Message-ID: <20191204120416.GA18094@bogon.m.sigxcpu.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-19-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-19-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIE1vbiwgRGVjIDAyLCAyMDE5IGF0IDA4OjMyOjIyUE0gKzAxMDAsIFNhbSBSYXZuYm9y
ZyB3cm90ZToKPiBVc2UgdGhlIGJhY2tsaWdodCBzdXBwb3J0IGluIGRybV9wYW5lbCB0byBzaW1w
bGlmeSB0aGUgZHJpdmVyLgo+IFdoaWxlIHRvdWNoaW5nIHRoZSBpbmNsdWRlIGZpbGVzIHNvcnQg
dGhlbQo+IGFuZCBkaXZpZGUgdGhlbSB1cCBpbiBibG9ja3MuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiAiR3VpZG8gR8O8bnRoZXIiIDxh
Z3hAc2lneGNwdS5vcmc+Cj4gQ2M6IFB1cmlzbSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1cmkuc20+
Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPiAgLi4uL2RybS9wYW5lbC9wYW5l
bC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jICAgIHwgMjQgKysrKysrKysrLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkw
MC5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMK
PiBpbmRleCAzYTRmMWMwZmNlODYuLjM4ZmY3NDJiYzEyMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCj4gQEAgLTUsMjAg
KzUsMjIgQEAKPiAgICogQ29weXJpZ2h0IChDKSBQdXJpc20gU1BDIDIwMTkKPiAgICovCj4gIAo+
IC0jaW5jbHVkZSA8ZHJtL2RybV9taXBpX2RzaS5oPgo+IC0jaW5jbHVkZSA8ZHJtL2RybV9tb2Rl
cy5oPgo+IC0jaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgo+IC0jaW5jbHVkZSA8ZHJtL2RybV9w
cmludC5oPgo+IC0jaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9kZWJ1Z2ZzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvZ3Bpby9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvbWVkaWEtYnVzLWZvcm1hdC5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgo+ICsK
PiAgI2luY2x1ZGUgPHZpZGVvL2Rpc3BsYXlfdGltaW5nLmg+Cj4gICNpbmNsdWRlIDx2aWRlby9t
aXBpX2Rpc3BsYXkuaD4KPiAgCj4gKyNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Cj4gKyNp
bmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+Cj4g
KyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gKwo+ICAjZGVmaW5lIERSVl9OQU1FICJwYW5l
bC1yb2NrdGVjaC1qaDA1N24wMDkwMCIKPiAgCj4gIC8qIE1hbnVmYWN0dXJlciBzcGVjaWZpYyBD
b21tYW5kcyBzZW5kIHZpYSBEU0kgKi8KPiBAQCAtNDcsNyArNDksNiBAQCBzdHJ1Y3QgamgwNTdu
IHsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiAgCXN0cnVjdCBkcm1fcGFuZWwgcGFuZWw7Cj4g
IAlzdHJ1Y3QgZ3Bpb19kZXNjICpyZXNldF9ncGlvOwo+IC0Jc3RydWN0IGJhY2tsaWdodF9kZXZp
Y2UgKmJhY2tsaWdodDsKPiAgCXN0cnVjdCByZWd1bGF0b3IgKnZjYzsKPiAgCXN0cnVjdCByZWd1
bGF0b3IgKmlvdmNjOwo+ICAJYm9vbCBwcmVwYXJlZDsKPiBAQCAtMTUyLDcgKzE1Myw3IEBAIHN0
YXRpYyBpbnQgamgwNTduX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAgCQlyZXR1
cm4gcmV0Owo+ICAJfQo+ICAKPiAtCXJldHVybiBiYWNrbGlnaHRfZW5hYmxlKGN0eC0+YmFja2xp
Z2h0KTsKPiArCXJldHVybiAwOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IGpoMDU3bl9kaXNhYmxl
KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+IEBAIC0xNjAsNyArMTYxLDYgQEAgc3RhdGljIGlu
dCBqaDA1N25fZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAgCXN0cnVjdCBqaDA1
N24gKmN0eCA9IHBhbmVsX3RvX2poMDU3bihwYW5lbCk7Cj4gIAlzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2kgPSB0b19taXBpX2RzaV9kZXZpY2UoY3R4LT5kZXYpOwo+ICAKPiAtCWJhY2tsaWdo
dF9kaXNhYmxlKGN0eC0+YmFja2xpZ2h0KTsKPiAgCXJldHVybiBtaXBpX2RzaV9kY3Nfc2V0X2Rp
c3BsYXlfb2ZmKGRzaSk7Cj4gIH0KPiAgCj4gQEAgLTMyMSwxMCArMzIxLDYgQEAgc3RhdGljIGlu
dCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQo+ICAJZHNpLT5tb2Rl
X2ZsYWdzID0gTUlQSV9EU0lfTU9ERV9WSURFTyB8Cj4gIAkJTUlQSV9EU0lfTU9ERV9WSURFT19C
VVJTVCB8IE1JUElfRFNJX01PREVfVklERU9fU1lOQ19QVUxTRTsKPiAgCj4gLQljdHgtPmJhY2ts
aWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoZGV2KTsKPiAtCWlmIChJU19FUlIoY3R4LT5i
YWNrbGlnaHQpKQo+IC0JCXJldHVybiBQVFJfRVJSKGN0eC0+YmFja2xpZ2h0KTsKPiAtCj4gIAlj
dHgtPnZjYyA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJ2Y2MiKTsKPiAgCWlmIChJU19FUlIo
Y3R4LT52Y2MpKSB7Cj4gIAkJcmV0ID0gUFRSX0VSUihjdHgtPnZjYyk7Cj4gQEAgLTM0Nyw2ICsz
NDMsMTAgQEAgc3RhdGljIGludCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAq
ZHNpKQo+ICAJZHJtX3BhbmVsX2luaXQoJmN0eC0+cGFuZWwsIGRldiwgJmpoMDU3bl9kcm1fZnVu
Y3MsCj4gIAkJICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwo+ICAKPiArCXJldCA9IGRy
bV9wYW5lbF9vZl9iYWNrbGlnaHQoJmN0eC0+cGFuZWwpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1
cm4gcmV0Owo+ICsKPiAgCWRybV9wYW5lbF9hZGQoJmN0eC0+cGFuZWwpOwo+ICAKPiAgCXJldCA9
IG1pcGlfZHNpX2F0dGFjaChkc2kpOwoKUmV2aWV3ZWQtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hA
c2lneGNwdS5vcmc+IAoKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
