Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LBZMx/rb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:52:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB784BC6F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907C310E255;
	Tue, 20 Jan 2026 20:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WJ59Petf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C6A10E255
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 20:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768942363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gZsQHtvSF6rIYrYSsrnHHNu4UydWwEVQwV5U0Co97a8=;
 b=WJ59PetftxPnixD91l0Wth8dDQEfgARj9oBc/zYUq1zznec4jp6JC7PYJwAUFOAyrAoR4I
 YsFzW/fhuzqf9W5eEJg9sxjx462Pi/BxFvTqD6igwp9+K8YNXsu6O/kNxhe0IUDiFBAeZ+
 9N6FSZCOOnKdtBGkoKCZ1+VX2zpMobM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-vij6crnNOVySqJT6fm0QhQ-1; Tue, 20 Jan 2026 15:52:41 -0500
X-MC-Unique: vij6crnNOVySqJT6fm0QhQ-1
X-Mimecast-MFC-AGG-ID: vij6crnNOVySqJT6fm0QhQ_1768942361
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-432c05971c6so159628f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768942360; x=1769547160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZsQHtvSF6rIYrYSsrnHHNu4UydWwEVQwV5U0Co97a8=;
 b=r7/lHsdNOqENBDj/h6RtJb5wO6srkN0tkRylJ1Y2nWoHVrW/vQ3RW2CZHOPFY3Xndv
 BEvrxMZP2ZR409Dlpb7NsfkhUt1jBQ69dedQPjxjqc1TfXbfnvNbcqX8HgW6KY4qgEkB
 GQKVF30T13Ro1qFoyT3SXrdU8SqVJArSeqad/h5ny+NtMtJvmQp4Mvgs5wEVnlxKuQ0w
 nGkwGJdBA/0yCPGakF7LtKLEz1cWA1RjzpXzJTaT6KjCgDPXRceJtUMf5K44Rx4kbnHt
 OTagETOGGqiqeezQtDCI7z0Ww9bRBcXcpVw1mYKHJlKl6G/OTLIwH++HdNQgpWj+WvRz
 GFoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnpPAM6St1JrOpdLLGhThoXt5k2KSEHJi4jRl3GJRD5wtM01xEaR6pRbcJ4OR/CzmlPeF5WRssIQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA7s408wRDRXm4OQoOorWjpyEOvFzKo6L4koACNdoij+ihonUC
 NfUnS/Hzhmte9+MuamhXbPalPOrc9UQZiq+cH5zeW6ZQrFnepqqXdTGsH0+dubKZeN+ZcbCbYrz
 MPf22DBkmOJLyNOUSXiWLn/znutU4Q/vsoaJZW9O86OQ8HIyM7ulZ5gwNXtd2cp6ba2Tn
X-Gm-Gg: AZuq6aKM+jwMQNxpqwtsE0dXLbyuzdxS+kjZyRMLcT8yTUM2Ep6o6mIug1z8Q/wfyHO
 v2ZRaRrDdloZpxIv0OBXosL0N4ctvTKBeVlNQns9mixDH5zXuamAu4OCU3KTGoFh4U/LSnTwB9M
 N/okaD/8Ex2GJ6MpqFz732zdPzwho9q2QISOewwpU0ayq4RW6Cr0Hhb7abNoP6cWljG/6TI6czl
 NYlLdvnYNRhS/zcP2+axqaDBzdIjQDgQxTur9Bs2/DNlZzD23iQtsxNWRs/Le4eFD4ZGOqg8x1M
 XErrivddiEwJDuxuNzgFbDEUmcyVgsbWBIQj5aDB8j6ag2w/eLa4xUV3FGoAbWoGf4rOrlxXEOP
 XQFOvuUcZ96rq6h1PIPhquzQjSIhCpk1oj97YaVsaJo4Ia6SGcn2lEsA=
X-Received: by 2002:a05:6000:2505:b0:432:88c4:e180 with SMTP id
 ffacd0b85a97d-434d75c16a2mr29467600f8f.15.1768942360552; 
 Tue, 20 Jan 2026 12:52:40 -0800 (PST)
X-Received: by 2002:a05:6000:2505:b0:432:88c4:e180 with SMTP id
 ffacd0b85a97d-434d75c16a2mr29467575f8f.15.1768942360134; 
 Tue, 20 Jan 2026 12:52:40 -0800 (PST)
Received: from neptune.lan (host-82-62-247-97.business.telecomitalia.it.
 [82.62.247.97]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43595609c8asm3420478f8f.34.2026.01.20.12.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 12:52:39 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Marco Pagani <marpagan@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/sched: Add new KUnit test suite for concurrent job
 submission
Date: Tue, 20 Jan 2026 21:52:34 +0100
Message-ID: <20260120205236.322086-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: htjE_Uc3XdaLXIlXLNMxLRO7rRFRcUAw-cRcJ-47Qgs_1768942361
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[marpagan@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:marpagan@redhat.com,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[marpagan@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 3EB784BC6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new test suite to simulate concurrent job submissions from userspace.
The suite includes a basic test case where each worker submits a single
job, and a more advanced case involving the submission of multiple jobs.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 82a41a456b0a..7c25bcbbe7c9 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2025 Valve Corporation */
 
 #include <linux/delay.h>
+#include <linux/completion.h>
 
 #include "sched_tests.h"
 
@@ -235,6 +236,179 @@ static void drm_sched_basic_cancel(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
 }
 
+struct sched_concurrent_test_context {
+	struct drm_mock_scheduler *sched;
+	struct workqueue_struct *sub_wq;
+	struct completion wait_go;
+};
+
+KUNIT_DEFINE_ACTION_WRAPPER(destroy_workqueue_wrap, destroy_workqueue,
+			    struct workqueue_struct *);
+
+KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched_fini,
+			    struct drm_mock_scheduler *);
+
+KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_mock_sched_entity_free,
+			    struct drm_mock_sched_entity *);
+
+static int drm_sched_concurrent_init(struct kunit *test)
+{
+	struct sched_concurrent_test_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+
+	init_completion(&ctx->wait_go);
+
+	ctx->sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+
+	ret = kunit_add_action_or_reset(test, drm_mock_sched_fini_wrap, ctx->sched);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Use an unbounded workqueue to maximize job submission concurrency */
+	ctx->sub_wq = alloc_workqueue("drm-sched-submitters-wq", WQ_UNBOUND,
+				      WQ_UNBOUND_MAX_ACTIVE);
+	KUNIT_ASSERT_NOT_NULL(test, ctx->sub_wq);
+
+	ret = kunit_add_action_or_reset(test, destroy_workqueue_wrap, ctx->sub_wq);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	test->priv = ctx;
+
+	return 0;
+}
+
+struct drm_sched_concurrent_params {
+	const char *description;
+	unsigned int job_base_us;
+	unsigned int num_jobs;
+	unsigned int num_subs;
+};
+
+static const struct drm_sched_concurrent_params drm_sched_concurrent_cases[] = {
+	{
+		.description = "Concurrently submit a single job in a single entity",
+		.job_base_us = 1000,
+		.num_jobs = 1,
+		.num_subs = 32,
+	},
+	{
+		.description = "Concurrently submit multiple jobs in a single entity",
+		.job_base_us = 1000,
+		.num_jobs = 10,
+		.num_subs = 64,
+	},
+};
+
+static void
+drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *params, char *desc)
+{
+	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, drm_sched_concurrent_desc);
+
+struct submitter_data {
+	struct work_struct work;
+	struct sched_concurrent_test_context *ctx;
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_sched_job **jobs;
+	struct kunit *test;
+	unsigned int id;
+	bool timedout;
+};
+
+static void drm_sched_submitter_worker(struct work_struct *work)
+{
+	const struct drm_sched_concurrent_params *params;
+	struct sched_concurrent_test_context *ctx;
+	struct submitter_data *sub_data;
+	unsigned int i, duration_us;
+	unsigned long timeout_jiffies;
+	bool done;
+
+	sub_data = container_of(work, struct submitter_data, work);
+	ctx = sub_data->ctx;
+	params = sub_data->test->param_value;
+
+	wait_for_completion(&ctx->wait_go);
+
+	for (i = 0; i < params->num_jobs; i++) {
+		duration_us = params->job_base_us + (sub_data->id * 10);
+		drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us);
+		drm_mock_sched_job_submit(sub_data->jobs[i]);
+	}
+
+	timeout_jiffies = usecs_to_jiffies(params->job_base_us * params->num_subs *
+					   params->num_jobs * 10);
+	for (i = 0; i < params->num_jobs; i++) {
+		done = drm_mock_sched_job_wait_finished(sub_data->jobs[i],
+							timeout_jiffies);
+		if (!done)
+			sub_data->timedout = true;
+	}
+}
+
+static void drm_sched_concurrent_submit_test(struct kunit *test)
+{
+	struct sched_concurrent_test_context *ctx = test->priv;
+	const struct drm_sched_concurrent_params *params = test->param_value;
+	struct submitter_data *subs_data;
+	unsigned int i, j;
+	int ret;
+
+	subs_data = kunit_kcalloc(test, params->num_subs, sizeof(*subs_data),
+				  GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, subs_data);
+
+	/*
+	 * Pre-allocate entities and jobs in the main thread to avoid KUnit
+	 * assertions in submitters threads
+	 */
+	for (i = 0; i < params->num_subs; i++) {
+		subs_data[i].id = i;
+		subs_data[i].ctx = ctx;
+		subs_data[i].test = test;
+		subs_data[i].timedout = false;
+		subs_data[i].entity = drm_mock_sched_entity_new(test,
+								DRM_SCHED_PRIORITY_NORMAL,
+								ctx->sched);
+
+		ret = kunit_add_action_or_reset(test, drm_mock_sched_entity_free_wrap,
+						subs_data[i].entity);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		subs_data[i].jobs = kunit_kcalloc(test, params->num_jobs,
+						  sizeof(*subs_data[i].jobs), GFP_KERNEL);
+		KUNIT_ASSERT_NOT_NULL(test, subs_data[i].jobs);
+
+		for (j = 0; j < params->num_jobs; j++)
+			subs_data[i].jobs[j] = drm_mock_sched_job_new(test,
+								      subs_data[i].entity);
+
+		INIT_WORK(&subs_data[i].work, drm_sched_submitter_worker);
+		queue_work(ctx->sub_wq, &subs_data[i].work);
+	}
+
+	complete_all(&ctx->wait_go);
+	flush_workqueue(ctx->sub_wq);
+
+	for (i = 0; i < params->num_subs; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, subs_data[i].timedout,
+				       "Job submitter worker %u timedout", i);
+}
+
+static struct kunit_case drm_sched_concurrent_tests[] = {
+	KUNIT_CASE_PARAM(drm_sched_concurrent_submit_test, drm_sched_concurrent_gen_params),
+	{}
+};
+
+static struct kunit_suite drm_sched_concurrent = {
+	.name = "drm_sched_concurrent_tests",
+	.init = drm_sched_concurrent_init,
+	.test_cases = drm_sched_concurrent_tests,
+};
+
 static struct kunit_case drm_sched_cancel_tests[] = {
 	KUNIT_CASE(drm_sched_basic_cancel),
 	{}
@@ -556,6 +730,7 @@ static struct kunit_suite drm_sched_credits = {
 };
 
 kunit_test_suites(&drm_sched_basic,
+		  &drm_sched_concurrent,
 		  &drm_sched_timeout,
 		  &drm_sched_cancel,
 		  &drm_sched_priority,
-- 
2.52.0

