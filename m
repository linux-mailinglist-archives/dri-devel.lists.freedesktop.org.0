Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF777C79C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5902A89F89;
	Wed, 31 Jul 2019 15:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13A789F53;
 Wed, 31 Jul 2019 15:52:58 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so23917480qka.10;
 Wed, 31 Jul 2019 08:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4NiYDIrset4mGLXztd7Mn8p14SBJemz0OAMUZ7s/5js=;
 b=VseWcNtkrj716S2e2Yf3HuXwr0OeTpu09zz1Ih6UlgazXUNhcnT1warOpF575NP3Dy
 N0NqZDy1MZP6xpboHaA+H8H/Lap0Rq4h/xvdZ5EXruHQnXfuEnxH95S6i0wNxlcIXAgf
 lQesbnBSxmIJTxozcp29f1vEnfPGtVbo4DsNGgZfpMEiM25Kk2lKNsrnJ004p2F+F0bq
 +gxW6AZ1UY6bEE6+nul/DDOAMqzT3upXVJ3OquTI8oYW0BXXl8I+lf5xMt+nA3QROwNT
 PK+s6fvhEi9bM1ZESb9OZL/P0X9egf0pwjB4xzKMUNfQmLQGPeAg0/nc1tFS9lK1W1Zy
 1uiQ==
X-Gm-Message-State: APjAAAUiadffWnPqUe7f9gtC6J7mP6LRfbEM7fWyw6HcCqIZ/QMLazfp
 foKmCVblVh+CI/T1yjWs+CPtSTBV
X-Google-Smtp-Source: APXvYqw5xH0+LxWonSoKbuJSsj768REMO69gWO7/md/a0jsVCcWVll3Jn/zCAR+WSgkPpy+C0WtNOQ==
X-Received: by 2002:a05:620a:533:: with SMTP id
 h19mr81197899qkh.325.1564588377676; 
 Wed, 31 Jul 2019 08:52:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/amdgpu: drop drmP.h from sdma_v5_0.c
Date: Wed, 31 Jul 2019 10:52:44 -0500
Message-Id: <20190731155246.20603-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4NiYDIrset4mGLXztd7Mn8p14SBJemz0OAMUZ7s/5js=;
 b=aYzslemneA9znWAS9RfNCJv/j0vDFQrN0LojuUA+CbT1KstJk8Z20AqmxnkCfNSLQT
 p9XoXW85QnLubWHJSLSPGh2ACOFXIu+svG2nWUBiyV6HiLHi2pRhIJK9CjVqcj4cCZSl
 SgHbGZU8pW1OQlCVwYkbR+RqE74wYndh5QiLasqbR8ZIrn9shazQZNuw8UmhRzP3dc7R
 6XpV5sB5mqtM/pmkhEmDkpTgJ7ySwbq4hh6ptf/ekx6IPaYdlTFwHMog7zGkazYKxitX
 aG0D8VTogseI+id8invi+KxpEGq83yC81YdAU1fhbsfia7G7NAEHYypv2bBmMpQ5JG+C
 lpzA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIGZpeCB0aGUgZmFsbG91dC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1h
X3Y1XzAuYyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKaW5kZXgg
M2U1MzYxNDBiZmQ2Li5hYTQzZGM2YzU5OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NkbWFfdjVfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jCkBAIC0yMSw4ICsyMSwxMSBAQAogICoKICAqLwogCisjaW5jbHVkZSA8bGludXgv
ZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPgotI2luY2x1ZGUgPGRybS9kcm1Q
Lmg+CisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CisK
ICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfdWNvZGUuaCIKICNpbmNsdWRl
ICJhbWRncHVfdHJhY2UuaCIKQEAgLTg4Miw3ICs4ODUsNyBAQCBzdGF0aWMgaW50IHNkbWFfdjVf
MF9yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAJCWlmIChhbWRncHVf
ZW11X21vZGUgPT0gMSkKIAkJCW1zbGVlcCgxKTsKIAkJZWxzZQotCQkJRFJNX1VERUxBWSgxKTsK
KwkJCXVkZWxheSgxKTsKIAl9CiAKIAlpZiAoaSA8IGFkZXYtPnVzZWNfdGltZW91dCkgewpAQCAt
MTMzNyw3ICsxMzQwLDcgQEAgc3RhdGljIGludCBzZG1hX3Y1XzBfcmluZ19wcmVlbXB0X2liKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAkJaWYgKHJpbmctPnRyYWlsX3NlcSA9PQogCQkgICAg
bGUzMl90b19jcHUoKihyaW5nLT50cmFpbF9mZW5jZV9jcHVfYWRkcikpKQogCQkJYnJlYWs7Ci0J
CURSTV9VREVMQVkoMSk7CisJCXVkZWxheSgxKTsKIAl9CiAKIAlpZiAoaSA+PSBhZGV2LT51c2Vj
X3RpbWVvdXQpIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
