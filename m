Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D427E3881
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9676B6E48E;
	Thu, 24 Oct 2019 16:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43396E4B0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p4so26867871wrm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IN+YQnEOyJUS5k1O2xwcjJm7/Rodceth/lgx2YM8Gws=;
 b=GqyOgTax1e7trC0s84oNeqNTNeJ4mU+Bqk/vN2B/2KY7cOy2eyvXYtscBRAxQfdnnc
 ECFYr/B0TRoGhBuYIwpytblVWEWU34TMlsFOHa34zl/eLY5CiwgLEcd5pqoHxgvDvdJ8
 9XbrNGqs2OfHKRQo3KsfWWjwOetFCrO+mu/EbEGGgzMBXKcwoovYp8ULMs8tLa1RfavJ
 dn3Sr97dIbqHaaTHpC7fVHi8DRlF9IiVHLMs9nam0fxWUm05m1sGvWPvIDTXx5kx5Nl7
 cN4e8SZprAZGfodBSOdpcow310KjyQqNVjiPEhOzuAsyN01qWbBchPJdbFPOiT87ublA
 6HNg==
X-Gm-Message-State: APjAAAWKa08oQZ4KAsVT+NcG0sD8OPH0Sy4kn5aqBVuhqqIOkUheYu75
 wGfQscIgOXVjVXlA4PD9QFI=
X-Google-Smtp-Source: APXvYqwAeJKMyLSjXtstNJqix0x6l67WkcLJwRvv30XQzva/DaHCuGReyfFc0aj/heUwuzEbH4su5w==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr4588523wrr.316.1571935539407; 
 Thu, 24 Oct 2019 09:45:39 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id r13sm37818229wra.74.2019.10.24.09.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:38 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/32] drm/tegra: Add missing kerneldoc for struct drm_dp_link
Date: Thu, 24 Oct 2019 18:45:03 +0200
Message-Id: <20191024164534.132764-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IN+YQnEOyJUS5k1O2xwcjJm7/Rodceth/lgx2YM8Gws=;
 b=hYjszF6NhG//c4hvZIbDA0GvgbAJF8UnSShL2kJUVMVnWx/AKDGV1Y8rejCkDZSHTy
 MXbxES99xFAwluer9AsNg2buiwlPQKbighBMo5tWpWqdgILpEUQEd75+lypGydnNI3rz
 83uX13NDePQd/XRKDc6z62E7xy6O43sH4UTGb4oaxsv1uX4ufXjSzlQSNyrVfb3rhc0y
 nKiI4ShbizlsozhFyDElpbMpXLeER7StLM0EiCiahookxWBFflCip4Btr1MN6RG7EEne
 4ZTwa93a3tpOAcsEIuP205nBbAW5TequGUgr6b2AmRFhl1ISl4DIm4KAgd6ovg1TjeKD
 2pSg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkcm1fZHBfbGlu
ayBzdHJ1Y3R1cmUgdHJhY2tzIGNhcGFiaWxpdGllcyBvbiB0aGUgRFAgbGluay4gQWRkIHNvbWUK
a2VybmVsZG9jIHRvIGV4cGxhaW4gd2hhdCBlYWNoIG9mIGl0cyBmaWVsZHMgbWVhbnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcC5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmggYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHAuaAppbmRleCA4ODg0MmZkMjVhYmYuLjFjZjI1MmU3MzA5YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RwLmgKQEAgLTExLDYgKzExLDEzIEBAIHN0cnVjdCBkcm1fZHBfYXV4OwogCiAj
ZGVmaW5lIERQX0xJTktfQ0FQX0VOSEFOQ0VEX0ZSQU1JTkcgKDEgPDwgMCkKIAorLyoqCisgKiBz
dHJ1Y3QgZHJtX2RwX2xpbmsgLSBEUCBsaW5rIGNhcGFiaWxpdGllcworICogQHJldmlzaW9uOiBE
UCBzcGVjaWZpY2F0aW9uIHJldmlzaW9uIHN1cHBvcnRlZCBvbiB0aGUgbGluaworICogQHJhdGU6
IG1heGltdW0gY2xvY2sgcmF0ZSBzdXBwb3J0ZWQgb24gdGhlIGxpbmsKKyAqIEBudW1fbGFuZXM6
IG1heGltdW0gbnVtYmVyIG9mIGxhbmVzIHN1cHBvcnRlZCBvbiB0aGUgbGluaworICogQGNhcGFi
aWxpdGllczogYml0bWFzayBvZiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkIG9uIHRoZSBsaW5rCisg
Ki8KIHN0cnVjdCBkcm1fZHBfbGluayB7CiAJdW5zaWduZWQgY2hhciByZXZpc2lvbjsKIAl1bnNp
Z25lZCBpbnQgcmF0ZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
