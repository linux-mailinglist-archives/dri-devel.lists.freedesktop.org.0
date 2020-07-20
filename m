Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA06225ACD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 11:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6BD89EA9;
	Mon, 20 Jul 2020 09:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DDA89EA9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 09:06:15 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id A794E5C09AE;
 Mon, 20 Jul 2020 11:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1595235973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ozal9zYuEdyiTLlZha19Xa5vhZAgEpWHWtxqIlbZGX0=;
 b=xhMoTVXPX6suMio/jRNWYekeQPt83mVMAtubRHOD40ch/Z6zDr67hLueLkpZsRW95kmHcm
 yOF1H0rD7qQEeKSStZe209wGbvyl7qqz8ypIV6uzDrukfDSkVU94oIhkCjLwg5bnHh2N0q
 +kHLXinTWKLg4gCGzD6FE9lfttrff+8=
MIME-Version: 1.0
Date: Mon, 20 Jul 2020 11:06:13 +0200
From: Stefan Agner <stefan@agner.ch>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/mxsfb: drop unused function parameter
In-Reply-To: <20200716174139.16602-1-u.kleine-koenig@pengutronix.de>
References: <20200716174139.16602-1-u.kleine-koenig@pengutronix.de>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <cb98ee4f3846f9190cdd007965ec4064@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0xNiAxOTo0MSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gZmxhZ3MgaXMg
dW51c2VkIHNpbmNlIHRoZSBkcml2ZXIgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IDQ1ZDU5ZDcw
NDA4MAo+ICgiZHJtOiBBZGQgbmV3IGRyaXZlciBmb3IgTVhTRkIgY29udHJvbGxlciIpLgoKQXBw
bGllZCB0byBkcm0tbWlzYy1uZXh0LiBUaGFua3MuCgotLQpTdGVmYW4KCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgNCArKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwo+IGIvZHJpdmVycy9ncHUv
ZHJtL214c2ZiL214c2ZiX2Rydi5jCj4gaW5kZXggNDk3Y2Y0NDNhOWFmLi5mYjk3MmRkNGY2NDIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCj4gQEAgLTE5MSw3ICsxOTEsNyBAQCBz
dGF0aWMgc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzIG14c2ZiX2Z1bmNzID0g
ewo+ICAJLmRpc2FibGVfdmJsYW5rCT0gbXhzZmJfcGlwZV9kaXNhYmxlX3ZibGFuaywKPiAgfTsK
PiAgCj4gLXN0YXRpYyBpbnQgbXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNp
Z25lZCBsb25nIGZsYWdzKQo+ICtzdGF0aWMgaW50IG14c2ZiX2xvYWQoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSkKPiAgewo+ICAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRm
b3JtX2RldmljZShkcm0tPmRldik7Cj4gIAlzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2Zi
Owo+IEBAIC00MDcsNyArNDA3LDcgQEAgc3RhdGljIGludCBteHNmYl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKElTX0VSUihkcm0pKQo+ICAJCXJldHVybiBQVFJf
RVJSKGRybSk7Cj4gIAo+IC0JcmV0ID0gbXhzZmJfbG9hZChkcm0sIDApOwo+ICsJcmV0ID0gbXhz
ZmJfbG9hZChkcm0pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl9mcmVlOwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
