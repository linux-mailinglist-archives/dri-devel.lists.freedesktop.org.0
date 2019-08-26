Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C5A9D2B0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D396C6E23D;
	Mon, 26 Aug 2019 15:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67F36E229
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:27:10 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 00FCB28BCB2;
 Mon, 26 Aug 2019 16:27:08 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/21] ARM: dts: imx: imx51-zii-rdu1: Fix the display
 pipeline definition
Date: Mon, 26 Aug 2019 17:26:49 +0200
Message-Id: <20190826152649.13820-22-boris.brezillon@collabora.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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

VGhlIGN1cnJlbnQgZGVmaW5pdGlvbiBkb2VzIG5vdCByZXByZXNlbnQgdGhlIGV4YWN0IGRpc3Bs
YXkgcGlwZWxpbmUgd2UKaGF2ZSBvbiB0aGUgYm9hcmQ6IHRoZSBMVkRTIHBhbmVsIGlzIGFjdHVh
bGx5IGNvbm5lY3RlZCB0aHJvdWdoIGEKcGFyYWxsZWwgLT4gTFZEUyBicmlkZ2UuIExldCdzIGZp
eCB0aGF0IHNvIHRoZSBkcml2ZXIgY2FuIHNlbGVjdCB0aGUKcHJvcGVyIGJ1cyBmb3JtYXQgb24g
dGhlIENSVEMgZW5kLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6CiogTm9uZQotLS0KIGFyY2gv
YXJtL2Jvb3QvZHRzL2lteDUxLXppaS1yZHUxLmR0cyB8IDI0ICsrKysrKysrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg1MS16aWktcmR1MS5kdHMgYi9hcmNoL2Fy
bS9ib290L2R0cy9pbXg1MS16aWktcmR1MS5kdHMKaW5kZXggMzU5NjA2MGY1MmU3Li5iOWM4ZTkz
Y2Q1ZGIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUxLXppaS1yZHUxLmR0cwor
KysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg1MS16aWktcmR1MS5kdHMKQEAgLTk1LDYgKzk1LDI4
IEBACiAJCQlyZWcgPSA8MT47CiAKIAkJCWRpc3BsYXlfb3V0OiBlbmRwb2ludCB7CisJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZsdmRzX2VuY29kZXJfaW4+OworCQkJfTsKKwkJfTsKKwl9OworCisJ
bHZkcy1lbmNvZGVyIHsKKwkJY29tcGF0aWJsZSA9ICJ0aSxzbjc1bHZkczgzIiwgImx2ZHMtZW5j
b2RlciI7CisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwor
CQlwb3J0QDAgeworCQkJcmVnID0gPDA+OworCQkJZGF0YS1tYXBwaW5nID0gInJnYi0yNCI7CisJ
CQlsdmRzX2VuY29kZXJfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRp
c3BsYXlfb3V0PjsKKwkJCX07CisJCX07CisKKwkJcG9ydEAxIHsKKwkJCXJlZyA9IDwxPjsKKwkJ
CWRhdGEtbWFwcGluZyA9ICJqZWlkYS0yNCI7CisJCQlsdmRzX2VuY29kZXJfb3V0OiBlbmRwb2lu
dCB7CiAJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47CiAJCQl9OwogCQl9OwpAQCAt
MTEwLDcgKzEzMiw3IEBACiAKIAkJcG9ydCB7CiAJCQlwYW5lbF9pbjogZW5kcG9pbnQgewotCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmZGlzcGxheV9vdXQ+OworCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmbHZkc19lbmNvZGVyX291dD47CiAJCQl9OwogCQl9OwogCX07Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
