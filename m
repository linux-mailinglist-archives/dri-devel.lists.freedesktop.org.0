Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E2E71F08
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0E36E352;
	Tue, 23 Jul 2019 18:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA23895B6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:39:14 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c2so20428313plz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 03:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+Ko2s07XpmKeoiSRAWiG1TIYHRUPENDvoZZ633m3Sw=;
 b=YUSrZz+7P1wpRhZ7QrjwUEK48PUZCpF2lO/8yPxkhEW9+kuGhRLzfNbQ04nc3ouw3F
 6NVrQ36wH4b3UCmww/a1zPplEmmgIcHnDHvUpKAjgUmepWW4EC140mY9vvZ7+Ga+8zxU
 6uW6oUVQdDp0YCqPFbWtVnfJmVnF1VfxYevMFZe2Tfzu5FfZVUF/AiKr53I6taVwG2/f
 Tf4oVCoHEYWKgkN8xu5X76cphEuyKJ7nKBNME8P+CxFaBRO89Q5VK2eqAj1ubck8rBio
 OgylBaHjhuCQzQ0rYML+OYnSmueWLBRnzeaEiSOQy5gZ/fL0DSniGaGw3FRAKZNX7JhQ
 i2/g==
X-Gm-Message-State: APjAAAWs33v0Vn+Hlp9jfv7uV/mSMbhPcf8bn/wdcA7ctv3l29yboDuM
 XNTCtMqnChDK0iZ99afl4h8GP1MRg+U=
X-Google-Smtp-Source: APXvYqwUPzOHi7ydENLevjuyXdJ3XUAFL+jiA4oEHjJZ3l1IEn48+DSYYYC/Wenru2lLCRwqCnGYmw==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr79338215pla.89.1563878353880; 
 Tue, 23 Jul 2019 03:39:13 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id q8sm82654778pjq.20.2019.07.23.03.39.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:39:13 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/hisilicon: Use dev_get_drvdata
Date: Tue, 23 Jul 2019 18:38:53 +0800
Message-Id: <20190723103852.3907-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+Ko2s07XpmKeoiSRAWiG1TIYHRUPENDvoZZ633m3Sw=;
 b=utRCn1tS3UkpzPd6ElI+IxOO/JZMbnJfYeCK9miA3G0mug0yafGrLhngkkfuNJnwBN
 cG82d0dUWn9PwFB8Zz+JU6Wqposfon/0ryk9NqPAwTsoOWtsO/OpZamFF/yVchxO/4PE
 7yDDMjS4L4WuZxwK77FwviTlxoEcE0jerxHSG16KbNQXTSGXgbNjFlkZa5Ssb+4KSIJ4
 pV+rl4XyZek/SVBlZIPRFCnItCnESUnT9miR3EjwCZwso+XkOUwybjb39GJns0Il2663
 ULUINrw1ZWKOru3wY95F3HeNC+KFuj5T9Dp41abaV/uJe1VV09e9v4xCwjH1Umf0v7a3
 y7uA==
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
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9kcnYuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNv
bi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKaW5kZXggY2U4OWU1NjkzN2IwLi5mMGJlMjYzZmVmZjUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5j
CkBAIC02MCwxNiArNjAsMTQgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGhpYm1jX2RyaXZl
ciA9IHsKIAogc3RhdGljIGludCBfX21heWJlX3VudXNlZCBoaWJtY19wbV9zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2
KTsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsK
KwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCiAJ
cmV0dXJuIGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfc3VzcGVuZChkcm1fZGV2KTsKIH0KIAogc3Rh
dGljIGludCAgX19tYXliZV91bnVzZWQgaGlibWNfcG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKLQlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKKwlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCiAJcmV0dXJuIGRybV9t
b2RlX2NvbmZpZ19oZWxwZXJfcmVzdW1lKGRybV9kZXYpOwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
