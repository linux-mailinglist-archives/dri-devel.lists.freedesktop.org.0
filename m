Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BACDB585A68
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 14:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD5A10E0D6;
	Sat, 30 Jul 2022 12:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC97410E0D6;
 Sat, 30 Jul 2022 12:23:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c22so3710462wmr.2;
 Sat, 30 Jul 2022 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7n8cZxwCZn/Qw/quWKlWrtEv2JQBFb0Bs9/SBswkjjY=;
 b=kNlJPZ4C4juqjPRrEkoxhK2y+7GMOURfI+mffO0a1obz+7dg2pk7FvJd5E7p+qnGei
 hmkZbHIwnKxfK2Xf+KfHSlvlm+FP8xCUIyQmIQwuaP6fEg4Qu1Ad0ypc8lut/r5VnOmL
 c7wi3e0r3X+UZtcIScKBr+vF1x7L7kZbYY/i2k/78JMcH29Z82lKo0XuMB6u219uB0YW
 yR18wc8ySnNVF0CyIB76DdGv+ir9eYhpBUhDwJqcZaf1nEbucBRIgDTK1zVV/9APRNeL
 M4jZz5zFj4/8LTpHpu99pthjS8zxEoityxtdJJovfD+ebA+s1vPaeJsJ4YCnGSwecl06
 nsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7n8cZxwCZn/Qw/quWKlWrtEv2JQBFb0Bs9/SBswkjjY=;
 b=glgBkcyTqM2T1ESEKWtZeN3dzvaibRitEyWt0eDJMkITFEdtJ4YNCH+xdZO+kYbMmD
 5t2uWfjRF83t0gQKopgpn+Ligl+/bhjY5wm/wkRVrVTw6RChFvzl+vH/Zp/ZWkU16JBu
 J314VrthMs/Y6cAG3I/inKTpV5C2zcaICCEjck2zDHhh1C5Km+zEyx2XSjW1NZ8NT5DE
 eU8y/T765446eYuOyPB6fKfCOKAnRgw4d0B4VZTElkwbt37g3aVF3id47ionj1a15r/L
 PdCaTtkqV/0qGboao83PpUXJsCbsdzRRgfLzqaLpowiO0pNIus42NX5+AXACtXeZQBSo
 Kv2g==
X-Gm-Message-State: AJIora+nIxqSo2FqfexP1F1th723RK6BNb3zN7qNxEpBNopYUdAVEk18
 cAbhOdt2FLtlOIGcD3wXdwc=
X-Google-Smtp-Source: AGRyM1vl7vLOjBRgfGQHvyC5ORaV/PWltLK0HQ9/OQugol//U+WpHbNX1iiBt9i49ReIbryqQFgRSg==
X-Received: by 2002:a1c:f001:0:b0:3a3:7de3:1de8 with SMTP id
 a1-20020a1cf001000000b003a37de31de8mr5712393wmb.119.1659183824148; 
 Sat, 30 Jul 2022 05:23:44 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 bp20-20020a5d5a94000000b002205a6aec0asm1132032wrb.86.2022.07.30.05.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 05:23:43 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/userptr: remove redundation assignment to variable
 ret
Date: Sat, 30 Jul 2022 13:23:42 +0100
Message-Id: <20220730122342.146475-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable ret is assigned a value that is never read; it is either
being re-assigned during the following while-loop or after the loop.
The assignmnt is redundant and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/i915/gem/i915_gem_userptr.c:295:11: warning: Although
the value stored to 'ret' is used in the enclosing expression, the
value is never actually read from 'ret' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 8423df021b71..075aef875a07 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -292,7 +292,7 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 	if (!i915_gem_object_is_readonly(obj))
 		gup_flags |= FOLL_WRITE;
 
-	pinned = ret = 0;
+	pinned = 0;
 	while (pinned < num_pages) {
 		ret = pin_user_pages_fast(obj->userptr.ptr + pinned * PAGE_SIZE,
 					  num_pages - pinned, gup_flags,
-- 
2.35.3

