Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8CB86C0A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 23:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13366E8C0;
	Thu,  8 Aug 2019 21:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5649A6E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 21:04:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2D86226CD87;
 Thu,  8 Aug 2019 22:04:12 +0100 (BST)
Date: Thu, 8 Aug 2019 23:04:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 05/19] drm/exynos: Don't reset bridge->next
Message-ID: <20190808230409.5ccc753e@collabora.com>
In-Reply-To: <20190808151150.16336-6-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-6-boris.brezillon@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAgOCBBdWcgMjAxOSAxNzoxMTozNiArMDIwMApCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gYnJpZGdlLT5uZXh0IGlzIG9ubHkg
cG9pbnRzIHRvIHRoZSBuZXcgYnJpZGdlIGlmIGRybV9icmlkZ2VfYXR0YWNoKCkKCgkJXi9pcy8v
Cgo+IHN1Y2NlZWRzLiBObyBuZWVkIHRvIHJlc2V0IGl0IG1hbnVhbGx5IGhlcmUuCj4gCj4gTm90
ZSB0aGF0IHRoaXMgY2hhbmdlIGlzIHBhcnQgb2YgdGhlIGF0dGVtcHQgdG8gbWFrZSB0aGUgYnJp
ZGdlIGNoYWluCj4gYSBkb3VibGUtbGlua2VkIGxpc3QuIEluIG9yZGVyIHRvIGRvIHRoYXQgd2Ug
bXVzdCBwYXRjaCBhbGwgZHJpdmVycwo+IG1hbmlwdWxhdGluZyB0aGUgYnJpZGdlLT5uZXh0IGZp
ZWxkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Rw
LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RwLmMKPiBpbmRleCAxZTZhYTI0YmY0NWUuLjQ3ODU4ODVjMGY0ZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHAuYwo+IEBAIC0xMTAsNyArMTEwLDYgQEAgc3Rh
dGljIGludCBleHlub3NfZHBfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgYW5hbG9naXhfZHBfcGxhdF9k
YXRhICpwbGF0X2RhdGEsCj4gIAkJaWYgKHJldCkgewo+ICAJCQlEUk1fREVWX0VSUk9SKGRwLT5k
ZXYsCj4gIAkJCQkgICAgICAiRmFpbGVkIHRvIGF0dGFjaCBicmlkZ2UgdG8gZHJtXG4iKTsKPiAt
CQkJYnJpZGdlLT5uZXh0ID0gTlVMTDsKPiAgCQkJcmV0dXJuIHJldDsKPiAgCQl9Cj4gIAl9Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
