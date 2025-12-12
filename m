Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F82CB9364
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB73910E8F5;
	Fri, 12 Dec 2025 16:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8489A10E8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:03:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE0C133868;
 Fri, 12 Dec 2025 16:03:21 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE3D23EA65;
 Fri, 12 Dec 2025 16:03:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WJ0YKck8PGlnGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Dec 2025 16:03:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: [PATCH 1/5] drm/tests: shmem: Swap names of export tests
Date: Fri, 12 Dec 2025 17:00:32 +0100
Message-ID: <20251212160317.287409-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212160317.287409-1-tzimmermann@suse.de>
References: <20251212160317.287409-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: EE0C133868
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 
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

GEM SHMEM has 2 helpers for exporting S/G tables. Swap the names of
the rsp. tests, so that each matches the helper it tests.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by shmem")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 68f2c3162354..872881ec9c30 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -194,7 +194,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
  * scatter/gather table large enough to accommodate the backing memory
  * is successfully exported.
  */
-static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
+static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
 {
 	struct drm_device *drm_dev = test->priv;
 	struct drm_gem_shmem_object *shmem;
@@ -236,7 +236,7 @@ static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
  * backing pages are pinned and a scatter/gather table large enough to
  * accommodate the backing memory is successfully exported.
  */
-static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
+static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
 {
 	struct drm_device *drm_dev = test->priv;
 	struct drm_gem_shmem_object *shmem;
@@ -366,8 +366,8 @@ static struct kunit_case drm_gem_shmem_test_cases[] = {
 	KUNIT_CASE(drm_gem_shmem_test_obj_create_private),
 	KUNIT_CASE(drm_gem_shmem_test_pin_pages),
 	KUNIT_CASE(drm_gem_shmem_test_vmap),
-	KUNIT_CASE(drm_gem_shmem_test_get_pages_sgt),
 	KUNIT_CASE(drm_gem_shmem_test_get_sg_table),
+	KUNIT_CASE(drm_gem_shmem_test_get_pages_sgt),
 	KUNIT_CASE(drm_gem_shmem_test_madvise),
 	KUNIT_CASE(drm_gem_shmem_test_purge),
 	{}
-- 
2.52.0

