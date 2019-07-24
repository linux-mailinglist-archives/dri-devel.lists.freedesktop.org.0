Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E167481B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4E6E667;
	Thu, 25 Jul 2019 07:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9A96E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:19:05 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p184so20946679pfp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=187+tifTVmT8+OOjO9Brc7YUyKXShVPSiDjBCP8NPi4=;
 b=EkotmU4H0VN4QMHz95c/ys2j1ttzUzypPcBy8ev68h25HfHym+ri9y+MCSsT3XzoFc
 OIivGLqVsg4Q1U+ruvmIcN8Um+gfac6kxKbnn+UPyKi6sEAfLu/U5MUfD9zSlur8Czhi
 YrN9MxGuHK82cpSqv0QY2w6oolbIUEJvVyfUVeISZ3dQvbzXeltEmDZ+bFixLSPgVypD
 smUCVvN998XYa9XZ4wPDVfB3LghJ/zHh4MEeE5jF+iihhyz+YsBMXNCA1yNkDwfr9MFg
 Lf/vDlyHQ3+qWACHI8b0NVgAnhb8KJXXB2VdnkMKyybl9c190yJVf1SjuGbwGoYDQZYi
 ENuA==
X-Gm-Message-State: APjAAAW9jZRCvr9mDzyeWsI7zVPkHKlT1V5owXhp4alM6scwaGtanFBU
 aiJYy1SeQpoX8e3PPFILpDs=
X-Google-Smtp-Source: APXvYqx0xnEr8N9RRGfndLrAHVr4nivY1lnSIq0jSryfTg4ogib6Ugw9VmUngELr/aWPiMAGKtw5SQ==
X-Received: by 2002:a17:90a:3344:: with SMTP id
 m62mr87950008pjb.135.1563974345617; 
 Wed, 24 Jul 2019 06:19:05 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id a5sm39888253pjv.21.2019.07.24.06.19.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 06:19:05 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] video: fbdev: aty: Use dev_get_drvdata
Date: Wed, 24 Jul 2019 21:19:00 +0800
Message-Id: <20190724131900.2039-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=187+tifTVmT8+OOjO9Brc7YUyKXShVPSiDjBCP8NPi4=;
 b=N8bju59PXmAonbSc85iXGzLL6y3xg2uZwJKtZPnFLv2O7xjuyo9lHS8oDnWzmq4ncq
 0o8YIkXVsfExVs9ti4kRZJ3/TCeFj37VJoH6+hI0pGlIgW3mkjTuiZNpKxltae0N6KiL
 RXKBrP2eZX5p1zCL/os4C9yuaav6QIabBWUAOfjrmiZplNtGdFLaCFalUkp6TumrfJrP
 81AMW8WP9t9LQ487Y2BP/a4Ip3pQqkZkLJ317FXDwta6EUMVlnFTuW1e6hQpF2lW501Z
 4oN2b2VSNda87QCtFOHyKWHS/jmg7bCH/GIUI/zgfN6A1xNFvWEkMssC6kwI+u3fWG8g
 QQfg==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9y
YWRlb25fYmFzZS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFk
ZW9uX2Jhc2UuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMKaW5kZXgg
NmY4OTFkODJlZWJlLi41ZDA0MjY1M2U5YmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvYXR5L3JhZGVvbl9iYXNlLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9u
X2Jhc2UuYwpAQCAtMjIxNyw4ICsyMjE3LDcgQEAgc3RhdGljIHNzaXplX3QgcmFkZW9uX3Nob3df
ZWRpZDEoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCBrb2JqZWN0ICprb2JqLAogCQkJCSBjaGFy
ICpidWYsIGxvZmZfdCBvZmYsIHNpemVfdCBjb3VudCkKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSBjb250YWluZXJfb2Yoa29iaiwgc3RydWN0IGRldmljZSwga29iaik7Ci0Jc3RydWN0IHBjaV9k
ZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7Ci0gICAgICAgIHN0cnVjdCBmYl9pbmZvICppbmZv
ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwogICAgICAgICBzdHJ1Y3QgcmFkZW9uZmJfaW5mbyAqcmluZm8gPSBp
bmZvLT5wYXI7CiAKIAlyZXR1cm4gcmFkZW9uX3Nob3dfb25lX2VkaWQoYnVmLCBvZmYsIGNvdW50
LCByaW5mby0+bW9uMV9FRElEKTsKQEAgLTIyMzAsOCArMjIyOSw3IEBAIHN0YXRpYyBzc2l6ZV90
IHJhZGVvbl9zaG93X2VkaWQyKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qga29iamVjdCAqa29i
aiwKIAkJCQkgY2hhciAqYnVmLCBsb2ZmX3Qgb2ZmLCBzaXplX3QgY291bnQpCiB7CiAJc3RydWN0
IGRldmljZSAqZGV2ID0gY29udGFpbmVyX29mKGtvYmosIHN0cnVjdCBkZXZpY2UsIGtvYmopOwot
CXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwotICAgICAgICBzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbyA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKKwkJc3RydWN0IGZiX2luZm8g
KmluZm8gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKICAgICAgICAgc3RydWN0IHJhZGVvbmZiX2lu
Zm8gKnJpbmZvID0gaW5mby0+cGFyOwogCiAJcmV0dXJuIHJhZGVvbl9zaG93X29uZV9lZGlkKGJ1
Ziwgb2ZmLCBjb3VudCwgcmluZm8tPm1vbjJfRURJRCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
