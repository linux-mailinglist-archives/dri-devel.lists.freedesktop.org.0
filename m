Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D729A71F0B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7656E35F;
	Tue, 23 Jul 2019 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F6189ECD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 11:10:37 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id p184so18968972pfp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 04:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdC2f6TJF86FgwDX6KIDWxr/KpmV360i5Yrw3iyE1iw=;
 b=rPksqHtb7rd3ory8ivQAuadW1fhWIELKmXVIrfYOMvwekvox5J132zw0Ic7+18Yv/9
 OTbafSxPQOYB8r0EIolO2Nxk0vtjJ1JHEjGJ9dqSZTzmOfE7iP5DvTNTHHlqG1neOjdf
 zrS/TEggWKaYjUP0jZIRDOe2EeqvibRDmOxPqe3NQ+FPB7uFj50IwV92ciYTlVCv9mYU
 UPT8Pr76i0w2Z7MrBSxFQsVvktCpxcGZyUBO+W/60mypS9Ex7zxOaq9Fe8XzaPdmz/39
 9+KpV/jvuj8Nos/YF4CU6BfmxEy6rxDzXkUOp0Rj72HWrJTJ8egcY1BOSq5urqgGdUS4
 LHfg==
X-Gm-Message-State: APjAAAV6UBaoNy+5OtU5Vuvc/ifJaGtGxZtmY0dDpkpKtNVzdzkeXCBP
 lemyvKL2c4yH0n0c975cNvE=
X-Google-Smtp-Source: APXvYqzFg8sL7ip6zspQWhRnUUbOYrrvGUS2Kinjim/SlCx29Bxi6970md1j/cfuqehMPa3Bnay/8A==
X-Received: by 2002:a17:90a:8591:: with SMTP id
 m17mr83143286pjn.100.1563880237482; 
 Tue, 23 Jul 2019 04:10:37 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id g4sm54517887pfo.93.2019.07.23.04.10.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 04:10:36 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/vmwgfx: Use dev_get_drvdata
Date: Tue, 23 Jul 2019 19:10:31 +0800
Message-Id: <20190723111031.11012-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdC2f6TJF86FgwDX6KIDWxr/KpmV360i5Yrw3iyE1iw=;
 b=q9grusXg7FRhKMtX21/0dcOkdQVBD1QHBhVPY5S/qj/KaUYNuBibLBKhoW+IIIiL1U
 OSMGVNtBBUIc9Er+gmv9bpB3jOhTSOgpJLdOuVEto1b3OqnjBOXbmrkpsLgPTn3K7Bq6
 94ct5pEJZ3o5xlHoXkv2dj838nPe1HBXkI73wObalKvZg8IBkatpdC2blOk8M0Guldw5
 cXUrBQBgcq3BjSv46S3m6FFcWcUCzH7ClDC9YaVTYw7i/YlzIaRCp+HWZC2GYEc85pX4
 Y5XgjMpDuNKPUX/eGnWcf3sDiUCC1AF7CXfD4oMmUeapfvrDrvUEF5r1pValTcdBfn47
 NnfA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9kcnYuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggOTUwNjE5
MGEwMzAwLi44ZjVmNTk4MGM5ZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCkBA
IC0xNDQ4LDggKzE0NDgsNyBAQCBzdGF0aWMgaW50IHZtd19wbV9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqa2RldikKIAogc3RhdGljIGludCB2bXdfcG1fZnJlZXplKHN0cnVjdCBkZXZpY2UgKmtkZXYp
CiB7Ci0Jc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGtkZXYpOwotCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IGRybV9kZXZp
Y2UgKmRldiA9IGRldl9nZXRfZHJ2ZGF0YShrZGV2KTsKIAlzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRl
dl9wcml2ID0gdm13X3ByaXYoZGV2KTsKIAlpbnQgcmV0OwogCkBAIC0xNDk3LDggKzE0OTYsNyBA
QCBzdGF0aWMgaW50IHZtd19wbV9mcmVlemUoc3RydWN0IGRldmljZSAqa2RldikKIAogc3RhdGlj
IGludCB2bXdfcG1fcmVzdG9yZShzdHJ1Y3QgZGV2aWNlICprZGV2KQogewotCXN0cnVjdCBwY2lf
ZGV2ICpwZGV2ID0gdG9fcGNpX2RldihrZGV2KTsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
cGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBkZXZfZ2V0
X2RydmRhdGEoa2Rldik7CiAJc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiA9IHZtd19wcml2
KGRldik7CiAJaW50IHJldDsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
