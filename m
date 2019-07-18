Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9986D1AE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54BF6E438;
	Thu, 18 Jul 2019 16:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1566C6E434;
 Thu, 18 Jul 2019 16:15:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m8so27902057lji.7;
 Thu, 18 Jul 2019 09:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6MYIEn1ZPyuv1rXYHIstqwkz6PcLGLc7Ica5A/O2ta8=;
 b=R+2uhOCgrKzKRGfQxcmkUwJT3Nk245WN64aPoKrqkJdplHThdl4tO9A6qbtkT/IuBW
 7Xn29GuLBXfZHNgQlKVHfGhUm1jqZbmcmQ5t7KN2krZNygA+pUgWqajmAql9cm55NThs
 hd+KUe2IoPKiaIIxpiWp1w++c6mUKRT05YDEPSrzOkfcevkbQlJQGA3Hjrh/RySRKt4w
 tpC5XgYo/1W10AodNABnR9BxflqMzj/fKhJjE6OIzwujB6tkXi4fQtuMlYtovjdWgMyq
 06tS8or9WulhnYnCmjH7qom60mEbGzWhaq0g/G7Qp9Udn0Dl4v1RROQ8fNXldpQCTG/c
 9uJQ==
X-Gm-Message-State: APjAAAWGan27rgO/CmBC4E8KUKN10uc618u3QpUyhFbnU6FJ+/q/WpjL
 BzY7hUMi1xwodvvmULxTUK4L6/iTj5zcNQ==
X-Google-Smtp-Source: APXvYqx2GdlPCoRvteVmwbMwCMh5PJuLakxwccuByFw+yBBnrjbiYfadk2aOmQ7u2DxEu65vuBdQrA==
X-Received: by 2002:a2e:8ed2:: with SMTP id e18mr24703434ljl.235.1563466529166; 
 Thu, 18 Jul 2019 09:15:29 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 03/11] drm: drop uapi dependency from drm_vblank.h
Date: Thu, 18 Jul 2019 18:14:59 +0200
Message-Id: <20190718161507.2047-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MYIEn1ZPyuv1rXYHIstqwkz6PcLGLc7Ica5A/O2ta8=;
 b=l/+A5TefNobm66FT7NA+1L1326lmg05N3R1te0STjlI/DicLKKwWdKIY2ffs2mhBOL
 kkjv9qFYw15vXqqFFAU9sEJM8CKG+KSw7PRGlqcLJa/9F7LsquNb3BHtsONIORKzC2qd
 N7+NAPnu749BDYCKNMo1fmjSOX1joYwHLHnffqp/TAgyjt/VDreMIqOFsazjOz5yvMRS
 qJhujeZDJuAY0Chs5hTRgGU3dzpNox/cPHJRbdEmZHk21I10l1L6lzfKzsmdsDEy0zN6
 yA3s3GZcX62oNEzKWMAHA3TfZUlL7L1P2nP6AYCTPrKLyMJ5Hj2RrA65pTnKp2PnEYRt
 Nf4A==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX3ZibGFuay5oIGluY2x1ZGVkIHVhcGkvZHJtL2RybS5oLgpJdCB0dXJucyBvdXQgdGhpcyBp
bmNsdWRlIHdhcyBub3QgcmVxdWlyZWQgLSBkZWxldGUgaXQuCgpOb3RlOiB1YXBpL2RybS9kcm0u
aCBpcyBpbmNsdWRlZCBpbmRpcmVjdCB2aWEgZHJtX2ZpbGUuaCwKYnV0IHRoZXJlIGFyZSBubyBk
ZXBlbmRlbmNpZXMgaW4gZHJtX3ZibGFuay5oIHNvIHRoZSByZW1vdmFsCmlzIGxlZ2l0LgoKU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJk
IDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KQ2M6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJt
X3ZibGFuay5oIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaCBiL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaApp
bmRleCBlNTI4YmIyZjY1OWQuLjlmZTRiYThiYzYyMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX3ZibGFuay5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaApAQCAtMzAsNyArMzAs
NiBAQAogCiAjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rl
cy5oPgotI2luY2x1ZGUgPHVhcGkvZHJtL2RybS5oPgogCiBzdHJ1Y3QgZHJtX2RldmljZTsKIHN0
cnVjdCBkcm1fY3J0YzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
