Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2A9C6C9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4D289B0C;
	Mon, 26 Aug 2019 00:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CE86E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:50:40 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3D5D2C0003;
 Sun, 25 Aug 2019 13:50:35 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 01/14] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
Date: Sun, 25 Aug 2019 15:51:41 +0200
Message-Id: <20190825135154.11488-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, mark.rutland@arm.com,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 robh+dt@kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFIt
Q2FyIERpc3BsYXkKVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KCkNNTSBpcyB0aGUgaW1h
Z2UgZW5oYW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCmNo
YW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCku
CgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+
Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0ICAgICAgICAgIHwgMzMg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yZW5lc2FzLGNtbS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi5iYzU5OWI2OWMyNzgKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKQEAg
LTAsMCArMSwzMyBAQAorKiBSZW5lc2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChD
TU0pCisKK1JlbmVzYXMgUi1DYXIgaW1hZ2UgZW5oYW5jZW1lbnQgbW9kdWxlIGNvbm5lY3RlZCB0
byBSLUNhciBEVSB2aWRlbyBjaGFubmVscy4KKworUmVxdWlyZWQgcHJvcGVydGllczoKKyAtIGNv
bXBhdGlibGU6IHNoYWxsIGJlIG9uZSBvciBtb3JlIG9mIHRoZSBmb2xsb3dpbmc6CisgICAtICJy
ZW5lc2FzLGNtbS1yOGE3Nzk1IjogZm9yIFI4QTc3OTUgKFItQ2FyIEgzKSBjb21wYXRpYmxlIENN
TS4KKyAgIC0gInJlbmVzYXMsY21tLXI4YTc3OTYiOiBmb3IgUjhBNzc5NiAoUi1DYXIgTTMtVykg
Y29tcGF0aWJsZSBDTU0uCisgICAtICJyZW5lc2FzLGNtbS1yOGE3Nzk2NSI6IGZvciBSOEE3Nzk2
NSAoUi1DYXIgTTMtTikgY29tcGF0aWJsZSBDTU0uCisgICAtICJyZW5lc2FzLGNtbS1yOGE3Nzk5
MCI6IGZvciBSOEE3Nzk5MCAoUi1DYXIgRTMpIGNvbXBhdGlibGUgQ01NLgorICAgLSAicmVuZXNh
cyxjbW0tcjhhNzc5OTUiOiBmb3IgUjhBNzc5OTUgKFItQ2FyIEQzKSBjb21wYXRpYmxlIENNTS4K
KyAgIC0gInJlbmVzYXMscmNhci1nZW4zLWNtbSI6IGZvciBhIGdlbmVyaWMgUi1DYXIgR2VuMyBj
b21wYXRpYmxlIENNTS4KKyAgIC0gInJlbmVzYXMscmNhci1nZW4yLWNtbSI6IGZvciBhIGdlbmVy
aWMgUi1DYXIgR2VuMiBjb21wYXRpYmxlIENNTS4KKworICAgV2hlbiB0aGUgZ2VuZXJpYyBjb21w
YXRpYmxlIHN0cmluZyBpcyBzcGVjaWZpZWQsIHRoZSBTb0Mtc3BlY2lmaWMKKyAgIHZlcnNpb24g
Y29ycmVzcG9uZGluZyB0byB0aGUgcGxhdGZvcm0gc2hvdWxkIGJlIGxpc3RlZCBmaXJzdC4KKwor
IC0gcmVnOiB0aGUgYWRkcmVzcyBiYXNlIGFuZCBsZW5ndGggb2YgdGhlIG1lbW9yeSBhcmVhIHdo
ZXJlIENNTSBjb250cm9sCisgICByZWdpc3RlcnMgYXJlIG1hcHBlZCB0by4KKworIC0gY2xvY2tz
OiBwaGFuZGxlIGFuZCBjbG9jay1zcGVjaWZpZXIgcGFpciB0byB0aGUgQ01NIGZ1bmN0aW9uYWwg
Y2xvY2sKKyAgIHN1cHBsaWVyLgorCitFeGFtcGxlOgorLS0tLS0tLS0KKworCWNtbTA6IGNtbUBm
ZWE0MDAwMCB7CisJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5NiI7CisJCXJlZyA9
IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3
OTZfUERfQUxXQVlTX09OPjsKKwkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTE+OworCQlyZXNl
dHMgPSA8JmNwZyA3MTE+OworCX07Ci0tCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
