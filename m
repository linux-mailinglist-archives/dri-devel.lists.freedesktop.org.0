Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DB6768AF
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8B10E3DD;
	Sat, 21 Jan 2023 20:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336B110E3CB
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA18B60B5E;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A175DC433A4;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=/qHLCZik4EAAY95osH9i8ciuVdFI3Z+KrAJiuVsZbVI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=RXu/ZMq9MmoyqSVQU6AEdKVlhvILbIxCOLB/9Rxec8KuBUFITTmZmgv6I87B+FLmT
 CQhyhXrNJknjgzxvd5cH79PrH2xworWgdVLF23FQ+qeIhQvi3fqfpkj+78virUEBoP
 ihsGoOGKErg0IyLOA89nfhpzTFuZnywNpe2bDhArwsHeR38tFMKCsQwVGzIoYyDb2k
 3BpFgPc7VhUjocG2MdqMlv6iqvTGSxTB1L30fuKF/2PFML1CUlB80DVmw7N4iPFYlI
 jTdjVwoGlXrQjYEUgHMBuzsTmY6PJPyXnAUQ7dQtNymPsYW+XZCxWC9Dx8EJrR4LMj
 BdpAAgfYMc0+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9153DC38A23;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:44 +0100
Subject: [PATCH 06/86] drm/omapdrm: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-6-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=671;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=Ms4ktIBBzv59Kacn7jiYvIEUkBfNMtzbqvKZMC/lgLY=; =?utf-8?q?b=3DpJYm01pAIVFS?=
 =?utf-8?q?xKwEGKme1EU6068GLZnzfwKkUIM4nOUXX4bWPzrU/n2oNbQ5ozi+EkL1YGTUaQJF?=
 t/PxkdOsD4wQaprdL10z1f4l60Zi+pM4ClJJI01n7VjRkCZdmg6X
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
drm_print.h, because drm_print.h will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/omapdrm/omap_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 1d414b33fee3..449d521c78fe 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/seq_file.h>
 
 #include <drm/drm_blend.h>
 #include <drm/drm_modeset_helper.h>

-- 
2.34.1

