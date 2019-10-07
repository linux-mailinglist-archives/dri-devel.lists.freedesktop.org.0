Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C861DCEA25
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6A06E5F0;
	Mon,  7 Oct 2019 17:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838EF6E5F0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:08:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BE64B60;
 Mon,  7 Oct 2019 19:08:12 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/panel: nec-nl8048hl11: Fix SPI alias
Date: Mon,  7 Oct 2019 20:07:58 +0300
Message-Id: <20191007170801.27647-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570468094;
 bh=N/mmucB350SX/DP14F3sFCwA5JqU9+oM8mzOXZZ2O4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLZtLdud9IJgHMTLgox+zob/Eb2HUlss+X6PcgyWLKYhKZQOl+042lWkzWfDKnUDL
 QOcFK1alQ+E5TPpc287IcA812yIe05wLr1y90rRH3qcWZxEVnul1odYnTV9jpeyWFO
 2sGC9+8PYgArjk/TKFCP0zQoMGKFBV/9/2WFuFWA=
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 letux-kernel@openphoenux.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmVsLW5lYy1ubDgwNDhobDExIGRyaXZlciBpbmNvcnJlY3RseSBpbmNsdWRlcyB0aGUg
T0YgdmVuZG9yCnByZWZpeCBpbiBpdHMgU1BJIGFsaWFzLiBGaXggaXQsIGFuZCBtb3ZlIHRoZSBt
YW51YWwgYWxpYXMgdG8gYW4gU1BJCm1vZHVsZSBkZXZpY2UgdGFibGUuCgpGaXhlczogZGY0Mzlh
YmU2NTAxICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgTkVDIE5MODA0OEhMMTEgcGFu
ZWwiKQpSZXBvcnRlZC1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29t
PgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5lYy1ubDgwNDho
bDExLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1uZWMt
bmw4MDQ4aGwxMS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5lYy1ubDgwNDhobDEx
LmMKaW5kZXggMjk5YjIxN2M4M2UxLi4yMGYxN2U0NmU2NWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1uZWMtbmw4MDQ4aGwxMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1uZWMtbmw4MDQ4aGwxMS5jCkBAIC0yMzAsOSArMjMwLDE3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG5sODA0OF9vZl9tYXRjaFtdID0gewogCiBNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBubDgwNDhfb2ZfbWF0Y2gpOwogCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNwaV9kZXZpY2VfaWQgbmw4MDQ4X2lkc1tdID0geworCXsgIm5sODA0OGhsMTEiLCAwIH0s
CisJeyAvKiBzZW50aW5lbCAqLyB9Cit9OworCitNT0RVTEVfREVWSUNFX1RBQkxFKHNwaSwgbmw4
MDQ4X2lkcyk7CisKIHN0YXRpYyBzdHJ1Y3Qgc3BpX2RyaXZlciBubDgwNDhfZHJpdmVyID0gewog
CS5wcm9iZQkJPSBubDgwNDhfcHJvYmUsCiAJLnJlbW92ZQkJPSBubDgwNDhfcmVtb3ZlLAorCS5p
ZF90YWJsZQk9IG5sODA0OF9pZHMsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCT0gInBhbmVsLW5l
Yy1ubDgwNDhobDExIiwKIAkJLnBtCT0gJm5sODA0OF9wbV9vcHMsCkBAIC0yNDIsNyArMjUwLDYg
QEAgc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIG5sODA0OF9kcml2ZXIgPSB7CiAKIG1vZHVsZV9z
cGlfZHJpdmVyKG5sODA0OF9kcml2ZXIpOwogCi1NT0RVTEVfQUxJQVMoInNwaTpuZWMsbmw4MDQ4
aGwxMSIpOwogTU9EVUxFX0FVVEhPUigiRXJpayBHaWxsaW5nIDxrb25rZXJzQGFuZHJvaWQuY29t
PiIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJORUMtTkw4MDQ4SEwxMSBEcml2ZXIiKTsKIE1PRFVM
RV9MSUNFTlNFKCJHUEwiKTsKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
