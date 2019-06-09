Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A293AC37
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 00:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79289160;
	Sun,  9 Jun 2019 22:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBC78915E;
 Sun,  9 Jun 2019 22:08:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h10so292203ljg.0;
 Sun, 09 Jun 2019 15:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pZnWuO1KMVNXvYxx/iARqav88uIclO4XixO27y+46HM=;
 b=L2XlRB53FTPsRQcuL0kb9p9shM5XJDYI7HdTBhWaWoKS823dXCfU4hlYmR90Bex2sr
 i0KUOaeTCrTKiH7cj1Y0jRob9/dRFQls9gjy3U6rgxd4Fo7J150k9TWasqqOuszyAbKm
 7e1jho2Of77/RtSmQdYSmmddD4SOu9b/WS6Qs17eAN/n0aCsGhDH34DuyRPE5m8XOq0m
 WL2JCeaO4E0X6fdRdiFGYJ8gJOY7pMr+zK4w1vOwvP5pqM21jri6vFZq9tCWx8TzhEGo
 y2yNeydaY7xtWcvprQGoGvryF9PvKRkBCBzeQ1dKkde6vxh02JgvJ6jekU/ia78TLH4W
 gLqQ==
X-Gm-Message-State: APjAAAUNxGXC2UgzyKE/1vbV4UGzE9vNzqsEFQRDlCBeAmFlCwJcdL+l
 FUlu7Doxd58oeGEgGFqglfRb4VpIme4=
X-Google-Smtp-Source: APXvYqzTMKOln3nJuijF0pqsNXTtZMI3QVWYtMP1/uKndmjQ734E7hofDY/blcMxrrVXSFkF2qZOQg==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr15680078lji.171.1560118106059; 
 Sun, 09 Jun 2019 15:08:26 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v12sm225476ljk.22.2019.06.09.15.08.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 15:08:25 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 01/10] drm: fix build errors with drm_print.h
Date: Mon, 10 Jun 2019 00:07:48 +0200
Message-Id: <20190609220757.10862-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190609220757.10862-1-sam@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pZnWuO1KMVNXvYxx/iARqav88uIclO4XixO27y+46HM=;
 b=UlfNuptoeRRilNcy7AdPawkUv86af1y2C3R3oJfhTvpGRt74h128qyZ71cy9qBjIbv
 6YUt2r5geV/HkdFMecIjyrqycCtBJKb29qXww4zQRb/GbW//Y67JP1buyfv8UkIpFnaD
 pipfm+x9/LQrws0VLZ/lvqDTaMT6sGAyzlucmH49QwhH4yQQxxekxyS1i/6vWi6879Po
 VwYRMk9Z4LT3gHor/7bJEQCeaw2PpBPQghKLcTzRWGw/3FEkaYtj2RumMr2CwaLaiJXC
 PO6IOUgTQVTaidiqifXyYU7ztxU6J91P/qxntG3hsiSky6JqwyW7B3Xm0e2QC44um87M
 OCXw==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX3ByaW50LmggcmVxdWlyZXMgPGRybS9kcm0uaD4gdG8gZml4IGJ1aWxkIHdoZW4gbWFjcm9z
IGFyZSB1c2VkLgpQdWxsIGluIHRoZSBoZWFkZXIgZmlsZSBpbiBkcm1fcHJpbnQuaCBzbyB1c2Vy
cyBkbyBub3QgaGF2ZSB0byBkbyBpdC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQog
aW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2Ry
bS9kcm1fcHJpbnQuaAppbmRleCAzYTQyNDczMTllNjMuLmE1ZDZmMmYzZTQzMCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgK
QEAgLTMyLDYgKzMyLDggQEAKICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxs
aW51eC9kZWJ1Z2ZzLmg+CiAKKyNpbmNsdWRlIDxkcm0vZHJtLmg+CisKIC8qKgogICogRE9DOiBw
cmludAogICoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
