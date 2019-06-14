Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776946A5B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9B789415;
	Fri, 14 Jun 2019 20:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD52E89452
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:40 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so5223567eds.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUJkrBHPGMD0Jak0hv15UuXYYOT/ay4M5iA7uP6K2TM=;
 b=oxMERjbTTP21st5uOYTaLwtf/ExgHT8e7iiULOJXkchzJ8vSch59nwMGfCQWRBdY8L
 69gt1L1IObiFy1ooEK7YMwCXz14L2xy6QQZrxnzsgbH7n+pS6CmRIHzRv741shAdjcES
 K5v7G+j42dsowXSg75V3rBwr+Qc/5dl/cr3PIgNDsAA+BFR2waTZf9vgT3tjPNnpskdz
 3S4udVhbRzbpBkYWiqNuZwjZVw4XjKW1ZWS+HTc7pMtK/uv+WfK2RTMxLj3/z2o/a77m
 c6EOHcgj6wxs7pxRoJdN0idycql5PgglePnmf76Qh8psANcEVUZr5dEIO5QlMARm0HDj
 gK+w==
X-Gm-Message-State: APjAAAWFXreu/a4SgQC1HXY+Z2fHtk0gG8H8J1OQgy8MtvkWO5BPk8mz
 zUN7aT3AgQasqhtJTzwJMnfsJreDmNw=
X-Google-Smtp-Source: APXvYqyBmbA9fgjT93k8eJavmdSLhiYk/y6FVvZuoiG7XOai8lro1qS6KycJASXiRs5PrvmL91wkSg==
X-Received: by 2002:a50:8825:: with SMTP id b34mr25674476edb.22.1560544599178; 
 Fri, 14 Jun 2019 13:36:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/59] drm/exynos: Drop drm_gem_prime_export
Date: Fri, 14 Jun 2019 22:35:30 +0200
Message-Id: <20190614203615.12639-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUJkrBHPGMD0Jak0hv15UuXYYOT/ay4M5iA7uP6K2TM=;
 b=irhEijl3uz1ccHxtPEy4kMwnVw1beSjXcXiHBVt/guTgdFhCDeaSwRU3YaR3aKXJiW
 Jzw8hwyS8SHMCIg/hyvS/d3wjueJ9Xh/vjsOCJWDYo9nOYIWcSD2B/3veRSqrrxBv4WM
 O+FhIWINHJAKp/VJXK60dm32VnYow4ogo0D6Y=
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
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4gV2UgY2FuJ3QgZG8gdGhlIHNhbWUgb24gdGhlIGltcG9ydCBz
aWRlLCBkdWUgdG8KdGhlIGV4eW5vc19kcm0tPmRtYV9kZXYgbm90IG5lY2Vzc2FyaWx5IG1hdGNo
aW5nIHRoZSBvdmVyYWxsIGRybQpkZXZpY2UuCgpBc2lkZTogV291bGQgYmUgcmVhbGx5IG5pY2Ug
dG8gc3dpdGNoIHRoZSBvdGhlcnMgb3ZlciB0bwpkcm1fZ2VtX29iamVjdF9mdW5jcy4KClNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSW5r
aSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpDYzogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5z
aGltQHNhbXN1bmcuY29tPgpDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNv
bT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBLdWtq
aW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgpDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBs
aW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHJ2LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jCmluZGV4IGU0MzY0MGZjNDJk
My4uNGQyNzAzOTBlYmEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5j
CkBAIC0xMjQsNyArMTI0LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGV4eW5vc19kcm1f
ZHJpdmVyID0gewogCS5kdW1iX2NyZWF0ZQkJPSBleHlub3NfZHJtX2dlbV9kdW1iX2NyZWF0ZSwK
IAkucHJpbWVfaGFuZGxlX3RvX2ZkCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCiAJLnBy
aW1lX2ZkX3RvX2hhbmRsZQk9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAotCS5nZW1fcHJp
bWVfZXhwb3J0CT0gZHJtX2dlbV9wcmltZV9leHBvcnQsCiAJLmdlbV9wcmltZV9pbXBvcnQJPSBl
eHlub3NfZHJtX2dlbV9wcmltZV9pbXBvcnQsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUJPSBl
eHlub3NfZHJtX2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV9pbXBvcnRfc2df
dGFibGUJPSBleHlub3NfZHJtX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
