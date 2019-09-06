Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900B6AD3A9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AB6897E4;
	Mon,  9 Sep 2019 07:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1115F89190
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 13:53:27 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 976AAFF809;
 Fri,  6 Sep 2019 13:53:23 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu,
 VenkataRajesh.Kalakodima@in.bosch.com
Subject: [PATCH v4 1/9] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
Date: Fri,  6 Sep 2019 15:54:28 +0200
Message-Id: <20190906135436.10622-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
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
Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCAgICAgICAgIHwgNjQg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yZW5lc2FzLGNtbS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45ZTU5MjI2ODljZDcKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1s
CkBAIC0wLDAgKzEsNjQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKyVZ
QU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkv
cmVuZXNhcyxjbW0ueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUmVuZXNhcyBSLUNhciBDb2xvciBNYW5hZ2VtZW50
IE1vZHVsZSAoQ01NKQorCittYWludGFpbmVyczoKKyAgLSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CisgIC0gS2llcmFuIEJpbmdoYW0gPGtpZXJh
bi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KKyAgLSBKYWNvcG8gTW9uZGkgPGph
Y29wbytyZW5lc2FzQGptb25kaS5vcmc+CisKK2Rlc2NyaXB0aW9uOiB8KworICBSZW5lc2FzIFIt
Q2FyIGNvbG9yIG1hbmFnZW1lbnQgbW9kdWxlIGNvbm5lY3RlZCB0byBSLUNhciBEVSB2aWRlbyBj
aGFubmVscy4KKyAgSXQgcHJvdmlkZXMgaW1hZ2UgZW5oYW5jZW1lbnQgZnVuY3Rpb25zIHN1Y2gg
YXMgMS1EIGxvb2stdXAgdGFibGVzIChMVVQpLAorICAzLUQgbG9vay11cCB0YWJsZXMgKENNVSks
IDFELWhpc3RvZ3JhbSBnZW5lcmF0aW9uIChIR08pLCBhbmQgY29sb3IKKyAgc3BhY2UgY29udmVy
c2lvbiAoQ1NDKS4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAg
ICAgIC0gZW51bToKKyAgICAgICAgLSByZW5lc2FzLHI4YTc3OTUtY21tCisgICAgICAgIC0gcmVu
ZXNhcyxyOGE3Nzk2LWNtbQorICAgICAgICAtIHJlbmVzYXMscjhhNzc5NjUtY21tCisgICAgICAg
IC0gcmVuZXNhcyxyOGE3Nzk5MC1jbW0KKyAgICAgICAgLSByZW5lc2FzLHI4YTc3OTk1LWNtbQor
ICAgICAgLSBlbnVtOgorICAgICAgICAtIHJlbmVzYXMscmNhci1nZW4zLWNtbQorICAgICAgICAt
IHJlbmVzYXMscmNhci1nZW4yLWNtbQorICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9j
a3M6CisgICAgbWF4SXRlbXM6IDEKKworICByZXNldHM6CisgICAgbWF4SXRlbXM6IDEKKworICBw
b3dlci1kb21haW5zOgorICAgIG1heEl0ZW1zOiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGli
bGUKKyAgLSByZWcKKyAgLSBjbG9ja3MKKyAgLSByZXNldHMKKyAgLSBwb3dlci1kb21haW5zCisK
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3OTYtY3BnLW1zc3IuaD4KKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcG93ZXIvcjhhNzc5Ni1zeXNjLmg+CisKKyAgICBjbW0wOiBjbW1AZmVh
NDAwMDAgeworICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OTYtY21tIjsKKyAg
ICAgICAgIHJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworICAgICAgICAgcG93ZXItZG9t
YWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47CisgICAgICAgICBjbG9ja3MgPSA8
JmNwZyBDUEdfTU9EIDcxMT47CisgICAgICAgICByZXNldHMgPSA8JmNwZyA3MTE+OworICAgIH07
Ci0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
