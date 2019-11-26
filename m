Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F8C109A0C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33886E260;
	Tue, 26 Nov 2019 08:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA21B6E1B1;
 Tue, 26 Nov 2019 00:35:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s5so20348698wrw.2;
 Mon, 25 Nov 2019 16:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDFio4Lhb0kKhPkBrIjIeoSXog1kC5Yksq1DrKHrUpU=;
 b=A6s2hdGBnEOt2yqFcFJwzgiHedksl0NRbyH7zRmRFKW/qvRK1Q9oJu/d8vn/b2Murn
 HbA4AIui5kKx9HG9hvn7+StbYVDS0pAo8jRbenqYPLDGMbsTRdDYr5FMz9EcgDaB/IK3
 uGHJDuLR7sCje9jBcZSl49xYW0dpgujvfaQb0Hpe8RG//24tcklXdSnyNCO6RstS/N38
 beVC05v8gKWYnT/m12yDQtqZZakORuLSSUTABDC8YCWKcDfde+j9UwgKNmAybnE+/CYd
 6gkF79WhC5/cwT7EMzPmrTy63+FFwy/ibTcdDM+ExWPFoN/AQ9JeSVJmpRBTZB/QWhw4
 CFUg==
X-Gm-Message-State: APjAAAXQnmciV1hMnZGKa1p9Q07YE+zT0ZRsXuCWE/voh3uJshC7VS8p
 Ux9pCYtQDAyNvJQn0FdZvQ==
X-Google-Smtp-Source: APXvYqyu132ZmglcrvSPz+8EVxEATNEzWOBwq3t6Y4W5mdmx+mzod7l10tqmW8Pwcy3RFUL83wVRgA==
X-Received: by 2002:adf:db01:: with SMTP id s1mr32001656wri.372.1574728531157; 
 Mon, 25 Nov 2019 16:35:31 -0800 (PST)
Received: from ninjahub.lan (host-2-102-12-67.as13285.net. [2.102.12.67])
 by smtp.googlemail.com with ESMTPSA id t14sm12159380wrw.87.2019.11.25.16.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 16:35:30 -0800 (PST)
From: Jules Irenge <jbi.octave@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm: radeon: replace 0 with NULL
Date: Tue, 26 Nov 2019 00:35:14 +0000
Message-Id: <20191126003514.133692-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDFio4Lhb0kKhPkBrIjIeoSXog1kC5Yksq1DrKHrUpU=;
 b=shvCV5hpquBUdbjLWkMX/ziKHTReuQPJ1XIUHiUBGiHEt4QY+rZ9xJyLIA5SxNKv9E
 AGYuY2h8k29ml7h96ZPB7TggN266SvZSY7Y6DpFj6ltmmUJtFeUXfoxGMlexiCrpkBxp
 xmuowIDQk1i1byxc+xFD0MacBpt+QBPACAMHGSEqqdTc6Dx1CB3GvJH5kvY1wp40TK7G
 51QQureKo/wpA5rywxNdU4nRAToqJ1WvUlcNhiu8WQMAUi4LjxDC6Gqvn1lHsvGCiHsv
 d8AjhzrpUT6FV/aiYuDvDs+VIPFpg2YX/n8mWHANVrAxSCNIq6T5CdreKzesRxny1dT/
 3sIQ==
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
Cc: Jules Irenge <jbi.octave@gmail.com>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSAwIHdpdGggTlVMTCB0byBmaXggc3BhcnNlIHRvb2wgIHdhcm5pbmcKIHdhcm5pbmc6
IFVzaW5nIHBsYWluIGludGVnZXIgYXMgTlVMTCBwb2ludGVyCgpTaWduZWQtb2ZmLWJ5OiBKdWxl
cyBJcmVuZ2UgPGpiaS5vY3RhdmVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2F1ZGlvLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYwppbmRleCBi
OWFlYTU3NzZkM2QuLjIyNjljZmNlZDc4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fYXVkaW8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9h
dWRpby5jCkBAIC0yODgsNyArMjg4LDcgQEAgc3RhdGljIHZvaWQgcmFkZW9uX2F1ZGlvX2ludGVy
ZmFjZV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCX0gZWxzZSB7CiAJCXJkZXYt
PmF1ZGlvLmZ1bmNzID0gJnI2MDBfZnVuY3M7CiAJCXJkZXYtPmF1ZGlvLmhkbWlfZnVuY3MgPSAm
cjYwMF9oZG1pX2Z1bmNzOwotCQlyZGV2LT5hdWRpby5kcF9mdW5jcyA9IDA7CisJCXJkZXYtPmF1
ZGlvLmRwX2Z1bmNzID0gTlVMTDsKIAl9CiB9CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
