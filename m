Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C2A6B51
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 16:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A97894DD;
	Tue,  3 Sep 2019 14:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0BF894DD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 14:24:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-148-17-nat.elisa-mobile.fi
 [85.76.148.17])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45248542;
 Tue,  3 Sep 2019 16:24:12 +0200 (CEST)
Date: Tue, 3 Sep 2019 17:23:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/7] drm/omap: tweak HDMI DDC timings
Message-ID: <20190903142353.GE4812@pendragon.ideasonboard.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902125359.18001-3-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567520654;
 bh=AsNy7k7EIOpqpuP/Tytu4rDhp510d/6LGBmL09H/BHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OkfK744lI4efan37Hvgx2fxeZcTrGPCsrqSHrASv34QrpKOEarMd0gDNU+B4ePPox
 db/G0EtL/svArk0lfGMDaUeCPOv3slQPYdqN2WDNeOKtomJuxJZiXfH4KmpWTyd9Nm
 nDVyvda8DkIkIpcWFKv6QjnksMDaFT7aUeac1xDA=
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
Cc: Alejandro Hernandez <ajhernandez@ti.com>, Jyri Sarha <jsarha@ti.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGguCgpPbiBNb24sIFNlcCAwMiwgMjAxOSBh
dCAwMzo1Mzo1NFBNICswMzAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBGcm9tOiBBbGVqYW5k
cm8gSGVybmFuZGV6IDxhamhlcm5hbmRlekB0aS5jb20+Cj4gCj4gQSAiSERNSSBJMkMgTWFzdGVy
IEVycm9yIiBpcyBzb21ldGltZXMgcmVwb3J0ZWQgd2l0aCB0aGUgY3VycmVudCBEREMgU0NMCj4g
dGltaW5ncy4gVGhlIGN1cnJlbnQgc2V0dGluZ3MgZm9yIGEgMTB1cyBTQ0wgcGVyaW9kICgxMDAg
S0h6KSBjYXVzZXMgdGhlCj4gZXJyb3Igd2l0aCBzb21lIGRpc3BsYXlzLiAgVGhpcyBwYXRjaCBp
bmNyZWFzZXMgdGhlIFNDTCBzaWduYWwgcGVyaW9kCj4gZnJvbSAxMHVzIHRvIDEwLjJ1cywgd2l0
aCB0aGUgbmV3IHNldHRpbmdzIHRoZSBlcnJvciBpcyBub3Qgb2JzZXJ2ZWQKPiAKCkl0IHdvdWxk
IGJlIHVzZWZ1bCB0byBkb2N1bWVudCB3aGF0IHRob3NlICJzb21lIGRpc3BsYXlzIiBhcmUgaWYg
eW91CmNhbi4KCkFja2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IEFsZWphbmRybyBIZXJuYW5kZXogPGFq
aGVybmFuZGV6QHRpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRt
aTVfY29yZS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rz
cy9oZG1pNV9jb3JlLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5j
Cj4gaW5kZXggNzQwMGZiOTlkNDUzLi40YzU4OGVjNzYzNGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1X2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3JlLmMKPiBAQCAtMzksOCArMzksOCBAQCBzdGF0aWMgdm9p
ZCBoZG1pX2NvcmVfZGRjX2luaXQoc3RydWN0IGhkbWlfY29yZV9kYXRhICpjb3JlKQo+ICB7Cj4g
IAl2b2lkIF9faW9tZW0gKmJhc2UgPSBjb3JlLT5iYXNlOwo+ICAJY29uc3QgdW5zaWduZWQgbG9u
ZyBsb25nIGljbGsgPSAyNjYwMDAwMDA7CS8qIERTUyBMMyBJQ0xLICovCj4gLQljb25zdCB1bnNp
Z25lZCBpbnQgc3Nfc2NsX2hpZ2ggPSA0NjAwOwkJLyogbnMgKi8KPiAtCWNvbnN0IHVuc2lnbmVk
IGludCBzc19zY2xfbG93ID0gNTQwMDsJCS8qIG5zICovCj4gKwljb25zdCB1bnNpZ25lZCBpbnQg
c3Nfc2NsX2hpZ2ggPSA0NzAwOwkJLyogbnMgKi8KPiArCWNvbnN0IHVuc2lnbmVkIGludCBzc19z
Y2xfbG93ID0gNTUwMDsJCS8qIG5zICovCj4gIAljb25zdCB1bnNpZ25lZCBpbnQgZnNfc2NsX2hp
Z2ggPSA2MDA7CQkvKiBucyAqLwo+ICAJY29uc3QgdW5zaWduZWQgaW50IGZzX3NjbF9sb3cgPSAx
MzAwOwkJLyogbnMgKi8KPiAgCWNvbnN0IHVuc2lnbmVkIGludCBzZGFfaG9sZCA9IDEwMDA7CQkv
KiBucyAqLwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
