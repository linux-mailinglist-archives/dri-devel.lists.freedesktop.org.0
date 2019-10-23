Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43EE1FD8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53166EB2B;
	Wed, 23 Oct 2019 15:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4618B6EB23
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:45:37 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5A6C528F98C;
 Wed, 23 Oct 2019 16:45:35 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 21/21] ARM: dts: imx: imx51-zii-rdu1: Fix the display
 pipeline definition
Date: Wed, 23 Oct 2019 17:45:12 +0200
Message-Id: <20191023154512.9762-22-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGN1cnJlbnQgZGVmaW5pdGlvbiBkb2VzIG5vdCByZXByZXNlbnQgdGhlIGV4YWN0IGRpc3Bs
YXkgcGlwZWxpbmUgd2UKaGF2ZSBvbiB0aGUgYm9hcmQ6IHRoZSBMVkRTIHBhbmVsIGlzIGFjdHVh
bGx5IGNvbm5lY3RlZCB0aHJvdWdoIGEKcGFyYWxsZWwgLT4gTFZEUyBicmlkZ2UuIExldCdzIGZp
eCB0aGF0IHNvIHRoZSBkcml2ZXIgY2FuIHNlbGVjdCB0aGUKcHJvcGVyIGJ1cyBmb3JtYXQgb24g
dGhlIENSVEMgZW5kLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6CiogTm9uZQoKQ2hhbmdlcyBp
biB2MjoKKiBOb25lCi0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14NTEtemlpLXJkdTEuZHRzIHwg
MjQgKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUx
LXppaS1yZHUxLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUxLXppaS1yZHUxLmR0cwppbmRl
eCAzNTk2MDYwZjUyZTcuLjNmYjg0ZWE3Zjk5MyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NTEtemlpLXJkdTEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUxLXppaS1y
ZHUxLmR0cwpAQCAtOTUsNiArOTUsMjggQEAKIAkJCXJlZyA9IDwxPjsKIAogCQkJZGlzcGxheV9v
dXQ6IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfZW5jb2Rlcl9pbj47
CisJCQl9OworCQl9OworCX07CisKKwlsdmRzLWVuY29kZXIgeworCQljb21wYXRpYmxlID0gImx2
ZHMtZW5jb2RlciI7CisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDww
PjsKKworCQlwb3J0QDAgeworCQkJcmVnID0gPDA+OworCQkJYnVzLXdpZHRoID0gPDI0PjsKKwkJ
CWx2ZHNfZW5jb2Rlcl9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZGlz
cGxheV9vdXQ+OworCQkJfTsKKwkJfTsKKworCQlwb3J0QDEgeworCQkJcmVnID0gPDE+OworCQkJ
ZGF0YS1tYXBwaW5nID0gImplaWRhLTI0IjsKKwkJCWx2ZHNfZW5jb2Rlcl9vdXQ6IGVuZHBvaW50
IHsKIAkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luPjsKIAkJCX07CiAJCX07CkBAIC0x
MTAsNyArMTMyLDcgQEAKIAogCQlwb3J0IHsKIAkJCXBhbmVsX2luOiBlbmRwb2ludCB7Ci0JCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZkaXNwbGF5X291dD47CisJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZsdmRzX2VuY29kZXJfb3V0PjsKIAkJCX07CiAJCX07CiAJfTsKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
