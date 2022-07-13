Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0F57304B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C221495633;
	Wed, 13 Jul 2022 08:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C535F9527C;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 939DE61AE3;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE29C36AEA;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=D2LxZ78g6KDBC/CMbWumQNrCFMx8aT2KZzd7m3ganoE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JFmyheZZzvR/p6NXxErVn4aN09V0ju3UJzqi1N0oOHCB4AyRh4XDggRsCGtrkvJIi
 9iG/XJ/uEC0KDoGZjheq/86bH3+LaCidlbLn1U/foMz32pc0qJqGe7dHdMdzbzHIyZ
 0hwJu5epQ/GF2dvrgMPwqGV/urrXj1DoaenWKdVnAefnDmZzioetL1tza91Dekm+Z6
 LUfxfk5OuAMk61zLbBovigzRYLHFjoCHlV749eTbVGhKWCx0qsH4MFzYimOZ8YvF8K
 lTweu9y+3I/TGLwvH5zfqRHUJzd3Ft5hDVivFo8NXQjCduBW+XCBqBW4yJp4gYkJXJ
 HlR0LPX/5fuhg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zuN-VO;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 32/39] docs: gpu: i915.rst: GVT: add more kernel-doc markups
Date: Wed, 13 Jul 2022 09:12:20 +0100
Message-Id: <7711d6d694def4129e9c2d2c8d507e62d8cc1519.1657699522.git.mchehab@kernel.org>
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

There are several documented GVT kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 70f2f4826eba..3ee121a0ea62 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -58,6 +58,47 @@ Intel GVT-g Host Support(vGPU device model)
 .. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
    :internal:
 
+Other Intel GVT-g interfaces
+----------------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/aperture_gm.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/cfg_space.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/debugfs.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/display.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/edid.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/fb_decoder.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/firmware.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/gtt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/handlers.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/interrupt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/kvmgt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/mmio.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/mmio_context.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/opregion.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/page_track.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/scheduler.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
+
 Workarounds
 -----------
 
-- 
2.36.1

