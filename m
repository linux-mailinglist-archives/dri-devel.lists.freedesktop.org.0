Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670A61B16
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938A789B48;
	Mon,  8 Jul 2019 07:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB9D89D4B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:06:51 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A5F85C000C;
 Sat,  6 Jul 2019 14:06:47 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
Date: Sat,  6 Jul 2019 16:07:30 +0200
Message-Id: <20190706140746.29132-4-jacopo+renesas@jmondi.org>
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

VXBkYXRlIHRoZSAndnNwcycgcHJvcGVydHkgaW4gdGhlIFItQ2FyIEdlbjMgU29DIGRldmljZSB0
cmVlIGZpbGVzIHRvCm1hdGNoIHdoYXQncyBpbiBpbiB0aGUgZG9jdW1lbnRhdGlvbiBleGFtcGxl
LgoKU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3Jn
PgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC5kdHNpIHwgMiArLQog
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaSAgfCAyICstCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRzaSB8IDIgKy0KIGFyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpIHwgMiArLQogYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I4YTc3OTk1LmR0c2kgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc0YzAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRj
MC5kdHNpCmluZGV4IDNmODZkYjE5OWRiZi4uZTY0M2Y5ZDNjMTAyIDEwMDY0NAotLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAuZHRzaQpAQCAtMTgwNyw3ICsxODA3LDcgQEAKIAkJCWNs
b2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwKIAkJCQkgPCZjcGcgQ1BHX01PRCA3MjM+OwogCQkJ
Y2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIjsKLQkJCXZzcHMgPSA8JnZzcGQwIDAgJnZzcGQx
IDA+OworCQkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD47CiAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwogCiAJCQlwb3J0cyB7CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUu
ZHRzaQppbmRleCAwOTc1MzhjYzRiMWYuLjQzMmY0MDM2YThhOCAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpCkBAIC0zMDk4LDcgKzMwOTgsNyBAQAogCQkJCSA8JmNw
ZyBDUEdfTU9EIDcyMj4sCiAJCQkJIDwmY3BnIENQR19NT0QgNzIxPjsKIAkJCWNsb2NrLW5hbWVz
ID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwotCQkJdnNwcyA9IDwmdnNwZDAgMCAm
dnNwZDEgMCAmdnNwZDIgMCAmdnNwZDAgMT47CisJCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3Bk
MSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAK
IAkJCXBvcnRzIHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3
Nzk2NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kKaW5k
ZXggMjU1NGIxNzQyZGJmLi5iNzAxYWViNGY0MzggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3Nzk2NS5kdHNpCkBAIC0yNDU2LDcgKzI0NTYsNyBAQAogCQkJY2xvY2stbmFtZXMg
PSAiZHUuMCIsICJkdS4xIiwgImR1LjMiOwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAotCQkJ
dnNwcyA9IDwmdnNwZDAgMCAmdnNwZDEgMCAmdnNwZDAgMT47CisJCQl2c3BzID0gPCZ2c3BkMCAw
PiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMCAxPjsKIAogCQkJcG9ydHMgewogCQkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OTkwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQppbmRl
eCA1NmNiNTY2ZmZhMDkuLjc5ZGI1NDQxYjdlNyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTkwLmR0c2kKQEAgLTE3NjQsNyArMTc2NCw3IEBACiAJCQljbG9ja3MgPSA8JmNw
ZyBDUEdfTU9EIDcyND4sCiAJCQkJIDwmY3BnIENQR19NT0QgNzIzPjsKIAkJCWNsb2NrLW5hbWVz
ID0gImR1LjAiLCAiZHUuMSI7Ci0JCQl2c3BzID0gPCZ2c3BkMCAwICZ2c3BkMSAwPjsKKwkJCXZz
cHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAog
CQkJcG9ydHMgewpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OTk1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaQppbmRl
eCA1YmYzYWYyNDZlMTQuLjQ5YTExYjRmNTViZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTk1LmR0c2kKQEAgLTEwMDEsNyArMTAwMSw3IEBACiAJCQljbG9ja3MgPSA8JmNw
ZyBDUEdfTU9EIDcyND4sCiAJCQkJIDwmY3BnIENQR19NT0QgNzIzPjsKIAkJCWNsb2NrLW5hbWVz
ID0gImR1LjAiLCAiZHUuMSI7Ci0JCQl2c3BzID0gPCZ2c3BkMCAwICZ2c3BkMSAwPjsKKwkJCXZz
cHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAog
CQkJcG9ydHMgewotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
