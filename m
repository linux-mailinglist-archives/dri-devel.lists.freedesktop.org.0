Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16924A3286
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3856E31A;
	Fri, 30 Aug 2019 08:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55736E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:25 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 912F420033A;
 Thu, 29 Aug 2019 13:30:24 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 842CB200335;
 Thu, 29 Aug 2019 13:30:24 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D5BD320613;
 Thu, 29 Aug 2019 13:30:23 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 08/14] drm/mxsfb: Add max-memory-bandwidth property for
 MXSFB
Date: Thu, 29 Aug 2019 14:30:09 +0300
Message-Id: <1567078215-31601-9-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVjYXVzZSBvZiBzdGFiaWxpdHkgaXNzdWVzLCB3ZSBtYXkgd2FudCB0byBsaW1pdCB0aGUgbWF4
aW11bSBiYW5kd2lkdGgKcmVxdWlyZWQgYnkgdGhlIE1YU0ZCIChlTENESUYpIGRyaXZlci4KClNp
Z25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KVGVzdGVk
LWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9teHNmYl9kcnYuYyB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5oIHwgIDIgKysKIDIgZmls
ZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9teHNmYl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwpp
bmRleCBmOTViYTYzLi5kODY4NmM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCkBAIC0x
NTgsNiArMTU4LDQ5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBl
cl9mdW5jcyBteHNmYl9tb2RlX2NvbmZpZ19oZWxwZXJzID0gewogCS5hdG9taWNfY29tbWl0X3Rh
aWwgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0sCiB9OwogCitlbnVtIGRybV9t
b2RlX3N0YXR1cyBteHNmYl9waXBlX21vZGVfdmFsaWQoc3RydWN0IGRybV9jcnRjICpjcnRjLAor
CQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKK3sKKwlzdHJ1Y3Qg
ZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUgPQorCQljb250YWluZXJfb2YoY3J0Yywgc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlLCBjcnRjKTsKKwlzdHJ1Y3QgbXhzZmJfZHJtX3By
aXZhdGUgKm14c2ZiID0gZHJtX3BpcGVfdG9fbXhzZmJfZHJtX3ByaXZhdGUocGlwZSk7CisJdTMy
IGJwcDsKKwl1NjQgYnc7CisKKwlpZiAoIXBpcGUtPnBsYW5lLnN0YXRlLT5mYikKKwkJYnBwID0g
MzI7CisJZWxzZQorCQlicHAgPSBwaXBlLT5wbGFuZS5zdGF0ZS0+ZmItPmZvcm1hdC0+ZGVwdGg7
CisKKwlidyA9IG1vZGUtPmNydGNfY2xvY2sgKiAxMDAwOworCWJ3ID0gYncgKiBtb2RlLT5oZGlz
cGxheSAqIG1vZGUtPnZkaXNwbGF5ICogKGJwcCAvIDgpOworCWJ3ID0gZGl2X3U2NChidywgbW9k
ZS0+aHRvdGFsICogbW9kZS0+dnRvdGFsKTsKKworCWlmIChteHNmYi0+bWF4X2J3ICYmIChidyA+
IG14c2ZiLT5tYXhfYncpKQorCQlyZXR1cm4gTU9ERV9CQUQ7CisKKwlyZXR1cm4gTU9ERV9PSzsK
K30KKworc3RhdGljIGludCBteHNmYl9waXBlX2NoZWNrKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3Bs
YXlfcGlwZSAqcGlwZSwKKwkJCSAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0
ZSwKKwkJCSAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpCit7CisJc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0ZS0+ZmI7CisJc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqb2xkX2ZiID0gcGlwZS0+cGxhbmUuc3RhdGUtPmZiOworCisJLyogZm9yY2UgJ21v
ZGVfY2hhbmdlZCcgd2hlbiBmYiBwaXRjaGVzIGNoYW5nZWQsIHNpbmNlCisJICogdGhlIHBpdGNo
IHJlbGF0ZWQgcmVnaXN0ZXJzIGNvbmZpZ3VyYXRpb24gb2YgTENESUYKKwkgKiBjYW4gbm90IGJl
IGRvbmUgd2hlbiBMQ0RJRiBpcyBydW5uaW5nLgorCSAqLworCWlmIChvbGRfZmIgJiYgbGlrZWx5
KCFjcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQpKSB7CisJCWlmIChvbGRfZmItPnBpdGNoZXNbMF0g
IT0gZmItPnBpdGNoZXNbMF0pCisJCQljcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQgPSB0cnVlOwor
CX0KKworCXJldHVybiAwOworfQorCiBzdGF0aWMgdm9pZCBteHNmYl9waXBlX2VuYWJsZShzdHJ1
Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX2Ny
dGNfc3RhdGUgKmNydGNfc3RhdGUsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpw
bGFuZV9zdGF0ZSkKQEAgLTI0NCw2ICsyODcsOCBAQCBzdGF0aWMgdm9pZCBteHNmYl9waXBlX2Rp
c2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSkKIH0KIAog
c3RhdGljIHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcyBteHNmYl9mdW5jcyA9
IHsKKwkubW9kZV92YWxpZAk9IG14c2ZiX3BpcGVfbW9kZV92YWxpZCwKKwkuY2hlY2sgICAgICAg
ICAgPSBteHNmYl9waXBlX2NoZWNrLAogCS5lbmFibGUJCT0gbXhzZmJfcGlwZV9lbmFibGUsCiAJ
LmRpc2FibGUJPSBteHNmYl9waXBlX2Rpc2FibGUsCiAJLnVwZGF0ZQkJPSBteHNmYl9waXBlX3Vw
ZGF0ZSwKQEAgLTI4Myw2ICszMjgsOSBAQCBzdGF0aWMgaW50IG14c2ZiX2xvYWQoc3RydWN0IGRy
bV9kZXZpY2UgKmRybSwgdW5zaWduZWQgbG9uZyBmbGFncykKIAlpZiAoSVNfRVJSKG14c2ZiLT5j
bGtfZGlzcF9heGkpKQogCQlteHNmYi0+Y2xrX2Rpc3BfYXhpID0gTlVMTDsKIAorCW9mX3Byb3Bl
cnR5X3JlYWRfdTMyKGRybS0+ZGV2LT5vZl9ub2RlLCAibWF4LW1lbW9yeS1iYW5kd2lkdGgiLAor
CQkJICAgICAmbXhzZmItPm1heF9idyk7CisKIAlyZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVy
ZW50KGRybS0+ZGV2LCBETUFfQklUX01BU0soMzIpKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5oIGIvZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5oCmluZGV4IDhmYjY1ZDMuLmExNzgxNzMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmgKQEAgLTMyLDYgKzMyLDggQEAgc3RydWN0IG14c2ZiX2Ry
bV9wcml2YXRlIHsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvcgkJKmNvbm5lY3RvcjsKIAlzdHJ1Y3Qg
ZHJtX3BhbmVsCQkqcGFuZWw7CiAJc3RydWN0IGRybV9icmlkZ2UJCSpicmlkZ2U7CisKKwl1MzIJ
CQkJbWF4X2J3OwogfTsKIAogaW50IG14c2ZiX3NldHVwX2NydGMoc3RydWN0IGRybV9kZXZpY2Ug
KmRldik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
