Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E04AD77
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 23:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BAA6E23B;
	Tue, 18 Jun 2019 21:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536E6E23B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:43:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 7776F28A439
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dt-bindings: display: rockchip: document VOP gamma LUT
 address
Date: Tue, 18 Jun 2019 18:34:04 -0300
Message-Id: <20190618213406.7667-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618213406.7667-1-ezequiel@collabora.com>
References: <20190618213406.7667-1-ezequiel@collabora.com>
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
bEBjb2xsYWJvcmEuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tj
aGlwLXZvcC50eHQgICAgICAgICB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAt
dm9wLnR4dAppbmRleCA0ZjU4YzVhMmQxOTUuLjk3YWQ3OGNjN2UwMyAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAt
dm9wLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9y
b2NrY2hpcC9yb2NrY2hpcC12b3AudHh0CkBAIC0yMCw2ICsyMCwxMyBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOgogCQkicm9ja2NoaXAscmszMjI4LXZvcCI7CiAJCSJyb2NrY2hpcCxyazMzMjgtdm9w
IjsKIAorLSByZWc6IE11c3QgY29udGFpbiBvbmUgZW50cnkgY29ycmVzcG9uZGluZyB0byB0aGUg
YmFzZSBhZGRyZXNzIGFuZCBsZW5ndGgKKwlvZiB0aGUgcmVnaXN0ZXIgc3BhY2UuIENhbiBvcHRp
b25hbGx5IGNvbnRhaW4gYSBzZWNvbmQgZW50cnkKKwljb3JyZXNwb25kaW5nIHRvIHRoZSBDUlRD
IGdhbW1hIExVVCBhZGRyZXNzLgorCistIHJlZy1uYW1lczogImJhc2UiIGZvciB0aGUgYmFzZSBy
ZWdpc3RlciBzcGFjZS4gSWYgcHJlc2VudCwgdGhlIENSVEMKKwlnYW1tYSBMVVQgbmFtZSBzaG91
bGQgYmUgImx1dCIuCisKIC0gaW50ZXJydXB0czogc2hvdWxkIGNvbnRhaW4gYSBsaXN0IG9mIGFs
bCBWT1AgSVAgYmxvY2sgaW50ZXJydXB0cyBpbiB0aGUKIAkJIG9yZGVyOiBWU1lOQywgTENEX1NZ
U1RFTS4gVGhlIGludGVycnVwdCBzcGVjaWZpZXIKIAkJIGZvcm1hdCBkZXBlbmRzIG9uIHRoZSBp
bnRlcnJ1cHQgY29udHJvbGxlciB1c2VkLgpAQCAtNDgsNyArNTUsOCBAQCBFeGFtcGxlOgogU29D
IHNwZWNpZmljIERUIGVudHJ5OgogCXZvcGI6IHZvcGJAZmY5MzAwMDAgewogCQljb21wYXRpYmxl
ID0gInJvY2tjaGlwLHJrMzI4OC12b3AiOwotCQlyZWcgPSA8MHhmZjkzMDAwMCAweDE5Yz47CisJ
CXJlZyA9IDwweDAgMHhmZjkzMDAwMCAweDAgMHgxOWM+LCA8MHgwIDB4ZmY5MzEwMDAgMHgwIDB4
MTAwMD47CisJCXJlZy1uYW1lcyA9ICJiYXNlIiwgImx1dCI7CiAJCWludGVycnVwdHMgPSA8R0lD
X1NQSSAxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJY2xvY2tzID0gPCZjcnUgQUNMS19WT1Aw
PiwgPCZjcnUgRENMS19WT1AwPiwgPCZjcnUgSENMS19WT1AwPjsKIAkJY2xvY2stbmFtZXMgPSAi
YWNsa192b3AiLCAiZGNsa192b3AiLCAiaGNsa192b3AiOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
