Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF671F27
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F0E6E366;
	Tue, 23 Jul 2019 18:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB12896EB;
 Tue, 23 Jul 2019 09:04:41 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id f17so14816355pfn.6;
 Tue, 23 Jul 2019 02:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5MPf9RPeL/uxC5UjVT4jE3NmOb5yj3FuUkeED/rFltg=;
 b=Ddfia1bysPFkBPrZ8/33+oOB3aNNk64STdPbp9MnSyiw2oSwMemHaE6zEE/Bj9eL96
 DtgtLzz0fOd44+JIY9FGBSKxNimYwEx7Xj5UiJ8vfVFCElKoN9Y6tp7BftLNlcnkYrxh
 +6Ril9IQUhXlVx327HDcjNi+uZfezDi/QutsgTx6v/fZsCgHQpjAOrJxWtweRIWzVL1M
 xTWKnx4OD3qNuqmlUYrN8zNfOzQpCTUvctzUlxPeEJlDmwW33XuMWNXrXkuHEbNbz8c1
 rhZGsSBLO4eBUK2RKhkH8s9SHNCP85E3JS+lrpVHwXKEjWQeHo71oGGz7yhKJVt1pCxw
 jgpg==
X-Gm-Message-State: APjAAAWjn4PKthWcGxUMP8YEasB/15o7ZzlV8+ERTKKrq3ga2x8qHJL/
 IchvmV+yfpP8QdySqIVf1nQ=
X-Google-Smtp-Source: APXvYqz6OOtga1jDqVlvMDvoLUuC/Mk1Os5tfDXEr3aBcJR6B2AJwD7FkZYzlUkxOPanBqx9RrDDdQ==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
 t20mr31719094pjr.116.1563872680802; 
 Tue, 23 Jul 2019 02:04:40 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id h11sm42713175pfn.120.2019.07.23.02.04.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 02:04:39 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/amd/display: Use dev_get_drvdata
Date: Tue, 23 Jul 2019 17:04:22 +0800
Message-Id: <20190723090421.27532-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5MPf9RPeL/uxC5UjVT4jE3NmOb5yj3FuUkeED/rFltg=;
 b=WTdR+4zSg2l9S1pE6t7RB0pIQF/RIKMKLRVj+cQQhJtxQ1dc3tgTJajHkR8H3x/oeT
 UbiRnyrUG4uTRpaZ+PCPpCoUbQlHPizh91A62hlAu9Y/v2gPPzwR9Cl68YGbOxdpAdB2
 /74R7z3VgVNteaZ/DXIqW6z9KTl6Jn92gQeRFbZKYSXgJLCa1l97aqupC3NkZvBh5HrE
 QqYbQmHAvo3YdTcIrfiYhcG2xipINklOi6ngh+xodXTnJUr1chs3h3Yx7+8HMVd2OnEq
 DTH60YLSud+5gvW7476A28VbTUnPdV8UuPAi5xftjtMS/r1U1e5+U+DfsePoBA/u+5y4
 RK5g==
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
Cc: Leo Li <sunpeng.li@amd.com>, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA0YTI5ZjcyMzM0ZDAuLjUyNGUxZTE5MDE3
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCkBAIC0yNDI4LDggKzI0MjgsNyBAQCBzdGF0aWMgc3NpemVfdCBzM19kZWJ1Z19zdG9y
ZShzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCiB7CiAJaW50IHJldDsKIAlpbnQgczNfc3RhdGU7Ci0J
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldmljZSk7Ci0Jc3RydWN0IGRybV9k
ZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2aWNlKTsKIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IGRybV9kZXYtPmRldl9wcml2YXRlOwogCiAJcmV0ID0ga3N0cnRvaW50KGJ1
ZiwgMCwgJnMzX3N0YXRlKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
