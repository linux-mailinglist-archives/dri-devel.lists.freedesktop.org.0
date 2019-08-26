Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7519D2A4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00786E226;
	Mon, 26 Aug 2019 15:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F646E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:26:58 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AB75C28BD5E;
 Mon, 26 Aug 2019 16:26:56 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/21] drm/exynos: Don't reset bridge->next
Date: Mon, 26 Aug 2019 17:26:33 +0200
Message-Id: <20190826152649.13820-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826152649.13820-1-boris.brezillon@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YnJpZGdlLT5uZXh0IGlzIG9ubHkgcG9pbnRzIHRvIHRoZSBuZXcgYnJpZGdlIGlmIGRybV9icmlk
Z2VfYXR0YWNoKCkKc3VjY2VlZHMuIE5vIG5lZWQgdG8gcmVzZXQgaXQgbWFudWFsbHkgaGVyZS4K
Ck5vdGUgdGhhdCB0aGlzIGNoYW5nZSBpcyBwYXJ0IG9mIHRoZSBhdHRlbXB0IHRvIG1ha2UgdGhl
IGJyaWRnZSBjaGFpbgphIGRvdWJsZS1saW5rZWQgbGlzdC4gSW4gb3JkZXIgdG8gZG8gdGhhdCB3
ZSBtdXN0IHBhdGNoIGFsbCBkcml2ZXJzCm1hbmlwdWxhdGluZyB0aGUgYnJpZGdlLT5uZXh0IGZp
ZWxkLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6CiogQWRkIExhdXJlbnQncyBS
LWIgKEknZCBsaWtlIHRvIGhhdmUgYSBSLWIgZnJvbSB0aGUgRFJNIGV4eW5vcwogIG1haW50YWlu
ZXJzIGJlZm9yZSBhcHBseWluZyB0aGF0IG9uZSkKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcC5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcC5jCmluZGV4IDFlNmFhMjRiZjQ1ZS4uNDc4NTg4NWMwZjRmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMKQEAgLTExMCw3ICsxMTAsNiBAQCBzdGF0aWMg
aW50IGV4eW5vc19kcF9icmlkZ2VfYXR0YWNoKHN0cnVjdCBhbmFsb2dpeF9kcF9wbGF0X2RhdGEg
KnBsYXRfZGF0YSwKIAkJaWYgKHJldCkgewogCQkJRFJNX0RFVl9FUlJPUihkcC0+ZGV2LAogCQkJ
CSAgICAgICJGYWlsZWQgdG8gYXR0YWNoIGJyaWRnZSB0byBkcm1cbiIpOwotCQkJYnJpZGdlLT5u
ZXh0ID0gTlVMTDsKIAkJCXJldHVybiByZXQ7CiAJCX0KIAl9Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
