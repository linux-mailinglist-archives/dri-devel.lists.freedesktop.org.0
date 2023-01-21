Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB26768DF
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E70110E40E;
	Sat, 21 Jan 2023 20:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CAD10E3FD
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6AF15B807E9;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B0E9C433A0;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=zmDZmTzA9Z6Xbm4uN2FCTkJteXDSu0qVQd3goq25F5A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=m77TnUqjetFV+9TdHyD/TOfTZzzuQMCVqbL9ZdNLprCkGqIgrFPdPDpYbcaGaziEP
 TRAHSdwUW/lnly1qbhmwD2v1iX7MZUfzybS3VLD5CGRjFcs4syghucnXZhS1QdXUfF
 GFDr1gvqPjzJtFQ2A8bDxMduLMI3JOHLGki3cRuU+vsP6bgKFjyXKyvGhsXHtp9j2y
 BSfkPzrcuVhBGUajUGM8mE8hQW1y5zFrHXBrgUjSYnaJT20ZupBMmu9lQPJQKfmoBM
 jhD9+51tA6CdpQZlC1g5Y72tpzvIHlZERfKrNUx78KIAdzsg2UexsNVgcMrlHwnJt3
 jJw+aJ20cUZmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 879A1C5320B;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:43 +0100
Subject: [PATCH 05/86] drm/nouveau: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-5-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=745;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=31Zd4WVX9Z0b32QhSleAn0woF7FYd6Wz4CKp3dvWOks=; =?utf-8?q?b=3DspaFCWHPQgep?=
 =?utf-8?q?4YZxQ4PMz8WVYafBq5ViM+m9larnG5Irl2TPk1cFo3ezTBZGHQswKHXFY6PqgS44?=
 SRUfIU00DMxs3JrCb7ILaaA6UDaoxi/l6KMU0BOFYi9eUAO3DkcA
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
 drivers/gpu/drm/nouveau/dispnv50/crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 9c942fbd836d..5936b6b3b15d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: MIT
+#include <linux/debugfs.h>
 #include <linux/string.h>
+
 #include <drm/drm_crtc.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_vblank.h>

-- 
2.34.1

