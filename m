Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E636768C5
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A540910E3DE;
	Sat, 21 Jan 2023 20:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6450810E3C1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93371B80926;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5796C433A4;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=bqcvMqGcQGtx/kfGm5WwuP+MgMErCW3/wkkJhItCuog=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=m1XMYVqBKuZHLcBsWRn/M/OewJr79zm25+3/y2sQjBBwznUrtBjG5WPGRB2+dRUrU
 y3ZcQ/vgr+nsc6auixXoSDhVrCcZOFgnuHsp/V7AR0i972S70Sa32DfmhvTMuQqrtx
 LARlPJ32W1FCT7ND5lik/6upFiI7hdxlf6ZX/tPql3nH5Lwkka/qc+DtlXnCq3ONSH
 EHp1ff1ghf5ChvA6tD/LPptZ75sAGiKKOHLucY/plsVqwNMkk+8PiWYExSc1WK+T0H
 8oYS1gLzgb8xGpeR+9hxT+UwySjjiBc3jKK/wM/T+8hehqTYhqHF2wc0tFNgBgr3cV
 ZIopaQdRBF3VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B6731C38142;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:06 +0100
Subject: [PATCH 28/86] drm/bridge: chipone: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-28-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=752;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=CCiekg4XlpvboJrXUN+jmDUp6jn6KGxwy1N1Qr9jgDo=; =?utf-8?q?b=3DcoMEfyrw2Guy?=
 =?utf-8?q?PbfR9v5X98/hRZU0cU9tQ1dOSK0i7a/aJYXB2dg8YCkiNLsvF+/rQxsZFRmFAfEi?=
 m9wTl8UGCtrug5gl3+8cIPXKWQ/MPaNLvifGrgajYA/xVK6FQzXA
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
 drivers/gpu/drm/bridge/chipone-icn6211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 0e37840cd7a8..939d8fe68f0e 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_mipi_dsi.h>

-- 
2.34.1

