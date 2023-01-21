Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8406768C8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F1F10E3E8;
	Sat, 21 Jan 2023 20:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D858310E3DC
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B264360B7F;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E9F6C43446;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=6wVm6sy5G0eScDC76q6CxcrxHgtg1k/tPheRqAK75jY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Dfe3csryBQ4TtPindTjrMqFLgMcWGkewx1ArDe34mUO29ytFQJUCqK6i2jMBi1Rz8
 nRbWalYgpKFaTAz8eiSxPZDn7XUYoHtl/RuetyWb8tVf+mrHf/i8wdTvR5MS5ctdoP
 ezyUHMubcf3g6ueK3qH2wQpVT/mvU/z2ZjW+bRG//qD03tytdS2mtj/tZurK96bT+g
 U84FtA8gmfSo4F03pilZjRDpe1gjm4RbvaIvm6O9EY3dXX6zPnWascSpsV36cHywO/
 tZ3Qun8rjW7qPfhdCFUB85/jS9js0Pf7jupEvc/MauOu0uK+Z9oC1su46vtdjCUw0y
 H1XT3MqcnrJTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC20C38142;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:02 +0100
Subject: [PATCH 24/86] drm/ast: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-24-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=1233;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=S/8eZApHhwOboPVsS4KInTBRqQzjs4lsAR0m0loZltw=; =?utf-8?q?b=3DstcGZwS4OocK?=
 =?utf-8?q?oHgN6pA4mOObMxk0DYynQJrSuLAlz1lbDmLKTnjq3lU3iGTo0siimcFDn7EX8ZXw?=
 uGPOfq7lAmNMbhd9fXERM+QpIqgfHlREQJDE8YD6p5a00DlG6ZkC
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
 drivers/gpu/drm/ast/ast_drv.c  | 1 +
 drivers/gpu/drm/ast/ast_mode.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index d78852c7cf5b..1def394fcc6f 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -34,6 +34,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index dcb8ced4ce75..edc61f972c8b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 

-- 
2.34.1

