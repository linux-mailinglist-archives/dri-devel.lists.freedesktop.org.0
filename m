Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EF982E6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 20:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093B26E999;
	Wed, 21 Aug 2019 18:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28CB6E998
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 18:32:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 94D802699FC;
 Wed, 21 Aug 2019 19:32:36 +0100 (BST)
Date: Wed, 21 Aug 2019 20:32:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 02/11] drm/meson: venc: make drm_display_mode const
Message-ID: <20190821203233.47137f57@collabora.com>
In-Reply-To: <20190820084109.24616-3-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
 <20190820084109.24616-3-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAxMDo0MTowMCArMDIwMApOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBCZWZvcmUgc3dpdGNoaW5nIHRvIGJyaWRnZSBm
dW5jcywgbWFrZSBzdXJlIGRybV9kaXNwbGF5X21vZGUgaXMgcGFzc2VkCj4gYXMgY29uc3QgdG8g
dGhlIHZlbmMgZnVuY3Rpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX3ZlbmMuYyB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3Zl
bmMuaCB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5j
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCj4gaW5kZXggM2Q0NzkxNzk4
YWUwLi5jOGU5ODQwYWQ0NTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX3ZlbmMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKPiBA
QCAtOTQ2LDcgKzk0Niw3IEBAIGJvb2wgbWVzb25fdmVuY19oZG1pX3ZlbmNfcmVwZWF0KGludCB2
aWMpCj4gIEVYUE9SVF9TWU1CT0xfR1BMKG1lc29uX3ZlbmNfaGRtaV92ZW5jX3JlcGVhdCk7Cj4g
IAo+ICB2b2lkIG1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2
LCBpbnQgdmljLAo+IC0JCQkgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAr
CQkJICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gIHsKPiAgCXVu
aW9uIG1lc29uX2hkbWlfdmVuY19tb2RlICp2bW9kZSA9IE5VTEw7Cj4gIAl1bmlvbiBtZXNvbl9o
ZG1pX3ZlbmNfbW9kZSB2bW9kZV9kbXQ7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl92ZW5jLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5oCj4g
aW5kZXggNTc2NzY4YmRkMDhkLi4xYWJkY2JkZjUxYzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX3ZlbmMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl92ZW5jLmgKPiBAQCAtNjAsNyArNjAsNyBAQCBleHRlcm4gc3RydWN0IG1lc29uX2N2YnNf
ZW5jaV9tb2RlIG1lc29uX2N2YnNfZW5jaV9udHNjOwo+ICB2b2lkIG1lc29uX3ZlbmNpX2N2YnNf
bW9kZV9zZXQoc3RydWN0IG1lc29uX2RybSAqcHJpdiwKPiAgCQkJICAgICAgIHN0cnVjdCBtZXNv
bl9jdmJzX2VuY2lfbW9kZSAqbW9kZSk7Cj4gIHZvaWQgbWVzb25fdmVuY19oZG1pX21vZGVfc2V0
KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIGludCB2aWMsCj4gLQkJCSAgICAgIHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlKTsKPiArCQkJICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUpOwo+ICB1bnNpZ25lZCBpbnQgbWVzb25fdmVuY2lfZ2V0X2ZpZWxkKHN0cnVj
dCBtZXNvbl9kcm0gKnByaXYpOwo+ICAKPiAgdm9pZCBtZXNvbl92ZW5jX2VuYWJsZV92c3luYyhz
dHJ1Y3QgbWVzb25fZHJtICpwcml2KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
