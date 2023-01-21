Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95F6768EC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C419310E41E;
	Sat, 21 Jan 2023 20:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9215D10E3EE
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E61BAB80817;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95692C4339E;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=lSfGFwHmzO8bcD7zyypYa2aDpWbX3TNypBmhiPACb2s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=EicZg21iCK3/pikh0XzG2yclXycoH6cpFCDq+ljxGDAEVdvfNwmibt940Ilx9xH6s
 kKyJrKtehvr7PczliLGP5TZeTnJfHnoEVIbwv2QyGCGcQZ07m8Bo2yOvkuVmTWbCEq
 FW5To4W3l9Yyp5vV999nPTU/ZQLrLC0f4dMtyo7h3W1JuiZKwYxLntvvDovV1yrz+V
 bzQ+F1enVLL0iKguo9R0T2AKIwnjSKeBoEseiek1ZxCkdjNr8WLhgkuR4AM/s0R0Bd
 DDn/Ticpxn5fAIRht+lRJBQlQnqXY1eQBluAKcgFkJYHpAuOBvuLc6zPB7NAzYzndz
 dgNBOvb0U2xnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4CEC54737;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:42 +0100
Subject: [PATCH 04/86] drm/msm: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-4-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=774;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=i9y9pDCm2mA3/O720jg1Kgq6M5EgH/ydU59nA2VdrCc=; =?utf-8?q?b=3DRX5TrvOVQZh6?=
 =?utf-8?q?2FgTpTrQP6B1J+/5naEnEvmJSJ1cXht34nwGG3+d4CbgLMRDdW4T2g0SQAzCuBVF?=
 WwrS8h/pB0pSmhIrLC7OpjtFTXws8R77+QRj0wHC9y0GUIYAVyrR
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 691c471b08c2..53e0933ccfcb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/debugfs.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_lm.h"

-- 
2.34.1

