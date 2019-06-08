Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C599E39BA6
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 10:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F589274;
	Sat,  8 Jun 2019 08:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0EE8926E;
 Sat,  8 Jun 2019 08:03:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s21so3676082lji.8;
 Sat, 08 Jun 2019 01:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IfV+G63JJlLOlIqabsoTSbqilWzEZcliFqAQtvXE27w=;
 b=IqwATjykivfgEXE/aFIeo/0Sf+9iRURyULZv+dTfEu+74q3lNkHrA+kde9xAD1+dw1
 dWkQbiIDTzHtPXlRlrRDlxa13qmyd4Xg6tJuRvgxtgqvMNIiitRUe+XD9FEzNn69ugpM
 hoN5XEzi1sH9IY0uHmA8YEvA4teaOQnaXbsOGbzd1tXSLGToUWpk4403ENSYCOX7Jonn
 oCxQcIXrER0SIHpY2N/ZZBSJX5OPH/Frg8+50MkN/6E/VwJutwx4nJ7fYlZWq3Yuylt7
 4WkCH4yl/w6XR9xN3SxrbrHmr1zqQViNbwABdZTeIb9K7f2w2B235nHbUqy/oof+vBDz
 ovaQ==
X-Gm-Message-State: APjAAAWTTeX6I21wvAGbVwzRKFpw9+a3bGUBqIHlFDKXP/rABvn5l19Z
 0/I8B0DN7PYSz/wkb/zP9rNHbOOHu4k=
X-Google-Smtp-Source: APXvYqwC+jtfL5yTiB4YD4s2/e1pu5hyaGxbzDzJTtqSvBm//R8kuO60jvIR5gve/9ACcsNJQJYZ5w==
X-Received: by 2002:a2e:9f41:: with SMTP id v1mr23953655ljk.66.1559980986228; 
 Sat, 08 Jun 2019 01:03:06 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 f4sm756851ljm.13.2019.06.08.01.03.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:03:05 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 4/7] drm/radeon: drop drmP.h from header files
Date: Sat,  8 Jun 2019 10:02:38 +0200
Message-Id: <20190608080241.4958-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608080241.4958-1-sam@ravnborg.org>
References: <20190608080241.4958-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfV+G63JJlLOlIqabsoTSbqilWzEZcliFqAQtvXE27w=;
 b=vJHvmt6VN4VTb5So8o8m38mkVX7yjB90aVI779Dq1UDOi3m1sqT/8YS+l9CcASEJOP
 wu2jPVg4cKHr4kMnfTL4WPCF/mNDP4L1AU42dOo0evlmkstUSdd4dqoEkpsK4qQR0FNd
 Yk3VZqy0QT1EmTbn7jSN5kN8P/kkKhJrbsMhQZTCCUp3nvRj+wVtNvM6F8icyQIgnd+G
 3O/+NmAeU6CSZl+fKYspFUzqpNnN8V4SYAL+OQjE0+oAHECPNhL1swb1ZPI4YlH1edyO
 9xthkrp1TqkdwOYnVWJe6Q1m6QYRbxF7jm05RYd4RooKmYX5Q2zMMC3JYh7ttata4dEG
 O2Rg==
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gZWFzZSBjb252ZXJzaW9uIG9mIC5jIGZpbGVzIGRyb3AgaW5jbHVkZSBvZgpkcm1QLmggZnJv
bSBhbGwgaGVhZGVyIGZpbGVzLgpBbmQgZml4LXVwIGJ1aWxkIGVycm9ycyBjYXVzZWQgYnkgdGhp
cy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIkRhdmlkIChDaHVuTWluZykgWmhv
dSIgPERhdmlkMS5aaG91QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9hdG9tLmMgICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
YXRvbS5oICAgICAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3RyYWNl
LmggfCAyIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b20uYyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vYXRvbS5jCmluZGV4IGFjOThhZDU2MTg3MC4uMmMyNzYyN2I2NjU5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b20uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2F0b20uYwpAQCAtMjUsOCArMjUsMTAgQEAKICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KKwogI2luY2x1ZGUgPGFzbS91bmFsaWduZWQuaD4KIAorI2luY2x1ZGUgPGRybS9kcm1fZGV2
aWNlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV91dGlsLmg+CiAKICNkZWZpbmUgQVRPTV9ERUJVRwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmggYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL2F0b20uaAppbmRleCA2ZDAxNGRkYjZiNzguLjM2NGI4OTVlN2ViYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9hdG9tLmgKQEAgLTI2LDcgKzI2LDYgQEAKICNkZWZpbmUgQVRPTV9ICiAKICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgotI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAKICNkZWZpbmUgQVRP
TV9CSU9TX01BR0lDCQkweEFBNTUKICNkZWZpbmUgQVRPTV9BVElfTUFHSUNfUFRSCTB4MzAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3RyYWNlLmggYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90cmFjZS5oCmluZGV4IDBkODRiOGFhZmFiMy4uZjczNDZk
YjMzYjg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90cmFjZS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3RyYWNlLmgKQEAgLTYsOCArNiw2
IEBACiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC90cmFjZXBvaW50
Lmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgotCiAjdW5kZWYgVFJBQ0VfU1lTVEVNCiAjZGVm
aW5lIFRSQUNFX1NZU1RFTSByYWRlb24KICNkZWZpbmUgVFJBQ0VfSU5DTFVERV9GSUxFIHJhZGVv
bl90cmFjZQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
