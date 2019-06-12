Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A799D42057
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 11:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414C8935B;
	Wed, 12 Jun 2019 09:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E04989330
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:13:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a14so22708467edv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 02:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5S4yM6CNcjd0uPYb2/Kc0K9Ti/d4MMqvgonSv9XhZEM=;
 b=heyi3hQ/eroz3BHIBSoe55VHN8YTB0gxHgL1wAlOLZvDexHJ9/gNPAdX9cj1U6BgeI
 5Nq2TDPynjAZGGoCZ6QIVwhHF6vubtk633oI7boSdX3ikDIPq4HkyRfOOBKDodzZIJ36
 ke2xPKnbPAclHX43Chfky0iMLACgmYXLwcdx9UklOLejEMEMEKXhRNhUuYqKwBYB4F68
 n7qeNdk7eRywvejSIlT9PG8YYQlPIq1VM8xiCHUvVBIsHa+17ohVwk/LbO7tKBT6tBiC
 NhR7QzbAtMN5bGkDOaz2YSx0qUMcVzjfwuW/qxOI+pe4Cr6BLlyZt8jjuh7K4AYuqoqe
 gUIQ==
X-Gm-Message-State: APjAAAU+5MY4jK36vrt45J9eIHSWML+dukQm4RjD4PqefOoqQa8OZcHJ
 mGWD+rVbX0HSdyb4NfZslojIxcjGTuM=
X-Google-Smtp-Source: APXvYqwjwmy6gEzbMxul5rNTlebutMU+nDe3yoIamYqPTBPlUYQp/fU30xchAO4HIPTMMWjmFKpGqg==
X-Received: by 2002:a05:6402:609:: with SMTP id
 n9mr31162102edv.159.1560330780481; 
 Wed, 12 Jun 2019 02:13:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 93sm4441477edk.84.2019.06.12.02.12.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 02:12:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/ast: Drop fb_debug_enter/leave
Date: Wed, 12 Jun 2019 11:12:53 +0200
Message-Id: <20190612091253.26413-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612091253.26413-1-daniel.vetter@ffwll.ch>
References: <20190612091253.26413-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5S4yM6CNcjd0uPYb2/Kc0K9Ti/d4MMqvgonSv9XhZEM=;
 b=fsb9IXjGwPuPiAN0EUyU4a6X8Roj7szLWmqGTMNqfN8EeJit+LADqq9DjRb3VPoJBM
 AE4xXHb0UvP3t4z+F/6rYYQgyLBfEHnuiNTiO+D1mSjoH99zoWNHLlr2KwEj5UaQ6HXw
 h52860Igk3IJ0M2QCOy/DcxYXLEJwSzNEF7t0=
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, YueHaibing <yuehaibing@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YXN0IGRvZXNuJ3QgaW1wbGVtZW50IHRoZSBtb2RlX3NldF9iYXNlX2F0b21pYyBob29rIHRoaXMg
d291bGQgbmVlZCwKc28gdGhpcyBpcyBkZWFkIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVk
QHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpD
YzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KQ2M6IFNhbSBCb2Jyb2ZmIDxzYm9icm9mZkBsaW51eC5pYm0uY29tPgpDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogWXVlSGFpYmluZyA8eXVlaGFpYmlu
Z0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMgfCAyIC0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIuYwppbmRleCAwNWY0
NTIyMmI3MDIuLjU0ODBjYWVjZGU4NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jCkBAIC0xNjYsOCArMTY2
LDYgQEAgc3RhdGljIHN0cnVjdCBmYl9vcHMgYXN0ZmJfb3BzID0gewogCS5mYl9wYW5fZGlzcGxh
eSA9IGRybV9mYl9oZWxwZXJfcGFuX2Rpc3BsYXksCiAJLmZiX2JsYW5rID0gZHJtX2ZiX2hlbHBl
cl9ibGFuaywKIAkuZmJfc2V0Y21hcCA9IGRybV9mYl9oZWxwZXJfc2V0Y21hcCwKLQkuZmJfZGVi
dWdfZW50ZXIgPSBkcm1fZmJfaGVscGVyX2RlYnVnX2VudGVyLAotCS5mYl9kZWJ1Z19sZWF2ZSA9
IGRybV9mYl9oZWxwZXJfZGVidWdfbGVhdmUsCiB9OwogCiBzdGF0aWMgaW50IGFzdGZiX2NyZWF0
ZV9vYmplY3Qoc3RydWN0IGFzdF9mYmRldiAqYWZiZGV2LAotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
