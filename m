Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EFA11AA68
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 13:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC8B6EB2B;
	Wed, 11 Dec 2019 12:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E97F6EB2B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 12:00:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so23747848wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 04:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FAWSeeCPjrUzDAoutApZdK6JxrtnR6mdKHjlpIAdFrw=;
 b=jZ7GJ6k9lc9bqsTdvh60Ihw4sMZ0BnM8qGmwt6MBLt8f3SSgDodAJ1WDNumvShIbd7
 A5Gp1XwTmx+k44sECEty6G57rp4ruKpbvqdO8Aftm+SyT4iNjSJOjQj23MhwNmqtLAhG
 HZFOWqqOwKUsqmSWNYUaheCFL3ZhmKVSLjWp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FAWSeeCPjrUzDAoutApZdK6JxrtnR6mdKHjlpIAdFrw=;
 b=KBorSktSlEWrJ2zM6v1+bWv7XCbxmcZ/MZ1TltCcsexz3pmwVPuyAzhNpGA8LrPMjX
 bmoyaiTULl+cxDlRTzqUvdgWm4Kp1gNgRI/TGFzpqwDI2hWkvXiXvI6wJbXDMOu4Q1rk
 gPT16dJwOygnRhejAsh/5yELuKZ/iR/8RJk8IT5dj5O0K6AeJK0//DsjBBdm2O2h0tQf
 x8VU5d2wp9d3DuAmRyUTrA33QqR7RVqQA+tM81ccIjj4cAF9zL272QYuSzkM25xiBVva
 bervuA82XlgwSnvDDrSrN5EkQGycAbNa/4+TST5g1JUDQxvBcT+qgrJShTe7QYNE77PL
 bluA==
X-Gm-Message-State: APjAAAV6ibLfoehKQr9nI2uwT0VUVtJMH50vg0ckzcGGXUBqF5rSjb8r
 V6iMBlC4XO36ejsp6srBr2bFLzEwwGQ=
X-Google-Smtp-Source: APXvYqzRghRnLZzARavDk9grPW8ZeMbGFf7aEWOInfEBffLEiEtOakul8RSSC5BkjjSyGCj4ETxogg==
X-Received: by 2002:adf:e550:: with SMTP id z16mr3390226wrm.315.1576065607468; 
 Wed, 11 Dec 2019 04:00:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id d10sm1996740wrw.64.2019.12.11.04.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 04:00:06 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/gma500: globle no more!
Date: Wed, 11 Dec 2019 13:00:01 +0100
Message-Id: <20191211120001.1167980-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Z2xvYmxlLCBnb2JsaW4sIG1vYmxpbj8KCkl0J3MgZGVhZCBjb2RlLCB3ZSBsdWNrZWQgb3V0LgoK
Q2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL21kZmxkX2ludGVsX2Rpc3BsYXkuYyB8IDIzIC0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9tZGZsZF9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21k
ZmxkX2ludGVsX2Rpc3BsYXkuYwppbmRleCBiOGJmYjk2MDA4YjguLjRmZmYxMTBjNDkyMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9pbnRlbF9kaXNwbGF5LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9pbnRlbF9kaXNwbGF5LmMKQEAgLTExMywy
NyArMTEzLDYgQEAgc3RhdGljIGludCBwc2JfaW50ZWxfcGFuZWxfZml0dGVyX3BpcGUoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKIAlyZXR1cm4gKHBmaXRfY29udHJvbCA+PiAyOSkgJiAweDM7CiB9
CiAKLXN0YXRpYyBzdHJ1Y3QgZHJtX2RldmljZSBnbG9ibGVfZGV2OwotCi12b2lkIG1kZmxkX19p
bnRlbF9wbGFuZV9zZXRfYWxwaGEoaW50IGVuYWJsZSkKLXsKLQlzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2ID0gJmdsb2JsZV9kZXY7Ci0JaW50IGRzcGNudHJfcmVnID0gRFNQQUNOVFI7Ci0JdTMyIGRz
cGNudHI7Ci0KLQlkc3BjbnRyID0gUkVHX1JFQUQoZHNwY250cl9yZWcpOwotCi0JaWYgKGVuYWJs
ZSkgewotCQlkc3BjbnRyICY9IH5ESVNQUExBTkVfMzJCUFBfTk9fQUxQSEE7Ci0JCWRzcGNudHIg
fD0gRElTUFBMQU5FXzMyQlBQOwotCX0gZWxzZSB7Ci0JCWRzcGNudHIgJj0gfkRJU1BQTEFORV8z
MkJQUDsKLQkJZHNwY250ciB8PSBESVNQUExBTkVfMzJCUFBfTk9fQUxQSEE7Ci0JfQotCi0JUkVH
X1dSSVRFKGRzcGNudHJfcmVnLCBkc3BjbnRyKTsKLX0KLQogc3RhdGljIGludCBjaGVja19mYihz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKIHsKIAlpZiAoIWZiKQpAQCAtMTY0LDggKzE0Myw2
IEBAIHN0YXRpYyBpbnQgbWRmbGRfX2ludGVsX3BpcGVfc2V0X2Jhc2Uoc3RydWN0IGRybV9jcnRj
ICpjcnRjLCBpbnQgeCwgaW50IHksCiAJdTMyIGRzcGNudHI7CiAJaW50IHJldDsKIAotCW1lbWNw
eSgmZ2xvYmxlX2RldiwgZGV2LCBzaXplb2Yoc3RydWN0IGRybV9kZXZpY2UpKTsKLQogCWRldl9k
YmcoZGV2LT5kZXYsICJwaXBlID0gMHgleC5cbiIsIHBpcGUpOwogCiAJLyogbm8gZmIgYm91bmQg
Ki8KLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
