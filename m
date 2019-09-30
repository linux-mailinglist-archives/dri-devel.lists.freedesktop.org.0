Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86538C297F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 00:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D486E4CF;
	Mon, 30 Sep 2019 22:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA51A6E417
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 22:28:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 8FA0228A7F5
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/5] dt-bindings: display: rockchip: document VOP gamma LUT
 address
Date: Mon, 30 Sep 2019 19:27:59 -0300
Message-Id: <20190930222802.32088-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190930222802.32088-1-ezequiel@collabora.com>
References: <20190930222802.32088-1-ezequiel@collabora.com>
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
LS0tCkNoYW5nZXMgZnJvbSB2MjoKKiBOb25lLgpDaGFuZ2VzIGZyb20gdjE6CiogRHJvcCByZWct
bmFtZXMsIHN1Z2dlc3RlZCBieSBEb3VnLgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCAgIHwgNiArKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3Au
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAv
cm9ja2NoaXAtdm9wLnR4dAppbmRleCA0ZjU4YzVhMmQxOTUuLjhiM2E1ZjUxNDIwNSAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAv
cm9ja2NoaXAtdm9wLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0CkBAIC0yMCw2ICsyMCwxMCBAQCBSZXF1
aXJlZCBwcm9wZXJ0aWVzOgogCQkicm9ja2NoaXAscmszMjI4LXZvcCI7CiAJCSJyb2NrY2hpcCxy
azMzMjgtdm9wIjsKIAorLSByZWc6IE11c3QgY29udGFpbiBvbmUgZW50cnkgY29ycmVzcG9uZGlu
ZyB0byB0aGUgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGgKKwlvZiB0aGUgcmVnaXN0ZXIgc3BhY2Uu
IENhbiBvcHRpb25hbGx5IGNvbnRhaW4gYSBzZWNvbmQgZW50cnkKKwljb3JyZXNwb25kaW5nIHRv
IHRoZSBDUlRDIGdhbW1hIExVVCBhZGRyZXNzLgorCiAtIGludGVycnVwdHM6IHNob3VsZCBjb250
YWluIGEgbGlzdCBvZiBhbGwgVk9QIElQIGJsb2NrIGludGVycnVwdHMgaW4gdGhlCiAJCSBvcmRl
cjogVlNZTkMsIExDRF9TWVNURU0uIFRoZSBpbnRlcnJ1cHQgc3BlY2lmaWVyCiAJCSBmb3JtYXQg
ZGVwZW5kcyBvbiB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgdXNlZC4KQEAgLTQ4LDcgKzUyLDcg
QEAgRXhhbXBsZToKIFNvQyBzcGVjaWZpYyBEVCBlbnRyeToKIAl2b3BiOiB2b3BiQGZmOTMwMDAw
IHsKIAkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMyODgtdm9wIjsKLQkJcmVnID0gPDB4ZmY5
MzAwMDAgMHgxOWM+OworCQlyZWcgPSA8MHgwIDB4ZmY5MzAwMDAgMHgwIDB4MTljPiwgPDB4MCAw
eGZmOTMxMDAwIDB4MCAweDEwMDA+OwogCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTUgSVJRX1RZ
UEVfTEVWRUxfSElHSD47CiAJCWNsb2NrcyA9IDwmY3J1IEFDTEtfVk9QMD4sIDwmY3J1IERDTEtf
Vk9QMD4sIDwmY3J1IEhDTEtfVk9QMD47CiAJCWNsb2NrLW5hbWVzID0gImFjbGtfdm9wIiwgImRj
bGtfdm9wIiwgImhjbGtfdm9wIjsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
