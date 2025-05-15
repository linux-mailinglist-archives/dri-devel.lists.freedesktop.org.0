Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA2AB8A1D
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C19B10E8E9;
	Thu, 15 May 2025 15:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ETtlk1oZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F8210E8E5;
 Thu, 15 May 2025 15:00:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a35919fa8bso301596f8f.0; 
 Thu, 15 May 2025 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747321242; x=1747926042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6dxrAsBZ4ZjQ+kj5PNlM7jYzWQJ2+EppJeRXsI+hBmc=;
 b=ETtlk1oZAhkdS4+jU7L2fTGRGbUESfP15JTtL6anAiz2utzK9MMNEw5NHz0TuS+i5+
 DpDsCWsHvFowoXotvNuNiTLtW7Y3CToaFXClUWN/pi6Plk7LjrgYODAVbkULgL8r6TtK
 TZbMntqBdg17pA83RgrDxxhxaruHMEM4+9zsc77fOuul/84omtv2G4jmebCofT51gNBS
 UXHuz9ikLJsSu8utn4qciQiNHIdRNG9XCsbBLTfksjAeCTHzaWwESlgLJmLUu/25JTXs
 nzxfH0rKmgqlm/BMt21xy3z/8ccnIu9Wm7bEMiTUjvoGZTlJf5/AC4jRIL6oGtGgLdwH
 WHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747321242; x=1747926042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dxrAsBZ4ZjQ+kj5PNlM7jYzWQJ2+EppJeRXsI+hBmc=;
 b=eNPB2yKV3u9qfh1AAyNy1QxFa8dEeqeZ9eKQEjWr7CrCDVJ0reKQVhLumhy3DLavli
 Kyt+HAk7bkpYs/YrxL1Y1OagVMlfZebd+DB2xhvG6X9ih2HCkPMrQUU346YIBiHV8U+b
 4YwCHhFmbg0yvVaVrenqMz8/VDmCD8HscPwMhj90ulqzVIVMTeI30rMCOMzcuPWO9qZE
 WKP10t2OxMq/NBLitBPiJmlFsjG/gmwgpCII+EaJ1XV2qYqv+O+5YpGlPFRyPj7qrk06
 LX6kI9asG0lWh5SlE1s7Nif2pDMbtAV8evsjexX87ibPPcmHfp2oUjqxc7wBI+lBBVtz
 wmIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOTKL/+GVg9DnN2WyDXdyNyxz5kwFiDnSe/uIrNwcBru6YvxS0Wt2OBMu/Y9hhrb1FQ9h1dbDK@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8IXYWl/dZfFOqXieLm8wQiOgOHNHi1pYuYjifEOq58frKrWWC
 +o6bXmLfEGxb1xuEhIkYYUlCrbLIjOjeHzZnx8zc5pMz8xuvsExHbwx+wtS54Q==
X-Gm-Gg: ASbGnct/6/epsyzXLhpP9zxoE0FN+4/hwPg1iymq5sB4IiNB1W4TOAfr/MnocqA1WmW
 y/HQXi9jOW8oKszRbdyAnNA+UFPWTvPTePgTY6uXVXM2aey+tC0fsf5TPLEIumGbGq+WADYrr53
 sCllkjYq2AHl5LhXplU2g6hgNNHecDITB11K1oPdpyFIyk9UNB5R4wPKArn6v/Ifc3jDQdoh8mb
 DramAZyO8jb3LhdZX+eTlHpzF/S5cDibizCHj5uWxW1ZK4oM18woZ5kok2S95gCiTS1rwwk5GZE
 FiP0XJ14WTmof7/gENWBNeEn5v/yKOFIx+98oqpVX/c9m0qqhvDHxzTKZsPvfV8g
X-Google-Smtp-Source: AGHT+IGA8MF12gsWkykwsvDCC6DTz3jfWDgP7cHSJ2iQekCDPXZdaZPFCWMSeW5bYUyUyGZc7OYe8Q==
X-Received: by 2002:a5d:5886:0:b0:3a0:a0e5:d28b with SMTP id
 ffacd0b85a97d-3a35c80710fmr110999f8f.3.1747321241653; 
 Thu, 15 May 2025 08:00:41 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15b1:d600:9d43:bc40:55da:2532])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39e8578sm75808185e9.29.2025.05.15.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 08:00:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/sched: Add a test for prealloced fence slots
Date: Thu, 15 May 2025 17:00:37 +0200
Message-Id: <20250515150038.4615-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515150038.4615-1-christian.koenig@amd.com>
References: <20250515150038.4615-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 59 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594..abe7370047bd 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -469,8 +469,65 @@ static struct kunit_suite drm_sched_credits = {
 	.test_cases = drm_sched_credits_tests,
 };
 
+static void drm_sched_test_prealloc(struct kunit *test)
+{
+	struct dma_fence *stub = dma_fence_get_stub();
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job;
+	u32 id1, id2;
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
+	ret = drm_sched_job_prealloc_dependency_slot(&job->base, &id1);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_sched_job_prealloc_dependency_slot(&job->base, &id2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_NE(test, id1, id2);
+
+	drm_sched_job_add_prealloc_dep(&job->base, id1, dma_fence_get(stub));
+	drm_sched_job_add_prealloc_dep(&job->base, id2, dma_fence_get(stub));
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

