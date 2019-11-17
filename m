Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85127FF8FD
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285A76E2C4;
	Sun, 17 Nov 2019 11:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998966E1F9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 709E328F857
Received: by earth.universe (Postfix, from userid 1000)
 id 2A9DF3C0CA8; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 28/42] drm/dsi: add MIPI_DSI_MODE_ULPS_IDLE
Date: Sun, 17 Nov 2019 03:40:14 +0100
Message-Id: <20191117024028.2233-29-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFNJIGNvbW1hbmQgbW9kZSBwYW5lbHMgYXJlIHNlbGYtcmVmcmVzaGluZyBkaXNwbGF5cywgdGhh
dApjYW4gYmUgdXBkYXRlZCB2ZXJ5IHJhcmVseSBmb3Igc3RhdGljIGltYWdlcy4gRm9yIHRoaXMg
a2luZApvZiBzY2VuYXJpbyBzb21lIHBhbmVscyBzdXBwb3J0LCB0aGF0IHRoZSBEU0kgYnVzIHN3
aXRjaGVzCmludG8gVUxQUyBtb2RlIHVudGlsIHRoZSBwYW5lbCBuZWVkcyB0byBiZSByZWZyZXNo
ZWQuCgpUaGlzIGlzIHByb2JsZW1hdGljIG9uIHNvbWUgcGFuZWxzLCBzbyBpbnRyb2R1Y2UgYSBm
bGFnIHRvCnNpZ25hbCB0aGUgRFNJIGhvc3QgaW1wbGVtZW50YXRpb24gdGhhdCB0aGUgcGFuZWwg
YWxsb3dzCmdvaW5nIGludG8gVUxQUyBtb2RlLgoKU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJl
aWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Ci0tLQogaW5jbHVkZS9kcm0v
ZHJtX21pcGlfZHNpLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmggYi9pbmNsdWRlL2RybS9kcm1f
bWlwaV9kc2kuaAppbmRleCAxM2NmMmFlNTlmNmMuLjVmMmUzZTZmYjAxMyAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNp
LmgKQEAgLTEzMSw2ICsxMzEsOCBAQCBzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqb2ZfZmluZF9taXBp
X2RzaV9ob3N0X2J5X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpub2RlKTsKICNkZWZpbmUgTUlQ
SV9EU0lfQ0xPQ0tfTk9OX0NPTlRJTlVPVVMJQklUKDEwKQogLyogdHJhbnNtaXQgZGF0YSBpbiBs
b3cgcG93ZXIgKi8KICNkZWZpbmUgTUlQSV9EU0lfTU9ERV9MUE0JCUJJVCgxMSkKKy8qIGFsbG93
IGdvaW5nIGludG8gVUxQUyBtb2RlIHdoaWxlIGNvbW1hbmQgbW9kZSBwYW5lbCBpcyBub3QgdXBk
YXRlZCAqLworI2RlZmluZSBNSVBJX0RTSV9NT0RFX1VMUFNfSURMRQkJQklUKDEyKQogCiBlbnVt
IG1pcGlfZHNpX3BpeGVsX2Zvcm1hdCB7CiAJTUlQSV9EU0lfRk1UX1JHQjg4OCwKLS0gCjIuMjQu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
