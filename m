Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2BE61B13
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FAA89B20;
	Mon,  8 Jul 2019 07:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F4689D4B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:06:46 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0FF48C0009;
 Sat,  6 Jul 2019 14:06:42 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 01/19] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
Date: Sat,  6 Jul 2019 16:07:28 +0200
Message-Id: <20190706140746.29132-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
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
ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0ICAgICAg
ICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4wODNkYzEzNTdiMmIKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNt
bS50eHQKQEAgLTAsMCArMSwyNSBAQAorKiBSZW5lc2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQg
TW9kdWxlIChDTU0pCisKK1JlbmVzYXMgUi1DYXIgaW1hZ2UgZW5oYW5jZW1lbnQgbW9kdWxlIGNv
bm5lY3RlZCB0byBSLUNhciBEVSB2aWRlbyBjaGFubmVscy4KKworUmVxdWlyZWQgcHJvcGVydGll
czoKKyAtIGNvbXBhdGlibGU6IHNoYWxsIGJlIG9uZSBvZjoKKyAgIC0gInJlbmVzYXMscmNhci1n
ZW4zLWNtbSIKKyAgIC0gInJlbmVzYXMscmNhci1nZW4yLWNtbSIKKworIC0gcmVnOiB0aGUgYWRk
cmVzcyBiYXNlIGFuZCBsZW5ndGggb2YgdGhlIG1lbW9yeSBhcmVhIHdoZXJlIENNTSBjb250cm9s
CisgICByZWdpc3RlcnMgYXJlIG1hcHBlZCB0by4KKworIC0gY2xvY2tzOiBwaGFuZGxlIGFuZCBj
bG9jay1zcGVjaWZpZXIgcGFpciB0byB0aGUgQ01NIGZ1bmN0aW9uYWwgY2xvY2sKKyAgIHN1cHBs
aWVyLgorCitFeGFtcGxlOgorLS0tLS0tLS0KKworCWNtbTA6IGNtbUBmZWE0MDAwMCB7CisJCWNv
bXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLWdlbjMtY21tIjsKKwkJcmVnID0gPDAgMHhmZWE0MDAw
MCAwIDB4MTAwMD47CisJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9BTFdBWVNf
T04+OworCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47CisJCXJlc2V0cyA9IDwmY3BnIDcx
MT47CisJfTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
