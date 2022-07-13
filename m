Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C8573064
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6A959B6;
	Wed, 13 Jul 2022 08:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0E29527D;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6901FB81D5A;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070B7C385A2;
 Wed, 13 Jul 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=bME4oJz6dR2dL+exdw8ZiepOjromIutAKbYd7CbWH1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i0Ok75E1qOpSqD7A+Pl6xuMC5wXKTvxjMQUDYRMkuCPvxHd6xy+KSfcITt5p45Luy
 Iki8Zobqq25c91WZeLhbg7F2DEdB2mQla4e6mbuTaRY1WP4cWIifKQbOZpAgXYsv1s
 faElSYNBCaFtSnJognOL3HUhOI0yW1hEKdhL+F60mbpl6z47B/zcu6Gi7Ydd2s0ZtA
 TzSFr4KDeiBD5G2k14XixU+6AEmn7Ep3HoZcRiwTS3c8JehaVgydMjLFaPwMLoe+Gu
 ByAySK5ipHqr3wE1Z75dtio1CThV5TaOSTb91D4DINhuPBFSr95kwLNWKmqvEx5Y5A
 34+bkAKYeS57g==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004ztY-Mb;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 19/39] drm/i915: i915_gem_region.h: fix
 i915_gem_apply_to_region_ops doc
Date: Wed, 13 Jul 2022 09:12:07 +0100
Message-Id: <f197e0eccbde017dccbd31e72c892a102543cb90.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
 linux-kernel@vger.kernel.org, Nirmoy Das <nirmoy.das@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel-doc markup for i915_gem_apply_to_region_ops() has some
issues:

1. The field should be marked as @process_obj;
2. The callback parameters aren't document properly, as sphinx
   will consider them to be placed at the wrong place.

Fix (1) and change the way the parameters are described, using
a list, in order for it to be properly parsed during documentation
build time.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_region.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index 2dfcc41c0170..b0134bf4b1b7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -22,9 +22,11 @@ struct i915_gem_apply_to_region;
  */
 struct i915_gem_apply_to_region_ops {
 	/**
-	 * process_obj - Process the current object
-	 * @apply: Embed this for private data.
-	 * @obj: The current object.
+	 * @process_obj: Callback function to process the current object
+	 * it requires two arguments:
+	 *
+	 * - @apply: Embed this for private data.
+	 * - @obj: The current object.
 	 *
 	 * Note that if this function is part of a ww transaction, and
 	 * if returns -EDEADLK for one of the objects, it may be
-- 
2.36.1

