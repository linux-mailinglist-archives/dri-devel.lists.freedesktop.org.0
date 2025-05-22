Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1E3AC0D0B
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346A110EE38;
	Thu, 22 May 2025 13:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ky7b/C0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320810EE10;
 Thu, 22 May 2025 13:41:25 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-601ab204085so8911463a12.1; 
 Thu, 22 May 2025 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747921284; x=1748526084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rqwkMrM5JL4EFpQh48JAg7ETFNDz+6d5oJlHLbW/gEc=;
 b=ky7b/C0YOzBK4uqozmbotWdoVa+W2JgkIqkVOpqopduNJYfS7o/9dWv2w8SkyzGNkL
 j+HWt0kSQPv+tmZiTW+MS7/d904A4UNXCXDAW+7cRUzsivkWuQlR2juwXjT7cxxIlfbj
 1YnBZchBX1+3Xtv7YbJEU8qYQFccUzagLaoPAW7/QqQhaCt4bE5XEcvddVkKcbWEiHC9
 CqBCjsFmWj5r0X0f2me65tTN4ZLyvzwDf+BvQ6TUHGqqPhXgxVh+N5skG6AT8cbI6E5r
 ufuSjMytS9Jp83/0GZitPNC0L0joejoZYRtP91N+d6R/rdU+QqwwQk0gGh6FVAQdwQsX
 62wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747921284; x=1748526084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqwkMrM5JL4EFpQh48JAg7ETFNDz+6d5oJlHLbW/gEc=;
 b=WqwxnZ8DVRt+FsVkGG4GWw0CBJbbiG7OXEjDbFn8pC1hCYCVwKB/J1DAHcPwOcMVbd
 AVphC7jFBKGlshXX38KTpC2RC3KFEA0CQIFK7EYwdDRxtvOpDgIB583cAntdzYKuLd2g
 JEIt8Dc7MGfiK3vAgun0N+1/BREic9R91pQ5OK3qrkBJE3BH38ePTSfj90O3CGuHO/cE
 KAeQxAJRlO9Otg8erXxsSuZLDhJ6TkZInfutu6rcUVsl61a8dQ1JqEvs1z8EtKkjHqEN
 p5Il6uG2rpwUJuyQWylTfJiAFk6RrgIvZdoXZRRRhtrilrQbL+p3XQxbdbO6XhQ3w0Pa
 4NrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPylvVbOhBo6D39aAtgEWE8d97sgwLmDH8vF+7okVE8XZ2Z2vkvGREiwMYQGU7ejZN0fS5WV1R@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw975WY8LDd/Z0HrFIs5LPd/UKl4l6zn3E6TgPAr431og8HvA9i
 80ZpHbkas0MpzMwgllLm0qnWjcgfY4O6mZj4lnbfyycAv6rXsvvBdAY4XO+h2g==
X-Gm-Gg: ASbGncs7/Zql3KMu7xXEz5LEXrZLLGIzBehSpBBFSffDoSYganPDGOpZ7yuxI+RVDea
 t+xKO8mRUE67KbmJDbh8vWBFA8QPG+KiuTUYJ9+tQsCyelrF82utOrHgX5g9IuxuhutGoLBOCNQ
 fXTChKdjsSlt9hPdZZESgF1wL1j7bAjjXdmF9S+14AUijMdN145/lUMs/iAjQx+GQVkCg7XozaZ
 Sg5SPZ6NvM/AiAkSNA1GoYgbFIHZloGdPVpMqnUweFalETX7+B0aL4+BFZy4xcRDDOqLLb3onkC
 peqwQpCeMPi2SY3w5PolTHMTwdC4GRDOFiu3Nyr/R/EA5zHYKN4hj2zx12aZznE=
X-Google-Smtp-Source: AGHT+IGKQcznMRO8eRwQiL0cx5jGegvSLfWKKSFw4emte/WIEiLdu6cRH3nnkD/nOC8PMVKSKLyDaA==
X-Received: by 2002:a17:907:960a:b0:ad3:e742:69ea with SMTP id
 a640c23a62f3a-ad52f86c635mr2091109466b.14.1747921283473; 
 Thu, 22 May 2025 06:41:23 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1533:800:9db1:9b52:19ec:8c5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04af40sm1082487566b.34.2025.05.22.06.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:41:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/sched: Add a test for prealloced fence slots
Date: Thu, 22 May 2025 15:41:16 +0200
Message-Id: <20250522134117.7561-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522134117.7561-1-christian.koenig@amd.com>
References: <20250522134117.7561-1-christian.koenig@amd.com>
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

Just to exercise the functionality.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594..00dcee298100 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -469,8 +469,62 @@ static struct kunit_suite drm_sched_credits = {
 	.test_cases = drm_sched_credits_tests,
 };
 
+static void drm_sched_test_prealloc(struct kunit *test)
+{
+	struct dma_fence *stub = dma_fence_get_stub();
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job;
+	bool done;
+	int ret;
+
+	/*
+	 * Check if preallocation of dependency slots work
+	 */
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+
+	entity = drm_mock_sched_entity_new(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+
+	job = drm_mock_sched_job_new(test, entity);
+
+	ret = drm_sched_job_add_dependency(&job->base, dma_fence_get(stub));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_sched_job_prealloc_dependency_slots(&job->base, 2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_sched_job_add_dependency(&job->base, dma_fence_get(stub));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_sched_job_add_dependency(&job->base, dma_fence_get(stub));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	drm_mock_sched_entity_free(entity);
+	drm_mock_sched_fini(sched);
+	dma_fence_put(stub);
+}
+
+static struct kunit_case drm_sched_prealloc_tests[] = {
+	KUNIT_CASE(drm_sched_test_prealloc),
+	{}
+};
+
+static struct kunit_suite drm_sched_prealloc = {
+	.name = "drm_sched_basic_prealloc_tests",
+	.test_cases = drm_sched_prealloc_tests,
+};
+
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
 		  &drm_sched_priority,
 		  &drm_sched_modify_sched,
-		  &drm_sched_credits);
+		  &drm_sched_credits,
+		  &drm_sched_prealloc);
-- 
2.34.1

