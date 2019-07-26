Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551076708
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C144F6ED46;
	Fri, 26 Jul 2019 13:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1D46ED45
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E1017FB03;
 Fri, 26 Jul 2019 15:14:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1mgCVL2meXc; Fri, 26 Jul 2019 15:14:43 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2ADC346AA2; Fri, 26 Jul 2019 15:14:40 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/panel: jh057n00900: Print error code on all
 DRM_DEV_ERROR()s
Date: Fri, 26 Jul 2019 15:14:38 +0200
Message-Id: <6b237a570cb368dc4471fb8feb3a0441813cd576.1564146727.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564146727.git.agx@sigxcpu.org>
References: <cover.1564146727.git.agx@sigxcpu.org>
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
eGNwdS5vcmc+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgfCA2
ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTdu
MDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkw
MC5jCmluZGV4IGZlZDI0YzUxZDQ4Yi4uMTAzN2EyMDFiNGJiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwpAQCAtMTI3LDcgKzEy
Nyw3IEBAIHN0YXRpYyBpbnQgamgwNTduX2luaXRfc2VxdWVuY2Uoc3RydWN0IGpoMDU3biAqY3R4
KQogCiAJcmV0ID0gbWlwaV9kc2lfZGNzX2V4aXRfc2xlZXBfbW9kZShkc2kpOwogCWlmIChyZXQg
PCAwKSB7Ci0JCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGV4aXQgc2xlZXAgbW9kZVxu
Iik7CisJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGV4aXQgc2xlZXAgbW9kZTogJWRc
biIsIHJldCk7CiAJCXJldHVybiByZXQ7CiAJfQogCS8qIFBhbmVsIGlzIG9wZXJhdGlvbmFsIDEy
MCBtc2VjIGFmdGVyIHJlc2V0ICovCkBAIC0zNTEsNyArMzUxLDkgQEAgc3RhdGljIGludCBqaDA1
N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCiAJcmV0ID0gbWlwaV9kc2lf
YXR0YWNoKGRzaSk7CiAJaWYgKHJldCA8IDApIHsKLQkJRFJNX0RFVl9FUlJPUihkZXYsICJtaXBp
X2RzaV9hdHRhY2ggZmFpbGVkLiBJcyBob3N0IHJlYWR5P1xuIik7CisJCURSTV9ERVZfRVJST1Io
ZGV2LAorCQkJICAgICAgIm1pcGlfZHNpX2F0dGFjaCBmYWlsZWQgKCVkKS4gSXMgaG9zdCByZWFk
eT9cbiIsCisJCQkgICAgICByZXQpOwogCQlkcm1fcGFuZWxfcmVtb3ZlKCZjdHgtPnBhbmVsKTsK
IAkJcmV0dXJuIHJldDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
