Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA874F050
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 23:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3B6E928;
	Fri, 21 Jun 2019 21:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AF86E92A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 21:14:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 3F71428623B
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] dt-bindings: display: rockchip: document VOP gamma LUT
 address
Date: Fri, 21 Jun 2019 18:13:44 -0300
Message-Id: <20190621211346.1324-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190621211346.1324-1-ezequiel@collabora.com>
References: <20190621211346.1324-1-ezequiel@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSByZWdpc3RlciBzcGVjaWZpZXIgZGVzY3JpcHRpb24gZm9yIGFuCm9wdGlvbmFsIGdh
bW1hIExVVCBhZGRyZXNzLgoKU2lnbmVkLW9mZi1ieTogRXplcXVpZWwgR2FyY2lhIDxlemVxdWll
bEBjb2xsYWJvcmEuY29tPgotLS0KQ2hhbmdlcyBmcm9tIHYxOgoqIERyb3AgcmVnLW5hbWVzLCBz
dWdnZXN0ZWQgYnkgRG91Zy4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jv
Y2tjaGlwL3JvY2tjaGlwLXZvcC50eHQgICB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlw
LXZvcC50eHQKaW5kZXggNGY1OGM1YTJkMTk1Li44YjNhNWY1MTQyMDUgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlw
LXZvcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dApAQCAtMjAsNiArMjAsMTAgQEAgUmVxdWlyZWQgcHJv
cGVydGllczoKIAkJInJvY2tjaGlwLHJrMzIyOC12b3AiOwogCQkicm9ja2NoaXAscmszMzI4LXZv
cCI7CiAKKy0gcmVnOiBNdXN0IGNvbnRhaW4gb25lIGVudHJ5IGNvcnJlc3BvbmRpbmcgdG8gdGhl
IGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoCisJb2YgdGhlIHJlZ2lzdGVyIHNwYWNlLiBDYW4gb3B0
aW9uYWxseSBjb250YWluIGEgc2Vjb25kIGVudHJ5CisJY29ycmVzcG9uZGluZyB0byB0aGUgQ1JU
QyBnYW1tYSBMVVQgYWRkcmVzcy4KKwogLSBpbnRlcnJ1cHRzOiBzaG91bGQgY29udGFpbiBhIGxp
c3Qgb2YgYWxsIFZPUCBJUCBibG9jayBpbnRlcnJ1cHRzIGluIHRoZQogCQkgb3JkZXI6IFZTWU5D
LCBMQ0RfU1lTVEVNLiBUaGUgaW50ZXJydXB0IHNwZWNpZmllcgogCQkgZm9ybWF0IGRlcGVuZHMg
b24gdGhlIGludGVycnVwdCBjb250cm9sbGVyIHVzZWQuCkBAIC00OCw3ICs1Miw3IEBAIEV4YW1w
bGU6CiBTb0Mgc3BlY2lmaWMgRFQgZW50cnk6CiAJdm9wYjogdm9wYkBmZjkzMDAwMCB7CiAJCWNv
bXBhdGlibGUgPSAicm9ja2NoaXAscmszMjg4LXZvcCI7Ci0JCXJlZyA9IDwweGZmOTMwMDAwIDB4
MTljPjsKKwkJcmVnID0gPDB4MCAweGZmOTMwMDAwIDB4MCAweDE5Yz4sIDwweDAgMHhmZjkzMTAw
MCAweDAgMHgxMDAwPjsKIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE1IElSUV9UWVBFX0xFVkVM
X0hJR0g+OwogCQljbG9ja3MgPSA8JmNydSBBQ0xLX1ZPUDA+LCA8JmNydSBEQ0xLX1ZPUDA+LCA8
JmNydSBIQ0xLX1ZPUDA+OwogCQljbG9jay1uYW1lcyA9ICJhY2xrX3ZvcCIsICJkY2xrX3ZvcCIs
ICJoY2xrX3ZvcCI7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
