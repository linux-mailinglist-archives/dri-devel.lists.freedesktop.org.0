Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416F46768E6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690E210E414;
	Sat, 21 Jan 2023 20:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2776F10E3CB
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0399760BB8;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9E9AC4339C;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=PfzqOzGvLSjz1yVcypr4ZMv6zUPkHDglf61icC32C7k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=rSI/ejywLsGyshewYEqU8q8j67ITmWwt0rmhdhw1wJZuBY4i2w5NDKHYFTpxIRzpC
 AzbRxlWuzA+t4s1xC3cS0GtgZNF+3+RpYqSoFWXX1Rls4J9fybYcPQP2jt7jz8C+Ym
 JQIYbRWFJyk5Hcq7rwv6/NFkas+oFbF4RP4j6BomCk1L5vjo+VvCY3UG6pjljmNtvW
 N0myqX4BwIGzH1zrfEbFp4mBm9AmVVNEpJ3D0F6QtCKyviTcJSLeOlOmYM672BNBmk
 +beI99QBOhP3y6MCuVutZ7OCtbgX+Namyj99vjJb51G5VbygIRO12KhrweyBkeFHYK
 UtON0bgMIXA/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BB6B3C54EAA;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:55 +0100
Subject: [PATCH 77/86] drm/udl: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-77-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=1206;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=HiE/J7oUbyK1QkiuS7qEJKj30cBz2O5XG4XOn5Xyvcg=; =?utf-8?q?b=3DUQEMUIT2jQUf?=
 =?utf-8?q?x2EVG6Etfu4b/zdsMRWfVvOr542wg7tyQ7wB2Cwu9qd6Q4Nayv9dxhFr+qROS053?=
 vo2n0BMQBCQuwp1F1iLomVP2rb5eIuvEdAksqXmGhjyNjvPJ7elf
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_atomic_helper, because drm_atomic_helper will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/udl/udl_drv.c     | 1 +
 drivers/gpu/drm/udl/udl_modeset.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1506094a8009..e0e5dcbd18e0 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -12,6 +12,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_print.h>
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index aa02fd2789c3..b613c4f461e2 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>

-- 
2.34.1

