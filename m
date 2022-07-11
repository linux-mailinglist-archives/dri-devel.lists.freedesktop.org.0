Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6064C570B80
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C8D8B4AC;
	Mon, 11 Jul 2022 20:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EDB8B05E;
 Mon, 11 Jul 2022 20:25:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2311BB81230;
 Mon, 11 Jul 2022 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E795C341D1;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571125;
 bh=ijCPUHCQ+PvIvqv0lj0eAF28GMG83iZ88gPn2azWN00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LuT7CaQRkdWFb8J/EDSonrTwNrneFh4vQzZa34mfbf3abyiL9uJB0RNLTsPkHeCg9
 Gvy/qehbvXma6MzykQXN6Q3bAWc9AgkVRyK737bGrBp4jccYBKwaoDhHHmVQ68qfkL
 QxNqwvTJi2HNVQLXX5pxdT9uId/imH0kHyPC4xg6F6hJ6PoR8puYgEKWx1mJr4pdTP
 xp4QpPXQmhDIu74KD0OzuNfbuv0W0qDQDEhsz7OshIbocDgDlNWJs/g9txY5KijQMz
 LEXa5jPSdb82yxhavdHFzgrH+8LNGXx1r4ih4RoBXA7oxqc2FReW+kwZEV2CdgUHhq
 7aqWQhvXVAkKw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8I-LS;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 17/32] drm/i915: i915_gem_wait.c: fix a kernel-doc markup
Date: Mon, 11 Jul 2022 21:25:02 +0100
Message-Id: <54d781157866d7dc4f656b50500f228dca4070ed.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return codes for i915_gem_wait_ioctl() have identation issues,
and will be displayed on a very confusing way. Use lists to improve
its output.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index bdba05492582..7b4e216a295b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -176,23 +176,25 @@ static unsigned long to_wait_timeout(s64 timeout_ns)
  * @data: ioctl data blob
  * @file: drm file pointer
  *
- * Returns 0 if successful, else an error is returned with the remaining time in
- * the timeout parameter.
- *  -ETIME: object is still busy after timeout
- *  -ERESTARTSYS: signal interrupted the wait
- *  -ENONENT: object doesn't exist
- * Also possible, but rare:
- *  -EAGAIN: incomplete, restart syscall
- *  -ENOMEM: damn
- *  -ENODEV: Internal IRQ fail
- *  -E?: The add request failed
- *
  * The wait ioctl with a timeout of 0 reimplements the busy ioctl. With any
  * non-zero timeout parameter the wait ioctl will wait for the given number of
  * nanoseconds on an object becoming unbusy. Since the wait itself does so
  * without holding struct_mutex the object may become re-busied before this
  * function completes. A similar but shorter * race condition exists in the busy
  * ioctl
+ *
+ * Returns:
+ * 0 if successful, else an error is returned with the remaining time in
+ * the timeout parameter.
+ * * -ETIME: object is still busy after timeout
+ * * -ERESTARTSYS: signal interrupted the wait
+ * * -ENONENT: object doesn't exist
+ *
+ * Also possible, but rare:
+ * * -EAGAIN: incomplete, restart syscall
+ * * -ENOMEM: damn
+ * * -ENODEV: Internal IRQ fail
+ * * -E?: The add request failed
  */
 int
 i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
-- 
2.36.1

