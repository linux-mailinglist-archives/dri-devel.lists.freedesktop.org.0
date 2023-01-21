Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E826768BA
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB56E10E3E4;
	Sat, 21 Jan 2023 20:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1FE10E3D1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D79C560B72;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8B21C433A8;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=i3ylcIfZsqyyZhBLi25PqQsmMsuW4wiROwCuwaI/mfI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=hAR+V2/pqI2Xs8OF/2IUysCQD3bfYFwRtHHIVcl/UTP38Jr9E0cyNCHuJTzQ9UO7w
 OkpWycCo/eQ6/RLQkLBvJnjCutPHj6w4bUtX1Noi8LeLAHnFAC8lDymaN2rNDoNIS5
 qYPUjeJKvKqvrPkhf+57Q2+H9wHdvHUNsWLoJrB+f+7FdXMDZjy1PPGlktrCy9t5MG
 YRs4vA9ZcmvETcWGGSJ1DoqrwlUQsX+ttFS55nPPmPC/Xu2RdqrrND/HK71VxXgOwG
 4joRDa5nagD1/f3nnQNxgYOBmGqak2PrvxXG4eCKfo6qDu/W85uij4gQaVb8yn2APB
 xT4DOJkhE0/JA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C9414C38142;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:47 +0100
Subject: [PATCH 09/86] drm/scheduler: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-9-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=739;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=/TOkmcXyKyN23yBF4J/kNp3VyZ+tzaXviJl5TstN33U=; =?utf-8?q?b=3Dlr5z0+aAmiRs?=
 =?utf-8?q?T/04gZHT1+PUPvCByL7ZO2QUoGfUSSGyN0KmE6jFnMzs82ctGBtiPaVMku/eNh2W?=
 sfzqFO4VBSIJZd1MtiCOWmQBrGX5VPeSAsLsKnqy9h18KP2kD54X
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
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0e4378420271..964ea10bf68e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -51,6 +51,7 @@
 #include <linux/dma-resv.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm.h>
 #include <drm/drm_print.h>
 #include <drm/drm_gem.h>
 #include <drm/gpu_scheduler.h>

-- 
2.34.1

