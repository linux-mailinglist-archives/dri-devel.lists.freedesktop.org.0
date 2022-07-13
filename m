Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB45730A7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFF69645D;
	Wed, 13 Jul 2022 08:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03C954F4;
 Wed, 13 Jul 2022 08:12:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AC91B81D75;
 Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43186C341E1;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=fbuGcI6aeIF16Eab+5tuZImNSWo6j8w5k+U1/9xveHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HuAkL/38GAZcc8DVLwIsDfLEIwQNzdtBx+z2GDQAJFbfSU4wjm0FgwEyM4h20ELKD
 m1IZvjOkozaSUq/EtlwAfG3fbL9ZM+Qg+3JspV/o3GRu4+I21//su1tKNO/5+DOX2v
 F1uli5zMSxf4e7iyanZs7dXj7WLtGYQGj5Q1dr0qaBueKnr8wK0vJC+50c1fFf+CzT
 ueGa+GQqzhYXYUmmyt+VNR67CpJ6o0biPuJNqZ9PHk3NyyHiuJ3j7WPgjdTj1MUBCM
 xX5Lt7vx7N0zGnvvoMyB2pg0ynRmYq9wnquRo6bUq7KYI93uvfrpYQbEfg/PYpQaXN
 TjVqlmtWeaiKw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zuB-Sm;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 28/39] drm/i915: i915_deps: use a shorter title markup
Date: Wed, 13 Jul 2022 09:12:16 +0100
Message-Id: <12353a958aa1b280bba3bc6937caa107edf81dee.1657699522.git.mchehab@kernel.org>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DOC: tag waits for a one-line short title for the doc
section. Using multiple lines will produce a weird output.
So, add a shorter description for the title, while keeping
the current content below it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_deps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_deps.c b/drivers/gpu/drm/i915/i915_deps.c
index 297b8e4e42ee..df6af832e3f2 100644
--- a/drivers/gpu/drm/i915/i915_deps.c
+++ b/drivers/gpu/drm/i915/i915_deps.c
@@ -11,7 +11,9 @@
 #include "i915_deps.h"
 
 /**
- * DOC: Set of utilities to dynamically collect dependencies into a
+ * DOC: Utilities to collect dependencies for GT migration code
+ *
+ * Set of utilities to dynamically collect dependencies into a
  * structure which is fed into the GT migration code.
  *
  * Once we can do async unbinding, this is also needed to coalesce
-- 
2.36.1

