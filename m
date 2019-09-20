Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A1B988E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52B66FDD4;
	Fri, 20 Sep 2019 20:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39A46FD76
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 17:29:28 +0000 (UTC)
From: megous@megous.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Remove redundant of_device_is_available check
Date: Fri, 20 Sep 2019 19:29:14 +0200
Message-Id: <20190920172914.4015180-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1569000566; bh=yFh3SHDAWhDFWZ5U5l/Fjokt0AcfkOIyuWq4AwQu/1I=;
 h=From:To:Cc:Subject:Date:From;
 b=BurnvNZgHpqgi/eynnP37W8qjm5smxV9mFxNb/P2HCRa1yCfRpDl/aVWnCjBqF1xT
 7VrjpaRFq8lr99bIywaCbc875zzJoqbP65yjBYuwuKPx/BQYfhLNzvY05CbKN8U96U
 ykzSiij1086wXyyLCickKTAEqPUclG7xSWCH74Do=
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
Cc: Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CgpUaGlzIGNoZWNrIGlzIGFs
cmVhZHkgcGVyZm9ybWVkIGJ5IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZS4gTm8KbmVlZCB0byBy
ZXBlYXQgaXQgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGNhbGwuCgpTaWduZWQtb2ZmLWJ5OiBPbmRy
ZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX29m
LmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMKaW5k
ZXggNDNkODlkZDU5YzZiLi4wY2E1ODgwM2JhNDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fb2YuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMKQEAgLTI0NywxNyArMjQ3
LDEyIEBAIGludCBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoY29uc3Qgc3RydWN0IGRldmlj
ZV9ub2RlICpucCwKIAkJKnBhbmVsID0gTlVMTDsKIAogCXJlbW90ZSA9IG9mX2dyYXBoX2dldF9y
ZW1vdGVfbm9kZShucCwgcG9ydCwgZW5kcG9pbnQpOwogCWlmICghcmVtb3RlKQogCQlyZXR1cm4g
LUVOT0RFVjsKIAotCWlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKSB7Ci0JCW9m
X25vZGVfcHV0KHJlbW90ZSk7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KLQogCWlmIChwYW5lbCkg
ewogCQkqcGFuZWwgPSBvZl9kcm1fZmluZF9wYW5lbChyZW1vdGUpOwogCQlpZiAoIUlTX0VSUigq
cGFuZWwpKQogCQkJcmV0ID0gMDsKIAkJZWxzZQogCQkJKnBhbmVsID0gTlVMTDsKLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
