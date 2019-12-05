Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB3114173
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896A6F56F;
	Thu,  5 Dec 2019 13:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068916F5A9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:30:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60B6D2E5;
 Thu,  5 Dec 2019 14:30:04 +0100 (CET)
Date: Thu, 5 Dec 2019 15:29:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 03/28] drm/bridge/analogix: Use drm_bridge_init()
Message-ID: <20191205132957.GB16034@pendragon.ideasonboard.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-4-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204114732.28514-4-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575552604;
 bh=WvmzgvQByzYsM1PR+dhoUGTk69sy/jPs0F82Ylk9tFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LP3ZQoW5e2pdJFBg995C8H+bC3rWIt1JndR3xEoBd5rjwbYW2iCfdWkehafbXh0v4
 FSR/3dSPc84kkI7Ynpe9Dm5Ch5R37vIFCCT2eE3hjdMGveT5c8bN5P8Kzwf1bygwyH
 4AiM9shFSX7G9WjSWT2reW7Xwps1hkv7Cy4X0+rY=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, nd <nd@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Maxime Ripard <maxime@cerno.tech>, Sean Paul <seanpaul@chromium.org>,
 Brian Masney <masneyb@onstation.org>, Sam Ravnborg <sam@ravnborg.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMTE6NDg6MDRBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBUaGUgc2V0dGluZyBvZiBicmlk
Z2UtPm9mX25vZGUgYnkgZHJtX2JyaWRnZV9pbml0KCkgaW4KPiBhbmFsb2dpeF9kcF9jb3JlLmMg
aXMgc2FmZSwgc2luY2UgLT5vZl9ub2RlIGlzbid0IHVzZWQgZGlyZWN0bHkgYW5kIHRoZQo+IGJy
aWRnZSBpc24ndCBwdWJsaXNoZWQgd2l0aCBkcm1fYnJpZGdlX2FkZCgpLgoKU3RpbGwsIGl0J3Mg
bm90IHRoZSByaWdodCBkZXZpY2UsIGlzIGl0ID8gQW5kIGlmIHdlIGxhdGVyIGV4dGVuZCB0aGUK
dXNhZ2Ugb2YgZGV2IGluIGRybV9icmlkZ2VfaW5pdCgpIGl0IGNvdWxkIGNhdXNlIGlzc3Vlcy4g
SSB0aGluayB5b3UKc2hvdWxkIHVzZSB0aGUgcmlnaHQgZGV2aWNlIHBvaW50ZXIuCgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1
LmMgfCA1ICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgt
YW54Nzh4eC5jIHwgOCArKy0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FuYWxvZ2l4X2RwX2NvcmUuYyB8IDUgKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCj4gaW5kZXggYjRmM2E5MjNhNTJhLi4x
MzBkNWMzYTA3ZWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbmFsb2dpeC1hbng2MzQ1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4L2FuYWxvZ2l4LWFueDYzNDUuYwo+IEBAIC02OTYsOCArNjk2LDYgQEAgc3RhdGljIGludCBh
bng2MzQ1X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ICAKPiAgCW11dGV4
X2luaXQoJmFueDYzNDUtPmxvY2spOwo+ICAKPiAtCWFueDYzNDUtPmJyaWRnZS5vZl9ub2RlID0g
Y2xpZW50LT5kZXYub2Zfbm9kZTsKPiAtCj4gIAlhbng2MzQ1LT5jbGllbnQgPSBjbGllbnQ7Cj4g
IAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBhbng2MzQ1KTsKPiAgCj4gQEAgLTc2MCw3ICs3
NTgsOCBAQCBzdGF0aWMgaW50IGFueDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQsCj4gIAkvKiBMb29rIGZvciBzdXBwb3J0ZWQgY2hpcCBJRCAqLwo+ICAJYW54NjM0NV9w
b3dlcm9uKGFueDYzNDUpOwo+ICAJaWYgKGFueDYzNDVfZ2V0X2NoaXBfaWQoYW54NjM0NSkpIHsK
PiAtCQlhbng2MzQ1LT5icmlkZ2UuZnVuY3MgPSAmYW54NjM0NV9icmlkZ2VfZnVuY3M7Cj4gKwkJ
ZHJtX2JyaWRnZV9pbml0KCZhbng2MzQ1LT5icmlkZ2UsICZjbGllbnQtPmRldiwKPiArCQkJCSZh
bng2MzQ1X2JyaWRnZV9mdW5jcywgTlVMTCwgTlVMTCk7Cj4gIAkJZHJtX2JyaWRnZV9hZGQoJmFu
eDYzNDUtPmJyaWRnZSk7Cj4gIAo+ICAJCXJldHVybiAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jCj4gaW5kZXggNDE4NjdiZTAz
NzUxLi5lMzc4OTJjZGM5Y2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguYwo+IEBAIC0xMjE0LDEwICsxMjE0LDYgQEAgc3Rh
dGljIGludCBhbng3OHh4X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ICAK
PiAgCW11dGV4X2luaXQoJmFueDc4eHgtPmxvY2spOwo+ICAKPiAtI2lmIElTX0VOQUJMRUQoQ09O
RklHX09GKQo+IC0JYW54Nzh4eC0+YnJpZGdlLm9mX25vZGUgPSBjbGllbnQtPmRldi5vZl9ub2Rl
Owo+IC0jZW5kaWYKPiAtCj4gIAlhbng3OHh4LT5jbGllbnQgPSBjbGllbnQ7Cj4gIAlpMmNfc2V0
X2NsaWVudGRhdGEoY2xpZW50LCBhbng3OHh4KTsKPiAgCj4gQEAgLTEzMjEsOCArMTMxNyw4IEBA
IHN0YXRpYyBpbnQgYW54Nzh4eF9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwK
PiAgCQlnb3RvIGVycl9wb3dlcm9mZjsKPiAgCX0KPiAgCj4gLQlhbng3OHh4LT5icmlkZ2UuZnVu
Y3MgPSAmYW54Nzh4eF9icmlkZ2VfZnVuY3M7Cj4gLQo+ICsJZHJtX2JyaWRnZV9pbml0KCZhbng3
OHh4LT5icmlkZ2UsICZjbGllbnQtPmRldiwgJmFueDc4eHhfYnJpZGdlX2Z1bmNzLAo+ICsJCQlO
VUxMLCBOVUxMKTsKPiAgCWRybV9icmlkZ2VfYWRkKCZhbng3OHh4LT5icmlkZ2UpOwo+ICAKPiAg
CS8qIElmIGNhYmxlIGlzIHB1bGxlZCBvdXQsIGp1c3QgcG93ZXJvZmYgYW5kIHdhaXQgZm9yIEhQ
RCBldmVudCAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FuYWxvZ2l4X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXhfZHBfY29yZS5jCj4gaW5kZXggYmI0MTFmZTUyYWU4Li40MDQyYmE5YTk4ZDggMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3Jl
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2Nv
cmUuYwo+IEBAIC0xNTg1LDkgKzE1ODUsOCBAQCBzdGF0aWMgaW50IGFuYWxvZ2l4X2RwX2NyZWF0
ZV9icmlkZ2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsCj4gIAo+ICAJZHAtPmJyaWRnZSA9
IGJyaWRnZTsKPiAgCj4gLQlicmlkZ2UtPmRyaXZlcl9wcml2YXRlID0gZHA7Cj4gLQlicmlkZ2Ut
PmZ1bmNzID0gJmFuYWxvZ2l4X2RwX2JyaWRnZV9mdW5jczsKPiAtCj4gKwlkcm1fYnJpZGdlX2lu
aXQoYnJpZGdlLCBkcm1fZGV2LT5kZXYsICZhbmFsb2dpeF9kcF9icmlkZ2VfZnVuY3MsCj4gKwkJ
CU5VTEwsIGRwKTsKPiAgCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGRwLT5lbmNvZGVyLCBicmlk
Z2UsIE5VTEwpOwo+ICAJaWYgKHJldCkgewo+ICAJCURSTV9FUlJPUigiZmFpbGVkIHRvIGF0dGFj
aCBkcm0gYnJpZGdlXG4iKTsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
