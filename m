Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528073C9F5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 13:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A72890F7;
	Tue, 11 Jun 2019 11:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C201890F7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:29:06 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so4907730eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 04:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KWiSkWv/DkQjaVk1HaiNhqwbIu727aF1qlGWvhFG594=;
 b=AMrB9/CTAMmcOR6OmIrpb8XhUN+0rVI2U42LSy+9ViFvqpZ/UO/oWd2XOnvAP0kw9s
 SXblsEGeVpxwtlTtimILonNVH+MOqNFrQB+fiSuN3RTqzvucH7/EVwjZIVk8KpS9+xch
 wu4RkQ5CCJitpFnL+x64cPD5sq/rZ4S5PwZfr8GoTc8pvkJxEjeoYXpjikJ/zRPO2ywc
 eSJJpIPuVAF04Jlq0tT2AsZqq15gUQ4xvoJX1snIumzFPEcdrLo8luQRO6HNNzCSICht
 /VVJy/wqi4mn00EVcOjUNlLfj4mEO4HIgS3tXcwnlx6VzHJhsgpzy2RwBSpum1T6XFrZ
 QjbA==
X-Gm-Message-State: APjAAAV3ra1K2DouK+UQ9ggGhYn0m83mAVL/efPP7Sbs+YCEED7NOtxQ
 0hxdQe57vKzm2psuQWXVZdX/DRYzNy0=
X-Google-Smtp-Source: APXvYqyI4/K5WMxqov4d43jeJHlEso7Rt7Mrx8FqYsZI2yoEd2sX6tC0wmDJjWDgWo57RI0oL6edeQ==
X-Received: by 2002:a50:8bcc:: with SMTP id n12mr57208517edn.6.1560252544942; 
 Tue, 11 Jun 2019 04:29:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m16sm2209247ejj.57.2019.06.11.04.29.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 04:29:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/fb: document dirty helper better
Date: Tue, 11 Jun 2019 13:28:59 +0200
Message-Id: <20190611112859.16375-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KWiSkWv/DkQjaVk1HaiNhqwbIu727aF1qlGWvhFG594=;
 b=iNxcLzipxnIPrjN+4Jl7kDD1SCdZB35yt3GiA5m8Cjw3oIqdLBjV6AJV8kaUv6kJqt
 xD2UKwlMroqOuwmLPStTtUfcRFar2RDu9Fj3DjVEY4jWvpdAxqHwynl+dNglvGr0Pvuv
 wGkGOIRMtxxO+Ai/n1rAa3M06V54YgTJ2sEdk=
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
Cc: David Lechner <david@lechnology.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwYXJlbnRseSBsaXR0bGUgbm9uZSBmYWN0IHRoYXQgdGhlcmUncyBubyBuZWVkIHRvIGhhbmQt
cm9sbCB5b3VyIG93bgphbnltb3JlLiBDYydpbmcgYSBidW5jaCBvZiBkcml2ZXIgcGVvcGxlIHdo
byBtaWdodCB3YW50IHRvIGtub3cgdGhpcwp0b28uCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Z21haWwuY29tPgpDYzogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxh
Ym9yYS5jb20+CkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwg
PHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpD
YzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+CkNjOiBOb3JhbGYgVHLDuG5u
ZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9mcmFtZWJ1ZmZlci5oIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZnJh
bWVidWZmZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9mcmFtZWJ1ZmZlci5oCmluZGV4IGMyMzAxNjc0
OGUzZi4uYzBlMDI1NmUzZTk4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZnJhbWVidWZm
ZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZnJhbWVidWZmZXIuaApAQCAtODcsNiArODcsOSBA
QCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIHsKIAkgKiBmb3IgbW9yZSBpbmZvcm1hdGlv
biBhcyBhbGwgdGhlIHNlbWFudGljcyBhbmQgYXJndW1lbnRzIGhhdmUgYSBvbmUgdG8KIAkgKiBv
bmUgbWFwcGluZyBvbiB0aGlzIGZ1bmN0aW9uLgogCSAqCisJICogQXRvbWljIGRyaXZlcnMgc2hv
dWxkIHVzZSBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiKCkgdG8gaW1wbGVtZW50CisJICogdGhp
cyBob29rLgorCSAqCiAJICogUkVUVVJOUzoKIAkgKgogCSAqIDAgb24gc3VjY2VzcyBvciBhIG5l
Z2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
