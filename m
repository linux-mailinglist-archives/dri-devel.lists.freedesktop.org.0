Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DFE4312C2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 11:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38226E9A3;
	Mon, 18 Oct 2021 09:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A706E9A3;
 Mon, 18 Oct 2021 09:10:02 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id f5so15447057pgc.12;
 Mon, 18 Oct 2021 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xioT+koXIxebA9dspAm78A75nR8cRoqI0SF6RXcJ5RI=;
 b=ndajlqSWHaZlQB94T2zSV/2oF/POlNDLh4sHSMX1VYoaQK/DcxxIWZFMkEaPEihcRu
 a4sKtBIXRAyK0ThUKX4iC6iMspSo0DiGCa+PzyeLeALzknBHQCrPXFTfhs9BYRgZ8VyS
 OCk2W4IvZjSYg8PDOmUAnKFRcuz1D2vzBl25x9gxB2+YrpZDkoYINcoq0KMwNv1B7Ol/
 0A3KGhemmwPlt1eAKIwW/fF0aeIDpIIucf5b51XGIJ0HaZnva7LeaYs9NuLJYW06KswI
 gqbhPm7/QEqP+NB0lU4WWjY5e3g77FWwN0Jtk6HoY/70jjZk/+j76z6DZzH0b3qKGTCr
 y4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xioT+koXIxebA9dspAm78A75nR8cRoqI0SF6RXcJ5RI=;
 b=6J6N4ytYiG7MzxfPb5Wpe0/+NOgffLoRlHEOi01e7Qm09Yjv3GfR2xKYx2f70CwApr
 hPeaI4dYKHtrB1n2PhSpH/NOchFtZcY+B/U2pr+4qQiiaFU4FjofGqpRZZng6NRHDmD0
 lDywLwOPktIi0bimyOD/5C4lBj1vpz/oFQvpjdKzOrS3q4Skdz2RGcrXalBA82AxLf0k
 7J7A3E5YVmE2XcvbNMqIf2O053QuFCjrSpRHB3exVfCDzxK5uZTp/DSq3O9botFFDu9G
 F8eKY4jrdSIKA2TOY0GJmQhb8PrdkMyjn85QrIezOxzG0zua2mjviBjusNys/wx1y1l5
 PvCQ==
X-Gm-Message-State: AOAM5315RaPoMHMNfWivYAVOpQts2LbABDXHYANtMwilR/9HzsM3HWQQ
 hDLlMDBuYVr5fJyrc9NHeBWjGGqLYto=
X-Google-Smtp-Source: ABdhPJzPhb9/VAhFuUK1JCWy5DyAO3aciKsybxFH6aVt3H8C6TeL3QHPzDv/I7RJYRUD3IewBK+1uw==
X-Received: by 2002:a63:e516:: with SMTP id r22mr22994185pgh.197.1634548201705; 
 Mon, 18 Oct 2021 02:10:01 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id j198sm12264705pgc.4.2021.10.18.02.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:10:01 -0700 (PDT)
From: luo penghao <cgel.zte@gmail.com>
X-Google-Original-From: luo penghao <luo.penghao@zte.com.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, penghao luo <luo.penghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/i915: Remove redundant assignments
Date: Mon, 18 Oct 2021 09:09:55 +0000
Message-Id: <20211018090955.857276-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: penghao luo <luo.penghao@zte.com.cn>

The assignment of variables will be overwritten later, so the
assignment here is meaningless.

The clang_analyzer complains as follows:

drivers/gpu/drm/i915/gem/i915_gem_userptr.c:291: warning:

Although the value stored to 'ret' is used in the enclosing expression,
the value is never actually read from 'retâ€™.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: penghao luo <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 8ea0fa6..f6f944d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -288,7 +288,7 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 	if (!i915_gem_object_is_readonly(obj))
 		gup_flags |= FOLL_WRITE;
 
-	pinned = ret = 0;
+	pinned = 0;
 	while (pinned < num_pages) {
 		ret = pin_user_pages_fast(obj->userptr.ptr + pinned * PAGE_SIZE,
 					  num_pages - pinned, gup_flags,
-- 
2.15.2


