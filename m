Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88FEF41C2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1AD6F883;
	Fri,  8 Nov 2019 08:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863166E219
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 69862290AB3
Received: by jupiter.universe (Postfix, from userid 1000)
 id A28D848009C; Thu,  7 Nov 2019 18:23:53 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCHv1 1/2] drm/panel: simple: Add support for AUO G121EAN01.4 panel
Date: Thu,  7 Nov 2019 18:23:30 +0100
Message-Id: <20191107172331.14362-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cc: kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRpbWluZ3MgZm9yIHRoZSBBVU8gRzEyMUVBTjAxLjQgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5
OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggMjhmYTZiYTdiNzY3Li40NmNhNTlkYjY4MTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTgwNiw2ICs4MDYsMjkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19nMTA0c24wMiA9IHsKIAl9LAogfTsK
IAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGF1b19nMTIxZWFuMDFfbW9k
ZSA9IHsKKwkuY2xvY2sgPSA2NjcwMCwKKwkuaGRpc3BsYXkgPSAxMjgwLAorCS5oc3luY19zdGFy
dCA9IDEyODAgKyA1OCwKKwkuaHN5bmNfZW5kID0gMTI4MCArIDU4ICsgOCwKKwkuaHRvdGFsID0g
MTI4MCArIDU4ICsgOCArIDcwLAorCS52ZGlzcGxheSA9IDgwMCwKKwkudnN5bmNfc3RhcnQgPSA4
MDAgKyA2LAorCS52c3luY19lbmQgPSA4MDAgKyA2ICsgNCwKKwkudnRvdGFsID0gODAwICsgNiAr
IDQgKyAxMCwKKwkudnJlZnJlc2ggPSA2MCwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFu
ZWxfZGVzYyBhdW9fZzEyMWVhbjAxID0geworCS5tb2RlcyA9ICZhdW9fZzEyMWVhbjAxX21vZGUs
CisJLm51bV9tb2RlcyA9IDEsCisJLmJwYyA9IDgsCisJLnNpemUgPSB7CisJCS53aWR0aCA9IDI2
MSwKKwkJLmhlaWdodCA9IDE2MywKKwl9LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkaXNw
bGF5X3RpbWluZyBhdW9fZzEzM2hhbjAxX3RpbWluZ3MgPSB7CiAJLnBpeGVsY2xvY2sgPSB7IDEz
NDAwMDAwMCwgMTQxMjAwMDAwLCAxNDkwMDAwMDAgfSwKIAkuaGFjdGl2ZSA9IHsgMTkyMCwgMTky
MCwgMTkyMCB9LApAQCAtMzExNCw2ICszMTM3LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0g
ImF1byxnMTA0c24wMiIsCiAJCS5kYXRhID0gJmF1b19nMTA0c24wMiwKKwl9LCB7CisJCS5jb21w
YXRpYmxlID0gImF1byxnMTIxZWFuMDEuNCIsCisJCS5kYXRhID0gJmF1b19nMTIxZWFuMDEsCiAJ
fSwgewogCQkuY29tcGF0aWJsZSA9ICJhdW8sZzEzM2hhbjAxIiwKIAkJLmRhdGEgPSAmYXVvX2cx
MzNoYW4wMSwKLS0gCjIuMjQuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
