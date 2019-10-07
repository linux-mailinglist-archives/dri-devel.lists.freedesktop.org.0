Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ADECEA28
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5286E60D;
	Mon,  7 Oct 2019 17:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2683A6E60D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:08:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE34FB90;
 Mon,  7 Oct 2019 19:08:14 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/panel: sony-acx565akm: Fix SPI alias
Date: Mon,  7 Oct 2019 20:07:59 +0300
Message-Id: <20191007170801.27647-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570468096;
 bh=8mHvl+FnZn8l2sRe/56j9JYbdI6y/5hKzQ+ECvS49QY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X56RAxqKG/YcjzEZYO90dRb4hzK9T5glzDOrDe8nqkHU34OpC+fo9JIFnRWtKTw6k
 JD7nNFwt75UrJUO0/NumLiheU7XkxJaFM7ToKnsPkF8LKIZ8TTqnIIhSigouy0WihU
 xEmowpiHT0lyx7RJRkZvWfIgta8wo/Rk+W2xDrN8=
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

VGhlIHBhbmVsLXNvbnktYWN4NTY1YWttIGRyaXZlciBpbmNvcnJlY3RseSBpbmNsdWRlcyB0aGUg
T0YgdmVuZG9yCnByZWZpeCBpbiBpdHMgU1BJIGFsaWFzLiBGaXggaXQsIGFuZCBtb3ZlIHRoZSBt
YW51YWwgYWxpYXMgdG8gYW4gU1BJCm1vZHVsZSBkZXZpY2UgdGFibGUuCgpGaXhlczogMWM4ZmMz
ZjBjNWQyICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgU29ueSBBQ1g1NjVBS00gcGFu
ZWwiKQpSZXBvcnRlZC1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29t
PgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4NTY1
YWttLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zb255
LWFjeDU2NWFrbS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4NTY1YWtt
LmMKaW5kZXggMzA1MjU5YjU4NzY3Li4zZDViOWM0ZjY4ZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zb255LWFjeDU2NWFrbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zb255LWFjeDU2NWFrbS5jCkBAIC02ODQsOSArNjg0LDE3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFjeDU2NWFrbV9vZl9tYXRjaFtdID0gewogCiBN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBhY3g1NjVha21fb2ZfbWF0Y2gpOwogCitzdGF0aWMgY29u
c3Qgc3RydWN0IHNwaV9kZXZpY2VfaWQgYWN4NTY1YWttX2lkc1tdID0geworCXsgImFjeDU2NWFr
bSIsIDAgfSwKKwl7IC8qIHNlbnRpbmVsICovIH0KK307CisKK01PRFVMRV9ERVZJQ0VfVEFCTEUo
c3BpLCBhY3g1NjVha21faWRzKTsKKwogc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIGFjeDU2NWFr
bV9kcml2ZXIgPSB7CiAJLnByb2JlCQk9IGFjeDU2NWFrbV9wcm9iZSwKIAkucmVtb3ZlCQk9IGFj
eDU2NWFrbV9yZW1vdmUsCisJLmlkX3RhYmxlCT0gYWN4NTY1YWttX2lkcywKIAkuZHJpdmVyCQk9
IHsKIAkJLm5hbWUJPSAicGFuZWwtc29ueS1hY3g1NjVha20iLAogCQkub2ZfbWF0Y2hfdGFibGUg
PSBhY3g1NjVha21fb2ZfbWF0Y2gsCkBAIC02OTUsNyArNzAzLDYgQEAgc3RhdGljIHN0cnVjdCBz
cGlfZHJpdmVyIGFjeDU2NWFrbV9kcml2ZXIgPSB7CiAKIG1vZHVsZV9zcGlfZHJpdmVyKGFjeDU2
NWFrbV9kcml2ZXIpOwogCi1NT0RVTEVfQUxJQVMoInNwaTpzb255LGFjeDU2NWFrbSIpOwogTU9E
VUxFX0FVVEhPUigiTm9raWEgQ29ycG9yYXRpb24iKTsKIE1PRFVMRV9ERVNDUklQVElPTigiU29u
eSBBQ1g1NjVBS00gTENEIFBhbmVsIERyaXZlciIpOwogTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwot
LSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
