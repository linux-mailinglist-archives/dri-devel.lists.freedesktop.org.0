Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55BD6768D8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C7310E3F9;
	Sat, 21 Jan 2023 20:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760D910E3C1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D77FB60B6C;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7270C433AC;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=G0//SMw23Lc0FeANWRF0Vu1/ul+3o8OHf1kNNB0PHes=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=fmta8O1BaV74/F8+EutF+JrwqTx3lQrMhbkI2zqH8gAU/fjxqUO8hrXPjsDeR2M2Z
 AXQnRF3B5g7323MndN/6eeGplWiyNcIhYRxciY29AwwVttvzSvg0m1obpdvxxAZsbK
 xLfn8Dc/oUNzhkeuK/4VzDxQ4c38R07mtaAJIw04R2jnKpNRDIheiEXkptDKDrZenr
 CSHLBnr873ioMoncEvv0hGvmnXV6OVjxMr2a6XGQCYpaAvUcaA4b2xdFL0eQizZz34
 gM3sWgrdNrLzrrXsuxIyF+2YI4z5PxVF5ZLDAEqZOSLg3giNdnYnDvRr/gekGrmrUp
 O7uzU4PfcDorg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D5326C38A23;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:48 +0100
Subject: [PATCH 10/86] drm/armada: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-10-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=711;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=tMfNODGxSmxfn66asPob14EUR0XbvSYv1NeJXsiG3F0=; =?utf-8?q?b=3Dqzbc0bBWc1xQ?=
 =?utf-8?q?WuEhPSX1cU1IJWi1EM9GF17J+rBEdPGJyTJZIR0fmTw0hOP9arzYTyyZX48rFeIG?=
 ZyfsK+ZXBrLZZBxeDBMGWJYFfiVLSOX9aAHsXfLGx2gAUroBZC7O
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
 drivers/gpu/drm/armada/armada_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index 29f4b52e3c8d..a763349dd89f 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>

-- 
2.34.1

