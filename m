Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF586A7FD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 06:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB8910E0A6;
	Wed, 28 Feb 2024 05:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0iLZPYY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B96C10E0A6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 05:27:30 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-608e88ca078so49482107b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 21:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709098049; x=1709702849;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3qlQXkJNmXY3V9U5JrSaKD9CZoD39fkjGBycAj3A9pQ=;
 b=0iLZPYY+Oy+qp+X7dH7CV3eth+S4ouUYow6V3Hc3R6VRuistkmFE/LNpY8WZ3D33jg
 UKTqSuyqVldUl3hATeQ2XKOS8yHet2WnRxgKBlEw1NN7CNg69iZ5eefnP/s09WKOLmWT
 k/kuUqnX0AGyGgguQPdHtv0SS8ZocO6s5fxLAJuzq81Xe/VioZvd+3dTVOuZHIgne81W
 ysZzrzHjmwB9uw+j1/4o8bmDwhW3gNOIv4sH+5uKLNykXj73UYOWXPygJ/xbr+f595nK
 ZsKqW0EztUcnT23sanVKiLcwiUNCI11+WKJk83LfQula1g1XyPEafvBKzDlE5NKSnYZZ
 C+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709098049; x=1709702849;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qlQXkJNmXY3V9U5JrSaKD9CZoD39fkjGBycAj3A9pQ=;
 b=lq/APmpfuGBm+hC1fbk7sB/hRUJJmCxH+iy6cwU4+2f+2G6+p65/4ILTf9KJWMXCIL
 d0IHr5XnhGpca2DW+by+bIcrym1XgwqgqEAav2olWWQzOTgrYplrOTACEO/eYHG58kEc
 mvDiVIay4SpApwxssQ090wbAgepyfe2vt3pJ9jjHFOxQgbG5E+stuzwNYsHSiUIgr6kl
 OBJxukabJbc8sGBTpSIMNq4EYFRpnIqiE/wQpxQxST/cgIRZJayNeE8yQQihpMy1cISS
 FxUHCJR8XVLZQUzoaQgxGwrXor0WLZpWRuqjuiG3XNNl34X5MmI6M72AiCJct9q6jCaa
 kUpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdfv7o47mrwHpEgysVbwCTSC01AVrF30SKtCV0+rEHjYDec+rlPd3iDvz1hd6aN9Hnd5H1dQVBh9ETMVB6RpupjmdV+zIA24eGbC/NImHY
X-Gm-Message-State: AOJu0Yz3bFXUUKoAnJ9d3C2xz8qqMearx384Rv65IdKw9JVxYnHg4Mey
 Jh067D+OP1OTnaQgPonWSNIsOVthFo5v/xiovy/h3NXCxi5mCJP5uS1fVI+bwbClVfLJDUY30p5
 OQX/csyG8qQ==
X-Google-Smtp-Source: AGHT+IH+/qGhGDq3Yovyrglwb4bcFyvgK7xysDbRhlcFNgma2qcuZmmIjriDyKoazNpJafEO07qRx6QW2gm0kA==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:b341:0:b0:dcb:bc80:8333 with SMTP id
 k1-20020a25b341000000b00dcbbc808333mr455657ybg.13.1709098049017; Tue, 27 Feb
 2024 21:27:29 -0800 (PST)
Date: Wed, 28 Feb 2024 13:27:20 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240228052722.409679-1-davidgow@google.com>
Subject: [PATCH v2] drm: tests: Fix invalid printf format specifiers in KUnit
 tests
From: David Gow <davidgow@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Arthur Grillo <arthur.grillo@usp.br>
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Latypov <dlatypov@google.com>, David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
which was then updated to be an 'unsigned long' to avoid 64-bit
multiplication division helpers.

However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
'%d' or '%llu' format specifiers, the former of which is always wrong,
and the latter is no longer correct now that ps is no longer a u64. Fix
these to all use '%lu'.

Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
message. gcc and clang warns if a printf format string is empty, so
give these some more detailed error messages, which should be more
useful anyway.

Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targ=
ets")
Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

Changes since v1:
https://lore.kernel.org/linux-kselftest/20240221092728.1281499-8-davidgow@g=
oogle.com/
- Split this patch out, as the others have been applied already.
- Rebase on 6.8-rc6
- Add everyone's {Reviewed,Acked,Tested}-by tags. Thanks!

---
 drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
 drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests=
/drm_buddy_test.c
index 2f32fb2f12e7..3dbfa3078449 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -55,30 +55,30 @@ static void drm_test_buddy_alloc_contiguous(struct kuni=
t *test)
 		KUNIT_ASSERT_FALSE_MSG(test,
 				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							      ps, ps, list, 0),
-				       "buddy_alloc hit an error size=3D%u\n",
+				       "buddy_alloc hit an error size=3D%lu\n",
 				       ps);
 	} while (++i < n_pages);
=20
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=3D%u\n", 3 * ps);
+			       "buddy_alloc didn't error size=3D%lu\n", 3 * ps);
=20
 	drm_buddy_free_list(&mm, &middle);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=3D%u\n", 3 * ps);
+			       "buddy_alloc didn't error size=3D%lu\n", 3 * ps);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   2 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=3D%u\n", 2 * ps);
+			       "buddy_alloc didn't error size=3D%lu\n", 2 * ps);
=20
 	drm_buddy_free_list(&mm, &right);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=3D%u\n", 3 * ps);
+			       "buddy_alloc didn't error size=3D%lu\n", 3 * ps);
 	/*
 	 * At this point we should have enough contiguous space for 2 blocks,
 	 * however they are never buddies (since we freed middle and right) so
@@ -87,13 +87,13 @@ static void drm_test_buddy_alloc_contiguous(struct kuni=
t *test)
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    2 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=3D%u\n", 2 * ps);
+			       "buddy_alloc hit an error size=3D%lu\n", 2 * ps);
=20
 	drm_buddy_free_list(&mm, &left);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    3 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=3D%u\n", 3 * ps);
+			       "buddy_alloc hit an error size=3D%lu\n", 3 * ps);
=20
 	total =3D 0;
 	list_for_each_entry(block, &allocated, link)
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/dr=
m_mm_test.c
index 1eb0c304f960..f37c0d765865 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -157,7 +157,7 @@ static void drm_test_mm_init(struct kunit *test)
=20
 	/* After creation, it should all be one massive hole */
 	if (!assert_one_hole(test, &mm, 0, size)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm not one hole on creation");
 		goto out;
 	}
=20
@@ -171,14 +171,14 @@ static void drm_test_mm_init(struct kunit *test)
=20
 	/* After filling the range entirely, there should be no holes */
 	if (!assert_no_holes(test, &mm)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm has holes when filled");
 		goto out;
 	}
=20
 	/* And then after emptying it again, the massive hole should be back */
 	drm_mm_remove_node(&tmp);
 	if (!assert_one_hole(test, &mm, 0, size)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm does not have single hole after emptying");
 		goto out;
 	}
=20
--=20
2.44.0.rc1.240.g4c46232300-goog

