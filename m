Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFwKEnuFnWmVQQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 12:03:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9247185D39
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 12:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081CF10E55D;
	Tue, 24 Feb 2026 11:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PdwT7m+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82810E55D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 11:03:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A63A6132E;
 Tue, 24 Feb 2026 11:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF03C116D0;
 Tue, 24 Feb 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771930994;
 bh=7GZscK1QcG8BnMWhGBGyuFu+8Wt6vbD0+u4yeV1is4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=PdwT7m+qY9OQtUWzDczRKe7OedwTzTgTMx0ypy+iiku5tl4YjtUVN/x54m/cwLsq+
 KoHrVkfX9bVSqnmycNVry2jlk7A1AZEmnqZkROXcldOp6Z/KqO4lEntll16B+eftCy
 yGl6emmnaRis1PR1vmtQ7U2Bipv6gUlb4txkiCM8kBiZlhXtN1buVKeg5Rk/1Fj1Et
 DMAE04S5FAJHRYHcepGahpF1GZHvoLY86qpVK6JH4Wy7KWdCIT/voO+nnWv0MLOa3R
 Ma+NjvucARi0lAgIk7Ea8qAuGvtBRzyIl1sIdVY9TlKijJ0XSA5q/FAICc4XmQohXk
 NGz9U8kGSSprQ==
From: Maxime Ripard <mripard@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: Mark slow tests as slow
Date: Tue, 24 Feb 2026 12:03:10 +0100
Message-ID: <20260224110310.1854608-1-mripard@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:mripard@kernel.org,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D9247185D39
X-Rspamd-Action: no action

Some DRM tests cross the 1s execution time threshold that defines a test
as slow. Let's flag them as such.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 4 ++--
 drivers/gpu/drm/tests/drm_buddy_test.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 82a41a456b0a..a5a5a35a87b0 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -419,11 +419,11 @@ static void drm_sched_change_priority(struct kunit *test)
 		drm_mock_sched_entity_free(entity[i]);
 }
 
 static struct kunit_case drm_sched_priority_tests[] = {
 	KUNIT_CASE(drm_sched_priorities),
-	KUNIT_CASE(drm_sched_change_priority),
+	KUNIT_CASE_SLOW(drm_sched_change_priority),
 	{}
 };
 
 static struct kunit_suite drm_sched_priority = {
 	.name = "drm_sched_basic_priority_tests",
@@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kunit *test)
 	drm_mock_sched_entity_free(entity);
 	drm_mock_sched_fini(sched);
 }
 
 static struct kunit_case drm_sched_credits_tests[] = {
-	KUNIT_CASE(drm_sched_test_credits),
+	KUNIT_CASE_SLOW(drm_sched_test_credits),
 	{}
 };
 
 static struct kunit_suite drm_sched_credits = {
 	.name = "drm_sched_basic_credits_tests",
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index e6f8459c6c54..35ca79525f43 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -908,11 +908,11 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
-	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
+	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
 	KUNIT_CASE(drm_test_buddy_alloc_exceeds_max_order),
 	{}
 };
 
 static struct kunit_suite drm_buddy_test_suite = {
-- 
2.52.0

