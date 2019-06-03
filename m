Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E72D3321D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 16:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503D089244;
	Mon,  3 Jun 2019 14:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AF589244
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 14:28:56 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r18so26183282edo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 07:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uNAeS51QRUwciVaj0qUAWn++Wcyjuws4KaNbVtCgqIg=;
 b=Pfa36fdJz1zaMaT0JXyKfW5nz7xjgsumUhwaIbCMW0cKR81aIGCMY6Y+Be9XgwLOzd
 bcr98Ccj93t25cyesPtFUx5j6Rc+I9lDP5WhCin208cerjc8JP7FMuqhK7DC+XUGw9Zo
 NzajCOdkt74jMxbvaTDVnllzWczwD2i0y6X7AbCrvLeboyzAxv2KD66JDQOU3VWul4+7
 jqhpzK6Z56Ypotpjduia0wtfQ+HJ53uCxiwVdU/NqqMTpjvlFJXxWxXY5kyf71RRj5Gy
 EXZA9db/Ix8Nw4jW8F0GiSI3FUN9hmXrjP2kp93eFq6ja53+5W41uS6rWlD2wBPEjsfW
 OCQg==
X-Gm-Message-State: APjAAAU3PiLddSYu4olVtArAAd6PqgofzTK3uXWFTwrpTbwyHSwxEBM4
 DJVG4J38+7G7vxsEdrzC+ckOmgcw4rw=
X-Google-Smtp-Source: APXvYqxr8JNKelZSPvLm8lUlcvEZ+sComgPTxPSLY12mHjF6SZvHXDzXvSb6ohXT05mDxOg9PhV6eg==
X-Received: by 2002:a50:aeaf:: with SMTP id e44mr29643846edd.239.1559572134834; 
 Mon, 03 Jun 2019 07:28:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z3sm2572707edh.71.2019.06.03.07.28.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 07:28:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/docs: More links for implicit/explicit fencing.
Date: Mon,  3 Jun 2019 16:28:48 +0200
Message-Id: <20190603142848.26487-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uNAeS51QRUwciVaj0qUAWn++Wcyjuws4KaNbVtCgqIg=;
 b=AFGi04VVp/3xB5QuV/dCaezEZmGv3eXvARp3zR/Suj92Trwok3JFbCc3Zu9ax6ETD6
 u0wsQfO4ikMpKTylUmPXjCc9LbOXZk39DD6e16lisk4GY5a5NAF93fDeuGRvTVLjd/0S
 CaK4vSj/GNBvraRDnKF5J/1jBW7BVDP+9eBec=
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2F0b21pY19zZXRfZmVuY2VfZm9yX3BsYW5lKCkgY29udGFpbnMgdGhlIG1haW4gZGlzY3Vz
c2lvbiBmcm9tIGEKZHJpdmVyIHBvdiwgbGluayB0byB0aGF0IGZyb20gbW9yZSBwbGFjZXMuCgpD
YzogUGVra2EgUGFhbGFuZW4gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGlt
ZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5A
cG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9m
cmFtZWJ1ZmZlcl9oZWxwZXIuYyB8IDYgKysrKysrCiBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
ZnJhbWVidWZmZXJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZl
cl9oZWxwZXIuYwppbmRleCA2ZmQ0OGVmZTI4OGMuLjY3OTEyNDU5NjNjMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKQEAgLTI4NCw2ICsyODQsOSBA
QCBFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2RpcnR5KTsKICAqIFRo
ZXJlIGlzIG5vIG5lZWQgZm9yICZkcm1fcGxhbmVfaGVscGVyX2Z1bmNzLmNsZWFudXBfZmIgaG9v
ayBmb3Igc2ltcGxlCiAgKiBnZW0gYmFzZWQgZnJhbWVidWZmZXIgZHJpdmVycyB3aGljaCBoYXZl
IHRoZWlyIGJ1ZmZlcnMgYWx3YXlzIHBpbm5lZCBpbgogICogbWVtb3J5LgorICoKKyAqIFNlZSBk
cm1fYXRvbWljX3NldF9mZW5jZV9mb3JfcGxhbmUoKSBmb3IgYSBkaXNjdXNzaW9uIG9mIGltcGxp
Y2l0IGFuZAorICogZXhwbGljaXQgZmVuY2luZyBpbiBhdG9taWMgbW9kZXNldCB1cGRhdGVzLgog
ICovCiBpbnQgZHJtX2dlbV9mYl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAog
CQkJICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkKQEAgLTMxNCw2ICszMTcsOSBAQCBF
WFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX2ZiX3ByZXBhcmVfZmIpOwogICogJmRtYV9idWYgYXR0
YWNoZWQsIGV4dHJhY3RzIHRoZSBleGNsdXNpdmUgZmVuY2UgYW5kIGF0dGFjaGVzIGl0IHRvIHBs
YW5lCiAgKiBzdGF0ZSBmb3IgdGhlIGF0b21pYyBoZWxwZXIgdG8gd2FpdCBvbi4gRHJpdmVycyBj
YW4gdXNlIHRoaXMgYXMgdGhlaXIKICAqICZkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcy5w
cmVwYXJlX2ZiIGNhbGxiYWNrLgorICoKKyAqIFNlZSBkcm1fYXRvbWljX3NldF9mZW5jZV9mb3Jf
cGxhbmUoKSBmb3IgYSBkaXNjdXNzaW9uIG9mIGltcGxpY2l0IGFuZAorICogZXhwbGljaXQgZmVu
Y2luZyBpbiBhdG9taWMgbW9kZXNldCB1cGRhdGVzLgogICovCiBpbnQgZHJtX2dlbV9mYl9zaW1w
bGVfZGlzcGxheV9waXBlX3ByZXBhcmVfZmIoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBl
ICpwaXBlLAogCQkJCQkgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSkK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3Bs
YW5lLmgKaW5kZXggNjA3OGM3MDBkOWJhLi5jZDU5MDNhZDMzZjcgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtL2RybV9wbGFuZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCkBAIC02OSw3
ICs2OSw3IEBAIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgewogCSAqCiAJICogT3B0aW9uYWwgZmVu
Y2UgdG8gd2FpdCBmb3IgYmVmb3JlIHNjYW5uaW5nIG91dCBAZmIuIFRoZSBjb3JlIGF0b21pYwog
CSAqIGNvZGUgd2lsbCBzZXQgdGhpcyB3aGVuIHVzZXJzcGFjZSBpcyB1c2luZyBleHBsaWNpdCBm
ZW5jaW5nLiBEbyBub3QKLQkgKiB3cml0ZSB0aGlzIGRpcmVjdGx5IGZvciBhIGRyaXZlcidzIGlt
cGxpY2l0IGZlbmNlLCB1c2UKKwkgKiB3cml0ZSB0aGlzIGZpZWxkIGRpcmVjdGx5IGZvciBhIGRy
aXZlcidzIGltcGxpY2l0IGZlbmNlLCB1c2UKIAkgKiBkcm1fYXRvbWljX3NldF9mZW5jZV9mb3Jf
cGxhbmUoKSB0byBlbnN1cmUgdGhhdCBhbiBleHBsaWNpdCBmZW5jZSBpcwogCSAqIHByZXNlcnZl
ZC4KIAkgKgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
