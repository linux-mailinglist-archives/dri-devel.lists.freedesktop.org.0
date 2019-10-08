Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF8D03B2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ADB6E8A5;
	Tue,  8 Oct 2019 23:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C432B6E8A5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 23:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 9A47928C299
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] dt-bindings: display: rockchip: document VOP gamma LUT
 address
Date: Tue,  8 Oct 2019 20:00:36 -0300
Message-Id: <20191008230038.24037-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191008230038.24037-1-ezequiel@collabora.com>
References: <20191008230038.24037-1-ezequiel@collabora.com>
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
bEBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
LS0tCkNoYW5nZXMgZnJvbSB2MzoKKiBOb25lLgpDaGFuZ2VzIGZyb20gdjI6CiogTm9uZS4KQ2hh
bmdlcyBmcm9tIHYxOgoqIERyb3AgcmVnLW5hbWVzLCBzdWdnZXN0ZWQgYnkgRG91Zy4KLS0tCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQg
ICB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQKaW5kZXggNGY1OGM1YTJk
MTk1Li44YjNhNWY1MTQyMDUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4
dApAQCAtMjAsNiArMjAsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIAkJInJvY2tjaGlwLHJr
MzIyOC12b3AiOwogCQkicm9ja2NoaXAscmszMzI4LXZvcCI7CiAKKy0gcmVnOiBNdXN0IGNvbnRh
aW4gb25lIGVudHJ5IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3Ro
CisJb2YgdGhlIHJlZ2lzdGVyIHNwYWNlLiBDYW4gb3B0aW9uYWxseSBjb250YWluIGEgc2Vjb25k
IGVudHJ5CisJY29ycmVzcG9uZGluZyB0byB0aGUgQ1JUQyBnYW1tYSBMVVQgYWRkcmVzcy4KKwog
LSBpbnRlcnJ1cHRzOiBzaG91bGQgY29udGFpbiBhIGxpc3Qgb2YgYWxsIFZPUCBJUCBibG9jayBp
bnRlcnJ1cHRzIGluIHRoZQogCQkgb3JkZXI6IFZTWU5DLCBMQ0RfU1lTVEVNLiBUaGUgaW50ZXJy
dXB0IHNwZWNpZmllcgogCQkgZm9ybWF0IGRlcGVuZHMgb24gdGhlIGludGVycnVwdCBjb250cm9s
bGVyIHVzZWQuCkBAIC00OCw3ICs1Miw3IEBAIEV4YW1wbGU6CiBTb0Mgc3BlY2lmaWMgRFQgZW50
cnk6CiAJdm9wYjogdm9wYkBmZjkzMDAwMCB7CiAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmsz
Mjg4LXZvcCI7Ci0JCXJlZyA9IDwweGZmOTMwMDAwIDB4MTljPjsKKwkJcmVnID0gPDB4MCAweGZm
OTMwMDAwIDB4MCAweDE5Yz4sIDwweDAgMHhmZjkzMTAwMCAweDAgMHgxMDAwPjsKIAkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDE1IElSUV9UWVBFX0xFVkVMX0hJR0g+OwogCQljbG9ja3MgPSA8JmNy
dSBBQ0xLX1ZPUDA+LCA8JmNydSBEQ0xLX1ZPUDA+LCA8JmNydSBIQ0xLX1ZPUDA+OwogCQljbG9j
ay1uYW1lcyA9ICJhY2xrX3ZvcCIsICJkY2xrX3ZvcCIsICJoY2xrX3ZvcCI7Ci0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
