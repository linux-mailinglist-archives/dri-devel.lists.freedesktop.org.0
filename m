Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CC116F41
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B18F6E480;
	Mon,  9 Dec 2019 14:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AEF6E47A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:42:29 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ieKEx-00016m-IC; Mon, 09 Dec 2019 15:42:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH 2/3] dt-bindings: display: panel: Add binding document for
 Xinpeng XPP055C272
Date: Mon,  9 Dec 2019 15:42:07 +0100
Message-Id: <20191209144208.4863-2-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209144208.4863-1-heiko@sntech.de>
References: <20191209144208.4863-1-heiko@sntech.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KClRoZSBYUFAwNTVDMjcyIGlzIGEgNS41IiA3MjB4MTI4MCBEU0kgZGlzcGxheS4KClNpZ25l
ZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB0aGVvYnJvbWEtc3lzdGVt
cy5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwveGlucGVuZyx4cHAwNTVjMjcyLnlhbWwgICAg
IHwgNDUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC94aW5wZW5nLHhwcDA1NWMyNzIueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3hpbnBlbmcseHBwMDU1
YzI3Mi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwveGlucGVuZyx4cHAwNTVjMjcyLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi40NTE1ZDQ0ZDE4OWIKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC94aW5wZW5nLHhwcDA1NWMyNzIueWFt
bApAQCAtMCwwICsxLDQ1IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbCMKKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRs
ZTogWGlucGVuZyBYUFAwNTVDMjcyIDcyMHgxMjgwIERTSSBwYW5lbAorCittYWludGFpbmVyczoK
KyAgLSBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29t
PgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoK
KyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogeGlucGVuZyx4cHAwNTVjMjcyCisgIHJlZzogdHJ1
ZQorICBiYWNrbGlnaHQ6IHRydWUKKyAgcG9ydDogdHJ1ZQorICByZXNldC1ncGlvczogdHJ1ZQor
ICBpb3ZjYy1zdXBwbHk6CisgICAgIGRlc2NyaXB0aW9uOiByZWd1bGF0b3IgdGhhdCBzdXBwbGll
cyB0aGUgaW92Y2Mgdm9sdGFnZQorICB2Y2ktc3VwcGx5OgorICAgICBkZXNjcmlwdGlvbjogcmVn
dWxhdG9yIHRoYXQgc3VwcGxpZXMgdGhlIHZjaSB2b2x0YWdlCisKK3JlcXVpcmVkOgorICAtIGNv
bXBhdGlibGUKKyAgLSByZWcKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1w
bGVzOgorICAtIHwKKyAgICBkc2lAZmY0NTAwMDAgeworICAgICAgICBwYW5lbEAwIHsKKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAieGlucGVuZyx4cHAwNTVjMjcyIjsKKyAgICAgICAgICAgIHJl
ZyA9IDwwPjsKKyAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKKyAgICAgICAg
ICAgIGlvdmNjLXN1cHBseSA9IDwmdmNjXzF2OD47CisgICAgICAgICAgICB2Y2ktc3VwcGx5ID0g
PCZ2Y2MzdjNfbGNkPjsKKyAgICAgICAgfTsKKyAgICB9OworCisuLi4KLS0gCjIuMjQuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
