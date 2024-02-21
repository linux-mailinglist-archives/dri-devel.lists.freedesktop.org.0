Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D585D380
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBE410E67B;
	Wed, 21 Feb 2024 09:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QNM5aOfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B8B10E4F7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:33 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-dc6ade10cb8so13005248276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507712; x=1709112512;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bJ5a/DjWOVsBkmci+JDRuU6kR6Brs0uJ/9gc+PKy6/o=;
 b=QNM5aOfanFzSCtKmfQ6fjenXDt8l+aST19g0Vc6tt4+cnKI/mAN+geLb1RopDu+DcC
 42LARs3SvfEMZqUaKHCjdovzaUJS6NhTyH/2MqX8rASA+3vVD5uKdJq1jPxWBWODvtII
 1AybL4jIm1lnF2Kmt+mijPmK1PJjoW577p6UeLysZ4WooSixJ9JEn97wCTccCqh0F+2U
 R8f23M0hS3pdnuxvrmDYkc8QW8PDhDWl3Sy45LqhdCnOsUKqloTC82FlT4Dai0mCbCuw
 VGO+YV/HDer0gW1s68RilaY+PHFTS/09UIKDSqjTlNIbsXywh+7ICc1mmS7QLM+MaLEE
 dWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507712; x=1709112512;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJ5a/DjWOVsBkmci+JDRuU6kR6Brs0uJ/9gc+PKy6/o=;
 b=nYa8xMpkHKHTuiY8wrHCgLQkG1s9QR9VIw2/dioxUGSMf5Weh+CFuzP02G0geyDwJ6
 nnvOuhxEopa5KvcoxzGNg7qLWGmjJvX9AcQPgQDY+3gVyclHfWuuAT9qqLj3v1cWYjKN
 PMUTV5bCpcexVMUO4bcHEzwwP0y4Q9OPBKuOA688fYhUVIWLT7z/vWapsHspg3gD28Ek
 Pc+66zDsr/Gn+SYHIaSJQlN3V3ej8zr1JUzH5KMrECeRVRlYxWm6RqjAtfkCvnCkPp0J
 Fd/sTphqKYS3baT8iYW6KwDm+2n1B9qK8ASyYNQLedc9OvuE4BFPM9JUnrW3gOvXy6yy
 6Cqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURNVmVu49t5Ruwtega2k4SOUpqsiez6XDRPhm6HLZ35kY2Mvf1GhxfynBjwAfFlWKjvQbjtbzRXDaDEhLzlqe9MU3Zkxfb2k+dYSWt0apO
X-Gm-Message-State: AOJu0YzVbTQy8soeOVn573jGMhTOb6wqi40SVSc+0LTUkfIzh/xTV7Cc
 8kHFguw4TlwBpwd33dTwwRURdWf1++yoDRP3zcomrf9iB+C0zInUX/8lpI0Hy3SJaWvz9p7En76
 uwDPmB7odlw==
X-Google-Smtp-Source: AGHT+IGGnV8a4VQV8ckgYhdSC+moSz25Q0LZNkggi3KHg0lKbDC7oV4HVzTEvYLgrd72xK+9aVEkald37xppwg==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:eb07:0:b0:dc6:b7c2:176e with SMTP id
 d7-20020a25eb07000000b00dc6b7c2176emr3756666ybs.4.1708507712541; Wed, 21 Feb
 2024 01:28:32 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:20 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-8-davidgow@google.com>
Subject: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in KUnit
 tests
From: David Gow <davidgow@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Willem de Bruijn <willemb@google.com>,
 Florian Westphal <fw@strlen.de>, Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
message. gcc warns if a printf format string is empty (apparently), so
give these some more detailed error messages, which should be more
useful anyway.

Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
 drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 8a464f7f4c61..3dbfa3078449 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -55,30 +55,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 		KUNIT_ASSERT_FALSE_MSG(test,
 				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							      ps, ps, list, 0),
-				       "buddy_alloc hit an error size=%d\n",
+				       "buddy_alloc hit an error size=%lu\n",
 				       ps);
 	} while (++i < n_pages);
 
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%d\n", 3 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
 
 	drm_buddy_free_list(&mm, &middle);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   2 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
 
 	drm_buddy_free_list(&mm, &right);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
 	/*
 	 * At this point we should have enough contiguous space for 2 blocks,
 	 * however they are never buddies (since we freed middle and right) so
@@ -87,13 +87,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    2 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=%d\n", 2 * ps);
+			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
 
 	drm_buddy_free_list(&mm, &left);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    3 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=%d\n", 3 * ps);
+			       "buddy_alloc hit an error size=%lu\n", 3 * ps);
 
 	total = 0;
 	list_for_each_entry(block, &allocated, link)
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 1eb0c304f960..f37c0d765865 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -157,7 +157,7 @@ static void drm_test_mm_init(struct kunit *test)
 
 	/* After creation, it should all be one massive hole */
 	if (!assert_one_hole(test, &mm, 0, size)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm not one hole on creation");
 		goto out;
 	}
 
@@ -171,14 +171,14 @@ static void drm_test_mm_init(struct kunit *test)
 
 	/* After filling the range entirely, there should be no holes */
 	if (!assert_no_holes(test, &mm)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm has holes when filled");
 		goto out;
 	}
 
 	/* And then after emptying it again, the massive hole should be back */
 	drm_mm_remove_node(&tmp);
 	if (!assert_one_hole(test, &mm, 0, size)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm does not have single hole after emptying");
 		goto out;
 	}
 
-- 
2.44.0.rc0.258.g7320e95886-goog

