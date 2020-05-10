Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEE1CD253
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6186E20E;
	Mon, 11 May 2020 07:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD4989F8E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so7960123wrt.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCZR0RDMG3XJhGAGRvblpDgemNbadL77Ape7/cMT2Jk=;
 b=LgVoPKRXtKyWOqYktFWRpIfKlpXdA950wCd2yJkk1y6mRWG9CgvwhxCh+VLXpXYi8G
 isZlsRVnB2AJfLgDpBf5IwLL+F+xLLm+vLe5V8dfFZ1lZ5XxiQN1M+euNM0cjj8s6dxT
 4y3jVmrE0FzRMojZ1yZZw1dT+gmZ7jPBZFO7tFnCMJhrHGQSd9XmAV4gGs0aLissqb98
 UiLnV2bb5HGcSGff55PmCb2b9neSqsPsctfKOJWOLJBxeLc0n/RMBYmAzW2bxvzZ1o7G
 ca7cOJPGz/1a4XLT6HD1Y0EKIZy2oDbA8DL6NGUCyrNQm5rMurIRCp1EksMFjVRmDR1V
 77tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SCZR0RDMG3XJhGAGRvblpDgemNbadL77Ape7/cMT2Jk=;
 b=eLhBPop3xHwRvg+GnMCIJ9Z9iBo0iYefNILwrApl7xJVypORxV+J01FUFmfJwNb363
 GFIjkbR3RFEF0I9fCRddO4AJGsQz3A9SDv4YELLtRyn4flKatYF6jXWZA8eT9rCDFnYq
 Sg6RaQHfB3k6278OoOH6H2i/WnyRjvSacuwmkPtprnoJhP9Rb08pI9UCiLlbHaly4wGL
 gdI0HqVwEQsFFOqjzO9fKnqDjUqZfuGzzZtYtVjXzj42Mg1HoGnA6R7aVYTx78yJzJQ3
 XTIf+ArSoQTlcbXqqZb0HLzFNFk22+E6UMxY2P5PYZA5yrxS6V7EEzIfejQixunN/guQ
 Rlpg==
X-Gm-Message-State: AGi0Pub1pnEJJFpHRvA9RN3M7EdxJc2y4TkWPeLCrQ9fZuil3cKJUTpZ
 mHan+1dfbGtvUuMKx+ODFbE=
X-Google-Smtp-Source: APiQypKtLpPlZkPTEpuhPfSdLDXG2WtCWVp/p+U2lL9gCsx/HvonVK58WW19yileLXj8XmEnrOCQcQ==
X-Received: by 2002:adf:afd6:: with SMTP id y22mr13959393wrd.417.1589129743009; 
 Sun, 10 May 2020 09:55:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 01/15] drm/panfrost: avoid static declaration
Date: Sun, 10 May 2020 18:55:24 +0200
Message-Id: <20200510165538.19720-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkZWNsYXJhdGlvbiBjYW4gYmUgYXZvaWRlZCBzbyBjaGFuZ2UgaXQuCgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAzOCArKysrKysrKysrLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5j
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCA0MTM5
ODcwMzhmYmYuLjFiNTYwYjkwM2VhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2ZnJlcS5jCkBAIC0xNCw3ICsxNCwyNCBAQAogI2luY2x1ZGUgInBhbmZyb3N0X2dw
dS5oIgogI2luY2x1ZGUgInBhbmZyb3N0X3JlZ3MuaCIKIAotc3RhdGljIHZvaWQgcGFuZnJvc3Rf
ZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYp
Oworc3RhdGljIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCit7CisJa3RpbWVfdCBub3c7CisJa3RpbWVfdCBsYXN0
OworCisJaWYgKCFwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQorCQlyZXR1cm47CisKKwlub3cgPSBr
dGltZV9nZXQoKTsKKwlsYXN0ID0gcGZkZXYtPmRldmZyZXEudGltZV9sYXN0X3VwZGF0ZTsKKwor
CWlmIChhdG9taWNfcmVhZCgmcGZkZXYtPmRldmZyZXEuYnVzeV9jb3VudCkgPiAwKQorCQlwZmRl
di0+ZGV2ZnJlcS5idXN5X3RpbWUgKz0ga3RpbWVfc3ViKG5vdywgbGFzdCk7CisJZWxzZQorCQlw
ZmRldi0+ZGV2ZnJlcS5pZGxlX3RpbWUgKz0ga3RpbWVfc3ViKG5vdywgbGFzdCk7CisKKwlwZmRl
di0+ZGV2ZnJlcS50aW1lX2xhc3RfdXBkYXRlID0gbm93OworfQogCiBzdGF0aWMgaW50IHBhbmZy
b3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAqZnJl
cSwKIAkJCQkgICB1MzIgZmxhZ3MpCkBAIC0xMzksMjUgKzE1Niw2IEBAIHZvaWQgcGFuZnJvc3Rf
ZGV2ZnJlcV9zdXNwZW5kKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCWRldmZyZXFf
c3VzcGVuZF9kZXZpY2UocGZkZXYtPmRldmZyZXEuZGV2ZnJlcSk7CiB9CiAKLXN0YXRpYyB2b2lk
IHBhbmZyb3N0X2RldmZyZXFfdXBkYXRlX3V0aWxpemF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2UgKnBmZGV2KQotewotCWt0aW1lX3Qgbm93OwotCWt0aW1lX3QgbGFzdDsKLQotCWlmICghcGZk
ZXYtPmRldmZyZXEuZGV2ZnJlcSkKLQkJcmV0dXJuOwotCi0Jbm93ID0ga3RpbWVfZ2V0KCk7Ci0J
bGFzdCA9IHBmZGV2LT5kZXZmcmVxLnRpbWVfbGFzdF91cGRhdGU7Ci0KLQlpZiAoYXRvbWljX3Jl
YWQoJnBmZGV2LT5kZXZmcmVxLmJ1c3lfY291bnQpID4gMCkKLQkJcGZkZXYtPmRldmZyZXEuYnVz
eV90aW1lICs9IGt0aW1lX3N1Yihub3csIGxhc3QpOwotCWVsc2UKLQkJcGZkZXYtPmRldmZyZXEu
aWRsZV90aW1lICs9IGt0aW1lX3N1Yihub3csIGxhc3QpOwotCi0JcGZkZXYtPmRldmZyZXEudGlt
ZV9sYXN0X3VwZGF0ZSA9IG5vdzsKLX0KLQogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3JlY29yZF9i
dXN5KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewogCXBhbmZyb3N0X2RldmZyZXFf
dXBkYXRlX3V0aWxpemF0aW9uKHBmZGV2KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
