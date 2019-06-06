Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D83857D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A5289ABE;
	Fri,  7 Jun 2019 07:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BCE8934F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:59 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E9F422000A;
 Thu,  6 Jun 2019 14:21:55 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 09/20] arm64: dts: renesas: r8a7796: Add CMM units
Date: Thu,  6 Jun 2019 16:22:09 +0200
Message-Id: <20190606142220.1392-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIE0zLVcgZGV2aWNlIHRyZWUgYW5kIHJlZmVy
ZW5jZSB0aGVtIGZyb20KdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCgpT
aWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0t
LQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaSB8IDI1ICsrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaQppbmRleCBjZGY3ODQ4OTljZjguLjJl
MTg5MWQ5ZDMyMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OTYuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpCkBA
IC0yNjEwLDYgKzI2MTAsMzAgQEAKIAkJCXJlbmVzYXMsZmNwID0gPCZmY3B2aTA+OwogCQl9Owog
CisJCWNtbTA6IGNtbUBmZWE0MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdl
bjMiOworCQkJcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNw
ZyBDUEdfTU9EIDcxMT47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTZfUERfQUxX
QVlTX09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47CisJCX07CisKKwkJY21tMTogY21tQGZl
YTUwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tZ2VuMyI7CisJCQlyZWcgPSA8
MCAweGZlYTUwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzEwPjsK
KwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9BTFdBWVNfT04+OworCQkJcmVz
ZXRzID0gPCZjcGcgNzEwPjsKKwkJfTsKKworCQljbW0yOiBjbW1AZmVhNjAwMDAgeworCQkJY29t
cGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1nZW4zIjsKKwkJCXJlZyA9IDwwIDB4ZmVhNjAwMDAgMCAw
eDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDk+OworCQkJcG93ZXItZG9tYWlu
cyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MDk+
OworCQl9OworCiAJCWNzaTIwOiBjc2kyQGZlYTgwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyOGE3Nzk2LWNzaTIiOwogCQkJcmVnID0gPDAgMHhmZWE4MDAwMCAwIDB4MTAwMDA+OwpA
QCAtMjc2Myw2ICsyNzg3LDcgQEAKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAKIAkJCXZzcHMg
PSA8JnZzcGQwICZ2c3BkMSAmdnNwZDI+OworCQkJY21tcyA9IDwmY21tMCAmY21tMSAmY21tMj47
CiAKIAkJCXBvcnRzIHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
