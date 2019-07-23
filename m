Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C371EFE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEE56E347;
	Tue, 23 Jul 2019 18:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06CF895B6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:38:50 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id f17so14942855pfn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 03:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJJwPLAueXtxcGlCD6Tbo/0lOc3eLv/7iWCoapVa8ow=;
 b=YEOhFPn5fgl+O5prXSZSRIXNaKmGAnKmRCNuuxxFmvT+6q1CWDM8Py7vEDN8J3ebMo
 dGygeheaT7tDQzZkTcp1YS/TJEgGAgoKxJ4i/BUbconM9xQbjH7MXUxcZ2wJhagEQU2t
 47Yy3p/Y7MMtEszJbmSwYibJa17JgGoqaROVIKE8nnGKB/ZBPLHN+5uA+a/sDDMK6wSZ
 rQR9cnatpUx7oYHylRumgma5ASY0scfJa3RJCWuXVgsuPK4EiKB8SHasYHMeCowDqBGl
 DNsa2/ksQQ3+mTB6+jMSzCSsbMdcGvwk4G58aWKfrkmUKkkuSCTZVO4G8+Bfu0H1Tnuo
 1R/Q==
X-Gm-Message-State: APjAAAW4ubV/BW5kn4xV604zSLkY7VNAJmpnRM0x0zwIMmXvaeLZapoU
 BgaQeHlexPULU6rNo0ynu6U=
X-Google-Smtp-Source: APXvYqzuYXp35SrBzLoGEon+ubsLDyfehTkzqhmAJ+MDwKId9H+Ph/4X3ofmDJXq+sAICpnXj/cxVg==
X-Received: by 2002:a17:90a:d14b:: with SMTP id
 t11mr81701030pjw.79.1563878330481; 
 Tue, 23 Jul 2019 03:38:50 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id o11sm72345572pfh.114.2019.07.23.03.38.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:38:49 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/gma500: Use dev_get_drvdata where possible
Date: Tue, 23 Jul 2019 18:38:30 +0800
Message-Id: <20190723103829.3848-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJJwPLAueXtxcGlCD6Tbo/0lOc3eLv/7iWCoapVa8ow=;
 b=H74A0OkK53PNTxp+3xX64AB7CmCxmHA9QmUrMj5pVW2BzDEsAI/QE3sNuR/4YdN+Bm
 sBycghr3u74CwximQ0nefQymZWIsB4MyyIN/sMlX8OnH1nKxQGGJPymLXlDyuFrMTG+S
 LDOeAPkSsMznr0JQ5eIiWZ+T8LTZOzgyn8xJ60yUGySCDHLhCYH/1j0Ln+zuvxwvVZKj
 YpEw6wstepCt+tGrVAShqHeJxBppgBGWCUnQDMHEWEn1jUypBsPuf1wX0IFA7r21732F
 fzAQcjTy8in38a56QucG6+PWrZELrxmn8jQSEmeSGjJ4hCAa69KPE8OloZqJTqu8dDgM
 7QOA==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3Bv
d2VyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3Bvd2VyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL3Bvd2VyLmMKaW5kZXggYmVhODU3ODg0NmQxLi5kNjdlMDFjZTc3NjYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcG93ZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL3Bvd2VyLmMKQEAgLTMwOCw3ICszMDgsNyBAQCBpbnQgcHNiX3J1bnRp
bWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAogaW50IHBzYl9ydW50aW1lX2lkbGUoc3Ry
dWN0IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1kZXYgPSBwY2lfZ2V0
X2RydmRhdGEodG9fcGNpX2RldihkZXYpKTsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtZGV2ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7CiAJc3RydWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYg
PSBkcm1kZXYtPmRldl9wcml2YXRlOwogCWlmIChkZXZfcHJpdi0+ZGlzcGxheV9jb3VudCkKIAkJ
cmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
