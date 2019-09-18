Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94DB6D3A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BC16FE88;
	Wed, 18 Sep 2019 20:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9933C6FE81
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 20:07:37 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id n11so419500ywn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 13:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiaJmJ1e3sHaCqkTn5HiVi3b0bBIurM6Wwqjpxr8ZRs=;
 b=M4R4CQf3x8i4OG1lwIgVT6NjbZ1JASi2jr4mO6l7AFO6pLwNhpqgWRQOaojREdl705
 rNBM9fJuiIyf7IUTTS0LuG81vhKTnWsSJSxrfGVdvWvSan7zVP7Qb9Kr8Lhl6I4mE0lf
 LInME5vPyhO5mK2ACb7pLfbLMw1DrRSs4Imjyl9/DyfQ6i3WyZCd48F67uU1kROh3Ylp
 dhRjPSFC9PZbEPpwHVZK3jFCIhkBLOmpSPD8USS1lYQPZv4jq8PjT/q+dbp7iHliThjb
 JdZ7SGWVJZZ8QpuCEOr3NHNUFxS8FiMnejRpl7MGJe5T7sAMMJrlAZ4G368Xs9uKFjvm
 2o8w==
X-Gm-Message-State: APjAAAWEzyOa7W8Iq0uTdXMtHCvJu+HusphtjyyHZz2mcTBJBditi4Az
 Ic6xeXM9Ijh+1eboxYjJFUpR9287VJ07Jg==
X-Google-Smtp-Source: APXvYqw/v6Qvy6wUqfT5IrW2pdMNgjv75j3QS1Gy9gkmNsYUmh4mCqe5M0vKMwxNw0DYsLiy7PLrtg==
X-Received: by 2002:a81:554b:: with SMTP id j72mr4866215ywb.190.1568837256583; 
 Wed, 18 Sep 2019 13:07:36 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 207sm1429317ywu.106.2019.09.18.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 13:07:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm: Fix kerneldoc and remove unused struct member in
 self_refresh helper
Date: Wed, 18 Sep 2019 16:07:28 -0400
Message-Id: <20190918200734.149876-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiaJmJ1e3sHaCqkTn5HiVi3b0bBIurM6Wwqjpxr8ZRs=;
 b=KCDCWYAFuMvWmkCKuQtYiT+tux8TpY0AOKQhdacSe3+LWLcUSm32Bmxw689FyZidyF
 bqpYI3ds9fMGO9FYd0tcpbhZj/v/ZdoDeXTH8nBHNCxw658PgQhP7zmSt2PRraRmhmsG
 kL8TgQo0KID0J5BbDNvA1Wf6rldRWs1g8Bc4woeOvRch8p3uEm9i76aoXfkh6vdzEcsd
 Hl4oFV2rnTk9wreMbFfTYR9KHI0h0Ih2DgEgLYhI7cI8ARFGT8zBMVxbULza2g9R7Rsx
 4/XOoAPGUxG9025HIdriOH7KDtOvAZ8+EhIpN0HuJ7Yv2xROSPcpaiLSzhuYdVqq8FBb
 VhDA==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, jekarl@iki.fi, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpBcnRpZmFjdHMgb2YgcHJl
dmlvdXMgcmV2aXNpb25zLgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0u
b3JnPgpMaW5rIHRvIHYxOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
bXNnaWQvMjAxOTA5MTcyMDA0NDMuNjQ0ODEtMS1zZWFuQHBvb3JseS5ydW4KCkNoYW5nZXMgaW4g
djI6Ci0gTm9uZQotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5j
IHwgMSAtCiBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYwppbmRleCA0Yjk0MjRhOGYxZjEuLjkw
OTVjZWJmMjE0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hf
aGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMK
QEAgLTUzLDcgKzUzLDYgQEAKIHN0cnVjdCBkcm1fc2VsZl9yZWZyZXNoX2RhdGEgewogCXN0cnVj
dCBkcm1fY3J0YyAqY3J0YzsKIAlzdHJ1Y3QgZGVsYXllZF93b3JrIGVudHJ5X3dvcms7Ci0Jc3Ry
dWN0IGRybV9hdG9taWNfc3RhdGUgKnNhdmVfc3RhdGU7CiAJdW5zaWduZWQgaW50IGVudHJ5X2Rl
bGF5X21zOwogfTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NydGMuaCBiL2luY2x1
ZGUvZHJtL2RybV9jcnRjLmgKaW5kZXggN2UyOTYzY2FkNTQzLi43NDJiMzEwNDM4OTggMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMu
aApAQCAtMTEwNyw3ICsxMTA3LDcgQEAgc3RydWN0IGRybV9jcnRjIHsKIAkvKioKIAkgKiBAc2Vs
Zl9yZWZyZXNoX2RhdGE6IEhvbGRzIHRoZSBzdGF0ZSBmb3IgdGhlIHNlbGYgcmVmcmVzaCBoZWxw
ZXJzCiAJICoKLQkgKiBJbml0aWFsaXplZCB2aWEgZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXJfcmVn
aXN0ZXIoKS4KKwkgKiBJbml0aWFsaXplZCB2aWEgZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXJfaW5p
dCgpLgogCSAqLwogCXN0cnVjdCBkcm1fc2VsZl9yZWZyZXNoX2RhdGEgKnNlbGZfcmVmcmVzaF9k
YXRhOwogfTsKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
