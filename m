Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C394B86
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 19:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6BE89F45;
	Mon, 19 Aug 2019 17:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F018F89FCA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 17:19:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BCE9A8048D;
 Mon, 19 Aug 2019 19:19:40 +0200 (CEST)
Date: Mon, 19 Aug 2019 19:19:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [PATCH RFC 07/19] drm/msm: Use drm_attach_bridge() to attach a
 bridge to an encoder
Message-ID: <20190819171939.GB27109@ravnborg.org>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-8-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808151150.16336-8-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=D1OYtgt7qXEmPHs6M7oA:9
 a=zqEInNdsOrnKXvVw:21 a=TYsL9ddC6Lm2RMaS:21 a=CjuIK1q_8ugA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Chris Healy <Chris.Healy@zii.aero>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDU6MTE6MzhQTSArMDIwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IFRoaXMgaXMgcGFydCBvZiBvdXIgYXR0ZW1wdCB0byBtYWtlIHRoZSBicmlkZ2Ug
Y2hhaW4gYSBkb3VibGUtbGlua2VkCj4gbGlzdCBiYXNlZCBvbiB0aGUgZ2VuZXJpYyBsaXN0IGhl
bHBlcnMuIEluIG9yZGVyIHRvIGRvIHRoYXQsIHdlIG11c3QKPiBwYXRjaCBhbGwgZHJpdmVycyBt
YW5pcHVsYXRpbmcgdGhlIGVuY29kZXItPmJyaWRnZSBmaWVsZCBkaXJlY3RseS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKU2VhbiwgdGhp
cyBwYXRjaCBsb29rcyBsaWtlIGEgbmljZSBjbGVhbnVwIHdlIGNhbiBhcHBseQpvdXRzaWRlIHRo
ZSBzZXJpZXMuCkl0IHdvdWxkIGJlIGdvb2QgdGhhdCBkcml2ZXJzIGRvIG5vdCBwb2tlIGRpcmVj
dCBpbgp0aGUgZW5jb2RlciBkYXRhIHRoYXQgdGhpcyBwYXRjaCBmaXhlcy4KCglTYW0KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jICAgfCA0ICsrKy0KPiAgZHJpdmVycy9n
cHUvZHJtL21zbS9oZG1pL2hkbWkuYyB8IDQgKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9lZHAvZWRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHAuYwo+IGluZGV4
IDBmMzEyYWM1YjYyNC4uYWQ0ZTk2M2NjZDliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZWRwL2VkcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMKPiBA
QCAtMTc4LDcgKzE3OCw5IEBAIGludCBtc21fZWRwX21vZGVzZXRfaW5pdChzdHJ1Y3QgbXNtX2Vk
cCAqZWRwLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCWdvdG8gZmFpbDsKPiAgCX0KPiAg
Cj4gLQllbmNvZGVyLT5icmlkZ2UgPSBlZHAtPmJyaWRnZTsKPiArCXJldCA9IGRybV9icmlkZ2Vf
YXR0YWNoKGVuY29kZXIsIGVkcC0+YnJpZGdlLCBOVUxMKTsKPiArCWlmIChyZXQpCj4gKwkJZ290
byBmYWlsOwo+ICAKPiAgCXByaXYtPmJyaWRnZXNbcHJpdi0+bnVtX2JyaWRnZXMrK10gICAgICAg
PSBlZHAtPmJyaWRnZTsKPiAgCXByaXYtPmNvbm5lY3RvcnNbcHJpdi0+bnVtX2Nvbm5lY3RvcnMr
K10gPSBlZHAtPmNvbm5lY3RvcjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9o
ZG1pL2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKPiBpbmRleCAwZTQy
MTdiZTNmMDAuLjU1YjlhOGM4MzEyYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2hkbWkvaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWkuYwo+IEBA
IC0zMjcsNyArMzI3LDkgQEAgaW50IG1zbV9oZG1pX21vZGVzZXRfaW5pdChzdHJ1Y3QgaGRtaSAq
aGRtaSwKPiAgCQlnb3RvIGZhaWw7Cj4gIAl9Cj4gIAo+IC0JZW5jb2Rlci0+YnJpZGdlID0gaGRt
aS0+YnJpZGdlOwo+ICsJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgaGRtaS0+YnJp
ZGdlLCBOVUxMKTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBmYWlsOwo+ICAKPiAgCXByaXYtPmJy
aWRnZXNbcHJpdi0+bnVtX2JyaWRnZXMrK10gICAgICAgPSBoZG1pLT5icmlkZ2U7Cj4gIAlwcml2
LT5jb25uZWN0b3JzW3ByaXYtPm51bV9jb25uZWN0b3JzKytdID0gaGRtaS0+Y29ubmVjdG9yOwo+
IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
