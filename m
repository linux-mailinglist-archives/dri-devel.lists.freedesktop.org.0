Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9665B3008
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8DE10EBFB;
	Fri,  9 Sep 2022 07:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E1C10EBEE;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92C2261EE8;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCA1C43149;
 Fri,  9 Sep 2022 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708894;
 bh=jQl58GjfNBu0f/gXOHTX8VoSkcp6l0MUV948MF+ogsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ks/CD4x7yrJuVcANT2t3Af82tH0XCLCqaYE9cAIsy/IZTNWgX+Ze6eY72naIBT9BD
 tv1cxlOhIbMBGkdQ55yTbf+BVRGqRkiNvw+mHvlTZtucJWvoFQfgX1OOyq6X8bQPf4
 VkYEw2ip1Qf3XYtO1yv5eeROPuU7bsaNjRusm7SAhCcBu4IG3PlXWnDKxIAgFQyRaZ
 5IldPDV81jcEaMwyw4+kb+Cy9eEcHGDwZNQ/xn4rgox6NDM64HhHqHzmuDy9GyIfq6
 PcO/2k0MIh90mLGjr+NyOv+LpfEd8FrZES5tZKD25UQSEP6XtVzfz7zl1ZUpa9bYBF
 PMezXrEc0hCNQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXF-007FG3-Sn;
 Fri, 09 Sep 2022 09:34:45 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 07/37] drm/i915: i915_gem_ttm: fix a kernel-doc markup
Date: Fri,  9 Sep 2022 09:34:14 +0200
Message-Id: <79c409fa6840fefd39dc057dc558c69807c65b3f.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two new fields were added to __i915_gem_ttm_object_init() without
their corresponding documentation.

Document them.

Fixes: 9b78b5dade2d ("drm/i915: add i915_gem_object_create_region_at()")
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index f64a3deb12fc..f5fb06d74f13 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1148,7 +1148,9 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
  * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
  * @mem: The initial memory region for the object.
  * @obj: The gem object.
+ * @offset: The range start.
  * @size: Object size in bytes.
+ * @page_size: The requested page size in bytes for this object.
  * @flags: gem object flags.
  *
  * Return: 0 on success, negative error code on failure.
-- 
2.37.3

