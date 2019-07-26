Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C531B761BD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD066ECC4;
	Fri, 26 Jul 2019 09:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C936ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 12041FB04;
 Fri, 26 Jul 2019 11:21:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwHT3MJlLXlW; Fri, 26 Jul 2019 11:21:45 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 47E3346AA1; Fri, 26 Jul 2019 11:21:43 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/panel: jh057n00900: Print error code on all
 DRM_DEV_ERROR()s
Date: Fri, 26 Jul 2019 11:21:43 +0200
Message-Id: <85e8899f8091c7466283d42a510042ef55882c97.1564132646.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564132646.git.agx@sigxcpu.org>
References: <cover.1564132646.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW9zdCBvZiB0aGVtIGhhZCB0aGVzZSBhbHJlYWR5IGJ1dCB0d28gbWVyZSBtaXNzaW5nLiBUaGlz
IGVhc2VzCmRlYnVnZ2luZy4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2ln
eGNwdS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3
bjAwOTAwLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9j
a3RlY2gtamgwNTduMDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVj
aC1qaDA1N24wMDkwMC5jCmluZGV4IGNjODk4MzFlMzBhNi4uYTE4MmNhN2RlNzAxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwpA
QCAtMTI3LDcgKzEyNyw3IEBAIHN0YXRpYyBpbnQgamgwNTduX2luaXRfc2VxdWVuY2Uoc3RydWN0
IGpoMDU3biAqY3R4KQogCiAJcmV0ID0gbWlwaV9kc2lfZGNzX2V4aXRfc2xlZXBfbW9kZShkc2kp
OwogCWlmIChyZXQgPCAwKSB7Ci0JCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGV4aXQg
c2xlZXAgbW9kZVxuIik7CisJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGV4aXQgc2xl
ZXAgbW9kZTogJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7CiAJfQogCS8qIFBhbmVsIGlzIG9w
ZXJhdGlvbmFsIDEyMCBtc2VjIGFmdGVyIHJlc2V0ICovCkBAIC0zNTUsNyArMzU1LDkgQEAgc3Rh
dGljIGludCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCiAJcmV0
ID0gbWlwaV9kc2lfYXR0YWNoKGRzaSk7CiAJaWYgKHJldCA8IDApIHsKLQkJRFJNX0RFVl9FUlJP
UihkZXYsICJtaXBpX2RzaV9hdHRhY2ggZmFpbGVkLiBJcyBob3N0IHJlYWR5P1xuIik7CisJCURS
TV9ERVZfRVJST1IoZGV2LAorCQkJICAgICAgIm1pcGlfZHNpX2F0dGFjaCBmYWlsZWQgKCVkKS4g
SXMgaG9zdCByZWFkeT9cbiIsCisJCQkgICAgICByZXQpOwogCQlkcm1fcGFuZWxfcmVtb3ZlKCZj
dHgtPnBhbmVsKTsKIAkJcmV0dXJuIHJldDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
