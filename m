Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA25573074
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581E95643;
	Wed, 13 Jul 2022 08:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC17952CD;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9EE261AFA;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E08AC36AFB;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=9vM61Icn6cpMZl0FqNeIaFxyP6yis74ANKS+8wGnBls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TFOMdYvM+pXQWzhSLnxONskvZEAU/TOAuLPpUiEoLejlJYxtFWti1GIYftKe/mfSL
 mKjO2r8l8Ty6TSmU21JJkuvMr5+U2VRWS0CAGZn40sWssFGcQtfVNqRGjGiMH/eu6r
 B1r9BjwQx0nreN06mxWBYznS3iReaVyyCauOz8dFUoz/lk8rMVURTlfzJG1vamTSM+
 NxRPeSMSTsCTKiSWHDqECI0xwAj1R1qnDbPg3gFg8RKbGIaU/x2GUnUiXYDiZauN+m
 2bB+EJrVOiRb4oYY51Ev4QyGZjT/zIwCw+s8iArF6gWvq73x+9H75/wxkGWTq69cXd
 SnOj42OG2jvQw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTy-004zuV-0X;
 Wed, 13 Jul 2022 09:12:30 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 34/39] docs: gpu: i915.rst: GEM/TTM: add more kernel-doc
 markups
Date: Wed, 13 Jul 2022 09:12:22 +0100
Message-Id: <207b2aa899bbe440a61b5fed5f26d9f78bcd38cb.1657699522.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several documented GEM/TTM kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index c32409c03d32..974754586be8 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -615,6 +615,44 @@ Protected Objects
 
 .. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_types.h
 
+Table Manager (TTM)
+-------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+
+Graphics Execution Manager (GEM)
+--------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_create.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_domain.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_internal.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_mman.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_region.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_region.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_wait.c
+
 Microcontrollers
 ================
 
-- 
2.36.1

