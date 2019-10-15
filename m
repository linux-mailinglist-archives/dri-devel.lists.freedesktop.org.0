Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA7D7BFF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5806E863;
	Tue, 15 Oct 2019 16:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653C96E362
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 10:44:52 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 70616C0005;
 Tue, 15 Oct 2019 10:44:47 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu,
 VenkataRajesh.Kalakodima@in.bosch.com
Subject: [PATCH v5 1/8] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
Date: Tue, 15 Oct 2019 12:46:14 +0200
Message-Id: <20191015104621.62514-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, airlied@linux.ie,
 mark.rutland@arm.com, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, seanpaul@chromium.org,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFIt
Q2FyIERpc3BsYXkKVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KCkNNTSBpcyB0aGUgaW1h
Z2UgZW5oYW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCmNo
YW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCku
CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGpt
b25kaS5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCAgICAg
ICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5hNTcwMzdiOWU5YmEKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2Fz
LGNtbS55YW1sCkBAIC0wLDAgKzEsNjcgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBSZW5lc2FzIFItQ2FyIENv
bG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pCisKK21haW50YWluZXJzOgorICAtIExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KKyAgLSBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgorICAtIEph
Y29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KKworZGVzY3JpcHRpb246IHwr
CisgIFJlbmVzYXMgUi1DYXIgY29sb3IgbWFuYWdlbWVudCBtb2R1bGUgY29ubmVjdGVkIHRvIFIt
Q2FyIERVIHZpZGVvIGNoYW5uZWxzLgorICBJdCBwcm92aWRlcyBpbWFnZSBlbmhhbmNlbWVudCBm
dW5jdGlvbnMgc3VjaCBhcyAxLUQgbG9vay11cCB0YWJsZXMgKExVVCksCisgIDMtRCBsb29rLXVw
IHRhYmxlcyAoQ0xVKSwgMUQtaGlzdG9ncmFtIGdlbmVyYXRpb24gKEhHTyksIGFuZCBjb2xvcgor
ICBzcGFjZSBjb252ZXJzaW9uIChDU0MpLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgor
ICAgIG9uZU9mOgorICAgICAgLSBpdGVtczoKKyAgICAgICAgLSBlbnVtOgorICAgICAgICAgIC0g
cmVuZXNhcyxyOGE3Nzk1LWNtbQorICAgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk2LWNtbQorICAg
ICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk2NS1jbW0KKyAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5
OTAtY21tCisgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OTk1LWNtbQorICAgICAgICAtIGNvbnN0
OiByZW5lc2FzLHJjYXItZ2VuMy1jbW0KKyAgICAgIC0gaXRlbXM6CisgICAgICAgIC0gY29uc3Q6
IHJlbmVzYXMscmNhci1nZW4yLWNtbQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGNs
b2NrczoKKyAgICBtYXhJdGVtczogMQorCisgIHJlc2V0czoKKyAgICBtYXhJdGVtczogMQorCisg
IHBvd2VyLWRvbWFpbnM6CisgICAgbWF4SXRlbXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0
aWJsZQorICAtIHJlZworICAtIGNsb2NrcworICAtIHJlc2V0cworICAtIHBvd2VyLWRvbWFpbnMK
KworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcjhhNzc5Ni1jcGctbXNzci5oPgorICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9wb3dlci9yOGE3Nzk2LXN5c2MuaD4KKworICAgIGNtbTA6IGNtbUBm
ZWE0MDAwMCB7CisgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc5Ni1jbW0iLAor
ICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLHJjYXItZ2VuMy1jbW0iOworICAgICAgICAg
cmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47CisgICAgICAgICBwb3dlci1kb21haW5zID0g
PCZzeXNjIFI4QTc3OTZfUERfQUxXQVlTX09OPjsKKyAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQ
R19NT0QgNzExPjsKKyAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDcxMT47CisgICAgfTsKLS0KMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
