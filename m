Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCCF1F9AFC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 16:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6AC89D5F;
	Mon, 15 Jun 2020 14:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC52A89D5F;
 Mon, 15 Jun 2020 14:54:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o8so5521980wmh.4;
 Mon, 15 Jun 2020 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6FJC4M7yb6UETXkb1sZmFJEHJtepxmsrbWdTkTqQQ8=;
 b=nHlCzFEVyKRzMVFnW9EaJYrbpsYcACAz4JdpYOBNQCPg4rDMm9haKlCBs1UsnF7cDQ
 C5I8Kxd3nluUECfM1zxGfYo5VneriB2dzlEflZxpSqW2vwua4ceYiRP/iPMR+HabD5gs
 wgRcwtwpXzsmHgpoQAoSYabj3qFo20rPgA4jF80JIbwIfEjRcZVd8jBNLV5VpWXR8za/
 lFSHWv7OpXAsPmeiZ3fCjHXB6Dy6vDc+U9NvLiiSWLM43aNmPRuipT1/3+N9HXaVreFI
 b2qK/yv7C/vSg3/rBYfhuLjqqkVjBJmduEJ2AQ2hTE1W5QT6WCvSESxAcgHkMxgn+vLw
 f/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6FJC4M7yb6UETXkb1sZmFJEHJtepxmsrbWdTkTqQQ8=;
 b=LdCV6lF7/Fa7Cr6qsrFYW5DApf+vus0P3qndWO6k7HjqT5ljq+W2xrfxQScI2Tbb75
 FvNdi4guBvacu1083NFQpkISy9S24zlpgmfKnlQuxjUWlcUzl3diGwfWuLaxps60Zq9i
 aIJKZAJzf1rfyXExYot40yb5dImGtM9+fWw5dNKFoNj5ZDbozEdHexnb+jIejnBQrgK7
 4fMWFdY7whFTuDiDVj90D2KA3PbLpvc53Gzn1rISb1OS6nWWWM/Ewu3ifpEPI0ay3k+c
 4DBAEHwjRYdb3a/8klVr28yjgVggDEsis0KZ1inDmCDE1mpdQet9nKa8hxkvH4g3klKB
 Lneg==
X-Gm-Message-State: AOAM53226dwTZi4+2DvFZtCYtcz4bIxM6t/wS6UbFB3dto5xQaAKWAUu
 hNa5pW1ExB1DLuHub7LliRs=
X-Google-Smtp-Source: ABdhPJzFlr3SK4cW5QFYIWou/UGCvXUjzgf6XkNhGl3ErV2Y7alWL1lv/fphIYIiRJ78f7jsFFvYpw==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr13445453wmj.84.1592232857593; 
 Mon, 15 Jun 2020 07:54:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a5ab:7330:3773:519a])
 by smtp.gmail.com with ESMTPSA id j4sm24277442wma.7.2020.06.15.07.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 07:54:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org,
 nirmoy.das@amd.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/mm: remove unused rb_hole_size()
Date: Mon, 15 Jun 2020 16:54:13 +0200
Message-Id: <20200615145415.1775-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBzb21lIGNvZGUgY2xlYW51cC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMg
fCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKaW5kZXgg
ODJkMjg4OGViN2ZlLi40MjVmY2QzNTkwZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKQEAgLTMwNSwxMSArMzA1LDYg
QEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX21tX25vZGUgKnJiX2hvbGVfYWRkcl90b19ub2Rl
KHN0cnVjdCByYl9ub2RlICpyYikKIAlyZXR1cm4gcmJfZW50cnlfc2FmZShyYiwgc3RydWN0IGRy
bV9tbV9ub2RlLCByYl9ob2xlX2FkZHIpOwogfQogCi1zdGF0aWMgaW5saW5lIHU2NCByYl9ob2xl
X3NpemUoc3RydWN0IHJiX25vZGUgKnJiKQotewotCXJldHVybiByYl9lbnRyeShyYiwgc3RydWN0
IGRybV9tbV9ub2RlLCByYl9ob2xlX3NpemUpLT5ob2xlX3NpemU7Ci19Ci0KIHN0YXRpYyBzdHJ1
Y3QgZHJtX21tX25vZGUgKmJlc3RfaG9sZShzdHJ1Y3QgZHJtX21tICptbSwgdTY0IHNpemUpCiB7
CiAJc3RydWN0IHJiX25vZGUgKnJiID0gbW0tPmhvbGVzX3NpemUucmJfcm9vdC5yYl9ub2RlOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
