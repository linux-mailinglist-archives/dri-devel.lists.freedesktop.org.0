Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94A45FF1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E56E892AE;
	Fri, 14 Jun 2019 14:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676FB892AE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:03:34 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hbmnh-0005bS-8g; Fri, 14 Jun 2019 16:03:29 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC/WIP] drm/rockchip: Support CRTC gamma LUT
Date: Fri, 14 Jun 2019 16:03:28 +0200
Message-ID: <4034618.A4UzVy7svI@diego>
In-Reply-To: <20190614155320.348d42af@collabora.com>
References: <20190613192244.5447-1-ezequiel@collabora.com>
 <20190614155320.348d42af@collabora.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpBbSBGcmVpdGFnLCAxNC4gSnVuaSAyMDE5LCAxNTo1MzoyMCBDRVNUIHNjaHJp
ZWIgQm9yaXMgQnJlemlsbG9uOgo+IE9uIFRodSwgMTMgSnVuIDIwMTkgMTY6MjI6NDQgLTAzMDAK
PiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+IAo+IAo+
ID4gK3N0YXRpYyBpbnQgdm9wX2dhbW1hX2x1dF9yZXF1ZXN0KHN0cnVjdCBkZXZpY2UgKmRldiwK
PiA+ICsJCQkJIHN0cnVjdCByZXNvdXJjZSAqcmVzLCBzdHJ1Y3Qgdm9wICp2b3ApCj4gPiArewo+
ID4gKwlyZXNvdXJjZV9zaXplX3Qgb2Zmc2V0ID0gdm9wLT5kYXRhLT5nYW1tYV9sdXRfYWRkcl9v
ZmY7Cj4gPiArCXJlc291cmNlX3NpemVfdCBzaXplID0gVk9QX0dBTU1BX0xVVF9TSVpFICogNDsK
PiA+ICsKPiA+ICsJLyoKPiA+ICsJICogU29tZSBTb0NzIChlLmcuIFJLMzI4OCkgaGF2ZSB0aGUg
Z2FtbWEgTFVUIGFkZHJlc3MgYWZ0ZXIKPiA+ICsJICogdGhlIE1NVSByZWdpc3RlcnMsIHdoaWNo
IG1lYW5zIHdlIGNhbid0IHJlcXVlc3QgYW5kIGlvcmVtYXAKPiA+ICsJICogdGhlIGVudGlyZSBy
ZWdpc3RlciBzZXQuIE90aGVyIChlLmcuIFJLMzM5OSkgaGF2ZSBnYW1tYSBMVVQKPiA+ICsJICog
YWRkcmVzcyBiZWZvcmUgTU1VLgo+ID4gKwkgKgo+ID4gKwkgKiBUaGVyZWZvcmUsIHdlIG5lZWQg
dG8gcmVxdWVzdCBhbmQgaW9yZW1hcCB0aG9zZSB0aGF0IGhhdmVuJ3QKPiA+ICsJICogYmVlbiBh
bHJlYWR5Lgo+ID4gKwkgKi8KPiA+ICsJaWYgKHZvcC0+bGVuID49IChvZmZzZXQgKyBzaXplKSkg
ewo+ID4gKwkJdm9wLT5sdXRfcmVncyA9IHZvcC0+cmVncyArIG9mZnNldDsKPiA+ICsJCXJldHVy
biAwOwo+ID4gKwl9Cj4gPiArCj4gPiArCWlmICghZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24oZGV2
LCByZXMtPnN0YXJ0ICsgb2Zmc2V0LAo+ID4gKwkJCQkgICAgIHNpemUsIGRldl9uYW1lKGRldikp
KSB7Cj4gPiArCQlkZXZfd2FybihkZXYsICJjYW4ndCByZXF1ZXN0IGdhbW1hIGx1dCByZWdpb25c
biIpOwo+ID4gKwkJcmV0dXJuIC1FQlVTWTsKPiA+ICsJfQo+ID4gKwo+ID4gKwl2b3AtPmx1dF9y
ZWdzID0gZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCArIG9mZnNldCwgc2l6ZSk7Cj4gPiAr
CWlmICghdm9wLT5sdXRfcmVncykgewo+ID4gKwkJZGV2X2VycihkZXYsICJjYW4ndCBpb3JlbWFw
IGdhbW1hIGx1dCBhZGRyZXNzXG4iKTsKPiA+ICsJCWRldm1fcmVsZWFzZV9tZW1fcmVnaW9uKGRl
diwgcmVzLT5zdGFydCArIG9mZnNldCwgc2l6ZSk7Cj4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+
ICsJfQo+IAo+IENhbid0IHdlIHBhdGNoIHRoZSByZXNvdXJjZSBqdXN0IGFmdGVyIGNhbGxpbmcg
cGxhZm9ybV9nZXRfcmVzb3VyY2UoKQo+IChhbmQgYmVmb3JlIGNhbGxpbmcgZGV2bV9pb3JlbWFw
X3Jlc291cmNlKCkpIHNvIHdlIGRvbid0IGhhdmUgdG8gYWRkCj4gdGhlc2UgZGV2bV9yZXF1ZXN0
X21lbV9yZWdpb24oKStkZXZtX2lvcmVtYXAoKSBjYWxscyBoZXJlPwoKVGhlIGlzc3VlIGlzIHRo
YXQgb24gdGhlIG9sZGVyIHJrMzI4OCBzb2NzIHRoZSB2b3BzIG1lbW9yeSBtYXAgaGFzCnRoZSBt
bXUgcmVnaXN0ZXJzICh3aGljaCBnZXQgbWFwcGVkIHNlcGFyYXRlbHkpIGluIGJldHdlZW4gdGhl
IGNvcmUKYW5kIGx1dCByZWdpc3RlcnMuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
