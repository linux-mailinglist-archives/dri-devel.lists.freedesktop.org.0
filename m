Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C7B97DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 21:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382146E0BC;
	Fri, 20 Sep 2019 19:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A666E0BC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 19:36:11 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id p11so844949ybc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 12:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4PSjVvrwcPyiyPNMdMmKLWfVB71rQ09KRU+ERhcpajc=;
 b=gjdgx5t45f7fNU/q/308gSRRbW0cBvNiLtOSKmBsBMx8qqZPgX3A3Pgt/DTRzMZPlO
 dF7/aHvczR4kGGHRuXNvKA3G9EaiTHC/tDy9S6uNiH4tdBdqRyLqVW5IuQZB+L3SBel/
 Gz5ebMpwwRvHMU00X2CokAmSbzid8ySl8rSfelk9Gd1lJV0bZ8j7FOa6qmzJznHUlIlO
 X9jg0YTaFKf9JU4KP+eiwdzYmc88lPBJPhKD6vUUnPPOudoUcQQmal5CAyzztqMWOVtr
 OwFW3ms8zMjcTshQs9kIaqY7QiHKaA6m8MbH1poU8jYkjKQ1JBp5MLHONBd97tkAsZ9s
 VMyg==
X-Gm-Message-State: APjAAAX1k7Pw7gIfiRGAARXrQr6h/0X4NiH4/a7RxB1G3PDpaH+OUIP2
 tOU4mGvibvZNA81oZobv8Hf83Mler739tA==
X-Google-Smtp-Source: APXvYqzeoQWT++CqoLDRbSTXE0IswtqVXXnGTklT+ktQlUGI782cNpBKEz/HsmVEw9qKQwiuLrA+vw==
X-Received: by 2002:a25:6004:: with SMTP id u4mr12644483ybb.415.1569008170494; 
 Fri, 20 Sep 2019 12:36:10 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g1sm655126ywk.53.2019.09.20.12.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 12:36:10 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] Documentation/gpu: Fix no structured comments warning for
 drm_gem_ttm_helper.h
Date: Fri, 20 Sep 2019 15:35:52 -0400
Message-Id: <20190920193558.89815-2-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190920193558.89815-1-sean@poorly.run>
References: <20190920193558.89815-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4PSjVvrwcPyiyPNMdMmKLWfVB71rQ09KRU+ERhcpajc=;
 b=CphLNVPabbhkOs4mKMD7OYc420VKFdDRCIxdCC7HvM6afy87hU52kmc0gffqfJPlqg
 O0e791FvAB10FhGg9wLDm2Exz5+kdm5WZaQWeWZjhWOrhniEZCPl57QvPKy9Gg2JZdlI
 zjpiHCqQx92kcREvJNTYrTMz40y7pHIY2fwohuKNRk52Zt4a9wOQMA3GzMH3CAcT/KT/
 i87HOPCv4vyntKkjhznaNW4hxJ8DuoOeUsrbSWnel2eei7J2YaC2AgAuwiIlBozoddQX
 krqm7krPZB+DwrmWa7BNysIaeg8xWqHbGZaR7uGfwEeU1hHHQt32qe/K9qOC+dm/y24m
 mweA==
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
Cc: Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcwppbmNsdWRlL2Ry
bS9kcm1fZ2VtX3R0bV9oZWxwZXIuaDoxOiB3YXJuaW5nOiBubyBzdHJ1Y3R1cmVkIGNvbW1lbnRz
IGZvdW5kCgpGaXhlczogZmY1NDBiNzZmMTRhICgiZHJtL3R0bTogYWRkIGRybSBnZW0gdHRtIGhl
bHBlcnMsIHN0YXJ0aW5nIHdpdGggZHJtX2dlbV90dG1fcHJpbnRfaW5mbygpIikKQ2M6IEdlcmQg
SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJv
bWl1bS5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdCB8IDMgLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dw
dS9kcm0tbW0ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdAppbmRleCA5OWQ1NjAx
NWUwNzcuLjU5NjE5Mjk2Yzg0YiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1t
LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0CkBAIC00MDYsOSArNDA2LDYg
QEAgR0VNIFRUTSBIZWxwZXIgRnVuY3Rpb25zIFJlZmVyZW5jZQogLi4ga2VybmVsLWRvYzo6IGRy
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYwogICAgOmRvYzogb3ZlcnZpZXcKIAot
Li4ga2VybmVsLWRvYzo6IGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oCi0gICA6aW50
ZXJuYWw6Ci0KIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVs
cGVyLmMKICAgIDpleHBvcnQ6CiAKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdv
b2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
