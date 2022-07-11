Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A168570B9F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1F090FE3;
	Mon, 11 Jul 2022 20:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45C718A6FC;
 Mon, 11 Jul 2022 20:25:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 656126164A;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94337C341E7;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=Tb3n3/77/mwtYV5OZDyxgvvYQBkjH8JCjYZvi9rWx9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jP7DpuRIJz8Fxss/u3G7CD6q/E50x9Rz5zZWBy4PZfPUdbVTGtI7I6nu54fuePZg7
 C5Dj/LESQVwPxC8mrbcw48R5DL776Sw4mBh2DRvLzdthRaMSyr38VykNWRuCwrMPIX
 z4PpVnqGw6RC5CT2zbyj6CdDsz9LojiLMMncQljnFV+uxHmnIGdHiILTPM6Lvo14V3
 ron1Hp0JcdMLYbtxstgvbjijZnDm4m8e8lwaLJM0Rfdoe+apqPbijrrIvfd3q9W0gg
 Ojh+4pfZPYl27c1yM6NkEwvD52faFE1dg+E7mAAOyrMWwsjfTsPiZDXORXPLV+E2g/
 eOPxAURtlab8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e92-SK;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 27/32] docs: gpu: i915.rst: gt: add more kernel-doc markups
Date: Mon, 11 Jul 2022 21:25:12 +0100
Message-Id: <f72fa9e642123591cf6ef367a3808b30a0951f22.1657565224.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several documented GT kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 43 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 2ad7941a79f2..afd8c0e3c689 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -149,7 +149,6 @@ Misc display functions
 
 .. kernel-doc:: drivers/gpu/drm/i915/display/skl_scaler.c
 
-
 Plane Configuration
 -------------------
 
@@ -308,6 +307,48 @@ Multicast/Replicated (MCR) Registers
 .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_mcr.c
    :internal:
 
+GT engine
+---------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_types.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_cs.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_pm.c
+
+GT context
+----------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_context.h
+
+Graphics Translation Tables
+---------------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_ggtt.c
+
+Other GT functionality
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gsc.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_mocs.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rc6.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_reset.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps_types.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_sseu.c
+
 Memory Management and Command Submission
 ========================================
 
-- 
2.36.1

